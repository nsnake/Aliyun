package Aliyun::Method::FcIotQrycard;
use 5.010;
use Data::Dumper qw/Dumper/;
#阿里大于查询终端信息

sub new {
    my $class = shift;
    $class = (ref $class) || $class || __PACKAGE__;
    my $self = bless {}, $class;
    $self->{'params'} = {
        'method' => 'alibaba.aliqin.fc.iot.qrycard',
    };
    return $self;
}

#外部计费来源
sub set_bill_source {
    $_[0]->{'params'}->{'bill_source'} = $_[1];
}

#外部计费号
sub set_bill_real {
    $_[0]->{'params'}->{'bill_real'} = $_[1];
}

#ICCID
sub set_iccid {
    $_[0]->{'params'}->{'iccid'} = $_[1];
}

sub get_params {
    return $_[0]->{'params'};
}

1;

