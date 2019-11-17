Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B455EFF846
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2019 08:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbfKQHNt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 Nov 2019 02:13:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:37448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbfKQHNt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 17 Nov 2019 02:13:49 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BE6C20740;
        Sun, 17 Nov 2019 07:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573974828;
        bh=j7Bs+diMZEMbUIQkhivZLARsKXnsztOT8Ds55IBEdwE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ut+RM31+rtjGadKv8x+wnC948FoabkE8ZblLVbhWDVUNhnO9ITahC2kaGFTRaydVJ
         mVd2bPJB8PMsVo7o460X2DfJdZM+op6YprBrKmXakrIwy9yRyzElqq47G4Y19Tg+OY
         KnoE8IGlw0gavvNAd0Qbv6QZrU/nea9MDC6OE3+A=
Date:   Sun, 17 Nov 2019 08:13:45 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Suwan Kim <suwan.kim027@gmail.com>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        Johan Hovold <johan@kernel.org>,
        Nicolas Boitchat <drinkcat@chromium.org>
Subject: Re: [PATCH 2/2] usb: overridable hub bInterval by device node
Message-ID: <20191117071345.GB496402@kroah.com>
References: <20191117033305.259789-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191117033305.259789-1-ikjn@chromium.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Nov 17, 2019 at 11:33:05AM +0800, Ikjoon Jang wrote:
> This patch enables hub device to override its own endpoint descriptor's
> bInterval when the hub has a device node with "hub,interval" property,
> 
> Some existing hub devices have adjustable interval so the device is
> allowed to use different bInterval. This is useful when the hub's default
> bInterval is too big, so child device's waking up from autosuspend
> takes much time.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
>  drivers/usb/core/config.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 5f40117e68e7..234ca6124c98 100644
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
> +	if (unlikely(usb_of_has_combined_node(to_usb_device(ddev))))

Only ever use likely/unlikely if you can measure the difference with a
benchmark.  If not, then never use it as the compiler and CPU will
almost always get it right and more correct than you can.

And for code that has no performance issues/impact like this one, never
do it.

thanks,

greg k-h
