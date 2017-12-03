;; auto load local virtualenv
(venv-workon "abc101-site")

(python-django-open-project
 (set 'python-django-project-root "~/Workspace/abc101-site")
 (set 'python-django-project-settings "abc101_site.settings.dev"))

(find-file-other-window "~/Workspace/abc101-site/abc101_site/settings/dev.py")
(enlarge-window-horizontally 30)
(cd "~/Workspace/abc101-site/")
