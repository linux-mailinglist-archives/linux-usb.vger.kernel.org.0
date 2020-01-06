Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5CD71315D4
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 17:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgAFQNl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jan 2020 11:13:41 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41932 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgAFQNl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jan 2020 11:13:41 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73A6052F;
        Mon,  6 Jan 2020 17:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578327219;
        bh=kHSJFXDAsUOBZu6rRQp7Qc3FacWbYjBsFkKwKT7iVOU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eJIV8CU4RYOBeJKsoA93vP1B6h/lFb0i8eHgrU8WJ9huvQI2FfUJSqdWqG+zE0u69
         VLYmPxnt2CvCql0FQK6tMSlqXGUbGSLp1PxHud5JOOCvyuIrsrQXxDVeWZzUZmSqbV
         oS2w3K7ldemheqYKLiOvdFytg8umTcub/RYyy32U=
Date:   Mon, 6 Jan 2020 18:13:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>,
        Roger Whittaker <Roger.Whittaker@suse.com>,
        Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: Fix: Don't skip endpoint descriptors with
 maxpacket=0
Message-ID: <20200106161329.GA13373@pendragon.ideasonboard.com>
References: <20200105122846.GA6776@suse.com>
 <Pine.LNX.4.44L0.2001061040270.1514-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2001061040270.1514-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

Thank you for the patch.

On Mon, Jan 06, 2020 at 10:43:42AM -0500, Alan Stern wrote:
> It turns out that even though endpoints with a maxpacket length of 0
> aren't useful for data transfer, the descriptors do serve other
> purposes.  In particular, skipping them will also skip over other
> class-specific descriptors for classes such as UVC.  This unexpected
> side effect has caused some UVC cameras to stop working.
> 
> In addition, the USB spec requires that when isochronous endpoint
> descriptors are present in an interface's altsetting 0 (which is true
> on some devices), the maxpacket size _must_ be set to 0.  Warning
> about such things seems like a bad idea.
> 
> This patch updates an earlier commit which would log a warning and
> skip these endpoint descriptors.  Now we only log a warning, and we
> don't even do that for isochronous endpoints in altsetting 0.
> 
> We don't need to worry about preventing endpoints with maxpacket = 0
> from ever being used for data transfers; usb_submit_urb() already
> checks for this.
> 
> Reported-and-tested-by: Roger Whittaker <Roger.Whittaker@suse.com>
> Fixes: d482c7bb0541 ("USB: Skip endpoints with 0 maxpacket length")
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://marc.info/?l=linux-usb&m=157790377329882&w=2

The patch looks good to me, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

But shouldn't we also warn if maxp != 0 && usb_endpoint_xfer_isoc(d) &&
asnum == 0 ?

> ---
> 
> 
> [as1928]
> 
> 
>  drivers/usb/core/config.c |   12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> Index: usb-devel/drivers/usb/core/config.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/config.c
> +++ usb-devel/drivers/usb/core/config.c
> @@ -346,12 +346,16 @@ static int usb_parse_endpoint(struct dev
>  			endpoint->desc.wMaxPacketSize = cpu_to_le16(8);
>  	}
>  
> -	/* Validate the wMaxPacketSize field */
> +	/*
> +	 * Validate the wMaxPacketSize field.
> +	 * Some devices have isochronous endpoints in altsetting 0;
> +	 * the USB-2 spec requires such endpoints to have wMaxPacketSize = 0
> +	 * (see the end of section 5.6.3), so don't warn about them.
> +	 */
>  	maxp = usb_endpoint_maxp(&endpoint->desc);
> -	if (maxp == 0) {
> -		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has wMaxPacketSize 0, skipping\n",
> +	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
> +		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid wMaxPacketSize 0\n",
>  		    cfgno, inum, asnum, d->bEndpointAddress);
> -		goto skip_to_next_endpoint_or_interface_descriptor;
>  	}
>  
>  	/* Find the highest legal maxpacket size for this endpoint */

-- 
Regards,

Laurent Pinchart
