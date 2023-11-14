Return-Path: <linux-usb+bounces-2855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8228F7EAAB5
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 08:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B23B81C20A2B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 07:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A99BE4D;
	Tue, 14 Nov 2023 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A258F5F
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 07:04:22 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F41113E;
	Mon, 13 Nov 2023 23:04:21 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AE742qhC748857, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AE742qhC748857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 15:04:02 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 14 Nov 2023 15:04:02 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 14 Nov 2023 15:04:01 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Tue, 14 Nov 2023 15:04:01 +0800
From: =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?= <stanley_chang@realtek.com>
To: Johan Hovold <johan@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] usb: dwc3: add device put function to decrement the ref-counted reference
Thread-Topic: [PATCH v1] usb: dwc3: add device put function to decrement the
 ref-counted reference
Thread-Index: AQHaEVqWcz3GNmQjYUqtWzr6T0MhhrB0b34AgAT+ntA=
Date: Tue, 14 Nov 2023 07:04:01 +0000
Message-ID: <0c674943bf574bcb91a7b5b87180f7c1@realtek.com>
References: <20231107091252.11783-1-stanley_chang@realtek.com>
 <ZU9bPMHqz7Gj4rHj@hovoldconsulting.com>
In-Reply-To: <ZU9bPMHqz7Gj4rHj@hovoldconsulting.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
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

SGkgSm9oYW4sDQoNCj4gDQo+IE9uIFR1ZSwgTm92IDA3LCAyMDIzIGF0IDA1OjEyOjUxUE0gKzA4
MDAsIFN0YW5sZXkgQ2hhbmcgd3JvdGU6DQo+ID4gV2hlbiB0aGUgZnVuY3Rpb24gZXhpdHMsIHRo
ZSBjb3VudCBzaG91bGQgYmUgZGVjcmVtZW50ZWQgdmlhDQo+ID4gcGxhdGZvcm1fZGV2aWNlX3B1
dCBhbmQgb2Zfbm9kZV9wdXQuDQo+IA0KPiBUaGlzIGlzbid0IHJlYWxseSBhIHNlbGYtY29udGFp
bmVkIGNvbW1pdCBtZXNzYWdlIChhbmQgeW91ciB1c2Ugb2YgJ2NvdW50JyBpcw0KPiB0b28gdmFn
dWUpLiBZb3UncmUgYWxzbyBjaGFuZ2luZyB0d28gZnVuY3Rpb25zIGluIHR3byBkaWZmZXJlbnQg
d2F5cyBoZXJlLg0KDQpJIHdpbGwgbW9kaWZ5IHRoZSBjb21taXQgbWVzc2FnZS4NCg0KPiA+IEZp
eGVzOiAzNGMyMDA0ODM1NjkgKCJ1c2I6IGR3YzM6IGFkZCBSZWFsdGVrIERIQyBSVEQgU29DIGR3
YzMgZ2x1ZQ0KPiA+IGxheWVyIGRyaXZlciIpDQo+ID4gU2lnbmVkLW9mZi1ieTogU3RhbmxleSBD
aGFuZyA8c3RhbmxleV9jaGFuZ0ByZWFsdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy91
c2IvZHdjMy9kd2MzLXJ0ay5jIHwgMyArKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1ydGsu
YyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1ydGsuYw0KPiA+IGluZGV4IDU5MDAyOGU4ZmRjYi4u
OWQ2ZjJhOGJkNmNlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1ydGsu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1ydGsuYw0KPiA+IEBAIC0xODcsNiAr
MTg3LDcgQEAgc3RhdGljIGVudW0gdXNiX2RldmljZV9zcGVlZA0KPiA+IF9fZ2V0X2R3YzNfbWF4
aW11bV9zcGVlZChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQ0KPiA+DQo+ID4gICAgICAgcmV0ID0g
bWF0Y2hfc3RyaW5nKHNwZWVkX25hbWVzLCBBUlJBWV9TSVpFKHNwZWVkX25hbWVzKSwNCj4gPiBt
YXhpbXVtX3NwZWVkKTsNCj4gPg0KPiA+ICsgICAgIG9mX25vZGVfcHV0KGR3YzNfbnApOw0KDQpJ
IHdpbGwgZml4ZWQgdGhpcy4NCg0KVGhhbmtzLA0KU3RhbmxleQ0KDQo+IFlvdSdyZSBzdGlsbCBs
ZWFraW5nIGEgcmVmZXJlbmNlIGluIHRoZSBvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZygpIGVycm9y
IHBhdGgganVzdA0KPiBhYm92ZS4NCj4gDQo+ID4gICAgICAgcmV0dXJuIChyZXQgPCAwKSA/IFVT
Ql9TUEVFRF9VTktOT1dOIDogcmV0OyAgfQ0KPiA+DQo+ID4gQEAgLTMzOSw2ICszNDAsOCBAQCBz
dGF0aWMgaW50IGR3YzNfcnRrX3Byb2JlX2R3YzNfY29yZShzdHJ1Y3QNCj4gPiBkd2MzX3J0ayAq
cnRrKQ0KPiA+DQo+ID4gICAgICAgc3dpdGNoX3VzYjJfcm9sZShydGssIHJ0ay0+Y3VyX3JvbGUp
Ow0KPiA+DQo+ID4gKyAgICAgcGxhdGZvcm1fZGV2aWNlX3B1dChkd2MzX3BkZXYpOw0KPiA+ICsg
ICAgIG9mX25vZGVfcHV0KGR3YzNfbm9kZSk7DQo+IA0KPiBQbGVhc2Uga2VlcCB0aGUgbmV3IGxp
bmUgYmVmb3JlIHJldHVybiBmb3IgcmVhZGFiaWxpdHkuDQo+IA0KPiA+ICAgICAgIHJldHVybiAw
Ow0KPiA+DQo+ID4gIGVycl9wZGV2X3B1dDoNCj4gDQo+IEpvaGFuDQo=

