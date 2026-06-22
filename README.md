# Multi-GCS Development

Workspace for the MAVLink **operator control** protocol
(`MAV_CMD_REQUEST_OPERATOR_CONTROL` / `CONTROL_STATUS`, MAVLink #2313) across
ArduPilot and QGroundControl. Multiple GCS can share a vehicle: one **primary**
holds exclusive manual control, others are recognized **secondaries**.

## Repositories (git submodules)

| Submodule | Upstream of fork | Branch | Tracks |
|-----------|------------------|--------|--------|
| `ardupilot` | [Davidsastresas/ardupilot](https://github.com/Davidsastresas/ardupilot) | `pr-multi-gcs-June2026-AP` | AP-side implementation + fixes on top of PR #33332 |
| `qgroundcontrol` | [mavlink/qgroundcontrol](https://github.com/mavlink/qgroundcontrol) | `pr-multi-gcs-June2026` | QGC-side operator-control support |

The submodules pin a specific commit. Run `git submodule update --remote` to
advance them to the latest of their tracked branch (then commit the parent to
re-pin).

QGC PR is here https://github.com/mavlink/qgroundcontrol/pull/14560 and build artifacts for Linux is in https://github.com/mavlink/qgroundcontrol/actions/runs/27784220835

## Clone

```bash
git clone --recurse-submodules https://github.com/Davidsastresas/Multi-GCS-Development
# or, if already cloned:
git submodule update --init --recursive
```

> `qgroundcontrol` has its own submodules, so `--recursive` is required.

## Related PRs / threads

- **ArduPilot** implementation: PR [#33332](https://github.com/ArduPilot/ardupilot/pull/33332) (with fixes proposed on top)
- **MAVLink** definitions: PR [#2313](https://github.com/mavlink/mavlink/pull/2313); spec questions on [#503](https://github.com/ArduPilot/mavlink/pull/503)
- **QGroundControl** PR: branch `pr-multi-gcs-June2026`

## Layout

- `ardupilot/`, `qgroundcontrol/` — submodules (above)
- `launch-sitl.sh`, `launch-qgc.sh`, `launch-mavproxy.sh` — multi-GCS SITL test harness

## Testing

Multi-GCS SITL: ArduPilot SITL + MAVProxy relaying to multiple QGC instances.
See the `launch-*.sh` scripts.
