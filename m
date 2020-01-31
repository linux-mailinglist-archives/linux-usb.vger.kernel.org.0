Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96E5D14F3E2
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 22:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgAaVkk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 16:40:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:53776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbgAaVkk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jan 2020 16:40:40 -0500
Received: from localhost (unknown [83.216.75.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8C6720707;
        Fri, 31 Jan 2020 21:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580506839;
        bh=udfnxMQtCRGZ78VuTx5Nkd4EJHm/g8HSjOLy0u//yNU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R1SN3NyawKMP2ZYybQ7dmQugMQBF/5cF1zXHMBT+LOy/ITX0v8IWU5x4382Cb5VOJ
         1syyuwsVpYGHa2hul6OjqdCVpw8ADH38JsJxgHDd0rgT2a9psJsxBVZ8vhkSA93HhF
         U40rACny0uz4sTF84vtL3Sp64HtoukLAL6UDC2PU=
Date:   Fri, 31 Jan 2020 22:40:36 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Richard Dodd <richard.o.dodd@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: Usb midi device does not work on wake
Message-ID: <20200131214036.GA2280058@kroah.com>
References: <CAAWug1d8wv3Thu0b==j6fLajU965unYKs552j+s9t13MOytmng@mail.gmail.com>
 <1578907421.2590.2.camel@suse.com>
 <CAAWug1eZiDgMGH9qDi=_Cj_=-HU2icVpNCzeaRYJLzQBChJDJA@mail.gmail.com>
 <20200130063403.GB628384@kroah.com>
 <CAAWug1erbkau-P5hdJ1F3hJBea_nmpiiOiNVJ2-HM2fZ==TS-A@mail.gmail.com>
 <20200130173325.GA1037012@kroah.com>
 <CAAWug1d7u1bGhkyYRbEk1g4a3oMPgxCrppeTPtjLT-uuHhf83g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAWug1d7u1bGhkyYRbEk1g4a3oMPgxCrppeTPtjLT-uuHhf83g@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 31, 2020 at 05:24:27PM +0000, Richard Dodd wrote:
> >From 7d991df69d2c47ac41f4657109cee514eef68728 Mon Sep 17 00:00:00 2001
> From: Richard Dodd <richard.o.dodd@gmail.com>
> Date: Thu, 30 Jan 2020 16:53:51 +0000
> Subject: [PATCH] USB: Fix novation SourceControl XL after suspend
> 
> Currently, the SourceControl will stay in power-down mode after resuming
> from suspend. This patch resets the device after suspend to power it up.
> 
> Signed-off-by: Richard Dodd <richard.o.dodd@gmail.com>
> ---
>  drivers/usb/core/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 6b6413073584..3db6c05aaa4b 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -445,6 +445,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>   /* INTEL VALUE SSD */
>   { USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
> 
> + /* novation SoundControl XL */
> + { USB_DEVICE(0x1235, 0x0061), .driver_info = USB_QUIRK_RESET_RESUME },
> +
>   { }  /* terminating entry must be last */
>  };
> 

Whitespace is all corrupted, tabs are turned into spaces :(

Can you just use git send-email?  Don't use a web email client, they do
not work.

thanks,

greg k-h
