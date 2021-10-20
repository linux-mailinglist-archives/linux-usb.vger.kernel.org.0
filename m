Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB4A434FF5
	for <lists+linux-usb@lfdr.de>; Wed, 20 Oct 2021 18:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhJTQTB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Oct 2021 12:19:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:52936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231233AbhJTQTB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 Oct 2021 12:19:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E46D61374;
        Wed, 20 Oct 2021 16:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634746606;
        bh=cxX1n7LGfEiBmfiKfIsdG55/CgB1yJ30eOijj6Bzh+U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lh+MgOsPbrnRBMo3/tbyESzuawQ5cHqh9MBYkK+tDacRdAGHctCfa/y/FVYJe5WiA
         xrHCjRlQ2yvTDlQi0AfIiorvCsoVZNpzYD1925R2I+vBT2XZ4lAP/o1gGX/0sggZtw
         uCqDFgoO/l3/2tbugxm/iHKRUVO6Ykag41BWuqio=
Date:   Wed, 20 Oct 2021 18:16:44 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 00/22] Explicitly deny IRQ0 in the USB host drivers
Message-ID: <YXBA7IdNIrWNAEi3@kroah.com>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018183930.8448-1-s.shtylyov@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 18, 2021 at 09:39:08PM +0300, Sergey Shtylyov wrote:
> Here are 22 patches against the 'usb-next' branch of Greg KH's 'usb.git' repo.
> The affected drivers use platform_get_irq() which can return IRQ0 (considered
> invalid, according to Linus) that means broken HCD when passed to usb_add_hcd()
> called at the end of the probe methods. I think that the solution to this issue
> is either explicitly deny or accept IRQ0 in usb_add_hcd()... /but/ here's this
> patch set to get the things going...
> 
> Sergey Shtylyov (22):
>   usb: host: ehci-exynos: deny IRQ0
>   usb: host: ehci-mv: deny IRQ0
>   usb: host: ehci-npcm7xx: deny IRQ0
>   usb: host: ehci-omap: deny IRQ0
>   usb: host: ehci-platform: deny IRQ0
>   usb: host: ehci-spear: deny IRQ0
>   usb: host: ehci-st: deny IRQ0
>   usb: host: ohci-at91: deny IRQ0
>   usb: host: ohci-da8xx: deny IRQ0
>   usb: host: ohci-exynos: deny IRQ0
>   usb: host: ohci-at91: deny IRQ0
>   usb: host: ohci-omap: deny IRQ0
>   usb: host: ohci-platform: deny IRQ0
>   usb: host: ohci-pxa27x: deny IRQ0
>   usb: host: ohci-sm501: deny IRQ0
>   usb: host: ohci-spear: deny IRQ0
>   usb: host: ohci-st: deny IRQ0
>   usb: host: ohci-tmio: deny IRQ0
>   usb: host: xhci-histb: deny IRQ0
>   usb: host: xhci-mtk: deny IRQ0
>   usb: host: xhci-plat: deny IRQ0
>   usb: host: xhci-tegra: deny IRQ0
> 
>  drivers/usb/host/ehci-exynos.c   | 4 ++++
>  drivers/usb/host/ehci-mv.c       | 4 ++++
>  drivers/usb/host/ehci-npcm7xx.c  | 4 ++++
>  drivers/usb/host/ehci-omap.c     | 2 ++
>  drivers/usb/host/ehci-platform.c | 2 ++
>  drivers/usb/host/ehci-spear.c    | 4 ++++
>  drivers/usb/host/ehci-st.c       | 2 ++
>  drivers/usb/host/ohci-at91.c     | 2 ++
>  drivers/usb/host/ohci-da8xx.c    | 4 ++++
>  drivers/usb/host/ohci-exynos.c   | 4 ++++
>  drivers/usb/host/ohci-nxp.c      | 4 ++++
>  drivers/usb/host/ohci-omap.c     | 4 ++++
>  drivers/usb/host/ohci-platform.c | 2 ++
>  drivers/usb/host/ohci-pxa27x.c   | 2 ++
>  drivers/usb/host/ohci-sm501.c    | 4 ++++
>  drivers/usb/host/ohci-spear.c    | 4 ++++
>  drivers/usb/host/ohci-st.c       | 2 ++
>  drivers/usb/host/ohci-tmio.c     | 2 ++
>  drivers/usb/host/xhci-histb.c    | 2 ++
>  drivers/usb/host/xhci-mtk.c      | 4 +++-
>  drivers/usb/host/xhci-plat.c     | 2 ++
>  drivers/usb/host/xhci-tegra.c    | 2 ++
>  22 files changed, 65 insertions(+), 1 deletion(-)

Can you update and send a v2 for this series, with Alan's acks added to
the proper commits and fix up the other things that people have found?

thanks,

greg k-h
