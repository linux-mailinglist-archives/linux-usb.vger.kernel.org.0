Return-Path: <linux-usb+bounces-21179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C35A49216
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 08:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58F8D168710
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 07:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9001C701D;
	Fri, 28 Feb 2025 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Hz2ViURM";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ogRXbwIh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFDA276D12;
	Fri, 28 Feb 2025 07:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727353; cv=none; b=ZbEoK18r3emxq2FXlf+VUK5/a3mnmgPZJJgg2Awta/T3v6Dwoo4Bvey8GrsJCZoPH0UqcD4cM//5fB/vCv61qiLcA0DG/w9fA6Uw1Ua0w34+hPTX5zzzVXuAAGOb37mF+GAbaXkE7eyT6G4yobiCkxO60hRKVR8YeQXqoIyFEE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727353; c=relaxed/simple;
	bh=bhxd/KfCNKiM9vyi/5pp6JzKN+UPILhE65qZ1iaU7xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afb1IMnAHSZp4XA2kkMrlIzE3lGo+YP+VEWPZx1sw5aKE9Y0votU6jkdYwvRQiNd3VFadqyaG53lhRf0qaIVs4mN0mvy1MJHt44dHaz+ENXsQHjPP3mqSty2SKppm4rLnMgMK7GjcLoYDXR+krfjbEvvzL3cC68IOMXm1IhI/io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Hz2ViURM; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ogRXbwIh reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740727348; x=1772263348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TkFVKPQR+LQml2cZHEZ/ObJmevOgd54N2EFHAcZPN8M=;
  b=Hz2ViURMJIEG5WNpEWKS/EUimoedEbFeg/5NuLnviuh2YRhzwJqVlYt2
   mN+pECws8kv8jWKga2t/aeOU1qG6/XY39tH324wcyphKx24ljC2jXcIHO
   +bmun+6aDVTXZxq+TsBYConMi9UrYjlNTNwHxHU+kpkOB6qaOM5imRdz2
   dacecpsJq5zGrjqiJQKIW1JkxNe8Q7nnGaAFewkqegVLvWnTydOtXeyTU
   6PiZYTQM5nWQk99hBPC2UcmvgTijQ9jRghGwb9herZKBIr0JAqq1Ct2Wf
   ekWG2sGKaRSJdsRABBN9EYtfWHGNe2P+atUOCJGboofVrS0LHRJ88ekWm
   A==;
X-CSE-ConnectionGUID: Pwm/jGH8QIarCnxCey13iw==
X-CSE-MsgGUID: Bb3tnsBjSVCJhB4/uuKrXA==
X-IronPort-AV: E=Sophos;i="6.13,321,1732575600"; 
   d="scan'208";a="42165579"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Feb 2025 08:22:25 +0100
X-CheckPoint: {67C16431-13-FDFF3AB5-CA03ADD1}
X-MAIL-CPID: 4348E4AA195BD790F26CB356D6936DF1_2
X-Control-Analysis: str=0001.0A00211D.67C1642F.00A8,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A999916AE35;
	Fri, 28 Feb 2025 08:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740727341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TkFVKPQR+LQml2cZHEZ/ObJmevOgd54N2EFHAcZPN8M=;
	b=ogRXbwIhZocCHuUkWQGFg2gbcCpc0BNHIU0NTP5Mt/Zq0r/UgzXW1ldBuvV6mLlKByTKu5
	z0BwzkXLEF+i4tc6ORisef1h/QpgO/nfXEKgG8sQBQPiJ9GJPaNRWZslahpltwXjt40r8z
	lxlyS5Tx8rONJeuucC31zomyPaTh6KrrQHrZzeIuPWepa5MEMxbLbEyO/AAaoaLDpfBEHx
	cPrkpGvuCliTL8GZb8e/LbkEv7d58K+NIqJ8UUXPwmfIJnB76oouYK250Sh2Ts0wWetg3E
	qHsA9/2YbducH85cQ243AiKAd02ECdhvzTxCf5GvGahHEKIW93px6JWacSlh2w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 jun.li@nxp.com
Subject:
 Re: [PATCH v3 4/6] usb: chipidea: imx: add HSIO Block Control wakeup setting
Date: Fri, 28 Feb 2025 08:22:19 +0100
Message-ID: <4411149.ejJDZkT8p0@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250228023258.uznzhfnp7zsrxzed@hippo>
References:
 <20250227095348.837223-1-xu.yang_2@nxp.com> <3535014.QJadu78ljV@steina-w>
 <20250228023258.uznzhfnp7zsrxzed@hippo>
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

Am Freitag, 28. Februar 2025, 03:33:29 CET schrieb Xu Yang:
> On Thu, Feb 27, 2025 at 04:12:54PM +0100, Alexander Stein wrote:
> > Hi,
> >=20
> > Am Donnerstag, 27. Februar 2025, 10:53:46 CET schrieb Xu Yang:
> > > On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
> > > Control:
> > >=20
> > > HSIO Block Control Overview:
> > > - The HSIO block control include configuration and status registers t=
hat
> > >   provide miscellaneous top-level controls for clocking, beat limiter
> > >   enables, wakeup signal enables and interrupt status for the PCIe an=
d USB
> > >   interfaces.
> > >=20
> > > The wakeup function of HSIO blkctl is basically same as non-core, exc=
ept
> > > improvements about power lost cases. This will add the wakeup setting=
 for
> > > HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory, th=
en do
> > > wakeup setting as needs.
> > >=20
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >=20
> > > ---
> > > Changes in v3:
> > >  - remove usbmisc_imx95_init(), use usbmisc_imx7d_init()
> > > Changes in v2:
> > >  - add Rb tag
> > > ---
> > >  drivers/usb/chipidea/usbmisc_imx.c | 72 ++++++++++++++++++++++++++++=
++
> > >  1 file changed, 72 insertions(+)
> > >=20
> > > diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipide=
a/usbmisc_imx.c
> > > index 1394881fde5f..8c30908c11ed 100644
> > > --- a/drivers/usb/chipidea/usbmisc_imx.c
> > > +++ b/drivers/usb/chipidea/usbmisc_imx.c
> > > @@ -139,6 +139,22 @@
> > >  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_=
WAKEUP | \
> > >  				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
> > > =20
> > > +/*
> > > + * HSIO Block Control Register
> > > + */
> > > +
> > > +#define BLKCTL_USB_WAKEUP_CTRL		0x0
> > > +#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
> > > +#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
> > > +#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
> > > +#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
> > > +#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
> > > +
> > > +#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
> > > +					 BLKCTL_OTG_ID_WAKEUP_EN   | \
> > > +					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
> > > +					 BLKCTL_OTG_DPDM_WAKEUP_EN)
> > > +
> > >  struct usbmisc_ops {
> > >  	/* It's called once when probe a usb device */
> > >  	int (*init)(struct imx_usbmisc_data *data);
> > > @@ -159,6 +175,7 @@ struct usbmisc_ops {
> > > =20
> > >  struct imx_usbmisc {
> > >  	void __iomem *base;
> > > +	void __iomem *blkctl;
> > >  	spinlock_t lock;
> > >  	const struct usbmisc_ops *ops;
> > >  };
> > > @@ -1016,6 +1033,41 @@ static int usbmisc_imx6sx_power_lost_check(str=
uct imx_usbmisc_data *data)
> > >  		return 0;
> > >  }
> > > =20
> > > +static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *da=
ta)
> > > +{
> > > +	u32 wakeup_setting =3D BLKCTL_WAKEUP_SOURCE;
> > > +
> > > +	if (data->ext_id || data->available_role !=3D USB_DR_MODE_OTG)
> > > +		wakeup_setting &=3D ~BLKCTL_OTG_ID_WAKEUP_EN;
> > > +
> > > +	if (data->ext_vbus || data->available_role =3D=3D USB_DR_MODE_HOST)
> > > +		wakeup_setting &=3D ~BLKCTL_OTG_VBUS_WAKEUP_EN;
> > > +
> > > +	/* Select session valid as VBUS wakeup source */
> > > +	wakeup_setting |=3D BLKCTL_OTG_VBUS_SESSVALID;
> > > +
> > > +	return wakeup_setting;
> > > +}
> > > +
> > > +static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, b=
ool enabled)
> > > +{
> > > +	struct imx_usbmisc *usbmisc =3D dev_get_drvdata(data->dev);
> > > +	unsigned long flags;
> > > +	u32 val;
> > > +
> > > +	spin_lock_irqsave(&usbmisc->lock, flags);
> > > +	val =3D readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > > +	val &=3D ~BLKCTL_WAKEUP_SOURCE;
> > > +
> > > +	if (enabled)
> > > +		val |=3D usbmisc_blkctl_wakeup_setting(data);
> > > +
> > > +	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > > +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> >=20
> > usbmisc->blkctl is NULL if DT does not provide a 2nd IORESOURCE_MEM.
>=20
> Good catch. Thanks!
>=20
> It may return an errno if usbmisc->blkctl is NULL.
>=20
> >=20
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static const struct usbmisc_ops imx25_usbmisc_ops =3D {
> > >  	.init =3D usbmisc_imx25_init,
> > >  	.post =3D usbmisc_imx25_post,
> > > @@ -1068,6 +1120,14 @@ static const struct usbmisc_ops imx7ulp_usbmis=
c_ops =3D {
> > >  	.power_lost_check =3D usbmisc_imx7d_power_lost_check,
> > >  };
> > > =20
> > > +static const struct usbmisc_ops imx95_usbmisc_ops =3D {
> > > +	.init =3D usbmisc_imx7d_init,
> > > +	.set_wakeup =3D usbmisc_imx95_set_wakeup,
> > > +	.charger_detection =3D imx7d_charger_detection,
> > > +	.power_lost_check =3D usbmisc_imx7d_power_lost_check,
> > > +	.vbus_comparator_on =3D usbmisc_imx7d_vbus_comparator_on,
> > > +};
> > > +
> > >  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
> > >  {
> > >  	struct imx_usbmisc *usbmisc =3D dev_get_drvdata(data->dev);
> > > @@ -1289,6 +1349,10 @@ static const struct of_device_id usbmisc_imx_d=
t_ids[] =3D {
> > >  		.compatible =3D "fsl,imx8ulp-usbmisc",
> > >  		.data =3D &imx7ulp_usbmisc_ops,
> > >  	},
> > > +	{
> > > +		.compatible =3D "fsl,imx95-usbmisc",
> > > +		.data =3D &imx95_usbmisc_ops,
> > > +	},
> > >  	{ /* sentinel */ }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> > > @@ -1296,6 +1360,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> > >  static int usbmisc_imx_probe(struct platform_device *pdev)
> > >  {
> > >  	struct imx_usbmisc *data;
> > > +	struct resource *res;
> > > =20
> > >  	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > >  	if (!data)
> > > @@ -1307,6 +1372,13 @@ static int usbmisc_imx_probe(struct platform_d=
evice *pdev)
> > >  	if (IS_ERR(data->base))
> > >  		return PTR_ERR(data->base);
> > > =20
> > > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > +	if (res) {
> > > +		data->blkctl =3D devm_ioremap_resource(&pdev->dev, res);
> > > +		if (IS_ERR(data->blkctl))
> > > +			return PTR_ERR(data->blkctl);
> > > +	}
> > > +
> >=20
> > Any chance to ensure imx95 has actually data->blkctl?
>=20
> I think let usbmisc_imx95_set_wakeup() return an error should be enough.

Better fail early rather than later.

> Some errors will be printed for user. Also dt-bindings has restriction for
> imx95.

That's true, but don't assume the DT is always setup correctly.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



