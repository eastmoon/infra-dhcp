# DHCP ( Dynamic Host Configuration Protocol ) & DNS ( Domain Name System )

## 實驗

1. 建構 DHCP 伺服器
    + 建置一個虛擬網路
    + 建置一個 DHCP Server 主機於虛擬網路內
    + 建置一個 DHCP Client 主機於虛擬網路內
    + 由 DHCP Client 主機發送請求網路設定，並由 DHCP Server 回應
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
            - [isc-dhcp-server community help wiki](https://help.ubuntu.com/community/isc-dhcp-server)
            - [How to Install and Configure DHCP Server on Ubuntu 18.04 LTS](https://linuxhint.com/install_dhcp_server_ubuntu/)
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

+ 技術文獻
    - Virtual Machine
        + [How To Configure Networking In Vagrant](https://www.linuxhowto.net/how-to-configure-networking-in-vagrant/)
        + [How to emulate a network using VirtualBox](https://www.brianlinkletter.com/2016/07/how-to-use-virtualbox-to-emulate-a-network/)
        + [Vagrant virtualbox networking document](https://www.vagrantup.com/docs/providers/virtualbox/networking)
    - [Pipework](https://github.com/jpetazzo/pipework)
        + 用於自定義 Linux 容器的網路設定套件

## 議題

#### DNS CAA

憑證頒發機構授權 (Certificate Authority Authorization, CAA) 是一種 DNS 紀錄，它讓網站管理者指定哪些憑證頒發機構，可以頒發包含其網站域名的憑證。CAA 記錄在 2013 年由 RFC 6844 標準化，以"降低網域擁有者對於 CA 意外頒發憑證時的風險"。

由於域名設定完成後，任何 CA 都可以在驗證域名控制權後，替任何 DNS 下的網域頒發憑證。這表示，如果在 CA 的驗證程序中有錯誤，所有域名都可能受到影響。CAA 紀錄提供了一個方法讓域名擁有者降低這種風險。

然而，在實務上，會因為申請域名的服務商預設了 DNS CAA 導致無法從其它服務商接受憑證，在此情況有以下處理方式：

+ 修改 DNS CAA 記錄
    - 關閉 DNS CAA 設定，另域名可接受任何 CA 廠商的憑證
    - 增加 DNS CAA 設定 ( 注意此設定是否為額外付費項目 )
+ 配合域名服務商申請 SSL
    - 機於域名安全設定，多數的域名提供商會有提供 SSL 憑證發行協助
    - 基於此項原則會導致域名申請與 SSL 發行為同服務商，相關服務費用應一併考量

相關文獻：

+ [憑證頒發機構授權 let's encrypt](https://letsencrypt.org/zh-tw/docs/caa/)
+ [DNS CAA 資源記錄檢查](https://docs.digicert.com/zh-tw/manage-certificates/dns-caa-resource-record-check/)
+ [AWS Certificate Manager 設定 CAA 記錄](https://docs.aws.amazon.com/zh_tw/acm/latest/userguide/setup-caa.html)
+ [Gandi CAA 記錄](https://docs.gandi.net/zh-hant/domain_names/faq/record_types/caa_record.html)
+ [正確設置DNS CAA記錄，提升HTTPS站點安全](https://kknews.cc/zh-tw/news/xvbpryr.html)

檢查工具：

+ [CAA Record Helper](https://sslmate.com/caa/)
    - [超快速 DNS CAA 設定 Step by Step](https://cjk.aiao.today/dns-caa-setting-step-by-step/)
    - [設定 DNS CAA 紀錄，保護自己的 SSL/TLS 憑證](https://ezbox.idv.tw/112/dns-caa-protec-ssl-tls-certificate/)
+ [View Which CA's Are Entitled to Issue Certificates For Your Domain(s)](https://www.entrust.com/resources/certificate-solutions/tools/caa-lookup)
