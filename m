Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993E03B6C9A
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 04:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhF2Con (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Jun 2021 22:44:43 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:45859 "EHLO
        shasxm03.verisilicon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231924AbhF2Com (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Jun 2021 22:44:42 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
        c=simple/simple; t=1624934530; h=from:subject:to:date:message-id;
        bh=Byv3ayTq5WXT2M/TdNnjgf3tTKl3xjeapNWVFVavpWc=;
        b=e2aE0p9v3kM7+ynaCaHZyfPQlFuIm/yGUsw0+QSB5xG42s49A4MHhhh2qWuS1fUeM2c27jHa4Qa
        D3Pym24tiiWuIob2dqm6ssNxEyAjYCamMXGScGVp+jjRbNuQknhkE4M511cwen54yLhkTJThXW6XP
        WDkCyTclO+fJdItLMjk=
Received: from SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda]) by
 SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa%14]) with mapi id
 14.03.0408.000; Tue, 29 Jun 2021 10:42:09 +0800
From:   "Fang, Yuan" <Yuan.Fang@verisilicon.com>
To:     "Fang, Yuan" <Yuan.Fang@verisilicon.com>,
        Felipe Balbi <balbi@kernel.org>,
        Yuan Fang <fangyuanseu@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBkcml2ZXJzL3VzYi9kd2MzOiBTZXQgUEhZIHJlYWR5?=
 =?gb2312?Q?_after_soft_reset_done?=
Thread-Topic: [PATCH] drivers/usb/dwc3: Set PHY ready after soft reset done
Thread-Index: AQHXXpH16kk4ndlpHUqkheri6gWwB6sOQNqAgAexvOCAFHCLsA==
Date:   Tue, 29 Jun 2021 02:42:08 +0000
Message-ID: <678AD2A4F5F78445B722FED0965FE327776E6111@SHASXM06.verisilicon.com>
References: <20210611071805.9169-1-yuan.fang@verisilicon.com>
 <87r1h8zh8y.fsf@kernel.org> 
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.13.191]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--5.972800-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWFpbnRhaW5uZXIsDQoNCkNvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgeW91ciB0aG91Z2h0cyB3
aXRoIG1lPw0KVGhhbmtzIGEgbG90Lg0KDQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBG
YW5nLCBZdWFuIA0Kt6LLzcqxvOQ6IDIwMjHE6jbUwjE2yNUgMTA6NTYNCsrVvP7IyzogJ0ZlbGlw
ZSBCYWxiaSc7IFl1YW4gRmFuZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0K1vfM4jogtPC4
tDogW1BBVENIXSBkcml2ZXJzL3VzYi9kd2MzOiBTZXQgUEhZIHJlYWR5IGFmdGVyIHNvZnQgcmVz
ZXQgZG9uZQ0KDQpIaSBCYWxiaSwNCg0KPiBJdCdzIG1vcmUgc2FmZSB0byBzZXQgUEhZIHJlYWR5
IGFmdGVyIHNvZnQgcmVzZXQgZG9uZQ0KPg0KPiBMZXQncyBjb25zaWRlciBhIHRlc3QgY2FzZSBs
aWtlIHRoaXM6DQo+IEkgaGF2ZSBhIHVzYiBQSFkgd2hpY2ggZG9uJ3QgbmVlZCBTVyBpbml0aWFs
IGJlZm9yZSBhY2Nlc3MgaXQsIEJ1dCBpIA0KPiBoYXZlIGEgd3JvbmcgUEhZIGNsb2NrIGRlZmF1
bHQgc2V0dGluZyBpbiBQSFkgcmVnaXN0ZXIgd2hpY2ggbWVhbnMgUEhZIA0KPiBpcyBub3QgcmVh
ZHkgaW4gZmFjdC4NCj4gaW4gZHdjM19jb3JlX2luaXQsIGR3YzNfY29yZV9nZXRfcGh5IHdpbGwg
cmV0dXJuIDAgZGVzcGl0ZSB1c2IgZ2V0IA0KPiBQSFlzIHdpdGggcmV0dXJuIC1FTk9ERVYsIGFu
ZCBzZXQgcGh5c19yZWFkeT10cnVlDQoNCj4geW91ciBQSFkgZHJpdmVyIHNob3VsZG4ndCByZXR1
cm4gLUVOT0RFViBoZXJlLiBXaHkgYXJlIHlvdSByZXR1cm5pbmcgLUVOT0RFVj8gVGhlIFBIWSBp
c24ndCByZWFkeSBidXQgaXQgX2RvZXNfIGV4aXN0Lg0KDQpTb3JyeSBmb3IgdGhlIGxhdGUgcmVw
bHksIG15IGV4cGxhaW4gbWF5IGJlIG5vdCBjbGVhciwgbGV0IG1lIGRlc2NyaWJlIGl0IG9uY2Ug
bW9yZSAxLCBJIGRvbqGvdCBjb2RpbmcgYSBQSFkgZHJpdmVyLCBJIGhhdmUgYSBQSFkgd2hpY2gg
ZG8gTk9UIG5lZWQgU1cgb3BlcmF0aW9uIEFsbCBJIHNob3VsZCBkbyBpcyBzZXQgdGhlIHJlbGF0
ZWQgUEhZIGN0cmwgcmVncyBjb3JyZWN0bHkuIFNvIEkgZG8gbm90IHJldHVybiBhbnl0aGluZyB0
byBnZW5lcmljIFBIWSBmcmFtZXdvcmsuDQoyLCBJbiBteSBhYm92ZSBjYXNlLCBkd2MzX2NvcmVf
Z2V0X3BoeSB3aWxsIHJldHVybiAwLCBhbmQgc2V0IGR3Yy0+cGh5c19yZWFkeT10cnVlLCBBbmQg
dGhlbiwgZHdjM19jb3JlX3NvZnRfcmVzZXQgd2lsbCBjb3N0IHJldHJpZXMqMjBtcyB0byBjaGVj
ayBpZiBzb2Z0LXJlc2V0IGlzIGRvbmUgLCBhbmQgcmV0dXJuIC1FVElNRURPVVQgaWYgdGltZSBv
dXQsIGlzIHRoYXQgY29ycmVjdD8NCg0KTXkgcG9pbnQgaXMsIGluIHRoaXMgY2FzZShQSFkgZG8g
bm90IHNldCBjb3JyZWN0bHksIHdoaWNoIGlzIG5vdCByYXJlIGR1cmluZyBkZXZlbG9wbWVudCBz
dGFnZSBJIHRoaW5rKSwgUEhZIGluaXRpYWwgZmFpbCBsZWQgdG8gc29mdC1yZXNldCB0aW1lb3V0
IGJ1dCBkd2MtPnBoeXNfcmVhZHkgaXMgdHJ1ZSwgU28gSSB0aGluayBpcyBtb3JlIHNhZmUgdG8g
c2F5ICJQSFkgaXMgcmVhZHkiIGFmdGVyIHNvZnQtcmVzZXQgZG9uZSwgcGxlYXNlIGxldCBtZSBr
bm93IHlvdXIgb3BpbmlvbiwgdGhhbmtzIGEgbG90DQoNCll1YW4gRmFuZw0KIA0KLS0tLS3Tyrz+
1K28/i0tLS0tDQq3orz+yMs6IEZlbGlwZSBCYWxiaSBbbWFpbHRvOmJhbGJpQGtlcm5lbC5vcmdd
DQq3osvNyrG85DogMjAyMcTqNtTCMTHI1SAyMTowMw0KytW8/sjLOiBZdWFuIEZhbmc7IGxpbnV4
LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCrOty806IEZhbmcsIFl1YW4NCtb3zOI6IFJlOiBbUEFUQ0hd
IGRyaXZlcnMvdXNiL2R3YzM6IFNldCBQSFkgcmVhZHkgYWZ0ZXIgc29mdCByZXNldCBkb25lDQoN
Cll1YW4gRmFuZyA8ZmFuZ3l1YW5zZXVAZ21haWwuY29tPiB3cml0ZXM6DQoNCj4gSXQncyBtb3Jl
IHNhZmUgdG8gc2V0IFBIWSByZWFkeSBhZnRlciBzb2Z0IHJlc2V0IGRvbmUNCj4NCj4gTGV0J3Mg
Y29uc2lkZXIgYSB0ZXN0IGNhc2UgbGlrZSB0aGlzOg0KPiBJIGhhdmUgYSB1c2IgUEhZIHdoaWNo
IGRvbid0IG5lZWQgU1cgaW5pdGlhbCBiZWZvcmUgYWNjZXNzIGl0LCBCdXQgaSANCj4gaGF2ZSBh
IHdyb25nIFBIWSBjbG9jayBkZWZhdWx0IHNldHRpbmcgaW4gUEhZIHJlZ2lzdGVyIHdoaWNoIG1l
YW5zIFBIWSANCj4gaXMgbm90IHJlYWR5IGluIGZhY3QuDQo+IGluIGR3YzNfY29yZV9pbml0LCBk
d2MzX2NvcmVfZ2V0X3BoeSB3aWxsIHJldHVybiAwIGRlc3BpdGUgdXNiIGdldCANCj4gUEhZcyB3
aXRoIHJldHVybiAtRU5PREVWLCBhbmQgc2V0IHBoeXNfcmVhZHk9dHJ1ZQ0KDQp5b3VyIFBIWSBk
cml2ZXIgc2hvdWxkbid0IHJldHVybiAtRU5PREVWIGhlcmUuIFdoeSBhcmUgeW91IHJldHVybmlu
ZyAtRU5PREVWPyBUaGUgUEhZIGlzbid0IHJlYWR5IGJ1dCBpdCBfZG9lc18gZXhpc3QuDQoNCi0t
DQpiYWxiaQ0K
