# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Admin.create(email: 'admin@example.com', password: 'admin123')

s = Staff.create(first_name: 'usman', last_name: 'staff1', email: 'usman@staff1.com')
s1 = Staff.create(first_name: 'bilal', last_name: 'staff2', email: 'bilal@staff2.com')
s2 = Staff.create(first_name: 'nasir', last_name: 'staff3', email: 'nasir@staff3.com')


d = Division.create(main: 'hair')
d1 = Division.create(main: 'Full Body Wax')
d2 = Division.create(main: 'facial')

s_d = StaffDivision.create(staff_id: s.id, division_id: d.id)
s_d = StaffDivision.create(staff_id: s.id, division_id: d1.id)
s_d = StaffDivision.create(staff_id: s1.id, division_id: d1.id)
s_d = StaffDivision.create(staff_id: s2.id, division_id: d.id)


user = User.create(first_name: 'user1', last_name: 'user1', email: 'user1@u.com')
user1 = User.create(first_name: 'user2', last_name: 'user2', email: 'user2@u.com')
user2 = User.create(first_name: 'user3', last_name: 'use3', email: 'user3@u.com')
user3 = User.create(first_name: 'user4', last_name: 'use4', email: 'user4@u.com')
user4 = User.create(first_name: 'user5', last_name: 'use5', email: 'user5@u.com')


a1 = Appointment.create(user_id: user.id, appointment_date: '01-01-2016', appointment_time: Time.now )
a1 = Appointment.create(user_id: user.id, appointment_date: '01-01-2016', appointment_time: Time.now )
a1 = Appointment.create(user_id: user1.id, appointment_date: '01-01-2016', appointment_time: Time.now )
a1 = Appointment.create(user_id: user3.id, appointment_date: '01-01-2016', appointment_time: Time.now )
a1 = Appointment.create(user_id: user4.id, appointment_date: '01-01-2016', appointment_time: Time.now )
