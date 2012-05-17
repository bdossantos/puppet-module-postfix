class postfix::service($ensure = 'running') {

    service {
        'postfix':
        ensure      => $ensure,
        enable      => true,
        subscribe   => File['/etc/postfix/main.cf', '/etc/postfix/sasl/smtpd.conf'],
        require     => Package['postfix'];

        'saslauthd':
        ensure      => $ensure,
        enable      => true,
        subscribe   => File['/etc/default/saslauthd'],
        require     => Package['sasl2-bin'];
    }
}