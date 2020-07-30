Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33AD5232A60
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 05:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbgG3D2P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 23:28:15 -0400
Received: from mail-eopbgr70080.outbound.protection.outlook.com ([40.107.7.80]:61351
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726367AbgG3D2O (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Jul 2020 23:28:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nowftIxuq6ZsBfGO/oNjvwa9pjD8U0hjNIdAU1TFwHhX0Iy3ghmnpQbr+y+Wdmy77VbwtxLUNiHscudos0ZYDIDsG+eShR/1OWkdNqOC5/mY5NUTmyJDrYEZiS3lJNTOPYVzeHMq0urCnJJlLK14K9zlxG2hWTubP6DZhWIy36EAcHD7Zh7DJpqt6wAIeb8IhdKdvc0C+E+FFT9Wn6lTrWh8TD7rT+SbTlzyyrIVTd9wga/EmTP/blBZDowzssnmwOPRdVbqZEDScm9W1/hfGXl7JP9VZnq9ct4Cl1HGg8rBc5idgG99R0ClNm+ieYWWHB0zdnP6Dmu3OM6R7R14kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xDLhdP9MCdSR+AHolp6h7syLYV36IYfRSyYEKnO1TA=;
 b=f6l5IW2wUJwZQSnHyDlJ4wUrx5toVbY2fUhvtVpyMgit06dPOru7dwCotZgtcDyaWLTxjKKrejOHJnYmkAOEygZ7h0tZNQOhPZ9koAKi+SNLqaMSb+nvr3BDUNBacNdcGCyZITpH3Hh+VDkCcGTG+rk+rO+BAJ/CifbMnZyj+5SjouLxLK+0PvUH1QNEZ7DBSx2hHpXwqZtldQhKYcAFQail3m5Y3VtzBdX83EnqiQcNK9d9/di0DGZEfrtpuEmSpR59t+g3eZvIjJW/ss6L3Kt9BP4wblonugIlGU4O3ZRbH+G262nrq546UjZdZTudkbSbsNWS1smSOD2qyf4MtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xDLhdP9MCdSR+AHolp6h7syLYV36IYfRSyYEKnO1TA=;
 b=VfcZQNpEkcYqVi6pmlNPTSHRjflrbCqYNIvPMdcWR4MIMFzZ31Acc7fTqSDqNh3Y1BZtmeZ46I437DBYBE1upNvGgd06Bkcb10OkJBek4O92ToP3fr08739ym35to9VPpzyHO1Q+4Ik/anucAZxWNwo2fLHCKCjXIHARr7fzojw=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB7PR04MB4474.eurprd04.prod.outlook.com (2603:10a6:5:3c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.27; Thu, 30 Jul
 2020 03:28:09 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f%7]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 03:28:09 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Roger Quadros <rogerq@ti.com>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH RFC 1/4] USB: UDC: Don't wipe deallocated memory
Thread-Topic: [PATCH RFC 1/4] USB: UDC: Don't wipe deallocated memory
Thread-Index: AQHWZeX+sOparEfj/0SX/jVZ2loWAKkfdvoA
Date:   Thu, 30 Jul 2020 03:28:09 +0000
Message-ID: <20200730032744.GC26224@b29397-desktop>
References: <20200729202231.GB1584059@rowland.harvard.edu>
In-Reply-To: <20200729202231.GB1584059@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b980abf5-1ee9-4020-6bae-08d8343894f9
x-ms-traffictypediagnostic: DB7PR04MB4474:
x-microsoft-antispam-prvs: <DB7PR04MB44743D5B4B1C5E94110A779C8B710@DB7PR04MB4474.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WF3f6ABPEuGtnYu0OQLzRigHytcz/RrVrknyCNlAR27P8UZNGEhVZFScK37btxgpxeRrCi7CAMseCYxdBDUMC1VrufyL/fNkUf3sk6kFQKOqePGNOUGISBHBmYzFAqviN/917j1CBkfQ6TjB577KXtQJu7GtHmSjJBngYKijHsiTmNLcd2Ng3+RKi1PXxVGe7X7ln5Xp29fBys/lDUmN0IgTvFR1ZioWbUj6cktL7ZZxMwanABqpkbbPBcsesuO8aLFvozSxvz7Ry32ku+6swVyq6Ogm8Sl/nyPEwVNLQdCfndQsxDH8JndvBdidKMZpAJoWhJKwCjctaxMP+KKGdA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(8676002)(66946007)(4326008)(316002)(2906002)(76116006)(64756008)(66556008)(66446008)(71200400001)(83380400001)(8936002)(1076003)(9686003)(54906003)(66476007)(91956017)(6512007)(33716001)(6916009)(44832011)(478600001)(86362001)(5660300002)(6506007)(53546011)(33656002)(6486002)(26005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: bd1Gtoq0bELbaz3wg3TPrFYufERvRibuCgtwqpQCLaDu77Na+SdrsjoE0WBmJkxQoTX2nZ8Ec5z+fpeNvl8aA9cNbPC54hSIxsNtSdcIONuvgNnJC7a+g1DQeitB3flN3+RPECpdnkLr9G3kaOQOFFKdgPTlZ+GZPGxNAs1HThkN7MQE7eXthDr/4ePeNTcTiKbLbARwVdiP5L3OCEVj+2NEzkBdJ+001fCC61U0BrXuuGm00atlDGfRNST9kuEYQSvY1mbD695TCswD1jvpVh7LdHi5LjXunwagHhSsqmbA1Qp9yHw5IQVn/sH3bsqbwCkvxP3UKa4Xgazyv6DXeCO5zcdkGC/oPV+tsWUWP/VuI4FCfEpLRaOWMqevx93u7EiPhrkFc0v+y0E/IjNbiCOZD8qGUyds25FOdybxjbRHn8+wvWbRtXhSAnciJHorJNJeYi84ZO2I/LbZ2l7LuWtnd+mAqGzmD1cjPjTl7CE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6F0D66D73D58F54F873B4E57BA0852A4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b980abf5-1ee9-4020-6bae-08d8343894f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 03:28:09.3628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8phaXcecgVa/kKcGk8FZFNLDm8CsUn0X1KgALpcr8bLhi2vczpS61ybnscLdmygc2i32IRnpQDLJwcEnV2lMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4474
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-29 16:22:31, Alan Stern wrote:
> Abusing the kernel's device model, some UDC drivers (including
> dwc3 and cdns3) register and unregister their gadget structures
> multiple times.  This is strictly forbidden; device structures may not
> be reused.

Register and unregister gadget structures multiple times should be
allowed if we pass a clean (zeroed) gadget device structure. I checked
the cdns3 code (cdns3_gadget_start), it always zeroed struct usb_gadget
before calling usb_add_gadget_udc when start device mode.

>=20
> Commit fac323471df6 ("usb: udc: allow adding and removing the same
> gadget device") attempted to work around this restriction by zeroing
> out the memory occupied by a gadget's embedded struct device when the
> gadget is unregistered.  However, it does so at the wrong time,
> immediately following the call to device_unregister().  At that point
> there may still be outstanding references to the device, and
> overwriting its memory is likely to cause trouble.  Even worse, if
> there are no outstanding references then the gadget's memory may have
> been deallocated, and so gadget must be considered to be a stale
> pointer when it is passed to memset().
>=20
> This patch fixes the problem by moving the offending memset to the
> device's release routine, which gets called only when all references
> have been dropped.  (Actually the call gets moved to the default
> release routine, renamed from "usb_udc_nop_release" to
> "usb_udc_zero_release" to indicate that it now zeroes out the memory.
> This routine is the one used by dwc3 and cdns3; other drivers may not
> use it.)

In fact, many new written UDC drivers uses usb_add_gadget_udc directly
which uses default .release function defined at core.c.

>=20
> This doesn't fix the underlying problem.  UDC drivers that register
> their gadgets multiple times should be rewritten to allocate their
> gadget structures dynamically, using a new one each time.  Until that
> is done, this will at least remove one potential source of errors.
>=20
> On the other hand, the patch may create new errors if the release
> routine doesn't get called until after the gadget has been
> re-registered.
>=20
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: Roger Quadros <rogerq@ti.com>
> CC: Peter Chen <peter.chen@nxp.com>
> CC: Anton Vasilyev <vasilyev@ispras.ru>
> CC: Evgeny Novikov <novikov@ispras.ru>
> CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>=20
> ---
>=20
>  drivers/usb/gadget/udc/core.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> Index: usb-devel/drivers/usb/gadget/udc/core.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/udc/core.c
> +++ usb-devel/drivers/usb/gadget/udc/core.c
> @@ -1138,9 +1138,10 @@ static void usb_udc_release(struct devic
> =20
>  static const struct attribute_group *usb_udc_attr_groups[];
> =20
> -static void usb_udc_nop_release(struct device *dev)
> +static void usb_udc_zero_release(struct device *dev)
>  {
>  	dev_vdbg(dev, "%s\n", __func__);
> +	memset(dev, 0, sizeof(*dev));
>  }
> =20
>  /* should be called with udc_lock held */
> @@ -1184,7 +1185,7 @@ int usb_add_gadget_udc_release(struct de
>  	if (release)
>  		gadget->dev.release =3D release;
>  	else
> -		gadget->dev.release =3D usb_udc_nop_release;
> +		gadget->dev.release =3D usb_udc_zero_release;
> =20
>  	device_initialize(&gadget->dev);

According to kernel-doc for device_initialize

 * All fields in @dev must be initialized by the caller to 0, except
 * for those explicitly set to some other value.  The simplest
 * approach is to use kzalloc() to allocate the structure containing
 * @dev.
 *

Is it better to zeroed gadget->dev before calling device_initialize?

> =20
> @@ -1338,7 +1339,6 @@ void usb_del_gadget_udc(struct usb_gadge
>  	flush_work(&gadget->work);
>  	device_unregister(&udc->dev);
>  	device_unregister(&gadget->dev);
> -	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
>  }
>  EXPORT_SYMBOL_GPL(usb_del_gadget_udc);
> =20

--=20

Thanks,
Peter Chen=
