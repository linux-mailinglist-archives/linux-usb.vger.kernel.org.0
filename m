Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D929A493BC9
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jan 2022 15:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355040AbiASOOM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jan 2022 09:14:12 -0500
Received: from mail-am6eur05on2081.outbound.protection.outlook.com ([40.107.22.81]:4768
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355083AbiASOOJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Jan 2022 09:14:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz22hTX++kJt85qW1IxYdsEYyUE/A0bi9fmo4s25qLG8+AMLWhQ1ENrR+IH8b8b+CPI86xbN47FJ2Qo+SyjgN0cN7VPPEB1krlE3gDSFXIcpyiSvo74kOq7PPDYEeZOUr5rNNsID5moTfKGXTAE+CShb6DZ7HTZ2hvhDjQM8m7V4IJRCZhJeaal7LUFp5HLUNBwnjtH067VhoyymzhMItnjbkgxakJqM40gsyeUydOvffeVl0TZwFvB2mvnU/dmvlC63b+WwzzRLbiehKZivNo7BpLpgGHgo0y+HXYWxAEY4UxxpkV9VrF/uVUatcZs1lGtqRk8lGQ6oUfYN92xLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFcHBKxRM6qLEKJdgygXiL+03VdaxXyRq2wHKm1loAY=;
 b=cdocZ9IgB7InklDo6PrCzxAq1Bdss5Zqievk7C2DbVhSSIZ+oTo59+f8XR0J7oFEVsSKHtsWMzdrH0xrE6stHyxsDWUVynBTP7Kaarjkg1VK4LK5qTYqUkgPHNrFyLOgFlud6qU3bsVhjVUAC51+HydJJANMFQ5UnPAlsjuteiuAewoKhCHx9uZV/7QJo6R5D8mhnX4Owp8ttB6pp7Rjd5Z2l3n60RpOuu8GlJKlEyjLtdRC5wqRkj/vR+RI1j/RNKCUyUNf9I+ZVjEigEYD3tTMLEMItcGF9x+L19VHq790bFnBtaacNderZzN5v/u2upZG3M/fbld0hPMwN5q9lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFcHBKxRM6qLEKJdgygXiL+03VdaxXyRq2wHKm1loAY=;
 b=WMHD6rDo7l/1OhVvAervkRDNce8EhljlXquuJ/jvNfcHUpJ+gixBXbAGow2BKtDe8dYyedgMCGDmjDRRDZ+BqqIKOP4iZRrzzRa1Ct2rXegLgs7WD8vRaI0iX0BkZUzt3EfKt7TK/DRBE01M2EZQk3l1GEMDAd35sD/mK20xSr8=
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com (2603:10a6:803:49::27)
 by AM0PR04MB7123.eurprd04.prod.outlook.com (2603:10a6:208:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 14:14:05 +0000
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::ad9d:c232:8a80:f8f2]) by VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::ad9d:c232:8a80:f8f2%4]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 14:14:05 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 3/4] usb: dwc3: imx8mp: Add support for setting SOC
 specific flags
Thread-Topic: [PATCH v3 3/4] usb: dwc3: imx8mp: Add support for setting SOC
 specific flags
Thread-Index: AQHYDG2j4CaVJCrZwkSJzjf7Ka1dsKxqYxBg
Date:   Wed, 19 Jan 2022 14:14:05 +0000
Message-ID: <VI1PR04MB4333E8AA7C261C0B3084D8A489599@VI1PR04MB4333.eurprd04.prod.outlook.com>
References: <20220118131626.926394-1-alexander.stein@ew.tq-group.com>
 <20220118131626.926394-4-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220118131626.926394-4-alexander.stein@ew.tq-group.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2625bef-1738-4d56-b3d3-08d9db55f35c
x-ms-traffictypediagnostic: AM0PR04MB7123:EE_
x-microsoft-antispam-prvs: <AM0PR04MB7123F3B0634E8754EA40D81289599@AM0PR04MB7123.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mlJ63b+0RXTioM3vzFix7LsmVcJ0V2G7fxyXRZflAwbS+QLZ6tNag/jRnSEAqwrDwWj0ewD7M85NrzDm6GCicfzEIYlA1rGZiuYEfgUEdnrM1MJBKQe7oDwXOAaOJhcQ1Vl7u2pvLiXSatrArfk6KE/9LjZpaQndfwwMqusiRKZ+uydEmXBH7/hsLGj6M7vQ6MRXDFrxeDabChKg6kg3e2hshc7WAAx1SD4BL3T9OvRbnYCbSkmmrhlmQMf71RQ5V9J/AZT5ObVm9ctM3b8Zd7dUSEH6Vk6fWKEdBza6SbCP4sezXCZXweBEjg8oLhD9fzi+HTDjP4mZJecr6cu+AVdCxI51opiauHKc4PKQuRgsHBf3aGMCYYBOwGGI6q+JHZq0h3t9er4/ptrkA2hIbCSxCuZDSS4ztEa2VtEfP5Lo/D+/go9eNDgMTvHyZc8olDIlZ8DHZW9IjASvW75pC0dxbu2kEBpFVzOPf1bTIMKN4QU8KLPUZ8BL56jCPqcws8BUkLe/62m7KqJEgKUm0GEHT8JNu81ils48uj0gTc6P/eWhY2jQZ6mcweGzSckVHj4RWeVXRY3AomgbbaGFqeqRSUubkUI0cPMMz9JEdQbfwiH9rqbfTWLBP0mB7DCbIqRWVVaFZW/wwmX537cQ7bB9w3LCLs52mGDgWVYirdDogTs9PaeGbdGgx+NQyO06G6dLk56Zu7aR+jP8RgnrdzabvrsxuN1Gy8Pr2nuXiv0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4333.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(66556008)(66476007)(64756008)(38070700005)(8676002)(44832011)(66446008)(76116006)(316002)(9686003)(83380400001)(54906003)(26005)(186003)(4326008)(86362001)(7696005)(110136005)(53546011)(6506007)(71200400001)(8936002)(122000001)(38100700002)(5660300002)(508600001)(52536014)(66946007)(55016003)(2906002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FH9/4iXJZuJL+aQkQYQF3+d2SdphjHCjcwJpH9+obBBrY3gL4bMvuxEJHvDE?=
 =?us-ascii?Q?HvJdu4DugAZa8BPjMUNmQUtcFVWhoi6m5EOQKY18QAl9ppt11Dw+NHkvIO0c?=
 =?us-ascii?Q?laDFmjlCcPSqQhUPlJLuIiIFjXmNXkh2/nHUKQLywRO0WUYPB/wwZl+CA52p?=
 =?us-ascii?Q?juR0C07+ENWmpumKC8vNXQnKfWkplIIKFsdvKenOocUCFYk3O687UfsKjbIH?=
 =?us-ascii?Q?fwR6krksNFBvOm1yjIQX0e9Ympz7hBVTzJPxJqwbSl25yPcJ05VpHQpZhj6a?=
 =?us-ascii?Q?EEnPgqCnbsNMFdVAPhN0uqvkJpoGSXCvNr5HqIY9/xheqBMiYh8g4guzxaWl?=
 =?us-ascii?Q?toqiMbial21Tw/BBzkhekKzgopFXBNntSrGHpZJUeoN52JQvf2jsitfT7PZP?=
 =?us-ascii?Q?Z57bfuuIx58IlySBKTNxFSE8r3HzjsFOj3nAiyYEnW0I1OKZR+5rmE8l35Ns?=
 =?us-ascii?Q?YV7tQ9uBkmkkT/YUNzTgTUR7h0sYiM/eDyhWrA/bTKRK19uq7uMX6ZO9G7L9?=
 =?us-ascii?Q?f/bL8MQ0xFqD9Z19XcncIkW8pmX7wSaAVZufFCbbp8cOyHy1J7j6Zr6V0MtM?=
 =?us-ascii?Q?UD4O/Vy8z3nU4oEcydzWVlPsvp8wke4hGPXtquaiyxdk7dCKm90ARdTs8ri1?=
 =?us-ascii?Q?TnvADg04WJc9njaooagkELw1UAvnNAlabHjdqdnw8bBXJ+Lh8z5u66vKU5IJ?=
 =?us-ascii?Q?iaKYUoH2Dj+BLM4nO4AawT71jDzz5MTTAGjZwlOHW/ojw9EG7EU3xBE5xDSw?=
 =?us-ascii?Q?Ekd32yFWSM9EaS58QZ9LB03xBai+dlAbvtVgh6LX+puznNCvi5SnB5Caszcy?=
 =?us-ascii?Q?DedZ0BQ4Ox20XAJSfB4kNDsSXi0CA4ugvODgFbmXscEsDMg/NiFbcMZav+iJ?=
 =?us-ascii?Q?Ie0iNK62jT8Xc/0np5mXQpev+60AweCxQKelqy14AHx+mZh4XG9apsIndUwM?=
 =?us-ascii?Q?7E5ZoZUP0nMvQNyM51hd7R+AUHgCldZjYhc37pLBcNOFcMBe9vRfx6TKJlBc?=
 =?us-ascii?Q?rUyPm2iqVbPhXzOTbGbMg1FVnLS+7p5gZEq9XY1pYUaAXTs/ObDpBYcQCl3P?=
 =?us-ascii?Q?D+5JD9H5Ia1VOaQKA+opDhxjS+Bc83IPsNG7YXWAy0MDjgAiEy/SvZudPChj?=
 =?us-ascii?Q?gyn9/FUBQWOLOYtPZC37Rhvk1AtNKUMwMSMaKdMu7y1FCrnoCzFYjeVNHW0S?=
 =?us-ascii?Q?fW4hDfdm83bZxsfYYGhMnnbVyNfarh8OO/h6mrQ0UDKfcaup5+HdUZmdiYc1?=
 =?us-ascii?Q?owmrtP5J0XqF7beQ7wqHNJelX5ICAq6+CTI8BIRPvrYWPf+hM43o+GRv31xi?=
 =?us-ascii?Q?vnAdVemVTkjcPa8RQjXff2Db87ZiV4MmKAg1zvgowfQqmgaef0H8duMVQo9z?=
 =?us-ascii?Q?+UtIeH5SW1BPI8PJaBjh+Ojx3d93asv3HL34+WmL+G3FvQwSqc/BJeuuRrN6?=
 =?us-ascii?Q?OBG/2p4scSqSZHy6XYQSoZFbDuWvaijqM5GlNPpKdNet6iM9OWn4wqZomFEj?=
 =?us-ascii?Q?sqnOLdVZ1U4+j3H4okjUlWQjWcOT7/RM+jjFR99J8MfoHWK5XGtAzlqA9w?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4333.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2625bef-1738-4d56-b3d3-08d9db55f35c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 14:14:05.0652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ESi2rT+g5RrKD6xUeVz8QuH/kMDIxp4r+p1rPuiRwDjOC0Jbav5t0krJNFL2H8b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7123
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> Sent: Tuesday, January 18, 2022 9:16 PM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Rob Herring
> <robh+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>; dl-linux-imx
> <linux-imx@nxp.com>; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Jun Li
> <jun.li@nxp.com>
> Subject: [PATCH v3 3/4] usb: dwc3: imx8mp: Add support for setting SOC
> specific flags
>=20
> The i.MX8MP glue layer has support for the following flags:
> * over-current polarity
> * PWR pad polarity
> * controlling PPC flag in HCCPARAMS register
> * permanent port attach for usb2 & usb3 port
>=20
> Allow setting these flags by supporting specific flags in the glue node.
> In order to get this to work an additional IORESOURCE_MEM and clock is
> necessary. For backward compatibility this is purely optional.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 81 ++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c
> b/drivers/usb/dwc3/dwc3-imx8mp.c index 1c8fe657b3a9..3df4313b3740 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -36,17 +36,66 @@
>=20
>  #define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
>=20
> +/* USB glue registers */
> +#define USB_CTRL0		0x00
> +#define USB_CTRL1		0x04
> +
> +#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
> +#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
> +#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
> +
> +#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
> +#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
> +
>  struct dwc3_imx8mp {
>  	struct device			*dev;
>  	struct platform_device		*dwc3;
>  	void __iomem			*hsio_blk_base;
> +	void __iomem			*glue_base;
>  	struct clk			*hsio_clk;
>  	struct clk			*suspend_clk;
> +	struct clk			*phy_clk;
>  	int				irq;
>  	bool				pm_suspended;
>  	bool				wakeup_pending;
>  };
>=20
> +static void imx8mp_configure_glue(struct dwc3_imx8mp *dwc3_imx) {
> +	struct device *dev =3D dwc3_imx->dev;
> +	u32 value;
> +
> +	if ((!dwc3_imx->glue_base) || (!dwc3_imx->phy_clk))
> +		return;
> +
> +	value =3D readl(dwc3_imx->glue_base + USB_CTRL0);
> +
> +	if (device_property_read_bool(dev, "fsl,permanently-attached"))
> +		value |=3D (USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
> +	else
> +		value &=3D ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
> +
> +	if (device_property_read_bool(dev,
> "fsl,disable-port-power-control"))
> +		value &=3D ~(USB_CTRL0_PORTPWR_EN);
> +	else
> +		value |=3D USB_CTRL0_PORTPWR_EN;
> +
> +	writel(value, dwc3_imx->glue_base + USB_CTRL0);
> +
> +	value =3D readl(dwc3_imx->glue_base + USB_CTRL1);
> +	if (device_property_read_bool(dev, "fsl,over-current-active-low"))
> +		value |=3D USB_CTRL1_OC_POLARITY;
> +	else
> +		value &=3D ~USB_CTRL1_OC_POLARITY;
> +
> +	if (device_property_read_bool(dev, "fsl,power-active-low"))
> +		value |=3D USB_CTRL1_PWR_POLARITY;
> +	else
> +		value &=3D ~USB_CTRL1_PWR_POLARITY;
> +
> +	writel(value, dwc3_imx->glue_base + USB_CTRL1); }
> +
>  static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)  {
>  	struct dwc3	*dwc3 =3D platform_get_drvdata(dwc3_imx->dwc3);
> @@ -100,6 +149,7 @@ static int dwc3_imx8mp_probe(struct platform_device
> *pdev)
>  	struct device		*dev =3D &pdev->dev;
>  	struct device_node	*dwc3_np, *node =3D dev->of_node;
>  	struct dwc3_imx8mp	*dwc3_imx;
> +	struct resource		*res;
>  	int			err, irq;
>=20
>  	if (!node) {
> @@ -119,6 +169,15 @@ static int dwc3_imx8mp_probe(struct platform_device
> *pdev)
>  	if (IS_ERR(dwc3_imx->hsio_blk_base))
>  		return PTR_ERR(dwc3_imx->hsio_blk_base);
>=20
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res) {
> +		dev_warn(dev, "Base address for glue layer missing. Continuing
> without, some features are missing though.");
> +	} else {
> +		dwc3_imx->glue_base =3D devm_ioremap_resource(dev, res);
> +		if (IS_ERR(dwc3_imx->glue_base))
> +			return PTR_ERR(dwc3_imx->glue_base);
> +	}
> +
>  	dwc3_imx->hsio_clk =3D devm_clk_get(dev, "hsio");
>  	if (IS_ERR(dwc3_imx->hsio_clk)) {
>  		err =3D PTR_ERR(dwc3_imx->hsio_clk);
> @@ -145,6 +204,24 @@ static int dwc3_imx8mp_probe(struct platform_device
> *pdev)
>  		goto disable_hsio_clk;
>  	}
>=20
> +	dwc3_imx->phy_clk =3D devm_clk_get(dev, "phy");
> +	if (PTR_ERR(dwc3_imx->phy_clk) =3D=3D -ENOENT) {
> +		dev_warn(dev, "PHY clock missing. Continuing without, some features
> are missing though.");

What feature needs phy clock turned on here, why phy driver turns on
this clock is not enough for you?

Thanks
Li Jun

> +		dwc3_imx->phy_clk =3D NULL;
> +	} else if (IS_ERR(dwc3_imx->phy_clk)) {
> +		err =3D PTR_ERR(dwc3_imx->phy_clk);
> +		dev_err(dev, "Failed to get phy clk, err=3D%d\n", err);
> +		goto disable_suspend_clk;
> +	}
> +
> +	if (dwc3_imx->phy_clk) {
> +		err =3D clk_prepare_enable(dwc3_imx->phy_clk);
> +		if (err) {
> +			dev_err(dev, "Failed to enable phy clk, err=3D%d\n", err);
> +			goto disable_suspend_clk;
> +		}
> +	}
> +
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		err =3D irq;
> @@ -152,6 +229,8 @@ static int dwc3_imx8mp_probe(struct platform_device
> *pdev)
>  	}
>  	dwc3_imx->irq =3D irq;
>=20
> +	imx8mp_configure_glue(dwc3_imx);
> +
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
>  	err =3D pm_runtime_get_sync(dev);
> @@ -199,6 +278,8 @@ static int dwc3_imx8mp_probe(struct platform_device
> *pdev)
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
>  disable_clks:
> +	clk_disable_unprepare(dwc3_imx->phy_clk);
> +disable_suspend_clk:
>  	clk_disable_unprepare(dwc3_imx->suspend_clk);
>  disable_hsio_clk:
>  	clk_disable_unprepare(dwc3_imx->hsio_clk);
> --
> 2.25.1

