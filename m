Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD67A3A8F0F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jun 2021 04:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhFPC5m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 22:57:42 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:19617 "EHLO
        shasxm03.verisilicon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbhFPC5l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Jun 2021 22:57:41 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
        c=simple/simple; t=1623812132; h=from:subject:to:date:message-id;
        bh=YoQg7JYNZNvPjuXFcGCGVWpBi8nQUbiBBp7xlIGQHdU=;
        b=HuoZyxS84ON2RQUi2HXen+MOAqb6Piv+Z1cYDjpNZHu9UGHfh1Crm8+ej4at+29Nye2MTx/gcBM
        VpRx05mkOeaDKrOCy98Az3xlO+luK8ed9LyUsrifS4RilqfZl1cX/q2L4F0hud1kqVChPZMEPdVt6
        4shbYYRdmU9LK+sDdTw=
Received: from SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda]) by
 SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa%14]) with mapi id
 14.03.0408.000; Wed, 16 Jun 2021 10:55:32 +0800
From:   "Fang, Yuan" <Yuan.Fang@verisilicon.com>
To:     Felipe Balbi <balbi@kernel.org>, Yuan Fang <fangyuanseu@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBkcml2ZXJzL3VzYi9kd2MzOiBTZXQgUEhZIHJlYWR5?=
 =?gb2312?Q?_after_soft_reset_done?=
Thread-Topic: [PATCH] drivers/usb/dwc3: Set PHY ready after soft reset done
Thread-Index: AQHXXpH16kk4ndlpHUqkheri6gWwB6sOQNqAgAexvOA=
Date:   Wed, 16 Jun 2021 02:55:32 +0000
Message-ID: <678AD2A4F5F78445B722FED0965FE327776E45E9@SHASXM06.verisilicon.com>
References: <20210611071805.9169-1-yuan.fang@verisilicon.com>
 <87r1h8zh8y.fsf@kernel.org>
In-Reply-To: <87r1h8zh8y.fsf@kernel.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.13.120]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--5.935500-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgQmFsYmksDQoNCj4gSXQncyBtb3JlIHNhZmUgdG8gc2V0IFBIWSByZWFkeSBhZnRlciBzb2Z0
IHJlc2V0IGRvbmUNCj4NCj4gTGV0J3MgY29uc2lkZXIgYSB0ZXN0IGNhc2UgbGlrZSB0aGlzOg0K
PiBJIGhhdmUgYSB1c2IgUEhZIHdoaWNoIGRvbid0IG5lZWQgU1cgaW5pdGlhbCBiZWZvcmUgYWNj
ZXNzIGl0LCBCdXQgaSANCj4gaGF2ZSBhIHdyb25nIFBIWSBjbG9jayBkZWZhdWx0IHNldHRpbmcg
aW4gUEhZIHJlZ2lzdGVyIHdoaWNoIG1lYW5zIFBIWSANCj4gaXMgbm90IHJlYWR5IGluIGZhY3Qu
DQo+IGluIGR3YzNfY29yZV9pbml0LCBkd2MzX2NvcmVfZ2V0X3BoeSB3aWxsIHJldHVybiAwIGRl
c3BpdGUgdXNiIGdldCANCj4gUEhZcyB3aXRoIHJldHVybiAtRU5PREVWLCBhbmQgc2V0IHBoeXNf
cmVhZHk9dHJ1ZQ0KDQo+IHlvdXIgUEhZIGRyaXZlciBzaG91bGRuJ3QgcmV0dXJuIC1FTk9ERVYg
aGVyZS4gV2h5IGFyZSB5b3UgcmV0dXJuaW5nIC1FTk9ERVY/IFRoZSBQSFkgaXNuJ3QgcmVhZHkg
YnV0IGl0IF9kb2VzXyBleGlzdC4NCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LCBteSBleHBs
YWluIG1heSBiZSBub3QgY2xlYXIsIGxldCBtZSBkZXNjcmliZSBpdCBvbmNlIG1vcmUNCjEsIEkg
ZG9uoa90IGNvZGluZyBhIFBIWSBkcml2ZXIsIEkgaGF2ZSBhIFBIWSB3aGljaCBkbyBOT1QgbmVl
ZCBTVyBvcGVyYXRpb24NCkFsbCBJIHNob3VsZCBkbyBpcyBzZXQgdGhlIHJlbGF0ZWQgUEhZIGN0
cmwgcmVncyBjb3JyZWN0bHkuIFNvIEkgZG8gbm90IHJldHVybiBhbnl0aGluZyB0byBnZW5lcmlj
IFBIWSBmcmFtZXdvcmsuDQoyLCBJbiBteSBhYm92ZSBjYXNlLCBkd2MzX2NvcmVfZ2V0X3BoeSB3
aWxsIHJldHVybiAwLCBhbmQgc2V0IGR3Yy0+cGh5c19yZWFkeT10cnVlLCBBbmQgdGhlbiwNCmR3
YzNfY29yZV9zb2Z0X3Jlc2V0IHdpbGwgY29zdCByZXRyaWVzKjIwbXMgdG8gY2hlY2sgaWYgc29m
dC1yZXNldCBpcyBkb25lICwgYW5kIHJldHVybiAtRVRJTUVET1VUIGlmIHRpbWUgb3V0LCBpcyB0
aGF0IGNvcnJlY3Q/DQoNCk15IHBvaW50IGlzLCBpbiB0aGlzIGNhc2UoUEhZIGRvIG5vdCBzZXQg
Y29ycmVjdGx5LCB3aGljaCBpcyBub3QgcmFyZSBkdXJpbmcgZGV2ZWxvcG1lbnQgc3RhZ2UgSSB0
aGluayksIA0KUEhZIGluaXRpYWwgZmFpbCBsZWQgdG8gc29mdC1yZXNldCB0aW1lb3V0IGJ1dCBk
d2MtPnBoeXNfcmVhZHkgaXMgdHJ1ZSwNClNvIEkgdGhpbmsgaXMgbW9yZSBzYWZlIHRvIHNheSAi
UEhZIGlzIHJlYWR5IiBhZnRlciBzb2Z0LXJlc2V0IGRvbmUsIHBsZWFzZSBsZXQgbWUga25vdyB5
b3VyIG9waW5pb24sIHRoYW5rcyBhIGxvdA0KDQpZdWFuIEZhbmcNCiANCi0tLS0t08q8/tStvP4t
LS0tLQ0Kt6K8/sjLOiBGZWxpcGUgQmFsYmkgW21haWx0bzpiYWxiaUBrZXJuZWwub3JnXSANCrei
y83KsbzkOiAyMDIxxOo21MIxMcjVIDIxOjAzDQrK1bz+yMs6IFl1YW4gRmFuZzsgbGludXgtdXNi
QHZnZXIua2VybmVsLm9yZw0Ks63LzTogRmFuZywgWXVhbg0K1vfM4jogUmU6IFtQQVRDSF0gZHJp
dmVycy91c2IvZHdjMzogU2V0IFBIWSByZWFkeSBhZnRlciBzb2Z0IHJlc2V0IGRvbmUNCg0KWXVh
biBGYW5nIDxmYW5neXVhbnNldUBnbWFpbC5jb20+IHdyaXRlczoNCg0KPiBJdCdzIG1vcmUgc2Fm
ZSB0byBzZXQgUEhZIHJlYWR5IGFmdGVyIHNvZnQgcmVzZXQgZG9uZQ0KPg0KPiBMZXQncyBjb25z
aWRlciBhIHRlc3QgY2FzZSBsaWtlIHRoaXM6DQo+IEkgaGF2ZSBhIHVzYiBQSFkgd2hpY2ggZG9u
J3QgbmVlZCBTVyBpbml0aWFsIGJlZm9yZSBhY2Nlc3MgaXQsIEJ1dCBpIA0KPiBoYXZlIGEgd3Jv
bmcgUEhZIGNsb2NrIGRlZmF1bHQgc2V0dGluZyBpbiBQSFkgcmVnaXN0ZXIgd2hpY2ggbWVhbnMg
UEhZIA0KPiBpcyBub3QgcmVhZHkgaW4gZmFjdC4NCj4gaW4gZHdjM19jb3JlX2luaXQsIGR3YzNf
Y29yZV9nZXRfcGh5IHdpbGwgcmV0dXJuIDAgZGVzcGl0ZSB1c2IgZ2V0IA0KPiBQSFlzIHdpdGgg
cmV0dXJuIC1FTk9ERVYsIGFuZCBzZXQgcGh5c19yZWFkeT10cnVlDQoNCnlvdXIgUEhZIGRyaXZl
ciBzaG91bGRuJ3QgcmV0dXJuIC1FTk9ERVYgaGVyZS4gV2h5IGFyZSB5b3UgcmV0dXJuaW5nIC1F
Tk9ERVY/IFRoZSBQSFkgaXNuJ3QgcmVhZHkgYnV0IGl0IF9kb2VzXyBleGlzdC4NCg0KLS0NCmJh
bGJpDQo=
