Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA98147448F
	for <lists+linux-usb@lfdr.de>; Tue, 14 Dec 2021 15:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234810AbhLNOOn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Dec 2021 09:14:43 -0500
Received: from mga11.intel.com ([192.55.52.93]:26838 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234799AbhLNOOn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Dec 2021 09:14:43 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="236516876"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="236516876"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 06:14:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="661394665"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 14 Dec 2021 06:14:42 -0800
To:     Nikolay Martynov <mar.kolya@gmail.com>, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
References: <20211003001441.28928-1-mar.kolya@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] Enable trust tx length quirk for Fresco FL11 USB
 controller
Message-ID: <a7baa570-00e2-3f1f-22dd-0aa01f15c241@linux.intel.com>
Date:   Tue, 14 Dec 2021 16:16:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211003001441.28928-1-mar.kolya@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3.10.2021 3.14, Nikolay Martynov wrote:
> Tested on SD5200T TB3 dock which has Fresco Logic FL1100 USB 3.0 Host
> Controller.
> Before this patch streaming video from USB cam made mouse and keyboard
> connected to the same USB bus unusable. Also video was jerky.
> With this patch streaming video doesn't have any effect on other
> periferals and video is smooth.
> 
> Signed-off-by: Nikolay Martynov <mar.kolya@gmail.com>
> ---
>  drivers/usb/host/xhci-pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 2c9f25ca8edd..2175fac2f259 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -30,6 +30,7 @@
>  #define PCI_VENDOR_ID_FRESCO_LOGIC	0x1b73
>  #define PCI_DEVICE_ID_FRESCO_LOGIC_PDK	0x1000
>  #define PCI_DEVICE_ID_FRESCO_LOGIC_FL1009	0x1009
> +#define PCI_DEVICE_ID_FRESCO_LOGIC_FL1100	0x1100
>  #define PCI_DEVICE_ID_FRESCO_LOGIC_FL1400	0x1400
>  
>  #define PCI_VENDOR_ID_ETRON		0x1b6f
> @@ -113,6 +114,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  	/* Look for vendor-specific quirks */
>  	if (pdev->vendor == PCI_VENDOR_ID_FRESCO_LOGIC &&
>  			(pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_PDK ||
> +			 pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_FL1100 ||
>  			 pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_FL1400)) {
>  		if (pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_PDK &&
>  				pdev->revision == 0x0)


I'm getting reports that this patch causes issues detecting usb drives connected to a dock
with this Fresco FL1100 xHC.

This patch adds both XHCI_TRUST_TX_LENGTH and XHCI_BROKEN_MSI quirks, which was probably
not intended. Removing the BROKEN_MSI quirk solved the issue.

Does you setup work normally with just TRUST_TX_LENGTH quirk?  

-Mathias
