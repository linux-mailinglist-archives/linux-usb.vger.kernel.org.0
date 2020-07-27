Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED3E22E8BC
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 11:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgG0JVr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 05:21:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:52106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbgG0JVr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jul 2020 05:21:47 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37E6320658;
        Mon, 27 Jul 2020 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595841706;
        bh=YsXrXhSPR5O9LZbhFI9u3/annkNek25UBN0Et/rEjLU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MWRifUwSo5JqIuT20XUmMsNJGpvhIKS9ZUEfm5HJRnq6htfQy/fKD0ORQ3fz3YGXB
         W/4XvE/YxUXl8lmntFlHUjIQ25BKQkXVTOx72y3O9y2HxhkDZypHEfQEd8HuYJnMuL
         FHYRCkCSTJvslKugkG/rB0ZrjYmRO8vj8PUWCgzY=
Date:   Mon, 27 Jul 2020 11:21:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     eli.billauer@gmail.com
Cc:     linux-usb@vger.kernel.org, hdegoede@redhat.com,
        stern@rowland.harvard.edu
Subject: Re: [PATCH] usb: core: Solve race condition in usb_kill_anchored_urbs
Message-ID: <20200727092141.GA1764157@kroah.com>
References: <20200727072225.25195-1-eli.billauer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727072225.25195-1-eli.billauer@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 27, 2020 at 10:22:25AM +0300, eli.billauer@gmail.com wrote:
> From: Eli Billauer <eli.billauer@gmail.com>
> 
> usb_kill_anchored_urbs() is commonly used to cancel all URBs on an
> anchor just before releasing resources which the URBs rely on. By doing
> so, users of this function rely on that no completer callbacks will take
> place from any URB on the anchor after it returns.
> 
> However if this function is called in parallel with __usb_hcd_giveback_urb
> processing a URB on the anchor, the latter may call the completer
> callback after usb_kill_anchored_urbs() returns. This can lead to a
> kernel panic due to use after release of memory in interrupt context.
> 
> The race condition is that __usb_hcd_giveback_urb() first unanchors the URB
> and then makes the completer callback. Such URB is hence invisible to
> usb_kill_anchored_urbs(), allowing it to return before the completer has
> been called, since the anchor's urb_list is empty.
> 
> This patch adds a call to usb_wait_anchor_empty_timeout() prior to
> returning. This function waits until urb_list is empty (it should
> already be), but more importantly, until @suspend_wakeups is zero.
> 
> The latter condition resolves the race condition, since @suspend_wakeups
> is incremented by __usb_hcd_giveback_urb() before unanchoring a URB and
> decremented after completing it. @suspend_wakeups is hence an upper limit
> of the number of unanchored but uncompleted URBs. By waiting for it to be
> zero, the race condition is eliminated, in the same way that another
> problem was solved for the same race condition in commit 6ec4147e7bdb
> ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up till completion
> is done").
> 
> An arbitrary timeout of 1000 ms should cover any sane completer
> callback. The wait condition may also fail if the anchor is populated
> while usb_kill_anchored_urbs() is called. Both timeout scenarios are
> alarmingly weird, hence a WARN() is issued.
> 
> Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
> ---
>  drivers/usb/core/urb.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index da923ec17612..7fa23615199f 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -772,11 +772,12 @@ void usb_block_urb(struct urb *urb)
>  EXPORT_SYMBOL_GPL(usb_block_urb);
>  
>  /**
> - * usb_kill_anchored_urbs - cancel transfer requests en masse
> + * usb_kill_anchored_urbs -  kill all URBs associated with an anchor
>   * @anchor: anchor the requests are bound to
>   *
> - * this allows all outstanding URBs to be killed starting
> - * from the back of the queue
> + * This kills all outstanding URBs starting from the back of the queue,
> + * with guarantee that no completer callbacks will take place from the
> + * anchor after this function returns.
>   *
>   * This routine should not be called by a driver after its disconnect
>   * method has returned.
> @@ -784,6 +785,7 @@ EXPORT_SYMBOL_GPL(usb_block_urb);
>  void usb_kill_anchored_urbs(struct usb_anchor *anchor)
>  {
>  	struct urb *victim;
> +	int ret;
>  
>  	spin_lock_irq(&anchor->lock);
>  	while (!list_empty(&anchor->urb_list)) {
> @@ -798,6 +800,10 @@ void usb_kill_anchored_urbs(struct usb_anchor *anchor)
>  		spin_lock_irq(&anchor->lock);
>  	}
>  	spin_unlock_irq(&anchor->lock);
> +
> +	ret = usb_wait_anchor_empty_timeout(anchor, 1000);
> +
> +	WARN(!ret, "Returning with non-empty anchor due to timeout");

Don't do a warn-on for things that can be triggered by userspace (i.e.
"bad USB device), as that can cause systems to reboot, and will get
caught by the syzbot testing tool.

Also, will this cause things to take longer than they used to?  What
race conditions is this going to cause?  :)

thanks,

greg k-h
