Gem::Specification.new do |g|
  g.name = 'vericast-ifpi'
  g.version = '1.0'
  g.summary = 'Gem for retrieving info from Vericast IFPI lookup service'
  g.homepage = 'https://github.com/matiasinsaurralde/vericast-ifpi'
  g.description = 'Vericast is a global music identification service that monitors millons of songs over 3000 radios and televisions across more than 60 countries worldwide.'
  g.author = 'Matias Insaurralde'
  g.email = 'matias@insaurral.de'
  g.files = ['sample.rb'] + Dir['lib/*']
  g.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.1'
  g.license = 'MIT'
end
