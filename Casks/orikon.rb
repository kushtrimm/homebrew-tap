cask "orikon" do
  version "0.1.0"

  arch arm: "arm64", intel: "amd64"

  sha256 arm:   "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5",
         intel: "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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
