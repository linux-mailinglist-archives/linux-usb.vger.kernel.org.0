Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E0C230BAF
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 15:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730231AbgG1Nmt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 09:42:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55051 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730208AbgG1Nmt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jul 2020 09:42:49 -0400
Received: (qmail 1499376 invoked by uid 1000); 28 Jul 2020 09:42:48 -0400
Date:   Tue, 28 Jul 2020 09:42:48 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eli Billauer <eli.billauer@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.de>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH] usb: core: Solve race condition in usb_kill_anchored_urbs
Message-ID: <20200728134248.GB1498392@rowland.harvard.edu>
References: <20200727072225.25195-1-eli.billauer@gmail.com>
 <1595844840.13408.17.camel@suse.de>
 <5F1EBA04.5050109@gmail.com>
 <1595858285.13408.36.camel@suse.de>
 <20200727144357.GB1468275@rowland.harvard.edu>
 <1595885364.13408.44.camel@suse.de>
 <5F1FF432.9060509@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5F1FF432.9060509@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 28, 2020 at 12:47:30PM +0300, Eli Billauer wrote:
> Oliver, Alan,
> 
> I understand that there's a disagreement in what is allowed or not with the
> anchor API. Effectively that means that I have to assume that driver
> programmers will go either way. I have to admit that my view was that a
> driver must proactively make sure it doesn't submit further URBs to an
> anchor as long as usb_kill_anchored_urbs() runs, through completers or
> otherwise. I formed the current patch accordingly.
> 
> To make things trickier, a driver might rely (correctly or not) on that
> usb_kill_urb() makes sure that resubmission of a URB by the completer, while
> usb_kill_urb() is killing it, will fail. Or at least so says the description
> of this function.
> 
> And once again, the resubmitted URB will remain untouched if the said race
> condition occurs. So a driver's programmer, who relied on usb_kill_urb() to
> prevent the resubmission, might get the impression that he did correctly
> when testing the driver, but then the kernel panic will happen rarely and
> far from the eye.
> 
> Writing an additional API without this problem is beyond the scope of this
> discussion. I'm focused on resolving the problem of the current one. The
> existing API must be safe to use, even if it's planned to phase out.
> 
> Given the discussion so far, I realized that the resubmission by completer
> case must be handled properly as well. So I suggest modifying the patch to
> something like
> 
> do {
>     spin_lock_irq(&anchor->lock);
>     while (!list_empty(&anchor->urb_list)) {
>         /* URB kill loop */
>     }
>     spin_unlock_irq(&anchor->lock);
> } while (unlikely(!usb_anchor_check_wakeup(anchor)));
> 
> The do-while loop will almost never make any difference. But it will loop
> like a waiting spinlock in the rare event of the said race condition, while
> the completer callback executes.
> 
> And if the completer submitted a URB, it will be removed as well this way.
> Recall that this loops only in the event of a race condition, so it will NOT
> play cat-and-mouse with the completer callback, but rather finish this up
> rather quickly.
> 
> And I've dropped the WARN(): If some people consider resubmission of a URB
> to be OK, even while usb_kill_anchored_urbs() is called, no noise should be
> made if that causes a rare but tricky situation.
> 
> And since I'm at it, I'll make the same change to
> usb_poison_anchored_urbs(), which suffers from exactly the same problem.
> 
> What do you think?

This seems like a good way to fix up the existing API, until drivers can 
be converted over to Oliver's "mooring" scheme.  Of course, Oliver might 
not agree...

Alan Stern
