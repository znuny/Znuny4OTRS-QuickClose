# --
# Kernel/Language/nl_Znuny4OTRSQuickClose.pm - the Dutch translation of the texts of Znuny4OTRS-QuickClose
# Copyright (C) 2012-2016 Znuny GmbH, http://znuny.com/
# Copyright (C) (2016) (Sjoerd de Bruin) (https://github.com/sjoerddebruin)
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nl_Znuny4OTRSQuickClose;

use strict;
use warnings;

use utf8;

sub Data {
    my $Self = shift;

    $Self->{Translation}->{'Quick Close'} = 'Snel sluiten';

    return 1;
}

1;