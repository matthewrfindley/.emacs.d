((magit-bisect nil)
 (magit-blame
  ("-w")
  ("-w" "-M" "-C")
  ("-w" "-C"))
 (magit-blame:-C)
 (magit-blame:-M "-C")
 (magit-branch nil)
 (magit-cherry-pick
  ("--ff"))
 (magit-commit nil
               ("--allow-empty")
               ("--reuse-message=master")
               ("--all")
               ("--no-verify"))
 (magit-diff
  ("--no-ext-diff" "--stat"))
 (magit-dispatch nil)
 (magit-ediff nil)
 (magit-fetch nil
              ("--prune"))
 (magit-gitignore nil)
 (magit-log
  ("-n256" "--graph" "--decorate"))
 (magit-merge nil)
 (magit-push nil
             ("--force-with-lease"))
 (magit-rebase
  ("--autostash")
  nil
  ("--rebase-merges=no-rebase-cousins" "--autostash")
  ("--interactive")
  ("--preserve-merges"))
 (magit-remote
  ("-f"))
 (magit-remote.<remote>.*url "git@github.com:wsgr/p2-api.git" "git@github.com:wsgr/p2_api.git")
 (magit-reset nil)
 (magit-revert
  ("--edit")
  nil)
 (magit-revision-history "master")
 (magit-run nil)
 (magit-show-refs nil)
 (magit-stash nil
              ("--all")
              ("--include-untracked"))
 (magit-status-jump nil)
 (magit-submodule nil)
 (magit-tag nil)
 (transient:magit-rebase:--rebase-merges=))
