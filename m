Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD3C3D14DA
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 19:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhGUQ2T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 12:28:19 -0400
Received: from mail02.rohde-schwarz.com ([80.246.32.97]:13720 "EHLO
        mail02.rohde-schwarz.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhGUQ2T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 12:28:19 -0400
Received: from amu316.rsint.net (10.0.26.65) by mail-emea.rohde-schwarz.com
 (172.21.64.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.858.12; Wed, 21 Jul
 2021 19:08:50 +0200
Received: from GMU419.rsint.net ([10.0.230.184])
          by amu316.rsint.net (Totemo SMTP Server) with SMTP ID 251;
          Wed, 21 Jul 2021 19:08:50 +0200 (CEST)
Received: from GMU002.rsint.net (10.0.2.26) by GMU419.rsint.net (10.0.230.184)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2242.10; Wed, 21 Jul
 2021 19:08:49 +0200
Received: from GMU006.rsint.net (10.0.2.28) by GMU002.rsint.net (10.0.2.26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2242.10; Wed, 21
 Jul 2021 19:08:48 +0200
Received: from GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b]) by
 GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b%12]) with mapi id
 15.01.2242.010; Wed, 21 Jul 2021 19:08:48 +0200
From:   Guido Kiener <Guido.Kiener@rohde-schwarz.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     dave penkler <dpenkler@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "qiang.zhang@windriver.com" <qiang.zhang@windriver.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Topic: [PATCH] USB: usbtmc: Fix RCU stall warning /ur/
Thread-Index: Add+Us+OMNXQ8799SV+aKdp8ZJ3RwQ==
Date:   Wed, 21 Jul 2021 17:08:48 +0000
Message-ID: <312e0c8295c94e8382dfa5dd20659d13@rohde-schwarz.com>
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
X-GBS-PROC: JG0h9sNiYjtEkfUAPnTkom6l3rVm4J5kPvPLXlybtcmfw5/oaLujbvubAC0AOZWTqTXCYGjPzIzXD6LRxKutMkPe97foqQSfvULbbgiXkCGR+mBjoHLh2MXwpVU8gMD4
X-GBS-PROCJOB: 2690F85LFK0SiiSbexyKRokITI2ubg69NwY6IvpAF3z2IhsnehJaHQD692li0uyg
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiA+ID4gU3ViamVjdDogKkVYVCogUmU6IFtQQVRDSF0gVVNCOiB1c2J0bWM6IEZpeCBSQ1Ugc3Rh
bGwgd2FybmluZw0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgSnVsIDIxLCAyMDIxIGF0IDExOjQ0OjIz
QU0gKzAyMDAsIGRhdmUgcGVua2xlciB3cm90ZToNCj4gPiA+ID4gU29ycnksIHRoZSBpc3N1ZSB0
aGlzIHBhdGNoIGlzIHRyeWluZyB0byBmaXggb2NjdXJzIGJlY2F1c2UgdGhlDQo+ID4gPiA+IGN1
cnJlbnQgdXNidG1jIGRyaXZlciByZXN1Ym1pdHMgdGhlIFVSQiB3aGVuIGl0IGdldHMgYW4gRVBS
T1RPIHJldHVybi4NCj4gPiA+ID4gVGhlIGR1bW15IHVzYiBob3N0IGNvbnRyb2xsZXIgZHJpdmVy
IHVzZWQgaW4gdGhlIHN5emJvdCB0ZXN0cw0KPiA+ID4gPiBrZWVwcyByZXR1cm5pbmcgdGhlIHJl
c3VibWl0dGVkIFVSQiB3aXRoIEVQUk9UTyBjYXVzaW5nIGEgbG9vcA0KPiA+ID4gPiB0aGF0IHN0
YXJ2ZXMgUkNVLiBXaXRoIGFuIGFjdHVhbCBIQ0kgZHJpdmVyIGl0IGVpdGhlciByZWNvdmVycyBv
ciByZXR1cm5zIGFuDQo+IEVQSVBFLg0KPiA+ID4NCj4gPiA+IEFyZSB5b3Ugc3VyZSBhYm91dCB0
aGF0PyAgSGF2ZSB5b3UgZXZlciBvYnNlcnZlZCBhIHVzYnRtYyBkZXZpY2UNCj4gPiA+IHJlY292
ZXJpbmcgYW5kIGNvbnRpbnVpbmcgdG8gb3BlcmF0ZSBhZnRlciBhbiBFUFJPVE8gZXJyb3I/DQo+
ID4NCj4gPiBJIGNhbid0IHNwZWFrIGZvciBEYXZlIGFuZCBoaXMgaW52ZXN0aWdhdGlvbnMuIEhv
d2V2ZXIgYXMgeW91IHJlbWVtYmVyDQo+ID4gSSBkaWQgdGVzdHMgd2l0aCBFUFJPVE8gZXJyb3Jz
LCBzZWUgdGhyZWFkOg0KPiA+IGh0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LXVzYiZtPTE2MjE2
Mzc3NjkzMDQyMyZ3PTINCj4gPiBJbiB0aGUgdGhyZWFkIHlvdSBjYW4gc2VlIHRoZSByZWNvdmVy
aW5nLg0KPiANCj4gQWggeWVzLCBub3cgSSByZW1lbWJlci4NCj4gDQo+IFRoYXQgbWVzc2FnZSBk
b2Vzbid0IHNob3cgdGhlIF9kZXZpY2VfIHJlY292ZXJpbmcgYW5kIGNvbnRpbnVpbmcgdG8gb3Bl
cmF0ZSwNCj4gdGhvdWdoLiAgSXQgc2hvd3MgdGhlIF9zeXN0ZW1fIHJlY292ZXJpbmcgYW5kIHJl
YWxpemluZyB0aGF0IHRoZSBkZXZpY2UgaGFzIGJlZW4NCj4gZGlzY29ubmVjdGVkLg0KPiANCj4g
V2hhdCBJIHdhcyBhc2tpbmcgYWJvdXQgd2FzIHdoZXRoZXIgeW91IGtuZXcgb2YgYSBjYXNlIHdo
ZXJlIHRoZXJlIHdhcyBhbg0KPiBFUFJPVE8gZXJyb3IgYnV0IGFmdGVyd2FyZCB0aGUgdXNidG1j
IGRldmljZSBjb250aW51ZWQgdG8gd29yayAtLSBubw0KPiBkaXNjb25uZWN0aW9uLiAgQXNzdW1p
bmcgc3VjaCBjYXNlcyBhcmUgdmFuaXNoaW5nbHkgcmFyZSwgdGhlcmUncyBubyBoYXJtIGluDQo+
IGhhdmluZyB0aGUgZHJpdmVyIGdpdmUgdXAgd2hlbmV2ZXIgaXQgZW5jb3VudGVycyBFUFJPVE8u
DQoNCkkgaGF2ZSBubyBpZGVhIGhvdyBvZnRlbiB0aGUgRVBST1RPIGVycm9yIGNhbiBoYXBwZW4g
ZHVyaW5nIG5vcm1hbCBvcGVyYXRpb24gYW5kIGJlbGlldmUgeW91IHRoYXQgaXQncyB2YW5pc2hp
bmdseSByYXJlLg0KV2hlbiBpdCBoYXBwZW5zLCBkb2VzIHRoZSBVU0IgaGFyZHdhcmUgcHJvdG9j
b2wgYXV0b21hdGljYWxseSByZXRyYW5zbWl0IHRoZSBsb3N0L2ludmFsaWQgcGFja2V0Pw0KSWYg
eWVzLCB3ZSBzaG91bGQgdGhpbmsgYWJvdXQgYW4gZXJyb3IgY291bnRlci4NCklmIG5vdCwgdGhl
biB3ZSByZWFsbHkgY2FuIHN0b3AgdGhlIElOVCBwaXBlIGFuZCB0aGUgdXNlciB3aWxsIGRldGVj
dCB0aGF0IHNvbWV0aGluZyBpcyB3cm9uZyB3aGVuIHJlYWRpbmcgdGhlIHN0YXR1cy4NCg0KPiA+
IFNpbmNlIG5vIHVzZXIgYmxhbWVkIHRoZSB1c2J0bWMgZHJpdmVyIGZvciBzeXN0ZW0gbG9ja3Mg
dXAgdG8gbm93LA0KPiA+IGl0J3Mgd29ydGggdG8gdGhpbmsgYWJvdXQgd2hldGhlciB0aGUgcHJv
YmxlbSBpcyBjYXVzZWQgYnkgdGhlIGR1bW15X2hjZCBkcml2ZXIuDQo+IA0KPiBCb3RoIGRyaXZl
cnMgY29udHJpYnV0ZWQgdG8gdGhlIGxvY2t1cC4gIFRoZSBxdWVzdGlvbiBpczogV2hpY2ggZHJp
dmVyIHdhcyBkb2luZyB0aGUNCj4gd3JvbmcgdGhpbmc/ICAoT3Igd2hpY2ggd2FzIF9tb3JlXyB3
cm9uZz8pICBJIGJlbGlldmUgdGhlIHVzYnRtYyBkcml2ZXIgd2FzLg0KPiANCj4gPiBJIHN0aWxs
IGhhdmUgbm8gdGltZSBmb3IgZnVydGhlciBpbnZlc3RpZ2F0aW9ucyBhbmQgd291bGQgYWdyZWUg
dG8gdXNlDQo+ID4gdGhlIHNpbXBsZSBwYXRjaCB0byBnZXQgcmlkIG9mIHRoZSB0b3BpYyBmb3Ig
dGhlIHVzYnRtYyBkcml2ZXIuIFRoZW4gdGhlIHN5emJvdCB3aWxsDQo+IG1heWJlIGZpbmQgYW5v
dGhlciB1c2IgZHJpdmVyLg0KPiANCj4gQWdyZWVkLiAgU28gR3JlZyBzaG91bGQgZ28gYWhlYWQg
YW5kIGFwcGx5IHRoZSAkU1VCSkVDVCBwYXRjaC4NCj4gDQo+IEFsYW4gU3Rlcm4NCg==
