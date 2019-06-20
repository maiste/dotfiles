#!/usr/bin/env python3

##############
# Install.py #
#   Maiste   # 
##############


##########
# IMPORT #
##########

import subprocess   # Manage shell cmd
import os           # Manage os action ex:linking
import json         # Manage json file
import sys          # Manage sys exit
import re           # Find regex



#########
# PRINT #
#########

# Display header when launching script
def display_header(my_os):
    print("********************************")
    print("*      OS Config by Kolibs     *")
    print("********************************")
    print("\n|- Load config for : {}\n".format(my_os))



##########
# SYSTEM #
##########

# Check OS
def load_os():
    release = subprocess.check_output('cat /etc/os-release', shell=True).decode()
    os_line = release.split('\n')
    for line in os_line:
        m = re.fullmatch(r'id=(.*)', line.lower())
        if(m):
            return m.group(1).lower()
    return None

# Load sys intel
def load_intel(my_os):
    config_sys = "os/{}.json".format(my_os)
    config_dot = "os/dot.json"
    sys_info = ""
    dot_info = ""
    with open(config_sys, 'r') as f:
        sys_info = json.loads(f.read())
    with open(config_dot, 'r') as f:
        dot_info = json.loads(f.read())
    return sys_info, dot_info

# Launch process
def launch(cmd):
    try:
        output = subprocess.check_output(cmd, shell=True).decode()
        print(output)
    except OSError:
        return 1
    except subprocess.CalledProcessError:
        return 1
    return 0

############
# PACKAGES #
############

# Import Repo or copr
def repositories(sys_info, root):
    sudo = "" if root else "sudo"
    print("[Repositories] ")
    if sys_info['repositories'] == []:
        print("|- No repo")
        return
    print("|- Execution : ")
    for repo in sys_info["repositories"]:
        if(launch("{0} {1}".format(sudo,repo))):
            print(" |- ERROR : {}".format(repo))
            return 1
    update_repo(sys_info, root)



# Update repositories
def update_repo(sys_info, root):
    sudo = "" if root else "sudo"
    print("|- Update :")
    rc = launch("{0} {1}".format(sudo, sys_info['manager']['update']))
    return rc


# Upgrade packages
def upgrade_package(sys_info, root):
    sudo = "" if root else "sudo"
    print("\n|- Upgrade :")
    rc = launch("{0} {1}".format(sudo,sys_info['manager']['update']))
    return rc


# Create package list
def package_list(sys_info, root):
    sudo = "" if root else "sudo"
    print("|- List :")
    pkg_list = sudo + sys_info['manager']['install']
    for pkg in sys_info['packages']:
        pkg_list += "  " + pkg
        print("  |- {}".format(pkg))
    return pkg_list


# Install package
def install_packages(sys_info, root):
    print(" \n[Packages]")
    pkg_list = package_list(sys_info, root)
    print("|- Execution :")
    rc = launch(pkg_list)
    return rc



############
# DOTFILES #
############


# Remove old dotfiles
def remove_dot(dot_info):
    print("\n[Remove old dot]")
    for file_nexp in dot_info['link'].values():
        file = os.path.expanduser(file_nexp)
        print("|- Delete {}".format(file))
        if(launch("rm -rf {}".format(file))):
            return  1
    return 0

# Create tree struct
def create_struct(dot_info):
    print("\n[Structure]")
    for dr_not_exp in dot_info['dir']:
        dr = os.path.expanduser(dr_not_exp)
        print("|- Create {}".format(dr))
        if(os.makedirs(dr, exist_ok=True)):
            return 1
    return 0

# Install oh-my-zsh
def install_oh_my_zsh():
    print("\n[Oh-my-zsh]")
    if(launch('sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"')):
        return 1
    return 0

# Links
def links(dot_info):
    print("\n[Linking]")
    for key_nexp, value_nexp in dot_info['link'].items():
        key = os.path.expanduser(key_nexp)
        value = os.path.expanduser(value_nexp)
        print("|- Link {0} with {1}".format(value, key))
        if(launch("ln -sf {0} {1}".format(key,value))):
           return 1
    return 0

# Copy
def copy(dot_info, root):
    sudo = "" if root else "sudo"
    print("[Copy]")
    for key_nexp, value_nexp in dot_info['cp'].items():
        key = os.path.expanduser(key_nexp)
        value = os.path.expanduser(value_nexp)
        if(launch("{0} cp -rf {1} {2}".format(sudo, key,value))):
            return 1
    return 0



#############
# EXECUTION #
#############

# Execute init commands
def start_cmd(sys_info, root):
    sudo = "" if root else "sudo"
    print("[Init commands]")
    for cmd in sys_info['start_cmd']:
        print("|- Launching : ")
        if(launch("{0} {1}".format(sudo,cmd))):
            return 1
    return 0

# Main program
def exec_main(root):
    my_os = load_os()
    if my_os == None:
        sys.exit(1);
    sys_info, dot_info = load_intel(my_os)
    display_header(my_os)
    if repositories(sys_info, root):
        sys.exit(1)
    elif install_packages(sys_info, root):
        sys.exit(1)
    elif upgrade_package(sys_info, root):
        sys.exit(1)
    elif remove_dot(dot_info):
        sys.exit(1)
    elif create_struct(dot_info):
        sys.exit(1)
    elif install_oh_my_zsh():
        sys.exit(1)
    elif links(dot_info):
        sys.exit(1)
    copy(dot_info, root)
    start_cmd(sys_info, root)
    print("\n\n|- Install complete")
    sys.exit(0)


########
# MAIN #
########

if __name__ == '__main__':
    exec_main(True)
