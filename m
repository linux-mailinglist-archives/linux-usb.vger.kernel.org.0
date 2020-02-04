Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D20E2151667
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 08:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgBDHUF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Feb 2020 02:20:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:55780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726230AbgBDHUF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Feb 2020 02:20:05 -0500
Received: from localhost (unknown [167.98.85.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60CAA21582;
        Tue,  4 Feb 2020 07:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580800804;
        bh=iPoSgaAE8QkUcyWg95O5ekTRCVmlztjyXNfqgrBMKQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f/eRtFA21GUg4GAZSBlLuhxHv2mMQHE70U63cPQtdfX+x2VGnwYJh6k4qQ4j6+/mV
         B3IU+Xq1QowBOp1h7rIgKRbFdRRbI8QtFeuWZOu329kJKx/BCMDuFEnGZhVlgsvKeM
         53/Vs1T4CGl4bo/rLJksDRpwE6lIdjJ/CGQeeoo0=
Date:   Tue, 4 Feb 2020 07:20:02 +0000
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lauri Jakku <lauri.jakku@pp.inet.fi>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB HID random timeout failures fix proposal
Message-ID: <20200204072002.GC966981@kroah.com>
References: <4bc1c5da-172a-af15-0f2c-d447efeb48d1@pp.inet.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bc1c5da-172a-af15-0f2c-d447efeb48d1@pp.inet.fi>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 04, 2020 at 05:44:45AM +0200, Lauri Jakku wrote:
> Hi,
> 
> 
> I made a patch that does to tackle the USB HID device random behavior by
> 
> re-trying to send command 400ms, 20ms sleep per try.

WHat random behavior are you referring to?

> 
> ---------------------------------------------------------------------------------------
> 
> >From d4214685de329ebe07dfd2298bce46dfae5f80bf Mon Sep 17 00:00:00 2001
> From: Lauri Jakku <lja@iki.fi>
> Date: Tue, 4 Feb 2020 04:52:01 +0200
> Subject: [PATCH] USB HID random timeout failures fixed by trying 20 times
>  send, 20ms apart, control messages, if error is timeout.

The subject line of the patch is a bit too big, and you have no
changelog text in the body of the message, making this patch not able to
be applied.

Also, no need to insert it like this, just use git send-email to submit
it.


> 
> Signed-off-by: Lauri Jakku <lja@iki.fi>
> ---
>  drivers/usb/core/message.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 5adf489428aa..5d615b2f92d8 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -20,6 +20,7 @@
>  #include <linux/usb/hcd.h>     /* for usbcore internals */
>  #include <linux/usb/of.h>
>  #include <asm/byteorder.h>
> +#include <linux/errno.h>

Are you sure this is needed?

>  
>  #include "usb.h"
>  
> @@ -137,7 +138,10 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
>                     __u16 size, int timeout)
>  {
>         struct usb_ctrlrequest *dr;
> -       int ret;
> +       int ret = -ETIMEDOUT;
> +
> +       /* retry_cnt * 10ms, max retry time set to 400ms */
> +       int retry_cnt = 20;
>  
>         dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
>         if (!dr)
> @@ -149,11 +153,27 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
>         dr->wIndex = cpu_to_le16(index);
>         dr->wLength = cpu_to_le16(size);
>  
> -       ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
> +       do {
> +               ret = usb_internal_control_msg(dev,
> +                                       pipe,
> +                                       dr,
> +                                       data,
> +                                       size,
> +                                       timeout);
> +
> +               /*
> +                * Linger a bit, prior to the next control message
> +                * or if return value is timeout, but do try few
> +                * times (max 200ms) before quitting.
> +                */
> +               if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
> +                       msleep(200);
> +               else if (ret == -ETIMEDOUT)
> +                       msleep(20);
> +
> +               /* Loop while timeout, max retry_cnt times. */
> +       } while ((retry_cnt-- > 0) && (ret == -ETIMEDOUT));

Why are we looping always if something went wrong?

And don't we already have a "timeout"?  Why not rely on that?

thanks,

greg k-h
