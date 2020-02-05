#! /bin/bash

clear
printf "Hello, $USER.\n"
printf "Today's date is `date`, this is week `date +"%V"`.\n\n"

# if grep $USER /etc/passwd; then
#    echo "The user of $USER is managed locally";
#    echo
# fi
# if [ "$(whoami)" != 'root' ]; then
#    echo "$USER have no permission as a root user."
#    echo
# fi
# printf "These users are currently connected:\n"
# w | cut -d " " -f 1 - | grep -v USER | sort -u
# printf "\n"
# printf "This is the uptime information:\n"
# uptime
# printf "\n"
# screen_color=black
# text_color=green

# Cache the output of uname so we don't have to spawn it multiple times.
trim() {
    # When a string is passed to 'echo' all trailing and leading
    # whitespace is removed and inside the string multiple spaces are
    # condensed into single spaces.
    #
    # The 'set -f/+f' is here so that 'echo' doesn't cause any expansion
    # of special characters.
    #
    # The whitespace trim doesn't work with multiline strings so we use
    # '${1//[[:space:]]/ }' to remove newlines beofre we trim the whitespace.

    set -f
    builtin echo -E ${1//[[:space:]]/ }
    set +f
}

uname=($(uname -srm))

kernel_name="${uname[0]}"
kernel_version="${uname[1]}"
machine_arch="${uname[2]}"

case "$kernel_name" in
        "Linux")   os="Linux" ;;
        "Darwin")  os="$(sw_vers -productName)" ;;
        *"BSD" | "DragonFly" | "Bitrig") os="BSD" ;;
        "CYGWIN"*) os="Windows" ;;
        "SunOS") os="Solaris" ;;
        "Haiku") os="Haiku" ;;
        "GNU"*) os="GNU" ;;
        *) os="Unknown";;
esac

printf "Kernal: $kernel_name $kernel_version\n"

case "$os" in
        "Linux" | "GNU")
            if [[ "$(< /proc/version)" =~ "Microsoft" || "$(< /proc/sys/kernel/osrelease)" =~ "Microsoft" ]]; then
                distro="$(lsb_release -sir) [Windows 10]"

            elif [[ -f "/etc/GoboLinuxVersion" ]]; then
                distro="GoboLinux"

            elif [[ -f "/etc/redstar-release" ]]; then
                distro="Red Star OS"

            elif type -p lsb_release >/dev/null; then
                lsb_flags="-sir"
                distro="$(lsb_release $lsb_flags)"

            elif type -p guix >/dev/null; then
                distro="GuixSD"

            elif type -p crux >/dev/null; then
                distro="${distro//version}"

            elif [[ -d "/system/app/" && -d "/system/priv-app" ]]; then
                distro="Android $(getprop ro.build.version.release)"

            else
                # Source the os-release file
                for file in /etc/os-release /usr/lib/os-release /etc/*release /usr/lib/*release; do
                    source "$file" && break
                done

                # Format the distro name.
                distro="${NAME:-${DISTRIB_ID}} ${VERSION_ID:-${DISTRIB_RELEASE}}"

                # Workarounds for distros that go against the os-release standard.
                [[ -z "${distro// }" ]] && distro="$(awk '/BLAG/ {print $1; exit}' /etc/*ease /usr/lib/*ease)"
                [[ -z "${distro// }" ]] && distro="$(awk -F'=' '{print $2; exit}' /etc/*ease /usr/lib/*ease)"
            fi
        ;;

        "Mac OS X")
            osx_version="$(sw_vers -productVersion)"
            osx_build="$(sw_vers -buildVersion)"

            case "$osx_version" in
                "10.4"*) codename="Mac OS X Tiger" ;;
                "10.5"*) codename="Mac OS X Leopard" ;;
                "10.6"*) codename="Mac OS X Snow Leopard" ;;
                "10.7"*) codename="Mac OS X Lion" ;;
                "10.8"*) codename="OS X Mountain Lion" ;;
                "10.9"*) codename="OS X Mavericks" ;;
                "10.10"*) codename="OS X Yosemite" ;;
                "10.11"*) codename="OS X El Capitan" ;;
                "10.12"*) codename="macOS Sierra" ;;
                *) codename="macOS" ;;
            esac
            distro="$codename $osx_version $osx_build"

            distro="${distro/ ${osx_build}}"
            case "$osx_version" in
                        "10."[4-7]*) distro="${distro/${codename}/Mac OS X}" ;;
                        "10."[8-9]* | "10.1"[0-1]*) distro="${distro/${codename}/OS X}" ;;
                        "10.12"*) distro="${distro/${codename}/macOS}" ;;
            esac
            distro="${distro/ ${osx_build}}"
        ;;

        "BSD")
            distro="$kernel_name"

            distro="${distro/DragonFly/DragonFlyBSD}"

            # Workarounds for FreeBSD based distros.
            [[ -f "/etc/pcbsd-lang" ]] && distro="PCBSD"
            [[ -f "/etc/pacbsd-release" ]] && distro="PacBSD"
        ;;

        "Windows")
            distro="$(wmic os get Caption /value)"

            # Strip crap from the output of wmic
            distro="${distro/Caption'='}"
            distro="${distro/Microsoft }"
        ;;

        "Solaris")
            distro="$(awk 'NR==1{print $1 " " $3;}' /etc/release)"
            distro="${distro/\(*}"
        ;;

        "Haiku")
            distro="$(uname -sv | awk '{print $1 " " $2}')"
        ;;
esac

[[ -z "$distro" ]] && distro="$os (Unknown)"

# Get architecture
distro+=" ${machine_arch}"

printf "OS: $(trim "$distro")\n"

shell="$SHELL"
case "${SHELL##*/}" in
            "bash")
                shell+=" ${BASH_VERSION/-*}"
            ;;

            "zsh")
                shell+="$(zsh --version)"
                shell="${shell/ zsh}"
            ;;

            "mksh" | "ksh")
                shell+="$("$SHELL" -c 'printf "%s" "$KSH_VERSION"')"
                shell="${shell/ * KSH}"
            ;;

            "tcsh" | "csh")
                shell+="$("$SHELL" --version)"
                shell="${shell/tcsh}"
                shell="${shell/\(*}"
            ;;

            "fish")
                shell+="$(fish -c 'printf "%s" "$FISH_VERSION"')"
            ;;
esac

printf "Shell: $shell\n"
echo
printf "$(cat /proc/meminfo | grep "MemTotal:")"
echo
printf "$(cat /proc/meminfo | grep "SwapTotal:")"
echo
echo
printf "$(lscpu -y | grep "Architecture:")"
echo
printf "$(lscpu -y | grep "Virtualization:")"
echo
printf "$(lscpu -y | grep "CPU(s):")"
echo
printf "$(lscpu -y | grep "Thread(s) per core:")"
echo
printf "$(lscpu -y | grep "Core(s) per socket:")"
echo
printf "$(lscpu -y | grep "CPU MHz:")"
echo
printf "$(lscpu -y | grep "CPU max MHz:")"
echo
printf "$(lscpu -y | grep "Vendor ID:")"
echo
printf "$(lscpu -y | grep "Model name:")"
echo
printf "$(lscpu -y | grep "Hypervisor vendor:")"
echo
echo
