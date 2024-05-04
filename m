Return-Path: <linux-usb+bounces-10023-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1681C8BBC50
	for <lists+linux-usb@lfdr.de>; Sat,  4 May 2024 15:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84EF1F21DB9
	for <lists+linux-usb@lfdr.de>; Sat,  4 May 2024 13:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F75639ACC;
	Sat,  4 May 2024 13:59:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id EFBDE2E647
	for <linux-usb@vger.kernel.org>; Sat,  4 May 2024 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714831162; cv=none; b=M608X418gfeBMSH1JN18ODc3BLHEA3tlnsFxXuaWZpG8br0sFrlotTR8ygF+wcegMqxkKsHyKLRFSTb+KNcqNi/im7Ga9pJTWU8iOqpAelXks6ZnUufPYDfeYyzCrD6N14Ra6GKHpmVl0mc1VXR8z/9NYFRvQGOFejqBdRbL26U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714831162; c=relaxed/simple;
	bh=A21xCyv6exiNvBZK0gTwjNFunBWRe/n4lX+encVLPEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CN2Tt17sRmvHm6THvqS4IvyC5bEzNjBaHpRZsui9SiNrR6nTV0BgAInrEvbKqbcNsgUDXGpdAhV19GquCVbK2/2TPvCTBZWPsLZQ0ZFpwFlhc8rRuZ1UZIgvMO/ZpKhRUT6yqTmggsy+8fcMIEMOxq/bXKa3LToNLYwa6teOEBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 805310 invoked by uid 1000); 4 May 2024 09:59:12 -0400
Date: Sat, 4 May 2024 09:59:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
  linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: Remove the useless struct usb_devmap which is
 just a bitmap
Message-ID: <1126b27f-c672-4d13-b4ce-baf720624823@rowland.harvard.edu>
References: <1d818575ff7a1e8317674aecf761ee23c89fdc84.1714815990.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d818575ff7a1e8317674aecf761ee23c89fdc84.1714815990.git.christophe.jaillet@wanadoo.fr>

On Sat, May 04, 2024 at 11:47:05AM +0200, Christophe JAILLET wrote:
> struct usb_devmap is really just a bitmap. No need to have a dedicated
> structure for that.
> 
> Simplify code and use DECLARE_BITMAP() directly instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> 
> I've re-used the comment related to struct usb_devmap for the devmap field
> in struct usb_bus, because it sounds better to me.
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hcd.c | 4 ++--
>  drivers/usb/core/hub.c | 9 ++++-----
>  include/linux/usb.h    | 7 +------
>  3 files changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c0e005670d67..e3366f4d82b9 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -866,7 +866,7 @@ static int usb_rh_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
>   */
>  static void usb_bus_init (struct usb_bus *bus)
>  {
> -	memset (&bus->devmap, 0, sizeof(struct usb_devmap));
> +	memset(&bus->devmap, 0, sizeof(bus->devmap));
>  
>  	bus->devnum_next = 1;
>  
> @@ -962,7 +962,7 @@ static int register_root_hub(struct usb_hcd *hcd)
>  
>  	usb_dev->devnum = devnum;
>  	usb_dev->bus->devnum_next = devnum + 1;
> -	set_bit (devnum, usb_dev->bus->devmap.devicemap);
> +	set_bit(devnum, usb_dev->bus->devmap);
>  	usb_set_device_state(usb_dev, USB_STATE_ADDRESS);
>  
>  	mutex_lock(&usb_bus_idr_lock);
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 8939f1410644..4b93c0bd1d4b 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2207,13 +2207,12 @@ static void choose_devnum(struct usb_device *udev)
>  	mutex_lock(&bus->devnum_next_mutex);
>  
>  	/* Try to allocate the next devnum beginning at bus->devnum_next. */
> -	devnum = find_next_zero_bit(bus->devmap.devicemap, 128,
> -			bus->devnum_next);
> +	devnum = find_next_zero_bit(bus->devmap, 128, bus->devnum_next);
>  	if (devnum >= 128)
> -		devnum = find_next_zero_bit(bus->devmap.devicemap, 128, 1);
> +		devnum = find_next_zero_bit(bus->devmap, 128, 1);
>  	bus->devnum_next = (devnum >= 127 ? 1 : devnum + 1);
>  	if (devnum < 128) {
> -		set_bit(devnum, bus->devmap.devicemap);
> +		set_bit(devnum, bus->devmap);
>  		udev->devnum = devnum;
>  	}
>  	mutex_unlock(&bus->devnum_next_mutex);
> @@ -2222,7 +2221,7 @@ static void choose_devnum(struct usb_device *udev)
>  static void release_devnum(struct usb_device *udev)
>  {
>  	if (udev->devnum > 0) {
> -		clear_bit(udev->devnum, udev->bus->devmap.devicemap);
> +		clear_bit(udev->devnum, udev->bus->devmap);
>  		udev->devnum = -1;
>  	}
>  }
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 9e52179872a5..1913a13833f2 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -440,11 +440,6 @@ int __usb_get_extra_descriptor(char *buffer, unsigned size,
>  
>  /* ----------------------------------------------------------------------- */
>  
> -/* USB device number allocation bitmap */
> -struct usb_devmap {
> -	unsigned long devicemap[128 / (8*sizeof(unsigned long))];
> -};
> -
>  /*
>   * Allocated per bus (tree of devices) we have:
>   */
> @@ -472,7 +467,7 @@ struct usb_bus {
>  					 * round-robin allocation */
>  	struct mutex devnum_next_mutex; /* devnum_next mutex */
>  
> -	struct usb_devmap devmap;	/* device address allocation map */
> +	DECLARE_BITMAP(devmap, 128);	/* USB device number allocation bitmap */
>  	struct usb_device *root_hub;	/* Root hub */
>  	struct usb_bus *hs_companion;	/* Companion EHCI bus, if any */
>  
> -- 
> 2.45.0
> 
> 

