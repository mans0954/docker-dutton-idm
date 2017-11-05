# Dockerisation of PoC IdM

Build

```
docker-compose up
```

Run

```
docker-compose up
alias kadmin.example.org="docker exec -ti kadmin-idm kadmin.local"
kadmin.example.org -q "add_principal mans0954@EXAMPLE.ORG"
kadmin.example.org -q "add_principal mans0954/admin@EXAMPLE.ORG"
kadmin.example.org -q "add_principal -randkey  api/idm.example.org@EXAMPLE.ORG"
docker exec -ti idm kinit mans0954
docker exec -ti idm kadmin -q "ktadd -k /etc/krb5/krb5.keytab HTTP/idm.example.org@EXAMPLE.ORG"
docker exec -ti idm kadmin -q "ktadd -k krb5.keytab api/idm.example.org@EXAMPLE.ORG"
```

# Future options

* Could look at using a volume or docker secrets to distribute keytabs to containers?


