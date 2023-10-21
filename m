Return-Path: <linux-usb+bounces-2029-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA157D1C5D
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 12:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFB1AB214D1
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 10:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB15D53A;
	Sat, 21 Oct 2023 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VYkQ+BVO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49B263B3
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 10:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878A1C433C8;
	Sat, 21 Oct 2023 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697883006;
	bh=l2uGjtCIejrc6L6O3rXUOz/2g7u2EwJLoiJlt0FIuo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYkQ+BVOg6kCqPEW1B9ax8pPK6R+fdAT4cX2JnwULQw21k9NGW6AZI8czxC0KGC6l
	 RR42HeXHp8tIbyXvCf/ToLzs3wfuvUk+GF/97XfiVtkQ+NKlI23AJxqAbUy4xCwrVG
	 pM5PaT4bpOv9DGbjomWWZkM4NAfltHJld8yVRicI=
Date: Sat, 21 Oct 2023 12:10:03 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "zdi-disclosures@trendmicro.com" <zdi-disclosures@trendmicro.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"valentina.manea.m@gmail.com" <valentina.manea.m@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"i@zenithal.me" <i@zenithal.me>
Subject: Re: ZDI-CAN-22273: New Vulnerability Report
Message-ID: <2023102134-reflux-saddling-c750@gregkh>
References: <DM5PR0102MB347711AF2F5655852AC60BEB80DBA@DM5PR0102MB3477.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM5PR0102MB347711AF2F5655852AC60BEB80DBA@DM5PR0102MB3477.prod.exchangelabs.com>

On Fri, Oct 20, 2023 at 03:25:27PM +0000, zdi-disclosures@trendmicro.com wrote:
> ### Analysis
> 
> ```
> race condition bug exists in the usb/ip VHCI driver
> it leads to UAF on `struct usb_device`
> thread 1                                                thread 2
> vhci_device_reset()                             vhci_urb_enqueue()
>  usb_put_dev(vdev->udev);
>                                                                  usb_put_dev(vdev->udev);               // free
>                                                                  vdev->udev = usb_get_dev(urb->dev);    // UAF
>  vdev->udev = NULL;
> ```
> 
> here is the patch in order to trigger the bug more easier
> ```
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 37d1fc34e..7242244d7 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -11,7 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> -
> +#include <linux/delay.h>
>  #include "usbip_common.h"
>  #include "vhci.h"
> 
> @@ -781,6 +781,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>                                 usbip_dbg_vhci_hc(
>                                         "Not yet?:Get_Descriptor to device 0 (get max pipe size)\n");
> 
> +                       mdelay(200);
>                         usb_put_dev(vdev->udev);
>                         vdev->udev = usb_get_dev(urb->dev);
>                         goto out;
> @@ -1075,6 +1076,7 @@ static void vhci_device_reset(struct usbip_device *ud)
>         vdev->devid  = 0;
> 
>         usb_put_dev(vdev->udev);
> +       mdelay(200);
>         vdev->udev = NULL;
> 
>         if (ud->tcp_socket) {
> ```

So you are resetting a device while it is enumerating?  That's a very
narrow window to handle, and you need a malicious device to do this,
right?

Can you submit a patch to just save off the reference of the device
before the put is called on it to be sure that all is in sync properly?

thanks,

greg k-h

