Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B731836E2
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 18:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgCLRHU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 13:07:20 -0400
Received: from mga02.intel.com ([134.134.136.20]:14968 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726254AbgCLRHU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 13:07:20 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 10:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; 
   d="scan'208";a="232123199"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 12 Mar 2020 10:07:19 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jCRIn-0093Nh-IA; Thu, 12 Mar 2020 19:07:21 +0200
Date:   Thu, 12 Mar 2020 19:07:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] usb: dwc3: Add ACPI support for xHCI ports
Message-ID: <20200312170721.GH1922688@smile.fi.intel.com>
References: <20200218151219.50121-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218151219.50121-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 18, 2020 at 05:12:18PM +0200, Andy Shevchenko wrote:
> The ACPI companion of the adapter has to be set for xHCI controller
> code to read and attach the ports described in the ACPI table.
> Use ACPI_COMPANION_SET macro to set this.

Felipe, do you have any comments on this?

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: split out kernel doc fix
>  drivers/usb/dwc3/host.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index fa252870c926..95a90ea08975 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -7,6 +7,7 @@
>   * Authors: Felipe Balbi <balbi@ti.com>,
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/platform_device.h>
>  
>  #include "core.h"
> @@ -75,6 +76,7 @@ int dwc3_host_init(struct dwc3 *dwc)
>  	}
>  
>  	xhci->dev.parent	= dwc->dev;
> +	ACPI_COMPANION_SET(&xhci->dev, ACPI_COMPANION(dwc->dev));
>  
>  	dwc->xhci = xhci;
>  
> -- 
> 2.25.0
> 

-- 
With Best Regards,
Andy Shevchenko


