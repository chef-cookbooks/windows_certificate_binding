directory 'C:\mordor' do
  rights :full_control, 'everyone'
end

cookbook_file 'c:\\mordor\\dummy-cert.pem' do
  source 'dummy-cert.pem'
  action :create
end

windows_certificate 'c:/mordor/dummy-cert.pem' do
  exportable true
  store_name 'CA'
end

windows_certificate_binding 'example.com' do
  store_name 'CA'
end
