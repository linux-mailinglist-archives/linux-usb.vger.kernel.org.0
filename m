Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9050130E49
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2019 14:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfEaMpM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 May 2019 08:45:12 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:33828 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727338AbfEaMpH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 May 2019 08:45:07 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 764BAC0173;
        Fri, 31 May 2019 12:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1559306689; bh=aCYOMqBXZF4boyxMVaHtPUNTb2vRYw/Gm+o2Oco3+U4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dSGJCxuz4bGVtL2exSrGet4Q+438emtvcidbHkLWKm7JAzRAsaNcXMoH5puYDwFgf
         2H0OjUoNtEargtjBIlfjSYFvhOzhIcb+ePFkQjb1iModYKEa7KD6OkDnN9dLVCSEs+
         4/I++RAlmR65KK/Gf52Z+EIgs/4GYypO5T7OsKzlZ6sNsC2JZjB+r4lRN/X0kGjaDZ
         cMh4ZpssDvI/Wh4W7Cp2GjP5ZKKKr5lV0pUhE3qSW9aIkmgf6d7lR1Ywc2G8zPPS7n
         9LMQAJtVAVUTs8rC3Z1o+Bx7p2pmlLaLCG9kBJw3nqHcacL7YTjuC1ZkDOQO107uR5
         u5wNhHUFbAc/Q==
Received: from [10.116.70.206] (hminas-7480.internal.synopsys.com [10.116.70.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 48E10A0093;
        Fri, 31 May 2019 12:45:01 +0000 (UTC)
Subject: Re: [PATCH v2] usb: dwc2: Use generic PHY width in params setup
To:     Jules Maselbas <jmaselbas@kalray.eu>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20190507100852.11263-2-jmaselbas@kalray.eu>
 <20190509091528.28397-1-jmaselbas@kalray.eu>
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Message-ID: <1d774b88-b176-448d-3e8b-8c1f04cb1406@synopsys.com>
Date:   Fri, 31 May 2019 16:44:59 +0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190509091528.28397-1-jmaselbas@kalray.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/9/2019 1:16 PM, Jules Maselbas wrote:
> Setting params.phy_utmi_width in dwc2_lowlevel_hw_init() is pointless since
> it's value will be overwritten by dwc2_init_params().
> 
> This change make sure to take in account the generic PHY width information
> during paraminitialisation, done in dwc2_set_param_phy_utmi_width().
> 
> By doing so, the phy_utmi_width params can still be overrided by
> devicetree specific params and will also be checked against hardware
> capabilities.
> 
> Fixes: 707d80f0a3c5 ("usb: dwc2: gadget: Replace phyif with phy_utmi_width")
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>

Acked-by: Minas Harutyunyan <hminas@synopsys.com>

> ---
> v2: Fix typo in commit message. Add Fixes and Tested-by tags.
> ---
>   drivers/usb/dwc2/params.c   | 9 +++++++++
>   drivers/usb/dwc2/platform.c | 9 ---------
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 6900eea57526..5949262ff669 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -253,6 +253,15 @@ static void dwc2_set_param_phy_utmi_width(struct dwc2_hsotg *hsotg)
>   	val = (hsotg->hw_params.utmi_phy_data_width ==
>   	       GHWCFG4_UTMI_PHY_DATA_WIDTH_8) ? 8 : 16;
>   
> +	if (hsotg->phy) {
> +		/*
> +		 * If using the generic PHY framework, check if the PHY bus
> +		 * width is 8-bit and set the phyif appropriately.
> +		 */
> +		if (phy_get_bus_width(hsotg->phy) == 8)
> +			val = 8;
> +	}
> +
>   	hsotg->params.phy_utmi_width = val;
>   }
>   
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index d10a7f8daec3..e98d7812da2d 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -271,15 +271,6 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>   
>   	hsotg->plat = dev_get_platdata(hsotg->dev);
>   
> -	if (hsotg->phy) {
> -		/*
> -		 * If using the generic PHY framework, check if the PHY bus
> -		 * width is 8-bit and set the phyif appropriately.
> -		 */
> -		if (phy_get_bus_width(hsotg->phy) == 8)
> -			hsotg->params.phy_utmi_width = 8;
> -	}
> -
>   	/* Clock */
>   	hsotg->clk = devm_clk_get_optional(hsotg->dev, "otg");
>   	if (IS_ERR(hsotg->clk)) {
> 

