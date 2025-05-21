Return-Path: <linux-usb+bounces-24173-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51589ABF4F3
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 14:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3A5A17C824
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 12:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDECF26D4C5;
	Wed, 21 May 2025 12:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="02P8Ky43"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4045D231A37;
	Wed, 21 May 2025 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832302; cv=none; b=Rmqrd1L9ZGdWVQZOTEJ/uO6I6aaVGhq44f+BeRAvRgfnP1E8mozO6HRWwVC9NZKJFzU40gwY0mHxG1cDgzxWGIAwf398aqoQ5/O/Bya/uYtbhk9fwgq3T1jJfV7DJN4xPGHFvWFWxYkPnfKWo2WKuNu6HZQKcmerPTNAimbQ0is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832302; c=relaxed/simple;
	bh=58Oh3/h7mqEgTFhUuHPK8QfEC4NFrkIxG3oxOXabV44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cq6GJ7bpVXVXEhg+Lj1OPXZT2wNtXaxSSe4/uesFWM3BLmfC9RNublrKT4VZ/GqmKsgYPN0X7IyZKpeIjYVa3jJYD5Nki6ezfNDjXZlZ459qR4uN9nueAX8vILssbDxILujqbMtEotmi152CRSxoPegM2LSQ+iVMydayd0ACKHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=02P8Ky43; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3E9C4CEE4;
	Wed, 21 May 2025 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747832301;
	bh=58Oh3/h7mqEgTFhUuHPK8QfEC4NFrkIxG3oxOXabV44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=02P8Ky43TECwO1jXNFxaeBXIHKpm8OXfV8qJzPQQg1WZ2gN1n88D1tmNqgOq+yxH1
	 rTw4+esF1GrT25yW+LVK8PSXbJbSIUe7rd0yk1/piWaJ/D+LAPIi7jzVXvs1PgdhDO
	 5K2hxNm+eWSX0573vwlFnn2+PD7LXQWJCElj3Dvc=
Date: Wed, 21 May 2025 14:58:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, oneukum@suse.com, stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] USB: core: add a memory pool to urb caching
 host-controller private data
Message-ID: <2025052116-prorate-hamburger-f329@gregkh>
References: <20250517083819.6127-1-00107082@163.com>
 <2025052148-cannot-football-74e1@gregkh>
 <572f1814.9a08.196f2971eea.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <572f1814.9a08.196f2971eea.Coremail.00107082@163.com>

On Wed, May 21, 2025 at 07:25:12PM +0800, David Wang wrote:
> At 2025-05-21 18:32:09, "Greg KH" <gregkh@linuxfoundation.org> wrote:
> >On Sat, May 17, 2025 at 04:38:19PM +0800, David Wang wrote:
> >> ---
> >> Changes since v2:
> >> 1. activat the pool only when the urb object is created via
> >> usb_alloc_urb()
> >> Thanks to Oliver Neukum <oneukum@suse.com>'s review.
> >
> >Changes go below the bottom --- line, not at the top.  Please read the
> >documentation for how to do this.
> >
> >Also, these are not "threaded" together, making them hard to pick out.
> >Please when you resend, make them be together using git send-email or
> >some such tool.
> 
> >
> 
> Roger that~
> 
> 
> >> ---
> >> URB objects have long lifecycle, an urb can be reused between
> >> submit loops; The private data needed by some host controller
> >> has very short lifecycle, the memory is alloced when enqueue, and
> >> released when dequeue. For example, on a system with xhci, in
> >> xhci_urb_enqueue:
> >> Using a USB webcam would have ~250/s memory allocation;
> >> Using a USB mic would have ~1K/s memory allocation;
> >> 
> >> High frequent allocations for host-controller private data can be
> >> avoided if urb take over the ownership of memory, the memory then shares
> >> the longer lifecycle with urb objects.
> >> 
> >> Add a mempool to urb for hcpriv usage, the mempool only holds one block
> >> of memory and grows when larger size is requested.
> >> 
> >> The mempool is activated only when the URB object is created via
> >> usb_alloc_urb() in case some drivers create a URB object by other
> >> means and manage it lifecycle without corresponding usb_free_urb.
> >> 
> >> The performance difference with this change is insignificant when
> >> system is under no memory pressure or under heavy memory pressure.
> >> There could be a point inbetween where extra 1k/s memory alloction
> >> would dominate the preformance, but very hard to pinpoint it.
> >> 
> >> Signed-off-by: David Wang <00107082@163.com>
> >> ---
> >>  drivers/usb/core/urb.c | 45 ++++++++++++++++++++++++++++++++++++++++++
> >>  include/linux/usb.h    |  5 +++++
> >>  2 files changed, 50 insertions(+)
> >> 
> >> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> >> index 5e52a35486af..53117743150f 100644
> >> --- a/drivers/usb/core/urb.c
> >> +++ b/drivers/usb/core/urb.c
> >> @@ -23,6 +23,8 @@ static void urb_destroy(struct kref *kref)
> >>  
> >>  	if (urb->transfer_flags & URB_FREE_BUFFER)
> >>  		kfree(urb->transfer_buffer);
> >> +	if (urb->hcpriv_mempool_activated)
> >> +		kfree(urb->hcpriv_mempool);
> >>  
> >>  	kfree(urb);
> >>  }
> >> @@ -77,6 +79,8 @@ struct urb *usb_alloc_urb(int iso_packets, gfp_t mem_flags)
> >>  	if (!urb)
> >>  		return NULL;
> >>  	usb_init_urb(urb);
> >> +	/* activate hcpriv mempool when urb is created via usb_alloc_urb */
> >> +	urb->hcpriv_mempool_activated = true;
> >>  	return urb;
> >>  }
> >>  EXPORT_SYMBOL_GPL(usb_alloc_urb);
> >> @@ -1037,3 +1041,44 @@ int usb_anchor_empty(struct usb_anchor *anchor)
> >>  
> >>  EXPORT_SYMBOL_GPL(usb_anchor_empty);
> >>  
> >> +/**
> >> + * urb_hcpriv_mempool_zalloc - alloc memory from mempool for hcpriv
> >> + * @urb: pointer to URB being used
> >> + * @size: memory size requested by current host controller
> >> + * @mem_flags: the type of memory to allocate
> >> + *
> >> + * Return: NULL if out of memory, otherwise memory are zeroed
> >> + */
> >> +void *urb_hcpriv_mempool_zalloc(struct urb *urb, size_t size, gfp_t mem_flags)
> >> +{
> >> +	if (!urb->hcpriv_mempool_activated)
> >> +		return kzalloc(size, mem_flags);
> >> +
> >> +	if (urb->hcpriv_mempool_size < size) {
> >> +		kfree(urb->hcpriv_mempool);
> >> +		urb->hcpriv_mempool_size = size;
> >> +		urb->hcpriv_mempool = kmalloc(size, mem_flags);
> >> +	}
> >> +	if (urb->hcpriv_mempool)
> >> +		memset(urb->hcpriv_mempool, 0, size);
> >> +	else
> >> +		urb->hcpriv_mempool_size = 0;
> >> +	return urb->hcpriv_mempool;
> >> +}
> >> +EXPORT_SYMBOL_GPL(urb_hcpriv_mempool_zalloc);
> >> +
> >> +/**
> >> + * urb_free_hcpriv - free hcpriv data if necessary
> >> + * @urb: pointer to URB being used
> >> + *
> >> + * If mempool is activated, private data's lifecycle
> >> + * is managed by urb object.
> >> + */
> >> +void urb_free_hcpriv(struct urb *urb)
> >> +{
> >> +	if (!urb->hcpriv_mempool_activated) {
> >> +		kfree(urb->hcpriv);
> >> +		urb->hcpriv = NULL;
> >
> >You seem to set this to NULL for no reason, AND check for
> >hcpriv_mempool_activated.  Only one is going to be needed, you don't
> 
> >need to have both, right?  Why not just rely on hcdpriv being set?
> 
> I needs to distinguish two situations;
> 1.  the memory pool is used, then the urb_free_hcpriv should do nothing
> 2.  the memory was alloced by hcd,  then the memory should be kfreed
> 
> Using hcpriv_mempool_activated does look confusing...
> what about following changes:
> 
> +	if (urb->hcpriv != urb->hcpriv_mempool) {
> +		kfree(urb->hcpriv);
> +		urb->hcpriv = NULL;
> +	}
> 
> >
> >And are you sure that the hcd can actually use a kmalloced "mempool"?  I
> 
> The patch for xhci is here:  https://lore.kernel.org/lkml/20250517083750.6097-1-00107082@163.com/
> xhci was kzallocing memory for its private data, and when using USB webcam/mic, I can observe 1k+/s kzallocs
> And with this patch, during my obs session(with USB webcam/mic), no memory allocation
> observed for usb sub system;
> 
> >don't understand why xhci can't just do this in its driver instead of
> >this being required in the usb core and adding extra logic and size to
> >every urb in the system.
> 
> Yes, it is possible to make a mempool in hcds. But the lifecycle management would not be an easy one,
> basically a "mempool" would need to be build up from zero-ground, lots of details need to be addressed,
> e.g. when should resize the mempool when mempool is too big.
> Using URB as a mempool slot holder would be a very simple approach. The URB objects  are already well managed:
> based on my memory profiling, the alive urb objects and the rate of creating new  urb objects are both at small scale.
> Reusing urb lifecycle management would save lots of troubles, I image....
> 
> Also, I would image other hcds could use similar simple changes to cache its private data when they get hold on a URB object.

There is already a hcd-specific pointer in the urb, why can't they just
use that?

Also, while I know you saw less allocation/freeing happening, was that
actually measurable in a real way?  Without that, the added complexity
feels wrong (i.e. you are optimizing for something that is not really
needed.)

thanks,

greg k-h

