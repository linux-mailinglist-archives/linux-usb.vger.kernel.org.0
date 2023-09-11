Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B0F79B485
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350459AbjIKVig (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237458AbjIKMwU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 08:52:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C431AE40
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694436735; x=1725972735;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=0ESsV65QRvRM+OdWgO3nR4ex5HwzPnOiORwoJ7VcH94=;
  b=nccfkbwX22OxUBJEkm4jSPDnpoHhel7oNq31Z1tu10cozaeGG19a9/KE
   CARJVMq8rALxaa6ChUKQTI6xazHqUf96cvFvqI/4pqub2qjP5krBQkrlj
   SuOaaf+3d7zleCEMYeWfUtKtcRd1sRQJLEH2XBvAN8kuJYEPkndv1q9u2
   JjCcgtXYn7GGARU5epLTopI+itS9Z3VsmN68jLNHkmTPhVciN4enhUW/r
   DKysSTT6Rs8EpRpbe+X06z+/gBmp0lNROd90Qoj4dCz62tM6GSnh64fFO
   06LfHPLYQ10A41w8pFGC60WmMocyKm+F28KHqQi5+utXFD2Fc6Iy7ZkcN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381875833"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="381875833"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 05:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="866930102"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="866930102"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 11 Sep 2023 05:52:13 -0700
Message-ID: <0957c21d-144b-1d84-2f79-f4cc6ba2a493@linux.intel.com>
Date:   Mon, 11 Sep 2023 15:53:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>
References: <e0459058-5ca5-1c1a-c06a-47100c176ba2@omp.ru>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v4] usb: host: xhci-plat: fix possible kernel oops while
 resuming
In-Reply-To: <e0459058-5ca5-1c1a-c06a-47100c176ba2@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

Sorry about the delay

On 11.7.2023 22.18, Sergey Shtylyov wrote:
> If this driver enables the xHC clocks while resuming from sleep, it calls
> clk_prepare_enable() without checking for errors and blithely goes on to
> read/write the xHC's registers -- which, with the xHC not being clocked,
> at least on ARM32 usually causes an imprecise external abort exceptions
> which cause kernel oops.  Currently, the chips for which the driver does
> the clock dance on suspend/resume seem to be the Broadcom STB SoCs, based
> on ARM32 CPUs, as it seems...
> 
> In order to fix this issue, add the result checks for clk_prepare_enable()
> calls in xhci_plat_resume(), add conditional clk_disable_unprepare() calls
> on the error path of xhci_plat_resume(); then factor out the common clock
> disabling code from the suspend() and resume() driver PM methods into a
> separate function to avoid code duplication.

Minor nitpick, but not sure a separate function is helpful here.
It's two lines of code called twice.

> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Fixes: 8bd954c56197 ("usb: host: xhci-plat: suspend and resume clocks")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

If I understood correctly this issue hasn't been seen in real life,
and this patch only changes how we fail?

So I guess this would be more suitable for usb-next than usb-linus.

> 
> ---
> This patch is against the 'usb-linus' branch of Greg KH's 'usb.git' repo...
> 
> Changes in version 4:
> - resolved reject in xhci_plat_resume() due to the changed xhci_resume() call;
> - added the __maybe_unused attribute to xhci_plat_disable_clocks().
> 
> Changes in version 3:
> - sanitized the clock enabling error paths in xhci_plat_resume() WRT the
>    applicability checks;
> - factored out the common clock disabling code from the suspend() and resume()
>    driver PM methods;
> - added to the patch sescriptiun a passage describing the change being done.
> 
> Changes in version 2:
> - fixed up the error path for clk_prepare_enable() calls in xhci_plat_resume().
> 
>   drivers/usb/host/xhci-plat.c |   35 +++++++++++++++++++++++++++--------
>   1 file changed, 27 insertions(+), 8 deletions(-)
> 
> Index: usb/drivers/usb/host/xhci-plat.c
> ===================================================================
> --- usb.orig/drivers/usb/host/xhci-plat.c
> +++ usb/drivers/usb/host/xhci-plat.c
> @@ -424,6 +424,14 @@ void xhci_plat_remove(struct platform_de
>   }
>   EXPORT_SYMBOL_GPL(xhci_plat_remove);
>   
> +static void __maybe_unused xhci_plat_disable_clocks(struct xhci_hcd *xhci)
> +{
> +	if (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS) {
> +		clk_disable_unprepare(xhci->clk);
> +		clk_disable_unprepare(xhci->reg_clk);
> +	}
> +}
> +

xhci_plat_disable_clocks() name is a bit misleading, it only disables the clocks
if clocks are set to be disabled/enabled during suspend/resume.

>   static int __maybe_unused xhci_plat_suspend(struct device *dev)
>   {
>   	struct usb_hcd	*hcd = dev_get_drvdata(dev);
> @@ -444,10 +452,8 @@ static int __maybe_unused xhci_plat_susp
>   	if (ret)
>   		return ret;
>   
> -	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
> -		clk_disable_unprepare(xhci->clk);
> -		clk_disable_unprepare(xhci->reg_clk);
> -	}
> +	if (!device_may_wakeup(dev))
> +		xhci_plat_disable_clocks(xhci);

Not sure this change improves things

>   
>   	return 0;
>   }
> @@ -459,23 +465,36 @@ static int __maybe_unused xhci_plat_resu
>   	int ret;
>   
>   	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
> -		clk_prepare_enable(xhci->clk);
> -		clk_prepare_enable(xhci->reg_clk);
> +		ret = clk_prepare_enable(xhci->clk);
> +		if (ret)
> +			return ret;
> +
> +		ret = clk_prepare_enable(xhci->reg_clk);
> +		if (ret) {
> +			clk_disable_unprepare(xhci->clk);
> +			return ret;
> +		}
>   	}
>   
>   	ret = xhci_priv_resume_quirk(hcd);
>   	if (ret)
> -		return ret;
> +		goto disable_clks;
>   
>   	ret = xhci_resume(xhci, PMSG_RESUME);
>   	if (ret)
> -		return ret;
> +		goto disable_clks;
>   
>   	pm_runtime_disable(dev);
>   	pm_runtime_set_active(dev);
>   	pm_runtime_enable(dev);
>   
>   	return 0;
> +
> +disable_clks:
> +	if (!device_may_wakeup(dev))
> +		xhci_plat_disable_clocks(xhci);

I'd skip the helper and just do:

if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
	clk_disable_unprepare(xhci->clk);
	clk_disable_unprepare(xhci->reg_clk);
}

It better matches the if condition when enabling the clocks:
if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
	ret = clk_prepare_enable(xhci->clk);
	...

We also don't save any lines of code by adding the helper.

Thanks
Mathias

