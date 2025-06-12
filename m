Return-Path: <linux-usb+bounces-24703-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93512AD71E7
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 15:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BDBE1881FCA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 13:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2A123D2AE;
	Thu, 12 Jun 2025 13:23:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB1A1F3FF8;
	Thu, 12 Jun 2025 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.181.117.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734622; cv=none; b=JBM9u3oUUzfmqzvlA8ylhO3EZf/aJjCw5mdl77lKeOu1QSl5tzxXR6GXHPzeHXqiQWvi6CVH0ZsEn6I0K953pAjE4dPyMSbUTHh91V+edmnJ0ERn0ptJbyvZmn5FGE5AeP/PAjnELtvnDiAUcEA42tY9TznDKcaJ338rTTcb/EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734622; c=relaxed/simple;
	bh=CjC/uGzJEVUpBaE85gY/ClqB7/INXmnC+09yAR3VxZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=upvbGcsm/3+MKh0yB4k45qyMOKqVJ6TUeFpPQhw73rbJcpb5uht5CNAHb6M8swJKMCBgGp1/Cfq2UJyW+vgur+WhqGIBdmzJygYMX7pBhZOAR4hngN4dj+qgLmkXss+hLLCqt6ygCM/Fs7270cKiilKYJXKs6l3Gku5st5/UhAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se; spf=pass smtp.mailfrom=actia.se; arc=none smtp.client-ip=212.181.117.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actia.se
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 15:23:29 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Thu, 12 Jun 2025 15:23:29 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Xu Yang <xu.yang_2@nxp.com>, Shawn Guo <shawnguo@kernel.org>
CC: Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo2@yeah.net>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Topic: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Index: AQHb2Uk8r5zPXewyY0SsDNZZa8wLobP8IguAgANEOoA=
Date: Thu, 12 Jun 2025 13:23:29 +0000
Message-ID: <5acfd382-28d5-4d74-997c-361499cc0bb0@actia.se>
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
x-esetid: 37303A2955B14453627066
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EC7C100E2B7A54AB77B49BD07CAB556@actia.se>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgWHUsIFNoYXduLA0KDQpPbiA2LzEwLzI1IDE6MzAgUE0sIFh1IFlhbmcgd3JvdGU6DQo+IEhp
IEpvaG4sDQo+IA0KPiBPbiBNb24sIEp1biAwOSwgMjAyNSBhdCAwMjoxNzozMFBNICswMDAwLCBK
b2huIEVybmJlcmcgd3JvdGU6DQo+PiBIaSBTaGF3biwgWHUsDQo+Pg0KPj4gT24gTW9uLCBKdW4g
MDksIDIwMjUgYXQgMDc6NTM6MjJQTSArMDgwMCwgWHUgWWFuZyB3cm90ZToNCj4+PiBIaSBTaGF3
biwNCj4+Pg0KPj4+IFRoYW5rcyBmb3IgeW91ciByZXBvcnRzIQ0KPj4+DQo+Pj4gT24gTW9uLCBK
dW4gMDksIDIwMjUgYXQgMDE6MzE6MDZQTSArMDgwMCwgU2hhd24gR3VvIHdyb3RlOg0KPj4+PiBI
aSBYdSwgUGV0ZXIsDQo+Pj4+DQo+Pj4+IEknbSBzZWVpbmcgYSBrZXJuZWwgaGFuZ3VwIG9uIGlt
eDhtbS1ldmsgYm9hcmQuICBJdCBoYXBwZW5zIHdoZW46DQo+Pj4+DQo+Pj4+ICAgLSBVU0IgZ2Fk
Z2V0IGlzIGVuYWJsZWQgYXMgRXRoZXJuZXQNCj4+Pj4gICAtIFRoZXJlIGlzIGRhdGEgdHJhbnNm
ZXIgb3ZlciBVU0IgRXRoZXJuZXQNCj4+Pj4gICAtIERldmljZSBpcyBnb2luZyBpbi9vdXQgc3Vz
cGVuZA0KPj4+Pg0KPj4+PiBBIHNpbXBsZSB3YXkgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZSBjb3Vs
ZCBiZToNCj4+Pj4NCj4+Pj4gICAxLiBDb3B5IGEgYmlnIGZpbGUgKGxpa2UgNTAwTUIpIGZyb20g
aG9zdCBQQyB0byBkZXZpY2Ugd2l0aCBzY3ANCj4+Pj4NCj4+Pj4gICAyLiBXaGlsZSB0aGUgZmls
ZSBjb3B5IGlzIG9uZ29pbmcsIHN1c3BlbmQgJiByZXN1bWUgdGhlIGRldmljZSBsaWtlOg0KPj4+
Pg0KPj4+PiAgICAgICQgZWNobyArMyA+IC9zeXMvY2xhc3MvcnRjL3J0YzAvd2FrZWFsYXJtOyBl
Y2hvIG1lbSA+IC9zeXMvcG93ZXIvc3RhdGUNCj4+Pj4NCj4+Pj4gICAzLiBUaGUgZGV2aWNlIHdp
bGwgaGFuZyB1cCB0aGVyZQ0KPj4+Pg0KPj4+PiBJIHJlcHJvZHVjZWQgb24gdGhlIGZvbGxvd2lu
ZyBrZXJuZWxzOg0KPj4+Pg0KPj4+PiAgIC0gTWFpbmxpbmUga2VybmVsDQo+Pj4+ICAgLSBOWFAg
a2VybmVsIGxmLTYuNi55DQo+Pj4+ICAgLSBOWFAga2VybmVsIGxmLTYuMTIueQ0KPj4+Pg0KPj4+
PiBCdXQgTlhQIGtlcm5lbCBsZi02LjEueSBkb2Vzbid0IGhhdmUgdGhpcyBwcm9ibGVtLiAgSSB0
cmFja2VkIGl0IGRvd24gdG8NCj4+Pj4gUGV0ZXIncyBjb21taXQgWzFdIG9uIGxmLTYuMS55LCBh
bmQgZm91bmQgdGhhdCB0aGUgZ2FkZ2V0IGRpc2Nvbm5lY3QgJg0KPj4+PiBjb25uZWN0IGNhbGxz
IGdvdCBsb3N0IGZyb20gc3VzcGVuZCAmIHJlc3VtZSBob29rcywgd2hlbiB0aGUgY29tbWl0IHdl
cmUNCj4+Pj4gc3BsaXQgYW5kIHB1c2hlZCB1cHN0cmVhbS4gIEkgY29uZmlybSB0aGF0IGFkZGlu
ZyB0aGUgY2FsbHMgYmFjayBmaXhlcw0KPj4+PiB0aGUgaGFuZ3VwLg0KPj4NCj4+IFdlIHByb2Jh
Ymx5IHJhbiBpbnRvIHRoZSBzYW1lIHByb2JsZW0gdHJ5aW5nIHRvIGJyaW5nIG9uYm9hcmQgNi4x
MiwgZ29pbmcNCj4+IGZyb20gNi4xLCBvbiBpTVg4UVhQLiBJIG1hbmFnZWQgdG8gdHJhY2UgdGhl
IGhhbmcgdG8gRVAgcHJpbWluZyB0aHJvdWdoIGENCj4+IGNvbWJpbmF0aW9uIG9mIGRlYnVnIHRy
YWNpbmcgYW5kIEJVR19PTiBleHBlcmltZW50cy4gU2VlIGlmIGl0IHN0YXJ0cw0KPj4gc3BsYXRp
biB3aXRoIHRoZSBiZWxvdyBjaGFuZ2UuDQo+Pg0KPj4gLS0tLS0tLS0tLS0tLS0tLS0+OC0tLS0t
LS0tLS0tLS0tLS0tLQ0KPj4NCj4+ID5Gcm9tIDA5MjU5OWFiNmY5ZTIwNDEyYTdjYTFlYjExOGRk
MmJlODBjZDE4ZmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQo+PiBGcm9tOiBKb2huIEVybmJl
cmcgPGpvaG4uZXJuYmVyZ0BhY3RpYS5zZT4NCj4+IERhdGU6IE1vbiwgNSBNYXkgMjAyNSAwOTow
OTowMSArMDIwMA0KPj4gU3ViamVjdDogW1BBVENIXSBVU0I6IGNpOiBnYWRnZXQ6IFBhbmljIGlm
IHByaW1pbmcgd2hlbiBnYWRnZXQgb2ZmDQo+Pg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvdXNiL2No
aXBpZGVhL3VkYy5jIHwgNCArKystDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY2hpcGlk
ZWEvdWRjLmMgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMuYw0KPj4gaW5kZXggMmZlYTI2M2E1
ZTMwLi41NDRhYTRmYTJkMWQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS91
ZGMuYw0KPj4gKysrIGIvZHJpdmVycy91c2IvY2hpcGlkZWEvdWRjLmMNCj4+IEBAIC0yMDMsOCAr
MjAzLDEwIEBAIHN0YXRpYyBpbnQgaHdfZXBfcHJpbWUoc3RydWN0IGNpX2hkcmMgKmNpLCBpbnQg
bnVtLCBpbnQgZGlyLCBpbnQgaXNfY3RybCkNCj4+DQo+PiAgICAgIGh3X3dyaXRlKGNpLCBPUF9F
TkRQVFBSSU1FLCB+MCwgQklUKG4pKTsNCj4+DQo+PiAtICAgd2hpbGUgKGh3X3JlYWQoY2ksIE9Q
X0VORFBUUFJJTUUsIEJJVChuKSkpDQo+PiArICAgd2hpbGUgKGh3X3JlYWQoY2ksIE9QX0VORFBU
UFJJTUUsIEJJVChuKSkpIHsNCj4+ICAgICAgICAgIGNwdV9yZWxheCgpOw0KPj4gKyAgICAgICBC
VUdfT04oZGlyID09IFRYICYmICFod19yZWFkKGNpLCBPUF9FTkRQVENUUkwgKyBudW0sIEVORFBU
Q1RSTF9UWEUpKTsNCj4+ICsgICB9DQo+PiAgICAgIGlmIChpc19jdHJsICYmIGRpciA9PSBSWCAm
JiBod19yZWFkKGNpLCBPUF9FTkRQVFNFVFVQU1RBVCwgQklUKG51bSkpKQ0KPj4gICAgICAgICAg
cmV0dXJuIC1FQUdBSU47DQo+Pg0KPj4gLS0tLS0tLS0tLS0tLS0tLS0+OC0tLS0tLS0tLS0tLS0t
LS0tLQ0KPj4NCj4+IE9uIHRoZSBpTVg4UVhQIHlvdSBtYXkgYWRkaXRpb25hbGx5IHJ1biBpbnRv
IGFzeWNocm9ub3VzIGFib3J0cyBhbmQgU0Vycm9yDQo+PiBkdWUgdG8gcmVzb3VyY2UgYmVpbmcg
ZGlzYWJsZWQuDQo+Pg0KPj4+Pg0KPj4+PiAtLS04PC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+
DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMuYyBiL2RyaXZlcnMv
dXNiL2NoaXBpZGVhL3VkYy5jDQo+Pj4+IGluZGV4IDhhOWIzMWZkNWM4OS4uNzIzMjlhN2VhYzRk
IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMuYw0KPj4+PiArKysg
Yi9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMuYw0KPj4+PiBAQCAtMjM3NCw2ICsyMzc0LDkgQEAg
c3RhdGljIHZvaWQgdWRjX3N1c3BlbmQoc3RydWN0IGNpX2hkcmMgKmNpKQ0KPj4+PiAgICAgICAg
ICAgKi8NCj4+Pj4gICAgICAgICAgaWYgKGh3X3JlYWQoY2ksIE9QX0VORFBUTElTVEFERFIsIH4w
KSA9PSAwKQ0KPj4+PiAgICAgICAgICAgICAgICAgIGh3X3dyaXRlKGNpLCBPUF9FTkRQVExJU1RB
RERSLCB+MCwgfjApOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgaWYgKGNpLT5kcml2ZXIgJiYgY2kt
PnZidXNfYWN0aXZlICYmIChjaS0+Z2FkZ2V0LnN0YXRlICE9IFVTQl9TVEFURV9TVVNQRU5ERUQp
KQ0KPj4+PiArICAgICAgICAgICAgICAgdXNiX2dhZGdldF9kaXNjb25uZWN0KCZjaS0+Z2FkZ2V0
KTsNCj4+Pj4gICB9DQo+Pj4+DQo+Pj4+ICAgc3RhdGljIHZvaWQgdWRjX3Jlc3VtZShzdHJ1Y3Qg
Y2lfaGRyYyAqY2ksIGJvb2wgcG93ZXJfbG9zdCkNCj4+Pj4gQEAgLTIzODQsNiArMjM4Nyw5IEBA
IHN0YXRpYyB2b2lkIHVkY19yZXN1bWUoc3RydWN0IGNpX2hkcmMgKmNpLCBib29sIHBvd2VyX2xv
c3QpDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgT1RHU0Nf
QlNWSVMgfCBPVEdTQ19CU1ZJRSk7DQo+Pj4+ICAgICAgICAgICAgICAgICAgaWYgKGNpLT52YnVz
X2FjdGl2ZSkNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIHVzYl9nYWRnZXRfdmJ1c19k
aXNjb25uZWN0KCZjaS0+Z2FkZ2V0KTsNCj4+Pj4gKyAgICAgICB9IGVsc2Ugew0KPj4+PiArICAg
ICAgICAgICAgICAgaWYgKGNpLT5kcml2ZXIgJiYgY2ktPnZidXNfYWN0aXZlKQ0KPj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICB1c2JfZ2FkZ2V0X2Nvbm5lY3QoJmNpLT5nYWRnZXQpOw0KPj4+
PiAgICAgICAgICB9DQo+Pj4+DQo+Pj4+ICAgICAgICAgIC8qIFJlc3RvcmUgdmFsdWUgMCBpZiBp
dCB3YXMgc2V0IGZvciBwb3dlciBsb3N0IGNoZWNrICovDQo+Pj4+DQo+Pj4+IC0tLS0+OC0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiANCj4gRG9lcyBhYm92ZSBjaGFuZ2Ugd29yayBmb3IgeW91Pw0KPiAN
Cg0KSSBoYXZlIHJhbiBzdXNwZW5kL3Jlc3VtZSB0ZXN0cyBmb3IgYWJvdXQgMTIgaG91cnMgbm93
IHdpdGggdGhpcyBjaGFuZ2UgDQphbmQgbm90IGhhZCBhbnkgdHJvdWJsZSBvbiBpTVg4UVhQLCB3
aGVyZSBpdCB3YXMgbm90IHBvc3NpYmxlIHRvIHJ1biANCnN1Y2ggdGVzdHMgZm9yIHNvIGxvbmcg
YmVmb3JlLg0KDQpQbGVhc2UgcGljayB1cCBpZiB5b3Ugc3VibWl0IHRoaXMgZm9ybWFsbHk6DQoN
ClRlc3RlZC1ieTogSm9obiBFcm5iZXJnIDxqb2huLmVybmJlcmdAYWN0aWEuc2U+ICMgaU1YOFFY
UA0KDQpUaGFua3MhIC8vIEpvaG4gRXJuYmVyZw==

