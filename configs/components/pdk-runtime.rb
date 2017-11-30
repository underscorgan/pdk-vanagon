component 'pdk-runtime' do |pkg, settings, platform|
  pkg.version '0fec91169751aab7b2d95aa233946e06873565bb'
  pkg.sha1sum "http://builds.puppetlabs.lan/puppet-runtime/#{pkg.get_version}/artifacts/#{pkg.get_name}-201711290.2.g0fec911.#{platform.name}.tar.gz.sha1"
  pkg.url "http://builds.puppetlabs.lan/puppet-runtime/#{pkg.get_version}/artifacts/#{pkg.get_name}-201711290.2.g0fec911.#{platform.name}.tar.gz"
  pkg.install_only true

  pkg.install do
    ["gunzip -c #{pkg.get_name}-201711290.2.g0fec911.#{platform.name}.tar.gz | tar -C / -xf -"]
  end
end

