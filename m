Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6A8402790
	for <lists+linux-usb@lfdr.de>; Tue,  7 Sep 2021 13:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237077AbhIGLHn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Sep 2021 07:07:43 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:24792 "EHLO
        shasxm03.verisilicon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbhIGLHk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Sep 2021 07:07:40 -0400
X-Greylist: delayed 325 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Sep 2021 07:07:39 EDT
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
        c=simple/simple; t=1631012464; h=from:subject:to:date:message-id;
        bh=8qMnRJTUJYIHlyVQ10arDHRdPjg32pyWTP0aqRWmAds=;
        b=QTLd6f1uE6CDcHdTOIuNr3jXNu1ufb1ybgXFn3e7Z2xNUAjCk5I28YVCmdpO9RZrhGqmWsySYry
        8Ylec0Y/YG0dAcbe4oSk4yy5QgXwKsVRM3Q5EKVuVs6f6dm1GqWYA9GEK+lCr+NEhrtwyL5iI/cw/
        15thUHiJDSSfptTWTwM=
Received: from SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda]) by
 SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa%14]) with mapi id
 14.03.0408.000; Tue, 7 Sep 2021 19:01:03 +0800
From:   "Fang, Yuan" <Yuan.Fang@verisilicon.com>
To:     "Fang, Yuan" <Yuan.Fang@verisilicon.com>,
        Felipe Balbi <balbi@kernel.org>,
        Yuan Fang <fangyuanseu@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBkcml2ZXJzL3VzYi9kd2MzOiBTZXQgUEhZIHJlYWR5?=
 =?gb2312?Q?_after_soft_reset_done?=
Thread-Topic: [PATCH] drivers/usb/dwc3: Set PHY ready after soft reset done
Thread-Index: AQHXXpH16kk4ndlpHUqkheri6gWwB6sOQNqAgAexvOCAFHCLsIBujpBw
Date:   Tue, 7 Sep 2021 11:01:02 +0000
Message-ID: <678AD2A4F5F78445B722FED0965FE3278EF42D9A@SHASXM06.verisilicon.com>
References: <20210611071805.9169-1-yuan.fang@verisilicon.com>
 <87r1h8zh8y.fsf@kernel.org>  
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.13.65]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--5.989200-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWFpbnRhaW5lciwNCg0KTWF5IEkga25vdyB5b3VyIHRob3VnaHRzIG9uIHRoaXMgdG9waWM/
DQpUaGFua3MgYSBsb3QuDQoNCg0KLS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IEZhbmcsIFl1
YW4gDQq3osvNyrG85DogMjAyMcTqNtTCMjnI1SAxMDo0Mg0KytW8/sjLOiBGYW5nLCBZdWFuOyAn
RmVsaXBlIEJhbGJpJzsgJ1l1YW4gRmFuZyc7ICdsaW51eC11c2JAdmdlci5rZXJuZWwub3JnJw0K
1vfM4jogtPC4tDogW1BBVENIXSBkcml2ZXJzL3VzYi9kd2MzOiBTZXQgUEhZIHJlYWR5IGFmdGVy
IHNvZnQgcmVzZXQgZG9uZQ0KDQpIaSBNYWludGFpbm5lciwNCg0KQ291bGQgeW91IHBsZWFzZSBz
aGFyZSB5b3VyIHRob3VnaHRzIHdpdGggbWU/DQpUaGFua3MgYSBsb3QuDQoNCg0KLS0tLS3Tyrz+
1K28/i0tLS0tDQq3orz+yMs6IEZhbmcsIFl1YW4NCreiy83KsbzkOiAyMDIxxOo21MIxNsjVIDEw
OjU2DQrK1bz+yMs6ICdGZWxpcGUgQmFsYmknOyBZdWFuIEZhbmc7IGxpbnV4LXVzYkB2Z2VyLmtl
cm5lbC5vcmcNCtb3zOI6ILTwuLQ6IFtQQVRDSF0gZHJpdmVycy91c2IvZHdjMzogU2V0IFBIWSBy
ZWFkeSBhZnRlciBzb2Z0IHJlc2V0IGRvbmUNCg0KSGkgQmFsYmksDQoNCj4gSXQncyBtb3JlIHNh
ZmUgdG8gc2V0IFBIWSByZWFkeSBhZnRlciBzb2Z0IHJlc2V0IGRvbmUNCj4NCj4gTGV0J3MgY29u
c2lkZXIgYSB0ZXN0IGNhc2UgbGlrZSB0aGlzOg0KPiBJIGhhdmUgYSB1c2IgUEhZIHdoaWNoIGRv
bid0IG5lZWQgU1cgaW5pdGlhbCBiZWZvcmUgYWNjZXNzIGl0LCBCdXQgaSANCj4gaGF2ZSBhIHdy
b25nIFBIWSBjbG9jayBkZWZhdWx0IHNldHRpbmcgaW4gUEhZIHJlZ2lzdGVyIHdoaWNoIG1lYW5z
IFBIWSANCj4gaXMgbm90IHJlYWR5IGluIGZhY3QuDQo+IGluIGR3YzNfY29yZV9pbml0LCBkd2Mz
X2NvcmVfZ2V0X3BoeSB3aWxsIHJldHVybiAwIGRlc3BpdGUgdXNiIGdldCANCj4gUEhZcyB3aXRo
IHJldHVybiAtRU5PREVWLCBhbmQgc2V0IHBoeXNfcmVhZHk9dHJ1ZQ0KDQo+IHlvdXIgUEhZIGRy
aXZlciBzaG91bGRuJ3QgcmV0dXJuIC1FTk9ERVYgaGVyZS4gV2h5IGFyZSB5b3UgcmV0dXJuaW5n
IC1FTk9ERVY/IFRoZSBQSFkgaXNuJ3QgcmVhZHkgYnV0IGl0IF9kb2VzXyBleGlzdC4NCg0KU29y
cnkgZm9yIHRoZSBsYXRlIHJlcGx5LCBteSBleHBsYWluIG1heSBiZSBub3QgY2xlYXIsIGxldCBt
ZSBkZXNjcmliZSBpdCBvbmNlIG1vcmUgMSwgSSBkb26hr3QgY29kaW5nIGEgUEhZIGRyaXZlciwg
SSBoYXZlIGEgUEhZIHdoaWNoIGRvIE5PVCBuZWVkIFNXIG9wZXJhdGlvbiBBbGwgSSBzaG91bGQg
ZG8gaXMgc2V0IHRoZSByZWxhdGVkIFBIWSBjdHJsIHJlZ3MgY29ycmVjdGx5LiBTbyBJIGRvIG5v
dCByZXR1cm4gYW55dGhpbmcgdG8gZ2VuZXJpYyBQSFkgZnJhbWV3b3JrLg0KMiwgSW4gbXkgYWJv
dmUgY2FzZSwgZHdjM19jb3JlX2dldF9waHkgd2lsbCByZXR1cm4gMCwgYW5kIHNldCBkd2MtPnBo
eXNfcmVhZHk9dHJ1ZSwgQW5kIHRoZW4sIGR3YzNfY29yZV9zb2Z0X3Jlc2V0IHdpbGwgY29zdCBy
ZXRyaWVzKjIwbXMgdG8gY2hlY2sgaWYgc29mdC1yZXNldCBpcyBkb25lICwgYW5kIHJldHVybiAt
RVRJTUVET1VUIGlmIHRpbWUgb3V0LCBpcyB0aGF0IGNvcnJlY3Q/DQoNCk15IHBvaW50IGlzLCBp
biB0aGlzIGNhc2UoUEhZIGRvIG5vdCBzZXQgY29ycmVjdGx5LCB3aGljaCBpcyBub3QgcmFyZSBk
dXJpbmcgZGV2ZWxvcG1lbnQgc3RhZ2UgSSB0aGluayksIFBIWSBpbml0aWFsIGZhaWwgbGVkIHRv
IHNvZnQtcmVzZXQgdGltZW91dCBidXQgZHdjLT5waHlzX3JlYWR5IGlzIHRydWUsIFNvIEkgdGhp
bmsgaXMgbW9yZSBzYWZlIHRvIHNheSAiUEhZIGlzIHJlYWR5IiBhZnRlciBzb2Z0LXJlc2V0IGRv
bmUsIHBsZWFzZSBsZXQgbWUga25vdyB5b3VyIG9waW5pb24sIHRoYW5rcyBhIGxvdA0KDQpZdWFu
IEZhbmcNCiANCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBGZWxpcGUgQmFsYmkgW21haWx0
bzpiYWxiaUBrZXJuZWwub3JnXQ0Kt6LLzcqxvOQ6IDIwMjHE6jbUwjExyNUgMjE6MDMNCsrVvP7I
yzogWXVhbiBGYW5nOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnDQqzrcvNOiBGYW5nLCBZdWFu
DQrW98ziOiBSZTogW1BBVENIXSBkcml2ZXJzL3VzYi9kd2MzOiBTZXQgUEhZIHJlYWR5IGFmdGVy
IHNvZnQgcmVzZXQgZG9uZQ0KDQpZdWFuIEZhbmcgPGZhbmd5dWFuc2V1QGdtYWlsLmNvbT4gd3Jp
dGVzOg0KDQo+IEl0J3MgbW9yZSBzYWZlIHRvIHNldCBQSFkgcmVhZHkgYWZ0ZXIgc29mdCByZXNl
dCBkb25lDQo+DQo+IExldCdzIGNvbnNpZGVyIGEgdGVzdCBjYXNlIGxpa2UgdGhpczoNCj4gSSBo
YXZlIGEgdXNiIFBIWSB3aGljaCBkb24ndCBuZWVkIFNXIGluaXRpYWwgYmVmb3JlIGFjY2VzcyBp
dCwgQnV0IGkgDQo+IGhhdmUgYSB3cm9uZyBQSFkgY2xvY2sgZGVmYXVsdCBzZXR0aW5nIGluIFBI
WSByZWdpc3RlciB3aGljaCBtZWFucyBQSFkgDQo+IGlzIG5vdCByZWFkeSBpbiBmYWN0Lg0KPiBp
biBkd2MzX2NvcmVfaW5pdCwgZHdjM19jb3JlX2dldF9waHkgd2lsbCByZXR1cm4gMCBkZXNwaXRl
IHVzYiBnZXQgDQo+IFBIWXMgd2l0aCByZXR1cm4gLUVOT0RFViwgYW5kIHNldCBwaHlzX3JlYWR5
PXRydWUNCg0KeW91ciBQSFkgZHJpdmVyIHNob3VsZG4ndCByZXR1cm4gLUVOT0RFViBoZXJlLiBX
aHkgYXJlIHlvdSByZXR1cm5pbmcgLUVOT0RFVj8gVGhlIFBIWSBpc24ndCByZWFkeSBidXQgaXQg
X2RvZXNfIGV4aXN0Lg0KDQotLQ0KYmFsYmkNCg==
