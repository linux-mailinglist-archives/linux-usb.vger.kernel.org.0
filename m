Return-Path: <linux-usb+bounces-5241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF05832084
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 21:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2C4A1F248F7
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 20:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3232E836;
	Thu, 18 Jan 2024 20:37:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C26B32E645
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705610257; cv=none; b=mCergbkrRmzkcnsambnRe5xc+fQu9C4H37Kk3eQ+YxIGMEdXd9Zh9ODYVWgvJM32ETiiAytdzSM7bAkbWqWJVguFFJ582t8GEOla7ksIM4rNJrdaSSW/2pOMf60FTLFBMa+iwtPJH+RVn50fWahuOkEQ5pkqWP4Wx6ijUeGDnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705610257; c=relaxed/simple;
	bh=DHs6SzpJxByKygJUaF0oHTl/C08Y4A/lJGT2+8bRT1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNl/CQxZA7b+V6TeDAif6RwCEH6V/bWUJK0T3RGPMgNIFVM5nvu4zoKUvNGyuEoXrja7OZiyYwwA8qX/BycbFTqKpxCGPQJVIh+w/5TZaO/kzatjZivK82qf6HO4EywNNXrRZ/alJT1SfNnIY6wBE0WT5XuNUW9OCIHcMe78BVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 17372 invoked by uid 1000); 18 Jan 2024 15:37:33 -0500
Date: Thu, 18 Jan 2024 15:37:33 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: usb_autopm_get_interface use modern helper
Message-ID: <6013fd1d-2691-4a93-ac25-5cba6e646b64@rowland.harvard.edu>
References: <20240118202300.1616-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118202300.1616-1-oneukum@suse.com>

On Thu, Jan 18, 2024 at 09:22:55PM +0100, Oliver Neukum wrote:
> PM core now gives us a primitive that does not touch
> the counter in an error case. Use it.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> ---
>  drivers/usb/core/driver.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index e01b1913d02b..e02ba15f6e34 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1710,9 +1710,7 @@ int usb_autoresume_device(struct usb_device *udev)
>  {
>  	int	status;
>  
> -	status = pm_runtime_get_sync(&udev->dev);
> -	if (status < 0)
> -		pm_runtime_put_sync(&udev->dev);
> +	status = pm_runtime_resume_and_get(&udev->dev);
>  	dev_vdbg(&udev->dev, "%s: cnt %d -> %d\n",
>  			__func__, atomic_read(&udev->dev.power.usage_count),
>  			status);
> @@ -1818,9 +1816,7 @@ int usb_autopm_get_interface(struct usb_interface *intf)
>  {
>  	int	status;
>  
> -	status = pm_runtime_get_sync(&intf->dev);
> -	if (status < 0)
> -		pm_runtime_put_sync(&intf->dev);
> +	status = pm_runtime_resume_and_get(&intf->dev);
>  	dev_vdbg(&intf->dev, "%s: cnt %d -> %d\n",
>  			__func__, atomic_read(&intf->dev.power.usage_count),
>  			status);
> -- 
> 2.43.0
> 
> 

