Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8086A3D16B8
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 20:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhGUSRv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 14:17:51 -0400
Received: from mail02.rohde-schwarz.com ([80.246.32.97]:16055 "EHLO
        mail02.rohde-schwarz.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbhGUSRv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 14:17:51 -0400
Received: from amu316.rsint.net (10.0.26.65) by mail-emea.rohde-schwarz.com
 (172.21.64.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.858.12; Wed, 21 Jul
 2021 20:58:25 +0200
Received: from GMU418.rsint.net ([10.0.230.144])
          by amu316.rsint.net (Totemo SMTP Server) with SMTP ID 641;
          Wed, 21 Jul 2021 20:58:24 +0200 (CEST)
Received: from GMU004.rsint.net (10.0.2.27) by GMU418.rsint.net (10.0.230.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2242.10; Wed, 21 Jul
 2021 20:58:23 +0200
Received: from GMU006.rsint.net (10.0.2.28) by GMU004.rsint.net (10.0.2.27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2242.10; Wed, 21
 Jul 2021 20:58:23 +0200
Received: from GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b]) by
 GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b%12]) with mapi id
 15.01.2242.010; Wed, 21 Jul 2021 20:58:23 +0200
From:   Guido Kiener <Guido.Kiener@rohde-schwarz.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     dave penkler <dpenkler@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "qiang.zhang@windriver.com" <qiang.zhang@windriver.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        USB <linux-usb@vger.kernel.org>
Subject: RE:  Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Topic: *EXT* Re: [PATCH] USB: usbtmc: Fix RCU stall warning /ur/
Thread-Index: Add+Yh5pQwFkNSa3So2Cm2Gj3lrPdg==
Date:   Wed, 21 Jul 2021 18:58:23 +0000
Message-ID: <22e7916ff3d849e5ac72cb04dc958bb0@rohde-schwarz.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-rus_sensitivity: 10
hvs-classificationid: 8485d17c-1b45-47c0-b496-903334a11e28
hvs-prefix: R_S
x-originating-ip: [10.0.9.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-IQAV: YES
X-GBS-PROC: NbquItmNg0MgKxoWO+2k1bjHzHNht4DP2PPST2bHqieIl65eqdwnT7Wbm9LbPxb7FcpYpfPbgCumyyALOc9Rxq1YrBILP2uYs6ftP/caf9T4igjo9aZImNKvAl97LpXi
X-GBS-PROCJOB: Chkgt0xuu68svUnsgJvY5xnv0jmUHbVOpZRUvownEbms2+TsjVJfAPRkPItNz9+T
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiBPbiBXZWQsIEp1bCAyMSwgMjAyMSBhdCAwNTowODo0OFBNICswMDAwLCBHdWlkbyBLaWVuZXIg
d3JvdGU6DQo+ID4gPiA+ID4gU3ViamVjdDogKkVYVCogUmU6IFtQQVRDSF0gVVNCOiB1c2J0bWM6
IEZpeCBSQ1Ugc3RhbGwgd2FybmluZw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gV2VkLCBKdWwg
MjEsIDIwMjEgYXQgMTE6NDQ6MjNBTSArMDIwMCwgZGF2ZSBwZW5rbGVyIHdyb3RlOg0KPiA+ID4g
PiA+ID4gU29ycnksIHRoZSBpc3N1ZSB0aGlzIHBhdGNoIGlzIHRyeWluZyB0byBmaXggb2NjdXJz
IGJlY2F1c2UNCj4gPiA+ID4gPiA+IHRoZSBjdXJyZW50IHVzYnRtYyBkcml2ZXIgcmVzdWJtaXRz
IHRoZSBVUkIgd2hlbiBpdCBnZXRzIGFuIEVQUk9UTw0KPiByZXR1cm4uDQo+ID4gPiA+ID4gPiBU
aGUgZHVtbXkgdXNiIGhvc3QgY29udHJvbGxlciBkcml2ZXIgdXNlZCBpbiB0aGUgc3l6Ym90IHRl
c3RzDQo+ID4gPiA+ID4gPiBrZWVwcyByZXR1cm5pbmcgdGhlIHJlc3VibWl0dGVkIFVSQiB3aXRo
IEVQUk9UTyBjYXVzaW5nIGEgbG9vcA0KPiA+ID4gPiA+ID4gdGhhdCBzdGFydmVzIFJDVS4gV2l0
aCBhbiBhY3R1YWwgSENJIGRyaXZlciBpdCBlaXRoZXIgcmVjb3ZlcnMNCj4gPiA+ID4gPiA+IG9y
IHJldHVybnMgYW4NCj4gPiA+IEVQSVBFLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQXJlIHlvdSBz
dXJlIGFib3V0IHRoYXQ/ICBIYXZlIHlvdSBldmVyIG9ic2VydmVkIGEgdXNidG1jIGRldmljZQ0K
PiA+ID4gPiA+IHJlY292ZXJpbmcgYW5kIGNvbnRpbnVpbmcgdG8gb3BlcmF0ZSBhZnRlciBhbiBF
UFJPVE8gZXJyb3I/DQo+ID4gPiA+DQo+ID4gPiA+IEkgY2FuJ3Qgc3BlYWsgZm9yIERhdmUgYW5k
IGhpcyBpbnZlc3RpZ2F0aW9ucy4gSG93ZXZlciBhcyB5b3UNCj4gPiA+ID4gcmVtZW1iZXIgSSBk
aWQgdGVzdHMgd2l0aCBFUFJPVE8gZXJyb3JzLCBzZWUgdGhyZWFkOg0KPiA+ID4gPiBodHRwczov
L21hcmMuaW5mby8/bD1saW51eC11c2ImbT0xNjIxNjM3NzY5MzA0MjMmdz0yDQo+ID4gPiA+IElu
IHRoZSB0aHJlYWQgeW91IGNhbiBzZWUgdGhlIHJlY292ZXJpbmcuDQo+ID4gPg0KPiA+ID4gQWgg
eWVzLCBub3cgSSByZW1lbWJlci4NCj4gPiA+DQo+ID4gPiBUaGF0IG1lc3NhZ2UgZG9lc24ndCBz
aG93IHRoZSBfZGV2aWNlXyByZWNvdmVyaW5nIGFuZCBjb250aW51aW5nIHRvDQo+ID4gPiBvcGVy
YXRlLCB0aG91Z2guICBJdCBzaG93cyB0aGUgX3N5c3RlbV8gcmVjb3ZlcmluZyBhbmQgcmVhbGl6
aW5nDQo+ID4gPiB0aGF0IHRoZSBkZXZpY2UgaGFzIGJlZW4gZGlzY29ubmVjdGVkLg0KPiA+ID4N
Cj4gPiA+IFdoYXQgSSB3YXMgYXNraW5nIGFib3V0IHdhcyB3aGV0aGVyIHlvdSBrbmV3IG9mIGEg
Y2FzZSB3aGVyZSB0aGVyZQ0KPiA+ID4gd2FzIGFuIEVQUk9UTyBlcnJvciBidXQgYWZ0ZXJ3YXJk
IHRoZSB1c2J0bWMgZGV2aWNlIGNvbnRpbnVlZCB0bw0KPiA+ID4gd29yayAtLSBubyBkaXNjb25u
ZWN0aW9uLiAgQXNzdW1pbmcgc3VjaCBjYXNlcyBhcmUgdmFuaXNoaW5nbHkgcmFyZSwNCj4gPiA+
IHRoZXJlJ3Mgbm8gaGFybSBpbiBoYXZpbmcgdGhlIGRyaXZlciBnaXZlIHVwIHdoZW5ldmVyIGl0
IGVuY291bnRlcnMgRVBST1RPLg0KPiA+DQo+ID4gSSBoYXZlIG5vIGlkZWEgaG93IG9mdGVuIHRo
ZSBFUFJPVE8gZXJyb3IgY2FuIGhhcHBlbiBkdXJpbmcgbm9ybWFsIG9wZXJhdGlvbg0KPiBhbmQg
YmVsaWV2ZSB5b3UgdGhhdCBpdCdzIHZhbmlzaGluZ2x5IHJhcmUuDQo+ID4gV2hlbiBpdCBoYXBw
ZW5zLCBkb2VzIHRoZSBVU0IgaGFyZHdhcmUgcHJvdG9jb2wgYXV0b21hdGljYWxseSByZXRyYW5z
bWl0IHRoZQ0KPiBsb3N0L2ludmFsaWQgcGFja2V0Pw0KPiANCj4gV2hlbiBhIGxvdy1sZXZlbCBw
cm90b2NvbCBlcnJvciBvY2N1cnMsIHRoZSBVU0IgaG9zdCBjb250cm9sbGVyIGhhcmR3YXJlIGRv
ZXMNCj4gYXV0b21hdGljYWxseSByZXRyYW5zbWl0IHRoZSBwYWNrZXQuICBVU0IgaGFzIGEgIjMg
c3RyaWtlcyBhbmQgeW91J3JlIG91dCIgYXBwcm9hY2g6DQo+IFRoZSBlcnJvciBkb2Vzbid0IGdl
dCByZXBvcnRlZCB1bnRpbCB0aGVyZSBoYXZlIGJlZW4gdGhyZWUgZmFpbGVkIHRyYW5zbWlzc2lv
bg0KPiBhdHRlbXB0cy4NCj4gDQo+IE9uIHRoZSBvdGhlciBoYW5kLCBkdW1teS1oY2QgbmV2ZXIg
aGFzIHRoZXNlIGVycm9ycyAoZm9yIG9idmlvdXMgcmVhc29ucykgdW5sZXNzDQo+IHRoZSBmdW5j
dGlvbiBkcml2ZXIgaGFzIGJlZW4gdW5ib3VuZCwgd2hpY2ggYWx3YXlzIHJlc3VsdHMgaW4gYSBk
aXNjb25uZWN0LiAgT3IgaWYNCj4gdGhlIGhvc3Qtc2lkZSBkcml2ZXIgZG9lcyBzb21ldGhpbmcg
d3JvbmcsIGxpa2UgdHJ5aW5nIHRvIGNvbW11bmljYXRlIHdpdGggYQ0KPiBub25leGlzdGVudCBl
bmRwb2ludC4NCj4gDQo+ID4gSWYgeWVzLCB3ZSBzaG91bGQgdGhpbmsgYWJvdXQgYW4gZXJyb3Ig
Y291bnRlci4NCj4gDQo+IFdoYXQgZm9yPw0KPiANCj4gQmVzaWRlcywgdGhlIGVoY2ktaGNkIGRy
aXZlciBhbHJlYWR5IGhhcyBhIGhpZ2hlci1sZXZlbCByZXRyeSBsb29wIGZvciBsb3ctbGV2ZWwN
Cj4gcHJvdG9jb2wgZXJyb3JzLiAgSXQgbWFrZXMgYXQgbGVhc3QgMzIgYXR0ZW1wdHMgYmVmb3Jl
IGdpdmluZyB1cCBvbiBhIHRyYW5zYWN0aW9uLg0KPiANCj4gPiBJZiBub3QsIHRoZW4gd2UgcmVh
bGx5IGNhbiBzdG9wIHRoZSBJTlQgcGlwZSBhbmQgdGhlIHVzZXIgd2lsbCBkZXRlY3QgdGhhdCBz
b21ldGhpbmcNCj4gaXMgd3Jvbmcgd2hlbiByZWFkaW5nIHRoZSBzdGF0dXMuDQo+IA0KPiBPciBp
biB0aGUgbW9zdCBsaWtlbHkgY2FzZSwgdGhlIHN5c3RlbSB3aWxsIHJlYWxpemUgKGFmdGVyIGEg
ZmV3IGh1bmRyZWQNCj4gbWlsbGlzZWNvbmRzKSB0aGF0IHRoZSBkZXZpY2UgaGFzIGJlZW4gZGlz
Y29ubmVjdGVkIGFuZCB3aWxsIGNsZWFuIHVwLiAgVGhlIG9ubHkNCj4gcXVlc3Rpb24gaXMgd2hl
dGhlciB0aGUgdXNidG1jIGRyaXZlciBzaG91bGQgbWFrZSBtdWx0aXBsZSBmdXRpbGUgYXR0ZW1w
dHMgdG8gcmVzdGFydA0KPiB0aGUgdHJhbnNtaXNzaW9uIGR1cmluZyB0aG9zZSBtaWxsaXNlY29u
ZHMuICBJIHRoaW5rIGl0IHNob3VsZG4ndC4NCg0KVGhhbmsgeW91IGZvciB0aGUgY2xhcmlmaWNh
dGlvbi4gSSBkaWQgbm90IGtub3cgdGhlc2UgbG93IGxldmVsIGhhcmR3YXJlL2RyaXZlciBmYWN0
cy4NCkkgZnVsbHkgYWdyZWUgdGhhdCB3ZSBkbyBub3QgbmVlZCBhbiBleHRyYSBlcnJvciBjb3Vu
dGVyIGhlcmUuIFRoZXJlIGlzIGVub3VnaCBlcnJvciBoYW5kbGluZy4NClNvIHdlIGNhbiBzYXkg
dGhhdCB0aGUgRVBST1RPIGVycm9yIGlzIGEgZmF0YWwgZXJyb3IgYW5kIHRoZXJlIGlzIG5vIHJl
YXNvbmFibGUgY2F1c2UgdG8NCnJlc3VibWl0IHRoZSB1cmIgb3IgdG8gdHJ5IG90aGVyIHdvcmth
cm91bmRzLg0KDQpUaGFua3MuDQpHdWlkbw0K
