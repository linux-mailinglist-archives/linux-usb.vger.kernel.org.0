Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC34285F38
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 12:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389786AbfHHKH3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 06:07:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:48726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389756AbfHHKH3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Aug 2019 06:07:29 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E570020880;
        Thu,  8 Aug 2019 10:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565258848;
        bh=75WS+YPRciWGzXqWYWing0U09dGOHGfPHZTrp2FldrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TBTjJSf2qxhGQ8uS10+/iEN0clSm6TS+Fy9YtSpRBzma6s0pWUIA+5KqCPxHoq+q2
         cEYT7oQGvY5LDSAChNubMyhBQ4r3VdqxLHh70v//zE6QaNZcNf4x2zyjAYq958Qm5C
         ZQaGnRo4cTIEPeEnMXjqwSBGUM/K+4c0fLrjHpuU=
Date:   Thu, 8 Aug 2019 12:07:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     yvahkhfo.1df7f8c2@hashmail.org, security@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: usb zero copy dma handling
Message-ID: <20190808100726.GB23844@kroah.com>
References: <20190808084636.GB15080@priv-mua.localdomain>
 <20190808085811.GA1265@kroah.com>
 <10bcb28b-e87b-7b16-97e3-88e727e76d25@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10bcb28b-e87b-7b16-97e3-88e727e76d25@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 08, 2019 at 10:46:24AM +0100, Robin Murphy wrote:
> On 2019-08-08 9:58 am, Greg KH wrote:
> > On Thu, Aug 08, 2019 at 10:46:36AM +0200, yvahkhfo.1df7f8c2@hashmail.org wrote:
> > > Hello linux-usb and linux-arm.
> > > 
> > > Ccing security@ because "the kernel dma code is mapping randomish
> > > kernel/user mem to a user process" seems to have security implications
> > > even though i didnt research that aspect past "its a 100% reliable way
> > > to crash a raspi from userspace".
> > > 
> > > tried submitting this through linux-arm-kernel ~2 weeks ago but
> > > the only "response" i got was phishing-spam.
> > > tried to follow up through raspi-internals chat, they suggested
> > > i try linux-usb instead, but otoh the original reporter was
> > > deflected from -usb to "try some other mls, they might care".
> > > https://www.spinics.net/lists/linux-usb/msg173277.html
> > > 
> > > if i am not following some arcane ritual or indenting convention required
> > > by regular users of these lists i apologize in advance, but i am not a
> > > kernel developer, i am just here as a user with a bug and a patch.
> > > (and the vger FAQ link 404s...)
> > 
> > The "arcane ritual" should be really well documented by now, it's in
> > Documentation/SubmittingPatches in your kernel tree, and you can read it
> > online at:
> > 	https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> > 
> > 
> > > i rediffed against HEAD even though the two weeks old patch still applied
> > > cleanly with +2 offset.
> > > 
> > > # stepping off soap box # actual technical content starts here #
> > > 
> > > this is a followup to that thread from 2018-11:
> > > https://www.spinics.net/lists/arm-kernel/msg685598.html
> > > 
> > > the issue was discussed in more detail than i can claim
> > > to fully understand back then, but no fix ever merged.
> > > but i would really like to use rtl_433 on a raspi without
> > > having to build a custom-patched kernel first.
> > > 
> > > the attached patch is my stripdown/cleanup of a devel-diff
> > > provided to me by the original reporter Steve Markgraf.
> > > credits to him for the good parts, blame to me for the bad parts.
> > > 
> > > this does not cover the additional case of "PIO-based usb controllers"
> > > mainly because i dont understand what that means (or how to handle it)
> > > and if its broken right now (as the thread indicates) it might
> > > as well stay broken until someone who understands cares enough.
> > > 
> > > could you please get this on track for merging?
> > 
> > 
> > > 
> > > regards,
> > >    x23
> > > 
> > > 
> > > 
> > 
> > > diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> > > index b265ab5405f9..69594c2169ea 100644
> > > --- a/drivers/usb/core/devio.c
> > > +++ b/drivers/usb/core/devio.c
> > > @@ -238,9 +238,14 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
> > >   	usbm->vma_use_count = 1;
> > >   	INIT_LIST_HEAD(&usbm->memlist);
> > > +#ifdef CONFIG_X86
> > >   	if (remap_pfn_range(vma, vma->vm_start,
> > >   			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
> > >   			size, vma->vm_page_prot) < 0) {
> > > +#else /* !CONFIG_X86 */
> > > +	if (dma_mmap_coherent(ps->dev->bus->sysdev,
> > > +			vma, mem, dma_handle, size) < 0) {
> > > +#endif /* !CONFIG_X86 */
> > >   		dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
> > >   		return -EAGAIN;
> > >   	}
> > 
> > First off, we need this in a format we could apply it in (hint, read the
> > above links).
> > 
> > But the main issue here is what exactly is this "fixing"?  What is wrong
> > with the existing code that non-x86 systems have such a problem with?
> > Shouldn't all of these dma issues be handled by the platform with the
> > remap_pfn_range() call itself?
> 
> If usbm->mem is (or ever can be) a CPU address returned by
> dma_alloc_coherent(), then doing virt_to_phys() on it is bogus and may yield
> a nonsense 'PFN' to begin with. However, it it can can ever come from a
> regular page allocation/kmalloc/vmalloc then unconditionally passing it to
> dma_mmap_coherent wouldn't be right either.

usbm->mem comes from a call to usb_alloc_coherent() which calls
hcd_buffer_alloc() which tries to allocate memory in the best possible
way for that specific host controller.  If the host controller has a
pool of memory, it uses that, if the host controller has PIO it uses
kmalloc(), if there are some "pools" of host controller memory it uses
dma_pool_alloc() and as a total last resort, calls dma_alloc_coherent().

So yes, this could happen.

So how to fix this properly?  What host controller driver is being used
here that ends up defaulting to dma_alloc_coherent()?  Shouldn't that be
fixed up no matter what?

And then, if what you say is correct then a real fix for devio.c could
be made, but that is NOT going to just depend on the arch the system is
running on, as all of this depends on the host controller being accessed
at that moment for that device.

thanks,

greg k-h
