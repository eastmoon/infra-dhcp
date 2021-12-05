# DHCP ( Dynamic Host Configuration Protocol ) & DNS ( Domain Name System )

## 實驗

1. 建構 DHCP 伺服器
2. 建構 DNS 伺服器
3. 提供 Client 主機的 IP 位置與 DNS 設定
4. 使用 Client 主機透過域名查詢到指定的 IP 位置

## 文獻

+ Wiki
    - [DHCP](https://zh.wikipedia.org/wiki/%E5%8A%A8%E6%80%81%E4%B8%BB%E6%9C%BA%E8%AE%BE%E7%BD%AE%E5%8D%8F%E8%AE%AE)
        + [DHCP 伺服器是什麼？如何運用？](https://www.stockfeel.com.tw/dhcp%E4%BC%BA%E6%9C%8D%E5%99%A8%E6%98%AF%E4%BB%80%E9%BA%BC%EF%BC%9F%E5%A6%82%E4%BD%95%E9%81%8B%E7%94%A8%EF%BC%9F/)
        + [MSDN : 動態主機設定通訊協定 (DHCP)](https://docs.microsoft.com/zh-tw/windows-server/networking/technologies/dhcp/dhcp-top)
        + [DHCP client/server interaction](https://www.ibm.com/docs/en/i/7.1?topic=concepts-dhcp-clientserver-interaction)
    - [DNS](https://zh.wikipedia.org/wiki/%E5%9F%9F%E5%90%8D%E7%B3%BB%E7%BB%9F)
        + [網域名稱 / 網址 / 域名是什麼？有什麼作用？](https://www.net-chinese.com.tw/nc/index.php/MenuLink/Index/AboutDomainName)
        + [MSDN : 網域名稱系統 (DNS)](https://docs.microsoft.com/zh-tw/windows-server/networking/dns/dns-top)
+ DHCP
    - 函式庫
        + [Docker ISC DHCP server](https://hub.docker.com/r/networkboot/dhcpd/)
    - 教學
        + [DHCP Server](https://www.twbsd.org/cht/book/ch18.htm)
            - [使用Ubuntu Server架設DHCP伺服器](https://magiclen.org/ubuntu-server-dhcp/)
            - [如何在Ubuntu上設置DHCP服務器](https://ubuntuqa.com/zh-tw/article/10932.html)
            - [How to Install a DHCP Server in Ubuntu and Debian](https://www.tecmint.com/install-dhcp-server-in-ubuntu-debian/)
            - [Setting up a Docker container as a DHCP server](https://gist.github.com/mikejoh/04978da4d52447ead7bdd045e878587d)
        + [DHCP Client](https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/ipaddr_dhcp/configuration/15-sy/dhcp-15-sy-book/config-dhcp-client.pdf)
            - [DHCP Client運作方式](https://blog.dabinn.net/dhcp-client%E9%81%8B%E4%BD%9C%E6%96%B9%E5%BC%8F/)
+ DNS
    - 函式庫
        + [BIND 9](https://www.isc.org/bind/)
        + [Docker BIND 9 By Internet Systems Consortium](https://hub.docker.com/_/bind9/plans/3af94cc6-b9c6-43c2-8658-e617ef977949?tab=instructions)
    - 教學
        + [CSICO Local DNS Forwarding](https://docs.umbrella.com/deployment-umbrella/docs/6-local-dns-forwarding)
        + [Forward DNS Queries for Certain Domains to a Private DNS Server](https://www.draytek.com/support/knowledge-base/5264)
        + [How to Run Your Own DNS Server on Your Local Network](https://www.cloudsavvyit.com/14816/how-to-run-your-own-dns-server-on-your-local-network/)
        + [自建 Name Server](https://wcc723.github.io/dns/2019/04/25/custom_name_server/)
        + [ISC BIND9 – 最詳細、最認真的從零開始的BIND 9 服務講解](https://codingnote.cc/zh-tw/p/334131/)
        + [Ubuntu 使用 bind9 架設DNS Server](https://eric0806.blogspot.com/2014/06/ubuntu-bind9-dns-server.html)
        + [bind9自建DNS解析服務](https://ithelp.ithome.com.tw/articles/10255408)
