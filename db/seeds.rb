puts "Initializing data loading process"

Invoice.delete_all
ServiceUsage.delete_all
Reservation.delete_all
Service.delete_all
Room.delete_all
Guest.delete_all

puts "Loading guests in table"

guests = Guest.create!([
  { first_name: "Andres", last_name: "Howard", email: "aihoward@miuandes.cl", phone: "900001111", document_id: "99999999k" },
  { first_name: "Elvis", last_name: "Tec", email: "test@test.com", phone: "912345678", document_id: "141414142" }
])

puts "Loading Rooms"

rooms = Room.create!([
  { number: "101", room_type: 1, price: 1000, status: 1 },
  { number: "201", room_type: 2, price: 2000, status: 2 },
  { number: "301", room_type: 3, price: 3000, status: 3 }
])

puts "Loading Services"

services = Service.create!([
  { name: "Laundry", price: 20, is_active: true },
  { name: "Spa", price: 15, is_active: false }
])

puts "Loading Reservations"

reservations = Reservation.create!([
  { code: "code1", guest_id: guests.first.id, room_id: rooms.first.id, check_in: Date.new(2025, 9, 1), check_out: Date.new(2025, 9, 15), status: 1, adults: 1, children: 2 },
  { code: "code2", guest_id: guests.last.id, room_id: rooms.last.id, check_in: Date.new(1995, 12, 21), check_out: Date.new(2025, 12, 31), status: 1, adults: 1 }
])

puts "Loading ServiceUsages"

service_usages = ServiceUsage.create!([
  { reservation_id: reservations.first.id, service_id: services.first.id, quantity: 2, used_at: DateTime.new(2025, 9, 10, 10, 0), note: "2 Shirts and 4 pants" },
  { reservation_id: reservations.last.id, service_id: services.last.id, quantity: 1, used_at: DateTime.new(2004, 10, 12, 5), note: "1 hour session" }
])

puts "Loading Invoices"
nights_subtotal1 = 15 * rooms.first.price
services_subtotal1 = services.first.price * 2
tax1 = (nights_subtotal1 + services_subtotal1)*19/100
total1 = nights_subtotal1 + services_subtotal1 + tax1

nights_subtotal2 = 10968 * rooms.last.price
services_subtotal2 = services.last.price
tax2 = (nights_subtotal2 + services_subtotal2)*19/100
total2 = nights_subtotal2 + services_subtotal2 + tax2

invoices = Invoice.create!([
  { reservation_id: reservations.first.id,
    nights_subtotal: nights_subtotal1,
    services_subtotal: services_subtotal1,
    tax: tax1,
    total: total1,
    issued_at: DateTime.new(2025, 9, 15, 5, 15),
    status: 1 },

    { reservation_id: reservations.last.id,
    nights_subtotal: nights_subtotal2,
    services_subtotal: services_subtotal2,
    tax: tax2,
    total: total2,
    issued_at: DateTime.new(2025, 12, 31, 12, 0), status: 1 }
  ])
