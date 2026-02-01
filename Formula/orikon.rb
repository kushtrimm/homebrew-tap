class Orikon < Formula
  desc "Unified dashboard for Apache Flink jobs across multiple EKS clusters"
  homepage "https://github.com/kushtrimm/orikon"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://api.github.com/repos/kushtrimm/orikon/releases/assets/349186170",
          headers: [
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", ENV.fetch("GITHUB_TOKEN", ""))}",
            "Accept: application/octet-stream"
          ]
      sha256 "2988c683f3ffee9589a8e6764f3753844e5c7a29e6f87037046a968c7901fc5c"
    end

    on_intel do
      url "https://api.github.com/repos/kushtrimm/orikon/releases/assets/349186172",
          headers: [
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", ENV.fetch("GITHUB_TOKEN", ""))}",
            "Accept: application/octet-stream"
          ]
      sha256 "e6bddc047c448184478674249eb7a9e8cfcf5e592eab310afd9d199bf028ce69"
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
