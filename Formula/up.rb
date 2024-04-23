class Up < Formula
    desc "Jump up multiple directories"
    homepage "https://github.com/tedbauer/up" 
    url "https://github.com/tedbauer/up/" # Replace with release tag URL
    version "0.1.0"
  
    def install
      puts Dir.pwd
      cd "up-path-gen" do
        system "cargo", "build", "--release"
        lib.install "target/release/up-path-gen"
      end
  
      lib.install "up.sh"
    end
    def caveats; <<~EOS
    To use the 'up' command, add the following alias to your shell configuration:
      alias up='. /usr/local/lib/up.sh'
    EOS
    end
end
