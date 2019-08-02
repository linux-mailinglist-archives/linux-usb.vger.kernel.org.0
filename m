Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1FB97F6A7
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2019 14:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392586AbfHBMOU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Aug 2019 08:14:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:59968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389277AbfHBMOT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Aug 2019 08:14:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 98D3A21842;
        Fri,  2 Aug 2019 12:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564748059;
        bh=tBaVZzQKYGo0thXHTMky4hXBroatrfowQ68AoBMN7qk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E1o7AwevnOqhWW8TtBkNn2xUf8rIOKJp1C4umEVmK9rEExDbQHvMeI1ryrSyV1bFK
         lSjM4OFytFX7kp0QXJjS2h5eK6L4khN3jD3yN0Wh8yLKt5iBGZIQrF0vN8FXJM4FBi
         1LaYzsLdPwFGm9f4Gma8afC/YQ1BIGO2St62h2sM=
Date:   Fri, 2 Aug 2019 14:14:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     gavinli@thegavinli.com
Cc:     linux-usb@vger.kernel.org, Gavin Li <git@thegavinli.com>
Subject: Re: [PATCH] usb: devio: fix mmap() on non-coherent DMA architectures
Message-ID: <20190802121416.GA20689@kroah.com>
References: <20190801220436.3871-1-gavinli@thegavinli.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801220436.3871-1-gavinli@thegavinli.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 01, 2019 at 03:04:36PM -0700, gavinli@thegavinli.com wrote:
> From: Gavin Li <git@thegavinli.com>
> 
> On architectures that are not (or are optionally) DMA coherent,
> dma_alloc_coherent() returns an address into the vmalloc space,
> and calling virt_to_phys() on this address returns an unusable
> physical address.
> 
> This patch replaces the raw remap_pfn_range() call with a call to
> dmap_mmap_coherent(), which takes care of the differences between
> coherent and non-coherent code paths.
> 
> Tested on an arm64 rk3399 board.
> 
> Signed-off-by: Gavin Li <git@thegavinli.com>
> ---
>  drivers/usb/core/devio.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Should this be backported to the stable kernel trees to fix the issue on
those platforms?  If so, how far back?  What commit caused this problem
to occur?

thanks,

greg k-h
