#!/bin/bash
function usage {
	cat <<-END >&2
	USAGE: test_getops.sh -a -b2 -c -d2
	END
	exit
}

opt_a=0
opt_b=0
opt_c=0
opt_d=0

arg_b=0
arg_d=0
#OPTARG is used get current option argument
echo $OPTIND
while getopts ab:cd: opt
do
	case $opt in
		a)	opt_a=1; echo $OPTIND;;
		b)	opt_b=1; arg_b=$OPTARG; echo $OPTIND;;
		c)	opt_c=1; echo $OPTIND;;
		d)	opt_d=1; arg_d=$OPTARG; echo $OPTIND;;
	esac
done

echo "opt_a $opt_a"
echo "opt_b $opt_b arg_b $arg_b"
echo "opt_c $opt_c"
echo "opt_d $opt_d arg_d $arg_d"
echo $OPTIND

shift $(( $OPTIND - 1 ))
(($#)) || usage
