# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

banks = Bank.create([{ name: "Addiko Bank d.d.", pid: 14036333877 },
                     { name: "Agram banka d.d.", pid: 70663193635 },
                     { name: "Banka Kovanica d.d.", pid: 33039197637 },
                     { name: "Croatia banka d.d.", pid: 32247795989 }])

users = User.create!([{ email: "admin@gmail.com",
                        password: "admin1",
                        password_confirmation: "admin1",
                        first_name: "admin",
                        last_name: "admin",
                        business_name: "admin",
                        address: "admin",
                        post_number: 10000,
                        city: "admin",
                        pid: 11111111111,
                        iban: 1111111,
                        business_description: "admin",
                        bank: Bank.first,
                        admin?: true,
                        activated?: true},
                      { email: "user@gmail.com",
                        password: "user11",
                        password_confirmation: "user11",
                        first_name: "user",
                        last_name: "user",
                        business_name: "user",
                        address: "Street",
                        post_number: 10000,
                        city: "Zagreb",
                        pid: 11111111112,
                        iban: "HR1723600001101234565",
                        business_description: "A translating business",
                        bank: Bank.first,
                        admin?: false,
                        activated?: true}])
