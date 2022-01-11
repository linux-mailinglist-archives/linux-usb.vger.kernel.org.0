Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6152548B790
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 20:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238539AbiAKToV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jan 2022 14:44:21 -0500
Received: from out2.migadu.com ([188.165.223.204]:22599 "EHLO out2.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238194AbiAKToV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Jan 2022 14:44:21 -0500
Date:   Tue, 11 Jan 2022 20:44:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alujoe.com; s=key1;
        t=1641930259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T4y9MKsyvp6d0yskdqQDAYCk0HpFlPoI6crKQ3Q+lqM=;
        b=R0urdK7yPbuDzd09dwStTYWX0BpfRCieAY48ceDgbGHM7P8laRBzAtRZQpPlK6Dd23GojT
        mWI4agsRYsY6zZQWZA2M6pZOigpd1ozWDE1VPPppO3NG5YOSVCn76NfNCcDdROzoS86B5c
        e2XgivRSdnEUiCyiJ58I7uIOLvl1Alo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Joe Minor <joe@alujoe.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Problem: xhci: devices can not be enumerated due to bandwidth
 issues
Message-ID: <Yd3eESRmmlic71q7@trivial>
References: <YdxKuum3LFJOTSLi@trivial>
 <4c944b85-06a4-dd90-27df-71f35190f189@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c944b85-06a4-dd90-27df-71f35190f189@linux.intel.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: alujoe.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On Mon, Jan 10, 2022 at 11:39:10PM +0200, Mathias Nyman wrote:
> > I bisected the issue to commit 2847c46c6148 ('Revert "USB: xhci: fix U1/U2 handling for hardware with XHCI_INTEL_HOST quirk set"'), which also mentions xhci bandwidth issues.
> 
> This change will enable xhci USB Link power management for some devices. 
> It adds a few more items to do during enumeration for them. 

Is this introducing the problem a sign of an issue with hardware or setup?

> If you could boot with usb core and xhci dynamic debugging enabled it could show more.
> Add "usbcore.dyndbg=+p xhci_hcd.dyndbg=+p" to your kernel cmdline

Here is the output of dmesg | grep -i "usb\|xhci": https://gist.github.com/alujoe/8539793d755ed818da50bac5b2e960a5
(I did not apply the patch below before capturing the output)
Does the log include something useful?

> 
> Also, could be worth checking if removing XHCI_LPM_SUPPORT from your kernel helps:
> 
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 5c351970cdf1..7434406be452 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -202,7 +202,6 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>                 xhci->quirks |= XHCI_BROKEN_D3COLD;
>  
>         if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
> -               xhci->quirks |= XHCI_LPM_SUPPORT;
>                 xhci->quirks |= XHCI_INTEL_HOST;
>                 xhci->quirks |= XHCI_AVOID_BEI;
>         }
> 

The change did help! This might be a viable workaround.

Thanks
Joe
