---------------------------
---- Elementary awesome theme --
-----------------------------
---
-- Elementary panel bg: #D5D5D5
-------------------------
--
-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main
theme = {}
theme.wallpaper_cmd = { "awsetbg /home/saul/images/blitzpear_1024x600.png" }
-- }}}

-- {{{ Styles
-- theme.font      = "sans 8"
theme.font      = "Droid sans 9"

-- {{{ Colors
theme.bg_normal     = "#d5d5d5"
theme.bg_focus      = "#589FD7"
theme.bg_urgent     = "#ff0000"

theme.fg_normal     = "#4C4C4C"
theme.fg_focus     = "#151515"
theme.fg_urgent     = "#ffffff"
-- }}}

-- {{{ Borders
theme.border_width  = "3"
theme.border_normal = "#4c4c4c"
-- theme.border_focus  = "#589FD7" --blue
theme.border_focus  = "#B6E354" --green
theme.border_marked = "#91231c"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3f3f3f"
theme.titlebar_fg_focus  = "#ffffff"
theme.titlebar_bg_normal = "#3f3f3f"
theme.titlebar_fg_normal  = "#ffffff"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"
theme.menu_width  = "100"
theme.menu_border_width  = "1"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = "/home/saul/.config/awesome/themes/elementary/taglist/taglist_f.png"
theme.taglist_squares_unsel = "/home/saul/.config/awesome/themes/elementary/taglist/taglist_u.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon = "/home/saul/.config/awesome/images/gian_24.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
theme.tasklist_floating_icon = "/usr/share/awesome/themes/default/tasklist/floating.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = "/home/saul/.config/awesome/themes/elementary/layouts/tile.png"
theme.layout_tileleft   = "/home/saul/.config/awesome/themes/elementary/layouts/tileleft.png"
theme.layout_tilebottom = "/home/saul/.config/awesome/themes/elementary/layouts/tilebottom.png"
theme.layout_tiletop    = "/home/saul/.config/awesome/themes/elementary/layouts/tiletop.png"
theme.layout_fairv      = "/home/saul/.config/awesome/themes/elementary/layouts/fairv.png"
theme.layout_fairh      = "/home/saul/.config/awesome/themes/elementary/layouts/fairh.png"
theme.layout_spiral     = "/home/saul/.config/awesome/themes/elementary/layouts/spiral.png"
theme.layout_dwindle    = "/home/saul/.config/awesome/themes/elementary/layouts/dwindle.png"
theme.layout_max        = "/home/saul/.config/awesome/themes/elementary/layouts/max.png"
theme.layout_fullscreen = "/home/saul/.config/awesome/themes/elementary/layouts/fullscreen.png"
theme.layout_magnifier  = "/home/saul/.config/awesome/themes/elementary/layouts/magnifier.png"
theme.layout_floating   = "/home/saul/.config/awesome/themes/elementary/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "/home/saul/.config/awesome/themes/elementary/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "/home/saul/.config/awesome/themes/elementary/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "/home/saul/.config/awesome/themes/elementary/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "/home/saul/.config/awesome/themes/elementary/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "/home/saul/.config/awesome/themes/elementary/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "/home/saul/.config/awesome/themes/elementary/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "/home/saul/.config/awesome/themes/elementary/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "/home/saul/.config/awesome/themes/elementary/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "/home/saul/.config/awesome/themes/elementary/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "/home/saul/.config/awesome/themes/elementary/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "/home/saul/.config/awesome/themes/elementary/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "/home/saul/.config/awesome/themes/elementary/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "/home/saul/.config/awesome/themes/elementary/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "/home/saul/.config/awesome/themes/elementary/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "/home/saul/.config/awesome/themes/elementary/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "/home/saul/.config/awesome/themes/elementary/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "/home/saul/.config/awesome/themes/elementary/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "/home/saul/.config/awesome/themes/elementary/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
