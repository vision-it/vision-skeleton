# Class: vision_skeleton
# ===========================
#
# Parameters
# ----------
#
# Examples
# --------
#
# @example
# contain ::vision_skeleton
#

class vision_skeleton (

  String $param,
  String $param_test

) {

  # This is just a test to see if the Hiera data lookup works - can be deleted
  file { $param:
    ensure  => present,
    path    => '/root/hello.common',
    content => $param,
  }

  file { $param_test:
    ensure  => present,
    path    => '/root/hello.testing',
    content => $param_test,
  }

}
