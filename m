Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B794704E0
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 16:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237452AbhLJPwo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 10:52:44 -0500
Received: from netrider.rowland.org ([192.131.102.5]:56909 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S240651AbhLJPv5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 10:51:57 -0500
Received: (qmail 642509 invoked by uid 1000); 10 Dec 2021 10:48:21 -0500
Date:   Fri, 10 Dec 2021 10:48:21 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] usb: core: config: fix validation of wMaxPacketValue
 entries
Message-ID: <YbN2xd7DJuULtOUI@rowland.harvard.edu>
References: <20211210085219.16796-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210085219.16796-1-pavel.hofman@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 10, 2021 at 09:52:18AM +0100, Pavel Hofman wrote:
> The checks performed by commit aed9d65ac327 ("USB: validate
> wMaxPacketValue entries in endpoint descriptors") require that initial
> value of the maxp variable contains both maximum packet size bits
> (10..0) and multiple-transactions bits (12..11). However, the existing
> code assings only the maximum packet size bits. This patch assigns all
> bits of wMaxPacketSize to the variable.
> 
> Fixes: aed9d65ac327 ("USB: validate wMaxPacketValue entries in endpoint descriptors")
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

This should have a "CC: <stable@vger.kernel.org>" tag attached.


>  drivers/usb/core/config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index b199eb65f378..74eb356c8767 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -406,7 +406,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  	 * the USB-2 spec requires such endpoints to have wMaxPacketSize = 0
>  	 * (see the end of section 5.6.3), so don't warn about them.
>  	 */
> -	maxp = usb_endpoint_maxp(&endpoint->desc);
> +	maxp = le16_to_cpu(endpoint->desc.wMaxPacketSize);
>  	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
>  		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid wMaxPacketSize 0\n",
>  		    cfgno, inum, asnum, d->bEndpointAddress);
> -- 
> 2.25.1
> 
