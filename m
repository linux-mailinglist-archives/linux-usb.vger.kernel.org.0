Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF962C44E3
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 17:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730710AbgKYQXS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 11:23:18 -0500
Received: from mga14.intel.com ([192.55.52.115]:40360 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730650AbgKYQXR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Nov 2020 11:23:17 -0500
IronPort-SDR: Wr0iXfGMUTc7az2HgAOqSSeHHOljsZ9JjgzKKjQ+OHGhtCOKCgQ9wYGzaM24HfYvPlUtlZlfYY
 lETnevSd41Og==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="171381879"
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; 
   d="scan'208";a="171381879"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 08:23:17 -0800
IronPort-SDR: 27H8LbJIL07Dr92oHYQqLTuPJ6CtGKlPGWb634biZSQQiGXkiFpoQeYJJW1Wyxj6j4iBG6AV3Z
 wzVmgSWjOyIg==
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; 
   d="scan'208";a="362433326"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 08:23:00 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1khxaM-009fJM-FV; Wed, 25 Nov 2020 18:24:02 +0200
Date:   Wed, 25 Nov 2020 18:24:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] usb: dwc3: Simplify with dev_err_probe()
Message-ID: <20201125162402.GA4077@smile.fi.intel.com>
References: <20201020083815.89275-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020083815.89275-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 20, 2020 at 11:38:15AM +0300, Andy Shevchenko wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe(). Less code and the error value gets printed.

Felipe, any comments?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/dwc3/core.c | 44 +++++++++++------------------------------
>  1 file changed, 11 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index bdf0925da6b6..8787dff5342e 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1126,11 +1126,8 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
>  		ret = PTR_ERR(dwc->usb2_phy);
>  		if (ret == -ENXIO || ret == -ENODEV) {
>  			dwc->usb2_phy = NULL;
> -		} else if (ret == -EPROBE_DEFER) {
> -			return ret;
>  		} else {
> -			dev_err(dev, "no usb2 phy configured\n");
> -			return ret;
> +			return dev_err_probe(dev, ret, "no usb2 phy configured\n");
>  		}
>  	}
>  
> @@ -1138,11 +1135,8 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
>  		ret = PTR_ERR(dwc->usb3_phy);
>  		if (ret == -ENXIO || ret == -ENODEV) {
>  			dwc->usb3_phy = NULL;
> -		} else if (ret == -EPROBE_DEFER) {
> -			return ret;
>  		} else {
> -			dev_err(dev, "no usb3 phy configured\n");
> -			return ret;
> +			return dev_err_probe(dev, ret, "no usb3 phy configured\n");
>  		}
>  	}
>  
> @@ -1151,11 +1145,8 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
>  		ret = PTR_ERR(dwc->usb2_generic_phy);
>  		if (ret == -ENOSYS || ret == -ENODEV) {
>  			dwc->usb2_generic_phy = NULL;
> -		} else if (ret == -EPROBE_DEFER) {
> -			return ret;
>  		} else {
> -			dev_err(dev, "no usb2 phy configured\n");
> -			return ret;
> +			return dev_err_probe(dev, ret, "no usb2 phy configured\n");
>  		}
>  	}
>  
> @@ -1164,11 +1155,8 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
>  		ret = PTR_ERR(dwc->usb3_generic_phy);
>  		if (ret == -ENOSYS || ret == -ENODEV) {
>  			dwc->usb3_generic_phy = NULL;
> -		} else if (ret == -EPROBE_DEFER) {
> -			return ret;
>  		} else {
> -			dev_err(dev, "no usb3 phy configured\n");
> -			return ret;
> +			return dev_err_probe(dev, ret, "no usb3 phy configured\n");
>  		}
>  	}
>  
> @@ -1190,11 +1178,8 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
>  		phy_set_mode(dwc->usb3_generic_phy, PHY_MODE_USB_DEVICE);
>  
>  		ret = dwc3_gadget_init(dwc);
> -		if (ret) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev, "failed to initialize gadget\n");
> -			return ret;
> -		}
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to initialize gadget\n");
>  		break;
>  	case USB_DR_MODE_HOST:
>  		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> @@ -1205,20 +1190,14 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
>  		phy_set_mode(dwc->usb3_generic_phy, PHY_MODE_USB_HOST);
>  
>  		ret = dwc3_host_init(dwc);
> -		if (ret) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev, "failed to initialize host\n");
> -			return ret;
> -		}
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to initialize host\n");
>  		break;
>  	case USB_DR_MODE_OTG:
>  		INIT_WORK(&dwc->drd_work, __dwc3_set_mode);
>  		ret = dwc3_drd_init(dwc);
> -		if (ret) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev, "failed to initialize dual-role\n");
> -			return ret;
> -		}
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to initialize dual-role\n");
>  		break;
>  	default:
>  		dev_err(dev, "Unsupported mode of operation %d\n", dwc->dr_mode);
> @@ -1555,8 +1534,7 @@ static int dwc3_probe(struct platform_device *pdev)
>  
>  	ret = dwc3_core_init(dwc);
>  	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to initialize core: %d\n", ret);
> +		dev_err_probe(dev, ret, "failed to initialize core\n");
>  		goto err4;
>  	}
>  
> -- 
> 2.28.0
> 

-- 
With Best Regards,
Andy Shevchenko


