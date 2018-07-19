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

doc1 = Publication.new(
    title: "México Compacto",
    description: "Esta publicación revisa los conceptos internacionales de ciudad compacta y densificación urbana a la vez que establece siete condiciones para que una estrategia de este tipo se ponga en práctica de manera positiva en México y, particularmente, en la Ciudad de México. Una de estas condiciones es responder a la informalidad y los asentamientos irregulares. Otra condición es promover la participación pública en el desarrollo urbano.",
    tag: "Desarrollo Urbano",
    pub_date: "2016-06-14",
    user: User.order("RANDOM()").first
)
doc1.image.attach(
   io: File.open('app/assets/images/MexicoCompactoPortada.jpg'),
   filename: 'MexicoCompactoPortada.jpg',
   content_type: 'image/jpeg'
)
doc1.document.attach(
   io: File.open('app/assets/images/MexicoCompactoDocumento.pdf'),
   filename: 'MexicoCompactoDocumento.pdf',
   content_type: 'application/pdf'
)
doc1.save


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Publication.count} publications created"
