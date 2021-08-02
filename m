Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2A83DD422
	for <lists+linux-usb@lfdr.de>; Mon,  2 Aug 2021 12:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233273AbhHBKnq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Aug 2021 06:43:46 -0400
Received: from mail-vi1eur05on2048.outbound.protection.outlook.com ([40.107.21.48]:64810
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233218AbhHBKnp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Aug 2021 06:43:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+CB3m1DZl4zhadMNHusYvX5UAWXpXfyY+rDrqGXd9cnm4474aV6A4aaIRTopvOdIZfodM4VMLqda1p/3RVJq8LYkmnGft9c2C2/4Apz8KPItDbXTbz40UfhinYdmoAVNxyTQpp65hmz/looYTScl4aqiKKweb1GVaCOpxx80mXZEm10hJoxSZDJi3N8G78FTPDgVTXwhyhqHLU353lxRUX2tyAOhwLzr1JBLaogMabOeAE7TaKqBAjCwOUInU5IC0iGGmg0wCiNbfbiQPFt6vfpfZT5Ao6h4w532DABfQ+B/YnRvibNhY+t7HWnmtX190VcW877E4ye457TuBcamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXKtWDp3SUXBwptqbft/wtE5x/Iryhl6KHOWYLzELiE=;
 b=HBH2ZP32AheYCxvrh7OWqmN9xV3fh+X2RVieJTONleADLQdh7D3fAd4a0zFxYWvUmAbOLIRdqSnyYac3Bd7caj/lqhxtYep+YkuY5DhglpFLKrOcDQ2mrBVHsGsGi0EZc/48kYRB5itEIh6YVi5a8plX/xeC+9Qy13kmgld7V1zSB+9CBsOAOyuWs4B7jW6HY9P0OWPmQafFEEOhs4Z2NuaWSG4R7PmwEMJcZHLF/3AFmzBLOCNeJVfngafkZo2uUCBtBj+WpW1BjggI7VkxGzjeh6enZNw/fk28q66OshPZWBZzmw5UNWn8Q4sa6Lv3CDRDla4hiskzUYfg/TezcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXKtWDp3SUXBwptqbft/wtE5x/Iryhl6KHOWYLzELiE=;
 b=d1MPjfL2Sj3XIwq3IQSNbk+h+dmWybaQ4YRwCbk+wD2oEdENa2UDRbSt1S6C/JJP7SBqvCM+sYXu9OqlkV3FjoUuJdKq4j4AHGn5fZXvoU6AEzjDaPV295WUyyWQITschSEoYy7xsxgvRmniRxqkLgLpYLmlpiolDa/+LGGosRU=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB6781.eurprd04.prod.outlook.com (2603:10a6:803:13d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 10:43:33 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::60f5:9b63:9cc9:203a]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::60f5:9b63:9cc9:203a%4]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 10:43:33 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Topic: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Index: AQHXPZBCXEuCoO+pyECjB5N281Vfw6rMuUwAgAANexCAAA1OAIAJgi+AgAA3u4CAAQ3rcIAGYAEAgAANUVCAAAsqgIBveweQgBLbLQCAABzmEA==
Date:   Mon, 2 Aug 2021 10:43:33 +0000
Message-ID: <VI1PR04MB5935330399EF9C0BEE57E48389EF9@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
 <8735v8ji31.fsf@kernel.org>
 <VI1PR04MB5935F1D26E1F281B7273993F895E9@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87r1ishz2t.fsf@kernel.org>
 <VI1PR04MB5935825AD977B4180894541589589@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87h7jggch0.fsf@kernel.org>
 <VI1PR04MB59354B7D5843B612D50937B589579@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <YJo5Tl7SDuv4Yu6D@kuha.fi.intel.com>
 <VI1PR04MB5935DE5731476311DE94009A89539@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87o8dhfwo8.fsf@kernel.org>
 <VI1PR04MB59351ED2E6FFEC074D9F9A2B89EF9@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87czqws2up.fsf@kernel.org>
In-Reply-To: <87czqws2up.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e10d2ee-304b-4973-7620-08d955a26051
x-ms-traffictypediagnostic: VI1PR04MB6781:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6781FE4E9957C6FEF67B93B589EF9@VI1PR04MB6781.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y9hOn+RZamlkMzyvymhuKoWh8HSEnKJn7aJK6Do4EhxhK7eeoBvuvNc3PmIjgzQxL8MWKxEKaS8SFpusly3wW6evUE+lQIYcZW9yWJj+ey4HrtP+BRmJOb44oK3oaGXGDPFRFMAdP69VD3tm843Y1AM6jPQXRQjPqOY/mS4WRHLiBPpF363Z5EUz4fTWMwhK/Q4zr6ppuY3vVI3+eaDFN9t4IoNBZOaK/jxc/bMADNPbwxRrudDdoX5ubalApB/rl4FXDcD30V7u52lIwsfLWwkgFHPVCJ6PMHbvrxtu0kGRZ2n35bCFyE4px+vDx4Y1AFrmki/iTFVsclAxIwjNdL0hDr5YczrRn8L8Bwbft/303Vm6xtC/EuDj8ADkW2HDOLPoHOXiWnDZ4zScl1qx4Ne+WinbRiSD+tHZYNfjUS+M0v+2eCgz/WfA3UkLzMP5V4uBeABNLiE01LVj+9cehTcxcamEKvLPJk86dHc0OGNlQl26dA0hGynv9wgK25F44fXSqiXSv5zqY9ZUF7BfAkNCeZG9ykApk3NB0Mnj+Ovx89aKF7h8WNd4S/0hQHSAv95849gRP7OvHHUeNvcaLAx3N3oThZONL178AOMiryoU8AAV7BMZtLeVcwNSkvyURJYnWtRicIbFgmlG3aj8ltLtwav62Z1F9Q8z1uL8LH4xcCWEWrSQX9g8spMrCRUR6fGYyt6klZBPXdKFNursz/63Fctwyk0jt+XOA6+HG80=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(186003)(33656002)(54906003)(316002)(5660300002)(26005)(6916009)(2906002)(44832011)(4326008)(38100700002)(122000001)(86362001)(9686003)(52536014)(55016002)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(8936002)(8676002)(53546011)(83380400001)(38070700005)(7696005)(71200400001)(6506007)(478600001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t+h11Qv84DcieAbbTEMpw4TjgbFIVcaj5sGLRQUnkBMX5p3tdZINcITazTQv?=
 =?us-ascii?Q?+oj7kjxga2Z0qzKIeMVLv2WfgsArGipgQ1sOgjv7zbHNREDI39Gp4F0UDLO6?=
 =?us-ascii?Q?UkHbb8I7B5yn08dZM6bNyTpQL6Vg3nKmTcmVJu/xz1EHE8FUOurpsuPji3SB?=
 =?us-ascii?Q?IxpkUFidwqExtrO8AnhilJ3QT/zpYBejff1/TLvHLimkw3ipKG1b7ozm5V6k?=
 =?us-ascii?Q?nnlkc7ke/C77O23vZ1GKrhjVDp05HApE7k1TVrFUJNJya0CH16yrNq7XT/Dx?=
 =?us-ascii?Q?bWVlCUCugUuCboEgBRaZ0O4cvvQB7tUMXODWq94V3hgoDYlry8aj4mGzrPR9?=
 =?us-ascii?Q?r28yR8zYlA2scXxbqefNJNORSX2NOvUxA/FfKbV7QjrYqEtbY9IzNm1aa3CH?=
 =?us-ascii?Q?2eabgELu82ed5yUbC8OwiXTNwVNyLJIRLjLzzfsQuReFJFu3rPmotgG2YtfN?=
 =?us-ascii?Q?3KYnWANWewhgJUOmlEAX/X8QUzKZkWqfthJ1EqWGmdeRfwywtKjy0YRB68B7?=
 =?us-ascii?Q?+I0TT5F8pSmKddgJ0DZvFYUzr1n+hwljtiOmhHqrMGivcyglunVlO0ZhVrro?=
 =?us-ascii?Q?VjziXJkz/NKOZ5NcYCtQCL87Ki0nml0u4A8XduW5VFU3cVeguNDDHMV4i0Ct?=
 =?us-ascii?Q?jvfosLm2NvbbkJ7jjPdlLcHgutEQTHHKwHqcsMGE0WpZS0FYnYx/kNsNYZsm?=
 =?us-ascii?Q?Oycam1XkYe9I6G4x1D6hmzdCMRMymu90gpL2fxjN0y0oSoU2zosKSl1FvnmL?=
 =?us-ascii?Q?6CVLMG1zvuu6OOk0ZxyTldOxy0tcgAex5GZK8i6hStJHDy+k8EuYpXXCeKBk?=
 =?us-ascii?Q?lnn8ln7OSIiktj+QyuZwaJgzjvhDAHx9nSOjdHZBbWYX3YCvFEDxOVN+Qsyi?=
 =?us-ascii?Q?AvrDCwwgN8GIKWZtUUfE8ZYs0eLAoEjRDSquqHMOZfJHkQvpAXy8e5aamx58?=
 =?us-ascii?Q?I42/CNIWcPcfghnUxrkJ5WnWL5oSxbwHoCrmG1ocl3DXRgtHaXJS/FppYYWp?=
 =?us-ascii?Q?CJhWUAl1S2kdmLZV5Af1ewNGkBVGRdipF1Ht1KcDAjSL3wbiwqowRoFEdcHs?=
 =?us-ascii?Q?50YSJesEEzghoshbfS94bHA8nlv0APSlMY549v9Zl56FKdccy6I9SNnz2/2w?=
 =?us-ascii?Q?hOB/nKb/8TxPX6nNZF5DXQfFDAeq2yHX/ZTdXppYLI/WGYqr06md6gol9hj9?=
 =?us-ascii?Q?Pg/ZhBA9nYx6wLVkblDpUfp8gX6rN/Liv9dz4M71TH0YLUW90LX4tZRWeWYx?=
 =?us-ascii?Q?L+p4tMrjRZcqZTmHHR8YGt5hTWeRjHX3f2RxvMFBsIbhx4eV+rK46y2ZVlsm?=
 =?us-ascii?Q?2LwvGbzLc77B20BvXuG3bCC2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e10d2ee-304b-4973-7620-08d955a26051
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 10:43:33.7730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iXKov34uoyYDoeNCZg5ay/2Xv1pqO8kmrfolQLgNoA/VabLiX9x4hXyi8u/LNoRF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6781
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Felipe Balbi <balbi@kernel.org>
> Sent: Monday, August 2, 2021 3:49 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>;
> gregkh@linuxfoundation.org; shawnguo@kernel.org; dl-linux-imx
> <linux-imx@nxp.com>; thunder.leizhen@huawei.com;
> linux-usb@vger.kernel.org
> Subject: Re: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compati=
ble
> string
>=20
>=20
> Hi,
>=20
> Jun Li <jun.li@nxp.com> writes:
> >> Jun Li <jun.li@nxp.com> writes:
> >> >> > > > Good suggestion, but if extcon notifier listener can't work
> >> >> > > > for me, my understanding is this *teach* in glue layer
> >> >> > > > driver still need access
> >> >> > > > dwc3 core instance struct, right?
> >> >> > >
> >> >> > > for now, maybe. But it may be better to implement a notifier
> >> >> > > method in role switch class.
> >> >> >
> >> >> > I am not sure if introduce notifier in role switch class is a
> >> >> > good idea, I had the impression extcon is not encouraged to use i=
f
> possible.
> >> >>
> >> >> I'm not against role switch notifiers. They were proposed before
> >> >> already couple of years ago, but at that time there just were no
> >> >> users them notifier, so the patch was just dropped from the series
> [1].
> >> >> But I don't think anybody was against the idea. Please feel free
> >> >> to add them to the class if you have use for them.
> >> >
> >> > So I had the incorrect impression.
> >> >
> >> > Yes, that's the Felipe was referring to, I think.
> >> >
> >> > I will pick up [1] and improve my driver as Felipe suggested.
> >>
> >> sounds great, thahnks Li Jun
> >
> > Got chance to check this, but it turns out this glue driver still has
> > to be care of the dwc3 core and its probe completion, because the role
> > switch class is created by dwc3 core in its probe.
> >
> > dev_pm_set_dedicated_wake_irq() is a good solution for case a
> > sperate/glue driver is not required, in my imx8mp case, I need a glue
> > driver anyway, so this seems can't make my driver much simpler. Rough
> > change please see below:
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index 9f7c7f587d38..bcb63bcf27be 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -874,7 +874,6 @@ usb3_0: usb@32f10100 {
> >  			clocks =3D <&clk IMX8MP_CLK_HSIO_ROOT>,
> >  				 <&clk IMX8MP_CLK_USB_ROOT>;
> >  			clock-names =3D "hsio", "suspend";
> > -			interrupts =3D <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> >  			#address-cells =3D <1>;
> >  			#size-cells =3D <1>;
> >  			dma-ranges =3D <0x40000000 0x40000000 0xc0000000>; @@ -891,7 +890,9
> > @@ usb_dwc3_0: usb@38100000 {
> >  				assigned-clocks =3D <&clk IMX8MP_CLK_HSIO_AXI>;
> >  				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_500M>;
> >  				assigned-clock-rates =3D <500000000>;
> > -				interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> > +							<GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupt-names =3D "irq", "wakeup";
> >  				phys =3D <&usb3_phy0>, <&usb3_phy0>;
> >  				phy-names =3D "usb2-phy", "usb3-phy";
> >  				snps,dis-u2-freeclk-exists-quirk; @@ -915,7 +916,6 @@
> usb3_1:
> > usb@32f10108 {
> >  			clocks =3D <&clk IMX8MP_CLK_HSIO_ROOT>,
> >  				 <&clk IMX8MP_CLK_USB_ROOT>;
> >  			clock-names =3D "hsio", "suspend";
> > -			interrupts =3D <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> >  			#address-cells =3D <1>;
> >  			#size-cells =3D <1>;
> >  			dma-ranges =3D <0x40000000 0x40000000 0xc0000000>; @@ -932,7 +932,9
> > @@ usb_dwc3_1: usb@38200000 {
> >  				assigned-clocks =3D <&clk IMX8MP_CLK_HSIO_AXI>;
> >  				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_500M>;
> >  				assigned-clock-rates =3D <500000000>;
> > -				interrupts =3D <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupts =3D <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> > +							<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupt-names =3D "irq", "wakeup";
> >  				phys =3D <&usb3_phy1>, <&usb3_phy1>;
> >  				phy-names =3D "usb2-phy", "usb3-phy";
> >  				snps,dis-u2-freeclk-exists-quirk; diff --git
> > a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c index
> > b6871ee5e8ca..4dac7cd98a31 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1615,6 +1615,12 @@ static int dwc3_probe(struct platform_device *pd=
ev)
> >  	if (ret)
> >  		return ret;
> >
> > +	dwc->wakeup_irq =3D platform_get_irq_byname_optional(pdev, "wakeup");
> > +	if (dwc->wakeup_irq =3D=3D -EPROBE_DEFER)
> > +		goto assert_reset;
> > +	else
> > +		dev_err(dwc->dev, "the wakeup irq No. is %d\n", dwc->wakeup_irq);
>=20
> why is this an error?

Forget to remove this debug purpose log, sorry.

Li Jun=20

>=20
> --
> balbi
