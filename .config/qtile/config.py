# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
from libqtile import bar, layout, qtile, hook
from libqtile.backend.wayland import InputConfig
from libqtile.config import Click, Drag, Group, Key, Match, Screen, Rule
from libqtile.lazy import lazy
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration


os.environ['GTK_THEME'] = 'Dracula'

mod = "mod4"
terminal = "emacsclient -c -e '(ars/create-eshell t)'"


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    # Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    # Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    # Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    # Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "l", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod], "h", lazy.layout.previous(), desc="Move window focus to other window"),
    Key([mod], "space", lazy.layout.swap_main(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    # Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    # Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    # Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    # Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    # Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    # Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    # Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    # Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    # Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("rofi -show drun"), desc="Spawn a command using a prompt widget"),
    Key(["mod1"], "space", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout"),
    Key([], "Print", lazy.spawn('''/bin/sh -c 'grim -g "$(slurp)" - | swappy -f -' '''), desc="Screenshot"),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


# groups = [Group(i) for i in "1234567890"]
groups = [
    Group("1", matches=[Match(wm_class="zenbrowser")]),
    Group("2"),
    Group("3", matches=[Match(wm_class="foot")]),
    Group("4", matches=[Match(wm_class="geary")]),
    Group("5"),
    Group("6", matches=[Match(wm_class="lollypop")]),
    Group("7", matches=[Match(wm_class="steam")]),
    Group("8", matches=[Match(wm_class="Slack"), Match(wm_class="org.telegram.desktop")]),
    Group("9"),
    Group("0"),
]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    layout.MonadThreeCol(
        border_focus="#ba8bafe6",
        border_normal="#282828e6",
        border_width=3,
        ratio=0.5,
        margin=16,
        new_client_position="bottom"
    ),
    layout.Spiral(
        border_focus="#ba8bafe6",
        border_normal="#282828e6",
        border_width=3,
        ratio=0.5,
        margin=16,
        new_client_position="bottom"
    ),
]

widget_defaults = dict(
    font="IosevkaTerm Nerd Font",
    fontsize=15,
    padding=3,
    foreground="#d8d8d8"
)
extension_defaults = widget_defaults.copy()

decor = {
    "decorations": [
        RectDecoration(
            colour="#282828e6",
            line_colour="#3a3c4ee6",
            line_width=3,
            radius=0,
            filled=True,
            padding_x=8,
            # padding_y=10,
        )
    ],
    "padding": 20,
}


def get_wifi_signal_quality():
    command = "nmcli -f IN-USE,SSID,SIGNAL device wifi list | grep '*' | awk '{print $3}'"
    value = subprocess.check_output(command, shell=True).decode('utf8').rstrip('\n')
    if not value:
        return '󰤮 ----'
    value = int(value)
    if value < 10:
        return f'󰤯 {value:3d}%'
    elif value < 30:
        return f'󰤟 {value:3d}%'
    elif value < 50:
        return f'󰤢 {value:3d}%'
    elif value < 80:
        return f'󰤥 {value:3d}%'
    else:
        return f'󰤨 {value:3d}%'


def get_output_volume():
    muted_command = "pactl get-sink-mute @DEFAULT_SINK@"
    muted_output = subprocess.check_output(muted_command, shell=True).decode('utf8').rstrip('\n')
    if muted_output == 'Mute: yes':
        return '󰝟 ----'

    command = "pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n 1"
    value = subprocess.check_output(command, shell=True).decode('utf8').rstrip('\n')
    value = int(''.join(c for c in value if c.isdigit()))
    if value < 33:
        return f' {value:3d}%'
    elif value < 80:
        return f' {value:3d}%'
    else:
        return f' {value:3d}%'


def get_cpu_load():
    command = '''top -bn1 | grep "Cpu(s)" | awk '{usage=100 - $8; printf "%.2f%%\\n", usage}' '''
    value = subprocess.check_output(command, shell=True).decode('utf8').split('.')[0]
    value = int(value)
    return f' {value:3d}%'


def get_ram_usage():
    command = '''free | awk '/Mem:/ {printf("%.2f GiB\\n", $3 / 1024 / 1024)}' '''
    value = subprocess.check_output(command, shell=True).decode('utf8').rstrip('\n')
    return f' {value:>9}'


def get_free_space():
    command = '''df / | awk 'NR==2 {printf("%.2f GiB\\n", $4/1024/1024)}' '''
    value = subprocess.check_output(command, shell=True).decode('utf8').rstrip('\n')
    return f'󰋊 {value:>10}'


def get_current_song():
    command = "playerctl metadata --format '{{ artist }} - {{ title }}'"
    try:
        value = subprocess.check_output(command, shell=True).decode('utf8').rstrip('\n')
    except Exception:
        value = '----'
    return f'󰝚 {value}'


class ActionableGenPollText(widget.GenPollText):
    def __init__(self, **config):
        scroll_down_func = config.pop('scroll_down_func', lambda: None)
        scroll_up_func = config.pop('scroll_up_func', lambda: None)
        left_click_func = config.pop('left_click_func', lambda: None)
        right_click_func = config.pop('right_click_func', lambda: None)
        middle_click_func = config.pop('middle_click_func', lambda: None)
        super().__init__(**config)

        self.add_callbacks({
            "Button1": left_click_func,
            "Button2": middle_click_func,
            "Button3": right_click_func,
            "Button4": scroll_up_func,
            "Button5": scroll_down_func,
        })

    def scroll(self, x, y, direction):
        self.scroll_func(x, y, direction)


def increase_volume(*args, **kwargs):
    qtile.widgets_map.get('volume_widget').force_update()
    subprocess.call('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+', shell=True)


def decrease_volume():
    qtile.widgets_map.get('volume_widget').force_update()
    subprocess.call('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-', shell=True)


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GenPollText(
                    func=get_current_song,
                    update_interval=1,
                    foreground='#ebff87',
                    **decor
                ),
                widget.Pomodoro(
                    color_inactive='#f7f7fb',
                    color_active='#ab4642',
                    color_break='#00f769',
                    fmt='  {}',
                    prefix_inactive='--:--',
                    **decor
                ),
                widget.CurrentLayoutIcon(
                    foreground='#00f769',
                    scale=0.5,
                    use_mask=True,
                    **decor
                ),
                widget.Spacer(),
                widget.GenPollText(
                    func=get_wifi_signal_quality,
                    update_interval=5,
                    foreground='#b45bcf',
                    **decor
                ),
                ActionableGenPollText(
                    name="volume_widget",
                    func=get_output_volume,
                    scroll_up_func=increase_volume,
                    scroll_down_func=decrease_volume,
                    update_interval=None,
                    foreground='#62d6e8',
                    **decor
                ),
                widget.GenPollText(
                    func=get_cpu_load,
                    update_interval=5,
                    foreground='#f7f7fb',
                    **decor
                ),
                widget.GroupBox(
                    highlight_method='text',
                    this_current_screen_border="#b45bcf",
                    active='#d8d8d8',
                    inactive='#585858',
                    spacing=1,
                    margin_x=14,
                    decorations=[
                        RectDecoration(
                            colour="#282828e6",
                            line_colour="#3a3c4ee6",
                            line_width=3,
                            radius=0,
                            filled=True,
                            padding_x=8,
                        )
                    ]
                ),
                widget.GenPollText(
                    func=get_ram_usage,
                    update_interval=5,
                    foreground='#00f769',
                    **decor
                ),
                widget.GenPollText(
                    func=get_free_space,
                    update_interval=5,
                    foreground='#ebff87',
                    **decor
                ),
                widget.Spacer(),
                widget.KeyboardLayout(
                    configured_keyboards=['us', 'ru', 'ua'],
                    fmt='󰥻  {}',
                    foreground='#00f769',
                    **decor
                ),
                widget.Clock(
                    format="%H:%M",
                    fmt='  {}',
                    foreground='#ebff87',
                    **decor
                ),
                widget.Clock(
                    format="%a %Y-%m-%d",
                    fmt='  {}',
                    foreground='#62d6e8',
                    **decor
                ),
                widget.StatusNotifier(
                    **decor
                ),
            ],
            28,
            background='#ffffff00',
            margin=[16, 10, 0, 8]
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_type="dialog")
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = {
    "type:keyboard": InputConfig(
        # kb_layout="us,ru,ua",
        # kb_options="grp:alt_space_toggle,caps:capslock",
        kb_repeat_rate=35
    )
}

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = "Catppuccin-Mocha-Mauve"
wl_xcursor_size = 24

@hook.subscribe.startup_once
def autostart():
    qtile.cmd_spawn('/usr/libexec/xdg-desktop-portal')
    qtile.cmd_spawn('/usr/libexec/xdg-desktop-portal-wlr')
    qtile.cmd_spawn('dunst')
    qtile.cmd_spawn('swww init')
    qtile.cmd_spawn('wallsetter')
    qtile.cmd_spawn('flatpak run org.gnome.Geary')
    qtile.cmd_spawn('flatpak run com.slack.Slack')
    qtile.cmd_spawn('flatpak run org.telegram.desktop')
    qtile.cmd_spawn('flatpak run org.gnome.Lollypop')
    qtile.cmd_spawn('flatpak run io.github.zen_browser.zen')
    qtile.cmd_spawn('daily-sync-changes.sh')
    qtile.cmd_spawn('emacs-pgtk --daemon')
# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
