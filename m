Return-Path: <linux-usb+bounces-4525-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCA981C67B
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 09:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDD1E1F234B0
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 08:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2648D53F;
	Fri, 22 Dec 2023 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="e9bYd+2c"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2042.outbound.protection.outlook.com [40.107.241.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC93DF56
	for <linux-usb@vger.kernel.org>; Fri, 22 Dec 2023 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqnxnpQgaCCfqfz0ekieh6EbJIQzsWZWMft4B7ilcZKxD4E/u2ZzSOS0H3e6FRIQlAU6h00RLPJy9JX1p2g1CZyI5wNPywzzVfWlY6JuXqur4KB4OgJjDoRFLjPSJdec4oTY4pFIJpKtJB1DV6NEZGgiV9rUPdHEja/Cyt2DghoGnNNVncsSbjouXh3uLWhmW6101gAi0TfJtxrCf2xN4pYb9mAYpx8y9Rrc5wNaBVlqMeGzo5P2S2tlyTOIGrwe0VtVIMYTTku3zallLgtkL+ybJrGEVEWP4lLMGjSuLrl/iWdfwExAtO9OLtyfIQsoKuGVS2J5hewxOIHJWisijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcG8T6GJX7/L6mGvIRP4+9IEn9F5xH/o5vnlJQrF+l4=;
 b=ZjawCb+eOE2y45z3fhRTWp5Sj3KhQFO4hzfG9OUx3eZ+2AFHnp5nN0I/3Enm0mjrxuiL3u9F1y9dVQ8sRoEQ+9kH9QLNQ395CetWZClrVQ9/oxjjPfguJ6iaLYA/j5u7XPZjKsoxYyptnTEghcs1PpBVjshc+6VLX8Up+GjGfmEs+U8wk43f/4ePiy4cI5zuoStysIndstBTqnusuitBR96DVaFLpIxRkdEqL15TNilwgXg2mY1YNk8Cp4hHDNr4KYGCZYHCOtvtEmRPeDgSiDsZpNBU7i+kesuvjXFzIzC8v9ZXIzHBHcRBVfwUqX3U1n6SYHVqHqeo6e7PWdGYxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcG8T6GJX7/L6mGvIRP4+9IEn9F5xH/o5vnlJQrF+l4=;
 b=e9bYd+2cYOFelqs6DnbYASyfyDeP04U2dwPpsf/SIHHpSxyIvkXirSC6qoctFDxndr94ivB0G62DWZWyCqhU657heX79TdkQ0AxIWUonfCK1JBPHFmbP2shDHsJrZ05BH6+eZ0fDgmxVTitC1nrEqqP83sb/1YBGFzhFloeRbY0=
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by AM9PR04MB8226.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 08:24:04 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7113.016; Fri, 22 Dec 2023
 08:24:04 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Peter Chen <peter.chen@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>, "luca.ceresoli@bootlin.com"
	<luca.ceresoli@bootlin.com>, Jun Li <jun.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v2 1/3] usb: chipidea: ci_hdrc_imx: add wakeup
 clock and keep it always on
Thread-Topic: [EXT] Re: [PATCH v2 1/3] usb: chipidea: ci_hdrc_imx: add wakeup
 clock and keep it always on
Thread-Index: AQHaMXidaochZRVhaU62l10hAgCT17C0rkIAgABNg8A=
Date: Fri, 22 Dec 2023 08:24:04 +0000
Message-ID:
 <DB7PR04MB5146CBDACACF5D85114A7AB08C94A@DB7PR04MB5146.eurprd04.prod.outlook.com>
References: <20231218061420.3460145-1-xu.yang_2@nxp.com>
 <20231222034026.GA1951375@nchen-desktop>
In-Reply-To: <20231222034026.GA1951375@nchen-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5146:EE_|AM9PR04MB8226:EE_
x-ms-office365-filtering-correlation-id: a9b7e06b-7176-472f-e57f-08dc02c75c37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 41+3lJEtUjpxGT1Fh53JLF6kNxhOQJ7vEOAJ879pyJPHTqVwGXU+wU8Vgov5LpGE2knZhL0zxbtNMqWcqUyFd5ADKyllRU6guyy3uOfp9potTe99fagvpCOTmIPzylzBEouWH8UX4JNhh3Ja1SNmYftAI21lPKqX1mcJQiGYGWQzmNMO+xHRCYj6nP8cJUjifZ02RMeDTGSzSCve4wOGjquNXH5ktM40bRcANZrHUbwzu0GdY6ngDtYSyqgY4m4T7Oc9hsc/zucnAKbmfgeG0BN7yAEnTz4v6c1gdwxM7XmKRTNgUbDE90pd8pUTCELW/6ErMErlNQgt8ncj0F6GFSGeysftIZdDcZJ1xOshoAJ3Zf1ZFQL6b2e4Yi4r5VTAmaLJ7uhnEn7ivwHdBWnGa4zMOLOfKWrbtyCVzjhfvPk2dJuJqqDPqHWXANvIH+aVgi45sLJQEQw+OLlrXmt9lka+cOxAfhGBt9H4pNGQGV3vNYclkYd549Aj65OnmK1erWYWcaYI6t4AYTPACB4NtSn8EiGrMuwnF/76p+Nar7DKlg0/HSHh7XvDCMeH/3V1AuBvbu/0taRHHc2CCM75lYniOQ7jD9xES/lX6ERh/poFBTZkTqHpnyamWUe/bF3q
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38100700002)(83380400001)(38070700009)(122000001)(41300700001)(55016003)(33656002)(86362001)(26005)(71200400001)(9686003)(7696005)(6506007)(53546011)(478600001)(316002)(66556008)(6916009)(76116006)(66946007)(66476007)(66446008)(64756008)(54906003)(52536014)(8676002)(8936002)(4326008)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nSnm2w59pYBj1ZGAt+SrmoASU17/fvJ0D74USF0H6hSD4QLJuoiSq+T0RV4g?=
 =?us-ascii?Q?r5+GeatJO87h8/Zuje01/yuI9zyjBXvGQsgW88vrIyO/9F1P9K5iew8vdYPb?=
 =?us-ascii?Q?w9rF/TsT1XDsvQaSUeGdK64cKN6ZHb7eK4R72SPmmOe4FSUkK6VHajOSw93l?=
 =?us-ascii?Q?MeI8gX0oB1ZLCLPzSX/tB/jIHNC6ucxQqOGrrIEc7bu8dEwJuBI1Gj8a+mqM?=
 =?us-ascii?Q?AHI/tHjCvfp1PAosNGFSzjzuIRg/xqHVuqDH0FhZdDVm/e/T6/sBSixdlwfs?=
 =?us-ascii?Q?tC6TzHa4hL9lXh/DuM+gINpIja2YAgzGP3lGCM0RLr3T5O0Ks0L5HApWaBwC?=
 =?us-ascii?Q?+Tr3los5lKZARV9sZ9Ruwwe3rb4G+eB7h5lc0sD6tmUqObIh8Oku52B5i8V/?=
 =?us-ascii?Q?A6gfojEM2DN7E3gF3QfDMvCeEipe1Je/fJDN3miFKtArIAMG5Hp0h8ZlzR1/?=
 =?us-ascii?Q?Jou56v+Jx8Fq5o8Yecj0l4ItBW5REAVnrqcHM3M/zRWkM9Wkh0VIsb9gyH7g?=
 =?us-ascii?Q?7xkRVRcxLh3l5c46lW/qvkxhG7u/amyoQBbQdqvw4vdCjzazYnOVX3t/f/3n?=
 =?us-ascii?Q?DQ4DPS/jIJBKjq5iXR6l8kVhDnRQI+GMFZoa7+A217GIRDgwvpqbSZQ+B5Ib?=
 =?us-ascii?Q?l6XlIQbmjuycSqBqiEsX1S6NZ2/slXEROyV3C5SCPXXRcJO3JrzHz/jiw3yy?=
 =?us-ascii?Q?JkL/OhlOnK8cuIOW1hiTFJKRqmbMqlKPxM4XOJZg3GXgNRghKr6hxpQyxPA0?=
 =?us-ascii?Q?/SANwabs5HmiFXn04TzpF2iRmfmNq69ak/dVLg7L5JFTthaWci7mL2885/E+?=
 =?us-ascii?Q?Lh2jSakoaClN6Wq1F1njrYrYyNrWDXNGMYDHnf9xce4LKJYhybLiU6/NhWPB?=
 =?us-ascii?Q?UwAwPLF4TK2D2aEHv/T+2XPz18YcL26Iz4/y09tKjU+9nP6ddmZL61iGu1XY?=
 =?us-ascii?Q?ddhGoHDlOWb1RA1/46ImiGDJIya6cBa1jtX73lFZo7nyCfYdgLXWW+NMqiye?=
 =?us-ascii?Q?hW6JW2m2cnoe1Z+ypLa4xxMTeGvQdyUzItR4XfI0m/jjOxxsOukLoXEPPRVM?=
 =?us-ascii?Q?dgKTS0H5MoZbVSe7kmVAdObnclUhccfluCSESdq75Az/qssrwSAjQt/9cAqC?=
 =?us-ascii?Q?JHdVdFbdnW5S5kZzc7It0XmcAsbUmVEZBQ1kWhKvhpszUVkqbTUYzd+Zv/ST?=
 =?us-ascii?Q?G7nSwjPGRjkaue9Pin/TFhQ21R7Bi620WEkMOxsz2mpHzmP8aUl83MfoiNqf?=
 =?us-ascii?Q?C/93SK2BLX9lM8iiKbAYF6bWBAb9zgvoZNoBrl0EJqJ1Yj919vv935FWwJsY?=
 =?us-ascii?Q?qloIZTdOnwLlMPc3ZxdJLYJhTQPTQZjNmsVA1oZw17EGIospJ2RKirasK3Fp?=
 =?us-ascii?Q?Ty6fSQuizP7sEWCtHT0YD+vh51btsiTv90zAaoX/4bWF0ke8XKWEKCu+9obj?=
 =?us-ascii?Q?URaaEBMh+ZvJY5oAUZcFEND4B2os8QzYaTT5A+FEw+G9b0J5L0NBoDM6XIFq?=
 =?us-ascii?Q?v3UzaeDxv2QAxmYDjbBVikkx71eUmox407Q0HcKHePfdCxNKyU1pk4xsRg5N?=
 =?us-ascii?Q?xuSEy0gvV4A1QJFyGqY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b7e06b-7176-472f-e57f-08dc02c75c37
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2023 08:24:04.8549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jy+jp8uMWWHFQT4FC+RKrREB/IXVK6zUEEPviNjVan+0DRP8vkctRipsmrHqyGirEfsxHqK+2txTECjgZgWEDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8226

Hi Peter,

>=20
> On 23-12-18 14:14:18, Xu Yang wrote:
> > Some platform using ChipIdea IP  may keep 32KHz wakeup clock always
> > on without usb driver intervention. And some may need driver to handle
> > this clock. For now only i.MX93 needs this wakeup clock. This patch wil=
l
> > get wakeup clock and keep it always on to make controller work properly=
.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v2:
> >  - modify commit msg to make it clear
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 22 +++++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/=
ci_hdrc_imx.c
> > index e28bb2f2612d..4330be8240ff 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -96,6 +96,7 @@ struct ci_hdrc_imx_data {
> >       struct usb_phy *phy;
> >       struct platform_device *ci_pdev;
> >       struct clk *clk;
> > +     struct clk *clk_wakeup;
> >       struct imx_usbmisc_data *usbmisc_data;
> >       bool supports_runtime_pm;
> >       bool override_phy_control;
> > @@ -199,7 +200,7 @@ static int imx_get_clks(struct device *dev)
> >
> >       data->clk_ipg =3D devm_clk_get(dev, "ipg");
> >       if (IS_ERR(data->clk_ipg)) {
> > -             /* If the platform only needs one clocks */
> > +             /* If the platform only needs one primary clock */
> >               data->clk =3D devm_clk_get(dev, NULL);
> >               if (IS_ERR(data->clk)) {
> >                       ret =3D PTR_ERR(data->clk);
> > @@ -208,6 +209,18 @@ static int imx_get_clks(struct device *dev)
> >                               PTR_ERR(data->clk), PTR_ERR(data->clk_ipg=
));
> >                       return ret;
> >               }
> > +             /* Get wakeup clock. Not all of the platforms need to
> > +              * handle this clock. So make it optional.
> > +              */
> > +             data->clk_wakeup =3D devm_clk_get_optional(dev,
> > +                                                      "usb_wakeup_clk"=
);
> > +             if (IS_ERR(data->clk_wakeup)) {
> > +                     ret =3D PTR_ERR(data->clk_wakeup);
> > +                     dev_err(dev,
> > +                             "Failed to get wakeup clk, err=3D%ld\n",
> > +                             PTR_ERR(data->clk_wakeup));
> > +                     return ret;
> > +             }
> >               return ret;
> >       }
> >
> > @@ -423,6 +436,10 @@ static int ci_hdrc_imx_probe(struct platform_devic=
e *pdev)
> >       if (ret)
> >               goto disable_hsic_regulator;
> >
> > +     ret =3D clk_prepare_enable(data->clk_wakeup);
> > +     if (ret)
> > +             goto err_wakeup_clk;
> > +
>=20
> Better add at function imx_prepare_enable_clks()
>=20
> >       data->phy =3D devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
> >       if (IS_ERR(data->phy)) {
> >               ret =3D PTR_ERR(data->phy);
> > @@ -504,6 +521,8 @@ static int ci_hdrc_imx_probe(struct platform_device=
 *pdev)
> >  disable_device:
> >       ci_hdrc_remove_device(data->ci_pdev);
> >  err_clk:
> > +     clk_disable_unprepare(data->clk_wakeup);
> > +err_wakeup_clk:
>=20
>=20
> Better add clk_disable_unprepare for wakeup clk at function
> imx_disable_unprepare_clks();

According to IC degin's suggestion, 32K clock should be enabled
all the time. Since imx_prepare_enable_clks and imx_disable_unprepare_clks(=
)
will be dynamiclly called in runtime/system PM cases,  I don't want
32K clock go though such path. Therefore, I didn't put clk_prepare_enable/
clk_disable_unprepare() in that functions.

Thanks,
Xu Yang

>=20
> Peter
>=20
> >       imx_disable_unprepare_clks(dev);
> >  disable_hsic_regulator:
> >       if (data->hsic_pad_regulator)
> > @@ -530,6 +549,7 @@ static void ci_hdrc_imx_remove(struct platform_devi=
ce *pdev)
> >               usb_phy_shutdown(data->phy);
> >       if (data->ci_pdev) {
> >               imx_disable_unprepare_clks(&pdev->dev);
> > +             clk_disable_unprepare(data->clk_wakeup);
> >               if (data->plat_data->flags & CI_HDRC_PMQOS)
> >                       cpu_latency_qos_remove_request(&data->pm_qos_req)=
;
> >               if (data->hsic_pad_regulator)
> > --
> > 2.34.1
> >
> >
>=20
> --
>=20
> Thanks,
> Peter Chen

