Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8766D3587D5
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 17:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbhDHPHo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 11:07:44 -0400
Received: from netrider.rowland.org ([192.131.102.5]:48053 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231995AbhDHPHk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 11:07:40 -0400
Received: (qmail 1299096 invoked by uid 1000); 8 Apr 2021 11:07:25 -0400
Date:   Thu, 8 Apr 2021 11:07:25 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [RFC]extension of the anchor API
Message-ID: <20210408150725.GC1296449@rowland.harvard.edu>
References: <5b3c30d268ea2d13d303759ef3dfee8d72830084.camel@suse.com>
 <20210325150657.GC785961@rowland.harvard.edu>
 <5d3852dca69ff194017c806078e996c50ee621be.camel@suse.com>
 <20210325183856.GA799855@rowland.harvard.edu>
 <cc44e358406f48175fad9e956369d0f5a07efbe9.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc44e358406f48175fad9e956369d0f5a07efbe9.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 08, 2021 at 11:23:05AM +0200, Oliver Neukum wrote:
> Am Donnerstag, den 25.03.2021, 14:38 -0400 schrieb Alan Stern:
> > On Thu, Mar 25, 2021 at 05:04:25PM +0100, Oliver Neukum wrote:
> > > Am Donnerstag, den 25.03.2021, 11:06 -0400 schrieb Alan Stern:
> > > > > +:c:func:`usb_submit_anchored_urbs`
> > > > > +---------------------------------
> > > > > +
> > > > > +The URBs contained in anchor are chronologically submitted until
> > > > 
> > > > "chronologically" is the wrong word.  They are submitted in the order
> > > > of the anchor's list, which is the same as the order that an iterator
> > > > would use.
> > > 
> > > OK. "In the same sequence as they were anchored" ?
> > 
> > Hmmm.  What happens if you submit an anchor's worth of URBs, but then 
> > you kill them in the reverse order (which is how you would normally want 
> > to cancel a bunch of URBs)?  Since each URB gets moved to the end of the 
> > anchor's list when it completes, after they are all killed the list will 
> > be reversed.  So the next time you submit the anchor, the order of URBs 
> > will be backward.  If some of the URBs completed before they were 
> > killed, the order will be mixed up.
> 
> Yes. If the URBs themselves, as opposed to their payloads, are
> different, this will happen. Yet I am afraid we are looking at a
> necessary race condition here. If you cancel a non-atomic operation,
> you will need to deal with all possible intermediate stages of
> completion.

That's not the point.  The point is that the description you wrote is 
incorrect.

I can imagine someone who doesn't understand the details of the 
anchor/mooring API creating an array of pointers to URBs, then filling 
in those URBs in the array's order.  That would mess things up if a 
previous kill caused the order of the anchor list to be different from 
the array order.

How about instead of moving URBs to the end of the list when they 
complete, you have the anchor maintain a pointer to the most recently 
submitted URB?

Alan Stern

> > Of course, if you never use the URBs on an anchor after killing it, this 
> > doesn't matter.
> 
> Yes, to partially solve this issue I wrote
> usb_transfer_anchors()
> which allows you to separate those URBs you kill (or submit)
> by shifting them to another anchor. This is incomplete,
> as obviously something you kill may do a transfer.
> 
> 	Regards
> 		Oliver
