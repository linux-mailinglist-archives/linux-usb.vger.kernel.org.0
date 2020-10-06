Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E29D284C0D
	for <lists+linux-usb@lfdr.de>; Tue,  6 Oct 2020 14:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgJFMzm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Oct 2020 08:55:42 -0400
Received: from mga12.intel.com ([192.55.52.136]:5972 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726032AbgJFMzm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Oct 2020 08:55:42 -0400
IronPort-SDR: Ua7F8ZNYFKCIUxhZpyzKvGE7oBGW8CHew3DY/+EzJ+DrsI8QXYReOiqp2hL+LuWUnu/FdtbIOt
 eX4Ydzm+n1DQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="143868120"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="143868120"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 05:55:41 -0700
IronPort-SDR: t4FttYQAVPvrGPEQqm7wcVnTFwEk9nixBUMlhHU66DCK4PJNTq/JcrOdbLP/ITUpSjt/GJShzN
 G229GbC3uxUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="418163309"
Received: from unknown (HELO kuha.fi.intel.com) ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 06 Oct 2020 05:55:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 06 Oct 2020 15:55:39 +0300
Date:   Tue, 6 Oct 2020 15:55:39 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: pci: add support for the Intel Alder Lake-S
Message-ID: <20201006125539.GA11595@kuha.fi.intel.com>
References: <20201006125152.55223-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006125152.55223-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 06, 2020 at 03:51:52PM +0300, Heikki Krogerus wrote:
> This patch adds the necessary PCI ID for Intel Alder Lake-S
> devices.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/dwc3/dwc3-pci.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
> index f5a61f57c74f0..42ed6bc4dab63 100644
> --- a/drivers/usb/dwc3/dwc3-pci.c
> +++ b/drivers/usb/dwc3/dwc3-pci.c
> @@ -40,6 +40,7 @@
>  #define PCI_DEVICE_ID_INTEL_TGPLP		0xa0ee
>  #define PCI_DEVICE_ID_INTEL_TGPH		0x43ee
>  #define PCI_DEVICE_ID_INTEL_JSP			0x4dee
> +#define PCI_DEVICE_ID_INTEL_ADLS		0x7ae1
>  
>  #define PCI_INTEL_BXT_DSM_GUID		"732b85d5-b7a7-4a1b-9ba0-4bbd00ffd511"
>  #define PCI_INTEL_BXT_FUNC_PMU_PWR	4
> @@ -366,6 +367,9 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
>  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_JSP),
>  	  (kernel_ulong_t) &dwc3_pci_intel_properties, },
>  
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADLS),
> +	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
> +

Oh, this is broken. I have to resend. Sorry about that.

thanks,

-- 
heikki
