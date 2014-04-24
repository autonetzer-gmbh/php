
#yum_repository 'remi-php55' do
#  description 'Les RPM de Remi PHP55 - Repository'
  mirrorlist 'http://rpms.famillecollet.com/enterprise/6/php55/mirror'
  gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  fastestmirror_enabled true
  enabled false
  action :create
end

yum_repository 'remi' do
  description 'Les RPM de Remi - Repository'
  mirrorlist 'http://rpms.famillecollet.com/enterprise/6/remi/mirror'
  gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  fastestmirror_enabled true
  enabled false
  action :create
end

# install packages from remi
%w{php php-pear php-mbstring php-xml php-devel php-gd php-fpm}.each do |pkg|
    package pkg do
        options "--enablerepo=remi-php55,remi"
        action :install
    end
end

#node['php']['packages'].each do |pkg|
#    package pkg do
#      action :install
#    end
#end
