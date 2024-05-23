#!/usr/bin/env bash

############################
#  Maiste <dev@maiste.fr>  #
# Languages install script #
#    Version 20210325      #
############################

cd "$(dirname $0)/.."
. "./scripts/logger.sh"

print_header "Languages configuration"
print_root


JAVA_VERSION="22-open"

#-------------- Languages ------------#

print_section "languages"

function get_language () {
  print_task "install $1"
  which $2 > /dev/null
  if [[ $? -eq 1 ]] ; then
    get_$1
  else
      skip_already_installed "$1"
  fi
}

function get_jvm () {
  print_task "install sdkman"
  . "$HOME/.sdkman/bin/sdkman-init.sh"  2>&1 >/dev/null || true
  which "sdk" > /dev/null
  if [[ $? -eq 1 ]] ; then
    printf "  - Exit: sdk not found\n"
    which "curl" > /dev/null
    if [[ $? -eq 1 ]] ; then
        error_not_found "curl"
        exit 1
    else
        print_info "installing sdkman"
        curl -s "https://get.sdkman.io" | bash
        . "$HOME/.sdkman/bin/sdkman-init.sh"
        print_info "sdkman installed"
    fi
  else
      skip_already_installed "sdkman"
  fi
}

function get_node () {
  which curl > /dev/null
  if [[ $? -eq 1 ]] ; then
    error_not_found "curl"
    exit 1
  else
    print_info "install nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  fi
  print_info "install npm lts"
  nvm install --lts
  print_info "install neovim node"
  npm install -g neovim
  print_succes "node & neovim node installed"
}

function get_deno() {
  which curl > /dev/null
  if [[ $? -eq 1 ]] ; then
    error_not_found "curl"
    exit 1
  else
    print_info "install deno"
    curl -fsSL https://deno.land/install.sh | sh
    print_success "deno installed"
  fi
}

function get_java () {
  print_info "installing java with sdkman"
  sdk install java "$JAVA_VERSION"
  print_success "java installed"
}

function get_scala () {
  print_info "installing scala with sdkman"
  sdk install scala
  print_info "installing sbt with sdkman"
  sdk install sbt
  print_success "scala & sbt installed"
}

function get_koltin () {
  print_info "installing kotlin with sdkman"
  sdk install kotlin
  print_success "kotlin installed"
}

function get_rust () {
  which curl > /dev/null
  if [[ $? -eq 1 ]] ; then
    error_not_found "curl"
    exit 1
  else
    print_info "installing rustup"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    . "$HOME/.cargo/env"
    rustup update
    print_info "installing rust toolchain"
    rustup component add rls rustc cargo rustfmt rust-analyzer
    print_success "rust installed"
  fi
}

function get_ocaml () {
  which curl > /dev/null
  if [[ $? -eq 1 ]] ; then
    error_not_found "curl"
    exit 1
  else
    print_info "installing opam"
    sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)
    print_info "init opam"
    opam init
    print_info "update opam"
    opam update -y
    print_info "install ocaml packages on default switch"
    opam install -y dune ocaml-lsp-server ocamlformat
    print_success "ocaml installed"
  fi
}

get_language "node" "npm"
get_language "deno" "deno"

get_jvm
get_language "java" "javac"
get_language "scala" "scalac"
get_language "kotlin" "kotlin"

get_language "rust"  "rustup"
get_language "ocaml" "opam"



#-------------- Editors ------------#

print_section "editors"
print_task "install neovim plugins"
nvim -c "Lazy | q | q"
