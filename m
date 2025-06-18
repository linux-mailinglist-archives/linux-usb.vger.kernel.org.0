Return-Path: <linux-usb+bounces-24876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AB8ADE923
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 12:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 665F33A7DD6
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 10:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B615425C82E;
	Wed, 18 Jun 2025 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUyhWSW7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309BDBA27;
	Wed, 18 Jun 2025 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242980; cv=none; b=Z5ug1DmgiTyieXB3i7UMxgAH6wtEuGT34I5iV5iTJAZ/W0a8bpf4+oP6jq55pqV5Cux8it9uZxnuqT5g4gVhDrP2FVdNnSMevu89zF4dkwb2F8k4bcvknrqV60K8jjQWLdMD6erbHaAZjwXJGKtEbJ+V4ew2lywxbdcH9spSeFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242980; c=relaxed/simple;
	bh=B6uo7xeHOpk/UKaFSXaNj5iI3yuU7iwtArZSU8kFH1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDi97kzbTQOmp8zT77TK+JCUOGCB7xtFE+jkv4SqaEJ3ssG5z0B+yEWNhfnPSMQyt6wx1dzK+C6EmMqgLoTTTJKZX1M+2LrC9jIM6oOkS0NXLEbPl6gcfbexYzPScRxhZURtaym+rn/1OE6nwB7dW1cuknPhXh9tXDIedPLZBt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUyhWSW7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00E1C4CEE7;
	Wed, 18 Jun 2025 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750242979;
	bh=B6uo7xeHOpk/UKaFSXaNj5iI3yuU7iwtArZSU8kFH1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUyhWSW7hJmut7cEo8X4rWRBAvs9aorCV2BVuTkcGwy3nlPmtFY93eBQJ3yXwj01k
	 pHaJC/fq6WfriQV3/e2G3xohuC7a1rpjlOZ+ERM3ZC4mEFtnwz260b/VUkHGKJEnWX
	 wv2X3bjLFeAk3NEj8oRZWsuSPxQYatT5QCUBsYf6VMgKVlSD8NSmph9ZDT9wt20mgz
	 3KeoSXdcRu0mvmwCJI9k2EtFyNrdpF3iAMx8+dPViWiUrOWcKryJ6PGAyd4cFRYSwp
	 p1H57lsxHW0cL4++UzzB+KkeoYZOVOAbHEWDIpaA2hjdZt7nShD35BlntAysCj51hX
	 hQd/Ltyw2oFkA==
Date: Wed, 18 Jun 2025 18:36:12 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.d,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] usb: chipidea: imx: add imx_usbmisc_pullup() hook
Message-ID: <20250618103612.GC34284@nchen-desktop>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
 <20250614125645.207732-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614125645.207732-3-xu.yang_2@nxp.com>

On 25-06-14 20:56:44, Xu Yang wrote:
> It's used to do other pullup related operations if needs.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.h |  1 +
>  drivers/usb/chipidea/usbmisc_imx.c | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
> index 88b8da79d518..cb95c84d0322 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.h
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.h
> @@ -37,5 +37,6 @@ int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data);
>  int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect);
>  int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup);
>  int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup);
> +int imx_usbmisc_pullup(struct imx_usbmisc_data *data, bool on);
>  
>  #endif /* __DRIVER_USB_CHIPIDEA_CI_HDRC_IMX_H */
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 118b9a68496b..9db67d6d0ec4 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -170,6 +170,9 @@ struct usbmisc_ops {
>  	int (*charger_detection)(struct imx_usbmisc_data *data);
>  	/* It's called when system resume from usb power lost */
>  	int (*power_lost_check)(struct imx_usbmisc_data *data);
> +	/* It's called when device controller changed pullup status */
> +	void (*pullup)(struct imx_usbmisc_data *data, bool on);
> +	/* It's called during suspend/resume to save power */
>  	void (*vbus_comparator_on)(struct imx_usbmisc_data *data, bool on);
>  };
>  
> @@ -1225,6 +1228,21 @@ int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect)
>  }
>  EXPORT_SYMBOL_GPL(imx_usbmisc_charger_detection);
>  
> +int imx_usbmisc_pullup(struct imx_usbmisc_data *data, bool on)
> +{
> +	struct imx_usbmisc *usbmisc;
> +
> +	if (!data)
> +		return 0;
> +
> +	usbmisc = dev_get_drvdata(data->dev);
> +	if (usbmisc->ops->pullup)
> +		usbmisc->ops->pullup(data, on);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(imx_usbmisc_pullup);
> +
>  int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup)
>  {
>  	struct imx_usbmisc *usbmisc;
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

