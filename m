Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683133D70AC
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 09:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235916AbhG0H4g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 03:56:36 -0400
Received: from mail02.rohde-schwarz.com ([80.246.32.97]:4393 "EHLO
        mail02.rohde-schwarz.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235845AbhG0H4g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 03:56:36 -0400
Received: from amu316.rsint.net (10.0.26.65) by mail-emea.rohde-schwarz.com
 (172.21.64.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.858.12; Tue, 27 Jul
 2021 09:56:34 +0200
Received: from GMU419.rsint.net ([10.0.230.184])
          by amu316.rsint.net (Totemo SMTP Server) with SMTP ID 927;
          Tue, 27 Jul 2021 09:56:34 +0200 (CEST)
Received: from GMU003.rsint.net (10.0.2.61) by GMU419.rsint.net (10.0.230.184)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2242.10; Tue, 27 Jul
 2021 09:56:33 +0200
Received: from GMU006.rsint.net (10.0.2.28) by GMU003.rsint.net (10.0.2.61)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2242.10; Tue, 27
 Jul 2021 09:56:27 +0200
Received: from GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b]) by
 GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b%12]) with mapi id
 15.01.2242.010; Tue, 27 Jul 2021 09:56:27 +0200
From:   Guido Kiener <Guido.Kiener@rohde-schwarz.com>
To:     "qiang.zhang@windriver.com" <qiang.zhang@windriver.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "dave penkler (dpenkler@gmail.com)" <dpenkler@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2] USB: usbtmc: Fix RCU stall warning
Thread-Topic: [PATCH v2] USB: usbtmc: Fix RCU stall warning /ur/
Thread-Index: AdeCu9yy1JA/ZrolTTyuC1SqPBOeOA==
Date:   Tue, 27 Jul 2021 07:56:27 +0000
Message-ID: <7ad985430b1e4ddcb642001f4dc8be84@rohde-schwarz.com>
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
X-GBS-PROC: DjDBv6NzCzCWP9Xm2p+GFsa9Msh0a+8OdjKR3phSpz3sZqWe4CkYk57kAe5Trk7P1mk8wcluAKi/LxrBIWo0DqFNREJbfskjBghsPhPqx9oYAOFDg9L461CNOD4BIwuc
X-GBS-PROCJOB: 0ewO3bYKLZkWSdeIsOTNq/uqcLsNs9wt9BbpKbUFBIEUuL+kZNKDvwgZUI34eJ12
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiA+IEZyb206IFFpYW5nLnpoYW5nPg0KPiA+IHJjdTogSU5GTzogcmN1X3ByZWVtcHQgc2VsZi1k
ZXRlY3RlZCBzdGFsbCBvbiBDUFUNCj4gPiByY3U6ICAgIDEtLi4uITogKDIgdGlja3MgdGhpcyBH
UCkgaWRsZT1kOTIvMS8weDQwMDAwMDAwMDAwMDAwMDANCj4gPiAgICAgICAgIHNvZnRpcnE9MjUz
OTAvMjUzOTIgZnFzPTMNCj4gPiAgICAgICAgICh0PTEyMTY0IGppZmZpZXMgZz0zMTY0NSBxPTQz
MjI2KQ0KPiA+IHJjdTogcmN1X3ByZWVtcHQga3RocmVhZCBzdGFydmVkIGZvciAxMjE2MiBqaWZm
aWVzISBnMzE2NDUgZjB4MA0KPiA+ICAgICAgUkNVX0dQX1dBSVRfRlFTKDUpIC0+c3RhdGU9MHgw
IC0+Y3B1PTANCj4gPiByY3U6ICAgIFVubGVzcyByY3VfcHJlZW1wdCBrdGhyZWFkIGdldHMgc3Vm
ZmljaWVudCBDUFUgdGltZSwNCj4gPiAgICAgICAgIE9PTSBpcyBub3cgZXhwZWN0ZWQgYmVoYXZp
b3IuDQo+ID4gcmN1OiBSQ1UgZ3JhY2UtcGVyaW9kIGt0aHJlYWQgc3RhY2sgZHVtcDoNCj4gPiB0
YXNrOnJjdV9wcmVlbXB0ICAgICBzdGF0ZTpSICBydW5uaW5nIHRhc2sNCj4gPiAuLi4uLi4uLi4u
Lg0KPiA+IHVzYnRtYyAzLTE6MC4wOiB1bmtub3duIHN0YXR1cyByZWNlaXZlZDogLTcxIHVzYnRt
YyAzLTE6MC4wOiB1bmtub3duDQo+ID4gc3RhdHVzDQo+ID4gcmVjZWl2ZWQ6IC03MSB1c2J0bWMg
My0xOjAuMDogdW5rbm93biBzdGF0dXMgcmVjZWl2ZWQ6IC03MSB1c2J0bWMgMy0xOjAuMDoNCj4g
PiB1bmtub3duIHN0YXR1cyByZWNlaXZlZDogLTcxIHVzYnRtYyAzLTE6MC4wOiB1bmtub3duIHN0
YXR1cyByZWNlaXZlZDoNCj4gPiAtNzEgdXNidG1jDQo+ID4gMy0xOjAuMDogdW5rbm93biBzdGF0
dXMgcmVjZWl2ZWQ6IC03MSB1c2J0bWMgMy0xOjAuMDogdW5rbm93biBzdGF0dXMNCj4gPiByZWNl
aXZlZDogLTcxIHVzYnRtYyAzLTE6MC4wOiB1bmtub3duIHN0YXR1cyByZWNlaXZlZDogLTcxIHVz
YnRtYw0KPiA+IDMtMTowLjA6IHVzYl9zdWJtaXRfdXJiDQo+ID4gZmFpbGVkOiAtMTkNCj4gPg0K
PiA+IFRoZSBmdW5jdGlvbiB1c2J0bWNfaW50ZXJydXB0KCkgcmVzdWJtaXRzIHVyYnMgd2hlbiB0
aGUgZXJyb3Igc3RhdHVzDQo+ID4gb2YgYW4gdXJiIGlzIC0gRVBST1RPLiBJbiBzeXN0ZW1zIHVz
aW5nIHRoZSBkdW1teV9oY2QgdXNiIGNvbnRyb2xsZXINCj4gPiB0aGlzIGNhbiByZXN1bHQgaW4g
ZW5kbGVzcyBpbnRlcnJ1cHQgbG9vcHMgd2hlbiB0aGUgdXNidG1jIGRldmljZSBpcyBkaXNjb25u
ZWN0ZWQNCj4gZnJvbSB0aGUgaG9zdCBzeXN0ZW0uDQo+ID4NCj4gPiBTaW5jZSBob3N0IGNvbnRy
b2xsZXIgZHJpdmVycyBhbHJlYWR5IHRyeSB0byByZWNvdmVyIGZyb20gdHJhbnNtaXNzaW9uDQo+
ID4gZXJyb3JzLCB0aGVyZSBpcyBubyBuZWVkIHRvIHJlc3VibWl0IHRoZSB1cmIgb3IgdHJ5IG90
aGVyIHNvbHV0aW9ucyB0byByZXBhaXIgdGhlIGVycm9yDQo+IHNpdHVhdGlvbi4NCj4gPg0KPiA+
IEluIGNhc2Ugb2YgZXJyb3JzIHRoZSBJTlQgcGlwZSBqdXN0IHN0b3BzIHRvIHdhaXQgZm9yIGZ1
cnRoZXIgcGFja2V0cy4NCj4gPg0KPiA+IEZpeGVzOiBkYmYzZTdmNjU0YzAgKCJJbXBsZW1lbnQg
YW4gaW9jdGwgdG8gc3VwcG9ydCB0aGUgVVNNVE1DLVVTQjQ4OA0KPiA+IFJFQURfU1RBVFVTX0JZ
VEUgb3BlcmF0aW9uIikNCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiA+IFJlcG9y
dGVkLWJ5OiBzeXpib3QrZTJlYWU1NjM5ZTcyMDMzNjAwMThAc3l6a2FsbGVyLmFwcHNwb3RtYWls
LmNvbQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFFpYW5nLnpoYW5nIDxxaWFuZy56aGFuZ0B3aW5kcml2
ZXIuY29tPg0KPiA+IC0tLQ0KPiA+ICB2MS0+djI6DQo+ID4gIEFkZCBmaXhlcyBhbmQgc3RhYmxl
IHRhZ3MsIG1vZGlmeSBkZXNjcmlwdGlvbiBpbmZvcm1hdGlvbi4NCj4gPg0KPiA+ICBkcml2ZXJz
L3VzYi9jbGFzcy91c2J0bWMuYyB8IDkgKy0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgOCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9jbGFzcy91c2J0bWMuYyBiL2RyaXZlcnMvdXNiL2NsYXNzL3VzYnRtYy5jDQo+ID4g
aW5kZXgNCj4gPiA3NGQ1YTljNTIzOGEuLjczZjQxOWFkY2U2MSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3VzYi9jbGFzcy91c2J0bWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2NsYXNzL3Vz
YnRtYy5jDQo+ID4gQEAgLTIzMjQsMTcgKzIzMjQsMTAgQEAgc3RhdGljIHZvaWQgdXNidG1jX2lu
dGVycnVwdChzdHJ1Y3QgdXJiICp1cmIpDQo+ID4gIAkJZGV2X2VycihkZXYsICJvdmVyZmxvdyB3
aXRoIGxlbmd0aCAlZCwgYWN0dWFsIGxlbmd0aCBpcyAlZFxuIiwNCj4gPiAgCQkJZGF0YS0+aWlu
X3dNYXhQYWNrZXRTaXplLCB1cmItPmFjdHVhbF9sZW5ndGgpOw0KPiA+ICAJCWZhbGx0aHJvdWdo
Ow0KPiA+IC0JY2FzZSAtRUNPTk5SRVNFVDoNCj4gPiAtCWNhc2UgLUVOT0VOVDoNCj4gPiAtCWNh
c2UgLUVTSFVURE9XTjoNCj4gPiAtCWNhc2UgLUVJTFNFUToNCj4gPiAtCWNhc2UgLUVUSU1FOg0K
PiA+IC0JY2FzZSAtRVBJUEU6DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICAJCS8qIHVyYiB0ZXJtaW5h
dGVkLCBjbGVhbiB1cCAqLw0KPiA+ICAJCWRldl9kYmcoZGV2LCAidXJiIHRlcm1pbmF0ZWQsIHN0
YXR1czogJWRcbiIsIHN0YXR1cyk7DQo+ID4gIAkJcmV0dXJuOw0KPiA+IC0JZGVmYXVsdDoNCj4g
PiAtCQlkZXZfZXJyKGRldiwgInVua25vd24gc3RhdHVzIHJlY2VpdmVkOiAlZFxuIiwgc3RhdHVz
KTsNCj4gPiAgCX0NCj4gPiAgZXhpdDoNCj4gPiAgCXJ2ID0gdXNiX3N1Ym1pdF91cmIodXJiLCBH
RlBfQVRPTUlDKTsNCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiANCj4gVGhlIHBhdGNoIGxvb2tzIGdv
b2QgdG8gbWUgYW5kIGlzIHRlc3RlZCBvbiBteSBtYWNoaW5lLg0KPiANCj4gQWNrLWJ5OiBHdWlk
byBLaWVuZXIgPGd1aWRvLmtpZW5lckByb2hkZS1zY2h3YXJ6LmNvbT4NCj4gDQo+IC1HdWlkbw0K
DQpHcmVnLA0KDQpDYW4geW91IHBsZWFzZSBhZGQgdGhlIHBhdGNoIGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC11c2IvbGlzdC8/c2VyaWVzPTUyMDAzMw0KRGF2ZSwg
QWxhbiwgYW5kIEkgYXJlIG9rIHdpdGggdGhlIHBhdGNoLg0KDQotR3VpZG8NCg==
