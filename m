Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60EA2E487
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 16:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbfD2OTW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 10:19:22 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:45541 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728258AbfD2OTV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 10:19:21 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-79-MmxWJDpiMVGYbWVZm4E3vQ-1; Mon, 29 Apr 2019 15:19:19 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 29 Apr 2019 15:19:17 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 29 Apr 2019 15:19:17 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Oliver Neukum' <oneukum@suse.com>,
        "gregKH@linuxfoundation.org" <gregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] UAS: fix alignment of scatter/gather segments
Thread-Topic: [PATCH] UAS: fix alignment of scatter/gather segments
Thread-Index: AQHU/oX/aPqmHe5MjEO6F2S1cXOj3qZTIbqw///yE4CAABXo0A==
Date:   Mon, 29 Apr 2019 14:19:17 +0000
Message-ID: <e22543f3d87b4867aefdf9c71e2ec4a2@AcuMS.aculab.com>
References: <20190429122026.4249-1-oneukum@suse.com>
         <f378babbf2f349e59d98a5ab99958d78@AcuMS.aculab.com>
 <1556545099.20085.14.camel@suse.com>
In-Reply-To: <1556545099.20085.14.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: MmxWJDpiMVGYbWVZm4E3vQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RnJvbTogT2xpdmVyIE5ldWt1bQ0KPiBTZW50OiAyOSBBcHJpbCAyMDE5IDE0OjM4DQo+IE9uIE1v
LCAyMDE5LTA0LTI5IGF0IDEzOjMxICswMDAwLCBEYXZpZCBMYWlnaHQgd3JvdGU6DQo+ID4gRnJv
bTogT2xpdmVyIE5ldWt1bQ0KPiA+ID4NCj4gPiA+ICsJICogVVNCIGhhcyB1bnVzdWFsIHNjYXR0
ZXItZ2F0aGVyIHJlcXVpcmVtZW50czogdGhlIGxlbmd0aCBvZiBlYWNoDQo+ID4gPiArCSAqIHNj
YXR0ZXJsaXN0IGVsZW1lbnQgZXhjZXB0IHRoZSBsYXN0IG11c3QgYmUgZGl2aXNpYmxlIGJ5IHRo
ZQ0KPiA+ID4gKwkgKiBCdWxrIG1heHBhY2tldCB2YWx1ZS4gIEZvcnR1bmF0ZWx5IHRoaXMgdmFs
dWUgaXMgYWx3YXlzIGENCj4gPiA+ICsJICogcG93ZXIgb2YgMi4gIEluZm9ybSB0aGUgYmxvY2sg
bGF5ZXIgYWJvdXQgdGhpcyByZXF1aXJlbWVudC4NCj4gPiA+ICsJICovDQo+ID4NCj4gPiBUaGF0
IGlzbid0IHRoZSBjb3JyZWN0IHJlc3RyaWN0aW9uIGZvciBYSENJLg0KPiA+IEl0IGhhcyBpdHMg
b3duIHBlcnZlcnNlIHJlc3RyaWN0aW9ucy4NCj4gPiBJIHRoaW5rIHRoZXkgYXJlIGFsbCBoYW5k
bGVkIHdpdGhpbiB0aGUgeGhjaSBkcml2ZXIuDQo+IA0KPiBZZXMsIGJ1dCB0aGF0IGRvZXMgbm90
IG1hdHRlci4gWW91IGp1c3QgY2Fubm90IGFzc3VtZSB0aGF0IG9ubHkNCj4gWEhDSSB3aWxsIGJl
IHVzZWQgd2l0aCBVQVMuIEluIHBhcnRpY3VsYXIgdmlydHVhbCBkcml2ZXJzIHdpbGwNCj4gYmUg
dXNlZC4NCg0KVHJ1ZSwgYnV0IHRoZXJlIGlzIG5vIG5lZWQgdG8gZW5mb3JjZSBhIDJrIChJSVJD
KSBhbGlnbm1lbnQgZm9yIFhIQ0kuDQpQZXJoYXBzIHlvdSBuZWVkIGEgZGlmZmVyZW50IHByb3Bl
cnR5IGZyb20gdGhlIGNvbnRyb2xsZXIuDQoNCkV2ZW4gaWYgeW91IGRlY2lkZSB0aGUgY29kZSBp
cyAnZ29vZCBlbm91Z2gnIChJIGRvbid0IGtub3cgd2hhdCB0aGUNCmNvc3QgaXMgb2YgZW5mb3Jj
aW5nIGEgMmsgYWxpZ25tZW50IGluc3RlYWQgb2YgNTEyIGJ5dGVzKQ0KdGhlIGNvbW1lbnQgaXMg
anVzdCBwbGFpbiB3cm9uZy4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtl
c2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBV
Sw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

