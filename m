Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F21278C24
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 17:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbgIYPIT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 11:08:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:47552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728406AbgIYPIT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 25 Sep 2020 11:08:19 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DD9C20878;
        Fri, 25 Sep 2020 15:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601046498;
        bh=k/epizE4EWRRk0EwSCVPw+gXMS+6917ZvnzD5AFeMNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lLvCWT6BliaL5efo/ps82uXz/i79NA7Hbv1k7IWk1DC8lBqQvz91nabjjPL2sbaDH
         vAzbIN/rnjWYPlYNAj/KmOE3rgFbBsvbd2ts4IwgOWhy1I1RjmJRMkmQ+5op7BaoGH
         FB4ein7U6evhfhWdcsUu+sO6zJE8mZjCXx3XK+kE=
Date:   Fri, 25 Sep 2020 17:08:32 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v5 01/12] usb: ch9: Add sublink speed struct
Message-ID: <20200925150832.GA3173449@kroah.com>
References: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
 <069433c7c7dc08220cc4a4a2154cf36c57b411af.1601001199.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <069433c7c7dc08220cc4a4a2154cf36c57b411af.1601001199.git.Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 24, 2020 at 07:41:49PM -0700, Thinh Nguyen wrote:
> USB 3.2 specification supports dual-lane for super-speed-plus. USB
> devices may operate at different sublink speeds. To avoid using magic
> numbers and capture the sublink speed better, introduce the
> usb_sublink_speed structure and various sublink speed attribute enum.
> 
> See SSP BOS descriptor in USB 3.2 specification section 9.6.2.5
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> Changes in v5:
> - Rebase on Felipe's testing/next branch
> - Changed Signed-off-by email to match From: email header
> Changes in v4:
> - None
> Changes in v3:
> - None
> Changes in v2:
> - Move to include/linux/usb/ch9.h instead of under uapi
> 
>  include/linux/usb/ch9.h | 43 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
> index 604c6c514a50..01191649a0ad 100644
> --- a/include/linux/usb/ch9.h
> +++ b/include/linux/usb/ch9.h
> @@ -36,6 +36,49 @@
>  #include <linux/device.h>
>  #include <uapi/linux/usb/ch9.h>
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
> + * @type: sublink type
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

__u8?

> +	u16				mantissa;

What endian is this?

> +	enum usb_lane_speed_exponent	exponent;
> +	enum usb_sublink_type		type;
> +	enum usb_link_protocol		protocol;


Crazy packing, is this really the way the field is set up?

thanks,

greg k-h
