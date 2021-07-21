Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B313D0E02
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 13:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238477AbhGULBI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 07:01:08 -0400
Received: from mail02.rohde-schwarz.com ([80.246.32.97]:57277 "EHLO
        mail02.rohde-schwarz.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238914AbhGUKto (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 06:49:44 -0400
X-Greylist: delayed 903 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Jul 2021 06:49:44 EDT
Received: from amu316.rsint.net (10.0.26.65) by mail-emea.rohde-schwarz.com
 (172.21.64.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.858.12; Wed, 21 Jul
 2021 13:15:06 +0200
Received: from GMU419.rsint.net ([10.0.230.184])
          by amu316.rsint.net (Totemo SMTP Server) with SMTP ID 184;
          Wed, 21 Jul 2021 13:15:06 +0200 (CEST)
Received: from GMU002.rsint.net (10.0.2.26) by GMU419.rsint.net (10.0.230.184)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2242.10; Wed, 21 Jul
 2021 13:15:05 +0200
Received: from GMU006.rsint.net (10.0.2.28) by GMU002.rsint.net (10.0.2.26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2242.10; Wed, 21
 Jul 2021 13:15:04 +0200
Received: from GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b]) by
 GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b%12]) with mapi id
 15.01.2242.010; Wed, 21 Jul 2021 13:15:04 +0200
From:   Guido Kiener <Guido.Kiener@rohde-schwarz.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Zhang, Qiang" <Qiang.Zhang@windriver.com>
CC:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "dvyukov@google.com" <dvyukov@google.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        "dpenkler@gmail.com" <dpenkler@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Topic: [PATCH] USB: usbtmc: Fix RCU stall warning /ur/
Thread-Index: Add+IWUwK7pDw0yGQ/uBCkz/1sU4ww==
Date:   Wed, 21 Jul 2021 11:15:04 +0000
Message-ID: <9cde635b5b5244d5971673612cc10acc@rohde-schwarz.com>
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
X-GBS-PROC: JG0h9sNiYjtEkfUAPnTkopXQkQfW/csVP+tVrDaKnu3C7zo8V6tQgsNcYQD3Sa8N0ccgriXY6xraxEczdMkyJhH+RUijWxwR7XUctTgt/7TOeJXy9nPWfMhC3KIVc4uN
X-GBS-PROCJOB: 9uuSGy08FkdNzxsn2WYrzI9dPQ+iMJUalTQ7Zgz9bazY/qEhc5fZTdXuB55ZTt/O
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcmVnIEtIIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDIxLCAyMDIxIDk6NTMg
QU0NCj4gVG86IFpoYW5nLCBRaWFuZyA8UWlhbmcuWmhhbmdAd2luZHJpdmVyLmNvbT4NCj4gQ2M6
IHN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHU7IGR2eXVrb3ZAZ29vZ2xlLmNvbTsgcGF1bG1ja0Br
ZXJuZWwub3JnOw0KPiBkcGVua2xlckBnbWFpbC5jb207IEtpZW5lciBHdWlkbyAxNERTMSA8R3Vp
ZG8uS2llbmVyQHJvaGRlLXNjaHdhcnouY29tPjsNCj4gbGludXgtdXNiQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiAqRVhUKiBSZTogW1BBVENIXSBVU0I6IHVzYnRtYzogRml4IFJDVSBzdGFs
bCB3YXJuaW5nDQo+IA0KPiBPbiBXZWQsIEp1bCAyMSwgMjAyMSBhdCAwNzozMDozOUFNICswMDAw
LCBaaGFuZywgUWlhbmcgd3JvdGU6DQo+ID4NCj4gPg0KPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gPiBGcm9tOiBHcmVnIEtIIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4NCj4gPiBTZW50OiBXZWRuZXNkYXksIDIxIEp1bHkgMjAyMSAxNTowOA0KPiA+
IFRvOiBaaGFuZywgUWlhbmcNCj4gPiBDYzogc3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdTsgZHZ5
dWtvdkBnb29nbGUuY29tOyBwYXVsbWNrQGtlcm5lbC5vcmc7DQo+ID4gZHBlbmtsZXJAZ21haWwu
Y29tOyBndWlkby5raWVuZXJAcm9oZGUtc2Nod2Fyei5jb207DQo+ID4gbGludXgtdXNiQHZnZXIu
a2VybmVsLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFVTQjogdXNidG1jOiBGaXggUkNV
IHN0YWxsIHdhcm5pbmcNCj4gPg0KPiA+IFtQbGVhc2Ugbm90ZTogVGhpcyBlLW1haWwgaXMgZnJv
bSBhbiBFWFRFUk5BTCBlLW1haWwgYWRkcmVzc10NCj4gPg0KPiA+IE9uIFR1ZSwgSnVuIDI5LCAy
MDIxIGF0IDExOjMyOjM2QU0gKzA4MDAsIHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20gd3JvdGU6
DQo+ID4gPiBGcm9tOiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20+DQo+ID4NCj4g
PiA+SSBuZWVkIGEgImZ1bGwiIG5hbWUgaGVyZSwgYW5kIGluIHRoZSBzaWduZWQtb2ZmLWJ5IGxp
bmUgcGxlYXNlLg0KPiA+DQo+ID4gPg0KPiA+ID4gcmN1OiBJTkZPOiByY3VfcHJlZW1wdCBzZWxm
LWRldGVjdGVkIHN0YWxsIG9uIENQVQ0KPiA+ID4gcmN1OiAgICAxLS4uLiE6ICgyIHRpY2tzIHRo
aXMgR1ApIGlkbGU9ZDkyLzEvMHg0MDAwMDAwMDAwMDAwMDAwDQo+ID4gPiAgICAgICAgIHNvZnRp
cnE9MjUzOTAvMjUzOTIgZnFzPTMNCj4gPiA+ICAgICAgICAgKHQ9MTIxNjQgamlmZmllcyBnPTMx
NjQ1IHE9NDMyMjYpDQo+ID4gPiByY3U6IHJjdV9wcmVlbXB0IGt0aHJlYWQgc3RhcnZlZCBmb3Ig
MTIxNjIgamlmZmllcyEgZzMxNjQ1IGYweDANCj4gPiA+ICAgICAgUkNVX0dQX1dBSVRfRlFTKDUp
IC0+c3RhdGU9MHgwIC0+Y3B1PTANCj4gPiA+IHJjdTogICAgVW5sZXNzIHJjdV9wcmVlbXB0IGt0
aHJlYWQgZ2V0cyBzdWZmaWNpZW50IENQVSB0aW1lLA0KPiA+ID4gICAgICAgICBPT00gaXMgbm93
IGV4cGVjdGVkIGJlaGF2aW9yLg0KPiA+ID4gcmN1OiBSQ1UgZ3JhY2UtcGVyaW9kIGt0aHJlYWQg
c3RhY2sgZHVtcDoNCj4gPiA+IHRhc2s6cmN1X3ByZWVtcHQgICAgIHN0YXRlOlIgIHJ1bm5pbmcg
dGFzaw0KPiA+ID4NCj4gPiA+IEluIHRoZSBjYXNlIG9mIHN5c3RlbSB1c2UgZHVtbXlfaGNkIGFz
IHVzYiBjb250cm9sbGVyLCB3aGVuIHRoZQ0KPiA+ID4gdXNidG1jIGRldmljZXMgaXMgZGlzY29u
bmVjdGVkLCBpbiB1c2J0bWNfaW50ZXJydXB0KCksIGlmIHRoZSB1cmINCj4gPiA+IHN0YXR1cyBp
cyB1bmtub3duLCB0aGUgdXJiIHdpbGwgYmUgcmVzdWJtaXQsIHRoZSB1cmIgbWF5IGJlIGluc2Vy
dA0KPiA+ID4gdG8gZHVtX2hjZC0+dXJicF9saXN0IGFnYWluLCB0aGlzIHdpbGwgY2F1c2UgdGhl
IGR1bW15X3RpbWVyKCkgbm90DQo+ID4gPiB0byBleGl0IGZvciBhIGxvbmcgdGltZSwgYmVhY2F1
c2UgdGhlIGR1bW15X3RpbWVyKCkgYmUgY2FsbGVkIGluDQo+ID4gPiBzb2Z0aXJxIGFuZCBsb2Nh
bF9iaCBpcyBkaXNhYmxlLCB0aGlzIG5vdCBvbmx5IGNhdXNlcyB0aGUgUkNVDQo+ID4gPiByZWFk
aW5nIGNyaXRpY2FsIGFyZWEgdG8gY29uc3VtZSB0b28gbXVjaCB0aW1lIGJ1dCBhbHNvIG1ha2Vz
IHRoZQ0KPiA+ID4gdGFza3MgaW4gdGhlIGN1cnJlbnQgQ1BVIHJ1bnEgbm90IHJ1biBpbiB0aW1l
LCBhbmQgdGhhdCB0cmlnZ2VyZWQgUkNVIHN0YWxsLg0KPiA+ID4NCj4gPiA+IHJldHVybiBkaXJl
Y3RseSB3aGVuIGZpbmQgdGhlIHVyYiBzdGF0dXMgaXMgbm90IHplcm8gdG8gZml4IGl0Lg0KPiA+
ID4NCj4gPiA+IFJlcG9ydGVkLWJ5OiBzeXpib3QrZTJlYWU1NjM5ZTcyMDMzNjAwMThAc3l6a2Fs
bGVyLmFwcHNwb3RtYWlsLmNvbQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWnFpYW5nIDxxaWFuZy56
aGFuZ0B3aW5kcml2ZXIuY29tPg0KPiA+DQo+ID4gPldoYXQgY29tbWl0IGRvZXMgdGhpcyBmaXg/
ICBEb2VzIGl0IG5lZWQgdG8gZ28gdG8gc3RhYmxlIGtlcm5lbHM/DQo+ID4NCj4gPiAgSSB3aWxs
IGFkZCBmaXggdGFncyByZXNlbmQsICAgbmVlZCB0byBnbyB0byBzdGFibGUga2VybmVsDQo+ID4N
Cj4gPiA+DQo+ID4gPldoYXQgYWJvdXQgdGhlIHVzYnRtYyBtYWludGFpbmVycywgd2hhdCBkbyB0
aGV5IHRoaW5rIGFib3V0IHRoaXM/DQoNCkknbSBvayB3aXRoIHRoZSBmaXguIEl0IHdpbGwgbWFr
ZSB0aGUgc3l6Ym90IGFuZCBkdW1teV9oY2QgY29udHJvbGxlciBoYXBweSB3aGVuIHVzaW5nDQp0
aGUgdXNidG1jIGRyaXZlci4gTmV2ZXJ0aGVsZXNzIHRoZXJlIGFyZSBtYW55IG90aGVyIHVzYiBr
ZXJuZWwgZHJpdmVyIHRoYXQgcmVzdWJtaXQNCnRoZSB1cmIgd2hlbiB0aGUgY2FsbGJhY2sgaGFu
ZGxlciBkZXRlY3RzIHRoZSB1cmIgc3RhdHVzID0gLUVQUk9UTy4NClNvIEkgZXhwZWN0IHRoZSBp
c3N1ZSB3aWxsIHJlaGFwcGVuIHdpdGggb3RoZXIgdXNiIGRyaXZlcnMgYWdhaW4uDQpJbiAibm9y
bWFsIiBlbnZpcm9ubWVudHMgdGhlIHVyYiBzdGF0dXMgPSAtRVBST1RPIHdpbGwgbW9zdGx5IGhh
cHBlbiB3aGVuIHRoZSBjYWJsZSBpcw0KZGlzY29ubmVjdGVkLCBidXQgaXQgZG9lcyBub3QgZnJl
ZXplIHRoZSBrZXJuZWwgYW5kIHNodXRzIGRvd24gdGhlIGNvbm5lY3Rpb24gYXMgdXN1YWwuDQpV
cCB0byBub3cgd2UgaGF2ZSBubyBjdXN0b21lciBmZWVkYmFjayB3aGljaCBpcyBibGFtaW5nIHRo
aXMgaXNzdWUuIEkgaG9wZSB0aGlzIGhlbHBzLg0KDQotR3VpZG8NCg==
