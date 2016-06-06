source ~/.bashrc
export PATH=/opt/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
alias atompract='cd /Users/ssilesky/projects/practicetimer && atom /Users/ssilesky/projects/practicetimer'
alias sharon="cd '/Users/ssilesky/projects/sharon/docroot/public'"
alias pract="cd '/Users/ssilesky/projects/practicetimer'"
alias check='git checkout'
alias log='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias killc="kill -9 `pgrep -f 'Google Chrome'`"
alias wed-serve="cd /Users/ssilesky/projects/wedding && bundle exec jekyll serve"
alias blog="cd '/Users/ssilesky/projects/blog'"
alias short="vim ~/shortcuts.txt"
alias catshort="cat ~/shortcuts.txt"
alias pb="pbpaste | pbcopy"
alias proj="cd '/Users/ssilesky/projects/'"
alias temp="cd '/Users/ssilesky/Desktop/temp/'"
alias drupalcamp="cd '/Users/ssilesky/drupalcampnola.com/'"
alias mr-dev="ssh tumrweb1d01.tulane.edu"
alias mr-prod="ssh tumrweb1p01.tulane.edu"
alias port-themes="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/'"
alias port-docroot="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/'"
alias port-all="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/'"
alias portfolio="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio'"
alias port-features="cd '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/modules/features'"
alias sf-features="cd '/Users/ssilesky/projects/site-factory/docroot/sites/all/modules/features'"
alias rsync-port="rsync -azvh /Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/ /Users/ssilesky/projects/site-factory/docroot/sites/all/themes/portfolio/"
alias port="cd '/Users/ssilesky/projects/site-factory-portfolio/'"
alias subl="sublime"
alias sourcebash="source ~/.bash_profile"
alias bs-port="browser-sync start --proxy portfolio.dd:8083 --files '/Users/ssilesky/projects/site-factory-portfolio/docroot/sites/all/themes/portfolio/templates' --no-inject-changes"
alias vagrant-coop="cd /Users/ssilesky/projects/drupal-vm-master && vagrant up"
alias coop="cd /Users/ssilesky/projects/cooperationlouisiana.com"
alias bashprof="sudo vim ~/.bash_profile"
alias catbash="cat ~/.bash_profile"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
