Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20A5685D91
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 10:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731226AbfHHI6P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 04:58:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:56190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728289AbfHHI6P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Aug 2019 04:58:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E4B32173E;
        Thu,  8 Aug 2019 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565254694;
        bh=fcwXAYDxxRn29/bImSYKF4Y8ajRF8uXYdTgTTWnCNdk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P6H1ec8S/Leoca5dbH/ZQ9SFsFjz++W0AnUqBnOYmTx56gFYKJ+C1qd87uzvr6UTy
         +kVwaSEsiyjLiUtSdIVaqpjjVS3EamuJDGz0f/D3dhzVifokp3LL2CWxIFptAyzsxi
         56uRdlQBgyJADBBccKvn53VLGRZI7tl1CIr0bWHY=
Date:   Thu, 8 Aug 2019 10:58:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     yvahkhfo.1df7f8c2@hashmail.org
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        security@kernel.org
Subject: Re: usb zero copy dma handling
Message-ID: <20190808085811.GA1265@kroah.com>
References: <20190808084636.GB15080@priv-mua.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808084636.GB15080@priv-mua.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 08, 2019 at 10:46:36AM +0200, yvahkhfo.1df7f8c2@hashmail.org wrote:
> Hello linux-usb and linux-arm.
> 
> Ccing security@ because "the kernel dma code is mapping randomish
> kernel/user mem to a user process" seems to have security implications
> even though i didnt research that aspect past "its a 100% reliable way
> to crash a raspi from userspace". 
> 
> tried submitting this through linux-arm-kernel ~2 weeks ago but
> the only "response" i got was phishing-spam.
> tried to follow up through raspi-internals chat, they suggested
> i try linux-usb instead, but otoh the original reporter was
> deflected from -usb to "try some other mls, they might care".
> https://www.spinics.net/lists/linux-usb/msg173277.html
> 
> if i am not following some arcane ritual or indenting convention required 
> by regular users of these lists i apologize in advance, but i am not a 
> kernel developer, i am just here as a user with a bug and a patch. 
> (and the vger FAQ link 404s...) 

The "arcane ritual" should be really well documented by now, it's in
Documentation/SubmittingPatches in your kernel tree, and you can read it
online at:
	https://www.kernel.org/doc/html/latest/process/submitting-patches.html


> i rediffed against HEAD even though the two weeks old patch still applied
> cleanly with +2 offset.
> 
> # stepping off soap box # actual technical content starts here #
> 
> this is a followup to that thread from 2018-11:
> https://www.spinics.net/lists/arm-kernel/msg685598.html
> 
> the issue was discussed in more detail than i can claim
> to fully understand back then, but no fix ever merged.
> but i would really like to use rtl_433 on a raspi without
> having to build a custom-patched kernel first.
> 
> the attached patch is my stripdown/cleanup of a devel-diff
> provided to me by the original reporter Steve Markgraf.
> credits to him for the good parts, blame to me for the bad parts.
> 
> this does not cover the additional case of "PIO-based usb controllers"
> mainly because i dont understand what that means (or how to handle it)
> and if its broken right now (as the thread indicates) it might
> as well stay broken until someone who understands cares enough.
> 
> could you please get this on track for merging?


> 
> regards,
>   x23
> 
> 
> 

> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index b265ab5405f9..69594c2169ea 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -238,9 +238,14 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
>  	usbm->vma_use_count = 1;
>  	INIT_LIST_HEAD(&usbm->memlist);
>  
> +#ifdef CONFIG_X86
>  	if (remap_pfn_range(vma, vma->vm_start,
>  			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
>  			size, vma->vm_page_prot) < 0) {
> +#else /* !CONFIG_X86 */
> +	if (dma_mmap_coherent(ps->dev->bus->sysdev, 
> +			vma, mem, dma_handle, size) < 0) {
> +#endif /* !CONFIG_X86 */
>  		dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
>  		return -EAGAIN;
>  	}

First off, we need this in a format we could apply it in (hint, read the
above links).

But the main issue here is what exactly is this "fixing"?  What is wrong
with the existing code that non-x86 systems have such a problem with?
Shouldn't all of these dma issues be handled by the platform with the
remap_pfn_range() call itself?

What is the problem that you are having?

thanks,

greg k-h
