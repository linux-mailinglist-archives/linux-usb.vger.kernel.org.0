Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5881722349E
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 08:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbgGQGeM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 02:34:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:34690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726141AbgGQGeL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Jul 2020 02:34:11 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6A5521744;
        Fri, 17 Jul 2020 06:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594967651;
        bh=8yib4Kz1ghGHGqd4sNsAIsjxgobO7JhYwh5UEDfbV50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AKvFNGQsjTGhsAVVYVNFNQGayLCCFiRnJW2Vfwt1uAR8yDW6sgkrhxrc2Kmfca8j7
         3dDKRnfu5aFApT3v7ecQl9tfNienlc3sdPmOBtmUZeJLOVBNTRFkDDGUrPglprB4wq
         /jHEEevjOQF89l/gCdsHqJVEWx053PpR4MZZwKQs=
Date:   Fri, 17 Jul 2020 08:34:03 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 01/11] usb: ch9: Add sublink speed struct
Message-ID: <20200717063403.GC3238569@kroah.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <90961eec3e1ed3c27e41e7169353cc295c551604.1594935978.git.thinhn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90961eec3e1ed3c27e41e7169353cc295c551604.1594935978.git.thinhn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 16, 2020 at 02:58:36PM -0700, Thinh Nguyen wrote:
> USB 3.2 specification supports dual-lane for super-speed-plus. USB
> devices may operate at different sublink speeds. To avoid using magic
> numbers and capture the sublink speed better, introduce the
> usb_sublink_speed structure and various sublink speed attribute enum.
> 
> See SSP BOS descriptor in USB 3.2 specification section 9.6.2.5
> 
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  include/uapi/linux/usb/ch9.h | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
> index 2b623f36af6b..d4fd403a3664 100644
> --- a/include/uapi/linux/usb/ch9.h
> +++ b/include/uapi/linux/usb/ch9.h
> @@ -1145,6 +1145,48 @@ enum usb_device_speed {
>  	USB_SPEED_SUPER_PLUS,			/* usb 3.1 */
>  };
>  
> +/* USB 3.2 sublink speed attributes */
> +
> +enum usb_lane_speed_exponent {
> +	USB_LSE_BPS = 0,
> +	USB_LSE_KBPS = 1,
> +	USB_LSE_MBPS = 2,
> +	USB_LSE_GBPS = 3,
> +};
> +
> +enum usb_sublink_type {
> +	USB_ST_SYMMETRIC_RX = 0,
> +	USB_ST_ASYMMETRIC_RX = 1,
> +	USB_ST_SYMMETRIC_TX = 2,
> +	USB_ST_ASYMMETRIC_TX = 3,
> +};
> +
> +enum usb_link_protocol {
> +	USB_LP_SS = 0,
> +	USB_LP_SSP = 1,
> +};
> +
> +/**
> + * struct usb_sublink_speed - sublink speed attribute
> + * @id: sublink speed attribute ID (SSID)
> + * @mantissa: lane speed mantissa
> + * @exponent: lane speed exponent
> + * @sublink type: sublink type
> + * @protocol: sublink protocol
> + *
> + * Super-speed-plus supports multiple lanes. Use the sublink speed attributes to
> + * describe the sublink speed.
> + *
> + * See USB 3.2 spec section 9.6.2.6 for super-speed-plus capability for more
> + * information.
> + */
> +struct usb_sublink_speed {
> +	u8				id;
> +	u16				mantissa;

You have to use the proper data types for crossing the user/kernel
boundry here.  That would be __u8 and __u16, right?

> +	enum usb_lane_speed_exponent	exponent;
> +	enum usb_sublink_type		type;
> +	enum usb_link_protocol		protocol;

Are you _sure_ that an enum is the correct size for these fields?  How
can you guarantee this?  We do not use enums in this way for any other
field in this file for a reason...

And did you look at the layout of this structure to verify it actually
matches what is on the wire with USB?  I think you need to add a packed
attribute to guarantee it.

thanks,

greg k-h


> +};
>  
>  enum usb_device_state {
>  	/* NOTATTACHED isn't in the USB spec, and this state acts
> -- 
> 2.11.0
> 
