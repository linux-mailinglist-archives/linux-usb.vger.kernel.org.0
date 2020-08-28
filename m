Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33604255276
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 03:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgH1BRh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 21:17:37 -0400
Received: from mail-eopbgr10073.outbound.protection.outlook.com ([40.107.1.73]:51598
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726147AbgH1BRg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 21:17:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9vsWsPY71bS8SsueTQ/0T8cwzSn+tqZpJ20LsOL4S+vOdGKcDDHYdpCnx+oKMib4UgXKTI8r5ilR3FsiMh5VZ6Asy2Js1ym3d/5kgaMlABkyp55cU0sZTvney7NkBNACPmEdcPSkx1C0EhpPPxrhbwA6t0QUAqKip0NU0akIKu/3qv6JAoY1amAymsUex7NnBgsPU+XPa6PAQZ8+DPGKdRVVOmkfqnRdj/PffboIP5/z5Iltk/mHYeB7WwFYHz7sJy4fK0++wCZRSRQi0PTasCn64MXBhaAH7qLV5WGOXnxltpNkO/1I6M6OQgDPlIaxWQGRaZR9DnQL3rpFFeuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+4jw2WTdX95tKCyXyyo9GyzCQOL5HX2n7WiOq+DpiA=;
 b=k0P/cW/qIz5JW9cujC5viJtKwewO2/pbZ3savIZTqLn/FoWrffSVjjgAaPa6kfHNMUFOYrny12gccZlc0oKsZ+oYojOlgz2IIYCbu9vx6Ij7G+OoPzQe021QaAX1CqiKqykEFP/kuGt7QwngnXTgc/0sOcVLOHDsRpn9Z4Q5M4+DZpBG4AR9RGJe9b37Xb/LJnuqRt6ws1p92dFpIHC4L/O+w+j4o64NrNason5YfCSqvQUkvBckKh8uAZhF/AYNBdhmQhQZJYh2QLhQXeaRmVFfyO6sqh+0OGTmdveL/qo4m5zx5WiOb7qXwQNay57ekW95sWYooPelcyWLzX7kvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+4jw2WTdX95tKCyXyyo9GyzCQOL5HX2n7WiOq+DpiA=;
 b=n/HCUe4QqqJ9sbK3ymqj1LQm8cQsNszAkgEuMhEWLDxj5WBgWkLPpLkozYGjUvsiKNvBF8TZlqzKPzFBGOtwxoIN2sy5UAsy2Xc0t4kW+FKBEQjciiGeo/CEVkWRdrG60PjaIp2Lxxe5vOxgrENi/GbU98eNdcZsliCiPAQB3Jk=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 01:17:30 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.023; Fri, 28 Aug 2020
 01:17:30 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v7 3/3] usb: cdns3: imx: add glue layer runtime pm
 implementation
Thread-Topic: [PATCH v7 3/3] usb: cdns3: imx: add glue layer runtime pm
 implementation
Thread-Index: AQHWeoU/vOS8W4jYQ0qt9vxlzTOsX6lL9I+AgADICoA=
Date:   Fri, 28 Aug 2020 01:17:30 +0000
Message-ID: <20200828011613.GC13910@b29397-desktop>
References: <20200825021120.4926-1-peter.chen@nxp.com>
 <20200825021120.4926-4-peter.chen@nxp.com> <87eensi5tc.fsf@kernel.org>
In-Reply-To: <87eensi5tc.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fdfbb6cd-6662-485a-a96e-08d84af022aa
x-ms-traffictypediagnostic: AM5PR04MB3137:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB31370273C5B96718080FBE738B520@AM5PR04MB3137.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: omx6WVRYU6OcRlanoZ0U3nX83MpupIYxY9zVUk/ZuCJQHoiZWPmAg79nG3SRrb4smwimSMYiMbKryq9K9hYgjTybSASeNB26R5MiI74InWLIafvZ8bfJotIG9hOhz7OBZUPwkieKXSCKujtJB52m5HD+i9T0AI0T5HwIiBgQ4xI7ePmbEKwGlBTEhNZLvibtTgMmVsnMeGbTSQDEDi8SKNawGpqRGhNjesZpoUuGJ5CZhOS2NcqAAYv+MI8eVk9s1smSRc9ZBPLXvbzK4nlqL5feIYCgGHTFxEI/JR+k5H64F22cZb2qGO9XvQt2pVQ2I3i1TexDiem8rWl7KNkl1MmHegTY3Z+qKv/x5ddR6cZe6oRDwzpHjdfCdRt92Zg2BkBMFjb3YYeguwIyZtMyRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(66556008)(316002)(2906002)(478600001)(83380400001)(8936002)(6916009)(6486002)(44832011)(54906003)(5660300002)(33656002)(33716001)(9686003)(6506007)(6512007)(91956017)(66946007)(66446008)(66476007)(76116006)(64756008)(86362001)(966005)(8676002)(1076003)(4326008)(53546011)(26005)(186003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +odG3XxOAAGGmBdZRIOVZfTipCtVERQEtZj0J2bvR/T1tw1TtxDbzBe9F+uvM5gKIt1dMNeiBTyErJDh3EIHvHemzKzzFEeaqjrIo3O2jLM9e2fsq/o3T4QJ+6pDjym/yVBSjS2nG1cnacsAvW3zwNsLResSZVUecbA+OQdDXaUX++k+f0GoXmWhpBp2oG8JEbvbmwo6MbG6XtrCF+3JwX0b88hgHoWlqLMHSbpoeDfqUfZKW+h6tqJwPNSyItyPsLPlZIh0SI/fqEpi69us7gpmCaqfnzwv1me188lRMUND7Jc7nOaI2f5NAYnwnOCTiGaZaz/iIyMevnkTlnGvAerPILwgOdQguOGCqJGFqO47OAwW4PUtmWx9wA2/ngvSkY/MZK5VPWGd/OpIF9EdsYaSdWM84hhnUJCinz6L/smv61mE6gyXWvpZ5OF2eFC19qi2ZPGKvxPUiCxwvtV1Bb4qYm0DWUgpPikQZzIhcBUSGONP/1EnHK466yUUax93LtTIugL1kiUENxrx0M/LkgCkCzLHHspsbjTwc022iw3ZlQ//knXmQDL5ooMn41YLmkgS1EZem1tsRLuI2fWbET/3JJj890WXNgUv5rN83kPMLakY9jcFRKMXr0hCW2IUUYbgxEOQh1hru7CMMpl2EA==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0E109A1DA4DEA4428FBBBCA812336DE4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfbb6cd-6662-485a-a96e-08d84af022aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 01:17:30.5827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zoeEB3ycorAtyNekA6HLxhFxpBga5RtjQfjYbPKVVvAYucOMOMTK03kOYTOcijptWlOSCRZzByNz7DkApYDGUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3137
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-08-27 16:20:15, Felipe Balbi wrote:
> Peter Chen <peter.chen@nxp.com> writes:
>=20
> > Add imx glue layer runtime pm implementation, and the runtime
> > pm is default off.
> >
> > Reviewed-by: Pawel Laszczak <pawell@cadence.com>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/cdns3/cdns3-imx.c | 203 ++++++++++++++++++++++++++++++++--
> >  1 file changed, 192 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-im=
x.c
> > index aba988e71958..a413df26e948 100644
> > --- a/drivers/usb/cdns3/cdns3-imx.c
> > +++ b/drivers/usb/cdns3/cdns3-imx.c
> > @@ -15,6 +15,8 @@
> >  #include <linux/io.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/pm_runtime.h>
> > +#include "core.h"
> > =20
> >  #define USB3_CORE_CTRL1    0x00
> >  #define USB3_CORE_CTRL2    0x04
> > @@ -32,7 +34,7 @@
> >  /* Register bits definition */
> > =20
> >  /* USB3_CORE_CTRL1 */
> > -#define SW_RESET_MASK	(0x3f << 26)
> > +#define SW_RESET_MASK	GENMASK(31, 26)
>=20
> why is this part of adding imx runtime pm?

Sorry, will delete this improvement
>=20
> > @@ -44,17 +46,17 @@
> >  #define OC_DISABLE	BIT(9)
> >  #define MDCTRL_CLK_SEL	BIT(7)
> >  #define MODE_STRAP_MASK	(0x7)
> > -#define DEV_MODE	(1 << 2)
> > -#define HOST_MODE	(1 << 1)
> > -#define OTG_MODE	(1 << 0)
> > +#define DEV_MODE	BIT(2)
> > +#define HOST_MODE	BIT(1)
> > +#define OTG_MODE	BIT(0)
>=20
> and these?

Sorry, will delete this improvement

>=20
> > =20
> >  /* USB3_INT_REG */
> >  #define CLK_125_REQ	BIT(29)
> >  #define LPM_CLK_REQ	BIT(28)
> >  #define DEVU3_WAEKUP_EN	BIT(14)
> >  #define OTG_WAKEUP_EN	BIT(12)
> > -#define DEV_INT_EN (3 << 8) /* DEV INT b9:8 */
> > -#define HOST_INT1_EN (1 << 0) /* HOST INT b7:0 */
> > +#define DEV_INT_EN	GENMASK(9, 8) /* DEV INT b9:8 */
> > +#define HOST_INT1_EN	BIT(0) /* HOST INT b7:0 */
>=20
Sorry, will delete this improvement

>=20
> > @@ -62,15 +64,34 @@
> >  #define HOST_POWER_ON_READY	BIT(12)
> > =20
> >  /* USB3_SSPHY_STATUS */
> > -#define CLK_VALID_MASK		(0x3f << 26)
> > -#define CLK_VALID_COMPARE_BITS	(0xf << 28)
> > -#define PHY_REFCLK_REQ		(1 << 0)
> > +#define CLK_VALID_MASK		GENMASK(31, 26)
> > +#define CLK_VALID_COMPARE_BITS	GENMASK(31, 28)
> > +#define PHY_REFCLK_REQ		BIT(0)
>=20

Sorry, will delete this improvement

>=20
> > +/* OTG registers definition */
> > +#define OTGSTS		0x4
> > +/* OTGSTS */
> > +#define OTG_NRDY	BIT(11)
> > +
> > +/* xHCI registers definition  */
> > +#define XECP_PM_PMCSR		0x8018
> > +#define XECP_AUX_CTRL_REG1	0x8120
> > +
> > +/* Register bits definition */
> > +/* XECP_AUX_CTRL_REG1 */
> > +#define CFG_RXDET_P3_EN		BIT(15)
> > +
> > +/* XECP_PM_PMCSR */
> > +#define PS_MASK			GENMASK(1, 0)
> > +#define PS_D0			0
> > +#define PS_D1			1
>=20
> I think only these are part of $subject

Yes, you are right.

>=20
> >  struct cdns_imx {
> >  	struct device *dev;
> >  	void __iomem *noncore;
> >  	struct clk_bulk_data *clks;
> >  	int num_clks;
> > +	struct platform_device *cdns3_pdev;
> >  };
> > =20
> >  static inline u32 cdns_imx_readl(struct cdns_imx *data, u32 offset)
> > @@ -126,6 +147,20 @@ static int cdns_imx_noncore_init(struct cdns_imx *=
data)
> >  	return ret;
> >  }
> > =20
> > +static int cdns_imx_platform_suspend(struct device *dev,
> > +	bool suspend, bool wakeup);
> > +static struct cdns3_platform_data cdns_imx_pdata =3D {
>=20
> make it const?

Will change
>=20
> > +	.platform_suspend =3D cdns_imx_platform_suspend,
> > +};
> > +
> > +static struct of_dev_auxdata cdns_imx_auxdata[] =3D {
>=20
> const?

Will change

>=20
> > +	{
> > +	.compatible =3D "cdns,usb3",
> > +	.platform_data =3D &cdns_imx_pdata,
> > +	},
>=20
> bad indentation

Will change

>=20
> > @@ -194,6 +233,147 @@ static int cdns_imx_remove(struct platform_device=
 *pdev)
> >  	return 0;
> >  }
> > =20
> > +#ifdef CONFIG_PM
> > +static void cdns3_set_wakeup(struct cdns_imx *data, bool enable)
> > +{
> > +	u32 value;
> > +
> > +	value =3D cdns_imx_readl(data, USB3_INT_REG);
> > +	if (enable)
> > +		value |=3D OTG_WAKEUP_EN | DEVU3_WAEKUP_EN;
> > +	else
> > +		value &=3D ~(OTG_WAKEUP_EN | DEVU3_WAEKUP_EN);
> > +
> > +	cdns_imx_writel(data, USB3_INT_REG, value);
> > +}
> > +
> > +static int cdns_imx_platform_suspend(struct device *dev,
> > +		bool suspend, bool wakeup)
> > +{
> > +	struct cdns3 *cdns =3D dev_get_drvdata(dev);
> > +	struct device *parent =3D dev->parent;
> > +	struct cdns_imx *data =3D dev_get_drvdata(parent);
> > +	void __iomem *otg_regs =3D (void __iomem *)(cdns->otg_regs);
>=20
> why the cast?

You mean __iomem?

The kernel test robot reports warning:

https://www.spinics.net/lists/linux-usb/msg199770.html

> > +
> > +static int cdns_imx_resume(struct device *dev)
> > +{
> > +	struct cdns_imx *data =3D dev_get_drvdata(dev);
> > +
> > +	return clk_bulk_prepare_enable(data->num_clks, data->clks);
>=20
> do you need to prepare and unprepare for every suspend/resume? Isn't
> enable/disable enough?

Since runtime suspend/resume is not often, only at below situations,
we want the lowest power consumption:

- CDNS3 device is connected from the host
- There is no device on the CDNS3 host
- The device which supports runtime-suspend is suspended at=20
CDNS3 host.

>=20
> > +static const struct dev_pm_ops cdns_imx_pm_ops =3D {
> > +	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
>=20
> could the same be used for system sleep?

The suspend is the same, but resume is not since the controller may lost
its power during system sleep, it needs to judge that power status and
restore the controller. I will submit these system PM supports later.

--=20

Thanks,
Peter Chen=
