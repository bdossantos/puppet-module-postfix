class postfix(
  $mailbox_size_limit = 0,
  $recipient_delimiter = '+',
  $inet_interfaces = 'all',
  $inet_protocols = 'ipv4',
  $smtpd_use_tls = 'yes',
  $smtpd_tls_auth_only = 'no',
  $smtpd_sasl_auth_enable = 'yes',
  $authentication_mechanisms = 'shadow'
  ) {

  include postfix::packages,
          postfix::configure,
          postfix::service
}
