Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB3D7866B1
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 18:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404121AbfHHQKQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 12:10:16 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42730 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404003AbfHHQKQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 12:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=PsRuX6i6bpFFleWOxC3N1dYJ6gwL3cQWRZKi4BRRIPw=; b=JmHxGJYIULMp6y61cQLASb6iV
        5i3TNCJtO4CIKHYMZW7zD4EbitDOrV3ih1qM8GtqUmwNmHYG3KdVjPWx2C7otseHJhOZplcunWfZe
        GnF/dQJmAiPJkBSECXWsQ8YuPx9o+0Em8Rr16UH0l1i+oIQSRtabQp8MlHDUgRyfsfqE38GU7NOFF
        knuUyKnTW/YMxoTRk5o+idEUhWQeUEuYoZI8CbFXAa0ZE7M2KvI3afRJDsKSqHPaVCyuJMQmZHcB6
        fgoQ+L4yhkspaELmZIYMIBYToOEat37F6ZdShZEoXGsKn16EINzHT3OjVeNTtgZ1DoCGHKGPzN9Ka
        BQw7iYiCA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hvkzX-0003eq-O4; Thu, 08 Aug 2019 16:10:15 +0000
Date:   Thu, 8 Aug 2019 09:10:15 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     yvahkhfo.1df7f8c2@hashmail.org
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        security@kernel.org
Subject: Re: usb zero copy dma handling
Message-ID: <20190808161015.GA8470@infradead.org>
References: <20190808084636.GB15080@priv-mua.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808084636.GB15080@priv-mua.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 08, 2019 at 10:46:36AM +0200, yvahkhfo.1df7f8c2@hashmail.org wrote:
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

Doing the dma_mmap_coherent unconditionally is the right thing here.
Gavin who is on Cc has been looking into that.

Note that you'll also need this patch which I'm going to send to Linus
this week before it properly works on x86:

http://git.infradead.org/users/hch/dma-mapping.git/commitdiff/197b3e665b82c6027be5c68a143233df7ce5224f
