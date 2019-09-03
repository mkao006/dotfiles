;; Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    flycheck ;; add the flycheck package
    material-theme))



(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)


;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(set-scroll-bar-mode -1)
(set-scroll-bar-mode nil) ;; Remove scroll bar
(global-linum-mode t) ;; enable line numbers globally
(tool-bar-mode -1) ;; Remove tool bar
(setq make-backup-files nil) ;; Do not save backup files ending with ~
(setq buffer-file-coding-system 'utf-8-unix)
(setq-default indent-tabs-mode nil) ;; default indent to space


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (stan-snippets stan-mode flycheck-pyflakes format-sql auto-complete ess company json-reformat spacemacs-theme py-autopep8 material-theme flycheck elpy better-defaults)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; THEME
;; --------------------------------------
;; Using the spacemacs theme from https://github.com/nashamri/spacemacs-theme

;; maximize initial and default frame size


;; PYTHON CUSTOMIZATION
;; --------------------------------------

;; enable elpy
(elpy-enable)

;; activate flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Use Python3 by default
(setq python-shell-interpreter "python3")
(setq elpy-rpc-python-command "python3")
;; (elpy-use-ipython "python3")


;;; ESS

;; Don't ask for directory when starting R
;; (setq ess-ask-for-ess-directory nil)

(require 'auto-complete-config)
(ac-config-default)

;; auto complete for scripts as well
(setq ess-use-auto-complete t)

;; disable smart underscore
(ess-toggle-underscore nil)

;; start company mode 
;; (with-eval-after-load 'ess
;;   (setq ess-use-company t))


;;;https://stackoverflow.com/questions/49232454/emacs-ess-how-to-auto-complete-library-function
;; (defun my-ess-hook ()
;;   ;; ensure company-R-library is in ESS backends
;;   (make-local-variable 'company-backends)
;;   (cl-delete-if (lambda (x) (and (eq (car-safe x) 'company-R-args))) company-backends)
;;   (push (list 'company-R-args 'company-R-objects 'company-R-library :separate)
;;         company-backends))
