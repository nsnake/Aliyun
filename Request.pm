package Aliyun::Request;
use 5.010;
use strict;
use warnings;
use Mojo::UserAgent;
use Aliyun::AuthV2;
use Data::Dumper qw/Dumper/;
use version;
our $VERSION = 0.2;

sub new {
    my $class = shift;
    $class = (ref $class) || $class || __PACKAGE__;
    my $self = bless {}, $class;
    $self->{'http_head'} = {
        'Accept'                    => 'application/json,*/*;q=0.8,',
        'Accept-Encoding'           => 'deflate',
        'Accept-Language'           => 'zh-CN',
        'Cache-Control'             => 'no-cache',
        'Connection'                => 'keep-alive',
        'DNT'                       => '1',
        'Pragma'                    => 'no-cache',
        'Upgrade-Insecure-Requests' => '1',
        'User-Agent'                => "perl-Aliyun-Request V:$VERSION"
    };
    return $self;
}

#请求阿里API并返回结果
#param: Aliyun::AuthV2对象
#param: Aliyun::Method对象
#param: 回调函数
sub get {
    my ($self, $auth, $method, $cb) = @_;
    my $url = $auth->get_url($method->get_params());
    my $ua = Mojo::UserAgent->new(max_redirects => 5);
    my $delay = Mojo::IOLoop->delay;
    $ua->get($url => $self->{'http_head'} => sub {
            my ($mojo_ua, $tx) = @_;
            my $result = {};
            if (my $res = $tx->success) {
                $result = $res->body;
            }
            else {
                my $err = $tx->error;
                $result = { 'error_response' => {
                        'code' => $err->{code} ? $err->{code} : '9999',
                        'msg'  => $err->{message},
                        'sub_code' =>  $err->{message}
                    } };
            }
            if (ref $cb eq ref sub {}) {
                $cb->($result);
            }
        });
    $delay->wait;
}


__DATA__
#!/usr/bin/perl
use 5.010;
use Aliyun::AuthV2;
use Aliyun::Request;
use Aliyun::Method::FcSmsNumSend;
use Aliyun::Method::FcIotQrycard;
use Data::Dumper qw/Dumper/;

my $auth = Aliyun::AuthV2->new();
$auth->set_appkey('你自己的key');
$auth->set_secretkey('你自己的秘钥');

my $method = Aliyun::Method::FcSmsNumSend->new();
$method->set_rec_num('13800138000');
$method->set_sms_free_sign_name('短信签名');
$method->set_sms_template_code('短信模板id');
$method->set_sms_param('{"rain":"下雨","temper":"18"}');

my $method2 = Aliyun::Method::FcIotQrycard->new();
$method2->set_bill_source('ICCID');
$method2->set_bill_real('123123');
$method2->set_iccid('123123');


my $request = Aliyun::Request->new();
$request->get($auth, $method, sub {
        say Dumper $_[0];
    });

$request->get($auth, $method2, sub {
        say Dumper $_[0];
    });