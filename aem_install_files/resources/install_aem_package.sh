#! /bin/sh
# Simple script to check if a package exists and if not, installs it to AEM

usage() { echo "Usage: $0 [-f <aem_package_to_install>] [-u <aem_url>]" 1>&2; exit 1; }

OPTIND=1         # Reset in case getopts has been used previously in the shell.
package_file=""
aem_url=""

while getopts ":f:u:" o; do
    case "${o}" in
        f)
            package_file=${OPTARG}
            ;;
        u)
            aem_url=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${package_file}" ] || [ -z "${aem_url}" ]; then
    usage
fi

# Sanity checks done...

if [[ $(curl --fail -sS -u admin:admin ${aem_url}/crx/packmgr/service.jsp?cmd=ls) != *$(basename "${package_file}")* ]]; 
    then 
        set -e # Turn on failing if a command returns non-zero exit code
        curl --fail -sS -u admin:admin -F file=@"${package_file}" -F force=true -F install=true ${aem_url}/crx/packmgr/service.jsp 
    else
        echo "Package already installed: ${package_file}";
fi

