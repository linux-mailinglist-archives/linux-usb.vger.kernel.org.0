Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD2C22FB62
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 23:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgG0V3g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 17:29:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:51610 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgG0V3g (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jul 2020 17:29:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 0A73FAD2C;
        Mon, 27 Jul 2020 21:29:45 +0000 (UTC)
Message-ID: <1595885364.13408.44.camel@suse.de>
Subject: Re: [PATCH] usb: core: Solve race condition in
 usb_kill_anchored_urbs
From:   Oliver Neukum <oneukum@suse.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Eli Billauer <eli.billauer@gmail.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, hdegoede@redhat.com
Date:   Mon, 27 Jul 2020 23:29:24 +0200
In-Reply-To: <20200727144357.GB1468275@rowland.harvard.edu>
References: <20200727072225.25195-1-eli.billauer@gmail.com>
         <1595844840.13408.17.camel@suse.de> <5F1EBA04.5050109@gmail.com>
         <1595858285.13408.36.camel@suse.de>
         <20200727144357.GB1468275@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 27.07.2020, 10:43 -0400 schrieb Alan Stern:
> On Mon, Jul 27, 2020 at 03:58:05PM +0200, Oliver Neukum wrote:
> > Am Montag, den 27.07.2020, 14:27 +0300 schrieb Eli Billauer:
> > > Hello, Oliver.
> > > 
> > > On 27/07/20 13:14, Oliver Neukum wrote:
> > > > That however is really a kludge we cannot have in usbcore.
> > > > I am afraid as is the patch should_not_  be applied.
> > > >    
> > > 
> > > Could you please explain further why the suggested patch is unsuitable?
> > 
> > Hi,
> > 
> > certainly.
> > 
> > 1. timeouts are generally a bad idea, especially if the timeout does
> > not come out of a spec.
> > 
> > 2. That involves quoting you:
> > 
> > Alternatively, if the driver submits URBs to the same anchor while 
> > usb_kill_anchored_urbs() is called, this timeout might be reached. This 
> 
> That would be a bug in the driver, though.  In such a situation, a WARN 
> is worth having.

Well, it is an inherent race, certainly. You can do it, though. It is
debatable whether it would ever make sense. Yet it is not a bug in the
sense of, for example, writing beyond the end of a buffer or submitting
an URB twofold.

> > could happen, for example, if the completer function that ran in the 
> > racy situation resubmits the URB. If that situation isn't cleared within 
> > 1000ms, it means that there's a URB in the system that the driver isn't 
> > aware of. Maybe that situation is worth more than a WARN.
> > 
> > That is an entirely valid use case. And a bulk URB may take a potentially
> > unbounded time to complete.
> 
> It is _not_ a valid use case.  Since usb_kill_anchored_urbs() doesn't' 
> specify whether it will kill URBs that are added to the anchor after it 
> is called (and before it returns), a driver that anchors URBs at such a 
> time is buggy.

Yes, if you depend on it. Here we are getting into technicalities.
The thing is that we are getting into areas where we should not need to
go if the API were optimal.

What drivers really want is a way to say, kill this group of URBs and
make sure they stay dead no matter what.

> Maybe this should be mentioned in the kerneldoc for the routine: Drivers 
> must not add URBs to the anchor while the routine is running.

True, yet this defeats one of the aims of the API.

> > My failure in this case is simply overengineering.
> > If this line:
> > 
> >         usb_unanchor_urb(urb);
> > 
> > In __usb_hcd_giveback_urb(struct urb *urb) weren't there, the issue
> > would not exist. I misdesigned the API in automatically unanchoring
> > a completing URB.
> > Simply removing it now is no longer possible, so we need to come up with
> > a more complex solution.
> 
> Given that this timeout-based API is already present and being used in a 
> separate context, I don't see anything wrong with using it here as well.
> 

It is unnecessary and results in a much less useful API.
The true error in its design is that it unconditionally unanchors the
URBs it gives back. Stop doing that and it becomes much better.

	Regards
		Oliver


