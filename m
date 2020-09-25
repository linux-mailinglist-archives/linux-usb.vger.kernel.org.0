Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A2E278AE1
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 16:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbgIYOcO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 10:32:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:56264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728330AbgIYOcN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 25 Sep 2020 10:32:13 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 905D621D42;
        Fri, 25 Sep 2020 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601044333;
        bh=ZYRiuLPWoNu22xGEaafC7KesGIUFm3ZoQeHXtsnUxUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i4WdgSC6vrIrGtI9jBUQICtsT40O+ZEmIGCPXyuICFHfrc3/3BmajmOdJ1VwgR9mO
         Von6NLFtPxQrUjNwiOwQmNX2pgsoaONpLgbSmzjAyA0/I2AkTpbETyhdCoYIzh6FPt
         Wy1c0eJa6M7rTk4Am/th0WcntaugdEV/KMn/s0/0=
Date:   Fri, 25 Sep 2020 16:32:27 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     himadrispandya@gmail.com, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC 09/14] sound: usx2y: move to use usb_control_msg_send()
Message-ID: <20200925143227.GA3083738@kroah.com>
References: <20200923134348.23862-1-oneukum@suse.com>
 <20200923134348.23862-10-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923134348.23862-10-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 23, 2020 at 03:43:43PM +0200, Oliver Neukum wrote:
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> The usb_control_msg_send() call can handle data on the stack, as well as
> returning an error if a "short" write happens, so move the driver over
> to using that call instead.  This ends up removing a helper function
> that is no longer needed.
> 
> v2: API change in usb_control_msg_send()
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Link: https://lore.kernel.org/r/20200914153756.3412156-7-gregkh@linuxfoundation.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  sound/usb/usx2y/us122l.c | 44 +++++++++-----------------------------------
>  1 file changed, 9 insertions(+), 35 deletions(-)
> 
> diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
> index f86f7a61fb36..3614e6802dc1 100644
> --- a/sound/usb/usx2y/us122l.c
> +++ b/sound/usb/usx2y/us122l.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> +// SPDX-License-Identifier: GPL-2.0-or-late

Odd, my original patch did not change this line :)

I'll go drop this from the patch...

thanks,

greg k-h
