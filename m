Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BEC432B81
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 03:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbhJSBhu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 21:37:50 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52493 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229777AbhJSBht (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 21:37:49 -0400
Received: (qmail 1068009 invoked by uid 1000); 18 Oct 2021 21:35:37 -0400
Date:   Mon, 18 Oct 2021 21:35:37 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 00/22] Explicitly deny IRQ0 in the USB host drivers
Message-ID: <20211019013537.GA1067913@rowland.harvard.edu>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018183930.8448-1-s.shtylyov@omp.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

For patches 1 - 18 (EHCI and OHCI):

Acked-by: Alan Stern <stern@rowland.harvard.edu>

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
> 
> -- 
> 2.26.3
