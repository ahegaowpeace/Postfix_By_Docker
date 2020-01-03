sed -e "s/{{MYHOSTNAME}}/【ホスト名】/" -e "s/{{MYDOMAIN}}/【ドメイン名】/" -e "s/{{INET_PROTOCOLS}}/ipv4/" main.cf.org > main.cf
