Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9511A3D1241
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 17:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239761AbhGUOns (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 10:43:48 -0400
Received: from mail02.rohde-schwarz.com ([80.246.32.97]:10737 "EHLO
        mail02.rohde-schwarz.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237983AbhGUOnr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 10:43:47 -0400
Received: from amu316.rsint.net (10.0.26.65) by mail-emea.rohde-schwarz.com
 (172.21.64.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.858.12; Wed, 21 Jul
 2021 17:24:16 +0200
Received: from GMU418.rsint.net ([10.0.230.144])
          by amu316.rsint.net (Totemo SMTP Server) with SMTP ID 537;
          Wed, 21 Jul 2021 17:24:16 +0200 (CEST)
Received: from GMU001.rsint.net (10.0.2.59) by GMU418.rsint.net (10.0.230.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2242.10; Wed, 21 Jul
 2021 17:24:14 +0200
Received: from GMU006.rsint.net (10.0.2.28) by GMU001.rsint.net (10.0.2.59)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2242.10; Wed, 21
 Jul 2021 17:24:13 +0200
Received: from GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b]) by
 GMU006.rsint.net ([fe80::81e7:6ea1:2437:698b%12]) with mapi id
 15.01.2242.010; Wed, 21 Jul 2021 17:24:13 +0200
From:   Guido Kiener <Guido.Kiener@rohde-schwarz.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        dave penkler <dpenkler@gmail.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "qiang.zhang@windriver.com" <qiang.zhang@windriver.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Thread-Topic: [PATCH] USB: usbtmc: Fix RCU stall warning /ur/
Thread-Index: Add+RDOqMNXQ8799SV+aKdp8ZJ3RwQ==
Date:   Wed, 21 Jul 2021 15:24:13 +0000
Message-ID: <3bef7f032d2142ddac469eef8aee0d49@rohde-schwarz.com>
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
X-GBS-PROC: Lur79JjuH1xMgB+1ZuDqMWMWRP+bxEecAnaLNKh3axR/bYKo2OMR+3vfrLTLVt5hpQqvXIxKVs+6CEOQgKcIVYDg1Cw7vbR/jrS+krStV/SZeaCv1bDn7kLOjZPVRcHJ
X-GBS-PROCJOB: GfwFfz39fcEVq4EidOW3de9WieyT2bfXaZ62IqSXWfU6yj5KWInoaX8P5tteKzeu
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGFuIFN0ZXJuIDxzdGVybkBy
b3dsYW5kLmhhcnZhcmQuZWR1Pg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjEsIDIwMjEgNDoy
MiBQTQ0KPiBUbzogZGF2ZSBwZW5rbGVyIDxkcGVua2xlckBnbWFpbC5jb20+DQo+IENjOiBHcmVn
IEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IHFpYW5nLnpoYW5nQHdpbmRyaXZlci5j
b207IERtaXRyeQ0KPiBWeXVrb3YgPGR2eXVrb3ZAZ29vZ2xlLmNvbT47IHBhdWxtY2tAa2VybmVs
Lm9yZzsgS2llbmVyIEd1aWRvIDE0RFMxDQo+IDxHdWlkby5LaWVuZXJAcm9oZGUtc2Nod2Fyei5j
b20+OyBVU0IgPGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6ICpFWFQqIFJl
OiBbUEFUQ0hdIFVTQjogdXNidG1jOiBGaXggUkNVIHN0YWxsIHdhcm5pbmcNCj4gDQo+IE9uIFdl
ZCwgSnVsIDIxLCAyMDIxIGF0IDExOjQ0OjIzQU0gKzAyMDAsIGRhdmUgcGVua2xlciB3cm90ZToN
Cj4gPiBTb3JyeSwgdGhlIGlzc3VlIHRoaXMgcGF0Y2ggaXMgdHJ5aW5nIHRvIGZpeCBvY2N1cnMg
YmVjYXVzZSB0aGUNCj4gPiBjdXJyZW50IHVzYnRtYyBkcml2ZXIgcmVzdWJtaXRzIHRoZSBVUkIg
d2hlbiBpdCBnZXRzIGFuIEVQUk9UTyByZXR1cm4uDQo+ID4gVGhlIGR1bW15IHVzYiBob3N0IGNv
bnRyb2xsZXIgZHJpdmVyIHVzZWQgaW4gdGhlIHN5emJvdCB0ZXN0cyBrZWVwcw0KPiA+IHJldHVy
bmluZyB0aGUgcmVzdWJtaXR0ZWQgVVJCIHdpdGggRVBST1RPIGNhdXNpbmcgYSBsb29wIHRoYXQg
c3RhcnZlcw0KPiA+IFJDVS4gV2l0aCBhbiBhY3R1YWwgSENJIGRyaXZlciBpdCBlaXRoZXIgcmVj
b3ZlcnMgb3IgcmV0dXJucyBhbiBFUElQRS4NCj4gDQo+IEFyZSB5b3Ugc3VyZSBhYm91dCB0aGF0
PyAgSGF2ZSB5b3UgZXZlciBvYnNlcnZlZCBhIHVzYnRtYyBkZXZpY2UgcmVjb3ZlcmluZyBhbmQN
Cj4gY29udGludWluZyB0byBvcGVyYXRlIGFmdGVyIGFuIEVQUk9UTyBlcnJvcj8NCg0KSSBjYW4n
dCBzcGVhayBmb3IgRGF2ZSBhbmQgaGlzIGludmVzdGlnYXRpb25zLiBIb3dldmVyIGFzIHlvdSBy
ZW1lbWJlciBJIGRpZCB0ZXN0cyB3aXRoDQpFUFJPVE8gZXJyb3JzLCBzZWUgdGhyZWFkOiBodHRw
czovL21hcmMuaW5mby8/bD1saW51eC11c2ImbT0xNjIxNjM3NzY5MzA0MjMmdz0yDQpJbiB0aGUg
dGhyZWFkIHlvdSBjYW4gc2VlIHRoZSByZWNvdmVyaW5nLg0KU2luY2Ugbm8gdXNlciBibGFtZWQg
dGhlIHVzYnRtYyBkcml2ZXIgZm9yIHN5c3RlbSBsb2NrcyB1cCB0byBub3csIGl0J3Mgd29ydGgg
dG8gdGhpbmsgYWJvdXQNCndoZXRoZXIgdGhlIHByb2JsZW0gaXMgY2F1c2VkIGJ5IHRoZSBkdW1t
eV9oY2QgZHJpdmVyLg0KSSBzdGlsbCBoYXZlIG5vIHRpbWUgZm9yIGZ1cnRoZXIgaW52ZXN0aWdh
dGlvbnMgYW5kIHdvdWxkIGFncmVlIHRvIHVzZSB0aGUgc2ltcGxlIHBhdGNoDQp0byBnZXQgcmlk
IG9mIHRoZSB0b3BpYyBmb3IgdGhlIHVzYnRtYyBkcml2ZXIuIFRoZW4gdGhlIHN5emJvdCB3aWxs
IG1heWJlIGZpbmQgYW5vdGhlciB1c2IgZHJpdmVyLg0KDQotR3VpZG8NCg0KPiBBbiBFUElQRSBl
cnJvciBhbHNvIHNlZW1zIHJhdGhlciB1bmxpa2VseSAtLSBwYXJ0aWN1bGFybHkgaWYgdGhlIGRl
dmljZSBpcyBub3QgcGx1Z2dlZA0KPiBpbnRvIGEgaGlnaC1zcGVlZCBodWIuDQo+IA0KPiBBbGFu
IFN0ZXJuDQo+IA0KPiA+IEluIGVpdGhlciBjYXNlIG5vIGxvb3Agb2NjdXJzLiBTbyBmb3IgbXkg
cGFydCBhcyBhIHVzZXIgYW5kIG1haW50YWluZXINCj4gPiB0aGlzIHBhdGNoIGlzIG5vdCBvay4N
Cg==
