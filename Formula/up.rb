class Up < Formula
    desc "Jump up multiple directories"
    homepage "https://github.com/tedbauer/up" 
    url "https://github.com/tedbauer/up/"
    version "0.1.0"
  
    def install
      formula_path = Pathname.new(__FILE__).expand_path
      up_path_gen_dir = formula_path.dirname.join("up-path-gen")
      cd up_path_gen_dir do
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
