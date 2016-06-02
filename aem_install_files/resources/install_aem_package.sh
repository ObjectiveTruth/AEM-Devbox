#! /bin/sh
# Simple script to check if a package exists and if not, installs it to AEM
# Uses the filename to search for the package name unless -s option is declared
# Will always ensure the server is up before attempting to install

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

# Check to make sure the server is up and ready for accepting uploads
retry_counter=0 
retry_attempts=3;

until [ $retry_counter -ge ${retry_attempts} ]
do
    if [[ $(curl ${aem_url} -L -s -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:46.0) Gecko/20100101 Firefox/46.0") == *"Sign In"* ]];
        then
            echo "AEM Server ${aem_url} is ready, attempting to install...";
            break;
        else
            echo "AEM Server ${aem_url} isn't ready, retrying in 10 seconds...";
    fi
    retry_counter=$[$retry_counter+1]

    if [[ ${retry_counter} -ge ${retry_attempts} ]];
        then
            echo "AEM Server ${aem_url} wasn't ready after ${retry_counter} retries attempts. This is fatal";
        exit 1;
    fi
    sleep 10
done

if [[ $(curl --fail -sS -u admin:admin ${aem_url}/crx/packmgr/service.jsp?cmd=ls) != *${package_file_search}* ]]; 
    then 
        set -e # Turn on failing if a command returns non-zero exit code
        curl --fail -sS -u admin:admin -F file=@"${package_file}" -F force=true -F install=true ${aem_url}/crx/packmgr/service.jsp 
    else
        echo "Package already installed: ${package_file}";
fi

