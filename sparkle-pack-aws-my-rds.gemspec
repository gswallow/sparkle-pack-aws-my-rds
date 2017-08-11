Gem::Specification.new do |s|
  s.name = 'sparkle-pack-aws-my-rds'
  s.version = '0.0.2'
  s.licenses = ['MIT']
  s.summary = 'AWS RDS SparklePack'
  s.description = 'SparklePack to detect and set RDS DB settings'
  s.authors = ['Greg Swallow']
  s.email = 'gswallow@indigobio.com'
  s.homepage = 'https://github.com/gswallow/sparkle-pack-aws-my-rds'
  s.files = Dir[ 'lib/sparkleformation/registry/*' ] + %w(sparkle-pack-aws-my-rds.gemspec lib/sparkle-pack-aws-my-rds.rb)
  s.add_runtime_dependency 'aws-sdk-core', '~> 2'
end
