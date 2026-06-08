if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <commit-message>"
    exit 1
fi
git stage *
git commit -m "$1"
sudo nixos-rebuild switch --flake .