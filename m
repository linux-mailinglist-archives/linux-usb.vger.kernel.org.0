Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41893CBA45
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 14:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbfJDMWB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 08:22:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:50480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728766AbfJDMWB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 08:22:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B564A20867;
        Fri,  4 Oct 2019 12:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570191720;
        bh=zCUtyTQ1zMFrT3PaHDSxi7DneoZLP+hiIyTLv4+9ceE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VCLCkobYKcsgmHdQiAFqKkTZkfO+Q/syXYHCX2J3e+R5932MKCZbjfi7G0nl/YtoY
         uIQA2A5yjT53N3frA2DhtIGQOT7cYI4P8Ew75GUl5PgfK8S7qUK4jtB2wSChh2E8uy
         Hj28swm5L79aC2KmVTHxMcJXvti2eEEiazOer/ek=
Date:   Fri, 4 Oct 2019 14:21:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     stern@rowland.harvard.edu, dmitry.torokhov@gmail.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: usbfs: check cpu address range before remap
Message-ID: <20191004122157.GA422178@kroah.com>
References: <1567585051-1354-1-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567585051-1354-1-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 04, 2019 at 01:47:31PM +0530, Nagarjuna Kristam wrote:
> In usbfs mmap, usb_alloc_coherent is used to allocate memory.
> This Memory is then remapped to user space memory using remap_pfn_range.
> remap_pfn_range needs phy address of memory, for which virt_to_phy API
> is used. This API works only if memory is allocated using kmalloc. But
> usb_alloc_coherent can allocate memory in vmalloc range and this causes
> wrong remap of user memory.
> 
> Check if address returned by usb_alloc_coherent failed in vmalloc range
> and if yes, use remap_vmalloc_range API, else use remap_pfn_range to remap
> address to user space.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/usb/core/devio.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index a945ad7..20999de 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -250,7 +250,12 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
>  	usbm->vma_use_count = 1;
>  	INIT_LIST_HEAD(&usbm->memlist);
>  
> -	if (remap_pfn_range(vma, vma->vm_start,
> +	if (is_vmalloc_addr(usbm->mem)) {
> +		if (remap_vmalloc_range(vma, usbm->mem, 0) < 0) {
> +			dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
> +			return -EAGAIN;
> +		}
> +	} else if (remap_pfn_range(vma, vma->vm_start,
>  			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
>  			size, vma->vm_page_prot) < 0) {
>  		dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
> -- 
> 2.7.4
> 

With the recent dma changes, is this patch still needed and correct?

thanks,

greg k-h
