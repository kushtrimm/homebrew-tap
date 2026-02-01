cask "orikon" do
  version "0.1.0"

  arch arm: "arm64", intel: "amd64"

  sha256 arm:   "REPLACE_WITH_ARM64_SHA256",
         intel: "REPLACE_WITH_AMD64_SHA256"

  url "https://github.com/kushtrimm/orikon/releases/download/v#{version}/Orikon-darwin-#{arch}.zip"
  name "Orikon"
  desc "Unified dashboard for Apache Flink jobs across multiple EKS clusters"
  homepage "https://github.com/kushtrimm/orikon"

  depends_on macos: ">= :big_sur"

  app "Orikon.app"

  zap trash: [
    "~/.orikon",
    "~/Library/Application Support/Orikon",
    "~/Library/Preferences/com.orikon.app.plist",
    "~/Library/Caches/Orikon",
  ]
end
