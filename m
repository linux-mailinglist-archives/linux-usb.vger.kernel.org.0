Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF29335F85B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 18:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352289AbhDNPuN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 11:50:13 -0400
Received: from mail02.rohde-schwarz.com ([80.246.32.97]:40828 "EHLO
        mail02.rohde-schwarz.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352454AbhDNPuE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Apr 2021 11:50:04 -0400
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Wed, 14 Apr 2021 11:50:04 EDT
Received: from amu316.rsint.net (10.0.26.65) by mail-emea.rohde-schwarz.com
 (172.21.64.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.858.5; Wed, 14 Apr 2021
 17:34:35 +0200
Received: from GMU419.rsint.net ([10.0.230.184])
          by amu316.rsint.net (Totemo SMTP Server) with SMTP ID 712;
          Wed, 14 Apr 2021 17:34:35 +0200 (CEST)
Received: from GMU004.rsint.net (10.0.2.27) by GMU419.rsint.net (10.0.230.184)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2106.2; Wed, 14 Apr
 2021 17:34:33 +0200
Received: from GMU006.rsint.net (10.0.2.28) by GMU004.rsint.net (10.0.2.27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Wed, 14
 Apr 2021 17:34:32 +0200
Received: from GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b]) by
 GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b%12]) with mapi id
 15.01.2106.013; Wed, 14 Apr 2021 17:34:32 +0200
From:   Guido Kiener <Guido.Kiener@rohde-schwarz.com>
To:     "guido@kiener-muenchen.de" <guido@kiener-muenchen.de>,
        "dpenkler@gmail.com" <dpenkler@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "lyl2019@mail.ustc.edu.cn" <lyl2019@mail.ustc.edu.cn>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: Re: [PATCH v2] usb: Add a lock when freeing data in
 usbtmc_disconnect
Thread-Topic: Re: [PATCH v2] usb: Add a lock when freeing data in
 usbtmc_disconnect /ur/
Thread-Index: AdcxQ4GdyaWQj60vQCCESpUXJIuKBg==
Date:   Wed, 14 Apr 2021 15:34:32 +0000
Message-ID: <0f61c735816442ea9993439d5d705365@rohde-schwarz.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-rus_sensitivity: 10
hvs-classificationid: 8485d17c-1b45-47c0-b496-903334a11e28
hvs-prefix: R_S
x-originating-ip: [10.0.9.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-IQAV: YES
X-GBS-PROC: H5s0sCgPdtZpg+4nwLRue5Mrqs9R10zvWuLIwjG9fprLcgFMoaadu2PdmMZjihTwPzt7N80cb5hVxMxwNp7SyFSCpRSDNShwI2fPSWcw8KyavR1p3KuXicgOgmiP0TUH
X-GBS-PROCJOB: NIwOPUL61fKi1do/tjqTVT+gqmNfv9Q5i3V7d5X0QDU9rNjjhhwhxd9Uemtszi4b
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RGF2ZSwNCg0KU29ycnksIEkgZGlkIG5vdCBsb29rIGNhcmVmdWxseSBlbm91Z2ghIHVzYnRtY19w
cm9iZSgpIHNlZW1zIHRvIGJlIGNvcnJlY3QuDQpATHYgWXVuZ2xvbmc6IElmIHlvdSB0aGluayB5
b3UgY2FuIHByb3Zva2UgYW4gZXJyb3IgdGhlbiB5b3UgY2FuIHNlbmQgdXMgaW5zdHJ1Y3Rpb25z
IG9yIGEga2VybmVsIGR1bXAgd2l0aCBhIHByaXZhdGUgbWFpbC4NCg0KLUd1aWRvDQoNCg0KSGkg
RGF2ZSwNCg0KSSBqdXN0IGZvdW5kIHRoaXMgcGF0Y2gsIHdoaWNoIGRvZXMgbm90IHNlZW0gdG8g
YmUgYSBjb3JyZWN0IHNvbHV0aW9uIHRvIHNvbHZlIGEgcmFjZS4NCk1heWJlIHRoZXJlIGlzIHJl
YWxseSBhbiBpc3N1ZSB3aXRoIHRoZSByZWZjb3VudGluZyBvZiBkYXRhLT5rcmVmLCBidXQgY3Vy
cmVudGx5IEkgZG8gbm90IGhhdmUgdGltZSB0byBjaGVjayB0aGlzIGluIGhvbWUgb2ZmaWNlLg0K
DQpBdCBsZWFzdCBJIHNlZSBhIHByb2JsZW0gaW4gdXNidG1jX3Byb2JlKCkNCg0KQWZ0ZXIgY2Fs
bGluZzoNCiAgICAvKiBQcm90ZWN0IGludGVycnVwdCBpbiBlbmRwb2ludCBkYXRhIHVudGlsIGlp
bl91cmIgaXMgZnJlZWQgKi8NCiAgICBrcmVmX2dldCgmZGF0YS0+a3JlZik7DQp0aGUgcmVmY291
bnRlciBpcyBpbmNyZW1lbnRlZCBhZ2FpbiBhbmQgaWYgdXNidG1jX3Byb2JlKCkgZmFpbHMsIHRo
ZSBjb3VudGVyIGlzIG9ubHkgZGVjcmVtZW50ZWQgd2l0aCBhIHNpbmdsZSBrcmVmX3B1dCguLiku
DQoNCkkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIHRoZSByZWFzb24gb2YgTHYgWXVuZ2xvbmcncyBw
cm9ibGVtLCBidXQgbGV0IG1lIGtub3cgaWYgeW91IGhhdmUgdGltZSB0byB0cmFjayBkb3duIHRo
aXMgaXNzdWUsIGFuZCB3ZSB3aWxsIHdvcmsgb24gYSBjb3JyZWN0IGFuZCB0ZXN0ZWQgcGF0Y2gu
DQoNClJlZ2FyZHMsDQoNCkd1aWRvDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBHcmVnIEtIDQo+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDIzLCAyMDIxIDEwOjQ0IEFN
DQo+IFRvOiBMdiBZdW5sb25nIDxseWwyMDE5QG1haWwudXN0Yy5lZHUuY24+DQo+IENjOiBsaW51
eC11c2JAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHVzYjogQWRkIGEgbG9jayB3aGVuIGZyZWVpbmcgZGF0YSBp
biANCj4gdXNidG1jX2Rpc2Nvbm5lY3QNCj4NCj4gT24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgMDI6
Mjg6NTRBTSAtMDcwMCwgTHYgWXVubG9uZyB3cm90ZToNCj4+IEluIHVzYnRtY19kaXNjb25uZWN0
LCBkYXRhIGlzIGdvdCBmcm9tIGludGYgd2l0aCB0aGUgaW5pdGlhbCByZWZlcmVuY2UuDQo+PiBU
aGVyZSBpcyBubyByZWZjb3VudCBpbmMgb3BlcmF0aW9uIGJlZm9yZSB1c2JtY19mcmVlX2ludChk
YXRhKS4gSW4gDQo+PiB1c2JtY19mcmVlX2ludChkYXRhKSwgdGhlIGRhdGEgbWF5IGJlIGZyZWVk
Lg0KPj4NCj4+IEJ1dCBsYXRlciBpbiB1c2J0bWNfZGlzY29ubmVjdCwgdGhlcmUgaXMgYW5vdGhl
ciBwdXQgZnVuY3Rpb24gb2YgZGF0YS4NCj4+IEl0IGNvdWxkIGNhdXNlIGVycm9ycyBpbiByYWNl
Lg0KPj4NCj4+IE15IHBhdGNoIGFkZHMgYSBsb2NrIHRvIHByb3RlY3Qga3JlZiBmcm9tIGNoYW5n
aW5nIGluIHJhY2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTHYgWXVubG9uZyA8bHlsMjAxOUBt
YWlsLnVzdGMuZWR1LmNuPg0KPj4gLS0tDQo+PiAgZHJpdmVycy91c2IvY2xhc3MvdXNidG1jLmMg
fCA1ICsrKysrDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jbGFzcy91c2J0bWMuYyBiL2RyaXZlcnMvdXNiL2NsYXNz
L3VzYnRtYy5jIA0KPj4gaW5kZXggNzRkNWE5YzUyMzhhLi40NGYxZmNhYmJiMWUgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL3VzYi9jbGFzcy91c2J0bWMuYw0KPj4gKysrIGIvZHJpdmVycy91c2Iv
Y2xhc3MvdXNidG1jLmMNCj4+IEBAIC0yNDkzLDggKzI0OTMsMTMgQEAgc3RhdGljIHZvaWQgdXNi
dG1jX2Rpc2Nvbm5lY3Qoc3RydWN0IA0KPj4gdXNiX2ludGVyZmFjZSAqaW50ZikNCj4+ICAJCXVz
Yl9zY3V0dGxlX2FuY2hvcmVkX3VyYnMoJmZpbGVfZGF0YS0+aW5fYW5jaG9yKTsNCj4+ICAJfQ0K
Pj4gIAltdXRleF91bmxvY2soJmRhdGEtPmlvX211dGV4KTsNCj4+ICsNCj4+ICsJc3BpbmxvY2tf
dCAqZGV2X2xvY2sgPSAmZGF0YS0+ZGV2X2xvY2s7DQo+PiArDQo+PiArCXNwaW5fbG9ja19pcnEo
ZGV2X2xvY2spOw0KPj4gIAl1c2J0bWNfZnJlZV9pbnQoZGF0YSk7DQo+PiAgCWtyZWZfcHV0KCZk
YXRhLT5rcmVmLCB1c2J0bWNfZGVsZXRlKTsNCj4+ICsJc3Bpbl91bmxvY2tfaXJxKGRldl9sb2Nr
KTsNCj4+ICB9DQo+Pg0KPj4gIHN0YXRpYyB2b2lkIHVzYnRtY19kcmF3X2Rvd24oc3RydWN0IHVz
YnRtY19maWxlX2RhdGEgKmZpbGVfZGF0YSkNCj4+IC0tDQo+PiAyLjI1LjENCj4NCj4gWW91IG9i
dmlvdXNseSBkaWQgbm90IGV2ZW4gYnVpbGQgdGhpcyBwYXRjaCwgbGV0IGFsb25lIHRlc3QgaXQg
OigNCj4NCj4gUGxlYXNlIGRvIG5vdCB3YXN0ZSBtYWludGFpbmVyJ3MgdGltZSBieSBub3QgZG9p
bmcgdGhlIHByb3BlciBzdGVwcyANCj4gd2hlbiBzdWJtaXR0aW5nIHBhdGNoZXMuDQo+DQo+IHRo
YW5rcywNCj4NCj4gZ3JlZyBrLWgNCg0K
