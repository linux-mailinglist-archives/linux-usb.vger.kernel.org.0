Return-Path: <linux-usb+bounces-2762-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394C87E77D7
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 04:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3099E1C20BFC
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 03:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72348139C;
	Fri, 10 Nov 2023 03:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F617EB
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 03:00:38 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E9F4229;
	Thu,  9 Nov 2023 19:00:37 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AA2wP9k91965487, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AA2wP9k91965487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Nov 2023 10:58:25 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 10 Nov 2023 10:58:25 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 10 Nov 2023 10:58:25 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Fri, 10 Nov 2023 10:58:24 +0800
From: =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan@kernel.org>,
        "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>, Jinjie Ruan
	<ruanjinjie@huawei.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Yang
 Yingliang" <yangyingliang@huawei.com>,
        Roy Luo <royluo@google.com>,
        =?utf-8?B?UmljYXJkbyBDYcOxdWVsbw==?= <ricardo.canuelo@collabora.com>,
        "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>,
        Ray Chi <raychi@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2 2/4] phy: realtek: usb: add new driver for the Realtek RTD SoC USB 2.0 PHY
Thread-Topic: [PATCH v2 2/4] phy: realtek: usb: add new driver for the Realtek
 RTD SoC USB 2.0 PHY
Thread-Index: AQHaEVVrdu2dtgAe+0qSR4mPca7ht7BxrPAAgAEyAFA=
Date: Fri, 10 Nov 2023 02:58:24 +0000
Message-ID: <db2ccd248e5e4c3d8f818a3b3e2ef909@realtek.com>
References: <20231107083525.24901-1-stanley_chang@realtek.com>
 <20231107083525.24901-2-stanley_chang@realtek.com>
 <d5722bdf-2d5a-455e-809b-6470b4c5760c@kernel.org>
In-Reply-To: <d5722bdf-2d5a-455e-809b-6470b4c5760c@kernel.org>
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

SGkgS3J6eXN6dG9mLA0KDQo+IC4uLg0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgdXNicGh5X3J0a19kdF9tYXRjaFtdID0gew0KPiA+ICsgICAgIHsgLmNvbXBh
dGlibGUgPSAicmVhbHRlayxydGQxMjk1LXVzYjJwaHkiLCAuZGF0YSA9DQo+ICZydGQxMjk1X3Bo
eV9jZmcgfSwNCj4gPiArICAgICB7IC5jb21wYXRpYmxlID0gInJlYWx0ZWsscnRkMTMxMmMtdXNi
MnBoeSIsIC5kYXRhID0NCj4gJnJ0ZDEzMTJjX3BoeV9jZmcgfSwNCj4gPiArICAgICB7IC5jb21w
YXRpYmxlID0gInJlYWx0ZWsscnRkMTMxNWUtdXNiMnBoeSIsIC5kYXRhID0NCj4gJnJ0ZDEzMTVl
X3BoeV9jZmcgfSwNCj4gPiArICAgICB7IC5jb21wYXRpYmxlID0gInJlYWx0ZWsscnRkMTMxOS11
c2IycGh5IiwgLmRhdGEgPQ0KPiAmcnRkMTMxOV9waHlfY2ZnIH0sDQo+ID4gKyAgICAgeyAuY29t
cGF0aWJsZSA9ICJyZWFsdGVrLHJ0ZDEzMTlkLXVzYjJwaHkiLCAuZGF0YSA9DQo+ICZydGQxMzE5
ZF9waHlfY2ZnIH0sDQo+ID4gKyAgICAgeyAuY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0ZDEzOTUt
dXNiMnBoeSIsIC5kYXRhID0NCj4gJnJ0ZDEzOTVfcGh5X2NmZyB9LA0KPiA+ICsgICAgIHsgLmNv
bXBhdGlibGUgPSAicmVhbHRlayxydGQxMzk1LXVzYjJwaHktMnBvcnQiLCAuZGF0YSA9DQo+ICZy
dGQxMzk1X3BoeV9jZmdfMnBvcnQgfSwNCj4gPiArICAgICB7IC5jb21wYXRpYmxlID0gInJlYWx0
ZWsscnRkMTYxOS11c2IycGh5IiwgLmRhdGEgPQ0KPiAmcnRkMTYxOV9waHlfY2ZnIH0sDQo+ID4g
KyAgICAgeyAuY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0ZDE2MTliLXVzYjJwaHkiLCAuZGF0YSA9
DQo+ID4gKyZydGQxNjE5Yl9waHlfY2ZnIH0sDQo+IA0KPiBXaHkgaXMgdGhpcyBzZW50IHNlcGFy
YXRlbHkgZnJvbSB0aGUgYmluZGluZ3M/DQoNClRoZSBiaW5kaW5nIGlzIHJlYWR5IG9uIDYxMmFk
MjdhMzA0NTUgKGR0LWJpbmRpbmdzOiBwaHk6IHJlYWx0ZWs6IEFkZCBSZWFsdGVrIERIQyBSVEQg
U29DIFVTQiAyLjAgUEhZKQ0KDQpUaGlzIHBhdGNoIGlzIHJlc3VibWl0IGJhc2Ugb24gN2E3ODRi
Y2RkN2U1IChSZXZlcnQgInBoeTogcmVhbHRlazogdXNiOiBBZGQgZHJpdmVyIGZvciB0aGUgUmVh
bHRlayBTb0MgVVNCIDIuMCBQSFkiKQ0KdG8gYXZvaWQgdXNpbmcgbGVnYWN5IFVTQiBQSFkgZnJh
bWV3b3JrLg0KDQo+ID4gKyAgICAge30sDQo+ID4gK307DQo+ID4gK01PRFVMRV9ERVZJQ0VfVEFC
TEUob2YsIHVzYnBoeV9ydGtfZHRfbWF0Y2gpOw0KPiA+ICsNCj4gPiArc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgcnRrX3VzYjJwaHlfZHJpdmVyID0gew0KPiA+ICsgICAgIC5wcm9iZSAg
ICAgICAgICA9IHJ0a191c2IycGh5X3Byb2JlLA0KPiA+ICsgICAgIC5yZW1vdmVfbmV3ICAgICA9
IHJ0a191c2IycGh5X3JlbW92ZSwNCj4gPiArICAgICAuZHJpdmVyICAgICAgICAgPSB7DQo+ID4g
KyAgICAgICAgICAgICAubmFtZSAgID0gInJ0ay11c2IycGh5IiwNCj4gPiArICAgICAgICAgICAg
IC5vZl9tYXRjaF90YWJsZSA9IHVzYnBoeV9ydGtfZHRfbWF0Y2gsDQo+ID4gKyAgICAgfSwNCj4g
PiArfTsNCj4gPiArDQo+ID4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIocnRrX3VzYjJwaHlfZHJp
dmVyKTsNCj4gPiArDQo+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gPiArTU9EVUxFX0FM
SUFTKCJwbGF0Zm9ybTogcnRrLXVzYjJwaHkiKTsNCj4gDQo+IFlvdSBzaG91bGQgbm90IG5lZWQg
TU9EVUxFX0FMSUFTKCkgaW4gbm9ybWFsIGNhc2VzLiBJZiB5b3UgbmVlZCBpdCwgdXN1YWxseSBp
dA0KPiBtZWFucyB5b3VyIGRldmljZSBJRCB0YWJsZSBpcyB3cm9uZyAoZS5nLiBtaXNzZXMgZWl0
aGVyIGVudHJpZXMgb3INCj4gTU9EVUxFX0RFVklDRV9UQUJMRSgpKS4gTU9EVUxFX0FMSUFTKCkg
aXMgbm90IGEgc3Vic3RpdHV0ZSBmb3INCj4gaW5jb21wbGV0ZSBJRCB0YWJsZS4NCj4gDQpJIHdp
bGwgcmVtb3ZlIHRoaXMuDQoNClRoYW5rcywNClN0YW5sZXkNCg0K

