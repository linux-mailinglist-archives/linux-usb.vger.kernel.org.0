Return-Path: <linux-usb+bounces-21153-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C9DA482C0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 16:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 693241620F9
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 15:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF05A26A0E0;
	Thu, 27 Feb 2025 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="QI/N+cXC";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XCT95LYj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0A226A0D1;
	Thu, 27 Feb 2025 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740669192; cv=none; b=lfsfdruH/64K3uTZjyWWVSk7rvmIu6saH3s3GDIfKerHYYuFi5FwoTkqZL8Kn68MLs09yQPACqKc8sN3fFyUNqB2aI9HvKr0rg56hOn0tMwoWUKNrqJc/UsAtdR5aTvKbQwuHCJDpupP7OEAUsYmdP0XL9U3oymue6PuDBqGv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740669192; c=relaxed/simple;
	bh=Ebo1D+qhHUtxEcyGrH6l87OSOYXmFcOkbBlyWyxUH48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OJBI94d/d8rXXhFFcHnWUGLGTceMBjY4fG3QI7dGJX71BHBK9ga+0KVMgKtAXTnNxL9fRhUQbzagrRJW4s4+efX3M8RA3Z7EjyRQqN3lvaZJoprD/HBMKiM46Hu2Q2ZcJcGEh05lWyjRXz5Wf62tELn8Xkb7h5skQxYIRLRxUxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=QI/N+cXC; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XCT95LYj reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740669189; x=1772205189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EGpRzef4zc2oMS+ASfAqf5PDwYtAhxLCbzjZY2eYK6U=;
  b=QI/N+cXCIyYMSDgzkQvAV3Ewq5CYwh4xcdiDIPdZCRFmO7q3CFHs+Ns3
   up6wDugfSDA40zH8YOBUIQAXJ8LP2TSqovAGLfZW6t8JeOKf+nBay89sp
   m40xSuHYljGTIgYuYyUEnkRjg4jc2NxM6hsp8Gm2N3lBoTAh4XpptWcC3
   +C/2bKTY6Gz8vDqqTTeFVXaFQ9Rcpf+uSl3AqgaegDdIu/TDv5GBIu21Z
   XkAeiDyz5+R3TTd5/tRamR75NkQTFH8mG3y4egVJqZ9Zp59xy3ziBnjNE
   zP3dIOzAw5pLd2QzN/sqKSRRHfoB81gzlzxH57+iHLofhxBmWWPjlaWV3
   g==;
X-CSE-ConnectionGUID: /aNcGYtsSHyNX+s4U6/78Q==
X-CSE-MsgGUID: B+TdOs+lQHKPKObxoPT0eg==
X-IronPort-AV: E=Sophos;i="6.13,320,1732575600"; 
   d="scan'208";a="42152492"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Feb 2025 16:13:00 +0100
X-CheckPoint: {67C080FC-3-F75C4246-F0BD6D90}
X-MAIL-CPID: 754BCE0AD125F3AA8351D0BDD97B028B_3
X-Control-Analysis: str=0001.0A002118.67C080FD.001C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B5AC1671BA;
	Thu, 27 Feb 2025 16:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740669175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGpRzef4zc2oMS+ASfAqf5PDwYtAhxLCbzjZY2eYK6U=;
	b=XCT95LYjbowhMn9NFW+iSN+umpRZVA+D3nxDiWbZKtdz1aUleW4VIoBRj2eraQKpz3Izdg
	9RR5qASGUx4AWtyXCoByGC1cQ867Kq0s5CZq/HAxeG4P+ogLoTCqmUu1NIpfoKBmcZ6KU/
	aA/hm7tpDqC+/jmHAKEVrTyzffeZGaruibEfqFVhgPEwz/Z5HGk0Br9q9VAenJPth+XSQ0
	e6C621D1kQd07mHdgQnrSZNlBqtDKd/hmp73UKS8VoK/BBcZhAbxlOsWOnqAXLVeatRGFI
	6fvERCg84sIGGS3QB14FOSI5ZZJBA7H7M13s5OD7zdzGcGwT+P4DlEhmOTg1PA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com
Subject:
 Re: [PATCH v3 4/6] usb: chipidea: imx: add HSIO Block Control wakeup setting
Date: Thu, 27 Feb 2025 16:12:54 +0100
Message-ID: <3535014.QJadu78ljV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250227095348.837223-5-xu.yang_2@nxp.com>
References:
 <20250227095348.837223-1-xu.yang_2@nxp.com>
 <20250227095348.837223-5-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Donnerstag, 27. Februar 2025, 10:53:46 CET schrieb Xu Yang:
> On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
> Control:
>=20
> HSIO Block Control Overview:
> - The HSIO block control include configuration and status registers that
>   provide miscellaneous top-level controls for clocking, beat limiter
>   enables, wakeup signal enables and interrupt status for the PCIe and USB
>   interfaces.
>=20
> The wakeup function of HSIO blkctl is basically same as non-core, except
> improvements about power lost cases. This will add the wakeup setting for
> HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory, then do
> wakeup setting as needs.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>=20
> ---
> Changes in v3:
>  - remove usbmisc_imx95_init(), use usbmisc_imx7d_init()
> Changes in v2:
>  - add Rb tag
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 72 ++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>=20
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/us=
bmisc_imx.c
> index 1394881fde5f..8c30908c11ed 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -139,6 +139,22 @@
>  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKE=
UP | \
>  				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
> =20
> +/*
> + * HSIO Block Control Register
> + */
> +
> +#define BLKCTL_USB_WAKEUP_CTRL		0x0
> +#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
> +#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
> +#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
> +#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
> +#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
> +
> +#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
> +					 BLKCTL_OTG_ID_WAKEUP_EN   | \
> +					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
> +					 BLKCTL_OTG_DPDM_WAKEUP_EN)
> +
>  struct usbmisc_ops {
>  	/* It's called once when probe a usb device */
>  	int (*init)(struct imx_usbmisc_data *data);
> @@ -159,6 +175,7 @@ struct usbmisc_ops {
> =20
>  struct imx_usbmisc {
>  	void __iomem *base;
> +	void __iomem *blkctl;
>  	spinlock_t lock;
>  	const struct usbmisc_ops *ops;
>  };
> @@ -1016,6 +1033,41 @@ static int usbmisc_imx6sx_power_lost_check(struct =
imx_usbmisc_data *data)
>  		return 0;
>  }
> =20
> +static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
> +{
> +	u32 wakeup_setting =3D BLKCTL_WAKEUP_SOURCE;
> +
> +	if (data->ext_id || data->available_role !=3D USB_DR_MODE_OTG)
> +		wakeup_setting &=3D ~BLKCTL_OTG_ID_WAKEUP_EN;
> +
> +	if (data->ext_vbus || data->available_role =3D=3D USB_DR_MODE_HOST)
> +		wakeup_setting &=3D ~BLKCTL_OTG_VBUS_WAKEUP_EN;
> +
> +	/* Select session valid as VBUS wakeup source */
> +	wakeup_setting |=3D BLKCTL_OTG_VBUS_SESSVALID;
> +
> +	return wakeup_setting;
> +}
> +
> +static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool =
enabled)
> +{
> +	struct imx_usbmisc *usbmisc =3D dev_get_drvdata(data->dev);
> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +	val =3D readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> +	val &=3D ~BLKCTL_WAKEUP_SOURCE;
> +
> +	if (enabled)
> +		val |=3D usbmisc_blkctl_wakeup_setting(data);
> +
> +	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);

usbmisc->blkctl is NULL if DT does not provide a 2nd IORESOURCE_MEM.

> +
> +	return 0;
> +}
> +
>  static const struct usbmisc_ops imx25_usbmisc_ops =3D {
>  	.init =3D usbmisc_imx25_init,
>  	.post =3D usbmisc_imx25_post,
> @@ -1068,6 +1120,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_op=
s =3D {
>  	.power_lost_check =3D usbmisc_imx7d_power_lost_check,
>  };
> =20
> +static const struct usbmisc_ops imx95_usbmisc_ops =3D {
> +	.init =3D usbmisc_imx7d_init,
> +	.set_wakeup =3D usbmisc_imx95_set_wakeup,
> +	.charger_detection =3D imx7d_charger_detection,
> +	.power_lost_check =3D usbmisc_imx7d_power_lost_check,
> +	.vbus_comparator_on =3D usbmisc_imx7d_vbus_comparator_on,
> +};
> +
>  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
>  {
>  	struct imx_usbmisc *usbmisc =3D dev_get_drvdata(data->dev);
> @@ -1289,6 +1349,10 @@ static const struct of_device_id usbmisc_imx_dt_id=
s[] =3D {
>  		.compatible =3D "fsl,imx8ulp-usbmisc",
>  		.data =3D &imx7ulp_usbmisc_ops,
>  	},
> +	{
> +		.compatible =3D "fsl,imx95-usbmisc",
> +		.data =3D &imx95_usbmisc_ops,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> @@ -1296,6 +1360,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
>  static int usbmisc_imx_probe(struct platform_device *pdev)
>  {
>  	struct imx_usbmisc *data;
> +	struct resource *res;
> =20
>  	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
> @@ -1307,6 +1372,13 @@ static int usbmisc_imx_probe(struct platform_devic=
e *pdev)
>  	if (IS_ERR(data->base))
>  		return PTR_ERR(data->base);
> =20
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (res) {
> +		data->blkctl =3D devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(data->blkctl))
> +			return PTR_ERR(data->blkctl);
> +	}
> +

Any chance to ensure imx95 has actually data->blkctl?

Best regards
Alexander

>  	data->ops =3D of_device_get_match_data(&pdev->dev);
>  	platform_set_drvdata(pdev, data);
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



