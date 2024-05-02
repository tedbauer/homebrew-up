class Up < Formula
    desc "Jump up multiple directories"
    homepage "https://github.com/tedbauer/up" 
    url "https://github.com/tedbauer/up/"
    version "0.1.0"
  
    def install
      # Check for CARGO_HOME environment variable
      cargo_path = ENV["CARGO_HOME"] ? "#{ENV["CARGO_HOME"]}/bin/cargo" : nil

        # Fallback: Check for Homebrew-managed Cargo (if applicable)
      unless cargo_path
        cargo_path = "#{HOMEBREW_PREFIX}/opt/rust/bin/cargo" if OS.mac?
      end

      potential_cargo_paths = [
        "/home/#{ENV['USER']}/.cargo/bin", # Common user-level installation 
        "#{HOMEBREW_PREFIX}/opt/rust/bin",  # Possible Homebrew Rust location
        "/Users/#{ENV['USER']}/.cargo/bin" # Common installation on OSX
      ]

      cargo_path = potential_cargo_paths.find { |path| File.exist? "#{path}/cargo" }
      unless cargo_path
        odie <<~EOS 
          Cargo (the Rust package manager) is required to install 'up'.
          Please install Rust from: https://www.rust-lang.org/tools/install
          Make sure it is installed for the current user.
        EOS
      end

      ENV["PATH"] = "#{cargo_path}:#{ENV['PATH']}"

      tmp_dir_path = Pathname.new("/private/tmp")
      sub_dir_name = "up-build"
      build_dir = tmp_dir_path.join(sub_dir_name)

      formula_path = Pathname.new(__FILE__).expand_path
      up_path_gen_dir = formula_path.dirname.join("up-path-gen")
      cd up_path_gen_dir do
        system "rustup", "override", "set", "stable"
        ENV["CARGO_TARGET_DIR"] = build_dir
        system "cargo", "build", "--release"
        lib.install build_dir/"release/up-path-gen"
      end

      ENV["BINARY_PATH"] = "#{lib}/up-path-gen"
    end

    def caveats; <<~EOS
    To use the 'up' command, source this script in your shell profile:
      export BINARY_PATH=$(brew --prefix)/lib/up-path-gen && source #{buildpath}/up.sh
    EOS
    end

end
