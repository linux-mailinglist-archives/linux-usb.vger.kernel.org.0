Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12FF4704E2
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 16:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236530AbhLJPwz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 10:52:55 -0500
Received: from netrider.rowland.org ([192.131.102.5]:34985 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234979AbhLJPwS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 10:52:18 -0500
Received: (qmail 642520 invoked by uid 1000); 10 Dec 2021 10:48:42 -0500
Date:   Fri, 10 Dec 2021 10:48:42 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] usb: core: config: using bit mask instead of
 individual bits
Message-ID: <YbN22jGdvTkWS1O3@rowland.harvard.edu>
References: <20211210085219.16796-1-pavel.hofman@ivitera.com>
 <20211210085219.16796-2-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210085219.16796-2-pavel.hofman@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 10, 2021 at 09:52:19AM +0100, Pavel Hofman wrote:
> Using standard USB_EP_MAXP_MULT_MASK instead of individual bits for
> extracting multiple-transactions bits from wMaxPacketSize value.
> 
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 74eb356c8767..00e28456e4cc 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -422,9 +422,9 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  		maxpacket_maxes = full_speed_maxpacket_maxes;
>  		break;
>  	case USB_SPEED_HIGH:
> -		/* Bits 12..11 are allowed only for HS periodic endpoints */
> +		/* Multiple-transactions bits are allowed only for HS periodic endpoints */
>  		if (usb_endpoint_xfer_int(d) || usb_endpoint_xfer_isoc(d)) {
> -			i = maxp & (BIT(12) | BIT(11));
> +			i = maxp & USB_EP_MAXP_MULT_MASK;
>  			maxp &= ~i;
>  		}
>  		fallthrough;
> -- 
> 2.25.1
> 
