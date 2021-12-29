### EAF Image Viewer
<p align="center">
  <img width="800" src="./screenshot.png">
</p>

Image Viewer application for the [Emacs Application Framework](https://github.com/emacs-eaf/emacs-application-framework).

### Load application
[Install EAF](https://github.com/emacs-eaf/emacs-application-framework#install) first, then add below code in your emacs config:

```Elisp
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
(require 'eaf)
(require 'eaf-image-viewer)
```

### The keybinding of EAF Image Viewer.

| Key   | Event   |
| :---- | :------ |
| `n` | load_next_image |
| `p` | load_prev_image |
| `SPC` | load_prev_image |
| `r` | reload_image |
| `x` | insert_or_close_buffer |
| `,` | js_zoom_out |
| `.` | js_zoom_in |
| `/` | js_zoom_reset |
| `-` | js_zoom_out |
| `=` | js_zoom_in |
| `0` | js_zoom_reset |
| `9` | js_zoom_toggle |
| `u` | js_rotate_left |
| `i` | js_rotate_right |
| `y` | js_flip_horizontal |
| `o` | js_flip_vertical |
| `k` | js_move_down |
| `j` | js_move_up |
| `l` | js_move_left |
| `h` | js_move_right |
| `U` | eaf-image-viewer-rotate-file-left |
| `I` | eaf-image-viewer-rotate-file-right |
| `O` | eaf-image-viewer-rotate-file-horizontal |
| `d` | delete_current_image |
| `<f12>` | open_devtools |

