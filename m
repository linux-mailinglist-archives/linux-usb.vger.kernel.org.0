Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7343848A169
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 22:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343769AbiAJVG0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 16:06:26 -0500
Received: from mga11.intel.com ([192.55.52.93]:53403 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239741AbiAJVGZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jan 2022 16:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641848785; x=1673384785;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=hPErtS7uaDWG4OpP0GrRr4ecg91ineHuMAvTi08H0QM=;
  b=DYyt//FhqxJVOgBMVtNVTBHGdPijeUHckCRZZkw9Z2ML91IudjTsJeXB
   +SSDtLTkJ6g9Xep3wEsBbeVbBp3OFumzXBt0B1i1jqIUp7jdw5aEGRXFe
   qRuXDr/fLlwNZIgyU02MXF5UFa9PuSXUKi13R8sAqI/PrCu01OKA38nR0
   QvsQYxUG05Qveaf4ciMYGmWGrnId5rBrq+H9aXMhCw87hCPOhSQ4bzSLx
   Hrfa2lTcj+PijMZOvE4xkdg9ksNJ5OgOJCBtI3bBrWa2FsnzwX5Smal8M
   mEFamHRpFRyHX0LbiVjY7uTdOh6nI9IksTmO666cApmE5AGgheIcMQ8Tp
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="240870955"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="240870955"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 13:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="622803974"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 10 Jan 2022 13:06:23 -0800
To:     Peter Chen <peter.chen@kernel.org>, Frank Li <frank.li@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, Zhi Li <lznuaa@gmail.com>
References: <PAXPR04MB91861A98BE9D240FFEC1D560884D9@PAXPR04MB9186.eurprd04.prod.outlook.com>
 <20220110123350.GA4302@Peter>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: xhci crash at xhci_disable_hub_port_wake when system suspend.
Message-ID: <3588ae48-e40e-1c9c-c841-cf54f59ad70b@linux.intel.com>
Date:   Mon, 10 Jan 2022 23:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220110123350.GA4302@Peter>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10.1.2022 14.33, Peter Chen wrote:
> On 22-01-07 15:58:26, Frank Li wrote:
>> Mathias Nyman
>>
>> 	Recently we found a crash at xhci_disable_hub_port_wake when system suspend if enable remote wake up.
>>
>> 	Basial flow is.
>>
>> 	1. run time suspend call xhci_suspend, xhci parent devices gate the clock. 
>> 	2. echo mem >/sys/power/state, system _device_suspend call xhci_suspend
>> 	3. xhci_suspend call xhci_disable_hub_port_wake, which access register, but clock already gated by run time pm. 
>>
>> 	Why find this issue now, that is because previous power domain driver will call run time resume before it. But the below commit remove it. 
>>
>> c1df456d0f06eb9275c1cd4c66548fc5738ea428
>> Author: Ulf Hansson ulf.hansson@linaro.org
>> Date:   Thu Mar 4 20:28:43 2021 +0100
>>
>>     PM: domains: Don't runtime resume devices at genpd_prepare()
>>
>>
>> 	
>> According to HCD_FLAG_HW_ACCESSIBLE logic, xhci should not access hardware when second time call xhci_suspend without call xhci_resume. 
>>
>>         xhci_disable_hub_port_wake(xhci, &xhci->usb3_rhub, do_wakeup);
>>         xhci_disable_hub_port_wake(xhci, &xhci->usb2_rhub, do_wakeup);
>>
>>         if (!HCD_HW_ACCESSIBLE(hcd))
>>                 return 0;
>>
>>         .....
>>         clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
>>         clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
>>
>> I am not sure if it is safe to move xhci_disable_hub_port_wake after HCD_HW_ACCESSIBLE check, Or need add additional run_time_resume before it. 

We probably need to runtime resume first in case we need to adjust the wakeup settings 

> 
> Frank, I prefer adding runtime resume at xhci-plat.c like below, let's see what
> Mathias says.
> 
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index c1edcc9b13ce..47a5a10381a7 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -440,6 +440,9 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
>  	ret = xhci_priv_suspend_quirk(hcd);
>  	if (ret)
>  		return ret;
> +
> +	if (pm_runtime_suspended(dev))
> +		pm_runtime_resume(dev);
>  	/*
>  	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
>  	 * to do wakeup during suspend.
> 

Yes, looks like a solution to me.
Just checked that driver-api/pm/devices.rst also suggest calling
pm_runtime_resume() in ->suspend callback if device needs to adjust wakeup
capabilities.

Frank Li, does this work for you?

Peter, if we now make sure xhci host is not runtime suspended at system suspend,
does it mean that the !HCD_HW_ACCESSIBLE(hcd) check you added to xhci_suspend()
is no longer needed?

18a367e8947d usb: xhci: omit duplicate actions when suspending a runtime suspended host
 
Thanks
-Mathias
