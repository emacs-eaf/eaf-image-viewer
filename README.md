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
| `,` | zoom_out |
| `.` | zoom_in |
| `/` | zoom_reset |
| `-` | zoom_out |
| `=` | zoom_in |
| `0` | zoom_reset |
| `9` | zoom_toggle |
| `x` | close_buffer |
| `u` | rotate_left |
| `i` | rotate_right |
| `y` | flip_horizontal |
| `o` | flip_vertical |
| `j` | move_down |
| `k` | move_up |
| `h` | move_left |
| `l` | move_right |
| `d` | delete_current_image |
| `<f12>` | open_devtools |

