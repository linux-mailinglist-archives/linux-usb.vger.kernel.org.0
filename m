Return-Path: <linux-usb+bounces-3831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7674F8085B6
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 11:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E8D31C21D3B
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478C42E63A;
	Thu,  7 Dec 2023 10:45:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71EBDD57;
	Thu,  7 Dec 2023 02:45:02 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3B7AhtFP3094699, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3B7AhtFP3094699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Dec 2023 18:43:55 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 7 Dec 2023 18:43:55 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 7 Dec 2023 18:43:54 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Thu, 7 Dec 2023 18:43:54 +0800
From: =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan@kernel.org>,
        "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>, Jinjie Ruan
	<ruanjinjie@huawei.com>,
        Alan Stern <stern@rowland.harvard.edu>, Roy Luo
	<royluo@google.com>,
        Flavio Suligoi <f.suligoi@asem.it>,
        =?utf-8?B?UmljYXJkbyBDYcOxdWVsbw==?= <ricardo.canuelo@collabora.com>,
        "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: RE: [PATCH v3 RESEND 4/4] usb: core: add phy notify connect and disconnect
Thread-Topic: [PATCH v3 RESEND 4/4] usb: core: add phy notify connect and
 disconnect
Thread-Index: AQHaKODLBXJBQe+0iUGdjxaPpl61frCdEqmAgACL4zA=
Date: Thu, 7 Dec 2023 10:43:54 +0000
Message-ID: <6556cc86a350493fbf9f127cd558d76b@realtek.com>
References: <20231207074022.14116-1-stanley_chang@realtek.com>
 <20231207074022.14116-4-stanley_chang@realtek.com>
 <2023120730-mouth-jolt-0170@gregkh>
In-Reply-To: <2023120730-mouth-jolt-0170@gregkh>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
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
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

SGkgR3JlZywNCg0KPiA+ICtpbnQgdXNiX3BoeV9yb290aHViX25vdGlmeV9jb25uZWN0KHN0cnVj
dCB1c2JfcGh5X3Jvb3RodWINCj4gPiArKnBoeV9yb290aHViLCBpbnQgcG9ydCkgew0KPiA+ICsg
ICAgIHN0cnVjdCB1c2JfcGh5X3Jvb3RodWIgKnJvb3RodWJfZW50cnk7DQo+ID4gKyAgICAgc3Ry
dWN0IGxpc3RfaGVhZCAqaGVhZDsNCj4gPiArICAgICBpbnQgZXJyOw0KPiA+ICsNCj4gPiArICAg
ICBpZiAoIXBoeV9yb290aHViKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7DQo+IA0KPiBI
b3cgY2FuIHBoeV9yb290aHViIGV2ZXIgYmUgTlVMTD8NCj4gDQpUaGlzIGlzIHBvc3NpYmxlLiBJ
ZiB0aGUgaG9zdCBubyB1c2UgZ2VuZXJpYyBwaHksIHRoZW4gdXNiX3BoeV9yb290aHViX2FsbG9j
IHdpbGwgcmV0dXJuIE5VTEwuDQpBbmQgb3RoZXIgY2FsbGJhY2tzIGFsc28gZm9sbG93IHRoaXMg
cnVsZS4NCg0KPiA+ICsNCj4gPiArICAgICBoZWFkID0gJnBoeV9yb290aHViLT5saXN0Ow0KPiA+
ICsNCj4gPiArICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHJvb3RodWJfZW50cnksIGhlYWQsIGxp
c3QpIHsNCj4gPiArICAgICAgICAgICAgIGVyciA9IHBoeV9ub3RpZnlfY29ubmVjdChyb290aHVi
X2VudHJ5LT5waHksIHBvcnQpOw0KPiA+ICsgICAgICAgICAgICAgaWYgKGVycikNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsNCj4gPiArICAgICB9DQo+ID4NCj4gDQo+IFlv
dSB3YWxrIGEgbGlzdCB3aXRoIG5vIGxvY2tpbmcgYXQgYWxsPyAgVGhhdCBkb2VzIG5vdCBzZWVt
IHJpZ2h0IGF0IGFsbC4NCg0KVGhlIGxvY2sgc2VlbXMgdW5uZWNlc3NhcnkuDQpBbmQgb3RoZXIg
c2ltaWxhciBBUElzIGFsc28gZG9uJ3QgdXNlIGFueSBsb2Nrcy4NCg0KPiBBbHNvLCB0aGlzIGlz
IGEgbmV3IGZ1bmN0aW9uIHRoYXQgaXMgZXhwb3J0ZWQgd2l0aCBubyBkb2N1bWVudGF0aW9uPw0K
PiBQbGVhc2UgZml4Lg0KPiANCk9rYXksIEkgd2lsbCBhZGQuDQoNClRoYW5rcywNClN0YW5sZXkN
Cg==

