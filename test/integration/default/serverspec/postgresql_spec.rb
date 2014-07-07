require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end


describe "postgres Daemon" do

  it "is listening on port 5432" do
    expect(port(5432)).to be_listening
  end

  it "has a running service of postgres" do
    expect(service("postgres")).to be_running
  end

end
