Return-Path: <linux-usb+bounces-24671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B459AD3C39
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 17:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987731BA112C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 15:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581D823506D;
	Tue, 10 Jun 2025 15:05:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43069225A5B;
	Tue, 10 Jun 2025 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.181.117.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749567919; cv=none; b=CpNWt5LNif7d4IcEvWySIfH30V0NZPx1q+QdWMiMC4bWjOKM0c5ffLWMVbsoV1TpqZBDk3c9e33sDhaJNKrEazcpPje65MBVPSLRnUwRZ0b8+CxHk+sl1n5igtvX0OZPlOuOBhwxJ7uIfdp0AYMriFYDuHuWxOFi+mg6EceE9ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749567919; c=relaxed/simple;
	bh=fgyqr2VSwZft01wwmePX/9fb8MG0zuAyG3Xa6crGPW8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ffGCBSD3n0P2UBnjn6Xb1JQpo/t5BPlAQxZMD7gJCR0NgaA0SQ/D/moX89+sCd41vvjPao/TkiIBK67+r5KsLG3/wzFguDhDhbkd5dPpmwpEK1S5AEjKzLUVNEKNFnDqMbj0OkWbDO9dtgmjxDNgJYQlh/7vGvoOPtpBqN/iQYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se; spf=pass smtp.mailfrom=actia.se; arc=none smtp.client-ip=212.181.117.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actia.se
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:05:15 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Tue, 10 Jun 2025 17:05:15 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Shawn Guo <shawnguo2@yeah.net>, Peter Chen <peter.chen@kernel.org>, "Shawn
 Guo" <shawnguo@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Topic: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Index: AQHb2Uk8r5zPXewyY0SsDNZZa8wLobP8IguAgAA7/4A=
Date: Tue, 10 Jun 2025 15:05:15 +0000
Message-ID: <4fc6ec7a-ab2d-4b2c-b1f7-7902010c8682@actia.se>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEbstxkQmji4tfjf@w447anl.localdomain>
 <k6j2za47cp4ccyfkevwpx2x5s4bjrxxqhqvteyspbf2n7yxcff@ccztqeuhn2di>
In-Reply-To: <k6j2za47cp4ccyfkevwpx2x5s4bjrxxqhqvteyspbf2n7yxcff@ccztqeuhn2di>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-esetresult: clean, is OK
x-esetid: 37303A2955B14453627660
Content-Type: text/plain; charset="utf-8"
Content-ID: <6142381A428FC447986A4F4CDC66E534@actia.se>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgWHUsDQoNCk9uIDYvMTAvMjUgMTozMCBQTSwgWHUgWWFuZyB3cm90ZToNCj4gSGkgSm9obiwN
Cj4gDQo+IE9uIE1vbiwgSnVuIDA5LCAyMDI1IGF0IDAyOjE3OjMwUE0gKzAwMDAsIEpvaG4gRXJu
YmVyZyB3cm90ZToNCj4+IEhpIFNoYXduLCBYdSwNCj4+DQo+PiBPbiBNb24sIEp1biAwOSwgMjAy
NSBhdCAwNzo1MzoyMlBNICswODAwLCBYdSBZYW5nIHdyb3RlOg0KPj4+IEhpIFNoYXduLA0KPj4+
DQo+Pj4gVGhhbmtzIGZvciB5b3VyIHJlcG9ydHMhDQo+Pj4NCj4+PiBPbiBNb24sIEp1biAwOSwg
MjAyNSBhdCAwMTozMTowNlBNICswODAwLCBTaGF3biBHdW8gd3JvdGU6DQo+Pj4+IEhpIFh1LCBQ
ZXRlciwNCj4+Pj4NCj4+Pj4gSSdtIHNlZWluZyBhIGtlcm5lbCBoYW5ndXAgb24gaW14OG1tLWV2
ayBib2FyZC4gIEl0IGhhcHBlbnMgd2hlbjoNCj4+Pj4NCj4+Pj4gICAtIFVTQiBnYWRnZXQgaXMg
ZW5hYmxlZCBhcyBFdGhlcm5ldA0KPj4+PiAgIC0gVGhlcmUgaXMgZGF0YSB0cmFuc2ZlciBvdmVy
IFVTQiBFdGhlcm5ldA0KPj4+PiAgIC0gRGV2aWNlIGlzIGdvaW5nIGluL291dCBzdXNwZW5kDQo+
Pj4+DQo+Pj4+IEEgc2ltcGxlIHdheSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIGNvdWxkIGJlOg0K
Pj4+Pg0KPj4+PiAgIDEuIENvcHkgYSBiaWcgZmlsZSAobGlrZSA1MDBNQikgZnJvbSBob3N0IFBD
IHRvIGRldmljZSB3aXRoIHNjcA0KPj4+Pg0KPj4+PiAgIDIuIFdoaWxlIHRoZSBmaWxlIGNvcHkg
aXMgb25nb2luZywgc3VzcGVuZCAmIHJlc3VtZSB0aGUgZGV2aWNlIGxpa2U6DQo+Pj4+DQo+Pj4+
ICAgICAgJCBlY2hvICszID4gL3N5cy9jbGFzcy9ydGMvcnRjMC93YWtlYWxhcm07IGVjaG8gbWVt
ID4gL3N5cy9wb3dlci9zdGF0ZQ0KPj4+Pg0KPj4+PiAgIDMuIFRoZSBkZXZpY2Ugd2lsbCBoYW5n
IHVwIHRoZXJlDQo+Pj4+DQo+Pj4+IEkgcmVwcm9kdWNlZCBvbiB0aGUgZm9sbG93aW5nIGtlcm5l
bHM6DQo+Pj4+DQo+Pj4+ICAgLSBNYWlubGluZSBrZXJuZWwNCj4+Pj4gICAtIE5YUCBrZXJuZWwg
bGYtNi42LnkNCj4+Pj4gICAtIE5YUCBrZXJuZWwgbGYtNi4xMi55DQo+Pj4+DQo+Pj4+IEJ1dCBO
WFAga2VybmVsIGxmLTYuMS55IGRvZXNuJ3QgaGF2ZSB0aGlzIHByb2JsZW0uICBJIHRyYWNrZWQg
aXQgZG93biB0bw0KPj4+PiBQZXRlcidzIGNvbW1pdCBbMV0gb24gbGYtNi4xLnksIGFuZCBmb3Vu
ZCB0aGF0IHRoZSBnYWRnZXQgZGlzY29ubmVjdCAmDQo+Pj4+IGNvbm5lY3QgY2FsbHMgZ290IGxv
c3QgZnJvbSBzdXNwZW5kICYgcmVzdW1lIGhvb2tzLCB3aGVuIHRoZSBjb21taXQgd2VyZQ0KPj4+
PiBzcGxpdCBhbmQgcHVzaGVkIHVwc3RyZWFtLiAgSSBjb25maXJtIHRoYXQgYWRkaW5nIHRoZSBj
YWxscyBiYWNrIGZpeGVzDQo+Pj4+IHRoZSBoYW5ndXAuDQo+Pg0KPj4gV2UgcHJvYmFibHkgcmFu
IGludG8gdGhlIHNhbWUgcHJvYmxlbSB0cnlpbmcgdG8gYnJpbmcgb25ib2FyZCA2LjEyLCBnb2lu
Zw0KPj4gZnJvbSA2LjEsIG9uIGlNWDhRWFAuIEkgbWFuYWdlZCB0byB0cmFjZSB0aGUgaGFuZyB0
byBFUCBwcmltaW5nIHRocm91Z2ggYQ0KPj4gY29tYmluYXRpb24gb2YgZGVidWcgdHJhY2luZyBh
bmQgQlVHX09OIGV4cGVyaW1lbnRzLiBTZWUgaWYgaXQgc3RhcnRzDQo+PiBzcGxhdGluIHdpdGgg
dGhlIGJlbG93IGNoYW5nZS4NCj4+DQo+PiAtLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0t
LS0tLS0tDQo+Pg0KPj4gPkZyb20gMDkyNTk5YWI2ZjllMjA0MTJhN2NhMWViMTE4ZGQyYmU4MGNk
MThmZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+IEZyb206IEpvaG4gRXJuYmVyZyA8am9o
bi5lcm5iZXJnQGFjdGlhLnNlPg0KPj4gRGF0ZTogTW9uLCA1IE1heSAyMDI1IDA5OjA5OjAxICsw
MjAwDQo+PiBTdWJqZWN0OiBbUEFUQ0hdIFVTQjogY2k6IGdhZGdldDogUGFuaWMgaWYgcHJpbWlu
ZyB3aGVuIGdhZGdldCBvZmYNCj4+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy91c2IvY2hpcGlkZWEv
dWRjLmMgfCA0ICsrKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMu
YyBiL2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+PiBpbmRleCAyZmVhMjYzYTVlMzAuLjU0
NGFhNGZhMmQxZCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+
PiArKysgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMuYw0KPj4gQEAgLTIwMyw4ICsyMDMsMTAg
QEAgc3RhdGljIGludCBod19lcF9wcmltZShzdHJ1Y3QgY2lfaGRyYyAqY2ksIGludCBudW0sIGlu
dCBkaXIsIGludCBpc19jdHJsKQ0KPj4NCj4+ICAgICAgaHdfd3JpdGUoY2ksIE9QX0VORFBUUFJJ
TUUsIH4wLCBCSVQobikpOw0KPj4NCj4+IC0gICB3aGlsZSAoaHdfcmVhZChjaSwgT1BfRU5EUFRQ
UklNRSwgQklUKG4pKSkNCj4+ICsgICB3aGlsZSAoaHdfcmVhZChjaSwgT1BfRU5EUFRQUklNRSwg
QklUKG4pKSkgew0KPj4gICAgICAgICAgY3B1X3JlbGF4KCk7DQo+PiArICAgICAgIEJVR19PTihk
aXIgPT0gVFggJiYgIWh3X3JlYWQoY2ksIE9QX0VORFBUQ1RSTCArIG51bSwgRU5EUFRDVFJMX1RY
RSkpOw0KPj4gKyAgIH0NCj4+ICAgICAgaWYgKGlzX2N0cmwgJiYgZGlyID09IFJYICYmIGh3X3Jl
YWQoY2ksIE9QX0VORFBUU0VUVVBTVEFULCBCSVQobnVtKSkpDQo+PiAgICAgICAgICByZXR1cm4g
LUVBR0FJTjsNCj4+DQo+PiAtLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tDQo+
Pg0KPj4gT24gdGhlIGlNWDhRWFAgeW91IG1heSBhZGRpdGlvbmFsbHkgcnVuIGludG8gYXN5Y2hy
b25vdXMgYWJvcnRzIGFuZCBTRXJyb3INCj4+IGR1ZSB0byByZXNvdXJjZSBiZWluZyBkaXNhYmxl
ZC4NCj4+DQo+Pj4+DQo+Pj4+IC0tLTg8LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4NCj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jIGIvZHJpdmVycy91c2IvY2hp
cGlkZWEvdWRjLmMNCj4+Pj4gaW5kZXggOGE5YjMxZmQ1Yzg5Li43MjMyOWE3ZWFjNGQgMTAwNjQ0
DQo+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+Pj4+ICsrKyBiL2RyaXZl
cnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+Pj4+IEBAIC0yMzc0LDYgKzIzNzQsOSBAQCBzdGF0aWMg
dm9pZCB1ZGNfc3VzcGVuZChzdHJ1Y3QgY2lfaGRyYyAqY2kpDQo+Pj4+ICAgICAgICAgICAqLw0K
Pj4+PiAgICAgICAgICBpZiAoaHdfcmVhZChjaSwgT1BfRU5EUFRMSVNUQUREUiwgfjApID09IDAp
DQo+Pj4+ICAgICAgICAgICAgICAgICAgaHdfd3JpdGUoY2ksIE9QX0VORFBUTElTVEFERFIsIH4w
LCB+MCk7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICBpZiAoY2ktPmRyaXZlciAmJiBjaS0+dmJ1c19h
Y3RpdmUgJiYgKGNpLT5nYWRnZXQuc3RhdGUgIT0gVVNCX1NUQVRFX1NVU1BFTkRFRCkpDQo+Pj4+
ICsgICAgICAgICAgICAgICB1c2JfZ2FkZ2V0X2Rpc2Nvbm5lY3QoJmNpLT5nYWRnZXQpOw0KPj4+
PiAgIH0NCj4+Pj4NCj4+Pj4gICBzdGF0aWMgdm9pZCB1ZGNfcmVzdW1lKHN0cnVjdCBjaV9oZHJj
ICpjaSwgYm9vbCBwb3dlcl9sb3N0KQ0KPj4+PiBAQCAtMjM4NCw2ICsyMzg3LDkgQEAgc3RhdGlj
IHZvaWQgdWRjX3Jlc3VtZShzdHJ1Y3QgY2lfaGRyYyAqY2ksIGJvb2wgcG93ZXJfbG9zdCkNCj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPVEdTQ19CU1ZJUyB8
IE9UR1NDX0JTVklFKTsNCj4+Pj4gICAgICAgICAgICAgICAgICBpZiAoY2ktPnZidXNfYWN0aXZl
KQ0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgdXNiX2dhZGdldF92YnVzX2Rpc2Nvbm5l
Y3QoJmNpLT5nYWRnZXQpOw0KPj4+PiArICAgICAgIH0gZWxzZSB7DQo+Pj4+ICsgICAgICAgICAg
ICAgICBpZiAoY2ktPmRyaXZlciAmJiBjaS0+dmJ1c19hY3RpdmUpDQo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHVzYl9nYWRnZXRfY29ubmVjdCgmY2ktPmdhZGdldCk7DQo+Pj4+ICAgICAg
ICAgIH0NCj4+Pj4NCj4+Pj4gICAgICAgICAgLyogUmVzdG9yZSB2YWx1ZSAwIGlmIGl0IHdhcyBz
ZXQgZm9yIHBvd2VyIGxvc3QgY2hlY2sgKi8NCj4+Pj4NCj4+Pj4gLS0tLT44LS0tLS0tLS0tLS0t
LS0tLS0tDQo+IA0KPiBEb2VzIGFib3ZlIGNoYW5nZSB3b3JrIGZvciB5b3U/DQoNCkkgaG9wZSB0
byBhbGxvY2F0ZSBzb21lIHRpbWUgdG8gdGVzdCB0aGlzIGluIHRoZSBuZXh0IGZldyBkYXlzLg0K
DQpCZXN0IHJlZ2FyZHMgLy8gSm9obiBFcm5iZXJn

