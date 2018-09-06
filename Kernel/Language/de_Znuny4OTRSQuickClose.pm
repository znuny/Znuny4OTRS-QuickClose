# --
# Kernel/Language/de_Znuny4OTRSQuickClose.pm - the german translation of the texts of Znuny4OTRS-QuickClose
# Copyright (C) 2012-2018 Znuny GmbH, http://znuny.com/
# Copyright (C) (2014) (Denny Bresch) (dennybresch@gmail.com) (https://github.com/dennybresch)
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_Znuny4OTRSQuickClose;

use strict;
use warnings;

use utf8;

sub Data {
    my $Self = shift;

    $Self->{Translation}->{'Quick Close'} = 'sofort schließen';

    return 1;
}

1;
