pull_version=${VERSION:-$(curl -s https://api.github.com/repos/salahzsh/twenty/releases | grep '"name":' | head -n 1 | cut -d '"' -f 4)}
pull_version=v0.0.0-test
pull_version=latest

if [[ -z "$pull_version" ]]; then
  echo "Error: Unable to fetch the latest version tag. Please check your network connection or the GitHub API response."
  exit 1
fi
pull_branch=${BRANCH:-$pull_version}
pull_branch=main

curl -sL "https://raw.githubusercontent.com/salahzsh/twenty/$pull_branch/packages/twenty-docker/scripts/install.sh" -o twenty_install.sh

chmod +x twenty_install.sh
VERSION="$VERSION" BRANCH="$BRANCH" ./twenty_install.sh

rm twenty_install.sh
