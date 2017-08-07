function fish_prompt
	if not set -q -g __fish_robbyrussell_functions_defined
    set -g __fish_robbyrussell_functions_defined
    function _git_branch_name
      echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    end

    function _is_git_dirty
      echo (git status -s --ignore-submodules=dirty ^/dev/null)
    end

    function _is_git_repo
      git status -s >/dev/null ^/dev/null
    end

    function _hg_branch_name
      echo (hg branch ^/dev/null)
    end

    function _is_hg_dirty
      echo (hg status -mard ^/dev/null)
    end

    function _is_hg_repo
      which hg; and hg summary >/dev/null ^/dev/null
    end

    function _repo_branch_name
      eval "_$argv[1]_branch_name"
    end

    function _is_repo_dirty
      eval "_is_$argv[1]_dirty"
    end

    function _repo_type
      if _is_git_repo
        echo 'git'
      end
    end
  end

  set -l pink (set_color -o f6494d) # red to pink
  set -l guava_green (set_color -o bac932) # cyan to guava_yellow
  set -l guava_yellow (set_color -o f2d714) # blue to yellow

  set -l arrow "$pink->"
  if [ $USER = 'root' ]
    set arrow "$pink#"
  end

  set -l cwd $guava_yellow(basename (prompt_pwd))

  set -l repo_type (_repo_type)
  if [ $repo_type ]
    set -l repo_branch $guava_green(_repo_branch_name $repo_type)
    set repo_info "$pink $repo_type:($repo_branch$pink)"

    if [ (_is_repo_dirty $repo_type) ]
      set -l dirty "$guava_yellow ✗"
      set repo_info "$repo_info$dirty"
    end
  end

  echo -n -s $arrow ' '$cwd $repo_info $normal ' '
end
