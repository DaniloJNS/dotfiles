function env_var
    set -l var $argv

    if test (count $var) -ge 1
       set -x $var
    end
end
