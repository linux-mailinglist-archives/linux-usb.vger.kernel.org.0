Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F632234740
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 15:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730903AbgGaN5R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 09:57:17 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42209 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730733AbgGaN5R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jul 2020 09:57:17 -0400
Received: (qmail 36867 invoked by uid 1000); 31 Jul 2020 09:57:15 -0400
Date:   Fri, 31 Jul 2020 09:57:15 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     eli.billauer@gmail.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        hdegoede@redhat.com, oneukum@suse.de
Subject: Re: [PATCH v5] usb: core: Solve race condition in anchor cleanup
 functions
Message-ID: <20200731135715.GA36650@rowland.harvard.edu>
References: <20200731054650.30644-1-eli.billauer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731054650.30644-1-eli.billauer@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 31, 2020 at 08:46:50AM +0300, eli.billauer@gmail.com wrote:
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
> Difference from patch v4: Added cpu_relax() calls per Alan's advice.
>  drivers/usb/core/urb.c | 89 +++++++++++++++++++++++++-----------------
>  1 file changed, 54 insertions(+), 35 deletions(-)

Acked-by: Alan Stern <stern@rowland.harvard.edu>
