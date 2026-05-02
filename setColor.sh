#!/usr/bin/env bash
# Color palette selector with bottom bar preview
set -euo pipefail

ESC=$'\033'

clear_screen() {
    printf '%s[2J' "$ESC"
    printf '%s[H' "$ESC"
}

reset_colors() {
    printf '%s[0m' "$ESC"
}

get_hostname() {
    hostname 2>/dev/null || echo "localhost"
}

print_palette() {
    local selected=${1:-0}
    local cols=16
    local rows=16
    local total=$((cols * rows))
    local output=""
    
    # Get terminal dimensions
    local term_cols=$(tput cols 2>/dev/null || echo 80)
    local term_rows=$(tput lines 2>/dev/null || echo 24)
    
    # Calculate grid position (centered)
    local grid_start_col=$(( (term_cols - cols * 4) / 2 ))
    local grid_start_row=$(( (term_rows - rows) / 2 ))
    
    # Bottom status bar row
    local bar_row=$((term_rows - 1))
    local hostname_col=1
    
    # Bottom-left hostname above [coloring]
    local hostname=$(get_hostname)
    local hostname_row=$((bar_row - 1))
    output+="${ESC}[${hostname_row};${hostname_col}H"
    output+="${ESC}[38;5;${selected}m"
    output+="${hostname}"
    output+="${ESC}[0m"
    
    # Build the color grid
    for i in $(seq 0 $((total - 1))); do
        local row=$((i / cols))
        local col=$((i % cols))
        local screen_row=$((grid_start_row + row))
        local screen_col=$((grid_start_col + col * 4))
        
        # Color swatch
        output+="${ESC}[${screen_row};${screen_col}H"
        output+="${ESC}[48;5;${i}m"
        output+="    "
        output+="${ESC}[0m"
        
        # Highlight selected
        if [[ $i -eq $selected ]]; then
            output+="${ESC}[${screen_row};${screen_col}H"
            output+="${ESC}[7m"
            output+=" ${i} "
            output+="${ESC}[0m"
        fi
    done
    
    # Bottom status bar - draw full colored bar first
    output+="${ESC}[${bar_row};1H"
    output+="${ESC}[48;5;${selected}m"
    output+=$(printf '%*s' "$term_cols" '')
    output+="${ESC}[0m"
    
    # [coloring] in black on selected color background
    output+="${ESC}[${bar_row};${hostname_col}H"
    output+="${ESC}[38;5;16m"
    output+="${ESC}[48;5;${selected}m"
    output+="[coloring]"
    output+="${ESC}[0m"
    
    # 1:bash in green on black background
    local mode_col=$((hostname_col + 10))
    output+="${ESC}[${bar_row};${mode_col}H"
    output+="${ESC}[48;5;16m"
    output+="${ESC}[38;5;46m"
    output+=" 1:bash "
    output+="${ESC}[0m"
    
    # Write everything at once, then position cursor at hostname
    printf '%s' "$output"
    printf '%s[%s;%sH' "$ESC" "$hostname_row" "$((hostname_col + ${#hostname} + 1))"
}

read_key() {
    local key=""
    
    if [[ ! -t 0 ]]; then
        IFS= read -rsn1 key
        echo "$key"
        return
    fi
    
    IFS= read -rsn1 key
    if [[ $key == "$ESC" ]]; then
        IFS= read -rsn2 seq
        case $seq in
            "[A") echo "up";;
            "[B") echo "down";;
            "[C") echo "right";;
            "[D") echo "left";;
            *) echo "$ESC$seq"
               ;;
        esac
    else
        printf '%s' "$key"
    fi
}

main() {
    local selected=0
    
    clear_screen
    print_palette $selected
    
    while true; do
        k=$(read_key)
        
        case $k in
            up)
                ((selected -= 16)) || true
                ;;
            down)
                ((selected += 16)) || true
                ;;
            left)
                ((--selected)) || true
                ;;
            right)
                ((++selected)) || true
                ;;
            ""|$'\r'|$'\n')
                local script_dir
                script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
                printf 'HOSTNAME_COLOR="\\[\\033[0;38;5;%sm\\]"\n' "$selected" > "${script_dir}/COLOR_CONFIG.sh"
                printf 'export TMUX_STATUS_BG=colour%s\n' "$selected" >> "${script_dir}/COLOR_CONFIG.sh"
                echo ""
                printf '%s' "${ESC}[38;5;${selected}m"
                echo " Wrote HOSTNAME_COLOR ${selected} to ${script_dir}/COLOR_CONFIG.sh"
                exit 0
                ;;
            q|Q|"q")
                echo ""
                echo "Cancelled"
                exit 1
                ;;
        esac
        
        ((selected < 0)) && selected=0
        ((selected > 255)) && selected=255
        
        print_palette $selected
    done
}

main
