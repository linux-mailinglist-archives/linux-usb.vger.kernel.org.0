Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFCAFA17A6
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 13:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfH2LDw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 07:03:52 -0400
Received: from mga05.intel.com ([192.55.52.43]:58043 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726417AbfH2LDw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 07:03:52 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Aug 2019 04:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; 
   d="scan'208";a="197783104"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 29 Aug 2019 04:03:51 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 29 Aug 2019 14:03:48 +0300
Date:   Thu, 29 Aug 2019 14:03:48 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     hdegoede@redhat.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        Balaji Manoharan <m.balaji@intel.com>
Subject: Re: [PATCH v4 1/2] xhci-ext-caps.c: Add property to disable Intel SW
 switch
Message-ID: <20190829110348.GE5486@kuha.fi.intel.com>
References: <1567075327-24016-1-git-send-email-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567075327-24016-1-git-send-email-saranya.gopal@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 29, 2019 at 04:12:06PM +0530, Saranya Gopal wrote:
> In platforms like Cherrytrail, 'SW switch enable' bit
> should not be enabled for role switch. This patch
> adds a property to Intel USB Role Switch platform driver
> to denote that SW switch should be disabled in
> Cherrytrail devices.
> 
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> Signed-off-by: Balaji Manoharan <m.balaji@intel.com>
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  changes since v3: none
>  changes since v2: Added suggested-by tag
>  changes since v1: none
> 
>  drivers/usb/host/xhci-ext-caps.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-ext-caps.c b/drivers/usb/host/xhci-ext-caps.c
> index 399113f..f498160 100644
> --- a/drivers/usb/host/xhci-ext-caps.c
> +++ b/drivers/usb/host/xhci-ext-caps.c
> @@ -6,11 +6,20 @@
>   */
>  
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/pci.h>
>  #include "xhci.h"
>  
>  #define USB_SW_DRV_NAME		"intel_xhci_usb_sw"
>  #define USB_SW_RESOURCE_SIZE	0x400
>  
> +#define PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI	0x22b5
> +
> +static const struct property_entry role_switch_props[] = {
> +	PROPERTY_ENTRY_BOOL("sw_switch_disable"),
> +	{},
> +};
> +
>  static void xhci_intel_unregister_pdev(void *arg)
>  {
>  	platform_device_unregister(arg);
> @@ -21,6 +30,7 @@ static int xhci_create_intel_xhci_sw_pdev(struct xhci_hcd *xhci, u32 cap_offset)
>  	struct usb_hcd *hcd = xhci_to_hcd(xhci);
>  	struct device *dev = hcd->self.controller;
>  	struct platform_device *pdev;
> +	struct pci_dev *pci = to_pci_dev(dev);
>  	struct resource	res = { 0, };
>  	int ret;
>  
> @@ -43,6 +53,14 @@ static int xhci_create_intel_xhci_sw_pdev(struct xhci_hcd *xhci, u32 cap_offset)
>  		return ret;
>  	}
>  
> +	if (pci->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI) {
> +		ret = platform_device_add_properties(pdev, role_switch_props);
> +		if (ret) {
> +			dev_err(dev, "failed to register device properties\n");
> +			return ret;
> +		}
> +	}
> +
>  	pdev->dev.parent = dev;
>  
>  	ret = platform_device_add(pdev);
> -- 
> 1.9.1

thanks,

-- 
heikki
