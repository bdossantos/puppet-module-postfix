class postfix::configure {

  File {
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package['postfix', 'sasl2-bin'],
  }

  file { '/etc/postfix/main.cf':
    ensure  => 'present',
    content => template('postfix/etc/postfix/main.cf.erb');
  }

  file { '/etc/postfix/sasl/smtpd.conf':
    ensure  => 'present',
    content => template('postfix/etc/postfix/sasl/smtpd.conf.erb');
  }

  file { '/etc/default/saslauthd':
    ensure  => 'present',
    content => template('postfix/etc/default/saslauthd.erb');
  }

  file { '/var/spool/postfix/var/run/saslauthd':
    ensure  => 'directory',
    group   => 'sasl',
    mode    => '710',
    require => Service['saslauthd']
  }

  user { 'postfix':
    ensure      => 'present',
    managehome  => false,
    groups      => ['postfix', 'sasl'],
    require     => Package['postfix', 'sasl2-bin']
  }
}