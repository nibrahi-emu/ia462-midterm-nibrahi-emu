
#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

sudo docker run --rm -d \
  --name ia462-midterm-final \
  --read-only \
  --cap-drop ALL \
  --security-opt no-new-privileges:true \
  --security-opt "seccomp=$PWD/seccomp-profile.json" \
  --tmpfs /tmp:rw,noexec,nosuid,size=16m \
  -p 127.0.0.1:8080:8080 \
  ia462-midterm:hardened
