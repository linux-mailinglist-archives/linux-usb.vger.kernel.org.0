Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFBF35F71B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 17:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhDNO4c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 10:56:32 -0400
Received: from netrider.rowland.org ([192.131.102.5]:48513 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231304AbhDNO4b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Apr 2021 10:56:31 -0400
Received: (qmail 1494791 invoked by uid 1000); 14 Apr 2021 10:56:08 -0400
Date:   Wed, 14 Apr 2021 10:56:08 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [RFC]extension of the anchor API
Message-ID: <20210414145608.GB1493067@rowland.harvard.edu>
References: <5b3c30d268ea2d13d303759ef3dfee8d72830084.camel@suse.com>
 <20210325150657.GC785961@rowland.harvard.edu>
 <5d3852dca69ff194017c806078e996c50ee621be.camel@suse.com>
 <20210325183856.GA799855@rowland.harvard.edu>
 <cc44e358406f48175fad9e956369d0f5a07efbe9.camel@suse.com>
 <20210408150725.GC1296449@rowland.harvard.edu>
 <8c11f03b08a0bdfd2761a74f5a7964067dc4b98b.camel@suse.com>
 <20210412150628.GA1420451@rowland.harvard.edu>
 <30abed362c4b2e6af33078505ac9985389ad39bb.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30abed362c4b2e6af33078505ac9985389ad39bb.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 14, 2021 at 10:12:01AM +0200, Oliver Neukum wrote:
> Am Montag, den 12.04.2021, 11:06 -0400 schrieb Alan Stern:
> > On Mon, Apr 12, 2021 at 11:58:16AM +0200, Oliver Neukum wrote:
> 
> > > That presumes that the URBs will finish in order. I don't think such
> > > an assumption can be made.
> > 
> > I don't understand -- I can't detect any such presumption.
> 
> OK, this shows that I am bad at explaining.
> > 
> > As far as I can tell, the only reason for maintaining the URBs in any 
> > particular order on the anchor list is so that usb_kill_anchored_urbs 
> > and usb_poison_anchored_urbs can kill them in reverse order of 
> > submission.  THat's why the current code moves completed URBs to the end 
> > of the list.
> 
> No longer strictly true, as the API has a call to submit everything
> on an anchor, but I think it boils down to the same thing.
> 
> > If you keep a pointer to the most recently submitted URB, killing them 
> > easy enough to do.  Start with that URB, then go backward through the 
> > list (wrapping to the end when you reach the beginning of the list).
> 
> Yes, but that supposes that the next on the list has not been
> resubmitted _before_ the one after it.
> 
> If you do not keep the list ordered, but in the initial order,
> we can have the situation that A (happens most recently submitted)
> is followed by B and C, but C was submitted before B.

I think the only reasonable alternative is to move an URB to the end of 
the list when it is submitted, rather than when it completes.  Have you 
considered doing it that way?

The real problem with usb_submit_anchored_urbs is that the core can't 
know in what order the caller wants the URBs to be submitted.  If the 
URBs are all more or less identical (for example, all reading the same 
amount of data from the same endpoint) then this doesn't matter.  But if 
they aren't (for example, if they write different buffers or use 
different endpoints) it does matter.

In the kerneldoc you can explain that if the anchor has not been used 
since its URBs were added then the URBs will be submitted in the order 
they were added to the anchor, but otherwise they will be submitted in 
an unspecified order, which may not be suitable.

> > The order in which the URBs complete doesn't matter, because trying to 
> > unlink a completed URB won't cause any harm.
> 
> As long as it stays completed.

Rather, as long as they complete in order of submission.

> >   The only assumption here 
> > is that URBs get submitted in the list's order (possibly circularly) -- 
> > this should always be true.
> 
> I am afraid we cannot guarantee that. It might intuitively seem so,
> but nothing guarantees that all URBs are going to the same endpoint.

I hadn't thought of that.  Do anchors get used that way anywhere?

Alan Stern
