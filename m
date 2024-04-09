Return-Path: <linux-usb+bounces-9157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB0589DD63
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 16:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7212D2899E4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 14:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9E912FF65;
	Tue,  9 Apr 2024 14:56:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E45D512FF6D
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712674617; cv=none; b=gguv4zA/dLP/UmKCgPxDmS/VV1hFbBUFMpqepYW4wtf9ZsPLNE0aaFe42coURkvXZtSJwYIucS+kicW02ywttSCSgIsGyiB9lZ2NmteZpMhA0CCN8t7OANdo3G2QA+nL7ecHUJy6iP3WlNFL5f7zKeJMaVNFZtwKt9T27YZV6mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712674617; c=relaxed/simple;
	bh=8lr2MR8C02WgnhpkRUvVA/BpIzPPUyJHZ0H7kgzrWSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peM3nLFmL4Yc9tsQ0BYWJZGt3z77MkC4t3ocbzsjFaYHBaZuJvjAj9MJgGaQ/8VaordOygRpLXv4C9YlZbsmf2yN2MAZPOu074/5gfU8Ze5Fx2UQeNVDhSEtw5/dR05ztCjo/tyaUx4b2ypXU7hLHg6fPYq8DUHpery9ReRLqQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 168303 invoked by uid 1000); 9 Apr 2024 10:56:53 -0400
Date: Tue, 9 Apr 2024 10:56:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in
 SuperSpeed initialization")
Message-ID: <78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>

On Tue, Apr 09, 2024 at 03:49:01PM +0200, Oliver Neukum wrote:
> Hi,
> 
> with the following device:
> 
> Bus 002 Device 002: ID fb5d:0001 BHYVE HID Tablet
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               3.00
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0         8

A USB-3 device, running at SuperSpeed with its bMaxPacketSize0 set to 8 
instead of 9?  Presumably this thing never received a USB certification.  
Does the packaging use the USB logo?

>   idVendor           0xfb5d
>   idProduct          0x0001
>   bcdDevice            0.00
>   iManufacturer           1 BHYVE
>   iProduct                2 HID Tablet
>   iSerial                 3 01
>   bNumConfigurations      1

Why on earth would an HID tablet need to run at SuperSpeed?

> Binary Object Store Descriptor:
>   bLength                 5
>   bDescriptorType        15
>   wTotalLength       0x000f
>   bNumDeviceCaps          1
>   SuperSpeed USB Device Capability:
>     bLength                10
>     bDescriptorType        16
>     bDevCapabilityType      3
>     bmAttributes         0x00
>     wSpeedsSupported   0x0008
>       Device can operate at SuperSpeed (5Gbps)
>     bFunctionalitySupport   3
>       Lowest fully-functional device speed is SuperSpeed (5Gbps)
>     bU1DevExitLat          10 micro seconds
>     bU2DevExitLat          32 micro seconds

A tablet not capable of running at any speed below 5 Gbps?

> we are getting a regression on enumeration. It used to work with the
> code prior to your patch. Takashi is proposing the attached fixed.
> It looks like we are a bit too restrictive and should just try.
> 
> 	Regards
> 		Oliver

> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] USB: hub: Workaround for buggy max packet size with super
>  speed
> Patch-mainline: Not yet, testing
> References: bsc#1220569
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> ---
>  drivers/usb/core/hub.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index e38a4124f610..64193effc456 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -4830,7 +4830,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  	const char		*driver_name;
>  	bool			do_new_scheme;
>  	const bool		initial = !dev_descr;
> -	int			maxp0;
> +	int			maxp0, ep0_maxp;
>  	struct usb_device_descriptor	*buf, *descr;
>  
>  	buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
> @@ -5070,7 +5070,8 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  		else
>  			i = 0;		/* Invalid */
>  	}
> -	if (usb_endpoint_maxp(&udev->ep0.desc) == i) {
> +	ep0_maxp = usb_endpoint_maxp(&udev->ep0.desc);
> +	if (ep0_maxp == i) {

This variable looks like it was left over from earlier testing.  It's 
not really needed.

>  		;	/* Initial ep0 maxpacket guess is right */
>  	} else if ((udev->speed == USB_SPEED_FULL ||
>  				udev->speed == USB_SPEED_HIGH) &&
> @@ -5082,9 +5083,15 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  			dev_warn(&udev->dev, "Using ep0 maxpacket: %d\n", i);
>  		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(i);
>  		usb_ep0_reinit(udev);
> +	} else if (udev->speed >= USB_SPEED_SUPER && initial) {
> +		/* FIXME: should be more restrictive? */
> +		/* Initial guess is wrong; use the descriptor's value */
> +		dev_warn(&udev->dev, "Using ep0 maxpacket: %d\n", i);
> +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(i);
> +		usb_ep0_reinit(udev);

This could be merged with the previous case fairly easily.

>  	} else {
>  		/* Initial guess is wrong and descriptor's value is invalid */
> -		dev_err(&udev->dev, "Invalid ep0 maxpacket: %d\n", maxp0);
> +		dev_err(&udev->dev, "Invalid ep0 maxpacket: %d, expected %d\n", maxp0, ep0_maxp);

This also looks like a remnant from earlier testing.

Alan Stern

>  		retval = -EMSGSIZE;
>  		goto fail;
>  	}
> -- 
> 2.35.3
> 


