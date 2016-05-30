#! /bin/sh
# Simple script to check if a package exists and if not, installs it to AEM
# Uses the filename to search for the package name unless -s option is declared

usage() { echo "Usage: $0 [-f <aem_package_to_install>] [-u <aem_url>] [-s <aem_package_to_search_for_instead_of_filename(optional)>]" 1>&2; exit 1; }

OPTIND=1         # Reset in case getopts has been used previously in the shell.
package_file=""
aem_url=""
package_file_search=""

while getopts ":f:u:s:" o; do
    case "${o}" in
        f)
            package_file=${OPTARG}
            ;;
        u)
            aem_url=${OPTARG}
            ;;
        s)
            package_file_search=${OPTARG}
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

# If -s option isn't specified, use package filename
if [ -z "${package_file_search}" ]; then
    package_file_search=$(basename "${package_file}")
fi

# Sanity checks done, now the real work...

if [[ $(curl --fail -sS -u admin:admin ${aem_url}/crx/packmgr/service.jsp?cmd=ls) != *${package_file_search}* ]]; 
    then 
        set -e # Turn on failing if a command returns non-zero exit code
        curl --fail -sS -u admin:admin -F file=@"${package_file}" -F force=true -F install=true ${aem_url}/crx/packmgr/service.jsp 
    else
        echo "Package already installed: ${package_file}";
fi

