# --
# Copyright (C) 2012 Znuny GmbH, https://znuny.com/
# Copyright (C) (2016) (Sjoerd de Bruin) (https://github.com/sjoerddebruin)
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nl_ZnunyQuickClose;

use strict;
use warnings;

use utf8;

sub Data {
    my $Self = shift;

    $Self->{Translation}->{'Quick Close'} = 'Snel sluiten';

    return 1;
}

1;
