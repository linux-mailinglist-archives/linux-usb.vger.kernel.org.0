Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB90D85F5B
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 12:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389884AbfHHKQi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 06:16:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:41486 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389756AbfHHKQi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Aug 2019 06:16:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id CBDAAAD1E;
        Thu,  8 Aug 2019 10:16:36 +0000 (UTC)
Message-ID: <1565258524.3377.5.camel@suse.com>
Subject: Re: usb zero copy dma handling
From:   Oliver Neukum <oneukum@suse.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     yvahkhfo.1df7f8c2@hashmail.org, security@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Date:   Thu, 08 Aug 2019 12:02:04 +0200
In-Reply-To: <20190808095951.GD5193@shell.armlinux.org.uk>
References: <20190808084636.GB15080@priv-mua.localdomain>
         <20190808085811.GA1265@kroah.com>
         <20190808095951.GD5193@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 08.08.2019, 10:59 +0100 schrieb Russell King - ARM
Linux admin:
> On Thu, Aug 08, 2019 at 10:58:11AM +0200, Greg KH wrote:
> > But the main issue here is what exactly is this "fixing"?  What is wrong
> > with the existing code that non-x86 systems have such a problem with?
> > Shouldn't all of these dma issues be handled by the platform with the
> > remap_pfn_range() call itself?
> 
> remap_pfn_range() takes a PFN.  virt_to_phys() converts a kernel *direct
> mapped* virtual address to a physical address.  That much is fine.
> 
> The question is - what is usbm->mem?  If that is anything other than an
> address returned by kmalloc() or from the normal page allocator, then
> virt_to_phys() will return garbage.
> 
> In other words, if it comes from dma_alloc_coherent(), vmalloc() or
> ioremap(), using virt_to_phys() on it results in garbage.

It comes from usb_alloc_coherent() -> hcd_buffer_alloc() ->
hcd_buffer_alloc()

That function is a bit complicated. so I rather quote than explain:

        if (hcd->localmem_pool)
                return gen_pool_dma_alloc(hcd->localmem_pool, size, dma)

        /* some USB hosts just use PIO */
        if (!IS_ENABLED(CONFIG_HAS_DMA) ||
            !is_device_dma_capable(bus->sysdev)) {
                *dma = ~(dma_addr_t) 0;
                return kmalloc(size, mem_flags);
        }

        for (i = 0; i < HCD_BUFFER_POOLS; i++) {
                if (size <= pool_max[i])
                        return dma_pool_alloc(hcd->pool[i], mem_flags, dma);
        }

        return dma_alloc_coherent(hcd->self.sysdev, size, dma, mem_flags);

	Regards
		Oliver

