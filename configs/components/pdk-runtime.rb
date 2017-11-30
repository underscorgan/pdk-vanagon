component 'pdk-runtime' do |pkg, settings, platform|
  pkg.version '201711291'
  pkg.sha1sum "http://builds.puppetlabs.lan/puppet-runtime/#{pkg.get_version}/artifacts/#{pkg.get_name}-#{pkg.get_version}.#{platform.name}.tar.gz.sha1"
  pkg.url "http://builds.puppetlabs.lan/puppet-runtime/#{pkg.get_version}/artifacts/#{pkg.get_name}-#{pkg.get_version}.#{platform.name}.tar.gz"
  pkg.install_only true

  pkg.install do
    ["gunzip -c #{pkg.get_name}-#{pkg.get_version}.#{platform.name}.tar.gz | tar -C / -xf -"]
  end
end

