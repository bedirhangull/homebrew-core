class Hexcraft < Formula
    desc "A CLI tool for generating hexagonal architecture for microservices in Go"
    homepage "https://github.com/bedirhangull/hexcraft"
    version "4.0.0"
    license "MIT"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/bedirhangull/hexcraft/releases/download/v4.0.0/hexcraft_Darwin_x86_64.tar.gz"
        sha256 "bf5bb9244827a872c8a559bdb57ba92636c41ec58d2f62bce5812a4c17953063"
      else
        url "https://github.com/bedirhangull/hexcraft/releases/download/v4.0.0/hexcraft_Darwin_arm64.tar.gz"
        sha256 "7b13f82b99b3aedbfe8463aace208bcd502fb8090fb60fc76fbc27a031c956c5"
      end
    end
  
    on_linux do
      if Hardware::CPU.intel?
        url "https://github.com/bedirhangull/hexcraft/releases/download/v4.0.0/hexcraft_Linux_x86_64.tar.gz"
        sha256 "ddc2d62f904f0283856f56ef2893c1d409341aa71acc6c9359d8994613d21769"
      elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/bedirhangull/hexcraft/releases/download/v4.0.0/hexcraft_Linux_arm64.tar.gz"
        sha256 "633bda2d749c8c806c900ea6a6c0dd77c26886497fff945e6318bd750b11e6df"
      else
        url "https://github.com/bedirhangull/hexcraft/releases/download/v4.0.0/hexcraft_Linux_i386.tar.gz"
        sha256 "8e9dad85be4a70fe7e03038972efb0a3b9e733f163990f715e840f7392472c83"
      end
    end
  
    def install
      bin.install "hexcraft"
    end
  
    test do
      assert_match "hexcraft version #{version}", shell_output("#{bin}/hexcraft --version")
    end
  end