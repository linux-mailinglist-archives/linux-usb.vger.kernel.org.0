Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7DB23D690
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 07:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgHFFvc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 01:51:32 -0400
Received: from ma-dnext01.denso.co.jp ([133.192.181.76]:41882 "EHLO
        adnmlgw01h.denso.co.jp" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726051AbgHFFva (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 01:51:30 -0400
X-Greylist: delayed 452 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Aug 2020 01:51:29 EDT
Received: from grdma02h.denso.co.jp (unknown [133.192.24.24])
        by adnmlgw01h.denso.co.jp (Postfix) with ESMTP id 417D7200333E;
        Thu,  6 Aug 2020 14:43:56 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adit-jv.com;
        s=jpadit-jvmail2020; t=1596692636;
        bh=gfQFZqWuGopcGuJW14xWdtO1ZVwWJ8lP7/T2UEwCReU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=SqfTQbFnWwmJx0NMeFMjIb6pXcJk3hY+NTVNBewOLvRrzA2ry+0+XRwXH2NNWAK6O
         MX1brVBCH078gHSIrcvvkYqjulE0QkXR6LL6PjW6GNSA+mfbz3Gcyj6zSd61zFRjVv
         VRJIME9rLtSfxqFgxTsbylXkpZKvrn4orgijPvrVEppd6a753f/2/SJ12ziwLgxiEu
         OaxoriethCysK1lxgowOeVKRKxobQmy9AUSwN2xu4PxnuYf3G2G9GcVp2B/yzSZu5v
         KGWK4c/wC+HQzkvev8BF06DuhUD6lu2UW4MCi3uy/DHRCBhO56Z08Ag9FEvMSp9/BR
         /5TB5r5rVnpeQ==
Received: by grdma02h.denso.co.jp (Postfix, from userid 0)
        id 3BD4BC04E09; Thu,  6 Aug 2020 14:43:56 +0900 (JST)
Received: from smtp0.denso.co.jp [133.192.24.87] 
         by grdma02h. with ESMTP id QAA20974;
         Thu, 6 Aug 2020 14:43:56 +0900
Received: from ky0exch01.adit-jv.com ([10.71.113.8])
        by smtp00.denso.co.jp (MOS 4.4.7-GA)
        with ESMTP id GJR05021;
        Thu, 6 Aug 2020 14:43:55 +0900
Received: from ky0exch01.adit-jv.com ([fe80::d1dc:e987:3941:eb7d]) by
 ky0exch01.adit-jv.com ([fe80::d1dc:e987:3941:eb7d%12]) with mapi id
 14.03.0487.000; Thu, 6 Aug 2020 14:43:55 +0900
From:   "Asano, Yasushi (ADITJ/SWG)" <yasano@jp.adit-jv.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Yasushi Asano <yazzep@gmail.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        "andrew_gabbasov@mentor.com" <andrew_gabbasov@mentor.com>,
        "jim_baxter@mentor.com" <jim_baxter@mentor.com>,
        "Natsume, Wataru (ADITJ/SWG)" <wnatsume@jp.adit-jv.com>,
        "Nishiguchi, Naohiro (ADITJ/SWG)" <nnishiguchi@jp.adit-jv.com>
Subject: RE: [PATCH] [RFC] USB: hub.c: Add the retry count module parameter
 for usbcore
Thread-Topic: [PATCH] [RFC] USB: hub.c: Add the retry count module parameter
 for usbcore
Thread-Index: AQHWZl4v95WyGSg90UyV1jUEw9LFKKkmJq8AgAR0XCA=
Date:   Thu, 6 Aug 2020 05:43:54 +0000
Message-ID: <589E8CD8BC4E4743ADCA659B6BADC9710BD43DB7@ky0exch01.adit-jv.com>
References: <20200730104226.3537-1-yazzep@gmail.com>
 <20200803183732.GA112453@rowland.harvard.edu>
In-Reply-To: <20200803183732.GA112453@rowland.harvard.edu>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.71.112.129]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RGVhciBBbGFuDQpEZWFyIEdyZWcNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLg0KSSBy
ZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIGNvbmNyZXRlIHByb3Bvc2FsLg0KDQo+IFNvIGxldCdzIGNo
YW5nZSB0aGUgY29kZSB0byBkbyAzIHRyaWVzIHdpdGggZWFjaCBzY2hlbWUuDQpJIHVuZGVyc3Rv
b2QuIEkgd2lsbCB0cnkgdG8gbW9kaWZ5IGl0IHNvIHRoYXQgdGhlIG51bWJlciBvZiANCmF0dGVt
cHRzIHdpbGwgZGVjcmVhc2UuIEl0IGlzIDYgYXR0ZW1wdHMgaW4gdG90YWwgYm90aCBvbGQgYW5k
IA0KbmV3IHNjaGVtZXMsIGJ1dCBtc2xlZXAgaXMgZXhlY3V0ZWQgYXQgdmFyaW91cyBwbGFjZXMg
aW4gDQpodWJfcG9ydF9jb25uZWN0IGFuZCBodWJfcG9ydF9pbml0LiBhcGFydCBmcm9tIGEgdGlt
ZW91dC4NCiANCkZvciBleGFtcGxlLCBtc2xlZXAoMTAwKSBpcyBleGVjdXRlZCBldmVyeSB0aW1l
IGluIHRoZSBsb29wIG9mIA0KR0VUX0RFU0NSSVBUT1JfVFJJRVNbOF0gb2YgbmV3IHNjaGVtZS4g
YW5kIEluIHRoZSBvbGQgc2NoZW1lLCANCm1zbGVlcCgyMDApIGlzIGV4ZWN1dGVkIGluIHRoZSBs
b29wIG9mIFNFVF9BRERSRVNTX1RSSUVTWzEwXS4NCkZyb20gbXkgbWVhc3VyZW1lbnQsIGl0IGRv
ZXMgbm90IHN1YnNpZGUgd2l0aGluIDMwIHNlY29uZHMsIA0KYnV0IGl0IGlzIGFyb3VuZCAzMiBz
ZWNvbmRzLg0KDQpGcm9tIHRoZXNlIHRoaW5ncywgSSB3b3VsZCBsaWtlIHlvdSB0byByZWNvbnNp
ZGVyIHRoZSBudW1iZXIgb2YgYXR0ZW1wdHMuIA0KSXMgaXQgT0sgdG8gc2V0IHRoZSBuZXcgc2No
ZW1lIHRvIDMgdGltZXMgYW5kIHRoZSBvbGQgc2NoZW1lIHRvIA0KMiB0aW1lcyhubyBjaGFuZ2Ug
YXMgaXQgaXMpPyBJbiBvdGhlciB3b3JkcyANCg0KW3BsYW4gMV0NCjMgKiBuZXcgc2NoZW1lLCB0
aGVuIDIgKiBvbGQgc2NoZW1lLCBvciBlbHNlDQoyICogb2xkIHNjaGVtZSwgdGhlbiAzICogbmV3
X3NjaGVtZSwNCmRlcGVuZGluZyBvbiB0aGUgb2xkX3NjaGVtZV9maXJzdCBwYXJhbWV0ZXIuDQoN
CkFsc28sIGFsdGhvdWdoIGl0IGlzIGEgImJldHRlciBwbGFuIiwgdGhlIG9yaWdpbmFsIHByb2Nl
c3NpbmcgaXMgaW4gdGhlIGZvbGxvd2luZy4NCg0KNiAqIG5ldyBzY2hlbWUsIHRoZW4gNiAqIG5l
dyBzY2hlbWUsIA0KdGhlbiAyICogb2xkIHNjaGVtZSwgdGhlbiAyICogb2xkIHNjaGVtZQ0KDQpp
ZiBpdCB3aWxsIGJlIG1vZGlmaWVkIGZyb20gYWJvdmUgdG8gYmVsb3csIEl0IHNlZW1zIHRoYXQg
dGhlIHN0cnVjdHVyZSANCm9mIHRoZSBsb29wIGhhcyB0byBiZSBncmVhdGx5IHJldmlzZWQuIEkg
dGhpbmsuDQoNCjIgKiBuZXcgc2NoZW1lLCB0aGVuIDIgKiBvbGQgc2NoZW1lLCANCnRoZW4gMSAq
IG5ldyBzY2hlbWUsIHRoZW4gMSAqIG9sZCBzY2hlbWUNCg0KVGhlIGZpeCBpcyBsaWtlbHkgdG8g
YmUgbGFyZ2UsIHNvIENhbiBJIHByb2NlZWQgd2l0aCBhIHBhdGNoIGluIHBsYW4gMT8NCkkgd2ls
bCBwb3N0IHRoZSBwYXRjaCBhZnRlciBjb25maXJtaW5nIHRoZSBiZWhhdmlvciBvZiB0aGUgcGF0
Y2ggd2l0aCANCnRoZSBjdXN0b21lciBib2FyZCB3aXRoIHRoZSBQRVQgdG9vbC4gcGxlYXNlIGdp
dmUgbWUgYSBsaXR0bGUgdGltZS4NCg0KQmVzdCBSZWdhcmRzDQpZYXN1c2hpIEFzYW5vDQoNCk9u
IFRodSwgSnVsIDMwLCAyMDIwIGF0IDA3OjQyOjI2UE0gKzA5MDAsIFlhc3VzaGkgQXNhbm8gd3Jv
dGU6DQo+IEZyb206IFlhc3VzaGkgQXNhbm8gPHlhc2Fub0BqcC5hZGl0LWp2LmNvbT4NCj4gDQo+
IERlYXIgQWxhbg0KPiBEZWFyIEdyZWcNCj4gDQo+IEkgd291bGQgbGlrZSB0byBoYXZlIGEgY29u
c3VsdGF0aW9uIHdpdGggeW91LiBUaGUgY3VzdG9tZXIncyBwcm9kdWN0DQo+IGJvYXJkIG5lZWRz
IHRvIGdldCBhIFVTQiBjZXJ0aWZpY2F0aW9uIGFuZCBjb21wbGlhbmNlLCBidXQgaXQgY2FuIG5v
dA0KPiBwYXNzIHRoZSB0ZXN0IHVzaW5nIHRoZSBjdXJyZW50IFVTQiBodWIgZHJpdmVyLiBBY2Nv
cmRpbmcgdG8gdGhlIFVTQg0KPiBjb21wbGlhbmNlIHBsYW5bMV0sIHRoZeKAnDYuNy4yMiBEZXZp
Y2UgTm8gUmVzcG9uc2XigJ0gdGVzdCByZXF1aXJlcyB0aGUNCj4gZGV0ZWN0aW9uIG9mIGRldmlj
ZSBlbnVtZXJhdGlvbiBmYWlsdXJlIHdpdGhpbiAzMCBzZWNvbmRzLiBUaGUNCj4ga2VybmVsKFVT
QiBodWIgZHJpdmVyKSBtdXN0IG5vdGlmeSB1c2Vyc3BhY2Ugb2YgdGhlIGVudW1lcmF0aW9uIGZh
aWx1cmUNCj4gd2l0aGluIDMwIHNlY29uZHMuDQo+IA0KPiBJbiB0aGUgY3VycmVudCBodWIgZHJp
dmVyLCB0aGUgcGxhY2UgdG8gZGV0ZWN0IGRldmljZSBlbnVtZXJhdGlvbg0KPiBmYWlsdXJlIGlz
IFsyXS4gSSBoYXZlIG1vZGlmaWVkIHRoZSBodWIgZHJpdmVyIHRvIGlzc3VlIGEgdWV2ZW50IGhl
cmUsDQo+IGJ1dCB0aGUgcHJvY2VkdXJlIG9mIGRldmljZSBlbnVtZXJhdGlvbiAobmV3X3NjaGVt
ZStvbGRfc2NoZW1lKSB0YWtlcw0KPiB0b28gbG9uZyB0byBleGVjdXRlLCBpdCBjb3VsZG4ndCBy
ZWFjaCBbMl0gd2l0aGluIDMwIHNlY29uZHMgYWZ0ZXINCj4gc3RhcnRpbmcgdGhlIHRlc3QuICBB
Y2NvcmRpbmcgdG8gdGhlIHJlc3VsdCBvZiBQRVR0b29sIFszXSwgdGhlIHN0YXRlIG9mDQo+ICJE
ZXZpY2UgTm8gcmVzcG9uc2UiIGlzIHRoYXQgdXNiX2NvbnRyb2xfbXNnKFVTQl9SRVFfR0VUX0RF
U0NSSVBUT1IpIFs0XQ0KPiBpbiBodWJfcG9ydF9pbml0biB0aW1lcyBvdXQuIFRoYXQgbWVhbnMg
ciA9PSAtRVRJTUVET1VULiAgYmVjYXVzZSBvZiB0aGUNCj4gZGVmYXVsdCBzZXR0aW5nIG9mIGlu
aXRpYWxfZGVzY3JpcHRvcl90aW1lb3V0IGlzIDUwMDAgbXNlY1s1XSwNCj4gdXNiX2NvbnRyb2xf
bXNnKCkgdG9vayA1MDAwbXNlYyB1bnRpbCAtRVRJTUVET1VULg0KPiANCj4gSSB3aWxsIHRyeSB0
byBkZXNjcmliZSB0aGUgZmxvdyBvZiBkZXZpY2UgZW51bWVyYXRpb24gcHJvY2Vzc2luZw0KPiBi
ZWxvd1s2XS4gIElmIG15IHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdCwgdGhlIGVudW1lcmF0aW9u
IGZhaWx1cmUgWzJdDQo+IHdpbGwgYmUgcmVhY2hlZCBhZnRlciBwZXJmb3JtaW5nIGFsbCB0aGUg
bG9vcHMgb2YgWzddWzhdWzldK1s3XVsxMF0uICBJbg0KPiB0aGUgbmV3IHNjaGVtZSwgMTIgdGlt
ZXMgY2hlY2sgd2lsbCBiZSBwZXJmb3JtZWQgKFs3XS8yKls4XSpbOV0gPT4gMioyKjMNCj4gPT4g
MTIpLiAgSW4gdGhlIG9sZCBzY2hlbWUgLCA0IHRpbWVzIGNoZWNrIHdpbGwgYmUgcGVyZm9ybWVk
IChbN10vMipbMTBdDQo+ID0+IDIqMiA9PiA0KS4gIEluIHRvdGFsLCBpdCBjaGVja3MgMTYgdGlt
ZXMsIGFuZCBpdCB0b29rIDUwMDBtc2VjIHRvDQo+IEVUSU1FRE9VVCBldmVyeSB0aW1lLiBUaGVy
ZWZvcmUsIEl0IHRha2VzIGFib3V0IDgwIHNlY29uZHMoMTYqNTAwMG1zZWMpDQo+IHRvIHJlYWNo
IFsyXS4gVGhpcyBkb2VzIG5vdCBwYXNzIHRoZSAiRGV2aWNlIE5vIHJlc3BvbnNlIiB0ZXN0Lg0K
DQpJIGFncmVlIHdpdGggR3JlZywgd2UgZG9uJ3Qgd2FudCB0byBhZGQgbW9kdWxlIHBhcmFtZXRl
cnMuDQoNClRoZSBwcm9ibGVtIGlzIHRoYXQgd2UgbWFrZSB1cCB0byAxNiBhdHRlbXB0cywgYW5k
IGVhY2ggYXR0ZW1wdCBjYW4gdGFrZSANCjUgc2Vjb25kcy4gIFdlIG5lZWQgdG8gZGVjcmVhc2Ug
dGhlIG51bWJlciBvZiBhdHRlbXB0cyB0byA2OyB0aGVuIHRoZSANCnRvdGFsIHRpbWUgd2lsbCBi
ZSAzMCBzZWNvbmRzLiAgV2UgYWxzbyBuZWVkIHRvIGtlZXAgYm90aCB0aGUgb2xkIGFuZCANCm5l
dyBzY2hlbWVzLg0KDQpTbyBsZXQncyBjaGFuZ2UgdGhlIGNvZGUgdG8gZG8gMyB0cmllcyB3aXRo
IGVhY2ggc2NoZW1lLiAgRm9yIGV4YW1wbGUsDQoNCgkzICogbmV3IHNjaGVtZSwgdGhlbiAzICog
b2xkIHNjaGVtZSwgb3IgZWxzZQ0KDQoJMyAqIG9sZCBzY2hlbWUsIHRoZW4gMyAqIG5ld19zY2hl
bWUsDQoNCmRlcGVuZGluZyBvbiB0aGUgb2xkX3NjaGVtZV9maXJzdCBwYXJhbWV0ZXIuICBDaGFu
Z2UgdGhlIGxvb3BzIGluIFs3XSwgDQpbOF0sIFs5XSwgYW5kIFsxMF0gc28gdGhhdCBlYWNoIGl0
ZXJhdGlvbiBkb2VzIHRoZSBuZXh0IGl0ZW0gb24gdGhpcyANCmxpc3QgaW5zdGVhZCBvZiBzdGFy
dGluZyBiYWNrIGF0IHRoZSBiZWdpbm5pbmcuDQoNCihPciBtYXliZSBpdCB3b3VsZCB3b3JrIGJl
dHRlciB3aXRoDQoNCgkyICogc2NoZW1lLCB0aGVuIDIgKiBvbGQgc2NoZW1lLCB0aGVuIDEgKiBu
ZXcgc2NoZW1lLA0KCQl0aGVuIDEgKiBvbGQgc2NoZW1lDQoNCndpdGggb2xkIGFuZCBuZXcgc3dh
cHBlZCBpZiBvbGRfc2NoZW1lX2ZpcnN0IGlzIHNldC4gIEkgZG9uJ3Qga25vdy4pDQoNCkFueXdh
eSwgY2FuIHlvdSB3cml0ZSBhIHBhdGNoIHRvIGRvIHRoaXM/DQoNCkFsYW4gU3Rlcm4NCg==
