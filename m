Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364E9215063
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 01:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgGEXmG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jul 2020 19:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbgGEXmF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Jul 2020 19:42:05 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49678C061794
        for <linux-usb@vger.kernel.org>; Sun,  5 Jul 2020 16:42:04 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b92so16204843pjc.4
        for <linux-usb@vger.kernel.org>; Sun, 05 Jul 2020 16:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=eb5kTTPIY8Kj6SgMs2DxRI8+mvds0Fa5oQsKVsfNDKI=;
        b=rVkda+rr061XxviVoktVTIZSVUQyVHEqjdJochLB3oUz7QnquidunYsO1iJIHBa8Uo
         EE7EzAH5kBZzwLdYFIJUGuZD5rQBhMGKhS+yQVSOHRqwhHBwFGq972G9zDv8MsL44aTt
         mk/iHgixc5k6rEIe4BMUgG5dZkCbGeQDEY1o2wb5t2svdwUPPF5mNqgScG2o9q9CKsJv
         D3REHQgRjgHE9HP9XWskIasAWEUXn/dnmQD4gd/XouNI2QmvlAgNcq9Egr1k1IdQVW+M
         UXR4rB2lo8LZWjHsRjdgGWg4fsKZgVSBah9T1K1zMTnK07xnUayCYTP1X2Yd0fFgkIh5
         adOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=eb5kTTPIY8Kj6SgMs2DxRI8+mvds0Fa5oQsKVsfNDKI=;
        b=b7/Jgcrk0rR99hWULnjylmFgO+Apkfs41jojM9O/JNI3fDYL/k405TzdfFScjXzSWe
         DOysHDH9Bxatby/xk2Gx0hIxmOo+RGlZYtF7um73rpy9FZTVcJ6+l6nwP1/SAlxqsgie
         V167Z7MqLc3EHYKhjes8XyqU0yC+m9RyCjptTBeWe3fKnUMX3O2p94np3SICQZHG2dXM
         NuazMUUji/xyr+7DHTw+263e7Ekb+gK02Nj1ECe06zm+0MYRcNRk84A+6fd954GpiB0M
         l5PVGhHOyxqnx9fwoYVah2Ou2xOdRmpyuLC7DOQQ5oJ69Y7wCl1CmDbsVelz4wI95MMR
         dZUA==
X-Gm-Message-State: AOAM5315A9810LAt8aeaKH3x979iVA/iOsVWv4ZxuPc5FmaHoqFiSIE5
        xlpwNz6vWXi3m6s6e29fMYtHNQ==
X-Google-Smtp-Source: ABdhPJwUgMdqoYWx0nfeUOn+zEASmjm0/UvGbcQSZtbNbI/EtMugLtGIoe5J6K3QEvTOZXkTk9ahhA==
X-Received: by 2002:a17:90b:8d0:: with SMTP id ds16mr19275025pjb.2.1593992523119;
        Sun, 05 Jul 2020 16:42:03 -0700 (PDT)
Received: from [2620:15c:17:3:4a0f:cfff:fe51:6667] ([2620:15c:17:3:4a0f:cfff:fe51:6667])
        by smtp.gmail.com with ESMTPSA id z6sm16958133pfn.173.2020.07.05.16.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 16:42:01 -0700 (PDT)
Date:   Sun, 5 Jul 2020 16:41:59 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Robin Murphy <robin.murphy@arm.com>
cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Jeremy Linton <jeremy.linton@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, linux-mm@kvack.org,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>
Subject: Re: [BUG] XHCI getting ZONE_DMA32 memory > than its bus_dma_limit
In-Reply-To: <cc17fe85-99a3-ec8c-985a-2a21cf09bf49@arm.com>
Message-ID: <alpine.DEB.2.23.453.2007051635250.3687564@chino.kir.corp.google.com>
References: <34619bdf-6527-ae82-7e4d-e2ea7c67ed56@arm.com> <a9058fd2c54bbea69fdf97e30277338a61b5c0b4.camel@suse.de> <cc17fe85-99a3-ec8c-985a-2a21cf09bf49@arm.com>
User-Agent: Alpine 2.23 (DEB 453 2020-06-18)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 3 Jul 2020, Robin Murphy wrote:

> > Just for the record the offending commit is: c84dc6e68a1d2 ("dma-pool: add
> > additional coherent pools to map to gfp mask").
> > 
> > On Thu, 2020-07-02 at 12:49 -0500, Jeremy Linton wrote:
> > > Hi,
> > > 
> > > Using 5.8rc3:
> > > 
> > > The rpi4 has a 3G dev->bus_dma_limit on its XHCI controller. With a usb3
> > > hub, plus a few devices plugged in, randomly devices will fail
> > > operations. This appears to because xhci_alloc_container_ctx() is
> > > getting buffers > 3G via dma_pool_zalloc().
> > > 
> > > Tracking that down, it seems to be caused by dma_alloc_from_pool() using
> > > dev_to_pool()->dma_direct_optimal_gfp_mask() to "optimistically" select
> > > the atomic_pool_dma32 but then failing to verify that the allocations in
> > > the pool are less than the dev bus_dma_limit.
> > 
> > I can reproduce this too.
> > 
> > The way I see it, dev_to_pool() wants a strict dma_direct_optimal_gfp_mask()
> > that is never wrong, since it's going to stick to that pool for the device's
> > lifetime. I've been looking at how to implement it, and it's not so trivial
> > as
> > I can't see a failproof way to make a distinction between who needs DMA32
> > and
> > who is OK with plain KERNEL memory.
> > 
> > Otherwise, as Jeremy points out, the patch needs to implement allocations
> > with
> > an algorithm similar to __dma_direct_alloc_pages()'s, which TBH I don't know
> > if
> > it's a little overkill for the atomic context.
> > 
> > Short of finding a fix in the coming rc's, I suggest we revert this.
> 
> Or perhaps just get rid of atomic_pool_dma32 (and allocate atomic_pool_dma
> from ZONE_DMA32 if !ZONE_DMA). That should make it fall pretty much back in
> line while still preserving the potential benefit of the kernel pool for
> non-address-constrained devices.
> 

I assume it depends on how often we have devices where 
__dma_direct_alloc_pages() behavior is required, i.e. what requires the 
dma_coherent_ok() checks and altering of the gfp flags to get memory that 
works.

Is the idea that getting rid of atomic_pool_dma32 would use GFP_KERNEL 
(and atomic_pool_kernel) as the default policy here?  That doesn't do any 
dma_coherent_ok() checks so dma_direct_alloc_pages would return from 
ZONE_NORMAL without a < 3G check?

It *seems* like we want to check if dma_coherent_ok() succeeds for ret in 
dma_direct_alloc_pages() when allocating from the atomic pool and, based 
on criteria that allows fallback, just fall into 
__dma_direct_alloc_pages()?
