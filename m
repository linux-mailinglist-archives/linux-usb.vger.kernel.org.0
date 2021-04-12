Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 681A435C966
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 17:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241331AbhDLPGs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 11:06:48 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38673 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S237526AbhDLPGr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Apr 2021 11:06:47 -0400
Received: (qmail 1421702 invoked by uid 1000); 12 Apr 2021 11:06:28 -0400
Date:   Mon, 12 Apr 2021 11:06:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [RFC]extension of the anchor API
Message-ID: <20210412150628.GA1420451@rowland.harvard.edu>
References: <5b3c30d268ea2d13d303759ef3dfee8d72830084.camel@suse.com>
 <20210325150657.GC785961@rowland.harvard.edu>
 <5d3852dca69ff194017c806078e996c50ee621be.camel@suse.com>
 <20210325183856.GA799855@rowland.harvard.edu>
 <cc44e358406f48175fad9e956369d0f5a07efbe9.camel@suse.com>
 <20210408150725.GC1296449@rowland.harvard.edu>
 <8c11f03b08a0bdfd2761a74f5a7964067dc4b98b.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c11f03b08a0bdfd2761a74f5a7964067dc4b98b.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 12, 2021 at 11:58:16AM +0200, Oliver Neukum wrote:
> Am Donnerstag, den 08.04.2021, 11:07 -0400 schrieb Alan Stern:
> > On Thu, Apr 08, 2021 at 11:23:05AM +0200, Oliver Neukum wrote:
> > > Am Donnerstag, den 25.03.2021, 14:38 -0400 schrieb Alan Stern:
> 
> > > Yes. If the URBs themselves, as opposed to their payloads, are
> > > different, this will happen. Yet I am afraid we are looking at a
> > > necessary race condition here. If you cancel a non-atomic operation,
> > > you will need to deal with all possible intermediate stages of
> > > completion.
> > 
> > That's not the point.  The point is that the description you wrote is 
> > incorrect.
> > 
> > I can imagine someone who doesn't understand the details of the 
> > anchor/mooring API creating an array of pointers to URBs, then filling 
> > in those URBs in the array's order.  That would mess things up if a 
> > previous kill caused the order of the anchor list to be different from 
> > the array order.
> 
> OK, I will fix the description.
> 
> > How about instead of moving URBs to the end of the list when they 
> > complete, you have the anchor maintain a pointer to the most recently 
> > submitted URB?
> 
> That presumes that the URBs will finish in order. I don't think such
> an assumption can be made.

I don't understand -- I can't detect any such presumption.

As far as I can tell, the only reason for maintaining the URBs in any 
particular order on the anchor list is so that usb_kill_anchored_urbs 
and usb_poison_anchored_urbs can kill them in reverse order of 
submission.  THat's why the current code moves completed URBs to the end 
of the list.

If you keep a pointer to the most recently submitted URB, killing them 
easy enough to do.  Start with that URB, then go backward through the 
list (wrapping to the end when you reach the beginning of the list).

The order in which the URBs complete doesn't matter, because trying to 
unlink a completed URB won't cause any harm.  The only assumption here 
is that URBs get submitted in the list's order (possibly circularly) -- 
this should always be true.

Alan Stern
