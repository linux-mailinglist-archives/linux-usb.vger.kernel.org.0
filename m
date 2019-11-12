Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2B6F8EC1
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 12:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbfKLLkj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Nov 2019 06:40:39 -0500
Received: from mga14.intel.com ([192.55.52.115]:7040 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbfKLLkj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Nov 2019 06:40:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 03:40:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,296,1569308400"; 
   d="scan'208";a="229348095"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga004.fm.intel.com with ESMTP; 12 Nov 2019 03:40:38 -0800
Subject: Re: [PATCH] xhci-pci: Allow host runtime PM as default also for Intel
 Ice Lake xHCI
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20191112100817.79783-1-mika.westerberg@linux.intel.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <1014eec1-111a-d8a3-7089-060fa2e66cf4@linux.intel.com>
Date:   Tue, 12 Nov 2019 13:42:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191112100817.79783-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12.11.2019 12.08, Mika Westerberg wrote:
> Intel Ice Lake has two xHCI controllers one on PCH and the other as part
> of the CPU itself. The latter is also part of the so called Type C
> Subsystem (TCSS) sharing ACPI power resources with the PCIe root ports
> and the Thunderbolt controllers. In order to put the whole TCSS block
> into D3cold the xHCI needs to be runtime suspended as well when idle.
> 
> For this reason allow runtime PM as default for Ice Lake TCSS xHCI
> controller.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>   drivers/usb/host/xhci-pci.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 1e0236e90687..a0025d23b257 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -48,6 +48,7 @@
>   #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI		0x15e9
>   #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI		0x15ec
>   #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI		0x15f0
> +#define PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI		0x8a13
>   
>   #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
>   #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
> @@ -212,7 +213,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>   	     pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_XHCI ||
>   	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI ||
>   	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI ||
> -	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI))
> +	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI ||
> +	     pdev->device == PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI))
>   		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
>   
>   	if (pdev->vendor == PCI_VENDOR_ID_ETRON &&
> 

Thanks, adding to queue

-Mathias
