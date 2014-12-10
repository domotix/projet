# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Device.create(
    name: "MonDevice",
    status: false
  )

  Device.create(
    name: "MonDevice2",
    status: true
  )

  User.create(
    name: "Laurent2",
  )

  User.create(
    name: "Laurent3",
  )