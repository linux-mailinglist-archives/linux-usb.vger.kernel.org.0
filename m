Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 674C12D52EE
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 05:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731718AbgLJEsK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 23:48:10 -0500
Received: from mail-eopbgr140073.outbound.protection.outlook.com ([40.107.14.73]:54281
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730557AbgLJEsK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Dec 2020 23:48:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqzFppXvMStOkzw5MWlHL98crmcGRuHND6zpByz3IXZx5Aux25aGLDFEhcBNOPmQmcBEG+5wAmCYlwQYvOOgcGc2UyQotq0qbZablE/4nuaJlGdBunqXLEtCen4EKRgEum3i2mn5GC8Fec/7/GL4xteDwPSZqO63YlK0g415imsyGmsyxOQi+a8gUJsUiIdfMMI2Uc7eAD4GFe8RYCE7q7jdv0+DxiO8Ccko5TK5yLwkwR4nFoE48KlwGOHeEiWDfGuyADmWZcDrx5EPfkE/rDi3bKUYTg46/Flx5EYh3HMywx9MVDNZ4rMenXXuZRUMG3Hb062XY8B+MlSrpwURjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9i9Zp8WHCERv/H4TevLk4pBhuip7KRDTX9bozL3/23w=;
 b=MEC2UWotWHhqOlWWqr7Y8xLhpWzc8TMYRnttlS3FLqcrsnwDovDjG3un2gGoO5hOOL4RQrznL59keb736KA7fH7Y2uRnLVGtBnLi4Xfvn6S9+2dQrqHDfx5znG+JuO3oJ+iCPT3XQE55U6sQOGX4TMLmzcYPuCGeZscbS2vD07PAv6yP16bUDG3WTmWf/lcw4EYkuLR7bTesjeS9ZUkl78daIyHyy1DShImsHuaW+vCPulmdpavMrtF9jO+RdCL3wnRljIx1UMv8J0vYIOCJV5k+NXiNtVozDWNV5NBJ7T3SLBGTyUrV4IA6tbsyArbLTvUgdbZGO8hQpWmFFdUptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9i9Zp8WHCERv/H4TevLk4pBhuip7KRDTX9bozL3/23w=;
 b=KSSzo9pMUryq0JEih2NHtQaRHxNmaErAb0JDKNK0mz1nwAG8WykYyHjN+kJ4uL/jymtq88XcoVVY5axgs0aVRqZ4lPtohR6mlekTgRZsRHSnztRLmgAYiRssVgMqDLegUEmGkhFDdJVI9Cfh1CgEkiiRq9HGNbI0yeltuUSr/uU=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 04:47:21 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 04:47:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Michael Sweet <msweet@msweet.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Fwd: [PATCH] Fix default q_len for usb_f_printer gadget driver
Thread-Topic: Fwd: [PATCH] Fix default q_len for usb_f_printer gadget driver
Thread-Index: AQHWrwzV9jtaofMn3Uubju/AT/ynNanv3O80gAAj6oA=
Date:   Thu, 10 Dec 2020 04:47:20 +0000
Message-ID: <20201210044651.GA2388@b29397-desktop>
References: <20201030223419.3780-1-msweet@msweet.org>
 <3EFD5A31-1794-4172-ADB6-CC2A74646D1D@msweet.org>
In-Reply-To: <3EFD5A31-1794-4172-ADB6-CC2A74646D1D@msweet.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: msweet.org; dkim=none (message not signed)
 header.d=none;msweet.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fd74f152-92c4-4314-434f-08d89cc6aded
x-ms-traffictypediagnostic: DB8PR04MB7179:
x-microsoft-antispam-prvs: <DB8PR04MB7179BC2BB2953B1C424EF4748BCB0@DB8PR04MB7179.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1dEc5dCesOfIuQPShBMN2KzWXnR8aIAOBnciB1mmgmnHh+4Qd0yLEvCkFTofhr+okzAb0kU3Mjy/B+hk+m5Nwt3RhfvHAuHzYrXdlpx/m56w4OpzQLQaw5Hw1N70p8QrGl/fvc9fYZqr7QOwv5qIcWN0PyqbNrBerx1dLQ7v3QqmMwJ9XyXalD2y7WJqugAQlwYqUd0Uw0f5NF4y3Ro/VHdzq3VKPzkTDiHjoR3zhOUKaAI7UkyI6DZEK1JergEz7QcVAymWfD16ZzFY4xNwOe290zcDoi24rnSCm2WteYjgWrqtIc31M/rAtJ3j+YOMR19K4jGh2v+p5E3uDBjncg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(86362001)(91956017)(66946007)(316002)(8676002)(478600001)(2906002)(33716001)(8936002)(5660300002)(66556008)(66476007)(64756008)(26005)(66446008)(33656002)(6486002)(71200400001)(6506007)(4326008)(44832011)(1076003)(76116006)(186003)(9686003)(83380400001)(6512007)(110136005)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?AsVuS/Jd8POzrtCGRCWmlyDCchFgZ/Z5jfNW3iJg7oSlq7pu6dpvBP8ZI+o0?=
 =?us-ascii?Q?nz3sSdrIPaOZ+dZpyxYWP6B/BeSYtP/rECtY0i3cz2HiUf5uJ5IHFjhvdIry?=
 =?us-ascii?Q?39O9IDo6HaA8xdjlM/T8PzaMtu3MSuPQzOtgOyM//dqxyedI5xRfWaB0hEKx?=
 =?us-ascii?Q?yFv8LYVG4VG8OQI4GtFQUgBRR3dBwg4SMEWt0unSUe90Xj0A2tcxPgpQ7PPs?=
 =?us-ascii?Q?mfR86gqroKFW69oD96lFWqUSw5JvLy4eBOhIivmU4l1i3+HwI/fnvMuC5rzX?=
 =?us-ascii?Q?7ubElWudShYp3UADxWUgMQ3k/4GiPtMnfHZ57wiwa3r1Ra6t+quR+ocQtOLl?=
 =?us-ascii?Q?rh+lVu2T/d/vNaEf9GdNkR3c3k0uTM+NCZ7HhR0Nkv9T+7Ws1Jx+BMJIC4sJ?=
 =?us-ascii?Q?SVEmYvKCuRZ5wpFZKUK+Ae2OxLvnPBxOiBc9rzQyR9kgPAwD9KdnJbXiibAe?=
 =?us-ascii?Q?xofNp/k40IQ6mz6dilvK9eO3QSbRAuL8YjQFDy5ug+dwg5ht/C90D18jSlRF?=
 =?us-ascii?Q?jMVu68WH/7+rxJd417TYGfUhFCJo0JgL/K7PUMwxz+QmN6loNSAmuorXrENi?=
 =?us-ascii?Q?sUh9BH3segbMKmvseSp+YrKbfs44U/7qyoa0aLaisemQuX4OT2z4EfSwHLlw?=
 =?us-ascii?Q?iFhf6IiDLffUtG1EwOhrq9aPAzzz28sDDdk6r9kAI0idbjDV2t4K8PN0W22v?=
 =?us-ascii?Q?seCH4CFnyZn+qMmTACQM5Tezq03bMvsGdw9ZKlacYBCBjK5B+HKoBfHj/egG?=
 =?us-ascii?Q?T5Fmf4BRC9LHIubra9I7IH+GczJhLc4wjl4PdeDZ5LYW3ArJT02z4WlBRPk4?=
 =?us-ascii?Q?7bvO54WVydOuAOx+9sKC84wJAcRfXxM3h7MlfJc+v6Lp1YMQBrLzNBzEERcY?=
 =?us-ascii?Q?sxTz4H80o838p5vETP8bP/AClimZYyKRMHl2diJ1kPZCHi/HXlZb5tCYFBHL?=
 =?us-ascii?Q?Kai5lOP39R9lnaLgiU6vMpdsbQmLmUhEBpTXAzRpoRFDjya56XKDIer00k0o?=
 =?us-ascii?Q?MCyq?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D9C94AC87D6E7D41B6D7213889294CFB@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd74f152-92c4-4314-434f-08d89cc6aded
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 04:47:20.7544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SUVORgQhqVXfBRRM7FK87edIwOYpmQagAsctpAvB+UHK5MKmqWYnOIDea4hlErt5kt0ntBHX+RmjAm9lQUIcNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-10 02:38:13, Michael Sweet wrote:
> Peter,
>=20
> I know you had signed off on this patch at the end of October, but I have=
n't seen anything happen with it since then.  As this is the first patch I'=
ve submitted, I don't know what else I need to do, if anything, to get it m=
erged into the kernel sources?
>=20

Add Greg and Felipe.

Hi Michael,=20

Yes, I added my Reviewed-by tag at the end of Oct, but I am not the
maintainer for USB Gadget, so I can't add it to my tree.

Felipe is the maintainer of USB Gadget, the accepted patch will go to
his tree, and merge into the kernel.

Peter
     =20
> Thanks!
>=20
>=20
> > Begin forwarded message:
> >=20
> > From: Michael R Sweet <msweet@msweet.org>
> > Subject: [PATCH] Fix default q_len for usb_f_printer gadget driver
> > Date: October 30, 2020 at 6:34:19 PM EDT
> > To: Felipe Balbi <balbi@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, msweet@msweet.org,=
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
> >=20
> > The usb_f_printer gadget driver uses a default q_len value of *0* which=
 prevents
> > any IO from occurring.  Moreover, once the driver is instantiated it is
> > impossible to change the q_len value.
> >=20
> > The following patch uses a default q_len value of 10 which matches the =
legacy
> > g_printer gadget driver.  This minimizes the possibility that you end u=
p with a
> > non-working printer gadget.  It is still possible to set the q_len to a
> > different value using the configfs path of the same name.
> >=20
> > Signed-off-by: Michael R Sweet <msweet@msweet.org>
> > ---
> > drivers/usb/gadget/function/f_printer.c | 5 +++++
> > 1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadg=
et/function/f_printer.c
> > index 9c7ed2539ff7..4f3161005e4f 100644
> > --- a/drivers/usb/gadget/function/f_printer.c
> > +++ b/drivers/usb/gadget/function/f_printer.c
> > @@ -50,6 +50,8 @@
> > #define GET_PORT_STATUS		1
> > #define SOFT_RESET		2
> >=20
> > +#define DEFAULT_Q_LEN		10 /* same as legacy g_printer gadget */
> > +
> > static int major, minors;
> > static struct class *usb_gadget_class;
> > static DEFINE_IDA(printer_ida);
> > @@ -1317,6 +1319,9 @@ static struct usb_function_instance *gprinter_all=
oc_inst(void)
> > 	opts->func_inst.free_func_inst =3D gprinter_free_inst;
> > 	ret =3D &opts->func_inst;
> >=20
> > +	/* Make sure q_len is initialized, otherwise the bound device can't s=
upport read/write! */
> > +	opts->q_len =3D DEFAULT_Q_LEN;
> > +
> > 	mutex_lock(&printer_ida_lock);
> >=20
> > 	if (ida_is_empty(&printer_ida)) {
> > --
> > 2.17.1
> >=20
>=20
> ________________________
> Michael Sweet
>=20
>=20
>=20



--=20

Thanks,
Peter Chen=
