(message "goldskip setup..")

;; Relevant PATH --------------------------------------------------------------

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/"))
(setenv "NODE_PATH" "/usr/local/share/npm/lib/node_modules")

(message "env setup done")

;; Common Lisp (via Clozure CL) -----------------------------------------------

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/ccl")

(message "goldskip: clozure CL done")

;; Location of MIT-Scheme on this machine -------------------------------------

(setq scheme-program-name "/usr/local/bin/scheme")

;; Dash integration  ----------------------------------------------------------

(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key (kbd "C-c h") 'dash-at-point)

;; Final typeface adjustment  -------------------------------------------------

(custom-set-faces
 '(default ((t (:height 104 :family "Mensch"))))
 '(linum ((t (:inherit (shadow default) :height 0.9)))))

;; Use server  ----------------------------------------------------------------

(server-start)

;; Go fullscreen immediately  -------------------------------------------------

(toggle-frame-fullscreen)
(split-window-horizontally)
(when (> (frame-width) 272)
 (split-window-horizontally))
(when (> (frame-width) 300)
  (custom-set-faces '(default ((t (:height 120 :family "Mensch")))))
  (split-window-horizontally))
(balance-windows)

;; Pop up a new frame in fullscreen with 2 columns ----------------------------

(defun small-ui ()
  (interactive)
  (new-frame)
  (toggle-frame-fullscreen)
  (split-window-horizontally) )

;; Goldskip specific keybingings  ---------------------------------------------

(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

(provide 'goldskip)
