Return-Path: <linux-usb+bounces-3598-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4870D801D91
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 16:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E24D01F2117F
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 15:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1111E1A595;
	Sat,  2 Dec 2023 15:50:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5894FD
	for <linux-usb@vger.kernel.org>; Sat,  2 Dec 2023 07:50:29 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-173-TUa3ohsNMV6P5MhNUEV3Fw-1; Sat, 02 Dec 2023 15:50:26 +0000
X-MC-Unique: TUa3ohsNMV6P5MhNUEV3Fw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 2 Dec
 2023 15:50:15 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 2 Dec 2023 15:50:15 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
CC: 'Mathias Nyman' <mathias.nyman@linux.intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 08/19] xhci: dbc: Use sizeof_field() where it makes sense
Thread-Topic: [PATCH 08/19] xhci: dbc: Use sizeof_field() where it makes sense
Thread-Index: AQHaJGfznirkAH2q70aZpnygD+weDLCUrt6wgAAbzgCAAVrSUA==
Date: Sat, 2 Dec 2023 15:50:15 +0000
Message-ID: <aa4848b742854ab7921386ca69613866@AcuMS.aculab.com>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
 <20231201150647.1307406-9-mathias.nyman@linux.intel.com>
 <e98fd89faf4446e594ca3b7c3cc627fc@AcuMS.aculab.com>
 <ZWovIn0V95c-T74n@smile.fi.intel.com>
In-Reply-To: <ZWovIn0V95c-T74n@smile.fi.intel.com>
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
Content-Transfer-Encoding: quoted-printable

From: Andy Shevchenko
> Sent: 01 December 2023 19:08
>=20
> On Fri, Dec 01, 2023 at 05:31:52PM +0000, David Laight wrote:
> > From: Mathias Nyman
> > > Sent: 01 December 2023 15:07
>=20
> ...
>=20
> > > -=09memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps))=
;
> > > +=09memset(dbc->eps, 0, sizeof_field(struct xhci_dbc, eps));
> >
> > Isn't that just:
> > =09memset(dpc->eps, 0, sizeof (dpc->eps));
> > perhaps better written as:
> > =09memset(&dpc->epc, 0, sizeof (dpc->eps);
>=20
> Maybe...
> You can send a patch, so it gets tested for regressions!

Any patch I write will conflict with v2 of this series.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


