Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 544E13D53EF
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 09:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbhGZGhU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 02:37:20 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:10126 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbhGZGhL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jul 2021 02:37:11 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Jul 2021 02:37:11 EDT
IronPort-SDR: IzHdrAUjo/LTGhCXH7xqE2N0lYeQBP9Vuv0LfEA7BP5NxnuCm6YArclX7JtUKrwPqqeASUmxiI
 ysiBbxN5iitmOENh6AWv81YgujT3PA+uUp9cidRqrRJImoAc9MPj6SgCfI++ZvE6wVkLUNeh0Y
 0XuJUqlYVMFnF9SI3lJa9YqPAra2xZHoHHLW6PMRtTMo4tXYl0gB21fzuUamH02G22agr0C1Wk
 hYcIECevYDYa3WCfbARTZeLYmlkJheLqmm7t0u/VLD8r8ENq3pk2pXyK1eTBuSjhRIjFHKuaEp
 Pg5BWp9UiKyAAwRma/x2S6Uq
X-IronPort-AV: E=Sophos;i="5.84,270,1620720000"; 
   d="scan'208";a="66363211"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 25 Jul 2021 23:10:33 -0800
IronPort-SDR: r5Xb0EChP151sFJZTJ30TcR3+3cZbDVjcsKNPleOYUuyO/porIa7VBM0cdlASFfVoD6vVhijs5
 MfBVXpuOrm5Oeb3cPws0EiLdNrNExD65TcAsh/VqAjXN3aZDl5gcIZmr3Dex5hy0Eex4jG9wDj
 bW8vLQ/4ZdfN09xN7EguZhItrc/g/tHZuyqvuNxyFuGqkVRph5l6pcx82EfFKu/6Ed6s1LrjkP
 fakK5jWhsGPyF50Fy6oXDEwzp+grlyLUge03bg3HwA81CR5Sb0rTgr6nWSf++UT+kwP7mIvt1U
 hRw=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     USB list <linux-usb@vger.kernel.org>
Subject: RE: Possible race in 4.14 xhci stack
Thread-Topic: Possible race in 4.14 xhci stack
Thread-Index: Add9dgXtLD9V5HWrQGOujH0Vt+GASgAA3LAAACKjYhD///gJAIAD5T2A//wLRhA=
Date:   Mon, 26 Jul 2021 07:10:09 +0000
Message-ID: <6d6b18d62ce84cd9826686061d4c8883@SVR-IES-MBX-03.mgc.mentorg.com>
References: <513f81d8c17b4bcb97a60fd1d5b0738f@SVR-IES-MBX-03.mgc.mentorg.com>
 <YPb1ngCpsEizHtUi@kroah.com>
 <2c52cd176b134e6ab7806aeda8fcca1d@SVR-IES-MBX-03.mgc.mentorg.com>
 <YPfXZBtd48oL7DaQ@kroah.com>
 <9389e25a-d9e8-e0bf-d310-6a2b0a23e990@linux.intel.com>
In-Reply-To: <9389e25a-d9e8-e0bf-d310-6a2b0a23e990@linux.intel.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWF0aGlhcywNCg0KdGhhbmtzLCB0aGF0J3MgZXhhY3RseSB0aGUgZml4L3dvcmthcm91bmQv
Y3VyZSBJIHdhbnRlZCB0byBkby4NCldpbGwgZml4IGl0IHRoaXMgd2F5IPCfmIoNCg0KSGF2ZSBh
IG5pY2UgdmFjYXRpb24uDQoNCkJlc3QgcmVnYXJkcw0KQ2Fyc3Rlbg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51eC5p
bnRlbC5jb20+DQpTZW50OiBGcmVpdGFnLCAyMy4gSnVsaSAyMDIxIDIxOjQ0DQpUbzogR3JlZyBL
SCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBTY2htaWQsIENhcnN0ZW4gPENhcnN0ZW5f
U2NobWlkQG1lbnRvci5jb20+DQpDYzogVVNCIGxpc3QgPGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5v
cmc+DQpTdWJqZWN0OiBSZTogUG9zc2libGUgcmFjZSBpbiA0LjE0IHhoY2kgc3RhY2sNCg0KT24g
MjEuNy4yMDIxIDExLjE0LCBHcmVnIEtIIHdyb3RlOg0KPiBPbiBXZWQsIEp1bCAyMSwgMjAyMSBh
dCAwNzo1MTo1OEFNICswMDAwLCBTY2htaWQsIENhcnN0ZW4gd3JvdGU6DQo+PiBIaSBHcmVnLA0K
Pj4NCj4+Pj4gSGkgTWF0aGlhcywNCj4+Pj4NCj4+Pj4gaSBnb3QgYSBOVUxMIHBvaW50ZXIgZGVy
ZWYgaW4gdGhlIHVzYmZzIGFuZCBhbmFseXplZCBpdC4NCj4+Pj4gVGhlIGNvbm5lY3RlZCBkZXZp
Y2Ugc2VlbWVkIHRvIGhhdmUgdHJvdWJsZSBvbiBVU0IgdHJhbnNtaXNzaW9ucy4NCj4+Pj4gSG93
ZXZlciwgSSBoYXZlIHRoZSBpbXByZXNzaW9uIHRoYXQgdGhlcmUgaXMgYSByYWNlIGJldHdlZW4g
ZmluaXNoaW5nIFVSQiBoYW5kbGluZyBhbmQgZGlzY29ubmVjdGlvbiBvZiBkZXZpY2VzLg0KPj4+
PiBJbiBkZXRhaWw6DQo+Pj4+IFsgNDk3OS4wMjk2NjZdIHhoY2lfaGNkIDAwMDA6MDA6MTUuMDog
VVNCIHRyYW5zZmVyIGVycm9yLiBNYXliZSB0aGUgVVNCIGNhYmxlIGlzIGJhZD8NCj4+Pg0KPj4+
IERpZCB5b3VyIGNhYmxlIGRpZT8NCj4+Pg0KPj4+IEFuZCA0LjE0IGlzIHF1aXRlIG9sZCwgd2hh
dCBhYm91dCA1LjEzPw0KPj4+DQo+Pj4gdGhhbmtzLA0KPj4+DQo+Pj4gZ3JlZyBrLWgNCj4+DQo+
PiBUaGF0IHdhcyByZXBvcnRlZCBmcm9tIGEgZGV2aWNlIGluIHRoZSBmaWVsZC4NCj4+IFllcywg
YSBkZWZlY3RpdmUgY2FibGUgaXMgYmFkLCBidXQgc2hvdWxkbid0IHRoZSBrZXJuZWwncyBoZWFs
dGggYXZvaWQgYSBOVUxMIHBvaW50ZXIgZGVyZWY/DQo+DQo+IFllcywgSSBhbSBub3QgZGlzYWdy
ZWVpbmcgYWJvdXQgdGhhdCwgcGF0Y2hlcyBhbHdheXMgd2VsY29tZSA6KQ0KDQpDdXJyZW50IGtl
cm5lbCBhbHJlYWR5IGhhcyBhIGN1cmUgZm9yIHRoZSBzeW1wdG9tLCBhdm9pZGluZyB0aGUgTlVM
TCBwb2ludGVyIGRlcmVmOg0KDQpzdHJ1Y3QgeGhjaV9yaW5nICp4aGNpX3RyaWFkX3RvX3RyYW5z
ZmVyX3JpbmcoLi4uKSB7DQpzdHJ1Y3QgeGhjaV92aXJ0X2VwICplcDsNCg0KZXAgPSB4aGNpX2dl
dF92aXJ0X2VwKHhoY2ksIHNsb3RfaWQsIGVwX2luZGV4KTsNCmlmICghZXApDQpyZXR1cm4gTlVM
TDsNCi4uLg0KfQ0KDQpJJ20gc3RpbGwgb24gdmFjYXRpb24gbmV4dCB3ZWVrLCBidXQgYWZ0ZXIg
dGhhdCB3ZSBjb3VsZCBsb29rIGNsb3NlciBhdCB0aGUgcm9vdCBjYXVzZS4NCg0KVGhhbmtzLA0K
TWF0aGlhcw0KLS0tLS0tLS0tLS0tLS0tLS0NClNpZW1lbnMgRWxlY3Ryb25pYyBEZXNpZ24gQXV0
b21hdGlvbiBHbWJIOyBBbnNjaHJpZnQ6IEFybnVsZnN0cmHDn2UgMjAxLCA4MDYzNCBNw7xuY2hl
bjsgR2VzZWxsc2NoYWZ0IG1pdCBiZXNjaHLDpG5rdGVyIEhhZnR1bmc7IEdlc2Now6RmdHNmw7xo
cmVyOiBUaG9tYXMgSGV1cnVuZywgRnJhbmsgVGjDvHJhdWY7IFNpdHogZGVyIEdlc2VsbHNjaGFm
dDogTcO8bmNoZW47IFJlZ2lzdGVyZ2VyaWNodCBNw7xuY2hlbiwgSFJCIDEwNjk1NQ0K
