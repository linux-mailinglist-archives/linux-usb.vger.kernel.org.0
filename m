Return-Path: <linux-usb+bounces-2617-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9ED7E3556
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 07:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EE78280F32
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 06:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A083BA28;
	Tue,  7 Nov 2023 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B775BA3B
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 06:44:45 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3159B11A;
	Mon,  6 Nov 2023 22:44:41 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3A76iR5114033888, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3A76iR5114033888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Nov 2023 14:44:27 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 7 Nov 2023 14:44:27 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 7 Nov 2023 14:44:26 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Tue, 7 Nov 2023 14:44:26 +0800
From: =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?= <stanley_chang@realtek.com>
To: Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Johan Hovold <johan+linaro@kernel.org>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: RE: [PATCH 0/3] Revert "usb: phy: add usb phy notify port status API"
Thread-Topic: [PATCH 0/3] Revert "usb: phy: add usb phy notify port status
 API"
Thread-Index: AQHaEKFYYUMOc04m8UWBbMSA7W5TDrBsnd2AgAACc4CAAcfbIA==
Date: Tue, 7 Nov 2023 06:44:26 +0000
Message-ID: <28e77cbc531248bf913ceedba6425cf6@realtek.com>
References: <20231106110654.31090-1-johan+linaro@kernel.org>
 <2023110623-pointing-stump-643d@gregkh> <ZUjM/VEliT5c8H4C@matsya>
In-Reply-To: <ZUjM/VEliT5c8H4C@matsya>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

SGkgSm9oYW4gYW5kIFZpbm9kLA0KDQpJIG1vZGlmaWVkIHRoZSBSZWFsdGVrIHBoeSB0byBzb2x2
ZSB0aGlzIGlzc3VlIGFuZCBvbmx5IHVzZSB0aGUgZ2VuZXJpYyBQSFkuDQpBbmQgc3VibWl0dGVk
IHRoZXNlIHBhdGNoZXMgdG9kYXkgYXMgZm9sbG93cw0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtdXNiLzIwMjMxMTA3MDYzNTE4LjI3ODI0LTEtc3RhbmxleV9jaGFuZ0ByZWFsdGVrLmNv
bS8NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8yMDIzMTEwNzA2MzUxOC4yNzgy
NC0yLXN0YW5sZXlfY2hhbmdAcmVhbHRlay5jb20vDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC11c2IvMjAyMzExMDcwNjM1MTguMjc4MjQtMy1zdGFubGV5X2NoYW5nQHJlYWx0ZWsuY29t
Lw0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzIwMjMxMTA3MDYzNTE4LjI3ODI0
LTQtc3RhbmxleV9jaGFuZ0ByZWFsdGVrLmNvbS8NCg0KSSBkb24ndCB0aGluayB0aGlzIHBhdGNo
IGlzIG5lZWRlZCB0byByZXZlcnQgYTA4Nzk5Y2YxN2MyICgidXNiOnBoeTogTmV3IHVzYiBwaHkg
bm90aWZpY2F0aW9uIHBvcnQgc3RhdHVzIEFQSSIpLg0KDQpUaGFua3MsDQpTdGFubGV5DQoNCj4g
T24gMDYtMTEtMjMsIDEyOjE1LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6DQo+ID4gT24gTW9u
LCBOb3YgMDYsIDIwMjMgYXQgMTI6MDY6NTFQTSArMDEwMCwgSm9oYW4gSG92b2xkIHdyb3RlOg0K
PiA+ID4gVGhlIHJlY2VudGx5IGFkZGVkIFJlYWx0ZWsgUEhZIGRyaXZlcnMgZGVwZW5kIG9uIHRo
ZSBuZXcgcG9ydCBzdGF0dXMNCj4gPiA+IG5vdGlmaWNhdGlvbiBtZWNoYW5pc20gd2hpY2ggd2Fz
IGJ1aWx0IG9uIHRoZSBkZXByZWNhdGVkIFVTQiBQSFkNCj4gPiA+IGltcGxlbWVudGF0aW9uIGFu
ZCBkZXZpY2V0cmVlIGJpbmRpbmcuDQo+ID4gPg0KPiA+ID4gU3BlY2lmaWNhbGx5LCB1c2luZyB0
aGVzZSBQSFlzIHdvdWxkIHJlcXVpcmUgZGVzY3JpYmluZyB0aGUgdmVyeQ0KPiA+ID4gc2FtZSBQ
SFkgdXNpbmcgYm90aCB0aGUgZ2VuZXJpYyAicGh5IiBwcm9wZXJ0eSBhbmQgdGhlIGRlcHJlY2F0
ZWQNCj4gInVzYi1waHkiDQo+ID4gPiBwcm9wZXJ0eSB3aGljaCBpcyBjbGVhcmx5IHdyb25nLg0K
PiA+ID4NCj4gPiA+IFdlIHNob3VsZCBub3QgYmUgYnVpbGRpbmcgbmV3IGZ1bmN0aW9uYWxpdHkg
b24gdG9wIG9mIHRoZSBsZWdhY3kgVVNCDQo+ID4gPiBQSFkgaW1wbGVtZW50YXRpb24gZXZlbiBp
ZiBpdCBpcyBjdXJyZW50bHkgc3R1Y2sgaW4gc29tZSBraW5kIG9mDQo+ID4gPiB0cmFuc2l0aW9u
YWwgbGltYm8uDQo+ID4gPg0KPiA+ID4gUmV2ZXJ0IHRoZSBuZXcgUmVhbHRlayBQSFkgZHJpdmVy
cyBmb3Igbm93IHNvIHRoYXQgdGhlIHBvcnQgc3RhdHVzDQo+ID4gPiBub3RpZmljYXRpb24gaW50
ZXJmYWNlIGNhbiBiZSByZXZlcnRlZCBhbmQgcmVwbGFjZWQgYmVmb3JlIHdlIGRpZw0KPiA+ID4g
b3Vyc2VsdmVzIGludG8gYW4gZXZlbiBkZWVwZXIgaG9sZSB3aXRoIHRoaXMgUEhZIG1lc3MuDQo+
ID4gPg0KPiA+ID4gTm90ZSB0aGF0IHRoZXJlIGFyZSBubyB1cHN0cmVhbSB1c2VycyBvZiB0aGVz
ZSBQSFlzIGFuZCB0aGUgZHJpdmVycw0KPiA+ID4gd2VyZSBvbmx5IGluY2x1ZGVkIGluIDYuNiBz
byB0aGVyZSBzaG91bGQgc3RpbGwgYmUgdGltZSB0byB1bmRvIHRoaXMuDQo+ID4NCj4gPiBObyB1
c2VycyBvZiB0aGVzZSBwaHkgZHJpdmVycyB5ZXQ/ICBXaHkgd2VyZSB0aGV5IGFkZGVkPw0KPiAN
Cj4gTm90IHN1cmUgd2h5LCB0aGV5IGRpZG50IGdvIHRocnUgcGh5IHNzIQ0KPiANCj4gPg0KPiA+
ID4gUHJlZmVyYWJseSB0aGVzZSBzaG91bGQgZ28gaW4gdGhyb3VnaCBHcmVnJ3MgdHJlZSBmb3Ig
Ni43LXJjMS4NCj4gPg0KPiA+IEknbGwgYmUgZ2xhZCB0byB0YWtlIHRoaXMgaWYgSSBjYW4gZ2V0
IGFuIGFjayBmb3IgaXQuDQo+IA0KPiBQbHMgZG8gZHJvcCB0aGlzOg0KPiANCj4gQWNrZWQtYnk6
IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+DQo+IA0KPiAtLQ0KPiB+Vmlub2QNCg==

