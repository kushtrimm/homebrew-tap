cask "orikon" do
  version "0.1.0"

  on_arm do
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

    url "https://api.github.com/repos/kushtrimm/orikon/releases/assets/349186170",
        header: "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", ENV.fetch("GITHUB_TOKEN", ""))}"
  end

  on_intel do
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

    url "https://api.github.com/repos/kushtrimm/orikon/releases/assets/349186172",
        header: "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", ENV.fetch("GITHUB_TOKEN", ""))}"
  end

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
