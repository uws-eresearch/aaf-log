# aaf-log

This Perl script summarises IdP logs into "access by domain" counts.

Input is a stream with rows like this:

```
20131231T141715Z|urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect|_PILEOFHEX_|https://cloudstor.aarnet.edu.au/simplesaml/module.php/saml/sp/metadata.php/default-sp|urn:mace:shibboleth:2.0:profiles:saml2:sso|https://idp.uws.edu.au/idp/shibboleth|urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST|_ANOTHERPILEOFHEX_|_USERID_|urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport|eduPersonAffiliation,commonName,transientId,email,|_MOREHEX_||
```

Output is simple CSV.

```
> ./aaf-idp-logs.pl
mon,acclaim.edu.au,arms.rdsi.edu.au,assurance.aaf.edu.au,caudit.unisa.edu.au,cloudstor,data.csiro.au,demo.bccvl.org.au,diver.intersect.org.au,esoe.qut.edu.au,idpp.intersect.org.au,manager.aaf.edu.au,nectar,portal.aurin.org.au,rapid.aaf.edu.au,researchdata.ands.org.au,sciencedirect,shibboleth.cambridge.org,sp.espaces.edu.au,sp.researchadviser.com.au,staging.aurin.org.au,www.ausnc.org.au,www.caudit.edu.au,www.emeraldinsight.com
01,0,0,1,0,108,0,0,0,1,0,0,7,0,0,0,38,0,0,0,0,0,0,2
02,0,0,0,0,95,0,0,0,1,0,0,6,0,0,4,39,0,0,1,0,0,1,2
03,4,0,0,0,148,0,0,0,0,0,1,25,6,0,0,76,1,0,0,1,0,4,0
04,5,0,0,0,91,0,0,1,0,0,0,17,0,0,1,52,1,2,0,0,0,0,0
05,1,1,0,0,143,0,1,0,0,0,0,15,2,0,0,62,0,0,0,0,0,21,0
06,3,0,0,0,180,0,0,0,0,0,1,4,2,4,0,79,0,0,0,0,0,2,2
07,5,0,0,2,225,0,0,0,0,0,0,14,16,14,0,36,0,0,0,0,1,9,0
08,6,0,0,7,200,1,0,0,0,0,1,18,19,3,1,36,0,0,0,0,0,2,2
09,5,0,0,5,237,0,0,0,0,0,0,19,14,1,13,52,0,0,0,0,0,3,0
10,1,0,0,3,198,0,0,0,3,0,0,7,13,0,6,56,2,0,0,0,0,1,0
11,0,0,0,0,495,2,0,0,1,0,0,29,8,13,16,20,0,0,0,0,0,2,0
12,0,0,0,0,339,0,0,0,2,2,0,30,8,7,0,80,0,0,0,0,0,1,0
```

### Changelog:

20141217 initial log parsing

20150114 munging by year/month and service, clumping by domainname
