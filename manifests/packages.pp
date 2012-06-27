class postfix::packages {

  package { ['postfix', 'sasl2-bin']:
    ensure  => 'installed'
  }
}