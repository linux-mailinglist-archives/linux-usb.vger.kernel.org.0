Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323113DD006
	for <lists+linux-usb@lfdr.de>; Mon,  2 Aug 2021 07:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhHBF3f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Aug 2021 01:29:35 -0400
Received: from mail-vi1eur05on2067.outbound.protection.outlook.com ([40.107.21.67]:47392
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229457AbhHBF3e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Aug 2021 01:29:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvkEzgnuE7eY2evl1ZM9EOJgGEvxUQSGpV0Z27PraVD6QZ3PW6yGC0NXMTixY/+BbaC8W5HDsXJM97UkT7ttwNAEetfqVXGq3PKKX5HSQeVLswd/E6pkMH37adYQMm5tlN8tC4OhmNL6uwQyas8eKmXCkWraWTrdukWLICG9QKxIP4QukSV2ni+X8nH2jnGqbCKw31C3QFfnhkJ95TIsz+t2W0Bu5DGdqyxxv/ForHYkAK3toUmdMjILGMKTQwCyuJJ4iOvBB6ySu6wjHXQIGYYPHmjGpFU40jy2M4WsCEUzvEJtatiR3DD8JktwUwjgz7OTPTWj4ZPHfAl45Uw5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAtyg1KTMfXpEJ8oP7Reg042DVNhQ7uCNsqvBoV+1HI=;
 b=UGDrGvAzDUR3MDHD7LcJU1iQ39wcDbFTq0pF7mIigGK6sEBMECoi5LtsZJCWnARcq+io2r7sgFTi3oeazZWnCKMAYFcY91TuAHHH7h7cPKVKe+ehMRC/zvEBU5/qchTPhakKYgKsQsvv6gJDgdhixMr+0Gr1HkpaT432IiGuLedkDVGPNbUvd8gP2LZkhyVdd4BEi2THIdhb4s1TpfK70iaazeTDC8zBWwCprtIP6f2o/yZDjXkoJi0bgPfVCG1Ej/PgQUf4V6XuJLKULcfLHkZcftCyCwFbp59c9/qf1VNnfJk78VcZlAW7sNrKlV1cvlqR7ZwaH0T9WoWuoH1c7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAtyg1KTMfXpEJ8oP7Reg042DVNhQ7uCNsqvBoV+1HI=;
 b=bFo236VhuHagUY0c79uRWJE9IGlCj4nC3aZcNWHdhTiD+JFa+d3BJhANaGJOWB+hPTqGv/cKCQ5zKpWvAY7UAxnvIP7M7/MpwKGvtePHqH9JHxTCTVHsEdb0wun3pDyw0UqRWBuYfPjkT+XI/5X3QqHPCOOhoa5L9ra0HgfCxUc=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VE1PR04MB7262.eurprd04.prod.outlook.com (2603:10a6:800:1ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Mon, 2 Aug
 2021 05:29:22 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::60f5:9b63:9cc9:203a]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::60f5:9b63:9cc9:203a%4]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 05:29:22 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Topic: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Index: AQHXPZBCXEuCoO+pyECjB5N281Vfw6rMuUwAgAANexCAAA1OAIAJgi+AgAA3u4CAAQ3rcIAGYAEAgAANUVCAAAsqgIBveweQ
Date:   Mon, 2 Aug 2021 05:29:22 +0000
Message-ID: <VI1PR04MB59351ED2E6FFEC074D9F9A2B89EF9@VI1PR04MB5935.eurprd04.prod.outlook.com>
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
In-Reply-To: <87o8dhfwo8.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c691248-7a36-4747-aa24-08d955767c33
x-ms-traffictypediagnostic: VE1PR04MB7262:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB72622567C906B49F6F7987EB89EF9@VE1PR04MB7262.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v0MtmspB0svepafVeTsuN4OgT/fa7k2nZK2t9F3s9QHGSPKVvxY1+ZdBHSFlegz6pzaSggnOP5kOvMdW+Tg+gUpsuf6LcMEdEUoZOzrF1CWQJhrg5OBEah7aqT2UGow9xVNb04Qt9wkHGm1ElKI9Dnvs+qTfM3LOy2HL+2U9YjIyUUm792Kiem/cjOqf7wPZA3j/nHgYW7cJdnCk6cZUPUCSdPAH+/wkJCIlcIEz1tRTZwk0OxDEu9yFrQbIRF37LzXJUajdxocIPP9aniMauquii3nXN2XZhbzGFJR/fiHWjpe8wR1+F1m3j8cqjfrkGBJ2wsfrTExT8ZqGX8cmIuFe0wpC2tQPs0LYvaqtN701JAmLncWFYCYAoKYJ8QBpWz9UAS+j8nFCiauiqbu1/47DybuIdNBjV4+LR1UamfwKyI32/8dJcLZ02C2Km479mHRxMAHJK5OnVDQcuFupmBpu8eOsV0hAjgda7nHBWHvs2Jp+UkvdnOPcJyM2b5nm/khdZtsLhgKEqa91PSkVbJJdkNK2SbUfiIMSm7etMwqbLetYZwtM28x7rg1Pt/a2xPRs+YbFD4yDd37GlOmigTc5h9sZqJ/w7Wla68zhAlpCR0oaA0+iVrD9GOoxh3qZvEFmpPZmYZeyP7LTufdW2NVw5MhDxOvlaED1sOvF6etvgG123PB2OpTWZN1rbKRMxIfHDtMb/AAgC1qVNpUMlIh9M++ALE/r9xm3CPG9C4Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(8676002)(5660300002)(54906003)(110136005)(53546011)(8936002)(6506007)(71200400001)(316002)(52536014)(86362001)(2906002)(44832011)(38100700002)(122000001)(4326008)(7696005)(66476007)(66556008)(66946007)(26005)(33656002)(30864003)(66446008)(55016002)(9686003)(38070700005)(186003)(83380400001)(64756008)(76116006)(478600001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Yap0rFi8We1QvSV1CNPz8PkmTWseMRRKBzn63NZSSrD3/prSiPO27MQFLBWq?=
 =?us-ascii?Q?RiiPGohlc0lBIEAeOmSh/IHaH3kqMVYwc+o2rVGk3fqSXrbQhXgSGY5dQXZM?=
 =?us-ascii?Q?MGpdjwMVeiEHQxg12abnnWVFtE6rWzfHTviuQ4Xqzwn14NSo/9i/Kao3X4hE?=
 =?us-ascii?Q?0m/iX+2cA2chgrjHzn9VbiQ3WNspqus5AngVFyeJwCYXsea5SlGPkVRK4Klb?=
 =?us-ascii?Q?f9tR+Jf+pB682YdAFgFngFMl3pFScxk4oyMRhdYUY+JAcT2AkjKB41BROD7R?=
 =?us-ascii?Q?dLHvLIOCa47TTcz4v/7opQ+XevcaQDDfXlquK/jWdpnfdPp2GgJeIULAh0QK?=
 =?us-ascii?Q?PjkIHnL/C6RUhjVnlz1WRJ5WdTeC+l+mLlbKU191uL5akOMtuv/iK6RF9yVX?=
 =?us-ascii?Q?uaVdfDpixA0IUd8U3uV/EfqabhLDvoYudH5g8w4e0sRvs6doArCVQXtI2YWu?=
 =?us-ascii?Q?/+WjzsorMZ8Gex7iiNTnrlmaehAU0OE95jswUXbMs7jSaUi+QuymwfC0Qqye?=
 =?us-ascii?Q?470ytahMF7+5L0KeZkEhLTe9zy1Zh/rQFd+uqsXTYFxQsO+U3K3PDdDXRVpY?=
 =?us-ascii?Q?47JrPrvZC7nOazsY8iGYSuxyxAxcz+hAhEWbICFKLZzUC4d1BWH098nBqIV/?=
 =?us-ascii?Q?iOd5Ybjr31nll7OyOQB9mbXcaiom8fVIv3rXBm7xuOuWMI1fxjxPsySXqRnz?=
 =?us-ascii?Q?hRc/TlASe+2VKKdG5d4/dn3KWvud71EyMAx0691T5d2U6GSTp1aSX4awjba/?=
 =?us-ascii?Q?aT9k/X/FGuiNKstdOpWerCFgw5FCoMBllS4MDk4tHBohTr+OJqLMJ/QPS745?=
 =?us-ascii?Q?6UHv5Lmx0VhQgHVbPNpsu8DdpyJTpMjBx8pj8znNUyfi8qCGI9cC4KDCRMQF?=
 =?us-ascii?Q?U4jNfYQFjnYonOzu/2UO7HYg8MVeNPQN4DbFc+jDgEnuWfwWjZImfhVdRTbc?=
 =?us-ascii?Q?ZEBA/wE58wSYKiEJQph45765DQh+dkZ1Qgpc96NtyX0VkZbtGJa3h2oaUAvY?=
 =?us-ascii?Q?oNdjm7FAkKckZiKSzblciQ1EfwEBFamTLbWJfciFUBQP99HMkrjKDqhS9oEg?=
 =?us-ascii?Q?5bSPEWtbElAxeTyV+m6PjhsYEbOkPw/PHzurxF7ZxqlNZ6iW+m1lNW2jfBZY?=
 =?us-ascii?Q?9T55SRMLyL4NLPF5JknvKlmDS6YsHjP++PLWKrPtG5hXSXje2EWEaLkQQ5bG?=
 =?us-ascii?Q?y3rdFvM58hbj3dNkHhYDi17aLU+XAu6/AlWMPYQHgfPIhfMmsFezFinp6mzA?=
 =?us-ascii?Q?7okGUkXQtPYd2PH31JfPpn7yFh14Wb8L+zKseiOke/F4U7W3KosnzcjyQtkP?=
 =?us-ascii?Q?dMfUJ8L7W50+42WHZXvJPvNe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c691248-7a36-4747-aa24-08d955767c33
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 05:29:22.6858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svoXGrVRufzIFQp4E065j1WFc3juQmFwMYGfxjzCMAGoPnZHnlo+wGx57OT7elzh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7262
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
> -----Original Message-----
> From: Felipe Balbi <balbi@kernel.org>
> Sent: Tuesday, May 11, 2021 5:27 PM
> To: Jun Li <jun.li@nxp.com>; Heikki Krogerus
> <heikki.krogerus@linux.intel.com>
> Cc: gregkh@linuxfoundation.org; shawnguo@kernel.org; dl-linux-imx
> <linux-imx@nxp.com>; thunder.leizhen@huawei.com;
> linux-usb@vger.kernel.org
> Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compati=
ble
> string
>=20
>=20
> Hi,
>=20
> Jun Li <jun.li@nxp.com> writes:
> >> > > > Good suggestion, but if extcon notifier listener can't work for
> >> > > > me, my understanding is this *teach* in glue layer driver still
> >> > > > need access
> >> > > > dwc3 core instance struct, right?
> >> > >
> >> > > for now, maybe. But it may be better to implement a notifier
> >> > > method in role switch class.
> >> >
> >> > I am not sure if introduce notifier in role switch class is a good
> >> > idea, I had the impression extcon is not encouraged to use if possib=
le.
> >>
> >> I'm not against role switch notifiers. They were proposed before
> >> already couple of years ago, but at that time there just were no
> >> users them notifier, so the patch was just dropped from the series [1]=
.
> >> But I don't think anybody was against the idea. Please feel free to
> >> add them to the class if you have use for them.
> >
> > So I had the incorrect impression.
> >
> > Yes, that's the Felipe was referring to, I think.
> >
> > I will pick up [1] and improve my driver as Felipe suggested.
>=20
> sounds great, thahnks Li Jun

Got chance to check this, but it turns out this glue driver
still has to be care of the dwc3 core and its probe completion,
because the role switch class is created by dwc3 core in its
probe.

dev_pm_set_dedicated_wake_irq() is a good solution for case
a sperate/glue driver is not required, in my imx8mp case, I
need a glue driver anyway, so this seems can't make my driver
much simpler. Rough change please see below: =20

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mp.dtsi
index 9f7c7f587d38..bcb63bcf27be 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -874,7 +874,6 @@ usb3_0: usb@32f10100 {
 			clocks =3D <&clk IMX8MP_CLK_HSIO_ROOT>,
 				 <&clk IMX8MP_CLK_USB_ROOT>;
 			clock-names =3D "hsio", "suspend";
-			interrupts =3D <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
 			dma-ranges =3D <0x40000000 0x40000000 0xc0000000>;
@@ -891,7 +890,9 @@ usb_dwc3_0: usb@38100000 {
 				assigned-clocks =3D <&clk IMX8MP_CLK_HSIO_AXI>;
 				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_500M>;
 				assigned-clock-rates =3D <500000000>;
-				interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+							<GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names =3D "irq", "wakeup";
 				phys =3D <&usb3_phy0>, <&usb3_phy0>;
 				phy-names =3D "usb2-phy", "usb3-phy";
 				snps,dis-u2-freeclk-exists-quirk;
@@ -915,7 +916,6 @@ usb3_1: usb@32f10108 {
 			clocks =3D <&clk IMX8MP_CLK_HSIO_ROOT>,
 				 <&clk IMX8MP_CLK_USB_ROOT>;
 			clock-names =3D "hsio", "suspend";
-			interrupts =3D <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
 			dma-ranges =3D <0x40000000 0x40000000 0xc0000000>;
@@ -932,7 +932,9 @@ usb_dwc3_1: usb@38200000 {
 				assigned-clocks =3D <&clk IMX8MP_CLK_HSIO_AXI>;
 				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_500M>;
 				assigned-clock-rates =3D <500000000>;
-				interrupts =3D <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts =3D <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+							<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names =3D "irq", "wakeup";
 				phys =3D <&usb3_phy1>, <&usb3_phy1>;
 				phy-names =3D "usb2-phy", "usb3-phy";
 				snps,dis-u2-freeclk-exists-quirk;
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index b6871ee5e8ca..4dac7cd98a31 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1615,6 +1615,12 @@ static int dwc3_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
=20
+	dwc->wakeup_irq =3D platform_get_irq_byname_optional(pdev, "wakeup");
+	if (dwc->wakeup_irq =3D=3D -EPROBE_DEFER)
+		goto assert_reset;
+	else
+		dev_err(dwc->dev, "the wakeup irq No. is %d\n", dwc->wakeup_irq);
+
 	ret =3D clk_bulk_prepare_enable(dwc->num_clks, dwc->clks);
 	if (ret)
 		goto assert_reset;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1c85f40a8dd8..264ae7def903 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -32,6 +32,7 @@
 #include <linux/phy/phy.h>
=20
 #include <linux/power_supply.h>
+#include <linux/pm_wakeirq.h>
=20
 #define DWC3_MSG_MAX	500
=20
@@ -1295,6 +1296,7 @@ struct dwc3 {
 	int			max_cfg_eps;
 	int			last_fifo_depth;
 	int			num_ep_resized;
+	int			wakeup_irq;
 };
=20
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.=
c
index 756faa46d33a..76f83fe64e4b 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -38,29 +38,24 @@
=20
 struct dwc3_imx8mp {
 	struct device			*dev;
-	struct platform_device		*dwc3;
 	void __iomem			*glue_base;
 	struct clk			*hsio_clk;
 	struct clk			*suspend_clk;
-	int				irq;
+	enum usb_role			role;
+	struct notifier_block		notifier;
 	bool				pm_suspended;
-	bool				wakeup_pending;
 };
=20
 static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
 {
-	struct dwc3	*dwc3 =3D platform_get_drvdata(dwc3_imx->dwc3);
-	u32		val;
-
-	if (!dwc3)
-		return;
+	u32 val;
=20
 	val =3D readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
=20
-	if ((dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc3->xhci)
+	if (dwc3_imx->role =3D=3D USB_ROLE_HOST)
 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
 		       USB_WAKEUP_U3_EN | USB_WAKEUP_DPDM_EN;
-	else if (dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
+	else if (dwc3_imx->role =3D=3D USB_ROLE_DEVICE)
 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
 		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
=20
@@ -76,23 +71,16 @@ static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8=
mp *dwc3_imx)
 	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL);
 }
=20
-static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
+static int dwc3_imx8mp_role_event(struct notifier_block *nb,
+				  unsigned long event, void *ptr)
 {
-	struct dwc3_imx8mp	*dwc3_imx =3D _dwc3_imx;
-	struct dwc3		*dwc =3D platform_get_drvdata(dwc3_imx->dwc3);
+	struct dwc3_imx8mp *dwc3_imx;
=20
-	if (!dwc3_imx->pm_suspended)
-		return IRQ_HANDLED;
-
-	disable_irq_nosync(dwc3_imx->irq);
-	dwc3_imx->wakeup_pending =3D true;
+	dwc3_imx =3D container_of(nb, struct dwc3_imx8mp, notifier);
=20
-	if ((dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
-		pm_runtime_resume(&dwc->xhci->dev);
-	else if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
-		pm_runtime_get(dwc->dev);
+	dwc3_imx->role =3D event;
=20
-	return IRQ_HANDLED;
+	return NOTIFY_DONE;
 }
=20
 static int dwc3_imx8mp_probe(struct platform_device *pdev)
@@ -100,7 +88,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pde=
v)
 	struct device		*dev =3D &pdev->dev;
 	struct device_node	*dwc3_np, *node =3D dev->of_node;
 	struct dwc3_imx8mp	*dwc3_imx;
-	int			err, irq;
+	int			err;
=20
 	if (!node) {
 		dev_err(dev, "device node not found\n");
@@ -145,20 +133,6 @@ static int dwc3_imx8mp_probe(struct platform_device *p=
dev)
 		goto disable_hsio_clk;
 	}
=20
-	irq =3D platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		err =3D irq;
-		goto disable_clks;
-	}
-	dwc3_imx->irq =3D irq;
-
-	err =3D devm_request_threaded_irq(dev, irq, NULL, dwc3_imx8mp_interrupt,
-					IRQF_ONESHOT, dev_name(dev), dwc3_imx);
-	if (err) {
-		dev_err(dev, "failed to request IRQ #%d --> %d\n", irq, err);
-		goto disable_clks;
-	}
-
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 	err =3D pm_runtime_get_sync(dev);
@@ -177,13 +151,6 @@ static int dwc3_imx8mp_probe(struct platform_device *p=
dev)
 		dev_err(&pdev->dev, "failed to create dwc3 core\n");
 		goto err_node_put;
 	}
-
-	dwc3_imx->dwc3 =3D of_find_device_by_node(dwc3_np);
-	if (!dwc3_imx->dwc3) {
-		dev_err(dev, "failed to get dwc3 platform device\n");
-		err =3D -ENODEV;
-		goto depopulate;
-	}
 	of_node_put(dwc3_np);
=20
 	device_set_wakeup_capable(dev, true);
@@ -191,14 +158,11 @@ static int dwc3_imx8mp_probe(struct platform_device *=
pdev)
=20
 	return 0;
=20
-depopulate:
-	of_platform_depopulate(dev);
 err_node_put:
 	of_node_put(dwc3_np);
 disable_rpm:
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
-disable_clks:
 	clk_disable_unprepare(dwc3_imx->suspend_clk);
 disable_hsio_clk:
 	clk_disable_unprepare(dwc3_imx->hsio_clk);
@@ -224,12 +188,54 @@ static int dwc3_imx8mp_remove(struct platform_device =
*pdev)
 	return 0;
 }
=20
+static int dwc3_imx8mp_register_notifier(struct dwc3_imx8mp *dwc3_imx)
+{
+	struct device_node	*dwc3_np, *node =3D dwc3_imx->dev->of_node;
+	struct platform_device	*dwc3_pdev;
+	struct dwc3		*dwc3;
+	int			err;
+
+	dwc3_np =3D of_get_compatible_child(node, "snps,dwc3");
+	if (!dwc3_np) {
+		err =3D -ENODEV;
+		dev_err(dwc3_imx->dev, "failed to find dwc3 core child\n");
+		return err;
+	}
+
+	dwc3_pdev =3D of_find_device_by_node(dwc3_np);
+	if (!dwc3_pdev) {
+		dev_err(dwc3_imx->dev, "failed to get dwc3 platform device\n");
+		err =3D -ENODEV;
+		return err;
+	}
+	of_node_put(dwc3_np);
+
+	dwc3 =3D platform_get_drvdata(dwc3_pdev);
+	if (!dwc3)
+		return 0;
+
+	if (!IS_ERR_OR_NULL(dwc3->role_sw)) {
+		dwc3_imx->notifier.notifier_call =3D dwc3_imx8mp_role_event;
+		err =3D usb_role_switch_register_notifier(dwc3->role_sw,
+							&dwc3_imx->notifier);
+		if (err < 0) {
+			dev_err(dwc3_imx->dev, "failed to register notifier\n");
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 static int __maybe_unused dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx=
,
 					      pm_message_t msg)
 {
 	if (dwc3_imx->pm_suspended)
 		return 0;
=20
+	if (!dwc3_imx->notifier.notifier_call)
+		dwc3_imx8mp_register_notifier(dwc3_imx);
+
 	/* Wakeup enable */
 	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc3_imx->dev))
 		dwc3_imx8mp_wakeup_enable(dwc3_imx);
@@ -242,31 +248,18 @@ static int __maybe_unused dwc3_imx8mp_suspend(struct =
dwc3_imx8mp *dwc3_imx,
 static int __maybe_unused dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx,
 					     pm_message_t msg)
 {
-	struct dwc3	*dwc =3D platform_get_drvdata(dwc3_imx->dwc3);
 	int ret =3D 0;
=20
 	if (!dwc3_imx->pm_suspended)
 		return 0;
=20
+	if (!dwc3_imx->notifier.notifier_call)
+		dwc3_imx8mp_register_notifier(dwc3_imx);
+
 	/* Wakeup disable */
 	dwc3_imx8mp_wakeup_disable(dwc3_imx);
 	dwc3_imx->pm_suspended =3D false;
=20
-	if (dwc3_imx->wakeup_pending) {
-		dwc3_imx->wakeup_pending =3D false;
-		if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE) {
-			pm_runtime_mark_last_busy(dwc->dev);
-			pm_runtime_put_autosuspend(dwc->dev);
-		} else {
-			/*
-			 * Add wait for xhci switch from suspend
-			 * clock to normal clock to detect connection.
-			 */
-			usleep_range(9000, 10000);
-		}
-		enable_irq(dwc3_imx->irq);
-	}
-
 	return ret;
 }
=20
@@ -277,9 +270,7 @@ static int __maybe_unused dwc3_imx8mp_pm_suspend(struct=
 device *dev)
=20
 	ret =3D dwc3_imx8mp_suspend(dwc3_imx, PMSG_SUSPEND);
=20
-	if (device_may_wakeup(dwc3_imx->dev))
-		enable_irq_wake(dwc3_imx->irq);
-	else
+	if (!device_may_wakeup(dwc3_imx->dev))
 		clk_disable_unprepare(dwc3_imx->suspend_clk);
=20
 	clk_disable_unprepare(dwc3_imx->hsio_clk);
@@ -293,9 +284,7 @@ static int __maybe_unused dwc3_imx8mp_pm_resume(struct =
device *dev)
 	struct dwc3_imx8mp *dwc3_imx =3D dev_get_drvdata(dev);
 	int ret;
=20
-	if (device_may_wakeup(dwc3_imx->dev)) {
-		disable_irq_wake(dwc3_imx->irq);
-	} else {
+	if (!device_may_wakeup(dwc3_imx->dev)) {
 		ret =3D clk_prepare_enable(dwc3_imx->suspend_clk);
 		if (ret)
 			return ret;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e56f1a6db2de..4ac9d262e608 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2666,6 +2666,16 @@ static int dwc3_gadget_start(struct usb_gadget *g,
 	dwc->gadget_driver	=3D driver;
 	spin_unlock_irqrestore(&dwc->lock, flags);
=20
+	if (dwc->wakeup_irq > 0) {
+		ret =3D dev_pm_set_dedicated_wake_irq(dwc->dev,
+						    dwc->wakeup_irq);
+		if (ret) {
+			dev_err(dwc->dev, "set wakeup irq %d failed\n",
+				dwc->wakeup_irq);
+			return ret;
+		}
+	}
+
 	return 0;
 }
=20
@@ -2681,6 +2691,7 @@ static int dwc3_gadget_stop(struct usb_gadget *g)
 	struct dwc3		*dwc =3D gadget_to_dwc(g);
 	unsigned long		flags;
=20
+	dev_pm_clear_wake_irq(dwc->dev);
 	spin_lock_irqsave(&dwc->lock, flags);
 	dwc->gadget_driver	=3D NULL;
 	dwc->max_cfg_eps =3D 0;
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index f29a264635aa..3df0523906e5 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -121,6 +121,17 @@ int dwc3_host_init(struct dwc3 *dwc)
 		goto err;
 	}
=20
+	if (dwc->wakeup_irq > 0) {
+		ret =3D dev_pm_set_dedicated_wake_irq(&xhci->dev,
+						    dwc->wakeup_irq);
+		if (ret) {
+			dev_err(dwc->dev, "set wakeup irq %d failed\n",
+				dwc->wakeup_irq);
+			goto err;
+		}
+		dev_err(&xhci->dev, "wakeup irq of xhci set OK.\n");
+	}
+
 	return 0;
 err:
 	platform_device_put(xhci);
@@ -129,5 +140,6 @@ int dwc3_host_init(struct dwc3 *dwc)
=20
 void dwc3_host_exit(struct dwc3 *dwc)
 {
+	dev_pm_clear_wake_irq(&dwc->xhci->dev);
 	platform_device_unregister(dwc->xhci);
 }
--=20
2.25.1


Thanks
Li Jun
>=20
> --
> balbi
