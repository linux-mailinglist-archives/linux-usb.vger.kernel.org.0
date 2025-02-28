Return-Path: <linux-usb+bounces-21186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA42A4979D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 11:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 394C217109A
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 10:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B19425F7A1;
	Fri, 28 Feb 2025 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="klou0WD4";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AHJ7iCOL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80386255E58;
	Fri, 28 Feb 2025 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739313; cv=none; b=ICxQE7Tmr8/0SSUuQpqoaOBzEzXj8YjN/0HVjKk81EP9BGiQTGuhRywD3apHZ5QcH1qO/z6ay//DxGp3ObqnImSNhJY0D+aMyC8DWxeBZcw3AayBWXj98WZ3US9lfxU2PqrFUZWXv56++VJLQxaAPOdbg5QrtNPTOTyBTuYAUK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739313; c=relaxed/simple;
	bh=5xcil/r5JW73KlfawvZB49bPh0ZZRpMyxGGFsHi3G1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Utb4RO6NvZcTG1z5vvpUO+ylfmWHcLwJMyG/Gjq7kgjGS3OlLUWXdlYr72bPAtIk54ackC6yxUXPTxQZwS8XlaEnUE3LvY34bUdR8MCZp/TlX5qJ3sxoi83XbfWasUt1F271lgsMB/tNjN5c6U2TcuLFlmocMSB+E5Zch+6jdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=klou0WD4; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AHJ7iCOL reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740739310; x=1772275310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oyWGs3qdIjKemTgJYOyzcBuANNWxuDbuvjzL4A5HLsk=;
  b=klou0WD4fOEtApcwHAKkHuk3pQvSmhwIyjZYAPvhRE49DETmlwZNX3lI
   gh2DoQG7ay/9t2D2pmQQZTBp0bK3oB5epIGvRkJgRwb3F+k0SblF9WTPE
   DNFC7/zhLYn95gw6bXRBWSNmD40kdAmPC+tJy1I739o2cWQIufDkQxdl0
   8s02RYOniqRgjD9KYjISMpfA7RigLxwABtkMuaeShAcUjMmoudzsJ2fAn
   vcXynlIFxn5IUg840hnrp/hNUpevFRZgBR/0PyiiZ7zlEy+CPAAG01E94
   kmZoXCc951V0UQKQYqn+Yta7Gty4TL9a/UnU+Qp1nqSWBtCelayZdAfXc
   g==;
X-CSE-ConnectionGUID: E8rrR1Z8SO6mi1hkH3fwiA==
X-CSE-MsgGUID: xirA560ITpC9CKT9kPRfEg==
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; 
   d="scan'208";a="42172048"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Feb 2025 11:41:48 +0100
X-CheckPoint: {67C192EC-17-A2FC2151-C3FA4B33}
X-MAIL-CPID: 6C8E73D9657E1DAE5A775A85D6256D44_0
X-Control-Analysis: str=0001.0A002109.67C192E8.0140,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35F0B1664F6;
	Fri, 28 Feb 2025 11:41:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740739303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oyWGs3qdIjKemTgJYOyzcBuANNWxuDbuvjzL4A5HLsk=;
	b=AHJ7iCOL6F8ce2zMFGVVT00KHMIRTO/G8+r9q9UrdKkN1elJR/xIjMkwGNi65HPKKv27Mg
	dnjdF33ZqsnBWRJ0AFUDKY361AHIzs60Ytd1GNbLjxfSnf7iASG0kUCakoh+dIW9ZaS4As
	UQbmAN9qcbCihBFaBuKGZz/F/HcUt8iTSPHv26T/g3/fc3r+DICGOjnm+NHzcaeWBVz07R
	+yiTGxuTZHHFmGj3qJePtBcRJRcU/9RHzbKWAbiMNTrQxMGiIaKchjkF6/kCg3SWoJxv06
	sz047n2s1800Qyhz6Byvmdjnr31tVst5fMuhja/s7i5VTvx1BgOC/QaUXpom2w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 jun.li@nxp.com
Subject:
 Re: [PATCH v3 4/6] usb: chipidea: imx: add HSIO Block Control wakeup setting
Date: Fri, 28 Feb 2025 11:41:42 +0100
Message-ID: <6777549.4vTCxPXJkl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250228091649.prmpcyro27fekgzm@hippo>
References:
 <20250227095348.837223-1-xu.yang_2@nxp.com> <4411149.ejJDZkT8p0@steina-w>
 <20250228091649.prmpcyro27fekgzm@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Freitag, 28. Februar 2025, 10:16:49 CET schrieb Xu Yang:
> On Fri, Feb 28, 2025 at 08:22:19AM +0100, Alexander Stein wrote:
> > Hi,
> >=20
> > Am Freitag, 28. Februar 2025, 03:33:29 CET schrieb Xu Yang:
> > > On Thu, Feb 27, 2025 at 04:12:54PM +0100, Alexander Stein wrote:
> > > > Hi,
> > > >=20
> > > > Am Donnerstag, 27. Februar 2025, 10:53:46 CET schrieb Xu Yang:
> > > > > On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
> > > > > Control:
> > > > >=20
> > > > > HSIO Block Control Overview:
> > > > > - The HSIO block control include configuration and status registe=
rs that
> > > > >   provide miscellaneous top-level controls for clocking, beat lim=
iter
> > > > >   enables, wakeup signal enables and interrupt status for the PCI=
e and USB
> > > > >   interfaces.
> > > > >=20
> > > > > The wakeup function of HSIO blkctl is basically same as non-core,=
 except
> > > > > improvements about power lost cases. This will add the wakeup set=
ting for
> > > > > HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory=
, then do
> > > > > wakeup setting as needs.
> > > > >=20
> > > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > >=20
> > > > > ---
> > > > > Changes in v3:
> > > > >  - remove usbmisc_imx95_init(), use usbmisc_imx7d_init()
> > > > > Changes in v2:
> > > > >  - add Rb tag
> > > > > ---
> > > > >  drivers/usb/chipidea/usbmisc_imx.c | 72 ++++++++++++++++++++++++=
++++++
> > > > >  1 file changed, 72 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chi=
pidea/usbmisc_imx.c
> > > > > index 1394881fde5f..8c30908c11ed 100644
> > > > > --- a/drivers/usb/chipidea/usbmisc_imx.c
> > > > > +++ b/drivers/usb/chipidea/usbmisc_imx.c
> > > > > @@ -139,6 +139,22 @@
> > > > >  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_V=
BUS_WAKEUP | \
> > > > >  				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
> > > > > =20
> > > > > +/*
> > > > > + * HSIO Block Control Register
> > > > > + */
> > > > > +
> > > > > +#define BLKCTL_USB_WAKEUP_CTRL		0x0
> > > > > +#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
> > > > > +#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
> > > > > +#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
> > > > > +#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
> > > > > +#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
> > > > > +
> > > > > +#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
> > > > > +					 BLKCTL_OTG_ID_WAKEUP_EN   | \
> > > > > +					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
> > > > > +					 BLKCTL_OTG_DPDM_WAKEUP_EN)
> > > > > +
> > > > >  struct usbmisc_ops {
> > > > >  	/* It's called once when probe a usb device */
> > > > >  	int (*init)(struct imx_usbmisc_data *data);
> > > > > @@ -159,6 +175,7 @@ struct usbmisc_ops {
> > > > > =20
> > > > >  struct imx_usbmisc {
> > > > >  	void __iomem *base;
> > > > > +	void __iomem *blkctl;
> > > > >  	spinlock_t lock;
> > > > >  	const struct usbmisc_ops *ops;
> > > > >  };
> > > > > @@ -1016,6 +1033,41 @@ static int usbmisc_imx6sx_power_lost_check=
(struct imx_usbmisc_data *data)
> > > > >  		return 0;
> > > > >  }
> > > > > =20
> > > > > +static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data=
 *data)
> > > > > +{
> > > > > +	u32 wakeup_setting =3D BLKCTL_WAKEUP_SOURCE;
> > > > > +
> > > > > +	if (data->ext_id || data->available_role !=3D USB_DR_MODE_OTG)
> > > > > +		wakeup_setting &=3D ~BLKCTL_OTG_ID_WAKEUP_EN;
> > > > > +
> > > > > +	if (data->ext_vbus || data->available_role =3D=3D USB_DR_MODE_H=
OST)
> > > > > +		wakeup_setting &=3D ~BLKCTL_OTG_VBUS_WAKEUP_EN;
> > > > > +
> > > > > +	/* Select session valid as VBUS wakeup source */
> > > > > +	wakeup_setting |=3D BLKCTL_OTG_VBUS_SESSVALID;
> > > > > +
> > > > > +	return wakeup_setting;
> > > > > +}
> > > > > +
> > > > > +static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *dat=
a, bool enabled)
> > > > > +{
> > > > > +	struct imx_usbmisc *usbmisc =3D dev_get_drvdata(data->dev);
> > > > > +	unsigned long flags;
> > > > > +	u32 val;
> > > > > +
> > > > > +	spin_lock_irqsave(&usbmisc->lock, flags);
> > > > > +	val =3D readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > > > > +	val &=3D ~BLKCTL_WAKEUP_SOURCE;
> > > > > +
> > > > > +	if (enabled)
> > > > > +		val |=3D usbmisc_blkctl_wakeup_setting(data);
> > > > > +
> > > > > +	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > > > > +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> > > >=20
> > > > usbmisc->blkctl is NULL if DT does not provide a 2nd IORESOURCE_MEM.
> > >=20
> > > Good catch. Thanks!
> > >=20
> > > It may return an errno if usbmisc->blkctl is NULL.
> > >=20
> > > >=20
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >  static const struct usbmisc_ops imx25_usbmisc_ops =3D {
> > > > >  	.init =3D usbmisc_imx25_init,
> > > > >  	.post =3D usbmisc_imx25_post,
> > > > > @@ -1068,6 +1120,14 @@ static const struct usbmisc_ops imx7ulp_us=
bmisc_ops =3D {
> > > > >  	.power_lost_check =3D usbmisc_imx7d_power_lost_check,
> > > > >  };
> > > > > =20
> > > > > +static const struct usbmisc_ops imx95_usbmisc_ops =3D {
> > > > > +	.init =3D usbmisc_imx7d_init,
> > > > > +	.set_wakeup =3D usbmisc_imx95_set_wakeup,
> > > > > +	.charger_detection =3D imx7d_charger_detection,
> > > > > +	.power_lost_check =3D usbmisc_imx7d_power_lost_check,
> > > > > +	.vbus_comparator_on =3D usbmisc_imx7d_vbus_comparator_on,
> > > > > +};
> > > > > +
> > > > >  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *dat=
a)
> > > > >  {
> > > > >  	struct imx_usbmisc *usbmisc =3D dev_get_drvdata(data->dev);
> > > > > @@ -1289,6 +1349,10 @@ static const struct of_device_id usbmisc_i=
mx_dt_ids[] =3D {
> > > > >  		.compatible =3D "fsl,imx8ulp-usbmisc",
> > > > >  		.data =3D &imx7ulp_usbmisc_ops,
> > > > >  	},
> > > > > +	{
> > > > > +		.compatible =3D "fsl,imx95-usbmisc",
> > > > > +		.data =3D &imx95_usbmisc_ops,
> > > > > +	},
> > > > >  	{ /* sentinel */ }
> > > > >  };
> > > > >  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> > > > > @@ -1296,6 +1360,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> > > > >  static int usbmisc_imx_probe(struct platform_device *pdev)
> > > > >  {
> > > > >  	struct imx_usbmisc *data;
> > > > > +	struct resource *res;
> > > > > =20
> > > > >  	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > > > >  	if (!data)
> > > > > @@ -1307,6 +1372,13 @@ static int usbmisc_imx_probe(struct platfo=
rm_device *pdev)
> > > > >  	if (IS_ERR(data->base))
> > > > >  		return PTR_ERR(data->base);
> > > > > =20
> > > > > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > > > +	if (res) {
> > > > > +		data->blkctl =3D devm_ioremap_resource(&pdev->dev, res);
> > > > > +		if (IS_ERR(data->blkctl))
> > > > > +			return PTR_ERR(data->blkctl);
> > > > > +	}
> > > > > +
> > > >=20
> > > > Any chance to ensure imx95 has actually data->blkctl?
> > >=20
> > > I think let usbmisc_imx95_set_wakeup() return an error should be enou=
gh.
> >=20
> > Better fail early rather than later.
> >=20
> > > Some errors will be printed for user. Also dt-bindings has restrictio=
n for
> > > imx95.
> >=20
> > That's true, but don't assume the DT is always setup correctly.
>=20
> Sure, I thought about this question again.
>=20
> If 2nd IORESOURCE_MEM is not provided, the USB controller could still fun=
ction
> normally in most scenarios except when USB wakeup is required. So if the =
probe()
> return a failure just caused by improper wakeup configurations seems not =
that
> necessary. In this case, ensuring the kernel does not panic should suffic=
e.
>=20
> Therfore, I prefer to skip wakeup setting if blkctl is NULL now.
> Do you have any ideas?

That also seems reasonable. So in case 2nd IORESOURCE_MEM is missing (only)
for imx95 there should be a warning that wakeup is not possible/supported.
But the driver itself should work without issue.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



