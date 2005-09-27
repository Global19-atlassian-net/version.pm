#!perl -w
package version;

use 5.005_03;
use strict;

require Exporter;
use vars qw(@ISA $VERSION $CLASS @EXPORT);

@ISA = qw(Exporter);

@EXPORT = qw(qv);

$VERSION = "0.49"; 

$CLASS = 'version';

eval "use version::vxs 0.49;";

if ( $@ ) # don't have the XS version installed
{
    eval "use version::vpp $VERSION;";
    die "$@" if ( $@ );
    push @ISA, "version::vpp";
    *qv = \&version::vpp::qv;
}
else # use XS module
{
    push @ISA, "version::vxs";
    *qv = \&version::vxs::qv;
}

# Preloaded methods go here.

1;
