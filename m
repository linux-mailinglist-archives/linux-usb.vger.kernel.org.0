Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBAFBAD410
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2019 09:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfIIHnK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Sep 2019 03:43:10 -0400
Received: from mail-eopbgr20076.outbound.protection.outlook.com ([40.107.2.76]:7687
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726026AbfIIHnJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Sep 2019 03:43:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVSXAaReQypYnhhq34qRoJLeM9KwzNb9UZUn/wruoCaL1BpbRncqL1nViS+eyRnTdYwpdY+uiU+uWjdlFvklBSsfeFZBtmHL20M/8Xv1ocf3Tvp/V6EPHEzxlY6ZHY07tq5oRcoTKBqgA0GhCcEy5GPafpBlRwSzr4A3Omj+gaYNbJhqPxmEipASMpbh8NaqHljCvPdM0447tKZUJWsDzpB0fVfWMmv5ins2KPDIauWJl5RkPV2gHRU8Uzh2MkX3uRd8MEbgQctmsy1dj1wpvowX/FdnWuwLLiUWKscR9Vpao+CLAXVy31IqzCyUknrkek/uIQzfTvTqg6qgIxxVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPVU6Iazy6VkigvwGVPA+rInwEd+zMG7RN0ronO9nlw=;
 b=fVU5bZDZy4wLhoSUqcn/mgDq8+7PAT4LcFLsdFZzK/Fm2trrB5zHFZkm5WvFhOI/ywFW2LFgrmWuGyNOVvVmmJ/pRDeGms46iWiqJ/GnEc3tGn315rnQLqGsgvtlXX+x5+aA0y9KorlhwsFyu6Dtloq/XCeWkC/sIseXIFCLhRiIVfDWdbq2mHa0cTfXkik0BSwxAMDwyxjxkWnmfEeQxnAIUFSdVHL6Z0D/NrlpZRS+VkjMCkdbxf/paNCtF6dirhYVUyGK1f/UhrTRP887D2RcWijTMX9hiH5kTjQHC7FnoCZOQTeg01b5CiN8Zpdi+FF3gvka261E6a0302ZbvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPVU6Iazy6VkigvwGVPA+rInwEd+zMG7RN0ronO9nlw=;
 b=NoSiaJM1r4xxkeulpcUHm0nqwzMrTuusWmhzF6/XVGa6SJQhv7qy+S7mg0+W7FxwayIRSVz+3fNUQLi68M9L5B8dflhaGvKmtaB+AmjyWIjHKnqvbXlVielnJiRwTgZ237SJz2No94y3o30bGXw8Su/TvmA73QNL+WP7w+l9Z9M=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3294.eurprd04.prod.outlook.com (10.170.231.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Mon, 9 Sep 2019 07:43:03 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 07:43:03 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: chipidea: imx: enable vbus and id wakeup only for
 OTG events
Thread-Topic: [PATCH v2] usb: chipidea: imx: enable vbus and id wakeup only
 for OTG events
Thread-Index: AQHVZtsQK1VTBzu6b0m471SCOVDAJKci9t6A
Date:   Mon, 9 Sep 2019 07:43:03 +0000
Message-ID: <20190909074337.GA22414@b29397-desktop>
References: <20190909064141.15643-1-jun.li@nxp.com>
In-Reply-To: <20190909064141.15643-1-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0effd7e-5d40-4266-1997-08d734f958a4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3294;
x-ms-traffictypediagnostic: VI1PR04MB3294:|VI1PR04MB3294:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB329432B5FFE4F6B3DB1A71F38BB70@VI1PR04MB3294.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(136003)(396003)(366004)(346002)(376002)(39860400002)(189003)(199004)(6506007)(6862004)(102836004)(7736002)(11346002)(486006)(86362001)(256004)(476003)(2906002)(54906003)(1076003)(14444005)(44832011)(8936002)(6636002)(33656002)(81166006)(8676002)(229853002)(6486002)(5660300002)(99286004)(76176011)(6512007)(66066001)(9686003)(3846002)(14454004)(6116002)(33716001)(26005)(25786009)(53546011)(478600001)(66946007)(66446008)(66556008)(186003)(64756008)(71200400001)(91956017)(76116006)(66476007)(53936002)(446003)(6436002)(316002)(6246003)(71190400001)(4326008)(81156014)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3294;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p2SEGLpE9lAIyemou7JgY/p2785pPSFybY2iFJowxhmaCeISpTxo76A3EF5wZAeTXDp3cSjhuxtWjd0JMfTXA/dr61gCrPfi74PysVwyEUAn0iMxdYJp5cUZyuapKENHdy4XbtsmfmrbL/SksS5p5tZOln5Gi0IIdtVYpO8DgiU83hNixr9I686j+FRt5E/dRvPax4nRp5NgO+6FztF/5bGAD3xwTeUKV0ABFVJtIWiztQoQHiQHRcNfVCAGbAOLQxknHqDO9FuMdcSSqFAQt5gkTSxyCidpGvrJrKvgQetHHO6ZqRwvryqVqRqBd6JMg3KGrEJFNjXR8b3DYEmhYiX60sn48pyk0i7KeY/Q/6615wCqG1mLFAOM2D30T+kMcrHLnv7vsN7D3Y/Vxgr7goQ7c6XuSF5Aj/myuk92dS8=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <45E92A38E28A9D479BA2E307A3711C19@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0effd7e-5d40-4266-1997-08d734f958a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 07:43:03.3765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uTeXoA9OijwLoJyWZOk1R7VW6ffQ29RHbeYLEbTbt2InMXJJMVrqfLEG5XygMRils014ORERJ1rHOiL28bbIqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3294
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-09-09 14:41:41, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
>=20
> If ID or VBUS is from external block, don't enable its wakeup
> because it isn't used at all.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c |  8 ++++++++
>  drivers/usb/chipidea/ci_hdrc_imx.h |  2 ++
>  drivers/usb/chipidea/usbmisc_imx.c | 31 +++++++++++++++++++++++--------
>  3 files changed, 33 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci=
_hdrc_imx.c
> index e783604..b11d70f 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -433,6 +433,14 @@ static int ci_hdrc_imx_probe(struct platform_device =
*pdev)
>  		goto err_clk;
>  	}
> =20
> +	if (!IS_ERR(pdata.id_extcon.edev) ||
> +	    of_property_read_bool(np, "usb-role-switch"))
> +		data->usbmisc_data->ext_id =3D 1;
> +
> +	if (!IS_ERR(pdata.vbus_extcon.edev) ||
> +	    of_property_read_bool(np, "usb-role-switch"))
> +		data->usbmisc_data->ext_vbus =3D 1;
> +
>  	ret =3D imx_usbmisc_init_post(data->usbmisc_data);
>  	if (ret) {
>  		dev_err(dev, "usbmisc post failed, ret=3D%d\n", ret);
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci=
_hdrc_imx.h
> index c842e03..de2aac9 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.h
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.h
> @@ -22,6 +22,8 @@ struct imx_usbmisc_data {
>  	unsigned int evdo:1; /* set external vbus divider option */
>  	unsigned int ulpi:1; /* connected to an ULPI phy */
>  	unsigned int hsic:1; /* HSIC controlller */
> +	unsigned int ext_id:1; /* ID from exteranl event */
> +	unsigned int ext_vbus:1; /* Vbus from exteranl event */
>  };
> =20
>  int imx_usbmisc_init(struct imx_usbmisc_data *data);
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/us=
bmisc_imx.c
> index 078c1fd..e81e33c 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -100,6 +100,9 @@
>  #define MX7D_USB_VBUS_WAKEUP_SOURCE_BVALID	MX7D_USB_VBUS_WAKEUP_SOURCE(2=
)
>  #define MX7D_USB_VBUS_WAKEUP_SOURCE_SESS_END	MX7D_USB_VBUS_WAKEUP_SOURCE=
(3)
> =20
> +#define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKE=
UP | \
> +				 MX6_BM_ID_WAKEUP)
> +
>  struct usbmisc_ops {
>  	/* It's called once when probe a usb device */
>  	int (*init)(struct imx_usbmisc_data *data);
> @@ -330,14 +333,25 @@ static int usbmisc_imx53_init(struct imx_usbmisc_da=
ta *data)
>  	return 0;
>  }
> =20
> +static u32 usbmisc_wakeup_setting(struct imx_usbmisc_data *data)
> +{
> +	u32 wakeup_setting =3D MX6_USB_OTG_WAKEUP_BITS;
> +
> +	if (data->ext_id)
> +		wakeup_setting &=3D ~MX6_BM_ID_WAKEUP;
> +
> +	if (data->ext_vbus)
> +		wakeup_setting &=3D ~MX6_BM_VBUS_WAKEUP;
> +
> +	return wakeup_setting;
> +}
> +
>  static int usbmisc_imx6q_set_wakeup
>  	(struct imx_usbmisc_data *data, bool enabled)
>  {
>  	struct imx_usbmisc *usbmisc =3D dev_get_drvdata(data->dev);
>  	unsigned long flags;
>  	u32 val;
> -	u32 wakeup_setting =3D (MX6_BM_WAKEUP_ENABLE |
> -		MX6_BM_VBUS_WAKEUP | MX6_BM_ID_WAKEUP);
>  	int ret =3D 0;
> =20
>  	if (data->index > 3)
> @@ -346,11 +360,12 @@ static int usbmisc_imx6q_set_wakeup
>  	spin_lock_irqsave(&usbmisc->lock, flags);
>  	val =3D readl(usbmisc->base + data->index * 4);
>  	if (enabled) {
> -		val |=3D wakeup_setting;
> +		val &=3D ~MX6_USB_OTG_WAKEUP_BITS;
> +		val |=3D usbmisc_wakeup_setting(data);
>  	} else {
>  		if (val & MX6_BM_WAKEUP_INTR)
>  			pr_debug("wakeup int at ci_hdrc.%d\n", data->index);
> -		val &=3D ~wakeup_setting;
> +		val &=3D ~MX6_USB_OTG_WAKEUP_BITS;
>  	}
>  	writel(val, usbmisc->base + data->index * 4);
>  	spin_unlock_irqrestore(&usbmisc->lock, flags);
> @@ -547,17 +562,17 @@ static int usbmisc_imx7d_set_wakeup
>  	struct imx_usbmisc *usbmisc =3D dev_get_drvdata(data->dev);
>  	unsigned long flags;
>  	u32 val;
> -	u32 wakeup_setting =3D (MX6_BM_WAKEUP_ENABLE |
> -		MX6_BM_VBUS_WAKEUP | MX6_BM_ID_WAKEUP);
> =20
>  	spin_lock_irqsave(&usbmisc->lock, flags);
>  	val =3D readl(usbmisc->base);
>  	if (enabled) {
> -		writel(val | wakeup_setting, usbmisc->base);
> +		val &=3D ~MX6_USB_OTG_WAKEUP_BITS;
> +		val |=3D usbmisc_wakeup_setting(data);
> +		writel(val, usbmisc->base);
>  	} else {
>  		if (val & MX6_BM_WAKEUP_INTR)
>  			dev_dbg(data->dev, "wakeup int\n");
> -		writel(val & ~wakeup_setting, usbmisc->base);
> +		writel(val & ~MX6_USB_OTG_WAKEUP_BITS, usbmisc->base);
>  	}
>  	spin_unlock_irqrestore(&usbmisc->lock, flags);
> =20
> --=20
> 2.7.4
>=20

This patch is ok for me, I will queue it from next -rc1.=20

--=20

Thanks,
Peter Chen=
