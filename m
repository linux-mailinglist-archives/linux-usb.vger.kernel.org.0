Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975364BB2BC
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 07:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbiBRG5z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 01:57:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiBRG5y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 01:57:54 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60062.outbound.protection.outlook.com [40.107.6.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82BC340C5;
        Thu, 17 Feb 2022 22:57:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAgykhCAcn3D3Z5nTo56rcxwbZOpddsxVv+1NSR++EIKmTE53ea2Mp9n7U1vtB1Z06lJmaERlQQYAJ+a9SuyRK9XOBPCNe6mATTZqQc6lumA/V5LvZgG2rSfP0Suf9grq2JZEeXg5PvuR4BOcsQnMkkRzrNPV/tLywSCXcWRSY0YGHerIgUBUMglGnDDybysRdklpXVuIRTa/71TZzr2QDS8Hgridgk43lpL+zX4wRNxQHQKvm/RS6ax1M79/6LXPDZZfB7RKnHdrS95BHhCna9N8Kmh5wlvfk/v+Miy0sab++wLPHNSOFmLQnCdTkoxFWM/Rhqt6SQF5HUl4uS7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kyN1YNU+1qcRAMMQDHYg2hrke2hEAr0uHGPxPmGOGE=;
 b=COXNvX1R7YafVlEBSUCwHf4HUxrOzTOZg53D0+n4Xtj6nKpHgIxQ+HQI4hgzsC2rT1QpKOrzmhVjC9G6o5Qlc2DCYxFQRoZxNND/nAl2LWRmXnHGU8vMcWPQqmjs9+CTID9R1iEi3Ie90ObeQxBad5xQwItkswLh6UIjXtpjJXhKKik7ni3UQrlyLoIMlqV57oGN5M6JXKypWDlHEI9TXoKwtJTojgxsYqXZQ4zCgsxmMe0eg6Ofl3go0tvGIvCWhXe/EL1HjlQA2QmUIBo0w+1Yj0P0YFzpWNhH6anXPRFhBJFaQigGEzLJLa9eRS3PKtM+J2zMOvhkG3thSw3hdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kyN1YNU+1qcRAMMQDHYg2hrke2hEAr0uHGPxPmGOGE=;
 b=qz25CDoWxWWqy1TUIMnZxYtaLlt3AV/U5hdL6/vTI6qlK/0eEm71nb6ajHW0jk2bSCOZA8gK5IIDIgha2/TFTSa7FswmVpu1az6IzII2UP2Ckm0UXoBYdlxTGrEP7o6w8MD/FlwyhBaTyCXghsaVcqv2FUgNYT6bfpNROc95yfo=
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com (2603:10a6:803:49::27)
 by AM5PR04MB3074.eurprd04.prod.outlook.com (2603:10a6:206:4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.19; Fri, 18 Feb
 2022 06:57:33 +0000
Received: from VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::f54b:2953:6266:2f0b]) by VI1PR04MB4333.eurprd04.prod.outlook.com
 ([fe80::f54b:2953:6266:2f0b%2]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 06:57:33 +0000
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
Subject: RE: [PATCH v4 3/4] usb: dwc3: imx8mp: Add support for setting SOC
 specific flags
Thread-Topic: [PATCH v4 3/4] usb: dwc3: imx8mp: Add support for setting SOC
 specific flags
Thread-Index: AQHYEr71XyqVFT1XIEuCD4dPbKt3KqyY4T4Q
Date:   Fri, 18 Feb 2022 06:57:33 +0000
Message-ID: <VI1PR04MB4333E4CB42DF67C8703F42AC89379@VI1PR04MB4333.eurprd04.prod.outlook.com>
References: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
 <20220126141340.234125-4-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220126141340.234125-4-alexander.stein@ew.tq-group.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afda3a35-8bb5-4a54-c8ca-08d9f2abf03f
x-ms-traffictypediagnostic: AM5PR04MB3074:EE_
x-microsoft-antispam-prvs: <AM5PR04MB30746067A9EB45D82E53497F89379@AM5PR04MB3074.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RPAZO8FPUSdCPLB9uI71ViJnOfXS0fhllRYBh/bYkRkslj49a9qgQOW4WaHSjTPmeN/9pNxKUj+D9W0NK2zWdPanoPkM1a5pxYyTjhfFNtN1yDjOOdr3mzr978SYJkr+pniYG1s99J9YEyacCejjHGtV45tgQtZgvNhUEnfe3pKgrUauOt5cUj23rjANsfQavIVaNC6ulHX5+dEWGSxdApDxscoHS04NHfzK4PInnnNhxifiec/qtimJCWMC3z3KTfiJOl3IniwlFkcjRmTvUsrMhvTp/DHSpBqND+cjIhJFhwrsNHzS7T5DbPS/F6WXMJLTFgQrbD446d8rym0z5dzmC64nrp3gKaE1IR7wamsmrGs7NrHpPiBc80L5oj41s3ewPjTjJ3gPTZExTVsqdycYumgi1uwiX1E14FjO5E9tjS5+fX1ig33uI7117Inbm6PwrKvvBRCHpi5AA+0kxK3eFDDUJGNVPTvq1fOjAyAB6TA2JK8457JquC7FunaykiBLffewMY/AhxDQHrsTjAdMsFzoGVD0Fq5DAAKC2e8R3jX1zilYnmF5ZsRRsR21vy9efTRP0HGx84Gnahbl+DaqkyS1KvND99D4RTxN3kyKBrA+Sj3lYzu4GuuFv4hzGK9p0gHlY/OE0smrO9O6TsO9Md8pmgI8En53mxZg3mSZ4AN4HsEHZLHcALoNQAWYOx7X2QOZ7dyjnq6R704QOYCUUdDGbO9k1B5gqPail78=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4333.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(83380400001)(44832011)(26005)(186003)(52536014)(53546011)(4326008)(55016003)(6506007)(7696005)(122000001)(508600001)(86362001)(9686003)(2906002)(38100700002)(316002)(110136005)(54906003)(66446008)(64756008)(66476007)(66946007)(66556008)(38070700005)(76116006)(71200400001)(5660300002)(33656002)(8676002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GI8xdECb4Qw+fGEFTYaGsC0fjJvTxH+z/Csl7cCuiNBGtukbF1B8slA3o6g3?=
 =?us-ascii?Q?btpkYdejDJKZRM3s7H0z8Uj86JHd64+SW7xilV+oUfS5lgKZcj4oYygDm4tt?=
 =?us-ascii?Q?sHHaHdit553g8WNzvPisb9WR+t8q+o2i/EY+9JcD9XGUoI6q4MfFi11b+7oh?=
 =?us-ascii?Q?ljsc3E0qxhd2SWfv/SQry2MaWEhrGz8mWR7BhhSKMOUOk2njZafYkftUySxV?=
 =?us-ascii?Q?nPWI7b8sckZtUi73a0tSLuKt4afHmPac2obXd2w2NE3Q6Fw4KjE5CbaGQg0q?=
 =?us-ascii?Q?Sw4g9wNdd8BUMwKnDnU3l+OQgFgfXB2Ifd5qU27+HywB7UL/QQLrwNvm8Ltb?=
 =?us-ascii?Q?khVRuTtOwuWCEOLkUwrN84Do3rnpV4t4322XlNMxWEjU8QvizGhAMC88gwgv?=
 =?us-ascii?Q?BuMDd1z/I0wXhEUCyPauQjG1dkot4s1le4uKfHGywEyc3ZgzlWrwnh7e477N?=
 =?us-ascii?Q?D2rC/rAGAvL4YkZOaFnHAajlv/eVjnjI+pOakb+hxsV1iscbriLv649HniRx?=
 =?us-ascii?Q?JIYu7EAjuNGJVafK9VKpQQtvfmIQ/bfuuBYoAzQnnV/s7hEijkeon/9UILFS?=
 =?us-ascii?Q?CvOSaD517csIUTPrmzPh3b1TeMyF+Zb7uLHlJcep+1Dely7qwEmIQW31mHx8?=
 =?us-ascii?Q?8H84qDHsVe9K2mby0feRiYbepNaEDfvgFVKSiMg4QMLbvdbe7/St5UI8VD0C?=
 =?us-ascii?Q?MuB79N7dQyruel+mzWBtXZqkrOvzvM5kNQziUAOqbE7t+8fwwGllcUuWU3qV?=
 =?us-ascii?Q?dsBBW6/zWBdpLY4JqXF0rhF7tMMAWYxwse44W1/IG+HymTChH83tcQdNojyu?=
 =?us-ascii?Q?ztsmYZhAx4xArdd7I1+9MXvXwxVqgja1/YGyYnaOXSH5LxHZjvASTVsh8dSr?=
 =?us-ascii?Q?YvdmXZmq5Cgm6CALpqEg3Pq8yP0+LOBCQiH1i7KI9/JZBuHol1OQL1iTYDvM?=
 =?us-ascii?Q?hbBZiM507fEc3W8p/qcT2ZfPTN7iLZvcDq+WVKQUvpm14P5xLNL8FTVg3uFR?=
 =?us-ascii?Q?GUKzUP461CXHX7o87LjXnT24aFv4xgw1/xG6GuEjn6A/L/wC1nIEchY6/ZKr?=
 =?us-ascii?Q?poJHVTMMSannTAMkIzybLoPI7NIChBjDJm/6W0ZtGQgk5BuPmk2ZtNW5que5?=
 =?us-ascii?Q?MONGZ/+IpNJSPw0+Pfb98VaJigHb70Csmmh+RGM+tVhIxqT3FNQH9RP6CL+x?=
 =?us-ascii?Q?Io68AqXWoi3Wk1z8Wg4tlU/RxU8TE43wWIyXz6CKxcazstD+ZItPRcT0JaIO?=
 =?us-ascii?Q?WpzMKmkbGnyEA3eDTNZmcyH/h08Pe1sFP9XMuRsQMdZwmdG4s6PK7qHbZXMI?=
 =?us-ascii?Q?2DlODKr/DTi468rFpDgNEPuPDr3aCMsfo+O2fdUNty9qLxa7zRfQXwNpIeuG?=
 =?us-ascii?Q?5buORS1PBJK2SO9SnmaGfjj1xcW0P8g9zUR6sN+Lhkno/dZzxoOd3xGvwhTR?=
 =?us-ascii?Q?uqI7+Pif8t1QEcS/XKod3OMBGuFlL6ZtXZn6m7FUzPcFaZqiCiCTbWFBZrZy?=
 =?us-ascii?Q?yiaRq06CtdJZJNRuOG4Rsl/OC2xvyXlgz1dnbB6VgusrCNwyo9ELwwUugg?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4333.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afda3a35-8bb5-4a54-c8ca-08d9f2abf03f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 06:57:33.2427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XdUGG6/7ZJstX54KHMnM4UOa7qBrmf5FsgCDLwiz3zwBd1GuRkCRCECXB5SPh9uF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3074
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> Sent: Wednesday, January 26, 2022 10:14 PM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Rob Herring
> <robh+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>; dl-linux-imx
> <linux-imx@nxp.com>; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Jun Li
> <jun.li@nxp.com>
> Subject: [PATCH v4 3/4] usb: dwc3: imx8mp: Add support for setting SOC
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
>  drivers/usb/dwc3/dwc3-imx8mp.c | 62 ++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c
> b/drivers/usb/dwc3/dwc3-imx8mp.c
> index 1c8fe657b3a9..5a96b66bf237 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -36,10 +36,22 @@
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
>  	int				irq;
> @@ -47,6 +59,42 @@ struct dwc3_imx8mp {
>  	bool				wakeup_pending;
>  };
>=20
> +static void imx8mp_configure_glue(struct dwc3_imx8mp *dwc3_imx)
> +{
> +	struct device *dev =3D dwc3_imx->dev;
> +	u32 value;
> +
> +	if (!dwc3_imx->glue_base)
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

I think you don't need a value update&write if property is not present.

> +
> +	writel(value, dwc3_imx->glue_base + USB_CTRL1);
> +}
> +
>  static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
>  {
>  	struct dwc3	*dwc3 =3D platform_get_drvdata(dwc3_imx->dwc3);
> @@ -100,6 +148,7 @@ static int dwc3_imx8mp_probe(struct platform_device
> *pdev)
>  	struct device		*dev =3D &pdev->dev;
>  	struct device_node	*dwc3_np, *node =3D dev->of_node;
>  	struct dwc3_imx8mp	*dwc3_imx;
> +	struct resource		*res;

Looks like this is not used anywhere, remove it.

>  	int			err, irq;
>=20
>  	if (!node) {
> @@ -119,6 +168,15 @@ static int dwc3_imx8mp_probe(struct platform_device
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
> @@ -152,6 +210,8 @@ static int dwc3_imx8mp_probe(struct platform_device
> *pdev)
>  	}
>  	dwc3_imx->irq =3D irq;
>=20
> +	imx8mp_configure_glue(dwc3_imx);
> +
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
>  	err =3D pm_runtime_get_sync(dev);
> @@ -252,6 +312,8 @@ static int __maybe_unused dwc3_imx8mp_resume(struct
> dwc3_imx8mp *dwc3_imx,
>  	dwc3_imx8mp_wakeup_disable(dwc3_imx);
>  	dwc3_imx->pm_suspended =3D false;
>=20
> +	imx8mp_configure_glue(dwc3_imx);
> +

I guess this is to restore the settings if we experienced a power lost,
Please add some comments.

thanks
Li Jun

>  	if (dwc3_imx->wakeup_pending) {
>  		dwc3_imx->wakeup_pending =3D false;
>  		if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE) {
> --
> 2.25.1

