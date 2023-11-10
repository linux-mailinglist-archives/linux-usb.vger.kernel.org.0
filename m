Return-Path: <linux-usb+bounces-2777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D797E7B69
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 11:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D86CC1C20C9D
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 10:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612B01119A;
	Fri, 10 Nov 2023 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F122B1DFC4
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 10:34:41 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2C329518;
	Fri, 10 Nov 2023 02:34:40 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AAAWeTwA2216507, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AAAWeTwA2216507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Nov 2023 18:32:40 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 10 Nov 2023 18:32:40 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 10 Nov 2023 18:32:27 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Fri, 10 Nov 2023 18:32:27 +0800
From: =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
To: Johan Hovold <johan@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul
	<vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        "Geert
 Uytterhoeven" <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Yang Yingliang <yangyingliang@huawei.com>,
        "Roy Luo" <royluo@google.com>,
        =?utf-8?B?UmljYXJkbyBDYcOxdWVsbw==?= <ricardo.canuelo@collabora.com>,
        Heikki
 Krogerus <heikki.krogerus@linux.intel.com>,
        Flavio Suligoi
	<f.suligoi@asem.it>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: RE: [PATCH v3 2/4] phy: realtek: usb: add new driver for the Realtek RTD SoC USB 2.0 PHY
Thread-Topic: [PATCH v3 2/4] phy: realtek: usb: add new driver for the Realtek
 RTD SoC USB 2.0 PHY
Thread-Index: AQHaE5l5ctLLstQ3Tk2a3KBdVPlRybBypw6AgACz7bA=
Date: Fri, 10 Nov 2023 10:32:27 +0000
Message-ID: <8e6f152f175d4e9da54c05fad46ed796@realtek.com>
References: <20231110054738.23515-1-stanley_chang@realtek.com>
 <20231110054738.23515-2-stanley_chang@realtek.com>
 <ZU3gHcugq9FxBG4P@hovoldconsulting.com>
In-Reply-To: <ZU3gHcugq9FxBG4P@hovoldconsulting.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.190.159]
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
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

SGkgSm9oYW4sDQoNCj4gT24gRnJpLCBOb3YgMTAsIDIwMjMgYXQgMDE6NDU6MTNQTSArMDgwMCwg
U3RhbmxleSBDaGFuZyB3cm90ZToNCj4gPiBSZWFsdGVrIERIQyAoZGlnaXRhbCBob21lIGNlbnRl
cikgUlREIFNvQ3Mgc3VwcG9ydCBEV0MzIFhIQ0kgVVNCDQo+ID4gY29udHJvbGxlci4gQWRkZWQg
dGhlIGRyaXZlciB0byBkcml2ZSB0aGUgVVNCIDIuMCBQSFkgdHJhbnNjZWl2ZXJzLg0KPiA+DQo+
ID4gTm90ZTogTmV3IGRyaXZlcixyZW1vdmUgdGhlIHBvcnQgc3RhdHVzIG5vdGlmaWNhdGlvbiBv
biBsZWdhY3kgVVNCIFBIWS4NCj4gPiBVc2UgdGhlIGdlbmVyaWMgUEhZIHRvIG5vdGlmeSB0aGUg
dXNiIGRldmljZSBjb25uZWN0IGFuZCBkaXNjb25uZWN0Lg0KPiA+IFRvIGF2b2lkIHVzaW5nIHRo
ZXNlIFBIWXMgd291bGQgcmVxdWlyZSBkZXNjcmliaW5nIHRoZSB2ZXJ5IHNhbWUgUEhZDQo+ID4g
dXNpbmcgYm90aCB0aGUgZ2VuZXJpYyAicGh5IiBwcm9wZXJ0eSBhbmQgdGhlIGRlcHJlY2F0ZWQg
InVzYi1waHkiDQo+ID4gcHJvcGVydHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFubGV5
IENoYW5nIDxzdGFubGV5X2NoYW5nQHJlYWx0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IHYxIHRvIHYy
IGNoYW5nZToNCj4gPiAgICAgcmViYXNlIHRoZSBkcml2ZXIgdG8gaW5jbHVkZSB0aGUgcmV2ZXJ0
IHBhcnQgb24NCj4gPiAgICAgN2E3ODRiY2RkN2U1NGYwNTk5ZGEzYjIzNjBlNDcyMjM4NDEyNjIz
ZQ0KPiA+IHYyIHRvIHYzIGNoYW5nZToNCj4gPiAgICAgcmVtb3ZlIE1PRFVMRV9BTElBUw0KPiAN
Cj4gRG9uJ3Qgc2VuZCBvdXQgYSBuZXcgdmVyc2lvbiBvZiBhIHBhdGNoIHNlcmllcyBpbW1lZGlh
dGVseSBqdXN0IHRvIGZpeA0KPiBzb21ldGhpbmcgc21hbGwgbGlrZSB0aGlzLg0KPiANCj4gSW4g
dGhpcyBjYXNlIEknZCBzdWdnZXN0IHlvdSB3YWl0IGF0IGxlYXN0IHVudGlsIHlvdSd2ZSBnb3R0
ZW4gZmVlZGJhY2sgb24gdGhlDQo+IG5ldyBub3RpZmljYXRpb24gaW1wbGVtZW50YXRpb24uDQo+
IA0KT2theSwgSSB3aWxsIGF2b2lkIHRoaXMgc21hbGwgY2hhbmdlIG5leHQgdGltZS4NClRoYW5r
cyBmb3IgeW91ciByZW1pbmRlci4NCg0KVGhhbmtzLA0KU3RhbmxleQ0K

