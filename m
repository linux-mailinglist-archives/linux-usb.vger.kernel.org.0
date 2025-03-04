Return-Path: <linux-usb+bounces-21327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BC6A4D93F
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 10:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46C571636C5
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 09:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377E71FDA7B;
	Tue,  4 Mar 2025 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="MnDyjMKs";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Q+fCkgkM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C33B1FDA85;
	Tue,  4 Mar 2025 09:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741081889; cv=none; b=fuy2nNOL/RODgNoEX6Bs9XCdA7kJRDtBm5Gxrj0T6lxT9NSXpG5GZyEdjpqzByYmhfmvhoRQbnrTEx2/jPfsaF40kAkmKPN+gNv86wbCGvFHd5UawSajpeLh6gxLQA1Ltct4hLcqqRkuNigNirEBdcMnfgcUfX6++xGMhbJtQoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741081889; c=relaxed/simple;
	bh=2x9I3P3U+OVZLNZ1nZmMds2DdCgCnQFPMLPvfWGgvAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MXcGuAySFT0EFgQtFHzzqSHdWrZCMESNPXiy+OqTMsAI7JAngLfhFCkf3tnQUaYgWqrfYHB6i85vI0/j/61GD1ndOhnDtTQzTNiwg2uMooVDGIEabQKYCnv1prUs8X3XRRNT/ildpScyKQmMcgrwST3Rq9cxoOHpczpmpSOqetE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=MnDyjMKs; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Q+fCkgkM reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1741081886; x=1772617886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0U0lGs7WpN5bzMDdr2hYg/hjI2BrsoigYq6t/slDM0Q=;
  b=MnDyjMKsOfinh3aeHfAIfPZebj1oI72yFJcFx28yw4VGePBQot1TXEWZ
   N7YFUvVbzG7AUBZ3Cp1ObY8W23wS0TxRuKHIKHBeiOhDXNc2IRjWPYDjb
   lxmgNEulX/u4J7aH5jwrAI9gGrBe3jSGiF0wwjTDhHEL1dYKUfBDSxEM5
   nW5EyqUnpGjNFe9MuA4GfI2Vl+yuKXwNKxDN+xIu2QX8SXmsHXT+EDMWL
   +LEStqPGYVhk7n2mzPiwc5EYcqxer5sx62/L+T4vhtaIWCt16Yr8bc58E
   Ion6MAGjusFOhquyjoBEHcWUyehsjhHqGTbYFrj+q/9Yf9aXbVS7Tk/DC
   g==;
X-CSE-ConnectionGUID: d5qkUfK5RBGvEqNHcKyEAA==
X-CSE-MsgGUID: AF5Dx6k/RMWASpBQy7rdTQ==
X-IronPort-AV: E=Sophos;i="6.13,331,1732575600"; 
   d="scan'208";a="42262083"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Mar 2025 10:50:14 +0100
X-CheckPoint: {67C6CCD6-F-A886F308-CE21D9DB}
X-MAIL-CPID: C699F4D445EE5CF8D3B21DD2C9AF3AC4_2
X-Control-Analysis: str=0001.0A002107.67C6CCD4.0073,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC001160A39;
	Tue,  4 Mar 2025 10:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1741081809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0U0lGs7WpN5bzMDdr2hYg/hjI2BrsoigYq6t/slDM0Q=;
	b=Q+fCkgkMLEQHAJ91rbKy8LU76nniTY/qmYumb8uW684qiHINn/TA4ToRjcxZPusuhjcf5S
	XP3212bqkOthfGgb22J+atsOb+wOlsuaswwcorf8+xkx+t/Gmy6vGHt4kEdhLteIY8jDjp
	kDN82+/WHj+Fauury7EFhKSZxlrkz//cdOB53RC5JszoVfV+1mTHHWsferkPS6lDQ63OTV
	pjQOT0TKglmCx3Y1k4TQKnHhBlBJgZs1q1TqgirMadH3fqZwUUcN/t11pvnWo65FgBViPb
	/MQxi7C0wb8ZFYfHNUZvpMYkb2CL4cA/6QUAQadIyDDrhFLualdDhWcWy5KTSA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 3/6] usb: chipidea: imx: add wakeup interrupt handling
Date: Tue, 04 Mar 2025 10:50:06 +0100
Message-ID: <3342061.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250303033344.1251076-4-xu.yang_2@nxp.com>
References:
 <20250303033344.1251076-1-xu.yang_2@nxp.com>
 <20250303033344.1251076-4-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Montag, 3. M=E4rz 2025, 04:33:41 CET schrieb Xu Yang:
> In previous imx platform, normal USB controller interrupt and wakeup
> interrupt are bound to one irq line. However, it changes on latest
> i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> This will add wakeup interrupt handling for i.MX95 to support various
> wakeup events.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
> Changes in v4:
>  - warning if no irq provided for imx95
> Changes in v3:
>  - include <linux/irq.h> to fix possible build issue
> Changes in v2:
>  - rename irq to wakeup_irq
>  - disable irq by default
>  - enable irq when suspend, disable irq when resume
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci=
_hdrc_imx.c
> index 1a7fc638213e..2baae9e6e673 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -6,6 +6,7 @@
>   */
> =20
>  #include <linux/module.h>
> +#include <linux/irq.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> @@ -98,6 +99,7 @@ struct ci_hdrc_imx_data {
>  	struct clk *clk;
>  	struct clk *clk_wakeup;
>  	struct imx_usbmisc_data *usbmisc_data;
> +	int wakeup_irq;
>  	bool supports_runtime_pm;
>  	bool override_phy_control;
>  	bool in_lpm;
> @@ -336,6 +338,16 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *=
ci, unsigned int event)
>  	return ret;
>  }
> =20
> +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> +{
> +	struct ci_hdrc_imx_data *imx_data =3D data;
> +
> +	disable_irq_nosync(irq);
> +	pm_runtime_resume(&imx_data->ci_pdev->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  {
>  	struct ci_hdrc_imx_data *data;
> @@ -476,6 +488,18 @@ static int ci_hdrc_imx_probe(struct platform_device =
*pdev)
>  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
>  		data->supports_runtime_pm =3D true;
> =20
> +	data->wakeup_irq =3D platform_get_irq_optional(pdev, 1);
> +	if (data->wakeup_irq > 0) {
> +		ret =3D devm_request_threaded_irq(dev, data->wakeup_irq,
> +						NULL, ci_wakeup_irq_handler,
> +						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +						pdata.name, data);
> +		if (ret)
> +			goto err_clk;
> +	} else if (device_is_compatible(dev, "fsl,imx95-usb")) {
> +		dev_warn(dev, "wakeup irq is missing\n");
> +	}
> +
>  	ret =3D imx_usbmisc_init(data->usbmisc_data);
>  	if (ret) {
>  		dev_err(dev, "usbmisc init failed, ret=3D%d\n", ret);
> @@ -584,6 +608,7 @@ static int imx_controller_suspend(struct device *dev,
>  	}
> =20
>  	imx_disable_unprepare_clks(dev);
> +	enable_irq(data->wakeup_irq);
>  	if (data->plat_data->flags & CI_HDRC_PMQOS)
>  		cpu_latency_qos_remove_request(&data->pm_qos_req);
> =20
> @@ -608,6 +633,9 @@ static int imx_controller_resume(struct device *dev,
>  	if (data->plat_data->flags & CI_HDRC_PMQOS)
>  		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
> =20
> +	if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
> +		disable_irq_nosync(data->wakeup_irq);
> +

if (data->wakeup_irq > 0) is necessary. I'll get a NULL-pointer
dereference on imx93.

Best regards
Alexander

>  	ret =3D imx_prepare_enable_clks(dev);
>  	if (ret)
>  		return ret;
> @@ -643,6 +671,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
>  		return ret;
> =20
>  	pinctrl_pm_select_sleep_state(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(data->wakeup_irq);
> +
>  	return ret;
>  }
> =20
> @@ -651,6 +683,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
>  	struct ci_hdrc_imx_data *data =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(data->wakeup_irq);
> +
>  	pinctrl_pm_select_default_state(dev);
>  	ret =3D imx_controller_resume(dev, PMSG_RESUME);
>  	if (!ret && data->supports_runtime_pm) {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



