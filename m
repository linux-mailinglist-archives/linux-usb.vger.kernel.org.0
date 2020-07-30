Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63602334B5
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 16:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgG3OqQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 10:46:16 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59891 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726275AbgG3OqP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 10:46:15 -0400
Received: (qmail 1607205 invoked by uid 1000); 30 Jul 2020 10:46:14 -0400
Date:   Thu, 30 Jul 2020 10:46:14 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     eli.billauer@gmail.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        hdegoede@redhat.com, oneukum@suse.de
Subject: Re: [PATCH v4] usb: core: Solve race condition in anchor cleanup
 functions
Message-ID: <20200730144614.GB1604718@rowland.harvard.edu>
References: <20200730141836.16550-1-eli.billauer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730141836.16550-1-eli.billauer@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 30, 2020 at 05:18:36PM +0300, eli.billauer@gmail.com wrote:
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
> Even worse, if the racing completer callback resubmits the URB, it may
> remain in the system long after usb_kill_anchored_urbs() returns.
> 
> Hence list_empty(&anchor->urb_list), which is used in the existing
> while-loop, doesn't reliably ensure that all URBs of the anchor are gone.
> 
> A similar problem exists with usb_poison_anchored_urbs() and
> usb_scuttle_anchored_urbs().
> 
> This patch adds an external do-while loop, which ensures that all URBs
> are indeed handled before these three functions return. This change has
> no effect at all unless the race condition occurs, in which case the
> loop will busy-wait until the racing completer callback has finished.
> This is a rare condition, so the CPU waste of this spinning is
> negligible.
> 
> The additional do-while loop relies on usb_anchor_check_wakeup(), which
> returns true iff the anchor list is empty, and there is no
> __usb_hcd_giveback_urb() in the system that is in the middle of the
> unanchor-before-complete phase. The @suspend_wakeups member of
> struct usb_anchor is used for this purpose, which was introduced to solve
> another problem which the same race condition causes, in commit
> 6ec4147e7bdb ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up
> till completion is done").
> 
> The surely_empty variable is necessary, because usb_anchor_check_wakeup()
> must be called with the lock held to prevent races. However the spinlock
> must be released and reacquired if the outer loop spins with an empty
> URB list while waiting for the unanchor-before-complete passage to finish:
> The completer callback may very well attempt to take the very same lock.
> 
> To summarize, using usb_anchor_check_wakeup() means that the patched
> functions can return only when the anchor's list is empty, and there is
> no invisible URB being processed. Since the inner while loop finishes on
> the empty list condition, the new do-while loop will terminate as well,
> except for when the said race condition occurs.
> 
> Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
> ---

Right here, just under the "---" line, you should include a description 
of how this patch differs from the earlier versions.

>  drivers/usb/core/urb.c | 86 +++++++++++++++++++++++++-----------------
>  1 file changed, 51 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index da923ec17612..ec193ada5f08 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -772,11 +772,12 @@ void usb_block_urb(struct urb *urb)
>  EXPORT_SYMBOL_GPL(usb_block_urb);
>  
>  /**
> - * usb_kill_anchored_urbs - cancel transfer requests en masse
> + * usb_kill_anchored_urbs - kill all URBs associated with an anchor
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
> @@ -784,20 +785,25 @@ EXPORT_SYMBOL_GPL(usb_block_urb);
>  void usb_kill_anchored_urbs(struct usb_anchor *anchor)
>  {
>  	struct urb *victim;
> +	int surely_empty;
>  
> -	spin_lock_irq(&anchor->lock);
> -	while (!list_empty(&anchor->urb_list)) {
> -		victim = list_entry(anchor->urb_list.prev, struct urb,
> -				    anchor_list);
> -		/* we must make sure the URB isn't freed before we kill it*/
> -		usb_get_urb(victim);
> -		spin_unlock_irq(&anchor->lock);
> -		/* this will unanchor the URB */
> -		usb_kill_urb(victim);
> -		usb_put_urb(victim);
> +	do {
>  		spin_lock_irq(&anchor->lock);
> -	}
> -	spin_unlock_irq(&anchor->lock);
> +		while (!list_empty(&anchor->urb_list)) {
> +			victim = list_entry(anchor->urb_list.prev,
> +					    struct urb, anchor_list);
> +			/* make sure the URB isn't freed before we kill it */
> +			usb_get_urb(victim);
> +			spin_unlock_irq(&anchor->lock);
> +			/* this will unanchor the URB */
> +			usb_kill_urb(victim);
> +			usb_put_urb(victim);
> +			spin_lock_irq(&anchor->lock);
> +		}
> +		surely_empty = usb_anchor_check_wakeup(anchor);
> +
> +		spin_unlock_irq(&anchor->lock);

This loop ought to have a cpu_relax() somewhere, probably here.  Same 
for the other two functions.  Otherwise this looks okay to me.

Alan Stern

> +	} while (!surely_empty);
>  }
>  EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
