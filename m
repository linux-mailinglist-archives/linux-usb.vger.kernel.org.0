Return-Path: <linux-usb+bounces-7692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 515E6875620
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 19:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E59AF1F23F6E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 18:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6282131E2F;
	Thu,  7 Mar 2024 18:31:11 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id CC0E31CA9A
	for <linux-usb@vger.kernel.org>; Thu,  7 Mar 2024 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709836271; cv=none; b=sqxyA7/DwozFmnzDMtDW+uWdxmzbYmRDjhwXQEWhKChPXl5MZMcXk5sfD4aicyvOTG7fEyGB/TD7g5gDED6hM6hLgbgYxJbhj63ZyCK7Oxt7S09I8J/nrstZkZGBe9U3Mm35x1bX8GVKat65B9L3goGtquKTuaRf4xLwz66FHoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709836271; c=relaxed/simple;
	bh=0ZoTdFgjgoaNOj1z3j65pqp/ccOZVO6NBa1Y6kLfHH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0JWGKnaZY1sNVE2rCL01gfdGOPDDH8/8md2VWFBew/y1GqnjbbZqzuWjJJtCa270tLb7AxvQQ6D3WpJo3OTmZZmrXDbvFpggfvSm8D3C84lvyQN4TqFkCF2zVQoCQDTj7F3vxysx+J1LkURdCgmcVeCXQPn+7NPsYOEW4DcOPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 227973 invoked by uid 1000); 7 Mar 2024 13:31:07 -0500
Date: Thu, 7 Mar 2024 13:31:07 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
  Roy Huang <roy.huang@analog.com>, Ash Aziz <ash.aziz@plxtech.com>,
  Mike Frysinger <vapier@gentoo.org>, Seth Levy <seth.levy@plxtech.com>,
  linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V2] usb: gadget: net2272: Use irqflags in the call
 to net2272_probe_fin
Message-ID: <668a1a8b-925f-4baa-a443-a84b9cd854c1@rowland.harvard.edu>
References: <20240307181734.2034407-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240307181734.2034407-1-colin.i.king@gmail.com>

On Thu, Mar 07, 2024 at 06:17:34PM +0000, Colin Ian King wrote:
> Currently the variable irqflags is being set but is not being used,
> it appears it should be used in the call to net2272_probe_fin
> rather than IRQF_TRIGGER_LOW being used. Kudos to Uwe Kleine-König
> for suggesting the fix.
> 
> Cleans up clang scan build warning:
> drivers/usb/gadget/udc/net2272.c:2610:15: warning: variable 'irqflags'
> set but not used [-Wunused-but-set-variable]
> 
> Fixes: ceb80363b2ec ("USB: net2272: driver for PLX NET2272 USB device controller")
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> ---
> 
> V2: don't remove irqflags but instead use it in the call to net2272_probe_fin
> 
> ---
>  drivers/usb/gadget/udc/net2272.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
> index 12e76bb62c20..19bbc38f3d35 100644
> --- a/drivers/usb/gadget/udc/net2272.c
> +++ b/drivers/usb/gadget/udc/net2272.c
> @@ -2650,7 +2650,7 @@ net2272_plat_probe(struct platform_device *pdev)
>  		goto err_req;
>  	}
>  
> -	ret = net2272_probe_fin(dev, IRQF_TRIGGER_LOW);
> +	ret = net2272_probe_fin(dev, irqflags);
>  	if (ret)
>  		goto err_io;
>  
> -- 
> 2.39.2
> 
> 

