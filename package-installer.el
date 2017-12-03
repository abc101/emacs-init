;; Install package if it is not installed yet
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(mapc
 (lambda (package)
   (unless (package-installed-p package)
     (progn (message "Installing $s ..." package)
	    (package-refresh-contents)
	    (package-install package))))
 '(ample-theme auto-complete auto-indent-mode coffee-mode col-highlight color-theme company-php ac-php-core direnv django-mode elpy company find-file-in-project git f go google-translate helm-google google helm-make helm helm-core highlight highlight-blocks highlight-indentation hl-line+ hl-spotlight hlinum ivy java-snippets json-mode json-reformat json-snatcher markdown-mode+ markdown-preview-mode markdown-mode oauth2 php+-mode php-auto-yasnippets php-mode pony-mode popup projectile pkg-info epl python python-django python-mode pyvenv resize-window sparql-mode sphinx-doc sphinx-mode ssh twig-mode uuidgen virtualenv virtualenvwrapper vline web s dash web-beautify web-mode web-server websocket windresize windsize with-editor async xcscope xterm-color yasnippet ztree))
