passwd = ::String.new((0...12).map { (65 + ::Random.rand(26)).chr }.join)

SfnRegistry.register(:random_password) do
  passwd
end
