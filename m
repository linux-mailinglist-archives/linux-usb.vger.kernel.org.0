Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15EE33A2B1E
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 14:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhFJMKl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 08:10:41 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:28910 "EHLO
        shasxm03.verisilicon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhFJMKj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Jun 2021 08:10:39 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
        c=simple/simple; t=1623326922; h=from:subject:to:date:message-id;
        bh=DkR6kA4xxhCcIeKrJ2qlJoNn2LgBYDpWvO/rzTvNw3g=;
        b=KGDOT2fgOUcQpWcWE3mveECYVBMWpktBGh9UAcQuDA0YeqAEsDIscTwgh6++in7OKcFrvtUSgOp
        1es2sXtpCAV6UbhgCJ2MbWtZzDoggjvnxws6XJEGDdKOPZ8y8JIi99IPVDBJ5C0m2Z9JbZbBVDDG5
        cP0cGpLuLWbFXMeV/YA=
Received: from SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda]) by
 SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa%14]) with mapi id
 14.03.0408.000; Thu, 10 Jun 2021 20:08:42 +0800
From:   "Fang, Yuan" <Yuan.Fang@verisilicon.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBkcml2ZXIvdXNiL2R3YzM6IEFkZCBlcnJvciBoYW5k?=
 =?gb2312?Q?le_for_dwc3_get_usb_phy?=
Thread-Topic: [PATCH] driver/usb/dwc3: Add error handle for dwc3 get usb phy
Thread-Index: AQHXXe0SWPqqqpQ5Lkm/Jco7AP/84KsMmrKAgACKoYA=
Date:   Thu, 10 Jun 2021 12:08:41 +0000
Message-ID: <678AD2A4F5F78445B722FED0965FE327776E401E@SHASXM06.verisilicon.com>
References: <20210610113745.7710-1-yuan.fang@verisilicon.com>
 <87bl8e0wnc.fsf@kernel.org>
In-Reply-To: <87bl8e0wnc.fsf@kernel.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.13.120]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--10.282400-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QWRkIHRvIHByZXZpb3VzIGVtYWlsLA0KDQpnZW5lcmljIFBIWSBmcmFtZXdvcmsgRE8gcHJvdGVj
dHMgYWdhaW5zdCBOVUxMIHBoeSwgYnV0IHdoaWNoIGlzIG5vdCBnb29kIGVub3VnaCwgZm9yIGEg
Z29vZCBkZXNpZ24sIHNob3VsZCByZXR1cm4gb25jZSBlcnJvciB3YXMgZGV0ZWN0IGFuZCBwYXNz
IGNvcnJlY3QgbWVzc2FnZSB0byBkZXZlbG9wZXIsIGRvIHlvdSBhZ3JlZSB3aXRoIG1lPw0KSW4g
dGhlIGNhc2UgSSBtZW50aW9uZWQsIFBIWSBpcyBub3QgcmVhZHkgYnV0IEkgZ290IGEgUEhZIHRp
bWUgb3V0IGVycm9yIGFuZCB3aXRoIGR3Yy0+cGh5c19yZWFkeT10dXJlLCB3aGljaCBpcyBpbmNv
cnJlY3QgYW5kIHBhc3NpbmcgZXJyb3IgbWVzc2FnZS4NCg0KQi5SDQpZdWFuIEZhbmcNCg0KLS0t
LS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IEZlbGlwZSBCYWxiaSBbbWFpbHRvOmJhbGJpQGtlcm5l
bC5vcmddIA0Kt6LLzcqxvOQ6IDIwMjHE6jbUwjEwyNUgMTk6NDcNCsrVvP7IyzogWXVhbiBGYW5n
OyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnDQqzrcvNOiBGYW5nLCBZdWFuDQrW98ziOiBSZTog
W1BBVENIXSBkcml2ZXIvdXNiL2R3YzM6IEFkZCBlcnJvciBoYW5kbGUgZm9yIGR3YzMgZ2V0IHVz
YiBwaHkNCg0KDQpIaSwNCg0KWXVhbiBGYW5nIDxmYW5neXVhbnNldUBnbWFpbC5jb20+IHdyaXRl
czoNCg0KPiBBZGQgZXJyb3IgaGFuZGxlIGZvciBkd2MzIGNvcmUgZ2V0IHVzYiBwaHksIGJlY2F1
c2Ugd2l0aG91dCBlcnJvciANCj4gaGFuZGxlIHdpbGwgbGVhZCB0byBidWcuDQo+DQo+IGNvbnNp
ZGVyIGNhc2UgbGlrZSB0aGlzLCB3aGVuIGJvdGggZHdjLT51c2IyX3BoeS91c2IzX3BoeSBhbmQg
DQo+IGR3Yy0+dXNiMl9nZW5lcmljX3BoeS91c2IzX2dlbmVyaWNfcGh5IGRvIG5vdCBleGlzdCBj
dXJyZW50IGRyaXZlciANCj4gY29kZSBzZXQgdGhlbSBhbGwgdG8gTlVMTCBhbmQgcmV0dXJuIDAg
dG8gY2FsbGVyIHdoaWNoIG1lYW5zIHVzYiBwaHkgDQo+IGlzIHJlYWR5Lg0KDQppdCdzIHVuY2xl
YXIgd2hhdCB0aGUgcHJvYmxlbSBpcy4gQ2FyZSB0byBkZXNjcmliZSB3aGF0J3MgaGFwcGVuaW5n
Pw0KDQo+IFNpZ25lZC1vZmYtYnk6IFl1YW4gRmFuZyA8eXVhbi5mYW5nQHZlcmlzaWxpY29uLmNv
bT4NCj4gLS0tDQo+IEhpIG1haW50YWluZXIsDQo+DQo+ICAgIEkgZmluZCB0aGlzIGlzc3VlIHdo
ZW4gaSB0cnkgdG8gYWRkIGEgbmV3IHVzYiBwaHkgZHJpdmVyIGZvcg0KPiAgICBkd2MzIHVzYiBj
b3JlLCB0aGlzIGlzc3VlIGxvb2tzIGxpa2UgYSBidWcsIHBsZWFzZSBraW5kbHkgaGF2ZQ0KPiAg
ICBhIHJldmlldywgbWFueSB0aGFua3MuDQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gWXVhbiBGYW5n
DQo+DQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
YyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGluZGV4IA0KPiBiNmU1M2Q4MjEyY2QuLjRkNTI3
ZDMxM2E0YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTExODQsNiArMTE4NCw3IEBAIHN0YXRpYyBp
bnQgZHdjM19jb3JlX2dldF9waHkoc3RydWN0IGR3YzMgKmR3YykNCj4gIAkJcmV0ID0gUFRSX0VS
Uihkd2MtPnVzYjNfZ2VuZXJpY19waHkpOw0KPiAgCQlpZiAocmV0ID09IC1FTk9TWVMgfHwgcmV0
ID09IC1FTk9ERVYpIHsNCj4gIAkJCWR3Yy0+dXNiM19nZW5lcmljX3BoeSA9IE5VTEw7DQo+ICsJ
CQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIm5vIHVzYiBwaHkgZGV2aWNlXG4iKTsN
Cg0Kbm8sIHRoaXMgaXMgaW5jb3JyZWN0LiBTb21lIHBsYXRmb3JtcyBkb24ndCByZXF1aXJlIGEg
UEhZIGRyaXZlciBhdCBhbGwgYmVjYXVzZSB0aGVyZSdzIG5vIFNXIGNvbnRyb2wgZm9yIHRoZSBQ
SFkuDQoNCk1vcmVvdmVyLCBnZW5lcmljIFBIWSBmcmFtZXdvcmsgcHJvdGVjdHMgYWdhaW5zdCBO
VUxMIHBoeS4gSSBkb24ndCBzZWUgd2hhdCB0aGUgcHJvYmxlbSB5b3UncmUgcmVmZXJyaW5nIHRv
IGlzIGhlcmUuDQoNCi0tDQpiYWxiaQ0K
