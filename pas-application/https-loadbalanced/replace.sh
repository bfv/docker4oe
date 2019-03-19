
# replace EMAILADDRESS and DOMAIN with their respective values.
# remember: sed uses regex, so use www\.acme\.com and admin@acme\.com style

sed -i -e 's/\${mydomainemail}/EMAILADDRESS/g' init-letsencrypt.sh data/apache/httpd-ssl.conf data/apache/httpd.conf
sed -i -e 's/\${mydomain}/DOMAIN/g' init-letsencrypt.sh data/apache/httpd-ssl.conf data/apache/httpd.conf
