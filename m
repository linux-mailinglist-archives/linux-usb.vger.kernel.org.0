Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70F422C978
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 17:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgGXPve (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 11:51:34 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56143 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726381AbgGXPve (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 11:51:34 -0400
Received: (qmail 1393051 invoked by uid 1000); 24 Jul 2020 11:51:33 -0400
Date:   Fri, 24 Jul 2020 11:51:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eli Billauer <eli.billauer@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Ming Lei <ming.lei@canonical.com>,
        Oliver Neukum <oliver@neukum.org>
Subject: Re: usb: core: URB completer callback possibly called after
 usb_kill_anchored_urbs() returns
Message-ID: <20200724155133.GC1388675@rowland.harvard.edu>
References: <5F1AD830.7050406@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5F1AD830.7050406@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 03:46:40PM +0300, Eli Billauer wrote:
> Hello,
> 
> My understanding is it should be OK to assume that no calls to completer
> callbacks will be made after usb_kill_anchored_urbs() returns (for that
> anchor, of course).

As you have discovered, that is not a correct assumption.

>  However __usb_hcd_giveback_urb() in
> drivers/usb/core/hcd.c doesn't seem to work that way. It unanchors first,
> then calls the complete method:
> 
>     usb_unanchor_urb(urb);
>     if (likely(status == 0))
>         usb_led_activity(USB_LED_EVENT_HOST);
> 
>     /* pass ownership to the completion handler */
>     urb->status = status;
>     kcov_remote_start_usb((u64)urb->dev->bus->busnum);
>     urb->complete(urb);
> 
> So if usb_kill_anchored_urbs() is called while __usb_hcd_giveback_urb() is
> in the middle of this code passage, it will miss the URB that is being
> finished, and possibly return before the completer has been called.
> 
> It might sound like a theoretic race condition, but I actually got a kernel
> panic after yanking the USB plug in the middle of heavy traffic. The panic's
> call trace indicated that the driver's completer callback function attempted
> to access memory that had been freed previously. As this happened within an
> IRQ, it was a fullblown computer freeze.
> 
> The same driver's memory freeing mechanism indeed calls
> usb_kill_anchored_urbs() first, then frees the URBs' related data structure.
> So it seems like it freed the memory just before the completer callback was
> invoked.

Right.  There is a genuine race.  Althouogh usb_kill_anchored_urbs() 
does wait for the completion handlers of all the URBs it kills to 
finish, there is some ambiguity about what URBs are on the anchor.

> I would love to submit a patch that moves the usb_unanchor_urb() call a few
> rows down, but something tells me it's not that simple.

No, it isn't.

> As a side note, the comment along with commit 6ec4147, which added
> usb_anchor_{suspend,resume}_wakeups calls, said among others: "But
> __usb_hcd_giveback_urb() calls usb_unanchor_urb before calling the
> completion handler. This is necessary as the completion handler may
> re-submit and re-anchor the urb". Not sure I understood this part, though.

Suppose the completion routine puts the URB onto a different anchor and 
then calls usb_submit_urb().  If __usb_hcd_giveback_urb() then called 
usb_unanchor_urb(), the URB would incorrectly be removed from the wrong 
anchor!

Currently the only way to handle this situation properly is to keep 
track of whether each URB has completed.  For example, if the driver has 
successfully submitted 237 URBs but the completion routine has only been 
called 235 times, the driver will know that there are still two URBs 
pending.

Alan Stern
