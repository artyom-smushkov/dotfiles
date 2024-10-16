# tap-parser
# Autogenerated from man page /usr/share/man/man1/tap-parser.1.gz
complete -c tap-parser -s j -l json -d 'Output event data as JSON with the specified indentation (default=2)'
complete -c tap-parser -s t -l tap -d 'Output data as reconstituted TAP based on parsed results'
complete -c tap-parser -s l -l lines -d 'Output each parsed line as it is recognized by the parser'
complete -c tap-parser -s b -l bail -d 'Emit a `Bail out!` at the first failed test point encountered'
complete -c tap-parser -s B -l no-bail -d 'Do not bail out at the first failed test point encountered (Default)'
complete -c tap-parser -s f -l flat -d 'Flatten all assertions to the top level parser'
complete -c tap-parser -s F -l no-flat -d 'Do not flatten all assertions to the top level parser (Default)'
complete -c tap-parser -s w -l ignore-all-whitespace -d 'Skip over blank lines outside of YAML blocks'
complete -c tap-parser -s o -l omit-version -d 'Ignore the `TAP version 13` line at the start of tests'
complete -c tap-parser -l strict -d 'Run the parser in strict mode'
complete -c tap-parser -l no-strict -d 'Do not run the parser in strict mode'
complete -c tap-parser -s s -l silent -d 'Do not print output, just exit success/failure based on TAP stream'

