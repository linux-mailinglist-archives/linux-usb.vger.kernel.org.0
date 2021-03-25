Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351133496E2
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 17:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhCYQdt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Mar 2021 12:33:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:40726 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229898AbhCYQd2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Mar 2021 12:33:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1616690007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rrKHGIIynw+Ro+fy+dbqqKPbs5DzrfmydDFNJ4T12k8=;
        b=clf+0vBcM8VBiDPyfSGaHIM6F/7431kCXpnuFjm2UklxwIVrVO0ouaxIwiDRHPoe5ED1Gr
        9SNVpMne9FcGVK5dX2d5QsrN/1Y/Fb9p+1BTK3kYrHWtrtEqiUm8VG2I0y+Oi4OZnAiOu+
        STtiC97pPwktP0lrvjhArsBQUGgj/wc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 465DCAA55;
        Thu, 25 Mar 2021 16:33:27 +0000 (UTC)
Message-ID: <5d3852dca69ff194017c806078e996c50ee621be.camel@suse.com>
Subject: Re: [RFC]extension of the anchor API
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 25 Mar 2021 17:04:25 +0100
In-Reply-To: <20210325150657.GC785961@rowland.harvard.edu>
References: <5b3c30d268ea2d13d303759ef3dfee8d72830084.camel@suse.com>
         <20210325150657.GC785961@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 25.03.2021, 11:06 -0400 schrieb Alan Stern:
> On Thu, Mar 25, 2021 at 12:03:33PM +0100, Oliver Neukum wrote:
> > Hi,
> > 
> > looking at the anchor API it seems to me that it is
> > weak due to removing an URB from its anchor upon completion.
> > That is not always what drivers want. If you throw away
> > the URB after usage, then this is good, as you typically do on a write
> > path. If, however, you are recieving, you typically reuse the URB
> > and you reanchor it right in the completion handler.
> > 
> > To make this easier I am proposing a feature called a "mooring"
> > which makes the association between anchor and URB permanent
> > and a few helper functions.
> > 
> > What do you think?
> 
> Have you considered just changing the anchor API instead?  It would 
> require auditing all uses of anchors (get rid of manual re-anchorings 
> and add manual un-anchorings), but it might end up being simpler.

Probably not. I looked at drivers and fire and forget is done a lot.
Transmitting and recieving have different needs. I tried to unify
code paths as much as possible.
> 
> > 	Regards
> > 		Oliver
> > 
> > From 577795900c90d7a40b082935747086be94d7f8be Mon Sep 17 00:00:00 2001
> > From: Oliver Neukum <oneukum@suse.com>
> > Date: Tue, 28 Jul 2020 11:38:23 +0200
> > Subject: [PATCH 1/2] USB: add mooring API
> > 
> > This is a simplified and thereby better version of the anchor API.
> > Anchors have the problem that they unanchor an URB upon giveback,
> > which creates a window during which an URB is unanchored but not
> > yet returned, leading to operations on anchors not having the
> > semantics many driver errornously assume them to have.
> > The new API keeps an URB on an anchor until it is explicitly
> > unmoored.
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > ---
> >  Documentation/driver-api/usb/anchors.rst | 39 +++++++++-
> >  drivers/usb/core/hcd.c                   | 15 +++-
> >  drivers/usb/core/urb.c                   | 97 +++++++++++++++++++++++-
> >  include/linux/usb.h                      | 10 +++
> >  4 files changed, 157 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/usb/anchors.rst b/Documentation/driver-api/usb/anchors.rst
> > index 4b248e691bd6..501f46aea75f 100644
> > --- a/Documentation/driver-api/usb/anchors.rst
> > +++ b/Documentation/driver-api/usb/anchors.rst
> > @@ -1,8 +1,8 @@
> >  USB Anchors
> >  ~~~~~~~~~~~
> >  
> > -What is anchor?
> > -===============
> > +What is an anchor?
> > +==================
> >  
> >  A USB driver needs to support some callbacks requiring
> >  a driver to cease all IO to an interface. To do so, a
> > @@ -12,6 +12,19 @@ for them. The anchor is a data structure takes care of
> >  keeping track of URBs and provides methods to deal with
> >  multiple URBs.
> >  
> > +What is a mooring?
> > +==================
> > +
> > +A mooring is a permanent anchoring that persist across
> > +the completion of an URB.
> > +The drawback of anchors is that there is an unavoidable
> > +window between taking an URB off an anchor for completion
> > +and the completion itself.
> > +A mooring acts as a permanent anchor to which you can add
> 
> This says that the anchor is permanent, but what you really mean is
> that the URB is permanently added to the anchor.

Noted

> 
> > +URBs. The order of URBs will be maintained in such a way
> > +that completing URBs go to the back of the chain.
> 
> Is that really helpful to anybody?  Why does the order of URBs on the
> anchor (or mooring) matter?  Rather than assuming the URBs are in some
> particular order, drivers could iterate over the URBs attached to an
> anchor, given the appropriate API.
> 
> > +The whole anchor can then be manipulated as a whole.
> 
> Too many "whole"s.

Noted

> > +
> >  Allocation and Initialisation
> >  =============================
> >  
> > @@ -35,6 +48,13 @@ is automatic. A function is provided to forcibly finish (kill)
> >  all URBs associated with an anchor.
> >  Furthermore, disassociation can be made with :c:func:`usb_unanchor_urb`
> >  
> > +Association and disassociation of URBs with moorings
> > +====================================================
> > +
> > +An association of URBs to an anchor is made by an explicit
> 
> This should be clearer.  "An URB can be moored to an anchor by 
> calling..."

Noted

> > +call to :c:func:`usb_moor_urb`. A moored URB can be turned
> > +into an anchored URB by :c:func:`usb_unmoor_urb`
> > +
> >  Operations on multitudes of URBs
> >  ================================
> >  
> > @@ -81,3 +101,18 @@ Returns the oldest anchored URB of an anchor. The URB is unanchored
> >  and returned with a reference. As you may mix URBs to several
> >  destinations in one anchor you have no guarantee the chronologically
> >  first submitted URB is returned.
> > +
> > +:c:func:`usb_submit_anchored_urbs`
> > +---------------------------------
> > +
> > +The URBs contained in anchor are chronologically submitted until
> 
> "chronologically" is the wrong word.  They are submitted in the order
> of the anchor's list, which is the same as the order that an iterator
> would use.

OK. "In the same sequence as they were anchored" ?
> 
> > +they are all submitted or an error happens during submission.
> > +
> > +:c:func:`usb_transfer_anchors`
> > +------------------------------
> > +
> > +Transfers URBs from an anchor to another anchor by means of a
> > +transform function you pass to the method. It proceeds until
> > +all URBs are transfered or an error is encountered during transfer.
> > +
> > +
> > +int usb_submit_anchored_urbs(struct usb_anchor *anchor, int *error, gfp_t gfp)
> > +{
> > +	int rv = 0;
> > +	int count = 0;
> > +	unsigned long flags;
> > +	struct urb *cur;
> > +
> > +	spin_lock_irqsave(&anchor->lock, flags);
> > +	list_for_each_entry(cur, &anchor->urb_list, urb_list) {
> > +		usb_get_urb(cur);
> > +		spin_unlock_irqrestore(&anchor->lock, flags);
> > +		rv = usb_submit_urb(cur, gfp);
> > +		if (!rv) {
> > +			count++;
> > +		} else {
> > +			usb_put_urb(cur);
> > +			goto bail_out;
> > +		}
> > +		spin_lock_irqsave(&anchor->lock, flags);
> > +		usb_put_urb(cur);
> 
> When an URB is successfully submitted, the core takes a reference to
> it.  So you can do the usb_put_urb immediately after usb_submit_urb.

OK.


> > +	}
> > +	spin_unlock_irqrestore(&anchor->lock, flags);
> > +
> > +bail_out:
> > +	if (error)
> > +		*error = rv;
> > +	return count;
> > +}
> > +EXPORT_SYMBOL_GPL(usb_submit_anchored_urbs);
> 
> I didn't carefully review the rest, but it seems okay.

Very good. I am preparing a V2 and then look for additional testers.

	Regards
		Oliver


