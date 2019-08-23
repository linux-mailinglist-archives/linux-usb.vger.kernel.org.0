Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 529B59B107
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 15:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731990AbfHWNe3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Aug 2019 09:34:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:12320 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726319AbfHWNe3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Aug 2019 09:34:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Aug 2019 06:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; 
   d="scan'208";a="203771263"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2019 06:34:27 -0700
Subject: Re: [Patch v4] usb: hcd: fix use-after-free on driver removal
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1566554761464.60146@mentor.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <fc7c20a1-2938-a4d7-cddb-783d65091809@linux.intel.com>
Date:   Fri, 23 Aug 2019 16:36:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566554761464.60146@mentor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.8.2019 13.06, Schmid, Carsten wrote:
> On driver removal, the platform_device_unregister call
> attached through devm_add_action_or_reset was executed
> after usb_hcd_pci_remove.
> This lead to a use-after-free for the iomem resource of
> the xhci-ext-caps driver in the platform removal
> because the parent of the resource was freed earlier.
> 
> Fix this by using devm for hcd-pci created resources.
> This simplifies error handling on driver initialisation
> and fixes the removal sequence.
> 
> Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
> Tested-by: Carsten Schmid <carsten_schmid@mentor.com>
> ---

Thanks, code looks good to me.

But as this is no longer a xhci specific fix I'm not sure if this
commit message is generic enough.

Could be worth explaining that using managed device resources
in usb_hcd_pci_probe() allows devm usage for resource subranges, such
as the mmio resource for the platform device created to control host/device
mode mux, which is a xhci extended capability, and sits inside the xhci mmio region.

If managed device resources are not used then "parent" resource
is released before subrange at driver removal as .remove callback is
called before the devres list of resources for this device is walked
and released

-Mathias


> Rationale:
> Use-after-free was reproduced on 4.14.102 and 4.14.129 kernel
> using unbind mechanism.
> echo 0000:00:15.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
> 
> Upstream version of driver is identical in the affected code.
> Fix was tested successfully on 4.14.129.
> Provided patch applies and compiles on v5.2.8 stable.
> As this is a bugfix, please consider it to go to stable trees too.
> ---
> v2:
>     - more speaking name for private data element
>     - consider failure in driver init sequence
>     - fix minor issues found by checkpatch.pl
> v3:
>     - corrected typo: resorce -> resource
>     - added Reviewed by and Tested-by
> v4:
>     - completely rewritten to use devm resource allocation
>       in hcd-pci
>     - modified title to better reflect change content
>     - removed Reviewed-by
>       [old title: usb: xhci-pci: reorder removal to avoid use-after-free]
> ---
>   drivers/usb/core/hcd-pci.c | 30 ++++++++----------------------
>   1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> index 03432467b05f..7537681355f6 100644
> --- a/drivers/usb/core/hcd-pci.c
> +++ b/drivers/usb/core/hcd-pci.c
> @@ -216,17 +216,18 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   		/* EHCI, OHCI */
>   		hcd->rsrc_start = pci_resource_start(dev, 0);
>   		hcd->rsrc_len = pci_resource_len(dev, 0);
> -		if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len,
> -				driver->description)) {
> +		if (!devm_request_mem_region(&dev->dev, hcd->rsrc_start,
> +				hcd->rsrc_len, driver->description)) {
>   			dev_dbg(&dev->dev, "controller already in use\n");
>   			retval = -EBUSY;
>   			goto put_hcd;
>   		}
> -		hcd->regs = ioremap_nocache(hcd->rsrc_start, hcd->rsrc_len);
> +		hcd->regs = devm_ioremap_nocache(&dev->dev, hcd->rsrc_start,
> +				hcd->rsrc_len);
>   		if (hcd->regs == NULL) {
>   			dev_dbg(&dev->dev, "error mapping memory\n");
>   			retval = -EFAULT;
> -			goto release_mem_region;
> +			goto put_hcd;
>   		}
>   
>   	} else {
> @@ -240,8 +241,8 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   
>   			hcd->rsrc_start = pci_resource_start(dev, region);
>   			hcd->rsrc_len = pci_resource_len(dev, region);
> -			if (request_region(hcd->rsrc_start, hcd->rsrc_len,
> -					driver->description))
> +			if (devm_request_region(&dev->dev, hcd->rsrc_start,
> +					hcd->rsrc_len, driver->description))
>   				break;
>   		}
>   		if (region == PCI_ROM_RESOURCE) {
> @@ -275,20 +276,13 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   	}
>   
>   	if (retval != 0)
> -		goto unmap_registers;
> +		goto put_hcd;
>   	device_wakeup_enable(hcd->self.controller);
>   
>   	if (pci_dev_run_wake(dev))
>   		pm_runtime_put_noidle(&dev->dev);
>   	return retval;
>   
> -unmap_registers:
> -	if (driver->flags & HCD_MEMORY) {
> -		iounmap(hcd->regs);
> -release_mem_region:
> -		release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
> -	} else
> -		release_region(hcd->rsrc_start, hcd->rsrc_len);
>   put_hcd:
>   	usb_put_hcd(hcd);
>   disable_pci:
> @@ -347,14 +341,6 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
>   		dev_set_drvdata(&dev->dev, NULL);
>   		up_read(&companions_rwsem);
>   	}
> -
> -	if (hcd->driver->flags & HCD_MEMORY) {
> -		iounmap(hcd->regs);
> -		release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
> -	} else {
> -		release_region(hcd->rsrc_start, hcd->rsrc_len);
> -	}
> -
>   	usb_put_hcd(hcd);
>   	pci_disable_device(dev);
>   }
> 

