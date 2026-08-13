---
name: bump-formula
description: Bump the cb homebrew formula to the latest release version. Use when the user wants to bump or update the formula version.
---

# Bump Formula

## Workflow

1. **Detect latest version** from GitHub:
   ```bash
   gh release view --repo CrunchyData/bridge-cli --json tagName -q '.tagName' | sed 's/^v//'
   ```

2. **Update version** in `Formula/cb.rb` (line with `version "X.Y.Z"`)

3. **Compute new SHA256 checksums** for all three platform binaries (run in parallel):
   - `cb-v{version}_macos_arm64.zip`
   - `cb-v{version}_linux_aarch64.zip`
   - `cb-v{version}_linux_amd64.zip`

   Download URL pattern:
   ```
   https://github.com/CrunchyData/bridge-cli/releases/download/v{version}/cb-v{version}_{platform}.zip
   ```

   Compute checksums with:
   ```bash
   curl -sL "<url>" | shasum -a 256
   ```

4. **Verify downloads** — confirm each URL returns HTTP 200 before trusting the checksum.

5. **Replace SHA256 values** in the formula, matching each checksum to its platform block.

6. **Test the install**:
   ```bash
   cp Formula/cb.rb "$(brew --repository crunchydata/brew)/Formula/cb.rb"
   brew reinstall cb
   cb version
   ```

7. **Verify** the output shows the expected version.
