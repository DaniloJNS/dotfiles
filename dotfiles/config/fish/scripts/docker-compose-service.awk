#!/usr/bin/awk -f

/app.|web.|api./ {
    print substr($0, match($0, /api.|web.|app./), RLENGTH-1)
}
