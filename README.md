# windows_certificate_binding Cookbook

Provides a set of Windows-specific resources to aid in the creation of cookbooks/recipes targeting the Windows platform.

## Requirements

### Platforms

- Windows 7 (EOL)
- Windows Server 2008 R2 (EOL)
- Windows 8, 8.1
- Windows Server 2012 (R1, R2)
- Windows Server 2016
- Windows 10
- Windows Server 2019

### Chef

- Chef 14.7+

## Resources

### windows_certificate_binding

Binds a certificate to an HTTP port to enable TLS communication.

#### Actions

- `:create` - creates or updates a binding.
- `:delete` - deletes a binding.

#### Properties

- `cert_name` - name attribute. The thumbprint(hash) or subject that identifies the certificate to be bound.
- `name_kind` - indicates the type of cert_name. One of :subject (default) or :hash.
- `address` - the address to bind against. Default is 0.0.0.0 (all IP addresses). One of:
  - IP v4 address `1.2.3.4`
  - IP v6 address `[::1]`
  - Host name `www.foo.com`
- `port` - the port to bind against. Default is 443.
- `app_id` - the GUID that defines the application that owns the binding. Default is the values used by IIS.
- `store_name` - the store to locate the certificate in. One of:
  - MY (Personal)
  - CA (Intermediate Certification Authorities)
  - ROOT (Trusted Root Certification Authorities)
  - TRUSTEDPUBLISHER (Trusted Publishers)
  - CLIENTAUTHISSUER (Client Authentication Issuers)
  - REMOTE DESKTOP (Remote Desktop)
  - TRUSTEDDEVICES (Trusted Devices)
  - WEBHOSTING (Web Hosting)
  - AUTHROOT (Third-Party Root Certification Authorities)
  - TRUSTEDPEOPLE (Trusted People)
  - SMARTCARDROOT (Smart Card Trusted Roots)
  - TRUST (Enterprise Trust)

#### Examples

```ruby
# Bind the first certificate matching the subject to the default TLS port
windows_certificate_binding "me.acme.com" do
end
```

```ruby
# Bind a cert from the CA store with the given hash to port 4334
windows_certificate_binding "me.acme.com" do
    cert_name    "d234567890a23f567c901e345bc8901d34567890"
    name_kind    :hash
    store_name    "CA"
    port        4334
end
```

## License & Authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
