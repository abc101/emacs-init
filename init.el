;; stop creating backup~ and #autosave# files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; window default size
(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 200))

;; window resize
(global-set-key (kbd "s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-<down>") 'shrink-window)
(global-set-key (kbd "s-<up>") 'enlarge-window)

;; Melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; load download
(add-to-list 'load-path "~/.emacs.d/dl/")

;; default directory
(setq default-directory "~/Workspace")

;; ido
(require 'ido)
(ido-mode t)

;; line number
(require 'linum)
(linum-mode t)

;; Auto complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; Highlight
(require 'highlight-current-line)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "navy")
(require 'hl-line)
(global-hl-spotlight-mode t)
(set-face-background 'hl-spotlight "black")

;; yasnippet
(require 'yasnippet)
(yas-global-mode t)

;; virtualenv
(require 'virtualenvwrapper)
(setq venv-location "~/.virtualenvs/")
(global-set-key (kbd "C-x v") 'venv-workon)

;; direnv
;;(require 'direnv)
;;(direnv-mode t)

;; python-mode
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; python3
(setq python-shell-interpreter "python3")

;; python-django
(require 'python-django)
(global-set-key (kbd "C-x j") 'python-django-open-project)

;; django-pony-mode
(require 'pony-mode)

;; django-mode
(require 'django-html-mode)
(require 'django-mode)
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-block-face t)
(setq web-mode-enable-comment-keywords t)
(setq web-mode-enable-comment-keywords t)
(setq web-mode-enable-heredoc-fontification t)

;; load abc101 project
(global-set-key (kbd "C-x a")
		(lambda() (interactive)(load-file "~/Workspace/abc101-site/dir-init.el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (ample)))
 '(custom-safe-themes
   (quote
    ("938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" default)))
 '(package-selected-packages
   (quote
    (ztree xterm-color windsize windresize web-mode web-beautify web virtualenvwrapper virtualenv twig-mode ssh sphinx-mode sphinx-doc sparql-mode resize-window python-mode python-django python pony-mode php-auto-yasnippets php+-mode oauth2 markdown-preview-mode markdown-mode+ json-mode java-snippets hlinum hl-spotlight hl-line+ highlight-blocks highlight helm-google google-translate go git elpy django-mode direnv company-php color-theme col-highlight coffee-mode auto-indent-mode auto-complete ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
