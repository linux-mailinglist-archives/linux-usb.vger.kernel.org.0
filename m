Return-Path: <linux-usb+bounces-3676-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3EC8030E3
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 765D0281013
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945E2224C1;
	Mon,  4 Dec 2023 10:45:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CC2FD
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:45:40 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-50-2tcDrf3BMCapFM9xEUomfg-1; Mon, 04 Dec 2023 10:45:37 +0000
X-MC-Unique: 2tcDrf3BMCapFM9xEUomfg-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 4 Dec
 2023 10:45:19 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 4 Dec 2023 10:45:19 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mathias Nyman' <mathias.nyman@linux.intel.com>, 'Andy Shevchenko'
	<andriy.shevchenko@linux.intel.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 08/19] xhci: dbc: Use sizeof_field() where it makes sense
Thread-Topic: [PATCH 08/19] xhci: dbc: Use sizeof_field() where it makes sense
Thread-Index: AQHaJGfznirkAH2q70aZpnygD+weDLCUrt6wgAAbzgCAAVrSUIACyaWAgAAFy6A=
Date: Mon, 4 Dec 2023 10:45:19 +0000
Message-ID: <622189793620442fbc727ab0f8b35d41@AcuMS.aculab.com>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
 <20231201150647.1307406-9-mathias.nyman@linux.intel.com>
 <e98fd89faf4446e594ca3b7c3cc627fc@AcuMS.aculab.com>
 <ZWovIn0V95c-T74n@smile.fi.intel.com>
 <aa4848b742854ab7921386ca69613866@AcuMS.aculab.com>
 <e0d6698d-329a-64cb-a8e2-200dd03f3cd2@linux.intel.com>
In-Reply-To: <e0d6698d-329a-64cb-a8e2-200dd03f3cd2@linux.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
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

PiBJJ2xsIGRyb3AgdGhpcyA4LzE5IHBhdGNoIGFzIGl0J3MganVzdCBhIG9uZSBsaW5lciBjbGVh
bnVwIHRoYXQgZG9lcyBubw0KPiBoYXJtLCBidXQgYXBwYXJlbnRseSBkb2Vzbid0IHJlYWxseSBo
ZWxwIGVpdGhlci4NCj4gDQo+IERhdmlkLCBJJ2xsIGJlIGhhcHB5IHRvIHRha2UgYSBwYXRjaCBm
b3IgdGhpcyBmcm9tIHlvdSwgYnV0IHN0aWxsIG5lZWQgdG8NCj4gcnVuIGl0IHRocm91Z2ggc29t
ZSB0ZXN0aW5nDQoNCkknZCBqdXN0IHJ1biBvYmpkdW1wIHRvIGNoZWNrIHRoZSBjb25zdGFudCBp
cyB0aGUgc2FtZS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwg
QnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVn
aXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==


