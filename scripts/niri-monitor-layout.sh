#!/usr/bin/env bash

set -eu

NIRI_CMD="${NIRI_CMD:-niri}"
FALLBACK_INTERNAL="${FALLBACK_INTERNAL:-eDP-1}"
PREFERRED_EXTERNAL="${PREFERRED_EXTERNAL:-HDMI-A-1}"
WORKSPACES="${WORKSPACES:-web term file music text}"

has_output() {
    local output_name="$1"

    "$NIRI_CMD" msg outputs 2>/dev/null | grep -Fq "$output_name"
}

move_workspaces_to_monitor() {
    local output_name="$1"
    local workspace

    if has_output "$FALLBACK_INTERNAL"; then
        "$NIRI_CMD" msg action focus-monitor "$FALLBACK_INTERNAL" >/dev/null 2>&1 || true
    fi

    for workspace in $WORKSPACES; do
        "$NIRI_CMD" msg action move-workspace-to-monitor --reference "$workspace" "$output_name" >/dev/null 2>&1 || true
    done

    "$NIRI_CMD" msg action focus-monitor "$output_name" >/dev/null 2>&1 || true
}

reconcile_layout() {
    if has_output "$PREFERRED_EXTERNAL"; then
        move_workspaces_to_monitor "$PREFERRED_EXTERNAL"
    fi
}

wait_for_niri() {
    until "$NIRI_CMD" msg outputs >/dev/null 2>&1; do
        sleep 1
    done
}

watch_events() {
    while true; do
        while IFS= read -r line; do
            case "$line" in
                *Output*)
                    reconcile_layout
                    ;;
            esac
        done < <("$NIRI_CMD" msg event-stream 2>/dev/null)

        sleep 1
    done
}

wait_for_niri
reconcile_layout
watch_events
