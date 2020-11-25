Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1323E2C44DF
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 17:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbgKYQWt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 11:22:49 -0500
Received: from mga04.intel.com ([192.55.52.120]:65155 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729755AbgKYQWt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Nov 2020 11:22:49 -0500
IronPort-SDR: IixMWSQGxcZ/+5aR22zJ562eOIkWhlwmuMkyhKoE8IJWtNdVPeR+Uh8Q/JbgYVwk/YkZkvoRd5
 z0uPvbAmmnYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="169600072"
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; 
   d="scan'208";a="169600072"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 08:22:49 -0800
IronPort-SDR: tV1EJaqhXolRxvybh7H/+H2B2aPEE/KbiA42TypcioUQeXlXh/7rzu0jWXEIZ3wsMIrDzA7uTw
 Jsr99lzHnrog==
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; 
   d="scan'208";a="547342380"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 08:22:48 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1khxaA-009fJ3-6O; Wed, 25 Nov 2020 18:23:50 +0200
Date:   Wed, 25 Nov 2020 18:23:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] usb: dwc3: keystone: Simplify with dev_err_probe()
Message-ID: <20201125162350.GZ4077@smile.fi.intel.com>
References: <20201020083750.89210-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020083750.89210-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 20, 2020 at 11:37:50AM +0300, Andy Shevchenko wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe(). Less code and the error value gets printed.

Felipe, any comments?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/dwc3/dwc3-keystone.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
> index 9a99253d5ba3..057056c0975e 100644
> --- a/drivers/usb/dwc3/dwc3-keystone.c
> +++ b/drivers/usb/dwc3/dwc3-keystone.c
> @@ -99,13 +99,8 @@ static int kdwc3_probe(struct platform_device *pdev)
>  
>  	/* PSC dependency on AM65 needs SERDES0 to be powered before USB0 */
>  	kdwc->usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
> -	if (IS_ERR(kdwc->usb3_phy)) {
> -		error = PTR_ERR(kdwc->usb3_phy);
> -		if (error != -EPROBE_DEFER)
> -			dev_err(dev, "couldn't get usb3 phy: %d\n", error);
> -
> -		return error;
> -	}
> +	if (IS_ERR(kdwc->usb3_phy))
> +		return dev_err_probe(dev, PTR_ERR(kdwc->usb3_phy), "couldn't get usb3 phy\n");
>  
>  	phy_pm_runtime_get_sync(kdwc->usb3_phy);
>  
> -- 
> 2.28.0
> 

-- 
With Best Regards,
Andy Shevchenko


