package Aliyun::Method::FcSmsNumSend;
use 5.010;
use Data::Dumper qw/Dumper/;
#阿里大于短信发送

sub new {
    my $class = shift;
    $class = (ref $class) || $class || __PACKAGE__;
    my $self = bless {}, $class;
    $self->{'params'} = {
        'method'   => 'alibaba.aliqin.fc.sms.num.send',
        'sms_type' => 'normal',
    };
    return $self;
}

#设置接收号码
sub set_rec_num {
    $_[0]->{'params'}->{'rec_num'} = $_[1];
}

#设置短信签名
sub set_sms_free_sign_name {
    $_[0]->{'params'}->{'sms_free_sign_name'} = $_[1];
}

#设置模板id
sub set_sms_template_code {
    $_[0]->{'params'}->{'sms_template_code'} = $_[1];
}

#设置内容替换
sub set_sms_param {
    $_[0]->{'params'}->{'sms_param'} = $_[1];
}

sub get_params {
    return $_[0]->{'params'};
}

1;

