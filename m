Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1FA2866B9
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 18:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404077AbfHHQMg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 12:12:36 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46466 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403849AbfHHQMf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 12:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6T+VI4KFAZ1fCbRdaJlZ07Trz+LIP6lfBeV5qMlnvhU=; b=lB9iZupo8JAWLpBYHY0YK++1F
        F3cj3CY8VV3s4u8FtCPx2D0gP5MuAxdY+sZofXuu/zitWE94Y2xvXDzOennASOkOnb9Mvo4fA0GuE
        C2Z9d6Ra6V2xlYjiViBf7iuwZbiDcQJR0Uud3xdxUiUzr+r/CTq1m1sdXQicOlRL07MWqEGyLVhtj
        xfl2x8b54pdDvafA6Bsf9VrDqjZwJ5gepy3j6ljnRJ4cTcWR5fZE0CMMlKuCuUhyBUZCmZQdNSQR6
        rYDMMwY2iCzl3qwWMkjqwaUQxUMmaYPAKwiH/saT7p9kVWqyr8dDcLYTh22CfLeTWixGE+AhUM6Fy
        xV7wzpJsg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hvl1m-0004dy-Rf; Thu, 08 Aug 2019 16:12:34 +0000
Date:   Thu, 8 Aug 2019 09:12:34 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     yvahkhfo.1df7f8c2@hashmail.org
Cc:     security@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: usb zero copy dma handling
Message-ID: <20190808161234.GB8470@infradead.org>
References: <20190808084636.GB15080@priv-mua.localdomain>
 <20190808161015.GA8470@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808161015.GA8470@infradead.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 08, 2019 at 09:10:15AM -0700, Christoph Hellwig wrote:
> On Thu, Aug 08, 2019 at 10:46:36AM +0200, yvahkhfo.1df7f8c2@hashmail.org wrote:
> > --- a/drivers/usb/core/devio.c
> > +++ b/drivers/usb/core/devio.c
> > @@ -238,9 +238,14 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
> >  	usbm->vma_use_count = 1;
> >  	INIT_LIST_HEAD(&usbm->memlist);
> >  
> > +#ifdef CONFIG_X86
> >  	if (remap_pfn_range(vma, vma->vm_start,
> >  			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
> >  			size, vma->vm_page_prot) < 0) {
> > +#else /* !CONFIG_X86 */
> > +	if (dma_mmap_coherent(ps->dev->bus->sysdev, 
> > +			vma, mem, dma_handle, size) < 0) {
> > +#endif /* !CONFIG_X86 */
> 
> Doing the dma_mmap_coherent unconditionally is the right thing here.
> Gavin who is on Cc has been looking into that.

Ok, tht is assuming it always is dma_alloc_* memory which apparently
it isn't.  But the arch ifdef for sure is wrong.
