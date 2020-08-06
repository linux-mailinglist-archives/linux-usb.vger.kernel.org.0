Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF74423DC76
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 18:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729508AbgHFQwZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 12:52:25 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52177 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729382AbgHFQv5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Aug 2020 12:51:57 -0400
Received: (qmail 200331 invoked by uid 1000); 6 Aug 2020 11:20:39 -0400
Date:   Thu, 6 Aug 2020 11:20:39 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Eli Billauer <eli.billauer@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [RFC]mooring API
Message-ID: <20200806152039.GC197575@rowland.harvard.edu>
References: <1596722827.2488.8.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596722827.2488.8.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 06, 2020 at 04:07:07PM +0200, Oliver Neukum wrote:
> Hi,
> 
> why this new API? Eli found a race with the existing API. Many
> drivers are acribing to it semantics it never had. Now we have
> sort of a fix, but it is not really elegant.
> The anchors have always been about making it easier to write drivers.
> Hence if driver authors are assumuning that they have a power, we
> better provide that facility. What users need is a facility
> to group URBs together and get rid of them no questions asked.
> It would be best if we can do that with minimal changes.
> 
> Here is a V2 taking into account Alan's remarks, and using a separate
> flag.
> 
> 	Regards
> 		Oliver
> 
> From 79df4240287b712bbe08404af7f900c3bccfca40 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Tue, 28 Jul 2020 11:38:23 +0200
> Subject: [PATCH] USB: add mooring API
> 
> This is a simplified and thereby better version of the anchor API.
> Anchors have the problem that they unanchor an URB upon giveback,
> which creates a window during which an URB is unanchored but not
> yet returned, leading to operations on anchors not having the
> semantics many driver errornously assume them to have.
> The new API keeps an URB on an anchor until it is explicitly
> unmoored.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.de>
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/hcd.c |  4 +++-
>  drivers/usb/core/urb.c | 27 ++++++++++++++++++++++++++-
>  include/linux/usb.h    |  3 +++
>  3 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index a33b849e8beb..e1d26cb595c3 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1640,7 +1640,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
>  	unmap_urb_for_dma(hcd, urb);
>  	usbmon_urb_complete(&hcd->self, urb, status);
>  	usb_anchor_suspend_wakeups(anchor);
> -	usb_unanchor_urb(urb);
> +	smp_rmb(); /* against usb_(un)moor_urb() */

What is the race you want to protect against?

Wouldn't it be better to require drivers that want to moor an URB to do 
so before submitting it?  And to unmoor an URB only in the completion 
handler?  Then there wouldn't be any race.

Alan Stern

> +	if (!urb->moored)
> +		usb_unanchor_urb(urb);
>  	if (likely(status == 0))
>  		usb_led_activity(USB_LED_EVENT_HOST);
