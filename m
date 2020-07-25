Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A082222D9AD
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 21:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgGYTxp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 15:53:45 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38023 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727034AbgGYTxp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 15:53:45 -0400
Received: (qmail 1426650 invoked by uid 1000); 25 Jul 2020 15:53:44 -0400
Date:   Sat, 25 Jul 2020 15:53:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eli Billauer <eli.billauer@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Oliver Neukum <oliver@neukum.org>
Subject: Re: usb: core: URB completer callback possibly called after
 usb_kill_anchored_urbs() returns
Message-ID: <20200725195344.GA1426415@rowland.harvard.edu>
References: <5F1AD830.7050406@gmail.com>
 <20200724155133.GC1388675@rowland.harvard.edu>
 <5F1C6152.8000500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5F1C6152.8000500@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 25, 2020 at 07:44:02PM +0300, Eli Billauer wrote:
> Hello Alan & all,
> 
> Thanks for your response.
> 
> The thing is that I'm not alone assuming that it's fine to free resources
> after usb_kill_anchored_urbs() returns. Most notable is usb-skeleton.c,
> which does exactly that in skel_disconnect():
> 
>     usb_kill_anchored_urbs(&dev->submitted);
> 
>     /* decrement our usage count */
>     kref_put(&dev->kref, skel_delete);
> 
> Needless to say, skel_delete() frees the struct that the URBs' contexts
> point at.
> 
> Keeping track of the number of uncompleted URBs, as you suggested, is indeed
> a solution. But as it seems that the only problem is the race condition
> between usb_kill_anchored_urbs() and __usb_hcd_giveback_urb(), I suppose
> it's enough to ensure that the resources are not freed while
> __usb_hcd_giveback_urb() is doing its unanchor-before-complete thing.
> 
> After taking a second look, I discovered that there's already a function
> that takes the race condition into consideration:
> usb_wait_anchor_empty_timeout().
> 
> Looking again at commit 6ec4147, which I mentioned before, it turns out that
> it added a counter to each anchor struct (atomic_t suspend_wakeups). It's
> incremented in __usb_hcd_giveback_urb() just before unanchoring a URB, and
> decremented after the completion has been called. This is made with calls to
> usb_anchor_suspend_wakeups() and usb_anchor_resume_wakeups(), but that's the
> essence of these calls.
> 
> And there's a wait queue in place, which gets a wakeup call by
> usb_anchor_resume_wakeups(), if the anchor's list is empty and the counter
> is zero after decrementing it. In the said commit,
> usb_wait_anchor_empty_timeout() was modified to check the counter as well,
> so when it returns, the anchor is genuinely idle.
> 
> So I would say that the safe way to go is
> 
>   usb_kill_anchored_urbs(&ep->anchor);
>   if (!usb_wait_anchor_empty_timeout(&ep->anchor, 1000)) {
>      /* This is really bad */
>   }
>   /* Release memory */
> 
> And if indeed so, I'm thinking about submitting a patch, which adds a
> usb_wait_anchor_empty_timeout() at the bottom of usb_kill_anchored_urbs().
> So that the function does what people out there think it does.
> 
> Have I missed something?

That sounds like a good proposal to me.  The 1-second timeout is 
somewhat arbitrary, but I guess it's okay since we expect unlink 
operations to be pretty quick.

Alan Stern
