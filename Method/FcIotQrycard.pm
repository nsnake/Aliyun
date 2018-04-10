package Aliyun::Method::FcIotQrycard;
use 5.010;
use Data::Dumper qw/Dumper/;
use version;
our $VERSION = 0.1;
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

=encoding utf8

=head1 NAME

Aliyun::Method::FcSmsNumSend- 阿里云SDK方法

=head1 SYNOPSIS


=head1 DESCRIPTION

L<Aliyun::Method::FcSmsNumSend> 阿里大于发送短信

=head1 ATTRIBUTES

=head1 METHODS

=head2 set_rec_num
set_rec_num('phone_no')
设置接收号码

=head2 set_sms_free_sign_name
set_sms_free_sign_name()
设置短信签名

=head2 set_sms_template_code
set_sms_template_code()
设置短信模板id

=head2 set_sms_param
set_sms_param()
设置短信内容替换

=head2 get_params
%hash = get_params()
获取提交的参数。该方法必须实现

=cut
1;

