Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9206846ED05
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 17:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbhLIQaN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 11:30:13 -0500
Received: from netrider.rowland.org ([192.131.102.5]:36085 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232040AbhLIQaN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 11:30:13 -0500
Received: (qmail 608424 invoked by uid 1000); 9 Dec 2021 11:26:38 -0500
Date:   Thu, 9 Dec 2021 11:26:38 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb:core: possible bug in wMaxPacketSize validation in config.c?
Message-ID: <YbIuPrQCLtfsx8IH@rowland.harvard.edu>
References: <ce5ed936-4325-95a1-cd1c-eece35c4b613@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce5ed936-4325-95a1-cd1c-eece35c4b613@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 09, 2021 at 08:53:37AM +0100, Pavel Hofman wrote:
> Hi,
> 
> in
> https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/config.c#L409
> the initial value of maxp is obtained using function usb_endpoint_maxp.
> 
> maxp = usb_endpoint_maxp(&endpoint->desc);
> 
> This function https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/usb/ch9.h#L647
> returns only the bits 0 - 10 of the wMaxPacketSize field, i.e. dropping the
> high-bandwidth bits 11 and 12. Yet the subsequent code extracts these bits
> from maxp into variable i
> https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/config.c#L427
> , clears them in maxp, and re-sets back in one of the further checks
> https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/config.c#L445

This is clearly wrong.  Good catch.

> IMO that means the code requires that initial value of maxp contains the
> additional-transactions bits. IMO the code should be fixed with this trivial
> patch (tested on my build):
> 
> 
> ===================================================================
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> --- a/drivers/usb/core/config.c	(revision
> 018dd9dd80ab5f3bd988911b1f10255029ffa52d)
> +++ b/drivers/usb/core/config.c	(date 1638972286064)
> @@ -406,7 +406,7 @@
>  	 * the USB-2 spec requires such endpoints to have wMaxPacketSize = 0
>  	 * (see the end of section 5.6.3), so don't warn about them.
>  	 */
> -	maxp = usb_endpoint_maxp(&endpoint->desc);
> +	maxp = endpoint->desc.wMaxPacketSize;

You need to say: le16_to_cpu(endpoint->desc.wMaxPacketSize).

It also wouldn't hurt to change the line which calculates i.  Replace (BIT(12) | 
BIT(11)) with USB_EP_MAXP_MULT_MASK, and adjust the preceding comment 
accordingly.

Alan Stern
