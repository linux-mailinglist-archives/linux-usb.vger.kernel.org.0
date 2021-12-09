Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7403946E3A9
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 09:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbhLIIF5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 03:05:57 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:44148 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbhLIIF4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 03:05:56 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A8CCACE2457
        for <linux-usb@vger.kernel.org>; Thu,  9 Dec 2021 08:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA68C004DD;
        Thu,  9 Dec 2021 08:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639036940;
        bh=5S4Ei8uQMtGfwU/eJgafrccOpbLhkBe6NRoj3nDMu34=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vgLds95CQQ4RpEiwjoHBpvY0bkaqaXzfTQe5y4rkTTcpa0vjrFGyuRONO44zNSVRM
         CBKNlqiGyOZ6aDw/MvXuqCvVv8xXmtdnzPf8GwjWUO5H237pRsxHr7H7JLeBZpO1Jq
         6N2GCorz1RUL0bPGdEDsxp6Edtl7CcdOSeiAcvlo=
Date:   Thu, 9 Dec 2021 09:02:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb:core: possible bug in wMaxPacketSize validation in config.c?
Message-ID: <YbG4CvLEdf5CmYbc@kroah.com>
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
> 
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
>  	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
>  		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has
> invalid wMaxPacketSize 0\n",
>  		    cfgno, inum, asnum, d->bEndpointAddress);
> 
> 
> =========================
> 
> I can send a proper patch should the change be approved.

Please always just send a real patch, that makes it easier to discuss.

Anyway, what problem is this solving?  Do you have a device where the
data is calculated incorrectly?  What value in a device is being
declared incorrect because of the existing code?

thanks,

greg k-h
