# rails command wrapper
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

alias rails='_rails_command'
compdef _rails_command=rails

# rake command wrapper
function _rake_command () {
  if [ -e "bin/stubs/rake" ]; then
    bin/stubs/rake $@
  elif [ -e "bin/rake" ]; then
    bin/rake $@
  elif type bundle &> /dev/null && [[ -e "Gemfile" || -e "gems.rb" ]]; then
    bundle exec rake $@
  else
    command rake $@
  fi
}

alias rake='_rake_command'
compdef _rake_command=rake

# Log aliases
alias devlog='tail -f log/development.log'
alias prodlog='tail -f log/production.log'
alias testlog='tail -f log/test.log'

# Environment settings
alias -g RED='RAILS_ENV=development'
alias -g REP='RAILS_ENV=production'
alias -g RET='RAILS_ENV=test'
alias -g RES='RAILS_ENV=staging'

# Rails aliases
alias rc='rails console'
alias rcs='rails console --sandbox'
alias rd='rails destroy'
alias rdb='rails dbconsole'
alias rdc='rails db:create'
alias rdd='rails db:drop'
alias rdm='rails db:migrate'
alias rdmd='rails db:migrate:down'
alias rdmr='rails db:migrate:redo'
alias rdms='rails db:migrate:status'
alias rdmtc='rails db:migrate db:test:clone'
alias rdmu='rails db:migrate:up'
alias rdr='rails db:rollback'
alias rdrs='rails db:reset'
alias rds='rails db:seed'
alias rdsl='rails db:schema:load'
alias rdtc='rails db:test:clone'
alias rdtp='rails db:test:prepare'
alias rgen='rails generate'
alias rgm='rails generate migration'
alias rgs='rails generate scaffold'
alias rgM='rails generate model'
alias rlc='rails log:clear'
alias rmd='rails middleware'
alias rn='rails notes'
alias rp='rails plugin'
alias rr='rails routes'
alias rrg='rails routes | grep'
alias rs='rails server'
alias rsb='rails server --bind'
alias rsd='rails server --debugger'
alias rsp='rails server --port'
alias rsts='rails stats'
alias rt='rails test'
alias rta='rails test:all'
alias ru='rails runner'

# Foreman aliases
alias fmns='foreman start'

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
alias rkdc='rake db:create'
alias rkdd='rake db:drop'
alias rkdm='rake db:migrate'
alias rkdmd='rake db:migrate:down'
alias rkdmr='rake db:migrate:redo'
alias rkdms='rake db:migrate:status'
alias rkdmtc='rake db:migrate db:test:clone'
alias rkdmu='rake db:migrate:up'
alias rkdr='rake db:rollback'
alias rkdrs='rake db:reset'
alias rkds='rake db:seed'
alias rkdsl='rake db:schema:load'
alias rkdtc='rake db:test:clone'
alias rkdtp='rake db:test:prepare'
alias rklc='rake log:clear'
alias rkmd='rake middleware'
alias rkn='rake notes'
alias rksts='rake stats'
alias rkt='rake test'

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
