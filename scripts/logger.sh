#!/usr/bin/env bash

###########################
# Maiste <dev@maiste.fr>  #
#   Logs helper script    #
#    Version 20240522     #
###########################

function print_header() {
    local LENGTH=$((${#1} + 8))
    printf "\n\n\n\e[1;34m\t+"
    for i in $(seq 1 $LENGTH) ; do
        printf "\055"
    done
    printf "+\n\t|    $1    |\n\t+"
    for i in $(seq 1 $LENGTH) ; do
        printf "\055"
    done
    printf "+\e[0m\n\n"
}

function print_section() {
    printf "\n\n\e[1;34m# ---- {%s} ---- #\e[0m\n" "$1"
}

function print_success() {
    printf "\e[1;32m[SUCCESS]:\e[0m %s\n" "$1"
}

function print_error() {
    printf "\e[1;31m[ERROR]:\e[0m %s\n" "$1"
}

function print_warning() {
    printf "\e[1;33m[WARNING]:\e[0m %s\n" "$1"
}

function print_skip() {
    printf "\e[1;35m[SKIP]:\e[0m %s\n" "$1"
}

function print_info () {
    printf "\e[1;34m[INFO]:\e[0m %s\n" "$1"
}

function print_task () {
    printf "\n\e[1;34m\055\055> TASK:\e[0m %s\n" "$1"
}

function print_root () {
    printf "\e[1;35mROOT DIRECTORY:\e[0m %s\n" $PWD
}

function error_not_found () {
    print_error "$1 not found"
}

function warning_not_found () {
    print_warning "$1 not found"
}

function skip_already_installed () {
    print_skip "$1 already installed"
}

