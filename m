Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB9EB97A93
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 15:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbfHUNUg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 09:20:36 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:17484 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfHUNUg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 09:20:36 -0400
IronPort-SDR: Fx5zxELvVFpGjTXnHdYYDXffKSaePwqOcmV6+DQpCTsRb2i/vMq3eCmU5AapnZ0JaVfzoUeAYm
 cYeVOM787lOItZdMWK5RKnYFy1CGcn5UUJh0mbAUBuRW3vdbEGAcBC8HArdewU8YBO0cRL+fcf
 TyZZUFJI8Q6H3otYEN7MTlOKA/xgtPhBIAo09vSxh/KBAwEsl3REm8nXGRXjBKKlbmLQ5MAjwZ
 vw8e6uAS+jqvHRLAvEtKAK53AWR3dN0pdp88clnrC2mG0U0VSaC93Lke0Iy8deYS+s9ioosyNR
 o94=
X-IronPort-AV: E=Sophos;i="5.64,412,1559548800"; 
   d="scan'208";a="40637004"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 21 Aug 2019 05:20:35 -0800
IronPort-SDR: +QjuvnqxHen/rXxd9kbDlz4oWvxNjeVyQQp2x5nAr2SA33cKdV66fJ5Ac1G737K/EA4Ub/0ULI
 HgW4rpXrKLXg2jGvxAa29uf1AsXuhUIcfGce2YGioCkXtUXvDUiuG1AAlCl9rJNQw0H2M5wQw/
 RlBmw4YF6L/eZminLI3xhpbCM5Wo2fIp7TL6gmXSsHhy84SmsHZwXQT7Wvh+9sRJVThLYVC4zp
 W1rkFwJWqJ/odnruAo5+vrVynT3KmUdRa6xe3YtoFOBg1WEhDT6HdIabyxL36K2Tkuy4c027p9
 jNM=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     "wharms@bfs.de" <wharms@bfs.de>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: problems with Edgeport/416
Thread-Topic: problems with Edgeport/416
Thread-Index: AQHVWCECNX3xNGRgBkW3E536acORx6cFk8iw
Date:   Wed, 21 Aug 2019 13:20:30 +0000
Message-ID: <eb4392d938654d99a3f37820b279c839@SVR-IES-MBX-03.mgc.mentorg.com>
References: <5D5D1C8C.9080000@bfs.de> <20190821112009.GA5228@kroah.com>
 <5D5D2F9E.7050805@bfs.de> <20190821122028.GA19107@kroah.com>
 <5D5D4170.4070001@bfs.de>
In-Reply-To: <5D5D4170.4070001@bfs.de>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiANCj4gRGlmZmVyZW50IGNvbXB1dGVyIGJ1dCBzYW1lIGNhYmxlcyBpIGd1ZXNzIHRoZSBkZXZp
Y2UgaXMgb2suDQo+IA0KQnV0IG1heWJlIHRoZSBVU0IgIHBvcnQgb2YgdGhlIGNvbXB1dGVyIGlz
IGJyb2tlbi4NCg0KPiBOVEwgSSBmb3VuZCB0aGF0IGxpdHRsZSBnZW06DQo+IGh0dHBzOi8vd3d3
LmZjbG9zZS5jb20vbGludXgta2VybmVscy81OTQ2NzcvdXNiLWlvX3RpLWFkZC1oZWFydGJlYXQt
dG8tDQo+IGtlZXAtaWRsZS1lcC00MTYtcG9ydHMtZnJvbS1kaXNjb25uZWN0aW5nLWxpbnV4LTQt
My8NCj4gDQo+IFRoZSBiZWhhdmlvciB3b3VsZCBmaXQgKGFueSB3YXkgdG8gY2hlY2sgdGhhdCB0
aGUgaGVhcnRiZWF0IGlzIGFjdGl2ZSA/KS4NCj4gDQpXaGljaCBrZXJuZWwgYXJlIHlvdSBydW5u
aW5nIG9uPw0KdXNlICJ1bmFtZSAtYSIgdG8gZ2V0IGl0Lg0KVGhpcyBwYXRjaCB3YXMgaW50cm9k
dWNlZCBpbiA0LjMga2VybmVsLCBub3QgcmVhbGx5IGhvdCAuLi4NCkFuZCwgeWVzLCBsb29rcyBs
aWtlIHdoYXQgeW91IGV4cGVyaWVuY2UuDQoNCj4gQ2FzdGVuIFNjaG1pZHQgYXNrIG1lIHRvIGxv
b2sgaW50bw0KPiAvc3lzL2tlcm5lbC9kZWJ1Zy9keW5hbWljX2RlYnVnL2NvbnRyb2wgYmVmb3Jl
IGkgc3RhcnQgdG8NCj4gZGVidWcgdGhlIHdob2xlIHVzYiBwYXJ0LCBpcyB0aGF0IGJlbG93IGV4
cGVjdGVkIGJlaGF2aW9yID8gKGkgdHJpZWQgdG8gZmluZA0KPiB3aGF0IHZlcnNpb24gb2YgZWRn
ZXBvcnQgdGhlIGRyaXZlciBzdXNwZWN0cykuDQo+IA0KPiBkcml2ZXJzL3VzYi9zZXJpYWwvaW9f
dGkuYzoxNTA3IFtpb190aV1kb19ib290X21vZGUgPV8gIiVzIC0gU1RBWUlORyBJTiBCT09UIE1P
REVcMDEyIg0KLi4uDQo+IGRyaXZlcnMvdXNiL3NlcmlhbC9pb190aS5jOjg4NCBbaW9fdGldaTJj
X3R5cGVfYm9vdG1vZGUgPV8gIiVzIC0gcmVhZCAyIHN0YXR1cyBlcnJvciA9ICVkXDAxMiINCj4g
DQpUaGF0IHNheXMgdGhhdCB3ZSBoYXZlIGR5bmFtaWMgZGVidWcgbWVzc2FnZXMgYXZhaWxhYmxl
IGZvciB0aGUgZHJpdmVyLg0KSWYgeW91IGVuYWJsZSB0aG9zZSBieSBkb2luZw0KZWNobyAtbiAn
bW9kdWxlIGlvX3RpID1wJyA+IC9zeXMva2VybmVsL2RlYnVnL2R5bmFtaWNfZGVidWcvY29udHJv
bA0KDQpUaGVuIHlvdSBzaG91bGQgc2VlIGF0IGxlYXN0IHNvbWUgb2YgdGhvc2UgbWVzc2FnZXMg
YXBwZWFyIGluIGRtZXNnIChrZXJuZWwgbG9nKS4NCg0KQmVzdCByZWdhcmRzDQpDYXJzdGVuDQo=
