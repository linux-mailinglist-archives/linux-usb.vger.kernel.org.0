Return-Path: <linux-usb+bounces-37612-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NFCIPkhC2omDwUAu9opvQ
	(envelope-from <linux-usb+bounces-37612-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:28:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E8C56EC08
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76FDF3014269
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734B548A2CC;
	Mon, 18 May 2026 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UgFC753r"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4CA32E13B
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113776; cv=none; b=VRDZB6JA9NTMSAx9exqiExZi7650df3z5Zps3NNYRkA47VeEE481SDsiFyo9+W3/KdJw3aHbOMR0zE9E0Tckx3pPO32y04hKP7DvJXWqDlbysqMqyrQg5C6d5fEILbAkMceOsV8iKtXZoPmO6WbhZhGYvavkiQAIshbLRQToslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113776; c=relaxed/simple;
	bh=ApCOd65GH1mrpZH/IkjKX1FZRq5Jr2eH38qeIoG0SF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjd7BROooiviocBiG3Jb+uBVnsVV/D7vRxxx9sfAN1PFQOXSvWI5SO5CGTRuM9jcxOC1l9rFjpPcXHHa12UKhohW+bT4vi92mtKV9m6joxWOAnLY1QMmh5PIaPQQVWFDwEaYA3Q5nUiDqiCTLjKkeoiI57C33C+UhuttZtAHG8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UgFC753r; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 18 May 2026 16:16:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779113772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmF/+k7xT27dQ9b/IpYw+UhoMPGbrRM8hC9gifet4s4=;
	b=UgFC753rTkvXhKZDL0ZNsUTOnR5IsbU/4oZSDMmavl6q9jU9aEx3QUBC1KFeKhwmr7qvxs
	PhVNbKkpDH74Fgpr6tORfMy2vdiPqQ5ULSlJp06ptoWQih3ozTvHjezWt4mlcSeRw7yeSe
	v3cdvkAnWEFLoD3dcClzcP++rZUUAik=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] usb: misc: Use named initializers for struct
 i2c_device_id
Message-ID: <agse4guy6jN5Vx5s@bombadil>
References: <20260518135536.781168-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518135536.781168-2-u.kleine-koenig@baylibre.com>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37612-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard.leitner@linux.dev,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.dev:email,linux.dev:dkim,baylibre.com:email]
X-Rspamd-Queue-Id: 90E8C56EC08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 03:55:36PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> While touching all these arrays, unify usage of whitespace in the list
> terminator.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> this patch is part of a bigger quest to use named initializers for
> mainly struct i2c_device_id::driver_data to be able to modify
> i2c_device_id. See e.g.
> https://lore.kernel.org/all/20260518111203.639603-2-u.kleine-koenig@baylibre.com/
> for the details.
> 
> This patch here isn't critical for this quest, as no driver makes use of
> .driver_data, so apart from the better readability this is only about
> consistency with other subsystems.
> 
> Best regards
> Uwe
> 
>  drivers/usb/misc/usb251xb.c | 18 +++++++++---------
>  drivers/usb/misc/usb3503.c  |  2 +-
>  drivers/usb/misc/usb4604.c  |  2 +-
>  3 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Leitner <richard.leitner@linux.dev>

> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 7c0778631bea..fb0693742f01 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -746,15 +746,15 @@ static int usb251xb_i2c_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(usb251xb_i2c_pm_ops, usb251xb_i2c_suspend, usb251xb_i2c_resume);
>  
>  static const struct i2c_device_id usb251xb_id[] = {
> -	{ "usb2422" },
> -	{ "usb2512b" },
> -	{ "usb2512bi" },
> -	{ "usb2513b" },
> -	{ "usb2513bi" },
> -	{ "usb2514b" },
> -	{ "usb2514bi" },
> -	{ "usb2517" },
> -	{ "usb2517i" },
> +	{ .name = "usb2422" },
> +	{ .name = "usb2512b" },
> +	{ .name = "usb2512bi" },
> +	{ .name = "usb2513b" },
> +	{ .name = "usb2513bi" },
> +	{ .name = "usb2514b" },
> +	{ .name = "usb2514bi" },
> +	{ .name = "usb2517" },
> +	{ .name = "usb2517i" },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, usb251xb_id);
> diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
> index 322e59381b78..759770a13260 100644
> --- a/drivers/usb/misc/usb3503.c
> +++ b/drivers/usb/misc/usb3503.c
> @@ -390,7 +390,7 @@ static SIMPLE_DEV_PM_OPS(usb3503_platform_pm_ops, usb3503_platform_suspend,
>  		usb3503_platform_resume);
>  
>  static const struct i2c_device_id usb3503_id[] = {
> -	{ USB3503_I2C_NAME },
> +	{ .name = USB3503_I2C_NAME },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, usb3503_id);
> diff --git a/drivers/usb/misc/usb4604.c b/drivers/usb/misc/usb4604.c
> index c9a2fb3518ae..2ae9656715e0 100644
> --- a/drivers/usb/misc/usb4604.c
> +++ b/drivers/usb/misc/usb4604.c
> @@ -135,7 +135,7 @@ static SIMPLE_DEV_PM_OPS(usb4604_i2c_pm_ops, usb4604_i2c_suspend,
>  		usb4604_i2c_resume);
>  
>  static const struct i2c_device_id usb4604_id[] = {
> -	{ "usb4604" },
> +	{ .name = "usb4604" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, usb4604_id);
> 
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> -- 
> 2.47.3
> 

