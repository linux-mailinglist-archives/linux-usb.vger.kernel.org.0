Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7023822D495
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 06:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgGYEDP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 00:03:15 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:13923 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725766AbgGYEDN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 00:03:13 -0400
X-UUID: b7b1d70cfe0746a8953579ac1b49ae0f-20200725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=wrNd3PRaEoNQWrRRRx7QI9+lZV3Toq1+3kQDPyn9Pi8=;
        b=OBuP50CW+4PEpEl7hMT+M10SMd9gi14AkxfkWfqqvH1QODmBENwp/kREV9pyfv0GUxIqwEx5NPtH3UPRnTe3FgikbpxWAlsIy8mtQ0zJdH8Kc1ZCPzjX51MyGgCA47YybVm9VHojrgj2g6S+UuveMtVAncZTkOQ80EKY07cSd1E=;
X-UUID: b7b1d70cfe0746a8953579ac1b49ae0f-20200725
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 913825605; Sat, 25 Jul 2020 12:03:04 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 25 Jul
 2020 12:03:03 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 25 Jul 2020 12:03:01 +0800
Message-ID: <1595649711.23885.82.camel@mhfsdcap03>
Subject: Re: [PATCH v3 07/12] usb: common: Add function to get num_lanes and
 transfer rate
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, John Youn <John.Youn@synopsys.com>
Date:   Sat, 25 Jul 2020 12:01:51 +0800
In-Reply-To: <d86ccd4f97469cfe67cbce549b37d4df7cd8cb27.1595631457.git.thinhn@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
         <d86ccd4f97469cfe67cbce549b37d4df7cd8cb27.1595631457.git.thinhn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 72BEDDD5C00F7EFB17D7EFB8556ACC585D790E3CCAA746AD2E351F763CB1DD7D2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCAyMDIwLTA3LTI0IGF0IDE2OjM5IC0wNzAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+
IEFkZCBhIG5ldyBjb21tb24gZnVuY3Rpb24gdG8gcGFyc2UgbWF4aW11bV9zcGVlZCBwcm9wZXJ0
eSBzdHJpbmcgZm9yDQo+IHRoZSBzcGVjaWZpZWQgbnVtYmVyIG9mIGxhbmVzIGFuZCB0cmFuc2Zl
ciByYXRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDx0aGluaG5Ac3lub3Bz
eXMuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBBZGQgbmV3IGZ1bmN0aW9uIHRv
IHBhcnNlICJtYXhpbXVtLXNwZWVkIiBmb3IgbGFuZXMgYW5kIHRyYW5zZmVyIHJhdGUNCj4gLSBS
ZW1vdmUgc2VwYXJhdGUgZnVuY3Rpb25zIGdldHRpbmcgbnVtX2xhbmVzIGFuZCB0cmFuc2ZlciBy
YXRlIHByb3BlcnRpZXMNCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBOZXcgY29tbWl0DQo+IA0KPiAg
ZHJpdmVycy91c2IvY29tbW9uL2NvbW1vbi5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tDQo+ICBpbmNsdWRlL2xpbnV4L3VzYi9jaDkuaCAgICAgfCAy
NSArKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9j
b21tb24vY29tbW9uLmMgYi9kcml2ZXJzL3VzYi9jb21tb24vY29tbW9uLmMNCj4gaW5kZXggMTQz
MzI2MGQ5OWI0Li41M2I0OTUwYzQ5ZTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2NvbW1v
bi9jb21tb24uYw0KPiArKysgYi9kcml2ZXJzL3VzYi9jb21tb24vY29tbW9uLmMNCj4gQEAgLTc3
LDE4ICs3Nyw1OSBAQCBjb25zdCBjaGFyICp1c2Jfc3BlZWRfc3RyaW5nKGVudW0gdXNiX2Rldmlj
ZV9zcGVlZCBzcGVlZCkNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0xfR1BMKHVzYl9zcGVlZF9zdHJp
bmcpOw0KPiAgDQo+IC1lbnVtIHVzYl9kZXZpY2Vfc3BlZWQgdXNiX2dldF9tYXhpbXVtX3NwZWVk
KHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3ZvaWQgdXNiX2dldF9tYXhpbXVtX3NwZWVkX2FuZF9u
dW1fbGFuZXMoc3RydWN0IGRldmljZSAqZGV2LA0KPiArCQkJCQkgZW51bSB1c2JfZGV2aWNlX3Nw
ZWVkICpzcGVlZCwNCj4gKwkJCQkJIGVudW0gdXNiX3BoeV9nZW4gKmdlbiwNCj4gKwkJCQkJIHU4
ICpudW1fbGFuZXMpDQo+ICB7DQo+ICAJY29uc3QgY2hhciAqbWF4aW11bV9zcGVlZDsNCj4gKwll
bnVtIHVzYl9kZXZpY2Vfc3BlZWQgbWF0Y2hlZF9zcGVlZCA9IFVTQl9TUEVFRF9VTktOT1dOOw0K
PiArCWVudW0gdXNiX3BoeV9nZW4gbWF0Y2hlZF9nZW4gPSBVU0JfUEhZX0dFTl9VTktOT1dOOw0K
PiArCXU4IG1hdGNoZWRfbnVtX2xhbmVzID0gMDsNCj4gIAlpbnQgcmV0Ow0KPiAgDQo+ICAJcmV0
ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfc3RyaW5nKGRldiwgIm1heGltdW0tc3BlZWQiLCAmbWF4
aW11bV9zcGVlZCk7DQo+ICAJaWYgKHJldCA8IDApDQo+IC0JCXJldHVybiBVU0JfU1BFRURfVU5L
Tk9XTjsNCj4gKwkJZ290byBkb25lOw0KPiAgDQo+ICAJcmV0ID0gbWF0Y2hfc3RyaW5nKHNwZWVk
X25hbWVzLCBBUlJBWV9TSVpFKHNwZWVkX25hbWVzKSwgbWF4aW11bV9zcGVlZCk7DQo+ICsJaWYg
KHJldCA+PSAwKSB7DQo+ICsJCW1hdGNoZWRfc3BlZWQgPSByZXQ7DQo+ICsJCWdvdG8gZG9uZTsN
Cj4gKwl9DQo+ICsNCj4gKwlpZiAoc3RybmNtcCgic3VwZXItc3BlZWQtcGx1cy1nZW4yeDIiLCBt
YXhpbXVtX3NwZWVkLCAyMykgPT0gMCkgew0KPiArCQltYXRjaGVkX3NwZWVkID0gVVNCX1NQRUVE
X1NVUEVSX1BMVVM7DQo+ICsJCW1hdGNoZWRfZ2VuID0gVVNCX1BIWV9HRU5fMjsNCj4gKwkJbWF0
Y2hlZF9udW1fbGFuZXMgPSAyOw0KPiArCX0gZWxzZSBpZiAoc3RybmNtcCgic3VwZXItc3BlZWQt
cGx1cy1nZW4yeDEiLCBtYXhpbXVtX3NwZWVkLCAyMykgPT0gMCkgew0KPiArCQltYXRjaGVkX3Nw
ZWVkID0gVVNCX1NQRUVEX1NVUEVSX1BMVVM7DQo+ICsJCW1hdGNoZWRfZ2VuID0gVVNCX1BIWV9H
RU5fMjsNCj4gKwkJbWF0Y2hlZF9udW1fbGFuZXMgPSAxOw0KPiArCX0gZWxzZSBpZiAoc3RybmNt
cCgic3VwZXItc3BlZWQtcGx1cy1nZW4xeDIiLCBtYXhpbXVtX3NwZWVkLCAyMykgPT0gMCkgew0K
PiArCQltYXRjaGVkX3NwZWVkID0gVVNCX1NQRUVEX1NVUEVSX1BMVVM7DQo+ICsJCW1hdGNoZWRf
Z2VuID0gVVNCX1BIWV9HRU5fMTsNCj4gKwkJbWF0Y2hlZF9udW1fbGFuZXMgPSAyOw0KPiArCX0N
Cj4gKw0KPiArZG9uZToNCj4gKwlpZiAoc3BlZWQpDQo+ICsJCSpzcGVlZCA9IG1hdGNoZWRfc3Bl
ZWQ7DQo+ICsNCj4gKwlpZiAobnVtX2xhbmVzKQ0KPiArCQkqbnVtX2xhbmVzID0gbWF0Y2hlZF9u
dW1fbGFuZXM7DQo+ICsNCj4gKwlpZiAoZ2VuKQ0KPiArCQkqZ2VuID0gbWF0Y2hlZF9nZW47DQo+
ICt9DQo+ICtFWFBPUlRfU1lNQk9MX0dQTCh1c2JfZ2V0X21heGltdW1fc3BlZWRfYW5kX251bV9s
YW5lcyk7DQo+ICsNCj4gK2VudW0gdXNiX2RldmljZV9zcGVlZCB1c2JfZ2V0X21heGltdW1fc3Bl
ZWQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCWVudW0gdXNiX2RldmljZV9zcGVlZCBz
cGVlZDsNCj4gIA0KPiAtCXJldHVybiAocmV0IDwgMCkgPyBVU0JfU1BFRURfVU5LTk9XTiA6IHJl
dDsNCj4gKwl1c2JfZ2V0X21heGltdW1fc3BlZWRfYW5kX251bV9sYW5lcyhkZXYsICZzcGVlZCwg
TlVMTCwgTlVMTCk7DQo+ICsJcmV0dXJuIHNwZWVkOw0KPiAgfQ0KPiAgRVhQT1JUX1NZTUJPTF9H
UEwodXNiX2dldF9tYXhpbXVtX3NwZWVkKTsNCj4gIA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC91c2IvY2g5LmggYi9pbmNsdWRlL2xpbnV4L3VzYi9jaDkuaA0KPiBpbmRleCAwMTE5MTY0
OWEwYWQuLjQ2Y2ZkNzJlNzA4MiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC91c2IvY2g5
LmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC91c2IvY2g5LmgNCj4gQEAgLTU3LDYgKzU3LDEzIEBA
IGVudW0gdXNiX2xpbmtfcHJvdG9jb2wgew0KPiAgCVVTQl9MUF9TU1AgPSAxLA0KPiAgfTsNCj4g
IA0KPiArLyogVVNCIHBoeSBzaWduYWxpbmcgcmF0ZSBnZW4gKi8NCj4gK2VudW0gdXNiX3BoeV9n
ZW4gew0KPiArCVVTQl9QSFlfR0VOX1VOS05PV04sDQo+ICsJVVNCX1BIWV9HRU5fMSwNCj4gKwlV
U0JfUEhZX0dFTl8yLA0KPiArfTsNClRoZSBHRU5fMSwgR0VOXzIgd2lsbCBkZXNjcmliZSB0aGUg
Y2FwYWJpbGl0eSBvZiBub3Qgb25seSBQSFkgYnV0IGFsc28NCk1BQywgYWRkIF9QSFlfIHNlZW1z
IGEgbGl0dGxlIGFtYmlndW91cywgSSB0aGluaw0KdXNiX2dldF9tYXhpbXVtX3NwZWVkX2FuZF9u
dW1fbGFuZXMoKSBpcyBtYWlubHkgdXNlZCB0byBnZXQgdGhlDQpjYXBhYmlsaXR5IG9mIE1BQy4g
QW5vdGhlciwgbm90IHN1aXRhYmxlIHRvIGFkZCBwcm9wZXJ0eSBhYm91dCBQSFkNCmNhcGFibGl0
eSBpbiBNQUMgbm9kZXMuDQoNCj4gKw0KPiAgLyoqDQo+ICAgKiBzdHJ1Y3QgdXNiX3N1Ymxpbmtf
c3BlZWQgLSBzdWJsaW5rIHNwZWVkIGF0dHJpYnV0ZQ0KPiAgICogQGlkOiBzdWJsaW5rIHNwZWVk
IGF0dHJpYnV0ZSBJRCAoU1NJRCkNCj4gQEAgLTk1LDYgKzEwMiwyNCBAQCBleHRlcm4gY29uc3Qg
Y2hhciAqdXNiX2VwX3R5cGVfc3RyaW5nKGludCBlcF90eXBlKTsNCj4gICAqLw0KPiAgZXh0ZXJu
IGNvbnN0IGNoYXIgKnVzYl9zcGVlZF9zdHJpbmcoZW51bSB1c2JfZGV2aWNlX3NwZWVkIHNwZWVk
KTsNCj4gIA0KPiArLyoqDQo+ICsgKiB1c2JfZ2V0X21heGltdW1fc3BlZWRfYW5kX251bV9sYW5l
cyAtIEdldCBtYXhpbXVtIHJlcXVlc3RlZCBzcGVlZCBhbmQgbnVtYmVyDQo+ICsgKiBvZiBsYW5l
cyBmb3IgYSBnaXZlbiBVU0IgY29udHJvbGxlci4NCj4gKyAqIEBkZXY6IFBvaW50ZXIgdG8gdGhl
IGdpdmVuIFVTQiBjb250cm9sbGVyIGRldmljZQ0KPiArICogQHNwZWVkOiBXaGVyZSB0byBvdXRw
dXQgZW51bSB1c2JfZGV2aWNlX3NwZWVkDQo+ICsgKiBAZ2VuOiBXaGVyZSB0byBvdXRwdXQgcGh5
IHNpZ25hbGluZyByYXRlIGdlbg0KPiArICogQG51bV9sYW5lczogV2hlcmUgdG8gb3V0cHV0IG51
bWJlciBvZiByZXF1ZXN0ZWQgbGFuZXMNCj4gKyAqDQo+ICsgKiBUaGlzIGZ1bmN0aW9uIGdldHMg
dGhlIG1heGltdW0gc3BlZWQgc3RyaW5nIGZyb20gcHJvcGVydHkgIm1heGltdW0tc3BlZWQiDQo+
ICsgKiBhbmQgb3V0cHV0IHRoZSBhcHByb3ByaWF0ZSBzcGVlZCBvZiB0aGUgZGV2aWNlLiBJZiB0
aGUgbWF4aW11bS1zcGVlZCBzdHJpbmcNCj4gKyAqIGlzIHN1cGVyLXNwZWVkLXBsdXMtZ2VuKiwg
dGhlbiBpdCBhbHNvIG91dHB1dHMgdGhlIG51bWJlciBvZiBsYW5lcyBhbmQgcGh5DQo+ICsgKiBz
aWduYWxpbmcgcmF0ZSAnR2VuJyB2YWx1ZS4NCj4gKyAqLw0KPiArZXh0ZXJuIHZvaWQgdXNiX2dl
dF9tYXhpbXVtX3NwZWVkX2FuZF9udW1fbGFuZXMoc3RydWN0IGRldmljZSAqZGV2LA0KPiArCQkJ
CQkJZW51bSB1c2JfZGV2aWNlX3NwZWVkICpzcGVlZCwNCj4gKwkJCQkJCWVudW0gdXNiX3BoeV9n
ZW4gKmdlbiwNCj4gKwkJCQkJCXU4ICpudW1fbGFuZXMpOw0KPiArDQo+ICAvKioNCj4gICAqIHVz
Yl9nZXRfbWF4aW11bV9zcGVlZCAtIEdldCBtYXhpbXVtIHJlcXVlc3RlZCBzcGVlZCBmb3IgYSBn
aXZlbiBVU0INCj4gICAqIGNvbnRyb2xsZXIuDQoNCg==

