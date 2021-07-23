Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 243B93D36EB
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 10:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234584AbhGWH64 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 03:58:56 -0400
Received: from mail02.rohde-schwarz.com ([80.246.32.97]:50363 "EHLO
        mail02.rohde-schwarz.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234457AbhGWH64 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 03:58:56 -0400
Received: from amu316.rsint.net (10.0.26.65) by mail-emea.rohde-schwarz.com
 (172.21.64.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.858.12; Fri, 23 Jul
 2021 10:39:28 +0200
Received: from GMU419.rsint.net ([10.0.230.184])
          by amu316.rsint.net (Totemo SMTP Server) with SMTP ID 707;
          Fri, 23 Jul 2021 10:39:28 +0200 (CEST)
Received: from GMU003.rsint.net (10.0.2.61) by GMU419.rsint.net (10.0.230.184)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2242.10; Fri, 23 Jul
 2021 10:39:28 +0200
Received: from GMU006.rsint.net (10.0.2.28) by GMU003.rsint.net (10.0.2.61)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2242.10; Fri, 23
 Jul 2021 10:39:26 +0200
Received: from GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b]) by
 GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b%12]) with mapi id
 15.01.2242.010; Fri, 23 Jul 2021 10:39:26 +0200
From:   Guido Kiener <Guido.Kiener@rohde-schwarz.com>
To:     "qiang.zhang@windriver.com" <qiang.zhang@windriver.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "dave penkler (dpenkler@gmail.com)" <dpenkler@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2] USB: usbtmc: Fix RCU stall warning
Thread-Topic: [PATCH v2] USB: usbtmc: Fix RCU stall warning /ur/
Thread-Index: Add/nfwP6vKc8/VcQGyQyrB11A05uQ==
Date:   Fri, 23 Jul 2021 08:39:26 +0000
Message-ID: <0d5e1ff1790a4fb4a807ea8f60cc76cc@rohde-schwarz.com>
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
X-GBS-PROC: DjDBv6NzCzCWP9Xm2p+GFnO9jPsc0vPVoBlbawcdhYRw2U8B/K6JYw4VxSxN9vi/ToyWB4VwGP14OLi/lnCMV0QB4AKs9MAukg6Wtu3O9hAy1Le+J0sbSECZmcC9z1mk
X-GBS-PROCJOB: aMqa6SpsVTeqPV4MEQwRxHMDO6ZWgYEDOgJQh1dpBhj6kHNSerCRqKbDeZc0yA82
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiBGcm9tOiBRaWFuZy56aGFuZz4gDQo+IHJjdTogSU5GTzogcmN1X3ByZWVtcHQgc2VsZi1kZXRl
Y3RlZCBzdGFsbCBvbiBDUFUNCj4gcmN1OiAgICAxLS4uLiE6ICgyIHRpY2tzIHRoaXMgR1ApIGlk
bGU9ZDkyLzEvMHg0MDAwMDAwMDAwMDAwMDAwDQo+ICAgICAgICAgc29mdGlycT0yNTM5MC8yNTM5
MiBmcXM9Mw0KPiAgICAgICAgICh0PTEyMTY0IGppZmZpZXMgZz0zMTY0NSBxPTQzMjI2KQ0KPiBy
Y3U6IHJjdV9wcmVlbXB0IGt0aHJlYWQgc3RhcnZlZCBmb3IgMTIxNjIgamlmZmllcyEgZzMxNjQ1
IGYweDANCj4gICAgICBSQ1VfR1BfV0FJVF9GUVMoNSkgLT5zdGF0ZT0weDAgLT5jcHU9MA0KPiBy
Y3U6ICAgIFVubGVzcyByY3VfcHJlZW1wdCBrdGhyZWFkIGdldHMgc3VmZmljaWVudCBDUFUgdGlt
ZSwNCj4gICAgICAgICBPT00gaXMgbm93IGV4cGVjdGVkIGJlaGF2aW9yLg0KPiByY3U6IFJDVSBn
cmFjZS1wZXJpb2Qga3RocmVhZCBzdGFjayBkdW1wOg0KPiB0YXNrOnJjdV9wcmVlbXB0ICAgICBz
dGF0ZTpSICBydW5uaW5nIHRhc2sNCj4gLi4uLi4uLi4uLi4NCj4gdXNidG1jIDMtMTowLjA6IHVu
a25vd24gc3RhdHVzIHJlY2VpdmVkOiAtNzEgdXNidG1jIDMtMTowLjA6IHVua25vd24gc3RhdHVz
DQo+IHJlY2VpdmVkOiAtNzEgdXNidG1jIDMtMTowLjA6IHVua25vd24gc3RhdHVzIHJlY2VpdmVk
OiAtNzEgdXNidG1jIDMtMTowLjA6DQo+IHVua25vd24gc3RhdHVzIHJlY2VpdmVkOiAtNzEgdXNi
dG1jIDMtMTowLjA6IHVua25vd24gc3RhdHVzIHJlY2VpdmVkOiAtNzEgdXNidG1jDQo+IDMtMTow
LjA6IHVua25vd24gc3RhdHVzIHJlY2VpdmVkOiAtNzEgdXNidG1jIDMtMTowLjA6IHVua25vd24g
c3RhdHVzIHJlY2VpdmVkOiAtNzENCj4gdXNidG1jIDMtMTowLjA6IHVua25vd24gc3RhdHVzIHJl
Y2VpdmVkOiAtNzEgdXNidG1jIDMtMTowLjA6IHVzYl9zdWJtaXRfdXJiDQo+IGZhaWxlZDogLTE5
DQo+IA0KPiBUaGUgZnVuY3Rpb24gdXNidG1jX2ludGVycnVwdCgpIHJlc3VibWl0cyB1cmJzIHdo
ZW4gdGhlIGVycm9yIHN0YXR1cyBvZiBhbiB1cmIgaXMgLQ0KPiBFUFJPVE8uIEluIHN5c3RlbXMg
dXNpbmcgdGhlIGR1bW15X2hjZCB1c2IgY29udHJvbGxlciB0aGlzIGNhbiByZXN1bHQgaW4gZW5k
bGVzcw0KPiBpbnRlcnJ1cHQgbG9vcHMgd2hlbiB0aGUgdXNidG1jIGRldmljZSBpcyBkaXNjb25u
ZWN0ZWQgZnJvbSB0aGUgaG9zdCBzeXN0ZW0uDQo+IA0KPiBTaW5jZSBob3N0IGNvbnRyb2xsZXIg
ZHJpdmVycyBhbHJlYWR5IHRyeSB0byByZWNvdmVyIGZyb20gdHJhbnNtaXNzaW9uIGVycm9ycywg
dGhlcmUgaXMNCj4gbm8gbmVlZCB0byByZXN1Ym1pdCB0aGUgdXJiIG9yIHRyeSBvdGhlciBzb2x1
dGlvbnMgdG8gcmVwYWlyIHRoZSBlcnJvciBzaXR1YXRpb24uDQo+IA0KPiBJbiBjYXNlIG9mIGVy
cm9ycyB0aGUgSU5UIHBpcGUganVzdCBzdG9wcyB0byB3YWl0IGZvciBmdXJ0aGVyIHBhY2tldHMu
DQo+IA0KPiBGaXhlczogZGJmM2U3ZjY1NGMwICgiSW1wbGVtZW50IGFuIGlvY3RsIHRvIHN1cHBv
cnQgdGhlIFVTTVRNQy1VU0I0ODgNCj4gUkVBRF9TVEFUVVNfQllURSBvcGVyYXRpb24iKQ0KPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBSZXBvcnRlZC1ieTogc3l6Ym90K2UyZWFlNTYz
OWU3MjAzMzYwMDE4QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20NCj4gU2lnbmVkLW9mZi1ieTog
UWlhbmcuemhhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiAgdjEtPnYy
Og0KPiAgQWRkIGZpeGVzIGFuZCBzdGFibGUgdGFncywgbW9kaWZ5IGRlc2NyaXB0aW9uIGluZm9y
bWF0aW9uLg0KPiANCj4gIGRyaXZlcnMvdXNiL2NsYXNzL3VzYnRtYy5jIHwgOSArLS0tLS0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jbGFzcy91c2J0bWMuYyBiL2RyaXZlcnMvdXNiL2Ns
YXNzL3VzYnRtYy5jIGluZGV4DQo+IDc0ZDVhOWM1MjM4YS4uNzNmNDE5YWRjZTYxIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3VzYi9jbGFzcy91c2J0bWMuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9j
bGFzcy91c2J0bWMuYw0KPiBAQCAtMjMyNCwxNyArMjMyNCwxMCBAQCBzdGF0aWMgdm9pZCB1c2J0
bWNfaW50ZXJydXB0KHN0cnVjdCB1cmIgKnVyYikNCj4gIAkJZGV2X2VycihkZXYsICJvdmVyZmxv
dyB3aXRoIGxlbmd0aCAlZCwgYWN0dWFsIGxlbmd0aCBpcyAlZFxuIiwNCj4gIAkJCWRhdGEtPmlp
bl93TWF4UGFja2V0U2l6ZSwgdXJiLT5hY3R1YWxfbGVuZ3RoKTsNCj4gIAkJZmFsbHRocm91Z2g7
DQo+IC0JY2FzZSAtRUNPTk5SRVNFVDoNCj4gLQljYXNlIC1FTk9FTlQ6DQo+IC0JY2FzZSAtRVNI
VVRET1dOOg0KPiAtCWNhc2UgLUVJTFNFUToNCj4gLQljYXNlIC1FVElNRToNCj4gLQljYXNlIC1F
UElQRToNCj4gKwlkZWZhdWx0Og0KPiAgCQkvKiB1cmIgdGVybWluYXRlZCwgY2xlYW4gdXAgKi8N
Cj4gIAkJZGV2X2RiZyhkZXYsICJ1cmIgdGVybWluYXRlZCwgc3RhdHVzOiAlZFxuIiwgc3RhdHVz
KTsNCj4gIAkJcmV0dXJuOw0KPiAtCWRlZmF1bHQ6DQo+IC0JCWRldl9lcnIoZGV2LCAidW5rbm93
biBzdGF0dXMgcmVjZWl2ZWQ6ICVkXG4iLCBzdGF0dXMpOw0KPiAgCX0NCj4gIGV4aXQ6DQo+ICAJ
cnYgPSB1c2Jfc3VibWl0X3VyYih1cmIsIEdGUF9BVE9NSUMpOw0KPiAtLQ0KPiAyLjI1LjENCg0K
VGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUgYW5kIGlzIHRlc3RlZCBvbiBteSBtYWNoaW5lLg0K
DQpBY2stYnk6IEd1aWRvIEtpZW5lciA8Z3VpZG8ua2llbmVyQHJvaGRlLXNjaHdhcnouY29tPg0K
DQotR3VpZG8gDQo=
