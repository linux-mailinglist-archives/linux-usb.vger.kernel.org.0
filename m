Return-Path: <linux-usb+bounces-8195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E8B8879D2
	for <lists+linux-usb@lfdr.de>; Sat, 23 Mar 2024 18:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43C6C1C20BAE
	for <lists+linux-usb@lfdr.de>; Sat, 23 Mar 2024 17:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E4C53E2B;
	Sat, 23 Mar 2024 17:58:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C93AC535A8
	for <linux-usb@vger.kernel.org>; Sat, 23 Mar 2024 17:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711216708; cv=none; b=ODe1RI/fZ7FfUhXgT8koJIYoK3LwVrvaiOhQYMlGFzgQJLqV3fb8wQ0RfkNaYAQuhXyFWJwjNI/bw8XcBM05TxI+MCDCx42GK3KSNVb3QHgXa379Z2J0ebUbm7bnCBntEUt+nA/vm4U6deE2EaqgvvGrowP4vMX6ZqGf3lu3v6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711216708; c=relaxed/simple;
	bh=VVP9ALTpJ5W8ZjBOBlZ+323rDesK2QDow0OPQCpYd8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/15BQ/N9cd4eQ6gDKr0pov/wX31kWDRV7nfO7QfyBOYzSo4k2DA3cRf30iPfbwMPuV2sNro1UKKVtZZL9Tc1tG6vaU70vscnzf7GDe9hcICoFI60ezRGD7TYhWsKWWu7KRJimplH6liJivTBbezHWP3mSjP86ut+H1L7WciGAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 794401 invoked by uid 1000); 23 Mar 2024 13:58:17 -0400
Date: Sat, 23 Mar 2024 13:58:17 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: nick black <dankamongmen@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: always print reset/new device message
Message-ID: <4175e097-85e4-48ac-91d3-d78822c2a3b7@rowland.harvard.edu>
References: <20240318052600.671908-1-dankamongmen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318052600.671908-1-dankamongmen@gmail.com>

On Mon, Mar 18, 2024 at 01:25:23AM -0400, nick black wrote:
> Since usb_speed_string() always returns a valid string
> (invalid speeds turn into "UNKNOWN"), go ahead and
> always print this diagnostic, rather than checking the
> speed here (which wasn't up to date for SPEED_SUPER_PLUS,
> and looks like it had an off-by-one error anyway).

This change isn't needed.  For speeds >= SPEED_SUPER, the corresponding 
information is printed in the vicinity of line 5027.

Alan Stern

> Signed-off-by: nick black <dankamongmen@gmail.com>
> ---
>  drivers/usb/core/hub.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index e38a4124f610..7325e5420900 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -4909,11 +4909,10 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  	else
>  		driver_name = udev->bus->sysdev->driver->name;
>  
> -	if (udev->speed < USB_SPEED_SUPER)
> -		dev_info(&udev->dev,
> -				"%s %s USB device number %d using %s\n",
> -				(initial ? "new" : "reset"), speed,
> -				devnum, driver_name);
> +	dev_info(&udev->dev,
> +			"%s %s USB device number %d using %s\n",
> +			(initial ? "new" : "reset"), speed,
> +			devnum, driver_name);
>  
>  	if (initial) {
>  		/* Set up TT records, if needed  */
> -- 
> 2.43.0
> 

