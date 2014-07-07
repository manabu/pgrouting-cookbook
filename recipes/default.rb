package "apt"

execute "postgresql-9.1install" do
  command "touch /tmp/aaa ; LC_ALL=en_US.UTF-8 apt-get install -y postgresql-9.1"
  action :run
end

#include_recipe "postgresql::server"

#package "postgresql-9.1"
#
#service "postgresql" do
#  supports :status => true
#  action :start
#end

#package "python-software-properties"
ppa "ubuntugis/ubuntugis-unstable"

ppa "ppa:georepublic/pgrouting-unstable"
%w{
postgresql-9.1-postgis-2.1
postgresql-9.1-postgis-2.1-scripts
postgresql-9.1-pgrouting
osm2pgrouting
}.each do | pkg |
  package pkg do
    action :install
  end
end
execute "createdatabase" do
  user "postgres"
  command  <<-EOC
createdb mydatabase
psql mydatabase -c "create extension postgis"
psql mydatabase -c "create extension pgrouting"
  EOC
  action :run
end

#package "pgrouting-workshop"
#execute "sample osm data" do
#  command "touch /tmp/sampledata ; wget http://www.overpass-api.de/api/xapi?*[bbox=-1.2,52.93,-1.1,52.985][@meta]"
#  action :run
#end

