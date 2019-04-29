Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D31EDE5C2
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 17:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbfD2PGs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 11:06:48 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:54146 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728401AbfD2PGs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 11:06:48 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-20-_YLoGC-EPkaiEE-YMzw8LA-1; Mon, 29 Apr 2019 16:06:44 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b::d117) by AcuMS.aculab.com
 (fd9f:af1c:a25b::d117) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon,
 29 Apr 2019 16:06:43 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 29 Apr 2019 16:06:43 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Oliver Neukum' <oneukum@suse.com>,
        "gregKH@linuxfoundation.org" <gregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] UAS: fix alignment of scatter/gather segments
Thread-Topic: [PATCH] UAS: fix alignment of scatter/gather segments
Thread-Index: AQHU/oX/aPqmHe5MjEO6F2S1cXOj3qZTIbqw///yE4CAABXo0P//+UkAgAAR1ZA=
Date:   Mon, 29 Apr 2019 15:06:43 +0000
Message-ID: <ff7152940ce84722a284baf7b8566dde@AcuMS.aculab.com>
References: <20190429122026.4249-1-oneukum@suse.com>
         <f378babbf2f349e59d98a5ab99958d78@AcuMS.aculab.com>
         <1556545099.20085.14.camel@suse.com>
         <e22543f3d87b4867aefdf9c71e2ec4a2@AcuMS.aculab.com>
 <1556548362.20085.17.camel@suse.com>
In-Reply-To: <1556548362.20085.17.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: _YLoGC-EPkaiEE-YMzw8LA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RnJvbTogT2xpdmVyIE5ldWt1bQ0KPiBPbiBNbywgMjAxOS0wNC0yOSBhdCAxNDoxOSArMDAwMCwg
RGF2aWQgTGFpZ2h0IHdyb3RlOg0KPiA+IEZyb206IE9saXZlciBOZXVrdW0NCj4gPiA+IFNlbnQ6
IDI5IEFwcmlsIDIwMTkgMTQ6MzgNCj4gPiA+IE9uIE1vLCAyMDE5LTA0LTI5IGF0IDEzOjMxICsw
MDAwLCBEYXZpZCBMYWlnaHQgd3JvdGU6DQo+ID4gPiA+IEZyb206IE9saXZlciBOZXVrdW0NCj4g
PiA+ID4gPg0KPiA+ID4gPiA+ICsJICogVVNCIGhhcyB1bnVzdWFsIHNjYXR0ZXItZ2F0aGVyIHJl
cXVpcmVtZW50czogdGhlIGxlbmd0aCBvZiBlYWNoDQo+ID4gPiA+ID4gKwkgKiBzY2F0dGVybGlz
dCBlbGVtZW50IGV4Y2VwdCB0aGUgbGFzdCBtdXN0IGJlIGRpdmlzaWJsZSBieSB0aGUNCj4gPiA+
ID4gPiArCSAqIEJ1bGsgbWF4cGFja2V0IHZhbHVlLiAgRm9ydHVuYXRlbHkgdGhpcyB2YWx1ZSBp
cyBhbHdheXMgYQ0KPiA+ID4gPiA+ICsJICogcG93ZXIgb2YgMi4gIEluZm9ybSB0aGUgYmxvY2sg
bGF5ZXIgYWJvdXQgdGhpcyByZXF1aXJlbWVudC4NCj4gPiA+ID4gPiArCSAqLw0KPiA+ID4gPg0K
PiA+ID4gPiBUaGF0IGlzbid0IHRoZSBjb3JyZWN0IHJlc3RyaWN0aW9uIGZvciBYSENJLg0KPiA+
ID4gPiBJdCBoYXMgaXRzIG93biBwZXJ2ZXJzZSByZXN0cmljdGlvbnMuDQo+ID4gPiA+IEkgdGhp
bmsgdGhleSBhcmUgYWxsIGhhbmRsZWQgd2l0aGluIHRoZSB4aGNpIGRyaXZlci4NCj4gPiA+DQo+
ID4gPiBZZXMsIGJ1dCB0aGF0IGRvZXMgbm90IG1hdHRlci4gWW91IGp1c3QgY2Fubm90IGFzc3Vt
ZSB0aGF0IG9ubHkNCj4gPiA+IFhIQ0kgd2lsbCBiZSB1c2VkIHdpdGggVUFTLiBJbiBwYXJ0aWN1
bGFyIHZpcnR1YWwgZHJpdmVycyB3aWxsDQo+ID4gPiBiZSB1c2VkLg0KPiA+DQo+ID4gVHJ1ZSwg
YnV0IHRoZXJlIGlzIG5vIG5lZWQgdG8gZW5mb3JjZSBhIDJrIChJSVJDKSBhbGlnbm1lbnQgZm9y
IFhIQ0kuDQo+ID4gUGVyaGFwcyB5b3UgbmVlZCBhIGRpZmZlcmVudCBwcm9wZXJ0eSBmcm9tIHRo
ZSBjb250cm9sbGVyLg0KPiANCj4gQUZBSUNUIGNvbnRyb2xsZXJzIGRvIG5vdCBleHBvcnQgdGhh
dCBwcm9wZXJ0eS4NCg0KUGVyaGFwcyB0aGV5IG5lZWQgdG8gLi4uLg0KDQo+ID4gRXZlbiBpZiB5
b3UgZGVjaWRlIHRoZSBjb2RlIGlzICdnb29kIGVub3VnaCcgKEkgZG9uJ3Qga25vdyB3aGF0IHRo
ZQ0KPiA+IGNvc3QgaXMgb2YgZW5mb3JjaW5nIGEgMmsgYWxpZ25tZW50IGluc3RlYWQgb2YgNTEy
IGJ5dGVzKQ0KPiA+IHRoZSBjb21tZW50IGlzIGp1c3QgcGxhaW4gd3JvbmcuDQo+IA0KPiBVc3Vh
bGx5IGJsb2NrIElPIHdpbGwgYmUgcGFnZXMuIFRoZXkgYXJlIDRLIGFsaWduZWQuDQo+IEluIHRl
cm1zIG9mIHBlcmZvcm1hbmNlIHRoaXMgY29kZSBpcyB1bmxpa2VseSB0byBtYXR0ZXIuDQoNClBy
ZXN1bWFibHkgdGhlcmUgYXJlIHNvbWUgY2FzZXMgd2hlcmUgdGhlIGJ1ZmZlciBpc24ndCA0ayBh
bGlnbmVkLg0KSSdtIGd1ZXNzaW5nIHRoaW5ncyBsaWtlICdkZCcgb2YgcmF3IGRpc2tzPw0KDQpJ
ZiB0aGUgYnVmZmVyIGhhcyB0aGUgd3JvbmcgYWxpZ25tZW50IHRoZW4gSSBwcmVzdW1lIGEgYm91
bmNlIGJ1ZmZlcg0KaGFzIHRvIGJlIGFsbG9jYXRlZD8NClRoZSBVU0IgY29udHJvbGxlciBkcml2
ZXJzIGFyZSBsaWtlbHkgdG8gbmVlZCB0byBiZSBhYmxlIHRvIGRvIHRoYXQNCmFueXdheSBiZWNh
dXNlIGJ1ZmZlcnMgZnJvbSB0aGUgbmV0d29yayBzdGFjayBjYW4gaGF2ZSBhbG1vc3QNCmFyYml0
cmFyeSBhbGlnbm1lbnQgKEkgcmVtZW1iZXIgdGhhdCBjb2RlIGJlaW5nIGhvcnJpZCwgSSBkb24n
dA0KcmVtZW1iZXIgYSBkYXRhIGNvcHkgaW4gdGhlIFRYIHBhdGgpLg0KDQo+IEJ1dCBpdCBpcyBu
ZWVkZWQgZm9yIGNvcnJlY3RuZXNzLg0KDQpJZiB5b3UgYXJlIGRvaW5nIGl0IGZvciAnY29ycmVj
dG5lc3MnIHRoZW4geW91IG5lZWQgdGhlIGNvcnJlY3Qgc2l6ZS4NCklmIHlvdSBhcmUgZG9pbmcg
aXQgYmVjYXVzZSB5b3UndmUgc2VlbiB0b28gc21hbGwgYW4gYWxpZ25tZW50IHlvdQ0Kc2hvdWxk
IGJlIG1lbnRpb25pbmcgdGhlIGZhaWxpbmcgc3lzdGVtLg0KDQo+IFdoYXQgd291bGQgeW91IHdh
bnQgZm9yIHRoZSBjb21tZW50Pw0KDQpZb3UgbmVlZCB0byBiZSBtb3JlIHNwZWNpZmljIGFib3V0
IHRoZSBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzIHRoYW4NCnRoZSBvbGQgY29tbWVudCwgbm90IGZh
ciBsZXNzIHNwZWNpZmljLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2Vz
aWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVL
DQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

