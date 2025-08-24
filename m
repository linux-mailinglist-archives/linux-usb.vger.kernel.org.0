Return-Path: <linux-usb+bounces-27221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA791B3322B
	for <lists+linux-usb@lfdr.de>; Sun, 24 Aug 2025 20:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CDD53BB7BA
	for <lists+linux-usb@lfdr.de>; Sun, 24 Aug 2025 18:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984F922F74F;
	Sun, 24 Aug 2025 18:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="evNCKnjG"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2631F19CCF5
	for <linux-usb@vger.kernel.org>; Sun, 24 Aug 2025 18:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756061906; cv=none; b=m1UjBec5EKbVoV6UcT/yDsbgbsG6zb/qqmgOq87qhCJr+Zhv40sRh3d+I9ItyWsJClMsiBfRC9ReeiinzC2WOSfwueDL3T+yHdtberMX8UsTtV6Knt5OzNeu4nsRYGxf2pv+hb2bKA/Ztoa5kMgRdKTz3K3OQGigSAXdpWFUd8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756061906; c=relaxed/simple;
	bh=kEu/zrIegka/cRZWmI9zjSyRt/orzozoHBdSxmbxHdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEpiY3FSDdjRT7tjMAy1cjQGg70pe33nXncNFmdP/DMKwAdVNGOKBgD0/Y2+v4+I8EDuavSB2McZ1pp2MY7Gxw5aoYTtr2cMyH3rayZelpM4pI6/wXsMjdMuNl1FCm1WpUNmDftOJsMV7b9RqkkSEPW5rxPBhB2bY3DDOE9JEpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=evNCKnjG; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sun, 24 Aug 2025 20:58:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756061901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROo3b8gTSiAc/dTc22a7jwlluU+zLueB2IBr7H3bUu0=;
	b=evNCKnjGKGoClvFRNF0a7jar/U2e4k4p0FtyzaANLT2dJRVqD0zyEwYX00F/05eWEmeb6X
	bZMR+QeyLIjcrvQHOkQJZq2UroUfjBFXoOiArOnwrxcmppc1EPBSp1k6qqF5n/SJcKspHx
	zVj73fmbe/VNBNgi7CHkmy6gDxaM9Ns=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] usb: usb251xb: use modern PM macros
Message-ID: <sflcjqonsyvvcaymm2ftxyz5hmvkim5fk6mppyzi3cxxjctap6@hj5642ult4pn>
References: <20250820161743.23458-1-jszhang@kernel.org>
 <20250820161743.23458-3-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820161743.23458-3-jszhang@kernel.org>
X-Migadu-Flow: FLOW_OUT

Hi Jisheng,

thanks for tackling this issue!

On Thu, Aug 21, 2025 at 12:17:42AM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/usb/misc/usb251xb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Leitner <richard.leitner@linux.dev>

> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 4fb453ca5450..cb2f946de42c 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -698,7 +698,7 @@ static int usb251xb_i2c_probe(struct i2c_client *i2c)
>  	return usb251xb_probe(hub);
>  }
>  
> -static int __maybe_unused usb251xb_suspend(struct device *dev)
> +static int usb251xb_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct usb251xb *hub = i2c_get_clientdata(client);
> @@ -706,7 +706,7 @@ static int __maybe_unused usb251xb_suspend(struct device *dev)
>  	return regulator_disable(hub->vdd);
>  }
>  
> -static int __maybe_unused usb251xb_resume(struct device *dev)
> +static int usb251xb_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct usb251xb *hub = i2c_get_clientdata(client);
> @@ -719,7 +719,7 @@ static int __maybe_unused usb251xb_resume(struct device *dev)
>  	return usb251xb_connect(hub);
>  }
>  
> -static SIMPLE_DEV_PM_OPS(usb251xb_pm_ops, usb251xb_suspend, usb251xb_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(usb251xb_pm_ops, usb251xb_suspend, usb251xb_resume);
>  
>  static const struct i2c_device_id usb251xb_id[] = {
>  	{ "usb2422" },
> @@ -739,7 +739,7 @@ static struct i2c_driver usb251xb_i2c_driver = {
>  	.driver = {
>  		.name = DRIVER_NAME,
>  		.of_match_table = usb251xb_of_match,
> -		.pm = &usb251xb_pm_ops,
> +		.pm = pm_sleep_ptr(&usb251xb_pm_ops),
>  	},
>  	.probe = usb251xb_i2c_probe,
>  	.id_table = usb251xb_id,
> -- 
> 2.50.0
> 

