#Next block creates a hard-coded admin user
admin_user = User.new(
  email:    'sbarron@fundacionidea.org.mx',
  password: 'helloworld',
  role:     'admin'
)
admin_user.skip_confirmation!

editor_user = User.new(
  email:    'mlopez@fundacionidea.org.mx',
  password: 'helloworld',
  role:     'editor'
)
editor_user.skip_confirmation!

admin_user.save
editor_user.save

puts "Seed finished"
puts "#{User.count} users created"
