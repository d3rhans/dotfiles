if [[ $# -eq 1 ]]; then
    coproc ( xdg-open $1 > /dev/null 2>&1 )
    exec 1>&-
    exit;
fi

fd --type f '(.*ods$)|(.*odt$)|(.*xls[x]+$)|(.*dox[x]+$)|(.*pdf$)' ~/Dokumente/Sport/ ~/Dokumente/quantum/ ~/Dokumente/PHD/ ~/Dokumente/Projekte
