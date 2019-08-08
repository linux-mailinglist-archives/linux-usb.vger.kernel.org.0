Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 404FA8678A
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 18:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404101AbfHHQ5q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 12:57:46 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:43560 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbfHHQ5q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 12:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ED7e8Ih4bHyHDCY/4eqes98RiULX2Mf6sQjwvNk6YLI=; b=HEtOaayAs5z8Q5QJuNZExgI6F
        +T+yjUP8Hqtm24tikmCLflGGfe9VSn1Z082YkaVMXOWfxFGi8lnoUbE2YaL0km1Z0eWOk4LsVu0Va
        z9eWLGV4vP5t3FZZi30rn0MFUBtloE91Wfre/vO1Xb3ltF3o1EyMonQVtNC15qYhKpt0pEs2yymm3
        Fo7kmZSPxiopdMS2S6w4ZQ6wWC4t2hDKHizKG0Tj2RAC4Gyajo+SqJmr5evxLb46Qscw3pujg9UfB
        2f6i04O7odGaoWvSU9jdx65LeNs3ycRg+XFkismkKLvfwxTobZA9soPtRmZTOdpeQn9B5JakiuRYz
        /1lprmjUQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54188)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hvljO-00059I-Tx; Thu, 08 Aug 2019 17:57:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hvljK-0002pQ-7m; Thu, 08 Aug 2019 17:57:34 +0100
Date:   Thu, 8 Aug 2019 17:57:34 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     yvahkhfo.1df7f8c2@hashmail.org, security@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: usb zero copy dma handling
Message-ID: <20190808165734.GG5193@shell.armlinux.org.uk>
References: <20190808084636.GB15080@priv-mua.localdomain>
 <20190808161015.GA8470@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808161015.GA8470@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

So what if usbm->mem is from kmalloc because the host doesn't support DMA?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
