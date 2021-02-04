Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A65B830F05A
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 11:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235355AbhBDKRv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 05:17:51 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:46565 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235341AbhBDKRs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Feb 2021 05:17:48 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-168-QZvnfjNePRqvfXAAwXTP6w-1; Thu, 04 Feb 2021 10:16:09 +0000
X-MC-Unique: QZvnfjNePRqvfXAAwXTP6w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 4 Feb 2021 10:16:08 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Thu, 4 Feb 2021 10:16:07 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Thinh Nguyen' <Thinh.Nguyen@synopsys.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: RE: [RFC PATCH 6/8] usb: xhci: Fix port minor revision
Thread-Topic: [RFC PATCH 6/8] usb: xhci: Fix port minor revision
Thread-Index: AQHW+RV+hDKTpHds3UON+skS200saKpEkq2AgAEPbgCAAijX8A==
Date:   Thu, 4 Feb 2021 10:16:07 +0000
Message-ID: <064f005f25794769b5c551609fcdc3f2@AcuMS.aculab.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
 <4627ca7e922019cd9a37073db90e4e9cd585c97e.1612237179.git.Thinh.Nguyen@synopsys.com>
 <90627b9d-9a39-b5ee-4ae3-054764a57faa@gmail.com>
 <5efc3bb3-1320-f382-c6f6-b8cefd91b8ce@synopsys.com>
In-Reply-To: <5efc3bb3-1320-f382-c6f6-b8cefd91b8ce@synopsys.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RnJvbTogVGhpbmggTmd1eWVuDQo+IFNlbnQ6IDAzIEZlYnJ1YXJ5IDIwMjEgMDE6MTYNCj4gDQo+
IFNlcmdlaSBTaHR5bHlvdiB3cm90ZToNCj4gPiBIZWxsbyENCj4gPg0KPiA+IE9uIDAyLjAyLjIw
MjEgNjo0MiwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+DQo+ID4+IFNvbWUgaG9zdHMgaW5jb3Jy
ZWN0bHkgdXNlIHN1Yi1taW5vciB2ZXJzaW9uIGZvciBtaW5vciB2ZXJzaW9uIChpLmUuDQo+ID4+
IDB4MDIgaW5zdGVhZCBvZiAweDIwIGZvciBiY2RVU0IgMHgzMjAgYW5kIDB4MDEgZm9yIGJjZFVT
QiAweDMxMCkuDQo+ID4+IEN1cnJlbnRseSB0aGUgeEhDSSBkcml2ZXIgd29ya3MgYXJvdW5kIHRo
aXMgYnkganVzdCBjaGVja2luZyBmb3IgbWlub3INCj4gPj4gcmV2aXNpb24gPiAweDAxIGZvciBV
U0IgMy4xIGV2ZXJ5d2hlcmUuIFdpdGggdGhlIGFkZGl0aW9uIG9mIFVTQiAzLjIsDQo+ID4+IGNo
ZWNraW5nIHRoaXMgZ2V0cyBhIGJpdCBjdW1iZXJzb21lLiBTaW5jZSB0aGVyZSBpcyBubyBVU0Ig
cmVsZWFzZSB3aXRoDQo+ID4+IGJjZFVTQiAweDMwMSB0byAweDMwOSwgd2UgY2FuIGFzc3VtZSB0
aGF0IHN1Yi1taW5vciB2ZXJzaW9uIDAxIHRvIDA5IGlzDQo+ID4+IGluY29ycmVjdC4gTGV0J3Mg
dHJ5IHRvIGZpeCB0aGlzIGFuZCB1c2UgdGhlIG1pbm9yIHJldmlzaW9uIHRoYXQgbWF0Y2hlcw0K
PiA+PiB3aXRoIHRoZSBVU0IveEhDSSBzcGVjIHRvIGhlbHAgd2l0aCB0aGUgdmVyc2lvbiBjaGVj
a2luZyB3aXRoaW4gdGhlDQo+ID4+IGRyaXZlci4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTog
VGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiA+PiAtLS0NCj4gPj4g
wqAgZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jIHwgOSArKysrKysrKysNCj4gPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvaG9zdC94aGNpLW1lbS5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jDQo+
ID4+IGluZGV4IGYyYzRlZTdjNDc4Ni4uMzQxMDViNDc3YzYyIDEwMDY0NA0KPiA+PiAtLS0gYS9k
cml2ZXJzL3VzYi9ob3N0L3hoY2ktbWVtLmMNCj4gPj4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94
aGNpLW1lbS5jDQo+ID4+IEBAIC0yMTI5LDYgKzIxMjksMTUgQEAgc3RhdGljIHZvaWQgeGhjaV9h
ZGRfaW5fcG9ydChzdHJ1Y3QgeGhjaV9oY2QNCj4gPj4gKnhoY2ksIHVuc2lnbmVkIGludCBudW1f
cG9ydHMsDQo+ID4+IMKgIMKgwqDCoMKgwqAgaWYgKG1ham9yX3JldmlzaW9uID09IDB4MDMpIHsN
Cj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJodWIgPSAmeGhjaS0+dXNiM19yaHViOw0KPiA+PiAr
wqDCoMKgwqDCoMKgwqAgLyoNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBTb21lIGhvc3RzIGlu
Y29ycmVjdGx5IHVzZSBzdWItbWlub3IgdmVyc2lvbiBmb3IgbWlub3INCj4gPj4gK8KgwqDCoMKg
wqDCoMKgwqAgKiB2ZXJzaW9uIChpLmUuIDB4MDIgaW5zdGVhZCBvZiAweDIwIGZvciBiY2RVU0Ig
MHgzMjAgYW5kIDB4MDENCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBmb3IgYmNkVVNCIDB4MzEw
KS4gU2luY2UgdGhlcmUgaXMgbm8gVVNCIHJlbGVhc2Ugd2l0aCBzdWINCj4gPj4gK8KgwqDCoMKg
wqDCoMKgwqAgKiBtaW5vciB2ZXJzaW9uIDB4MzAxIHRvIDB4MzA5LCB3ZSBjYW4gYXNzdW1lIHRo
YXQgdGhleSBhcmUNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBpbmNvcnJlY3QgYW5kIGZpeCBp
dCBoZXJlLg0KPiA+PiArwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiA+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKCEobWlub3JfcmV2aXNpb24gJiAweGYwKSAmJiAobWlub3JfcmV2aXNpb24gJiAweDBmKSkN
Cj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWlub3JfcmV2aXNpb24gPSBtaW5vcl9yZXZp
c2lvbiA8PCA0Ow0KPiA+DQo+ID4gwqDCoCBXaHkgbm90Og0KPiA+DQo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBtaW5vcl9yZXZpc2lvbiA8PD0gNDsNCj4gPg0KPiA+IFsuLi5dDQo+ID4NCj4g
PiBNQlIsIFNlcmdlaQ0KPiANCj4gU3VyZSwgd2UgY2FuIGRvIHRoYXQuDQoNCklzbid0IGl0IGp1
c3Q6DQoJCWlmIChtaW5vcl9yZXZpc2lvbiA8IDB4MTApDQoJCQltaW5vcl9yZXZpc2lvbiA8PD0g
NDsNCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBS
b2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9u
IE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

