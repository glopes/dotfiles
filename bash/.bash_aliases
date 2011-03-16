#   svn_add_all [folder]            - recursive add folders unversioned files (espects svn:ignore and spaces in filenames)
#   svn_rid_all [folder]            - recursive svn-deletes missing files (deleted by user, but not svn-deleted)
#   svn_revert_all [folder]         - recursive revert any change in folder
#   svn_ignore [folder] [pattern]   - add pattern to folders svn:ignore property.  Use 's around wildcards.  E.g. '*' or '.*'
#   svn_ignore_edit [folder]        - edit svn:ignore property
svn_add_all    () { svn status "$1" | grep '^?' | cut -b 8- | xargs -I {} svn add "{}"; }
svn_trim_all   () { svn status "$1" | grep '^!' | cut -b 8- | xargs -I {} svn rm "{}"; }
svn_revert_all () { svn revert "$1" -R; }
svn_ignore     () { svn_prop_add ignore "$1" "$2"; }
svn_external   () { svn_prop_add external "$1" "$2"; }
svn_prop_add   () { FILE="$RANDOM.svnprop"; svn propget svn:"$1" "$2" > $FILE; echo "$3" >> $FILE;	
			sed -i '/^$/d' $FILE; # remove blank lines
			svn propset svn:"$1" "$2" -F ; rm ; }
svn_prop_edit  () { svn pe svn:"$2" "$1"; }
svn_svn_purge  () { find $1 -type d -name .svn -exec rm -rf {} \; ; }
svn_update     () { svn update $@ --ignore-externals; }
svn_commit     () { svn commit $@; }

# dereference links in current path.
deref () { cd $(pwd -P); }

# color ls's
alias vdir='vdir --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# search in files and directories
search () { grep -rHinC0 "$*" .; }

# throw windows users a bone
alias dir='dir --color=auto'
alias copy='cp'
alias del='rm'
