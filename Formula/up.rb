class Up < Formula
    desc "Jump up multiple directories"
    homepage "https://github.com/tedbauer/up" 
    url "https://github.com/tedbauer/up/"
    version "0.1.0"
  
    def install
      potential_cargo_paths = [
        "/home/#{ENV['USER']}/.cargo/bin", # Common user-level installation 
        "#{HOMEBREW_PREFIX}/opt/rust/bin"  # Possible Homebrew Rust location
      ]

      cargo_path = potential_cargo_paths.find { |path| File.exist? "#{path}/cargo" }        
      unless cargo_path
        odie <<~EOS 
          Cargo (the Rust package manager) is required to install 'up'.
          Please install Rust from: https://www.rust-lang.org/tools/install
        EOS
      end

      ENV["PATH"] = "#{cargo_path}:#{ENV['PATH']}"  

      formula_path = Pathname.new(__FILE__).expand_path
      up_path_gen_dir = formula_path.dirname.join("up-path-gen")
      cd up_path_gen_dir do
        system "rustup", "override", "set", "stable"
        system "cargo", "build", "--release"
        lib.install "target/release/up-path-gen"
      end

      cd formula_path.dirname do
        lib.install "up.sh"
      end
    end
    
    def caveats; <<~EOS
    To use the 'up' command, add the following alias to your shell configuration:
      alias up='. /usr/local/lib/up.sh'
    EOS
    end

def post_install
    puts "Linking files..." # Add a message
    Dir.glob("#{lib}/**/*").each do |file|
      puts "Linking: #{file}" # See what's being linked
      ln_sf file, "/usr/local/lib/#{File.basename(file)}"
    end
end
end
