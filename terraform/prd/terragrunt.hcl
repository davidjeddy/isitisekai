terraform {
  before_hook "before_hook" {
    commands     = ["apply", "plan"]
    execute = [
      "tfsec",
      ".",
      "--exclude-downloaded-modules"
    ]
  }
}