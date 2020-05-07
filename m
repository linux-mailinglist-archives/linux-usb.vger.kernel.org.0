Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A65CF1C82A1
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 08:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgEGGj2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 02:39:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:53876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgEGGj1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 May 2020 02:39:27 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D0F72078C;
        Thu,  7 May 2020 06:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588833567;
        bh=7uxQLOHl5YK/wlVmwTEwQLPM721LHYr1phx0RAen60I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mkhp0gzg7Rcym6cXXfHKaZj0Vbss49q2JLv5DyMO4COiiZwNbBGGtnSshOImXWnOq
         M98P0XYc8Am88LKwzYZMSmr6ok/nHuZM22Ulshs5/3qxcMbnSc1oLnGRwdq7utoUiP
         TCRJK5CbQAGtRXUwsQ8plyHeKQwo8xdWwFwfQSnA=
Date:   Thu, 7 May 2020 08:39:25 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     gavinli@thegavinli.com
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: devio: fix mmap() on non-coherent DMA
 architectures
Message-ID: <20200507063925.GA777100@kroah.com>
References: <20200507005647.172515-1-gavinli@thegavinli.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507005647.172515-1-gavinli@thegavinli.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 06, 2020 at 05:56:47PM -0700, gavinli@thegavinli.com wrote:
> From: Gavin Li <gavinli@thegavinli.com>
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
> ---
>  drivers/usb/core/devio.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

I don't think you ran checkpatch.pl on your patch :(

Also, please see 2bef9aed6f0e ("usb: usbfs: correct kernel->user page
attribute mismatch") in linux-next, does that resolve this problem for
you?  I think it does the same thing as your patch does...

thanks,

greg k-h
