## credit: https://www.reddit.com/user/carzian/
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.poolmanager import PoolManager
import ssl
import requests
import json

## DEPENDENCY:
# pip install requests

## CHANGE HERE ##
# ip address of AdGuard Home
# "http(s)://<adguardHomeIp:<port>"
host = "http://10.0.0.1:8080"
# user name
userName = "USERNAME_HERE"
# password
password = "PASSWORD_HERE"

# block list
# taken from Wally3K's Firebog https://firebog.net/
urls = [
"https://raw.githubusercontent.com/PolishFiltersTeam/KADhosts/master/KADhosts.txt"
"https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Spam/hosts"
"https://v.firebog.net/hosts/static/w3kbl.txt"
"https://adaway.org/hosts.txt"
"https://v.firebog.net/hosts/AdguardDNS.txt"
"https://v.firebog.net/hosts/Admiral.txt"
"https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt"
"https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
"https://v.firebog.net/hosts/Easylist.txt"
"https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext"
"https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts"
"https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts"
"https://v.firebog.net/hosts/Easyprivacy.txt"
"https://v.firebog.net/hosts/Prigent-Ads.txt"
"https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts"
"https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt"
"https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt"
"https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt"
"https://osint.digitalside.it/Threat-Intel/lists/latestdomains.txt"
"https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt"
"https://v.firebog.net/hosts/Prigent-Crypto.txt"
"https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts"
"https://bitbucket.org/ethanr/dns-blacklists/raw/8575c9f96e5b4a1308f2f12394abd86d0927a4a0/bad_lists/Mandiant_APT1_Report_Appendix_D.txt"
"https://phishing.army/download/phishing_army_blocklist_extended.txt"
"https://malware-filter.gitlab.io/malware-filter/phishing-filter-hosts.txt"
"https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-malware.txt"
"https://v.firebog.net/hosts/RPiList-Malware.txt"
"https://v.firebog.net/hosts/RPiList-Phishing.txt"
"https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt"
"https://raw.githubusercontent.com/AssoEchap/stalkerware-indicators/master/generated/hosts"
"https://urlhaus.abuse.ch/downloads/hostfile/"
"https://zerodot1.gitlab.io/CoinBlockerLists/hosts_browser"
]
allow_urls = ["https://raw.githubusercontent.com/Hudater/services/main/baremetal/adguard/allowlist.txt"]

############ End Edits #################

# Open TLSv1 Adapter
class MyAdapter(HTTPAdapter):
    def init_poolmanager(self, connections, maxsize, block=False):
        self.poolmanager = PoolManager(num_pools=connections,
                                       maxsize=maxsize,
                                       block=block,
                                       ssl_version=ssl.PROTOCOL_TLSv1)

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0'}     

s = requests.Session()
s.mount(host, MyAdapter())
x = s.post(host + "/control/login", json.dumps({"name": userName, "password" : password}), headers=headers )
print(x.text)

for u in urls:
	filterObj = json.dumps({'url':u, "name":u,"whitelist":False})
	print(filterObj)
	x = s.post(host + "/control/filtering/add_url", data = filterObj, headers=headers)
	print(x.text)

# help from 
# https://stackoverflow.com/questions/30946370/using-requests-to-login-to-a-website-that-has-javascript-login-form
# https://stackoverflow.com/questions/33818206/python-login-into-a-website-with-javascript-form