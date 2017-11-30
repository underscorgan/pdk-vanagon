component 'pdk-runtime' do |pkg, settings, platform|
  pkg.version '201711291'
  pkg.sha1sum "http://builds.puppetlabs.lan/puppet-runtime/#{pkg.get_version}/artifacts/#{pkg.get_name}-#{pkg.get_version}.#{platform.name}.tar.gz.sha1"
  pkg.url "http://builds.puppetlabs.lan/puppet-runtime/#{pkg.get_version}/artifacts/#{pkg.get_name}-#{pkg.get_version}.#{platform.name}.tar.gz"
  pkg.install_only true

  install_command = ["gunzip -c #{pkg.get_name}-#{pkg.get_version}.#{platform.name}.tar.gz | tar -C / -xf -"]
  if platform.is_windows?
    install_command = ["gunzip -c #{pkg.get_name}-#{pkg.get_version}.#{platform.name}.tar.gz | tar -C /cygdrive/c/ -xf -", "chmod 755 /cygdrive/c/ProgramFiles64Folder/PuppetLabs/DevelopmentKit/private/ruby/2.1.9/bin/*"]
  end
  pkg.install do
    install_command
  end
end

