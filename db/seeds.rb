#Next block creates a hard-coded admin user
admin = User.new(
  email:    'sbarron@fundacionidea.org.mx',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save

puts "Seed finished"
puts "#{User.count} users created"
