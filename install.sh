cd up-path-gen
cargo build --release
sudo mv target/release/up-path-gen /usr/local/lib/up-path-gen
chmod +x /usr/local/lib/up-path-gen

cd ..
sudo cp up.sh /usr/local/lib/up
sudo chmod +x /usr/local/lib/up
