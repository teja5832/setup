# function extract () {
#     if [ -f $1 ] ; then
#     case $1 in
#         *.tar.bz2)   tar xjf $1     ;;
#         *.tar.gz)    tar xzf $1     ;;
#         *.bz2)       bunzip2 $1     ;;
#         *.rar)       unrar e $1     ;;
#         *.gz)        gunzip $1      ;;
#         *.tar)       tar xf $1      ;;
#         *.tbz2)      tar xjf $1     ;;
#         *.tgz)       tar xzf $1     ;;
#         *.zip)       unzip $1       ;;
#         *.Z)         uncompress $1  ;;
#         *.7z)        7z x $1        ;;
#         *)     echo "'$1' cannot be extracted via extract()" ;;
#     esac
#     else
#     echo "'$1' is not a valid file"
#     fi
# }

function spoof_dw () {
    wget  --header="Accept: text/html" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0" $1
}

function get_audio () {
    pushd ~/Music
    youtube-dl -ciw --extract-audio --audio-format mp3 $1
    popd
}

function get_playlist () {
    cd $1
    if [[ -z $2 ]]
    then
        test -e list.txt || { echo "No list; specify URL" ; return -1 }
    else
        youtube-dl --get-url $2 | tee -a list.txt
    fi

    cat list.txt | parallel youtube-dl :::

    for i in $(cat list.txt)  
    do  
        youtube-dl "youtube.com/watch?v=$i"
    done

    cd -
}

function grp () {
    if [ -z $2 ]
    then
        grep $1 -rin --include='*.py' .
    else
        grep $1 -rin --include='*.py' $2
    fi
}

function gcm () {
    echo '---------------- PULL ----------------'
    git pull || { echo "Pull Fail" ; return -1 }
    echo '--------------- COMMIT ---------------'
    git commit -am "$*" || { echo "Commit Fail" ; return -1 }
    echo '---------------- PUSH ----------------'
    git push || { echo "Push Fail" ; return -1 }
}

function arxiv_tar () {
    local _DIR=$(echo $1 |  sed 's/.pdf//' | awk -F "\/" '{ print $NF }' 2> /dev/null)
    echo $_DIR
    spoof_dw https://arxiv.org/e-print/$_DIR
    mv $_DIR $_DIR.tar.gz
    mkdir -p $_DIR
    tar -xvf $_DIR.tar.gz --directory $_DIR
}

function s () {
    [[ -z $1 ]] && _DIR="." || _DIR="$1"
    [[ -e $_DIR  && ! -d $_DIR ]] && subl $_DIR && return 0
    cd $_DIR
    _DIR=`git rev-parse --show-toplevel 2>/dev/null || echo '.'`
    subl $_DIR
    cd -
}

function o () {
    if [[ -z $1 ]]
    then
        open .
    else
        open $1
    fi
}

# LS
function ldir () {
    ls -F -o $1 | \grep /$
}

function lf () {
    ls -F -l $1 | \grep ^-
}

function lk () {
    ls -F -l $1 | \grep ^l
}

function lx () {
    ls -F -l $1 | \grep ^-..x
}