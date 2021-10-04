Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0E242075C
	for <lists+linux-usb@lfdr.de>; Mon,  4 Oct 2021 10:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbhJDIh7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 04:37:59 -0400
Received: from mga01.intel.com ([192.55.52.88]:37490 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231510AbhJDIh6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Oct 2021 04:37:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="248593913"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; 
   d="scan'208";a="248593913"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2021 01:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; 
   d="scan'208";a="558295805"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2021 01:36:08 -0700
Subject: Re: [PATCH] Enable trust tx length quirk for Fresco FL11 USB
 controller
To:     Nikolay Martynov <mar.kolya@gmail.com>, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
References: <20211003001441.28928-1-mar.kolya@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <a0ef9097-03ca-86b6-5dc0-a043acd7e0c5@linux.intel.com>
Date:   Mon, 4 Oct 2021 11:38:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211003001441.28928-1-mar.kolya@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
>  				pdev->revision == 0x0) {
> 

Thanks, adding to queue, and and adding "xhci:" to changelog header

-Mathias
