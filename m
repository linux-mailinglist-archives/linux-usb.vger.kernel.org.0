Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD77448A204
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 22:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244447AbiAJVht (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 16:37:49 -0500
Received: from mga12.intel.com ([192.55.52.136]:2593 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244307AbiAJVhs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jan 2022 16:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641850668; x=1673386668;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=cHVMFsc259zOHaaX5cKlt8hDc8MNMbEOfL8VyHT3ldo=;
  b=VAN8e6rpX5wBAORAOz12kzeED7+83KvY6hwV5nZOHJrxK5nXNZi3ehSz
   U2bTKuvI3c2AFRArHTSEuzLq0ED7BcXhadPrRxITnnEnaoD2iNIrB1ZvQ
   GOXSuBJoyQHGzhvJKsTe81olEV86cUGevKGWte0QS5CyNnjicqCnEdDAo
   J7Gund7QFCCnZXuDB9WbIUinXn1Bp9gN9mYmqRkTwHt7m+X/AVJvtY+r4
   4GwUrzzNNCuP0WrDS0uMSwfac0GHCZsfoRhwwWllSFk0MnLRCH1B5m0qS
   UUXWPamAI5MjtlT7ZYxkcG+VcCQEtnYpf9QH0wsuIhLN0e3ktS0vpe3tk
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="223313408"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="223313408"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 13:37:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="622813676"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 10 Jan 2022 13:37:45 -0800
To:     Joe Minor <joe@alujoe.com>, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org
References: <YdxKuum3LFJOTSLi@trivial>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Problem: xhci: devices can not be enumerated due to bandwidth
 issues
Message-ID: <4c944b85-06a4-dd90-27df-71f35190f189@linux.intel.com>
Date:   Mon, 10 Jan 2022 23:39:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdxKuum3LFJOTSLi@trivial>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 10.1.2022 17.03, Joe Minor wrote:
> Hi,
> 
> I use an USB-C dock to connect my laptop to two external monitors and peripherals like mouse, keyboard, headset and webcam.
> Since upgrading to kernel version 5.14.6, these devices are no longer enumerated after boot.
> They will however function when plugged in after login.
> The dock uses the DisplayLink chipset, which requires the evdi kernel module (GitHub: https://github.com/DisplayLink/evdi/).
> I do not encounter this problem when blacklisting the module (which has the consequence that my monitors no longer work).
> 
> Hardware:
>  - Dock: Lenovo ThinkPad Hybrid USB-C with USB-A Dock
>  - Laptop: Microsoft Surface Book 2
> 
> The kernel buffer contains these messages per device:
> [    7.165643] usb 1-1.2.4.2.4: Not enough bandwidth for new device state.
> [    7.165652] usb 1-1.2.4.2.4: can't set config #1, error -28
> 
> The last unaffected kernel version is 5.14.5.
> I bisected the issue to commit 2847c46c6148 ('Revert "USB: xhci: fix U1/U2 handling for hardware with XHCI_INTEL_HOST quirk set"'), which also mentions xhci bandwidth issues.

This change will enable xhci USB Link power management for some devices. 
It adds a few more items to do during enumeration for them. 

> 
> My system information is included below. Please let me know how if you need more information or if you want me to run more tests.
> 
> Thanks a lot
> Joe

If you could boot with usb core and xhci dynamic debugging enabled it could show more.
Add "usbcore.dyndbg=+p xhci_hcd.dyndbg=+p" to your kernel cmdline

Also, could be worth checking if removing XHCI_LPM_SUPPORT from your kernel helps:


diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 5c351970cdf1..7434406be452 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -202,7 +202,6 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
                xhci->quirks |= XHCI_BROKEN_D3COLD;
 
        if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
-               xhci->quirks |= XHCI_LPM_SUPPORT;
                xhci->quirks |= XHCI_INTEL_HOST;
                xhci->quirks |= XHCI_AVOID_BEI;
        }

Thanks
-Mathias
