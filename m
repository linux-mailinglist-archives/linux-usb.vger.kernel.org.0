Return-Path: <linux-usb+bounces-3823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCC28084CE
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 984D8B21A97
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 09:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D02635262;
	Thu,  7 Dec 2023 09:37:54 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAEF10DE;
	Thu,  7 Dec 2023 01:37:47 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3B79YadV6053910, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3B79YadV6053910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Dec 2023 17:34:36 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 7 Dec 2023 17:34:36 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 7 Dec 2023 17:34:36 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Thu, 7 Dec 2023 17:34:36 +0800
From: =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan@kernel.org>,
        "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Rob Herring
	<robh@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Heikki Krogerus
	<heikki.krogerus@linux.intel.com>,
        Flavio Suligoi <f.suligoi@asem.it>,
        =?utf-8?B?UmljYXJkbyBDYcOxdWVsbw==?= <ricardo.canuelo@collabora.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v3 RESEND 1/4] phy: core: add notify_connect and notify_disconnect callback
Thread-Topic: [PATCH v3 RESEND 1/4] phy: core: add notify_connect and
 notify_disconnect callback
Thread-Index: AQHaKOCi19hiykumv0upIYLDPa/PFrCc/hyAgACHmGA=
Date: Thu, 7 Dec 2023 09:34:36 +0000
Message-ID: <922b768b3be4404a88a906cddebdc8df@realtek.com>
References: <20231207074022.14116-1-stanley_chang@realtek.com>
 <c0af54de-2664-4c20-2d01-7fc64c98b238@gmail.com>
In-Reply-To: <c0af54de-2664-4c20-2d01-7fc64c98b238@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

SGkgU2VyZ2VpLA0KDQo+IA0KPiANCj4gT24gMTIvNy8yMyAxMDozOCBBTSwgU3RhbmxleSBDaGFu
ZyB3cm90ZToNCj4gDQo+ID4gSW4gUmVhbHRlayBTb0MsIHRoZSBwYXJhbWV0ZXIgb2YgdXNiIHBo
eSBpcyBkZXNpZ25lZCB0byBjYW4gZHluYW1pYw0KPiA+IHR1bmluZyBiYXNlIG9uIHBvcnQgc3Rh
dHVzLiBUaGVyZWZvcmUsIGFkZCBhIG5vdGlmeSBjYWxsYmFjayBvZiBwaHkNCj4gDQo+ICAgIFRv
IGJlIGFibGUgdG8gZG8gZHluYW1pYyB0dW5pbmcgYmFzZWQgaW4gdGhlIHBvcnQgc3RhdHVzLCBt
YXliZT8NCg0KT2theSwgSSB3aWxsIHJldmlzZS4NCg0KPiA+IGRyaXZlciB3aGVuIHVzYiBjb25u
ZWN0aW9uL2Rpc2Nvbm5lY3Rpb24gY2hhbmdlLg0KDQoNCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFu
bGV5IENoYW5nIDxzdGFubGV5X2NoYW5nQHJlYWx0ZWsuY29tPg0KPiBbLi4uXQ0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3BoeS9waHktY29yZS5jIGIvZHJpdmVycy9waHkvcGh5LWNvcmUuYyBp
bmRleA0KPiA+IDk2YTBiMWUxMTFmMy4uYTg0YWQ0ODk2YjdmIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvcGh5L3BoeS1jb3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL3BoeS9waHktY29yZS5jDQo+
ID4gQEAgLTQ4OSw2ICs0ODksNTMgQEAgaW50IHBoeV9jYWxpYnJhdGUoc3RydWN0IHBoeSAqcGh5
KSAgfQ0KPiA+IEVYUE9SVF9TWU1CT0xfR1BMKHBoeV9jYWxpYnJhdGUpOw0KPiA+DQo+ID4gKy8q
Kg0KPiA+ICsgKiBwaHlfbm90aWZ5X2Nvbm5lY3QoKSAtIHBoeSBjb25uZWN0IG5vdGlmeQ0KPiAN
Cj4gICAgTm90aWZpY2F0aW9uPw0KDQpPa2F5LCBJIHdpbGwgcmV2aXNlLg0KDQo+ID4gKyAqIEBw
aHk6IHRoZSBwaHkgcmV0dXJuZWQgYnkgcGh5X2dldCgpDQo+ID4gKyAqIEBwb3J0OiB0aGUgcG9y
dCBpbmRleCBmb3IgY29ubmVjdA0KPiA+ICsgKg0KPiA+ICsgKiBJZiBwaHkgbmVlZCB0aGUgZ2V0
IGNvbm5lY3Rpb24gc3RhdHVzLCB0aGUgY2FsbGJhY2sgY2FuIGJlIHVzZWQuDQo+IA0KPiAgICBJ
ZiB0aGUgUEhZIG5lZWRzIHRvIGdldCB0aGUgY29ubmVjdGlvbiBzdGF0dXMsIG1heWJlPw0KPiAN
Cj4gPiArICogUmV0dXJuczogJTAgaWYgc3VjY2Vzc2Z1bCwgYSBuZWdhdGl2ZSBlcnJvciBjb2Rl
IG90aGVyd2lzZSAgKi8gaW50DQo+ID4gK3BoeV9ub3RpZnlfY29ubmVjdChzdHJ1Y3QgcGh5ICpw
aHksIGludCBwb3J0KSB7DQo+ID4gKyAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgaWYg
KCFwaHkgfHwgIXBoeS0+b3BzLT5jb25uZWN0KQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7
DQo+ID4gKw0KPiA+ICsgICAgIG11dGV4X2xvY2soJnBoeS0+bXV0ZXgpOw0KPiA+ICsgICAgIHJl
dCA9IHBoeS0+b3BzLT5jb25uZWN0KHBoeSwgcG9ydCk7DQo+ID4gKyAgICAgbXV0ZXhfdW5sb2Nr
KCZwaHktPm11dGV4KTsNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+
ICtFWFBPUlRfU1lNQk9MX0dQTChwaHlfbm90aWZ5X2Nvbm5lY3QpOw0KPiA+ICsNCj4gPiArLyoq
DQo+ID4gKyAqIHBoeV9ub3RpZnlfZGlzY29ubmVjdCgpIC0gcGh5IGRpc2Nvbm5lY3Qgbm90aWZ5
DQo+IA0KPiAgICBOb3RpZmljYXRpb24/DQoNCk9rYXksIEkgd2lsbCByZXZpc2UuDQoNCj4gPiAr
ICogQHBoeTogdGhlIHBoeSByZXR1cm5lZCBieSBwaHlfZ2V0KCkNCj4gPiArICogQHBvcnQ6IHRo
ZSBwb3J0IGluZGV4IGZvciBkaXNjb25uZWN0DQo+ID4gKyAqDQo+ID4gKyAqIElmIHBoeSBuZWVk
IHRoZSBnZXQgZGlzY29ubmVjdGlvbiBzdGF0dXMsIHRoZSBjYWxsYmFjayBjYW4gYmUgdXNlZC4N
Cj4gDQo+ICAgIElmIHRoZSBQSFkgbmVlZHMgdG8gZ2V0IHRoZSBjb25uZWN0aW9uIHN0YXR1cywg
bWF5YmU/DQoNCk9rYXksIEkgd2lsbCByZXZpc2UuDQoNClRoYW5rcywNClN0YW5sZXkNCg==

