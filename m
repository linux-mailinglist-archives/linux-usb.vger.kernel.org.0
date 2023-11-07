Return-Path: <linux-usb+bounces-2621-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC8B7E361E
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 08:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE8F3B20C1C
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 07:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD59CA6E;
	Tue,  7 Nov 2023 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E9BCA59
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 07:55:19 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8552DED;
	Mon,  6 Nov 2023 23:55:17 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3A77sj7W34057066, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3A77sj7W34057066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Nov 2023 15:54:45 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 7 Nov 2023 15:54:45 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 7 Nov 2023 15:54:45 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Tue, 7 Nov 2023 15:54:45 +0800
From: =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: RE: [PATCH 0/3] Revert "usb: phy: add usb phy notify port status API"
Thread-Topic: [PATCH 0/3] Revert "usb: phy: add usb phy notify port status
 API"
Thread-Index: AQHaEKFYYUMOc04m8UWBbMSA7W5TDrBsnd2AgAACc4CAAcfbIP//gVOAgACUP4A=
Date: Tue, 7 Nov 2023 07:54:45 +0000
Message-ID: <52875bf017ae4b8f841caf91b08fb315@realtek.com>
References: <20231106110654.31090-1-johan+linaro@kernel.org>
 <2023110623-pointing-stump-643d@gregkh> <ZUjM/VEliT5c8H4C@matsya>
 <28e77cbc531248bf913ceedba6425cf6@realtek.com>
 <2023110713-morphine-mortuary-337e@gregkh>
In-Reply-To: <2023110713-morphine-mortuary-337e@gregkh>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
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

SGkgR3JlZywNCg0KPiBPbiBUdWUsIE5vdiAwNywgMjAyMyBhdCAwNjo0NDoyNkFNICswMDAwLCBT
dGFubGV5IENoYW5nW+aYjOiCsuW+t10gd3JvdGU6DQo+ID4gSGkgSm9oYW4gYW5kIFZpbm9kLA0K
PiA+DQo+ID4gSSBtb2RpZmllZCB0aGUgUmVhbHRlayBwaHkgdG8gc29sdmUgdGhpcyBpc3N1ZSBh
bmQgb25seSB1c2UgdGhlIGdlbmVyaWMgUEhZLg0KPiA+IEFuZCBzdWJtaXR0ZWQgdGhlc2UgcGF0
Y2hlcyB0b2RheSBhcyBmb2xsb3dzDQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
dXNiLzIwMjMxMTA3MDYzNTE4LjI3ODI0LTEtc3RhbmxleV9jaGFuZw0KPiA+IEByZWFsdGVrLmNv
bS8NCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMjAyMzExMDcwNjM1MTgu
Mjc4MjQtMi1zdGFubGV5X2NoYW5nDQo+ID4gQHJlYWx0ZWsuY29tLw0KPiA+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8yMDIzMTEwNzA2MzUxOC4yNzgyNC0zLXN0YW5sZXlfY2hh
bmcNCj4gPiBAcmVhbHRlay5jb20vDQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
dXNiLzIwMjMxMTA3MDYzNTE4LjI3ODI0LTQtc3RhbmxleV9jaGFuZw0KPiA+IEByZWFsdGVrLmNv
bS8NCj4gPg0KPiA+IEkgZG9uJ3QgdGhpbmsgdGhpcyBwYXRjaCBpcyBuZWVkZWQgdG8gcmV2ZXJ0
IGEwODc5OWNmMTdjMiAoInVzYjpwaHk6IE5ldyB1c2INCj4gcGh5IG5vdGlmaWNhdGlvbiBwb3J0
IHN0YXR1cyBBUEkiKS4NCj4gDQo+IEkgaGFkIGFscmVhZHkgYXBwbGllZCB0aG9zZSByZXZlcnRz
IHllc3RlcmRheSwgYnV0IGZvcmdvdCB0byBwdXNoIHRoZW0gb3V0DQo+IChzb3JyeSBhYm91dCB0
aGF0LCBub3cgZml4ZWQuKSAgTGV0J3Mgc3RhcnQgb3ZlciBoZXJlIGFuZCB5b3UgY2FuIHJlYmFz
ZSB5b3VyDQo+IG5ldyBzZXJpZXMgb24gdGhlIDYuNy1yYzEuDQoNCk9rYXksIEkgd2lsbCByZXN1
Ym1pdCBsYXRlci4NCg0KVGhhbmtzLA0KU3RhbmxleQ0KDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcg
ay1oDQo=

