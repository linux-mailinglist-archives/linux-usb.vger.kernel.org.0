Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4684898AF
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 13:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245544AbiAJMey (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 07:34:54 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:39456 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245607AbiAJMd5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 07:33:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 91C28612A6
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 12:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FBEC36AE3;
        Mon, 10 Jan 2022 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641818036;
        bh=onJZcggkRbom0bFgkN1mnZpF9E64B/wb32E1vvW6CEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ElJH1A593pA9wNr2rLMj0gvW955GN+lp/vvm266Rk8lCgGEpb1W/D6FMYRat0GlNE
         tuDtde5bVT9kwm34lkapbxalO5i/otr6wJE/iYvuX8onmXL+dXKXvc8F+IIwSg9mky
         uRAjRNIpqPwXdVNzt1vrWVMA+BOHP5ADiYvg8u0d3EJ8C6DrIs0ERB7h0wFEaVZbLY
         Cv8bbEE2JUZBzHoCR3/huePqDTbMD34wW0uO7/1lA+fH2pdfuCmwpDAx4Ad7Bp2SE4
         JR4UK4/goyVcN2pMKWMIpFChoYdRqmH6hbex3RdzaFu+6Myh+6qpqLVEXgbiRFEQJn
         V88+5BRxliTUw==
Date:   Mon, 10 Jan 2022 20:33:50 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Frank Li <frank.li@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>,
        Jun Li <jun.li@nxp.com>, Zhi Li <lznuaa@gmail.com>
Subject: Re: xhci crash at xhci_disable_hub_port_wake when system suspend.
Message-ID: <20220110123350.GA4302@Peter>
References: <PAXPR04MB91861A98BE9D240FFEC1D560884D9@PAXPR04MB9186.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91861A98BE9D240FFEC1D560884D9@PAXPR04MB9186.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-01-07 15:58:26, Frank Li wrote:
> Mathias Nyman
> 
> 	Recently we found a crash at xhci_disable_hub_port_wake when system suspend if enable remote wake up.
> 
> 	Basial flow is.
> 
> 	1. run time suspend call xhci_suspend, xhci parent devices gate the clock. 
> 	2. echo mem >/sys/power/state, system _device_suspend call xhci_suspend
> 	3. xhci_suspend call xhci_disable_hub_port_wake, which access register, but clock already gated by run time pm. 
> 
> 	Why find this issue now, that is because previous power domain driver will call run time resume before it. But the below commit remove it. 
> 
> c1df456d0f06eb9275c1cd4c66548fc5738ea428
> Author: Ulf Hansson ulf.hansson@linaro.org
> Date:   Thu Mar 4 20:28:43 2021 +0100
> 
>     PM: domains: Don't runtime resume devices at genpd_prepare()
> 
> 
> 	
> According to HCD_FLAG_HW_ACCESSIBLE logic, xhci should not access hardware when second time call xhci_suspend without call xhci_resume. 
> 
>         xhci_disable_hub_port_wake(xhci, &xhci->usb3_rhub, do_wakeup);
>         xhci_disable_hub_port_wake(xhci, &xhci->usb2_rhub, do_wakeup);
> 
>         if (!HCD_HW_ACCESSIBLE(hcd))
>                 return 0;
> 
>         .....
>         clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
>         clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
> 
> I am not sure if it is safe to move xhci_disable_hub_port_wake after HCD_HW_ACCESSIBLE check, Or need add additional run_time_resume before it. 

Frank, I prefer adding runtime resume at xhci-plat.c like below, let's see what
Mathias says.


diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c1edcc9b13ce..47a5a10381a7 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -440,6 +440,9 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 	ret = xhci_priv_suspend_quirk(hcd);
 	if (ret)
 		return ret;
+
+	if (pm_runtime_suspended(dev))
+		pm_runtime_resume(dev);
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
 	 * to do wakeup during suspend.

-- 

Thanks,
Peter Chen

