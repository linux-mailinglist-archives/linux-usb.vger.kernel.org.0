Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B9A234572
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 14:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733168AbgGaMLi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 08:11:38 -0400
Received: from mail-db8eur05on2057.outbound.protection.outlook.com ([40.107.20.57]:54176
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733150AbgGaMLg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jul 2020 08:11:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjdXuaiSUgB+hE3hA2H5bapiUbV3U8cvDBJx9FkBb0Zv9a/9MSwPSiTfJtrQGuMLuyyrFNdEPaKIJfC1wQaEl/ZKrr3WX+kLdE42dKw4LNJ9MMvc8MDlShDmvty9H6yfrsEw21n91PoOxgPQxDRx25/f2puG+Teodu2PWkzlLPDIqpoLCaCxUY4qBcXMt9DwMv2xSJMWPTirahrUTg8ArpNxeRLuPiC0elIS7X879VWV/4fFGVK4pGDc+QZt6Giv5QkSTYNilJmf0M/FTsRR64wP9wsdrYDp0IcrvnNSWllWGmTcQPe4LQy2nPlXxU6xxniS6GpH3wA7rPYc18uuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuK5F6jqrtq9xcaM5Z0R1y/TK2bicwNxvPiqkzHf2OE=;
 b=B9B8URuCLshmOHfdJadXJFo56LTiWXba85PBT4LLPpiOdJwobfUvkzKgVQFFWNOMV0z62zcqSVT1M4yOTP0fbE37LF46NwHb2yots5+jYm2VZnU21go65HjFUq9wvonxPCffm1gEYNK2ZsHqEbd4oYKJp/+3e3+4GKHxhQfziF++CIj5BqLxaJB0yrLCwoXtAugxd9tx9086Dd24+bZvZSDZqfBmrs0yyKyEzpSlnprGiBxWOv6r3yv90bWhLFT7Y7jkxUSEQJlpcJrTYW1GKyg3J8Flh7iTLcCnE1F0CF2I1Twm5RNYCRVoFhHpqasekbAOSbGprOzwpxu3ECu/8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuK5F6jqrtq9xcaM5Z0R1y/TK2bicwNxvPiqkzHf2OE=;
 b=K+61x8OOB2OH43ayJzl9bt0qUUc+RZm3GkocQz9jGPYEdowMKss9OW/7lHD5YHWIg8EeFjSenthcg6DoJh42FpWkGy0jOeFDtvn3r4ZTHao5NxeA8OmpLthFBV5haivo5QnYMFaBZbVHLuacYiudhKdBGDPeudLy6J26rNnx53M=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB6PR0401MB2359.eurprd04.prod.outlook.com (2603:10a6:4:4c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 12:11:32 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f%7]) with mapi id 15.20.3239.017; Fri, 31 Jul 2020
 12:11:32 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Thread-Topic: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Thread-Index: AQHWZyFjrjQabElMSUmE/uyQe+yec6khlL4AgAAB30A=
Date:   Fri, 31 Jul 2020 12:11:32 +0000
Message-ID: <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
In-Reply-To: <20200731115536.GB1648202@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [218.82.62.103]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fe420ea1-ec81-4943-a84e-08d8354adcd6
x-ms-traffictypediagnostic: DB6PR0401MB2359:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB235976CBF07810AE2F3293298B4E0@DB6PR0401MB2359.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mW01yAK9FIp90o+n/Z0gmuO5thTmcndNHSUeYnwmdSrXcWBvSfCdDdE5uwHkTInDu+oKBHWfz8/aU3oo5R4is+w8VJSyO9D2rdaa9cC6wI92zB18Vk/jDx1X25s07b7JmEkVAKi/RP1+72enb4yU7EsHjGNC2RaH5nR62AGl9Nk7GSua2uMd0uQkjpByPoRdOPlw0us55O3ta+NsdyZkdgQhDsA5WUK7lEm8HClO4fV4ROx8gdxR1ktmPX+yIeByFXGhJQyR4CF+KRb6ux5MPrBp6sDmG9jAfUK68Hj72GQyZSX79tcMRHtOCmMCbYyYJcUSha9/hw7wUeuw2NVrgEMGYbM3OeSn5mbSEua1oAXz4DwSdvJw0TlHcOIc08mAu1NMxO1mmSVxC5KN3g6e4jAQuDss/pV4HUdzNAFEsCbxDFdRACMnkcDkPZGB0VrJ554qg6xG4tCTb4rsewvR+Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(45080400002)(83080400001)(54906003)(33656002)(52536014)(6506007)(26005)(44832011)(76116006)(316002)(66946007)(9686003)(66556008)(66476007)(64756008)(8936002)(66446008)(186003)(5660300002)(4326008)(6916009)(83380400001)(478600001)(7696005)(55016002)(86362001)(8676002)(966005)(71200400001)(2906002)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: NcN55g1bj/AxSqu0msKK1TUmsCSVVk9UeRjPPe0lRug/Utr6tH5LJodJXAikxDKQGgVvYtW1eTVrM/Z3iFUZ5a/HNC2rkjTwW5LCyfEnNj4HF4aseFTxf/GnNwUl4DT7QS48f+k9U2QRBcrzuQAW4CTdgKeDWOMuGykumhb2/NpgLGkgkCItOYpmZo4Jdp+TOU2B5WplgDTtAxewbRUvGDV9PoMPiM5uImrke0oA/0Gz9EnMCeQVxNGOpBuiwrilmlGeJG+fWHXexvJxcmKJlJOTU1o6/FIcS/qLCdmhLE7o9VcB6BHQwNw/55SeSoFZ885v7FTFPsduVPVckiLLfpwDf0gL6+MHg+ABH6Mn4mRFlP+rdvS3shPz5bskyJPcz5+2/utMSuHpCLkBwFXTbcoiku2mJ6KW+AUuHfc7eX9EARxo36vM+P7HR8z77OiBvXnKnduobaNmLnJZlgAf2VS2xS57pM+Ldv+t3Xgi7hWlAgfvo+xRLNIKiOfpEOddIeBWab5LKgD4COhWcjrZ/ZBavKrvk1iwRK1Z6n2d6YV+JV5rGb8LjS8zznTOXnSxjd29N96KD5Mgrmt26LreAvJKzeZw1qEHwmhHp5iavMkS9Y8c19KE3OgEM9Gk/6dYWZvxMKfesgy2h7A9dJZngw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe420ea1-ec81-4943-a84e-08d8354adcd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 12:11:32.0916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Kz+omec1MY5QF9vRVSoTMLS1KxN1xvlzHF29XqIWT0+IgwD7m06aBXOsc0vIOptzZkz4urQmyRoZ3D9xhsWbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2359
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> On Fri, Jul 31, 2020 at 05:59:35PM +0800, Peter Chen wrote:
> > Per discussion[1], to avoid UDC driver possible freeing gadget device
> > memory before device core finishes using it, we add wait-complete
> > mechanism at usb_del_gadget_udc and gadget device .release callback.
> > After that, usb_del_gadget_udc will not return back until device core
> > finishes using gadget device.
>=20
> Ick, no, that's a sure way for a deadlock to happen.
>=20

I tested multiple add and delete, did not trigger. What kinds of possible d=
eadlock?


> Why does the gadget core care about this at all?  It shouldn't.
>=20

The UDC driver will free gadget device memory after that, the driver core
may still reference it. [1]

>=20
>=20
> >
> > For UDC drivers who have own .release callback, it needs to call
> > complete(&gadget->done) by themselves, if not, the UDC core will
> > handle it by default .release callback usb_gadget_release.
> >
> > [1]
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww=
.
> > spinics.net%2Flists%2Flinux-
> usb%2Fmsg198790.html&amp;data=3D02%7C01%7Cpe
> >
> ter.chen%40nxp.com%7Cff1ece31761e40be0c7b08d83548ac19%7C686ea1d3bc2b
> 4c
> >
> 6fa92cd99c5c301635%7C0%7C0%7C637317933526709832&amp;sdata=3Dq7%2F1S
> mwujv
> > tg4DsW0iUaM2Mqf0cdkzL%2FKjJNBRfm6hc%3D&amp;reserved=3D0
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> > If this RFC patch is ok, I will create the formal patches which will
> > change UDC drivers who have their own .release function.
> >
> >  drivers/usb/gadget/udc/core.c | 14 +++++++++++---
> >  include/linux/usb/gadget.h    |  2 ++
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/udc/core.c
> > b/drivers/usb/gadget/udc/core.c index ee226ad802a4..ed141e1a0dcf
> > 100644
> > --- a/drivers/usb/gadget/udc/core.c
> > +++ b/drivers/usb/gadget/udc/core.c
> > @@ -1138,9 +1138,15 @@ static void usb_udc_release(struct device *dev)
> >
> >  static const struct attribute_group *usb_udc_attr_groups[];
> >
> > -static void usb_udc_nop_release(struct device *dev)
> > +static void usb_gadget_release(struct device *dev)
> >  {
> > +	struct usb_gadget *gadget;
> > +
> >  	dev_vdbg(dev, "%s\n", __func__);
> > +
> > +	gadget =3D container_of(dev, struct usb_gadget, dev);
> > +	complete(&gadget->done);
> > +	memset(dev, 0x0, sizeof(*dev));
>=20
> No, the memory should be freed here, not memset.
>=20
=20
This memory is allocated at UDC driver and is freed by UDC driver too.

This memset may not need for other drivers, only dwc3 is needed.
I added it here to avoid regression. See [2] for detail please.

[1] https://www.spinics.net/lists/linux-usb/msg198767.html
[2] https://www.spinics.net/lists/linux-usb/msg198725.html

Peter=20
