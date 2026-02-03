class Orikon < Formula
  desc "Unified dashboard for Apache Flink jobs across multiple EKS clusters"
  homepage "https://github.com/kushtrimm/orikon"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://api.github.com/repos/kushtrimm/orikon/releases/assets/349919065",
          headers: [
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", ENV.fetch("GITHUB_TOKEN", ""))}",
            "Accept: application/octet-stream"
          ]
      sha256 "229df8201619f4ec7517c4b7fccadaed2a4f2636dc40f29b8d67a8143438f1c2"
    end

    on_intel do
      url "https://api.github.com/repos/kushtrimm/orikon/releases/assets/349919064",
          headers: [
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", ENV.fetch("GITHUB_TOKEN", ""))}",
            "Accept: application/octet-stream"
          ]
      sha256 "46dd04ac65b4c7616469722d27d9bd2fe431ae6c0f3a826d4e7b63b6dfe49b8e"
    end
  end

  def install
    # Extract the .app bundle from the zip
    system "unzip", "-q", cached_download, "-d", buildpath

    # Install to prefix (will be linked to /opt/homebrew/opt/orikon)
    prefix.install "Orikon.app"

    # Create a wrapper script in bin
    (bin/"orikon").write <<~EOS
      #!/bin/bash
      open "#{prefix}/Orikon.app" "$@"
    EOS
  end

  def caveats
    <<~EOS
      Orikon.app has been installed to:
        #{prefix}/Orikon.app

      To open, run:
        orikon
      or:
        open #{prefix}/Orikon.app

      To add to Applications folder:
        ln -sf #{prefix}/Orikon.app /Applications/Orikon.app
    EOS
  end

  test do
    assert_predicate prefix/"Orikon.app", :exist?
  end
end
