function pamac_search --description "Seach available packages"
    set options $argv
    if test count $options -ge 0
       set --local result (pamac search $options -q | fzf --height=50%)
     $result
    end
end
