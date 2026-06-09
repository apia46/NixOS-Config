if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <commit-message>"
    exit 1
fi
cd ~/System
git add -A
git commit -am "$1"
sudo nixos-rebuild switch --flake .