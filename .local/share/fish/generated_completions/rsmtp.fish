# rsmtp
# Autogenerated from man page /usr/share/man/man8/rsmtp.8.gz
complete -c rsmtp -l help -d 'This option causes Exim to output a few sentences stating what it is'
complete -c rsmtp -l version -d 'This option is an alias for -bV and causes version information to be displayed'
complete -c rsmtp -o Ac -d '-Am These options are used by Sendmail for selecting configuration files and …'
complete -c rsmtp -o 'B<type>' -d 'This is a Sendmail option for selecting 7 or 8 bit processing'
complete -c rsmtp -o bd -d 'This option runs Exim as a daemon, awaiting incoming SMTP connections'
complete -c rsmtp -o bdf -d 'This option has the same effect as -bd except that it never disconnects from …'
complete -c rsmtp -o be -d 'Run Exim in expansion testing mode'
complete -c rsmtp -o bem -d 'This option operates like -be except that it must be followed by the name of …'
complete -c rsmtp -o bF -d 'This option is the same as -bf except that it assumes that the filter being t…'
complete -c rsmtp -o bf -d 'This option runs Exim in user filter testing mode; the file is the filter fil…'
complete -c rsmtp -o bfd -d 'This sets the domain of the recipient address when a filter file is being tes…'
complete -c rsmtp -o bfl -d 'This sets the local part of the recipient address when a filter file is being…'
complete -c rsmtp -o bfp -d 'This sets the prefix of the local part of the recipient address when a filter…'
complete -c rsmtp -o bfs -d 'This sets the suffix of the local part of the recipient address when a filter…'
complete -c rsmtp -o bh -d 'This option runs a fake SMTP session as if from the given IP address, using t…'
complete -c rsmtp -o bhc -d 'This option operates in the same way as -bh, except that address verification…'
complete -c rsmtp -o bi -d 'Sendmail interprets the -bi option as a request to rebuild its alias file'
complete -c rsmtp -o bI:help -d 'We shall provide various options starting -bI: for querying Exim for informat…'
complete -c rsmtp -o bI:dscp -d 'This option causes Exim to emit an alphabetically sorted list of all recognis…'
complete -c rsmtp -o bI:sieve -d 'This option causes Exim to emit an alphabetically sorted list of all supporte…'
complete -c rsmtp -o bm -d 'This option runs an Exim receiving process that accepts an incoming, locally-…'
complete -c rsmtp -o bmalware -d 'This debugging option causes Exim to scan the given file or directory (depend…'
complete -c rsmtp -o bnq -d 'By default, Exim automatically qualifies unqualified addresses (those without…'
complete -c rsmtp -o bP -d 'If this option is given with no arguments, it causes the values of all Exim\'s…'
complete -c rsmtp -o bp -d 'This option requests a listing of the contents of the mail queue on the stand…'
complete -c rsmtp -o bpa -d 'This option operates like -bp, but in addition it shows delivered addresses t…'
complete -c rsmtp -o bpc -d 'This option counts the number of messages in the queue, and writes the total …'
complete -c rsmtp -o bpr -d 'This option operates like -bp, but the output is not sorted into chronologica…'
complete -c rsmtp -o bpra -d 'This option is a combination of -bpr and -bpa'
complete -c rsmtp -o bpru -d 'This option is a combination of -bpr and -bpu'
complete -c rsmtp -o bpu -d 'This option operates like -bp but shows only undelivered top-level addresses …'
complete -c rsmtp -o brt -d 'This option is for testing retry rules, and it must be followed by up to thre…'
complete -c rsmtp -o brw -d 'This option is for testing address rewriting rules, and it must be followed b…'
complete -c rsmtp -o bS -d 'This option is used for batched SMTP input, which is an alternative interface…'
complete -c rsmtp -o bs -d 'This option causes Exim to accept one or more messages by reading SMTP comman…'
complete -c rsmtp -o bt -d 'This option runs Exim in address testing mode, in which each argument is take…'
complete -c rsmtp -o bV -d 'This option causes Exim to write the current version number, compilation numb…'
complete -c rsmtp -o bv -d 'This option runs Exim in address verification mode, in which each argument is…'
complete -c rsmtp -o bvs -d 'This option acts like -bv, but verifies the address as a sender rather than a…'
complete -c rsmtp -o bw -d 'This option runs Exim as a daemon, awaiting incoming SMTP connections, simila…'
complete -c rsmtp -s C -d 'This option causes Exim to find the runtime configuration file from the given…'
complete -c rsmtp -o 'D<macro>' -d 'This option can be used to override macro definitions in the configuration fi…'
complete -c rsmtp -o 'd<debug' -d 'This option causes debugging information to be written to the standard error …'
complete -c rsmtp -o 'dd<debug' -d 'This option behaves exactly like -d except when used on a command that starts…'
complete -c rsmtp -o dropcr -d 'This is an obsolete option that is now a no-op'
complete -c rsmtp -s E -d 'This option specifies that an incoming message is a locally-generated deliver…'
complete -c rsmtp -o ex -d 'There are a number of Sendmail options starting with -oe which seem to be cal…'
complete -c rsmtp -s F -d 'This option sets the sender\'s full name for use when a locally-generated mess…'
complete -c rsmtp -s f -d 'This option sets the address of the envelope sender of a locally-generated me…'
complete -c rsmtp -s G -d 'This option is equivalent to an ACL applying: '
complete -c rsmtp -s h -d 'This option is accepted for compatibility with Sendmail, but has no effect'
complete -c rsmtp -s i -d 'This option, which has the same effect as -oi, specifies that a dot on a line…'
complete -c rsmtp -s L -d 'This option is equivalent to setting syslog_processname in the config file an…'
complete -c rsmtp -s M -d 'This option requests Exim to run a delivery attempt on each message in turn'
complete -c rsmtp -o Mar -d 'This option requests Exim to add the addresses to the list of recipients of t…'
complete -c rsmtp -o MC -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCA -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCD -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCd -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCG -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCK -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCL -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCP -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCp -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCQ -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCq -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCS -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCT -d 'This option is not intended for use by external callers'
complete -c rsmtp -o MCr -d '-MCs <SNI> These options are not intended for use by external callers'
complete -c rsmtp -o MCt -d 'This option is not intended for use by external callers'
complete -c rsmtp -o Mc -d 'This option requests Exim to run a delivery attempt on each message, in turn,…'
complete -c rsmtp -o Mes -d 'This option requests Exim to change the sender address in the message to the …'
complete -c rsmtp -o Mf -d 'This option requests Exim to mark each listed message as "frozen"'
complete -c rsmtp -o Mg -d 'This option requests Exim to give up trying to deliver the listed messages, i…'
complete -c rsmtp -o MG -d 'This option requests that each listed message be moved from its current queue…'
complete -c rsmtp -o Mmad -d 'This option requests Exim to mark all the recipient addresses in the messages…'
complete -c rsmtp -o Mmd -d 'This option requests Exim to mark the given addresses as already delivered ("…'
complete -c rsmtp -o Mrm -d 'This option requests Exim to remove the given messages from the queue'
complete -c rsmtp -o Mset -d 'This option is useful only in conjunction with -be (that is, when testing str…'
complete -c rsmtp -o Mt -d 'This option requests Exim to "thaw" any of the listed messages that are "froz…'
complete -c rsmtp -o Mvb -d 'This option causes the contents of the message body (-D) spool file to be wri…'
complete -c rsmtp -o Mvc -d 'This option causes a copy of the complete message (header lines plus body) to…'
complete -c rsmtp -o Mvh -d 'This option causes the contents of the message headers (-H) spool file to be …'
complete -c rsmtp -o Mvl -d 'This option causes the contents of the message log spool file to be written t…'
complete -c rsmtp -s m -d 'This is a synonym for -om that is accepted by Sendmail (https://docs. oracle'
complete -c rsmtp -s N -d 'This is a debugging option that inhibits delivery of a message at the transpo…'
complete -c rsmtp -s n -d 'This option is interpreted by Sendmail to mean "no aliasing"'
complete -c rsmtp -s O -d 'This option is interpreted by Sendmail to mean set option'
complete -c rsmtp -o oA -d 'This option is used by Sendmail in conjunction with -bi to specify an alterna…'
complete -c rsmtp -o oB -d 'This is a debugging option which limits the maximum number of messages that c…'
complete -c rsmtp -o odb -d 'This option applies to all modes in which Exim accepts incoming messages, inc…'
complete -c rsmtp -o odf -d 'This option requests "foreground" (synchronous) delivery when Exim has accept…'
complete -c rsmtp -o odi -d 'This option is synonymous with -odf'
complete -c rsmtp -o odq -d 'This option applies to all modes in which Exim accepts incoming messages, inc…'
complete -c rsmtp -o odqs -d 'This option is a hybrid between -odb/-odi and -odq'
complete -c rsmtp -o oee -d 'If an error is detected while a non-SMTP message is being received (for examp…'
complete -c rsmtp -o oem -d 'This is the same as -oee, except that Exim always exits with a non-zero retur…'
complete -c rsmtp -o oep -d 'If an error is detected while a non-SMTP message is being received, the error…'
complete -c rsmtp -o oeq -d 'This option is supported for compatibility with Sendmail, but has the same ef…'
complete -c rsmtp -o oew -d 'This option is supported for compatibility with Sendmail, but has the same ef…'
complete -c rsmtp -o oi -d 'This option, which has the same effect as -i, specifies that a dot on a line …'
complete -c rsmtp -o oitrue -d 'This option is treated as synonymous with -oi'
complete -c rsmtp -o oMa -d 'A number of options starting with -oM can be used to set values associated wi…'
complete -c rsmtp -o oMaa -d 'See -oMa above for general remarks about the -oM options'
complete -c rsmtp -o oMai -d 'See -oMa above for general remarks about the -oM options'
complete -c rsmtp -o oMas -d 'See -oMa above for general remarks about the -oM options'
complete -c rsmtp -o oMi -d 'See -oMa above for general remarks about the -oM options'
complete -c rsmtp -o oMm -d 'See -oMa above for general remarks about the -oM options'
complete -c rsmtp -o oMr -d 'See -oMa above for general remarks about the -oM options'
complete -c rsmtp -o oMs -d 'See -oMa above for general remarks about the -oM options'
complete -c rsmtp -o oMt -d 'See -oMa above for general remarks about the -oM options'
complete -c rsmtp -o om -d 'In Sendmail, this option means "me too", indicating that the sender of a mess…'
complete -c rsmtp -o oo -d 'This option is ignored'
complete -c rsmtp -o oP -d 'This option is useful only in conjunction with -bd or -q with a time value'
complete -c rsmtp -o oPX -d 'This option is not intended for general use'
complete -c rsmtp -o or -d 'This option sets a timeout value for incoming non-SMTP messages'
complete -c rsmtp -o os -d 'This option sets a timeout value for incoming SMTP messages'
complete -c rsmtp -o ov -d 'This option has exactly the same effect as -v'
complete -c rsmtp -o oX -d 'This option is relevant only when the -bd (start listening daemon) option is …'
complete -c rsmtp -o oY -d 'This option controls the creation of an inter-process communications endpoint…'
complete -c rsmtp -o pd -d 'This option applies when an embedded Perl interpreter is linked with Exim'
complete -c rsmtp -o ps -d 'This option applies when an embedded Perl interpreter is linked with Exim'
complete -c rsmtp -o 'p<rval>:<sval>' -d 'For compatibility with Sendmail, this option is equivalent to '
complete -c rsmtp -s q -d 'This option is normally restricted to admin users'
complete -c rsmtp -o 'q<qflags>' -d 'The -q option may be followed by one or more flag letters that change its beh…'
complete -c rsmtp -o qq -d 'An option starting with -qq requests a two-stage queue run'
complete -c rsmtp -o qi -d 'If the i flag is present, the queue runner runs delivery processes only for t…'
complete -c rsmtp -o qf -d 'If one f flag is present, a delivery attempt is forced for each non-frozen me…'
complete -c rsmtp -o qff -d 'If ff is present, a delivery attempt is forced for every message, whether fro…'
complete -c rsmtp -o ql -d 'The l (the letter "ell") flag specifies that only local deliveries are to be …'
complete -c rsmtp -o 'q<qflags><time>' -d 'When a time value is present, the -q option causes Exim to run as a daemon, s…'
complete -c rsmtp -o 'qR<rsflags>' -d 'This option is synonymous with -R.  It is provided for Sendmail compatibility'
complete -c rsmtp -o 'qS<rsflags>' -d 'This option is synonymous with -S'
complete -c rsmtp -o 'R<rsflags>' -d 'The <rsflags> may be empty, in which case the white space before the string i…'
complete -c rsmtp -s r -d 'This is a documented (for Sendmail) obsolete alternative name for -f'
complete -c rsmtp -o 'S<rsflags>' -d 'This option acts like -R except that it checks the string against each messag…'
complete -c rsmtp -o Tqt -d 'This is an option that is exclusively for use by the Exim testing suite'
complete -c rsmtp -s t -d 'When Exim is receiving a locally-generated, non-SMTP message on its standard …'
complete -c rsmtp -o ti -d 'This option is exactly equivalent to -t -i'
complete -c rsmtp -o tls-on-connect -d 'This option is available when Exim is compiled with TLS support'
complete -c rsmtp -s U -d 'Sendmail uses this option for "initial message submission", and its documenta…'
complete -c rsmtp -s v -d 'This option causes Exim to write information to the standard error stream, de…'
complete -c rsmtp -s x -d 'AIX uses -x for a private purpose ("mail from a local mail program has Nation…'
complete -c rsmtp -s X -d 'This option is interpreted by Sendmail to cause debug information to be sent …'

