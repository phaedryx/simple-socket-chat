sys     = require 'util'
{spawn} = require 'child_process'

task "watch", "watch and compile coffeescript files when modified", ->
  src = 'src/coffeescripts'
  dst = 'public/javascripts'

  sys.puts 'Starting coffeescript watcher...'
  sys.puts "compiling from #{src} to #{dst}"

  watcher = spawn 'coffee', ['-o', dst, '-cw', src]
  [watcher].forEach (child) ->
    child.stdout.on 'data', (data) ->
      sys.print data
    child.stderr.on 'data', (data) ->
      sys.print data
