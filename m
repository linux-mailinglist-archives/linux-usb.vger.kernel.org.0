Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928F9105797
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 17:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfKUQy3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 11:54:29 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:43220 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727188AbfKUQy3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 11:54:29 -0500
Received: (qmail 2590 invoked by uid 2102); 21 Nov 2019 11:54:28 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Nov 2019 11:54:28 -0500
Date:   Thu, 21 Nov 2019 11:54:28 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Ikjoon Jang <ikjn@chromium.org>
cc:     linux-usb@vger.kernel.org,
        GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        JohanHovold <johan@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <drinkcat@chromium.org>
Subject: Re: [PATCH v2 2/2] usb: overridable hub bInterval by device node
In-Reply-To: <20191121051819.111593-1-ikjn@chromium.org>
Message-ID: <Pine.LNX.4.44L0.1911211153110.1553-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 21 Nov 2019, Ikjoon Jang wrote:

> This patch enables hub device to override its own endpoint descriptor's
> bInterval when the hub has a device node with "hub,interval" property.
> 
> When we know reducing autosuspend delay for built-in HIDs is better for
> power saving, we can reduce it to the optimal value. But if a parent hub
> has a long bInterval, mouse lags a lot from more frequent autosuspend.
> So this enables overriding bInterval for a hard wired hub device only
> when we know that reduces the power consumption.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
>  drivers/usb/core/config.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 5f40117e68e7..d2d9c6d6e00a 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -6,6 +6,7 @@
>  #include <linux/usb.h>
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/hcd.h>
> +#include <linux/usb/of.h>
>  #include <linux/usb/quirks.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -257,6 +258,11 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno, int inum,
>  	memcpy(&endpoint->desc, d, n);
>  	INIT_LIST_HEAD(&endpoint->urb_list);
>  
> +	/* device node property overrides bInterval */
> +	if (usb_of_has_combined_node(to_usb_device(ddev)))
> +		of_property_read_u8(ddev->of_node, "hub, interval",

Does it matter that this says "hub, interval" whereas the documentation 
says "hub,interval" (with no space character)?

> +				    &d->bInterval);
> +
>  	/*
>  	 * Fix up bInterval values outside the legal range.
>  	 * Use 10 or 8 ms if no proper value can be guessed.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

