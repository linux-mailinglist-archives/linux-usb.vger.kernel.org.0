Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B0D2780CE
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 08:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbgIYGkm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 02:40:42 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:41788 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgIYGkl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 02:40:41 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 08P6eKQb9016389, This message is accepted by code: ctloc85258
Received: from RSEXMBS01.realsil.com.cn ([172.29.17.195])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 08P6eKQb9016389
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 25 Sep 2020 14:40:21 +0800
Received: from RSEXMBS01.realsil.com.cn (172.29.17.195) by
 RSEXMBS01.realsil.com.cn (172.29.17.195) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Fri, 25 Sep 2020 14:40:20 +0800
Received: from RSEXMBS01.realsil.com.cn ([fe80::e186:b533:fb3:8b37]) by
 RSEXMBS01.realsil.com.cn ([fe80::e186:b533:fb3:8b37%7]) with mapi id
 15.01.2044.004; Fri, 25 Sep 2020 14:40:20 +0800
From:   =?utf-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
CC:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Bluetooth: btusb: Avoid unnecessary reset upon system resume
Thread-Topic: [PATCH] Bluetooth: btusb: Avoid unnecessary reset upon system
 resume
Thread-Index: AdaTA82tEjoMhrlwTRmkpK3reTvHgQ==
Date:   Fri, 25 Sep 2020 06:40:20 +0000
Message-ID: <2ce180be1cab4400bb792f5ff2384be7@realsil.com.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.29.36.107]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgQWJoaXNoZWssDQoNCj4gT24gU2VwdGVtYmVyIDI1LCAyMDIwIGF0IDExOjM0LCBBYmhpc2hl
ayBQYW5kaXQtU3ViZWRpIHdyb3RlOg0KPiANCj4gKyBBbGV4IEx1ICh3aG8gY29udHJpYnV0ZWQg
dGhlIG9yaWdpbmFsIGNoYW5nZSkNCj4gDQo+IEhpIEthaS1IZW5nLA0KPiANCj4gDQo+IE9uIFRo
dSwgU2VwIDI0LCAyMDIwIGF0IDEyOjEwIEFNIEthaS1IZW5nIEZlbmcNCj4gPGthaS5oZW5nLmZl
bmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBbK0NjIGxpbnV4LXVzYl0NCj4gPg0K
PiA+IEhpIEFiaGlzaGVrLA0KPiA+DQo+ID4gPiBPbiBTZXAgMjQsIDIwMjAsIGF0IDA0OjQxLCBB
Ymhpc2hlayBQYW5kaXQtU3ViZWRpDQo+IDxhYmhpc2hla3BhbmRpdEBjaHJvbWl1bS5vcmc+IHdy
b3RlOg0KPiA+ID4NCj4gPiA+IEhpIEthaS1IZW5nLA0KPiA+ID4NCj4gPiA+IFdoaWNoIFJlYWx0
ZWsgY29udHJvbGxlciBpcyB0aGlzIG9uPycNCj4gPg0KPiA+IFRoZSBpc3N1ZSBoYXBwZW5zIG9u
IDg4MjFDRS4NCj4gPg0KPiA+ID4NCj4gPiA+IFNwZWNpZmljYWxseSBmb3IgUlRMODgyMkNFLCB3
ZSB0ZXN0ZWQgd2l0aG91dCByZXNldF9yZXN1bWUgYmVpbmcgc2V0DQo+ID4gPiBhbmQgdGhhdCB3
YXMgY2F1c2luZyB0aGUgY29udHJvbGxlciBiZWluZyByZXNldCB3aXRob3V0IGJsdWV6IGV2ZXIN
Cj4gPiA+IGxlYXJuaW5nIGFib3V0IGl0IChyZXN1bHRpbmcgaW4gZGV2aWNlcyBiZWluZyB1bnVz
YWJsZSB3aXRob3V0DQo+ID4gPiB0b2dnbGluZyB0aGUgQlQgcG93ZXIpLg0KPiA+DQo+ID4gVGhl
IHJlc2V0IGlzIGRvbmUgYnkgdGhlIGtlcm5lbCwgc28gaG93IGRvZXMgdGhhdCBhZmZlY3QgYmx1
ZXo/DQo+ID4NCj4gPiBGcm9tIHdoYXQgeW91IGRlc2NyaWJlZCwgaXQgc291bmRzIG1vcmUgbGlr
ZSBydW50aW1lIHJlc3VtZSBzaW5jZSBibHVleg0KPiBpcyBhbHJlYWR5IHJ1bm5pbmcuDQo+ID4g
SWYgd2UgbmVlZCByZXNldCByZXN1bWUgZm9yIHJ1bnRpbWUgcmVzdW1lLCBtYXliZSBpdCdzIGFu
b3RoZXIgYnVnDQo+IHdoaWNoIG5lZWRzIHRvIGJlIGFkZHJlc3NlZD8NCj4gDQo+IEZyb20gYnR1
c2IuYzoNCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
Ymx1ZXRvb3RoL2JsdWV0b290aC0NCj4gbmV4dC5naXQvdHJlZS9kcml2ZXJzL2JsdWV0b290aC9i
dHVzYi5jI240MTg5DQo+IC8qIFJlYWx0ZWsgZGV2aWNlcyBsb3NlIHRoZWlyIHVwZGF0ZWQgZmly
bXdhcmUgb3ZlciBnbG9iYWwNCj4gKiBzdXNwZW5kIHRoYXQgbWVhbnMgaG9zdCBkb2Vzbid0IHNl
bmQgU0VUX0ZFQVRVUkUNCj4gKiAoREVWSUNFX1JFTU9URV9XQUtFVVApDQo+ICovDQo+IA0KPiBS
dW50aW1lIHN1c3BlbmQgYWx3YXlzIHJlcXVpcmVzIHJlbW90ZSB3YWtldXAgdG8gYmUgc2V0IGFu
ZCByZXNldA0KPiByZXN1bWUgaXNuJ3QgdXNlZCB0aGVyZS4NCj4gDQo+IER1cmluZyBzeXN0ZW0g
c3VzcGVuZCwgd2hlbiByZW1vdGUgd2FrZXVwIGlzIG5vdCBzZXQsIFJUTDg4MjJDRSBsb3Nlcw0K
PiB0aGUgRlcgbG9hZGVkIGJ5IHRoZSBkcml2ZXIgYW5kIGFueSBzdGF0ZSBjdXJyZW50bHkgaW4g
dGhlIGNvbnRyb2xsZXIuDQo+IFRoaXMgY2F1c2VzIHRoZSBrZXJuZWwgYW5kIHRoZSBjb250cm9s
bGVyIHN0YXRlIHRvIGdvIG91dCBvZiBzeW5jLg0KPiBPbmUgb2YgdGhlIGlzc3VlcyB3ZSBvYnNl
cnZlZCBvbiB0aGUgUmVhbHRlayBjb250cm9sbGVyIHdpdGhvdXQgdGhlDQo+IHJlc2V0IHJlc3Vt
ZSBxdWlyayB3YXMgdGhhdCBwYWlyZWQgb3IgY29ubmVjdGVkIGRldmljZXMgd291bGQganVzdA0K
PiBzdG9wIHdvcmtpbmcgYWZ0ZXIgcmVzdW1lLg0KPiANCj4gPg0KPiA+ID4gSWYgdGhlIGZpcm13
YXJlIGRvZXNuJ3QgY3V0IG9mZiBwb3dlciBkdXJpbmcgc3VzcGVuZCwgbWF5YmUgeW91DQo+ID4g
PiBzaG91bGRuJ3Qgc2V0IHRoZSBCVFVTQl9XQUtFVVBfRElTQUJMRSBmbGFnIGZvciB0aGF0IGNv
bnRyb2xsZXIuDQo+ID4NCj4gPiBXZSBkb24ndCBrbm93IGJlZm9yZWhhbmQgaWYgdGhlIHBsYXRm
b3JtIGZpcm13YXJlIChCSU9TIGZvciBteSBjYXNlKSB3aWxsDQo+IGN1dCBwb3dlciBvZmYgb3Ig
bm90Lg0KPiA+DQo+ID4gSW4gZ2VuZXJhbCwgbGFwdG9wcyB3aWxsIGN1dCBvZmYgdGhlIFVTQiBw
b3dlciBkdXJpbmcgUzMuDQo+ID4gV2hlbiBBQyBpcyBwbHVnZ2VkLCBzb21lIGxhcHRvcHMgY3V0
cyBVU0IgcG93ZXIgb2ZmIGFuZCBzb21lIGRvbid0LiBUaGlzDQo+IGFsc28gYXBwbGllcyB0byBt
YW55IGRlc2t0b3BzLiBOb3QgdG8gbWVudGlvbiB0aGVyZSBjYW4gYmUgQklPUyBvcHRpb25zIHRv
DQo+IGNvbnRyb2wgVVNCIHBvd2VyIHVuZGVyIFMzL1M0L1M1Li4uDQo+ID4NCj4gPiBTbyB3ZSBk
b24ndCBrbm93IGJlZm9yZWhhbmQuDQo+ID4NCj4gDQo+IEkgdGhpbmsgdGhlIGNvbmZ1c2lvbiBo
ZXJlIHN0ZW1zIGZyb20gd2hhdCBpcyBhY3R1YWxseSBiZWluZyB0dXJuZWQNCj4gb2ZmIGJldHdl
ZW4gb3VyIHR3byBib2FyZHMgYW5kIHdoYXQgd2UncmUgcmVmZXJyaW5nIHRvIGFzIGZpcm13YXJl
IDopDQo+IA0KPiBJbiB5b3VyIGNhc2UsIHRoZSBSZWFsdGVrIGNvbnRyb2xsZXIgcmV0YWlucyBm
aXJtd2FyZSB1bmxlc3MgdGhlDQo+IHBsYXRmb3JtIGN1dHMgb2YgcG93ZXIgdG8gVVNCICh3aGlj
aCBpdCBkb2VzIGR1cmluZyBTMykuDQo+IEluIG15IGNhc2UsIHRoZSBSZWFsdGVrIGNvbnRyb2xs
ZXIgbG9zZXMgZmlybXdhcmUgd2hlbiBSZW1vdGUgV2FrZXVwDQo+IGlzbid0IHNldCwgZXZlbiBp
ZiB0aGUgcGxhdGZvcm0gZG9lc24ndCBjdXQgcG93ZXIgdG8gVVNCLg0KPiANCj4gSW4geW91ciBj
YXNlLCBzaW5jZSB5b3UgZG9uJ3QgbmVlZCB0byBlbmZvcmNlIHRoZSAnUmVtb3RlIFdha2V1cCcg
Yml0LA0KPiBpZiB5b3UgdW5zZXQgdGhlIEJUVVNCX1dBS0VVUF9ESVNBQkxFIGZvciB0aGF0IFZJ
RDpQSUQsIHlvdSBzaG91bGQgZ2V0DQo+IHRoZSBkZXNpcmFibGUgYmVoYXZpb3IgKHdoaWNoIGlz
IGFjdHVhbGx5IHRoZSBkZWZhdWx0IGJlaGF2aW9yOyByZW1vdGUNCj4gd2FrZSB3aWxsIGFsd2F5
cyBiZSBhc3NlcnRlZCBpbnN0ZWFkIG9mIG9ubHkgZHVyaW5nIFJ1bnRpbWUgU3VzcGVuZCkuDQo+
IA0KPiBAQWxleCAtLSBXaGF0IGlzIHRoZSBjb21tb24gYmVoYXZpb3IgZm9yIFJlYWx0ZWsgY29u
dHJvbGxlcnM/IFNob3VsZA0KPiB3ZSBzZXQgQlRVU0JfV0FLRVVQX0RJU0FCTEUgb25seSBvbiBS
VEw4ODIyQ0Ugb3Igc2hvdWxkIHdlIHVuc2V0IGl0DQo+IG9ubHkgb24gUlRMODgyMUNFPw0KPiAN
Cg0KQWNjb3JkaW5nIHRvIHRoZSBmZWVkYmFjayBmcm9tIG91ciBmaXJtd2FyZSBlbmdpbmVlcnMs
IGFsbCBSZWFsdGVrIGNvbnRyb2xsZXJzIHNob3VsZCBoYXZlIHRoZSBzYW1lIGJlaGF2aW9yIG9u
IHN1c3BlbmQgYW5kIHJlc3VtZS4NCkAgS2FpLUhlbmcsICIgQmx1ZXRvb3RoOiBoY2kwOiBjb21t
YW5kIDB4MTAwMSB0eCB0aW1lb3V0ICIgaXMgaXJyZWxldmFudCB0byBmaXJtd2FyZSBsb3NzIG9y
IG5vdC4gVGhlIHJvbSBjb2RlIGluIGNvbnRyb2xsZXIgc3VwcG9ydHMgdGhpcyBjb21tYW5kLg0K
DQo+ID4gPg0KPiA+ID4gSSB3b3VsZCBwcmVmZXIgdGhpcyBkb2Vzbid0IGdldCBhY2NlcHRlZCBp
biBpdHMgY3VycmVudCBzdGF0ZS4NCj4gPg0KPiA+IE9mIGNvdXJzZS4NCj4gPiBJIHRoaW5rIHdl
IG5lZWQgdG8gZmluZCB0aGUgcm9vdCBjYXVzZSBmb3IgeW91ciBjYXNlIGJlZm9yZSBhcHBseWlu
ZyB0aGlzDQo+IG9uZS4NCj4gPg0KPiA+IEthaS1IZW5nDQo+ID4NCj4gPiA+DQo+ID4gPiBBYmhp
c2hlaw0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgU2VwIDIzLCAyMDIwIGF0IDEwOjU2IEFNIEthaS1I
ZW5nIEZlbmcNCj4gPiA+IDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOg0KPiA+
ID4+DQo+ID4gPj4gUmVhbHRlayBibHVldG9vdGggY29udHJvbGxlciBtYXkgZmFpbCB0byB3b3Jr
IGFmdGVyIHN5c3RlbSBzbGVlcDoNCj4gPiA+PiBbIDEyNzIuNzA3NjcwXSBCbHVldG9vdGg6IGhj
aTA6IGNvbW1hbmQgMHgxMDAxIHR4IHRpbWVvdXQNCj4gPiA+PiBbIDEyODAuODM1NzEyXSBCbHVl
dG9vdGg6IGhjaTA6IFJUTDogSENJX09QX1JFQURfTE9DQUxfVkVSU0lPTg0KPiBmYWlsZWQgKC0x
MTApDQo+ID4gPj4NCj4gPiA+PiBJZiBwbGF0Zm9ybSBmaXJtd2FyZSBkb2Vzbid0IGN1dCBwb3dl
ciBvZmYgZHVyaW5nIHN1c3BlbmQsIHRoZQ0KPiBmaXJtd2FyZQ0KPiA+ID4+IGlzIGNvbnNpZGVy
ZWQgcmV0YWluZWQgaW4gY29udHJvbGxlciBidXQgdGhlIGRyaXZlciBpcyBzdGlsbCBhc2tpbmcg
VVNCDQo+ID4gPj4gY29yZSB0byBwZXJmb3JtIGEgcmVzZXQtcmVzdW1lLiBUaGlzIGNhbiBtYWtl
IGJsdWV0b290aCBjb250cm9sbGVyDQo+ID4gPj4gdW51c2FibGUuDQo+ID4gPj4NCj4gPiA+PiBT
byBhdm9pZCB1bm5lY2Vzc2FyeSByZXNldCB0byByZXNvbHZlIHRoZSBpc3N1ZS4NCj4gPiA+Pg0K
PiA+ID4+IEZvciBkZXZpY2VzIHRoYXQgcmVhbGx5IGxvc2UgcG93ZXIgZHVyaW5nIHN1c3BlbmQs
IFVTQiBjb3JlIHdpbGwgZGV0ZWN0DQo+ID4gPj4gYW5kIGhhbmRsZSByZXNldC1yZXN1bWUgY29y
cmVjdGx5Lg0KPiA+ID4+DQo+ID4gPj4gU2lnbmVkLW9mZi1ieTogS2FpLUhlbmcgRmVuZyA8a2Fp
LmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPg0KPiA+ID4+IC0tLQ0KPiA+ID4+IGRyaXZlcnMvYmx1
ZXRvb3RoL2J0dXNiLmMgfCA4ICsrKy0tLS0tDQo+ID4gPj4gMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiA+Pg0KPiA+ID4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2JsdWV0b290aC9idHVzYi5jIGIvZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYw0KPiA+
ID4+IGluZGV4IDhkMjYwOGRkZmQwOC4uZGU4NmVmNDM4OGY5IDEwMDY0NA0KPiA+ID4+IC0tLSBh
L2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMNCj4gPiA+PiArKysgYi9kcml2ZXJzL2JsdWV0b290
aC9idHVzYi5jDQo+ID4gPj4gQEAgLTQyNTUsMTcgKzQyNTUsMTUgQEAgc3RhdGljIGludCBidHVz
Yl9zdXNwZW5kKHN0cnVjdA0KPiB1c2JfaW50ZXJmYWNlICppbnRmLCBwbV9tZXNzYWdlX3QgbWVz
c2FnZSkNCj4gPiA+PiAgICAgICAgICAgICAgICBlbmFibGVfaXJxKGRhdGEtPm9vYl93YWtlX2ly
cSk7DQo+ID4gPj4gICAgICAgIH0NCj4gPiA+Pg0KPiA+ID4+IC0gICAgICAgLyogRm9yIGdsb2Jh
bCBzdXNwZW5kLCBSZWFsdGVrIGRldmljZXMgbG9zZSB0aGUgbG9hZGVkIGZ3DQo+ID4gPj4gLSAg
ICAgICAgKiBpbiB0aGVtLiBCdXQgZm9yIGF1dG9zdXNwZW5kLCBmaXJtd2FyZSBzaG91bGQgcmVt
YWluLg0KPiA+ID4+IC0gICAgICAgICogQWN0dWFsbHksIGl0IGRlcGVuZHMgb24gd2hldGhlciB0
aGUgdXNiIGhvc3Qgc2VuZHMNCj4gPiA+PiArICAgICAgIC8qIEZvciBnbG9iYWwgc3VzcGVuZCwg
UmVhbHRlayBkZXZpY2VzIGxvc2UgdGhlIGxvYWRlZCBmdyBpbiB0aGVtIGlmDQo+ID4gPj4gKyAg
ICAgICAgKiBwbGF0Zm9ybSBmaXJtd2FyZSBjdXQgcG93ZXIgb2ZmLiBCdXQgZm9yIGF1dG9zdXNw
ZW5kLCBmaXJtd2FyZQ0KPiA+ID4+ICsgICAgICAgICogc2hvdWxkIHJlbWFpbi4gIEFjdHVhbGx5
LCBpdCBkZXBlbmRzIG9uIHdoZXRoZXIgdGhlIHVzYiBob3N0DQo+IHNlbmRzDQo+ID4gPj4gICAg
ICAgICAqIHNldCBmZWF0dXJlIChlbmFibGUgd2FrZXVwKSBvciBub3QuDQo+ID4gPj4gICAgICAg
ICAqLw0KPiA+ID4+ICAgICAgICBpZiAodGVzdF9iaXQoQlRVU0JfV0FLRVVQX0RJU0FCTEUsICZk
YXRhLT5mbGFncykpIHsNCj4gPiA+PiAgICAgICAgICAgICAgICBpZiAoUE1TR19JU19BVVRPKG1l
c3NhZ2UpICYmDQo+ID4gPj4gICAgICAgICAgICAgICAgICAgIGRldmljZV9jYW5fd2FrZXVwKCZk
YXRhLT51ZGV2LT5kZXYpKQ0KPiA+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgZGF0YS0+dWRl
di0+ZG9fcmVtb3RlX3dha2V1cCA9IDE7DQo+ID4gPj4gLSAgICAgICAgICAgICAgIGVsc2UgaWYg
KCFQTVNHX0lTX0FVVE8obWVzc2FnZSkpDQo+ID4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ZGF0YS0+dWRldi0+cmVzZXRfcmVzdW1lID0gMTsNCj4gPiA+PiAgICAgICAgfQ0KPiA+ID4+DQo+
ID4gPj4gICAgICAgIHJldHVybiAwOw0KPiA+ID4+IC0tDQo+ID4gPj4gMi4xNy4xDQo+ID4gPj4N
Cj4gPg0KPiANCg==
