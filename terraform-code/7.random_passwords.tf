resource "random_password" "server_passwords" {
  count            = 4
  length           = 16
  min_upper        = 4
  min_lower        = 4
  min_numeric      = 4
  min_special      = 4
  override_special = "!#$^*"
}
