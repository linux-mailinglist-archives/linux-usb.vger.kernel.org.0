Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7875325E0F
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 08:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhBZHNS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Feb 2021 02:13:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:53490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229990AbhBZHMx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Feb 2021 02:12:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E47DE64EDC;
        Fri, 26 Feb 2021 07:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614323532;
        bh=5QhbTMZNOiRno7ZjVt70Tu+vlYuEGqVbyD/ft/j1iYM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LIngDpq7ynZqD2HR4TM6r1X8aox5+XdTPSj/rJAHdo9Q+Kh0yiDeDqk05zJ1lDj1z
         dZEkK5sGDchDVJelVbE4Z//HbzfBIiuJlcTUuQshMNQSKdgn2Sv97AhwA+GU5vauS+
         MJbJlkh3LTt8+qAnplfskx//XlZku+TTKEtuY5fA=
Date:   Fri, 26 Feb 2021 08:12:09 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     x@btn.sh
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ch341: add new Product ID
Message-ID: <YDifSUcS4CYd8e2s@kroah.com>
References: <0562cd59f06031d676dd314dbada7371@btn.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0562cd59f06031d676dd314dbada7371@btn.sh>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 25, 2021 at 07:33:14PM +0000, x@btn.sh wrote:
> Add PID for CH340 that's found on cheap programers. They are sometimes refered to as ANU232MI like
> in this one:
> https://www.nordfield.com/downloads/anu232mi/ANU232MI-datasheet.pdf
> 
> The driver works flawlessly as soon as the new PID (0x9986) is added to it.
> 
> Signed-off-by: Niv Sardi <xaiki@evilgiggle.com>

This name doesn't match your "From:" line in your email :(

> ---
> drivers/usb/serial/ch341.c | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index 28deaaec581f..f26861246f65 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -86,6 +86,7 @@ static const struct usb_device_id id_table[] = {
> { USB_DEVICE(0x1a86, 0x7522) },
> { USB_DEVICE(0x1a86, 0x7523) },
> { USB_DEVICE(0x4348, 0x5523) },
> + { USB_DEVICE(0x9986, 0x7523) },
> { },
> };
> MODULE_DEVICE_TABLE(usb, id_table);

Your patch is corrupted and can not be applied :(

Please fix up your email client and try again.

thanks,

greg k-h
