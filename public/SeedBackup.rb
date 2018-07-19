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

doc2 = Publication.new(
    title: "Un llamado a la corresponsabilidad",
    description: "Este documento analiza cómo fomentar el manejo corresponsable de la diabetes y otros padecimientos. Fue elaborado por la “Comisión para fortalecer la corresponsabilidad de los usuarios y proveedores en el primer nivel de atención a la salud: una aproximación a la diabetes tipo 2 y otras enfermedades crónicas no transmisibles en Latinoamérica.",
    tag: "Salud Pública",
    pub_date: "2017-06-01",
    user: admin_user
)
=begin
doc2.image.attach(
   io: File.open('app/assets/images/CorresponsabilidadPortada.png'),
   filename: 'CorresponsabilidadPortada.png',
   content_type: 'image/jpeg'
)
doc2.document.attach(
   io: File.open('app/assets/images/CorresponsabilidadDocumento.pdf'),
   filename: 'CorresponsabilidadDocumento.pdf',
   content_type: 'application/pdf'
)
=end
doc2.save

doc3 = Publication.new(
    title: "Emprendedores Mexicanos",
    description: "Este estudio financiado por USAID provee un panorama del contexto de la innovación en México a partir del análisis de 35 empresas innovadoras y la elaboración de entrevistas con sus dueños.",
    tag: "PYMEs",
    pub_date: "2010-05-14",
    user: admin_user
)
=begin
doc3.image.attach(
   io: File.open('app/assets/images/EmprendedoresMexicanosPortada.jpg'),
   filename: 'EmprendedoresMexicanosPortada.jpg',
   content_type: 'image/jpeg'
)
doc3.document.attach(
   io: File.open('app/assets/images/EmprendedoresMexicanosDocumento.pdf'),
   filename: 'EmprendedoresMexicanosDocumento.pdf',
   content_type: 'application/pdf'
)
=end
doc3.save

doc4 = Publication.new(
    title: "Resiliencia urbana: una guía breve de política",
    description: "La resiliencia urbana es un concepto que se ha puesto de “moda”, utilizándose en el desarrollo de ideas para políticas de todo tipo. Usar el término de manera tan flexible puede resultar tan útil como confuso, sobre todo para quienes necesitan definir estrategias de resiliencia en contextos locales. Esta guía ofrece a las autoridades locales en América Latina una idea más clara para comenzar a utilizar la resiliencia urbana como marco conceptual para las políticas de planeación urbana. Las recomendaciones presentadas incluyen actividades como: desarrollar datos locales, colaborar con actores clave (incluso aquellos resistentes al cambio), intervenir con una visión estratégica a largo plazo, y dar apertura al aprendizaje continuo.",
    tag: "Desarrollo Urbano",
    pub_date: "2018-05-14",
    user: editor_user
)
=begin
doc4.image.attach(
   io: File.open('app/assets/images/ResilenciaUrbanaPortada.jpg'),
   filename: 'ResilenciaUrbanaPortada.jpg',
   content_type: 'image/jpeg'
)
doc4.document.attach(
   io: File.open('app/assets/images/ResilenciaUrbanaDocumento.pdf'),
   filename: 'ResilenciaUrbanaDocumento.pdf',
   content_type: 'application/pdf'
)
=end
doc4.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Publication.count} publications created"
