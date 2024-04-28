cargo build --release
sudo cp target/release/up-path-gen /usr/local/lib/up-path-gen

echo "Installed binary. To finish installation, run:
  export BINARY_PATH=\"target/release/up-path-gen\" && source ../up.sh"