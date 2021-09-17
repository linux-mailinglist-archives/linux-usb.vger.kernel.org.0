Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25BE440F512
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 11:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245741AbhIQJqR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 05:46:17 -0400
Received: from mail-bn8nam12on2066.outbound.protection.outlook.com ([40.107.237.66]:27840
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343627AbhIQJqJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Sep 2021 05:46:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clifsyabEu8Wz8nTgAunTXghzRJmQlu9ef41OsxqS5sudjEyGWe73MFBbmhxbs6LQZR8s0MAe7u+CXKLvgXUQiZhPVYsKtcis1cxH7LqX25h8YVl7JPmW197lKWgFoccEwlEvKQkoh8lKS0Un+ycaqDSBImZwX7arfQ2VqwXoW4zyv/TrO92puBDT0/dw/PnuBxScGY5jq9c19E2I4WJEebQVQ9E7a9qUN/XR6IewLPbnwwtl3EYyLjQ+/ro4mh76N4fPS7er6JdUQgLCvgAb+kAeMICfhWOcwQhTSkiAkjv3bj4FuZLfJ0bGRTpZK7KLS0ZvIMPL9K2XUhy1IvMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mFAXCepD2LV98Omczsjrb8/nJTdo4Lo/IC5zmiqs/pY=;
 b=LRTtzPS2yQQJyNG9p5RUHZdjZLdQbxKNacioHsOVuVdGfzoJgzxc6YmoFDc3ayxH76O/oP11MpMas/91Pw415jnuG7/RkytnRFZdnm/HxcMRAF6XHb1DFMbp/UaQSpNoLNYVUAc4KBdgN6RqB/6WC5VH5aBSmXOzMW9AUBdBDpE/1FCm6z8Y5Jsb1NaUDelRzt5wOnRwJE53L6j/SIBVwWA7MYkJR3bq2KyGoEskIqM0AwzfxdyWDMTxRPjSMc2ClT17A084dnRZaHQa1fz/yf7tKMupipqZvSqfGRO/+50Ag+Ee1svfQvs5onXZj5qg/Jm6gevkleFrIP4xeKfpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFAXCepD2LV98Omczsjrb8/nJTdo4Lo/IC5zmiqs/pY=;
 b=CPORDOj5Sj1UK9hLlty0J9WMYWMACqFEHppHOfmoV4Q/Zmxk3R7yu2bOsnHmRc/1g2KMvMrm7vWOx/HCfYTOFjEK7uu6fKA1Xe85QzXQ1S3/Q5A6O3CquGxfF3vTQ9hIJSWOLRfC/AnotFbZDwcht0tBvuKbGjtquPFDxKecmYc=
Received: from MN2PR02MB6640.namprd02.prod.outlook.com (2603:10b6:208:1d0::19)
 by MN2PR02MB6703.namprd02.prod.outlook.com (2603:10b6:208:1d2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 09:44:45 +0000
Received: from MN2PR02MB6640.namprd02.prod.outlook.com
 ([fe80::b962:faa4:2367:510c]) by MN2PR02MB6640.namprd02.prod.outlook.com
 ([fe80::b962:faa4:2367:510c%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 09:44:45 +0000
From:   Shubhrajyoti Datta <shubhraj@xilinx.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Michal Simek <michals@xilinx.com>, git <git@xilinx.com>
Subject: RE: [PATCH] usb: gadget: udc-xilinx: Add clock support
Thread-Topic: [PATCH] usb: gadget: udc-xilinx: Add clock support
Thread-Index: AQHXlBYTqezeot3eYU+LLL8NJz4A26t5BcMAgC8hvcA=
Date:   Fri, 17 Sep 2021 09:44:44 +0000
Message-ID: <MN2PR02MB66409E4F304BE48BBB76A2D0AADD9@MN2PR02MB6640.namprd02.prod.outlook.com>
References: <20210818094726.3295093-1-shubhrajyoti.datta@xilinx.com>
 <87v943f57a.fsf@kernel.org>
In-Reply-To: <87v943f57a.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbec54fb-5703-472f-2400-08d979bfc7f9
x-ms-traffictypediagnostic: MN2PR02MB6703:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR02MB6703FE85C70F43C49A03492AAADD9@MN2PR02MB6703.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Mv1FBsJkAx7mk3HKtKkngZqVOpIv8jxpl9HrbHMWXMCpDbLIMBUuTbBEXg5YClYmA/6rk59HXedQJ0mR4c/UA3u4kvSX5jaS2JwXCg48aA1IHNMIrFnmDsX6AI0NotslUo6zZgWd060xdRaEnuKJgVoIxBv1m0SO8p3LQqL7O8oxuwuAw7Mdf6fUu8dk/nZUHxWbnziO+FGs5FluhW1Z4cSrolI+fb0u51NWdVALr6iRnYFkh+BF89k85Sclov+VcrALypXcljiyeyLaFWo/DDC15PM3XjE9zQ9WWlxbpJX0UTmFmLE2ugGh1PSPI7QDDFHcMC6nqvcYq5OM3rXPN6HHBlG3Thyn9bKFOfvgY3rlGylSegFER5QdgitK0vIRFsRqdXSCOhlHmbCryp1NUpzzgZN9CYzJeIdNsud4m7TVi4oTpd1v+THq7fIbGrJhR17XI2iWsQwBD+WM452XIbNfoqQfpjo6sm9qaOmEJdTz+EzbZQhTvtt0QMpTWChtsa3Q3kxf1gTJKCHGU4OehUspvFS1Bz65CUehnzNafVvXju/I7KtzJg/402UxQSOTUDJca6MayYYOaWTdxK9Vsxz43IXCKi5qsSh6knjbHiS0bQGXymMyieieIBPBo7mIiXRjyN+PAk89rmgHvETYmY6rTpFUYPdp5tGYTj8U59DAZiBlsXsBAB61v45+79KBPuhxb6oPkS7goZgiBANqg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR02MB6640.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(71200400001)(122000001)(7696005)(9686003)(38100700002)(5660300002)(478600001)(8676002)(64756008)(66946007)(66446008)(66556008)(76116006)(66476007)(316002)(4326008)(55016002)(8936002)(2906002)(6916009)(38070700005)(54906003)(33656002)(86362001)(52536014)(6506007)(53546011)(83380400001)(186003)(107886003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G7IcSwB7A5eODb5EgZxxCQIyJcjbuG3eBRyPmFXldKwJJ5l+lLiKi2AdGkHV?=
 =?us-ascii?Q?CkmqNR4lgBnWIMHjJt/aOB2s3kbDRWfMXHgGxXpiR7PvWHSinBg5R7pHABx2?=
 =?us-ascii?Q?76dqtdJLLH+1xXRDWfBqnrzVthvhAMzCSd/0/VWikeHwMz2vAqHzsw+40+hI?=
 =?us-ascii?Q?5lqsEws+F4PO5kgoBBSdeYXTr1zHQq2OSTvrleu+RXzCT+iFlM7uZAJOOxiW?=
 =?us-ascii?Q?SEZKLzrB9cCZnZiLx+z0m8/clWGzGHqdyxneb0UclR1wfE7KzBIANEyaC78G?=
 =?us-ascii?Q?wgiHJ7L9sKKkw/8mDtAzPWgxcp7it1D4J7VVU1MN4c1/yDfEQmAfZA/8mhCO?=
 =?us-ascii?Q?d1Gj9/uXetKvAkCv0qrladZ3wPifTLnTPbGzAraiBQHzNUalF4+mWn6kOtS8?=
 =?us-ascii?Q?W0V00bq8fBZuSBEI+b/cGdGmfUAnWgWBVrhAOFowe12ljZFdrbY6ZwpR9c33?=
 =?us-ascii?Q?xwu0kMdifplnERDM5yY7+zpF7Ulw0mKyoHQ05NwnSUN/sG7zdWZWFDjFPNU/?=
 =?us-ascii?Q?wLuuichh4yKeKc0Lh4U2kZi1ih2GklM+u5fZsQtbTTJM+QFSlCC1YyTBg9ti?=
 =?us-ascii?Q?KaAN71sSyLH4u6AKzwml68pEhBoBqRLZnBRlufE+NzOOZBES0nUWjyfHdxJ9?=
 =?us-ascii?Q?Q+qkODFTfsU0FjGbHMOD8Kz8/lwl5tp94u+/csCJvJWPrToeU5CFZR+KewoN?=
 =?us-ascii?Q?FNLtUZb+gLvG/9LUyqvBcijPcPhT4J39c5P0ydTqc6DMhMZjYcMyvyknMEuc?=
 =?us-ascii?Q?UEU3WCaVqKif/yVnBs8eHn8eQ+aw/7YlvshwlhvnGyn1G2UP/bxd3hZhMWo1?=
 =?us-ascii?Q?eNRT3aXmuYz078mHsWflg4hdBNjh+dqXg3xwQJD8BgPNsAng0ynhqA6xH+7o?=
 =?us-ascii?Q?gTTS9A7ebyk4iNJF90Gdfz0G4BiyhCUmeIUv79evw2gfNtJ5cpf+u/PYbSn4?=
 =?us-ascii?Q?w0Kgl/JIeZKKKrCJ6MG1j24DZAavcHxCCZ+g6A+y7IREE+nzbnDtFoGaV2Pe?=
 =?us-ascii?Q?CaacLS+1db+tyH/e3Va9+4dFbR7358ifTTgN3sf0K7KyI1oiQ3WDdacjxHbb?=
 =?us-ascii?Q?VIdPl03A0tEMWsWtHlWpd6T795p+nC6rXtUdBqly9CTbJ0hfYac7NMPQdISU?=
 =?us-ascii?Q?F9jl7o8UXM9N2Nffu+OVVqWebCrBpjXGL1jEpe+/kOno+WLxODP+zcAlgnbM?=
 =?us-ascii?Q?bzrMxZ3yhC20M3WAfpqKECkjv/gzcKkivGiMM4JalABnJqJmUVnrz/PU2RFX?=
 =?us-ascii?Q?C2+z7t75tGV9p6YnC6Yv8MgKoaiI1QLGV6bg4Ei+RXOCAMOm4+oZjwfbwxlM?=
 =?us-ascii?Q?UPsEuO2gggKaz9/p1p+UlI3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB6640.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbec54fb-5703-472f-2400-08d979bfc7f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2021 09:44:44.9079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jjRXG2Nw2Eg1tZgqHJVfNJVR1DHEzmj9i5pq55w0HrUsVEFUbWmSJd37ja5Om0XV8DgOX4huIKyzYSCqZKrybQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6703
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Felipe Balbi <balbi@kernel.org>
> Sent: Wednesday, August 18, 2021 3:24 PM
> To: Shubhrajyoti Datta <shubhraj@xilinx.com>
> Cc: linux-usb@vger.kernel.org; gregkh@linuxfoundation.org; Michal Simek
> <michals@xilinx.com>; git <git@xilinx.com>
> Subject: Re: [PATCH] usb: gadget: udc-xilinx: Add clock support
>=20
>=20
> Hi,
>=20
> Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> writes:
> > Currently the driver depends on the  bootloader to enable the clocks.
> > Add support for clocking. The patch enables the clock at  probe and
> > disables them at remove.
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> >  drivers/usb/gadget/udc/udc-xilinx.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/udc/udc-xilinx.c
> > b/drivers/usb/gadget/udc/udc-xilinx.c
> > index fb4ffedd6f0d..30070a488c87 100644
> > --- a/drivers/usb/gadget/udc/udc-xilinx.c
> > +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> > @@ -11,6 +11,7 @@
> >   * USB peripheral controller (at91_udc.c).
> >   */
> >
> > +#include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/dma-mapping.h>
> > @@ -171,6 +172,7 @@ struct xusb_ep {
> >   * @addr: the usb device base address
> >   * @lock: instance of spinlock
> >   * @dma_enabled: flag indicating whether the dma is included in the
> > system
> > + * @clk: pointer to struct clk
> >   * @read_fn: function pointer to read device registers
> >   * @write_fn: function pointer to write to device registers
> >   */
> > @@ -188,6 +190,7 @@ struct xusb_udc {
> >  	void __iomem *addr;
> >  	spinlock_t lock;
> >  	bool dma_enabled;
> > +	struct clk *clk;
> >
> >  	unsigned int (*read_fn)(void __iomem *);
> >  	void (*write_fn)(void __iomem *, u32, u32); @@ -2092,6 +2095,26 @@
> > static int xudc_probe(struct platform_device *pdev)
> >  	udc->gadget.ep0 =3D &udc->ep[XUSB_EP_NUMBER_ZERO].ep_usb;
> >  	udc->gadget.name =3D driver_name;
> >
> > +	udc->clk =3D devm_clk_get(&pdev->dev, "s_axi_aclk");
> > +	if (IS_ERR(udc->clk)) {
> > +		if (PTR_ERR(udc->clk) !=3D -ENOENT) {
> > +			ret =3D PTR_ERR(udc->clk);
> > +			goto fail;
> > +		}
> > +
> > +		/*
> > +		 * Clock framework support is optional, continue on,
> > +		 * anyways if we don't find a matching clock
> > +		 */
> > +		udc->clk =3D NULL;
>=20
> should it be, though? Might be a good idea to add fixed-clock instances t=
o the
> boards still depending on clock framework. Maybe that can be done over ti=
me,
> but worth considering anyhow.

But for backward compatibility , I think it will be good to have the suppor=
t instead of forcing the fixed-clock node.
>=20
> --
> balbi
