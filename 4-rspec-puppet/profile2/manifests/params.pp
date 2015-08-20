class profile::params {
  case $::osfamily {
    'RedHat' : {
      $packages = ["mtr","htop","openssh-clients","openssh-server","screen"]
      $services = ["sshd","rsyslog"]
      $users    = ["ncorrare"]
      $groups   = ["wheel"]
    }
    'Debian' : {
      $packages = ["mtr","htop","openssh-client","openssh-server","screen"]
      $services = ["ssh","rsyslog"]
      $users    = ["ncorrare"]
      $groups   = ["wheel"]
    }
  }
}
