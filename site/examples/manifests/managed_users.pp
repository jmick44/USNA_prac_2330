# example declarations for the defined type exercise 
class examples::managed_users($password) {
  system::managed_user { ['aaron', 'kaitlin', 'jose']:
    password => $password,
  }
}
