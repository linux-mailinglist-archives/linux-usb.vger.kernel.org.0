Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1B422F2DF
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 16:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgG0On6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 10:43:58 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34929 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727833AbgG0On6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 10:43:58 -0400
Received: (qmail 1469406 invoked by uid 1000); 27 Jul 2020 10:43:57 -0400
Date:   Mon, 27 Jul 2020 10:43:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.de>
Cc:     Eli Billauer <eli.billauer@gmail.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH] usb: core: Solve race condition in usb_kill_anchored_urbs
Message-ID: <20200727144357.GB1468275@rowland.harvard.edu>
References: <20200727072225.25195-1-eli.billauer@gmail.com>
 <1595844840.13408.17.camel@suse.de>
 <5F1EBA04.5050109@gmail.com>
 <1595858285.13408.36.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595858285.13408.36.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 27, 2020 at 03:58:05PM +0200, Oliver Neukum wrote:
> Am Montag, den 27.07.2020, 14:27 +0300 schrieb Eli Billauer:
> > Hello, Oliver.
> > 
> > On 27/07/20 13:14, Oliver Neukum wrote:
> > > That however is really a kludge we cannot have in usbcore.
> > > I am afraid as is the patch should_not_  be applied.
> > >    
> > 
> > Could you please explain further why the suggested patch is unsuitable?
> 
> Hi,
> 
> certainly.
> 
> 1. timeouts are generally a bad idea, especially if the timeout does
> not come out of a spec.
> 
> 2. That involves quoting you:
> 
> Alternatively, if the driver submits URBs to the same anchor while 
> usb_kill_anchored_urbs() is called, this timeout might be reached. This 

That would be a bug in the driver, though.  In such a situation, a WARN 
is worth having.

> could happen, for example, if the completer function that ran in the 
> racy situation resubmits the URB. If that situation isn't cleared within 
> 1000ms, it means that there's a URB in the system that the driver isn't 
> aware of. Maybe that situation is worth more than a WARN.
> 
> That is an entirely valid use case. And a bulk URB may take a potentially
> unbounded time to complete.

It is _not_ a valid use case.  Since usb_kill_anchored_urbs() doesn't' 
specify whether it will kill URBs that are added to the anchor after it 
is called (and before it returns), a driver that anchors URBs at such a 
time is buggy.

Maybe this should be mentioned in the kerneldoc for the routine: Drivers 
must not add URBs to the anchor while the routine is running.

> My failure in this case is simply overengineering.
> If this line:
> 
>         usb_unanchor_urb(urb);
> 
> In __usb_hcd_giveback_urb(struct urb *urb) weren't there, the issue
> would not exist. I misdesigned the API in automatically unanchoring
> a completing URB.
> Simply removing it now is no longer possible, so we need to come up with
> a more complex solution.

Given that this timeout-based API is already present and being used in a 
separate context, I don't see anything wrong with using it here as well.

Alan Stern
