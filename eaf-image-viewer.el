;;; eaf-image-viewer.el --- Image viewer

;; Filename: eaf-image-viewer.el
;; Description: Image viewer
;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2021, Andy Stewart, all rights reserved.
;; Created: 2021-07-31 20:43:15
;; Version: 0.1
;; Last-Updated: 2021-07-31 20:43:15
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/eaf-image-viewer.el
;; Keywords:
;; Compatibility: GNU Emacs 28.0.50
;;
;; Features that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Image viewer
;;

;;; Installation:
;;
;; Put eaf-image-viewer.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'eaf-image-viewer)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET eaf-image-viewer RET
;;

;;; Change log:
;;
;; 2021/07/31
;;      * First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require


;;; Code:

(defcustom eaf-image-viewer-keybinding
  '(("n" . "load_next_image")
    ("p" . "load_prev_image")
    ("SPC" . "load_prev_image")
    ("r" . "reload_image")
    ("x" . "insert_or_close_buffer")

    ("," . "js_zoom_out")
    ("." . "js_zoom_in")
    ("/" . "js_zoom_reset")
    ("-" . "js_zoom_out")
    ("=" . "js_zoom_in")
    ("0" . "js_zoom_reset")
    ("9" . "js_zoom_toggle")
    ("u" . "js_rotate_left")
    ("i" . "js_rotate_right")
    ("y" . "js_flip_horizontal")
    ("o" . "js_flip_vertical")
    ("k" . "js_move_down")
    ("j" . "js_move_up")
    ("l" . "js_move_left")
    ("h" . "js_move_right")

    ("U" . "eaf-image-viewer-rotate-file-left")
    ("I" . "eaf-image-viewer-rotate-file-right")
    ("O" . "eaf-image-viewer-rotate-file-horizontal")

    ("d" . "delete_current_image")
    ("<f12>" . "open_devtools")
    )
  "The keybinding of EAF Image Viewer."
  :type 'cons)

(defcustom eaf-image-extension-list
  '("jpg" "jpeg" "png" "bmp" "gif" "svg" "webp")
  "The extension list of image viewer application."
  :type 'cons)

(defun eaf-image-viewer-rotate-by-convert (file-name degrees-string)
  "Rotate FILE-NAME with the passed DEGREES-STRING.

Note that the file is changed on the file-system."
  ;; redisplay to show the \"Rotating...\" message
  (redisplay)
  (shell-command
   (format "convert '%s' -quality 100 -rotate %s '%s'"
           file-name
           degrees-string
           file-name)))

(defun eaf-image-viewer-rotate-file-right ()
  (interactive)
  (message "Rotating...")
  (eaf-call-async "eval_js_function" eaf--buffer-id "rotate_right" "")
  (eaf-image-viewer-rotate-by-convert (eaf-get-path-or-url) "+90")
  (message "Rotated right and saved to file system"))

(defun eaf-image-viewer-rotate-file-left ()
  (interactive)
  (message "Rotating...")
  (eaf-call-async "eval_js_function" eaf--buffer-id "rotate_left" "")
  (eaf-image-viewer-rotate-by-convert (eaf-get-path-or-url) "-90")
  (message "Rotated left and saved to file system"))

(defun eaf-image-viewer-rotate-file-horizontal ()
  (interactive)
  (message "Rotating...")
  (eaf-call-async "eval_js_function" eaf--buffer-id "rotate_horizontal" "")
  (eaf-image-viewer-rotate-by-convert (eaf-get-path-or-url) "-180")
  (message "Rotated horizontal and saved to file system"))

(add-to-list 'eaf-app-binding-alist '("image-viewer" . eaf-image-viewer-keybinding))

(setq eaf-image-viewer-module-path (concat (file-name-directory load-file-name) "buffer.py"))
(add-to-list 'eaf-app-module-path-alist '("image-viewer" . eaf-image-viewer-module-path))

(add-to-list 'eaf-app-extensions-alist '("image-viewer" . eaf-image-extension-list))

(provide 'eaf-image-viewer)

;;; eaf-image-viewer.el ends here
