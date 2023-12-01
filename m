Return-Path: <linux-usb+bounces-3574-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F338011C1
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 18:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 127D8280C70
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 17:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B34A4E1D6;
	Fri,  1 Dec 2023 17:32:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32D1131
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 09:32:09 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-52-E9OJgobLNGGGloQH9QNw4Q-1; Fri, 01 Dec 2023 17:32:00 +0000
X-MC-Unique: E9OJgobLNGGGloQH9QNw4Q-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 1 Dec
 2023 17:31:53 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 1 Dec 2023 17:31:52 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mathias Nyman' <mathias.nyman@linux.intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH 08/19] xhci: dbc: Use sizeof_field() where it makes sense
Thread-Topic: [PATCH 08/19] xhci: dbc: Use sizeof_field() where it makes sense
Thread-Index: AQHaJGfznirkAH2q70aZpnygD+weDLCUrt6w
Date: Fri, 1 Dec 2023 17:31:52 +0000
Message-ID: <e98fd89faf4446e594ca3b7c3cc627fc@AcuMS.aculab.com>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
 <20231201150647.1307406-9-mathias.nyman@linux.intel.com>
In-Reply-To: <20231201150647.1307406-9-mathias.nyman@linux.intel.com>
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

From: Mathias Nyman
> Sent: 01 December 2023 15:07
>=20
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> Instead of doing custom calculations, use sizeof_field() macro.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci-dbgcap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgca=
p.c
> index 779a564ad698..0c9fd61e9c5b 100644
> --- a/drivers/usb/host/xhci-dbgcap.c
> +++ b/drivers/usb/host/xhci-dbgcap.c
> @@ -374,7 +374,7 @@ static void xhci_dbc_eps_init(struct xhci_dbc *dbc)
>=20
>  static void xhci_dbc_eps_exit(struct xhci_dbc *dbc)
>  {
> -=09memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps));
> +=09memset(dbc->eps, 0, sizeof_field(struct xhci_dbc, eps));

Isn't that just:
=09memset(dpc->eps, 0, sizeof (dpc->eps));
perhaps better written as:
=09memset(&dpc->epc, 0, sizeof (dpc->eps);

Otherwise the existing code wouldn't make sense at all.

=09David

>  }
>=20
>  static int dbc_erst_alloc(struct device *dev, struct xhci_ring *evt_ring=
,
> --
> 2.25.1
>=20

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


