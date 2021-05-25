function _rails_command () {
  if [ -e "bin/stubs/rails" ]; then
    bin/stubs/rails $@
  elif [ -e "bin/rails" ]; then
    bin/rails $@
  elif [ -e "script/rails" ]; then
    ruby script/rails $@
  elif [ -e "script/server" ]; then
    ruby script/$@
  else
    command rails $@
  fi
}

function _rake_command () {
  if [ -e "bin/stubs/rake" ]; then
    bin/stubs/rake $@
  elif [ -e "bin/rake" ]; then
    bin/rake $@
  elif type bundle &> /dev/null && ([ -e "Gemfile" ] || [ -e "gems.rb" ]); then
    bundle exec rake $@
  else
    command rake $@
  fi
}

alias rails='_rails_command'
compdef _rails_command=rails

alias rake='_rake_command'
compdef _rake_command=rake

alias devlog='tail -f log/development.log'
alias prodlog='tail -f log/production.log'
alias testlog='tail -f log/test.log'

alias -g RED='RAILS_ENV=development'
alias -g REP='RAILS_ENV=production'
alias -g RET='RAILS_ENV=test'
alias -g RES='RAILS_ENV=staging'

# Rails aliases
alias rc='rails console'
alias rcs='rails console --sandbox'
alias rd='rails destroy'
alias rdb='rails dbconsole'
alias rgen='rails generate'
alias rgm='rails generate migration'
alias rgs='rails generate scaffold'
alias rgM='rails generate model'
alias rp='rails plugin'
alias rr='rails routes'
alias rrg='rails routes | grep'
alias ru='rails runner'
alias rs='rails server'
alias rsd='rails server --debugger'
alias rsp='rails server --port'

alias sprc='spring rails console'
alias srcs='spring rails console --sandbox'
alias srd='spring rails destroy'
alias srdb='spring rails dbconsole'
alias srg='spring rails generate'
alias srgm='spring rails generate migration'
alias srgs='spring rails generate scaffold'
alias srgM='spring rails generate model'
alias srp='spring rails plugin'
alias sru='spring rails runner'

alias Sprc='/usr/bin/env spring rails console'
alias Srcs='/usr/bin/env spring rails console --sandbox'
alias Srd='/usr/bin/env spring rails destroy'
alias Srdb='/usr/bin/env spring rails dbconsole'
alias Srg='/usr/bin/env spring rails generate'
alias Srgm='/usr/bin/env spring rails generate migration'
alias Srgs='/usr/bin/env spring rails generate scaffold'
alias SrgM='/usr/bin/env spring rails generate model'
alias Srp='/usr/bin/env spring rails plugin'
alias Sru='/usr/bin/env spring rails runner'

# Rake aliases
alias rdm='rake db:migrate'
alias rdms='rake db:migrate:status'
alias rdr='rake db:rollback'
alias rdc='rake db:create'
alias rds='rake db:seed'
alias rdd='rake db:drop'
alias rdrs='rake db:reset'
alias rdtc='rake db:test:clone'
alias rdtp='rake db:test:prepare'
alias rdmtc='rake db:migrate db:test:clone'
alias rdsl='rake db:schema:load'
alias rlc='rake log:clear'
alias rn='rake notes'
alias rt='rake test'
alias rmd='rake middleware'
alias rsts='rake stats'

alias srdm='spring rake db:migrate'
alias srdms='spring rake db:migrate:status'
alias srdr='spring rake db:rollback'
alias srdc='spring rake db:create'
alias srds='spring rake db:seed'
alias srdd='spring rake db:drop'
alias srdrs='spring rake db:reset'
alias srdtc='spring rake db:test:clone'
alias srdtp='spring rake db:test:prepare'
alias srdmtc='spring rake db:migrate db:test:clone'
alias srdsl='spring rake db:schema:load'
alias srlc='spring rake log:clear'
alias srn='spring rake notes'
alias srr='spring rake routes'
alias srrg='spring rake routes | grep'
alias srt='spring rake test'
alias srmd='spring rake middleware'
alias srsts='spring rake stats'

alias Srdm='/usr/bin/env spring rake db:migrate'
alias Srdms='/usr/bin/env spring rake db:migrate:status'
alias Srdr='/usr/bin/env spring rake db:rollback'
alias Srdc='/usr/bin/env spring rake db:create'
alias Srds='/usr/bin/env spring rake db:seed'
alias Srdd='/usr/bin/env spring rake db:drop'
alias Srdrs='/usr/bin/env spring rake db:reset'
alias Srdtc='/usr/bin/env spring rake db:test:clone'
alias Srdtp='/usr/bin/env spring rake db:test:prepare'
alias Srdmtc='/usr/bin/env spring rake db:migrate db:test:clone'
alias Srdsl='/usr/bin/env spring rake db:schema:load'
alias Srlc='/usr/bin/env spring rake log:clear'
alias Srn='/usr/bin/env spring rake notes'
alias Srr='/usr/bin/env spring rake routes'
alias Srrg='/usr/bin/env spring rake routes | grep'
alias Srt='/usr/bin/env spring rake test'
alias Srmd='/usr/bin/env spring rake middleware'
alias Srsts='/usr/bin/env spring rake stats'

# legacy stuff
# alias sstat='thin --stats "/thin/stats" start'
# alias sg='ruby script/generate'
# alias sd='ruby script/destroy'
# alias sp='ruby script/plugin'
# alias sr='ruby script/runner'
# alias ssp='ruby script/spec'
# alias sc='ruby script/console'
# alias sd='ruby script/server --debugger'

alias sp=spring
alias sr='spring rails'
alias sstop='spring stop'
alias sstatus='spring status'
alias sserver='spring server'
alias Sp='/usr/bin/env spring'
alias Sr='/usr/bin/env spring rails'
alias Sstop='/usr/bin/env spring stop'
alias Sstatus='/usr/bin/env spring status'
alias Sserver='/usr/bin/env spring server'

function remote_console() {
  /usr/bin/env ssh $1 "( cd $2 && ruby script/console production )"
}
