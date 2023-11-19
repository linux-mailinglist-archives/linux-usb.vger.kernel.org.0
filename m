Return-Path: <linux-usb+bounces-2992-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 333CE7F0595
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 12:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E06E5280DC8
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 11:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D405BDDCE;
	Sun, 19 Nov 2023 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9308BC4
	for <linux-usb@vger.kernel.org>; Sun, 19 Nov 2023 03:09:12 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-41-k3RDlZdzNeSnhqBjtSHvAQ-1; Sun, 19 Nov 2023 11:09:09 +0000
X-MC-Unique: k3RDlZdzNeSnhqBjtSHvAQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 19 Nov
 2023 11:09:34 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 19 Nov 2023 11:09:33 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: =?utf-8?B?J0Jqw7hybiBNb3JrJw==?= <bjorn@mork.no>, Oliver Neukum
	<oneukum@suse.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, USB list
	<linux-usb@vger.kernel.org>
Subject: RE: question on random MAC in usbnet
Thread-Topic: question on random MAC in usbnet
Thread-Index: AQHaGICW0oBZ8ZOa5UK5GXRhIKgVmrCBfxaw
Date: Sun, 19 Nov 2023 11:09:33 +0000
Message-ID: <64dfec9e75a744cf8e7f50807140ba9a@AcuMS.aculab.com>
References: <53b66aee-c4ad-4aec-b59f-94649323bcd6@suse.com>
 <87zfzeexy8.fsf@miraculix.mork.no>
In-Reply-To: <87zfzeexy8.fsf@miraculix.mork.no>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogQmrDuHJuIE1vcmsNCj4gU2VudDogMTYgTm92ZW1iZXIgMjAyMyAxMTozMg0KLi4uDQo+
ID4gRG8geW91IHRoaW5rIHRoYXQgYmVoYXZpb3Igc2hvdWxkIGJlIGNoYW5nZWQgdG8gdXNpbmcN
Cj4gPiBhIHNlcGFyYXRlIHJhbmRvbSBNQUMgZm9yIGVhY2ggZGV2aWNlIHRoYXQgcmVxdWlyZXMg
aXQ/DQo+IA0KPiBJJ20gaW4gZmF2b3VyLg0KPiANCj4gSSBjb3VsZCBiZSB3cm9uZywgYnV0IEkg
ZG9uJ3QgZXhwZWN0IGFueXRoaW5nIHRvIGJyZWFrIGlmIHdlIGRpZCB0aGF0Lg0KPiBUaGUgY3Vy
cmVudCBzdGF0aWMgYWRkcmVzcyBjb21lcyBmcm9tIGV0aF9yYW5kb21fYWRkcigpIGluIGFueSBj
YXNlLCBzbw0KPiB0aGUgZW5kIHJlc3VsdCBhcyBzZWVuIGZyb20gdGhlIG1pbmkgZHJpdmVycyBz
aG91bGQgYmUgaWRlbnRpY2FsLiAgVGhlDQo+IGRpZmZlcmVuY2Ugd2lsbCBiZSBzZWVuIGluIHVz
ZXJzcGFjZSBhbmQgc3Vycm91bmRpbmcgZXF1aXBtZW50LCBBbmQNCj4gdGhvc2Ugc2hvdWxkIGJl
IGZvciB0aGUgYmV0dGVyLg0KDQpJdCBtaWdodCBjYXVzZSBncmllZiB3aGVuIGEgVVNCIGRldmlj
ZSAnYm91bmNlcycgWzFdLg0KQXQgdGhlIG1vbWVudCBpdCB3aWxsIHBpY2sgdXAgdGhlIHNhbWUg
J3JhbmRvbScgTUFDIGFkZHJlc3MuDQpCdXQgYWZ0ZXJ3YXJkcyBpdCB3aWxsIGNoYW5nZS4NCg0K
U28geW91IG1pZ2h0IHdhbnQgdG8gc2F2ZSB0aGUgTUFDIG9uIGRldmljZSByZW1vdmFsIGFuZA0K
cmUtdXNlIGl0IG9uIHRoZSBuZXh0IGluc2VydC4NCg0KWzFdIFdlIGVuZGVkIHVwIHB1dHRpbmcg
dGhlIFVTQiBpbnRlcmZhY2UgaW5zaWRlIGEgJ2JvbmQnDQppbiBvcmRlciB0byBzdG9wIHRoZSBp
bnRlcmZhY2UgZXZlcnl0aGluZyB3YXMgdXNpbmcNCnJhbmRvbWx5IGRpc2FwcGVhcmluZyBkdWUg
dG8gY29tbW9uLW1vZGUgbm9pc2Ugb24gdGhlDQpVU0IgZGF0YSBsaW5lcyBjYXVzaW5nIGEgZGlz
Y29ubmVjdC4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJh
bWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0
cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==


