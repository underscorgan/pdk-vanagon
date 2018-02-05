component 'pdk-runtime' do |pkg, settings, platform|
  pkg.version '201802020.4.g1f99836'
  gitsha = '1f998360d52888c0a72d4624761dee15fa6b55e1'
  pkg.sha1sum "http://builds.puppetlabs.lan/puppet-runtime/#{gitsha}/artifacts/#{pkg.get_name}-#{pkg.get_version}.#{platform.name}.tar.gz.sha1"
  pkg.url "http://builds.puppetlabs.lan/puppet-runtime/#{gitsha}/artifacts/#{pkg.get_name}-#{pkg.get_version}.#{platform.name}.tar.gz"
  pkg.install_only true

  install_command = ["gunzip -c #{pkg.get_name}-#{pkg.get_version}.#{platform.name}.tar.gz | tar -C / -xf -"]
  if platform.is_windows?
    # We need to make sure we're setting permissions correctly for the executables
    # in the ruby bindir since preserving permissions in archives in windows is
    # ... weird, and we need to be able to use cygwin environment variable use
    # so cmd.exe was not working as expected.
    install_command = [
      "gunzip -c #{pkg.get_name}-#{pkg.get_version}.#{platform.name}.tar.gz | tar -C /cygdrive/c/ -xf -",
      "chmod 755 #{settings[:ruby_bindir].sub(/C:/, '/cygdrive/c')}/*"
    ]
  end
  pkg.install do
    install_command
  end
end

