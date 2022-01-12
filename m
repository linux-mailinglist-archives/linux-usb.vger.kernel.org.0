Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7067B48C430
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 13:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240393AbiALMsn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 07:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240376AbiALMsl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 07:48:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4167FC06173F
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 04:48:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D7506611C3
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 12:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77D3C36AE5;
        Wed, 12 Jan 2022 12:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641991719;
        bh=Fxnb03lKsuMGToV8PRbV9jDpazoo42mQkjpQJspmIIE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cRPQYASn5XaJ/DxinCfdmDDSjXzoeq/obh6FPO35pFNj61JOacnGF/5BU0YI2JSac
         +Bxispcef7BDbqprWKuBv9Ha+OXMgdHo9usibFOvuN4GGM/DG8uMhcPNaUHXWfML+T
         zMwUtF0tem3FUpvQgTSi9u/ZdDVov+t2ZwE3hu54N0jtERpn1JEFKzawONN6Bfm8Pj
         li1aqx6frb/c+JeSus21t+cximdQTaqbsrFxDQ9b1yiq+qzgF2f2b7WftAk1NAer2o
         NcA299SF3zpqQgWuswYZ7AXMtbLljWUv/uXGYDalvlchf6SqsTR9iwNo/YBLLn4+GR
         FGRViR/1CvVfg==
Date:   Wed, 12 Jan 2022 20:48:20 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Frank Li <frank.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, Zhi Li <lznuaa@gmail.com>
Subject: Re: xhci crash at xhci_disable_hub_port_wake when system suspend.
Message-ID: <20220112124820.GA3796@Peter>
References: <PAXPR04MB91861A98BE9D240FFEC1D560884D9@PAXPR04MB9186.eurprd04.prod.outlook.com>
 <20220110123350.GA4302@Peter>
 <3588ae48-e40e-1c9c-c841-cf54f59ad70b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3588ae48-e40e-1c9c-c841-cf54f59ad70b@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-01-10 23:07:48, Mathias Nyman wrote:
> On 10.1.2022 14.33, Peter Chen wrote:
> > On 22-01-07 15:58:26, Frank Li wrote:
> >> Mathias Nyman
> >>
> >> 	Recently we found a crash at xhci_disable_hub_port_wake when system suspend if enable remote wake up.
> >>
> >> 	Basial flow is.
> >>
> >> 	1. run time suspend call xhci_suspend, xhci parent devices gate the clock. 
> >> 	2. echo mem >/sys/power/state, system _device_suspend call xhci_suspend
> >> 	3. xhci_suspend call xhci_disable_hub_port_wake, which access register, but clock already gated by run time pm. 
> >>
> >> 	Why find this issue now, that is because previous power domain driver will call run time resume before it. But the below commit remove it. 
> >>
> >> c1df456d0f06eb9275c1cd4c66548fc5738ea428
> >> Author: Ulf Hansson ulf.hansson@linaro.org
> >> Date:   Thu Mar 4 20:28:43 2021 +0100
> >>
> >>     PM: domains: Don't runtime resume devices at genpd_prepare()
> >>
> >>
> >> 	
> >> According to HCD_FLAG_HW_ACCESSIBLE logic, xhci should not access hardware when second time call xhci_suspend without call xhci_resume. 
> >>
> >>         xhci_disable_hub_port_wake(xhci, &xhci->usb3_rhub, do_wakeup);
> >>         xhci_disable_hub_port_wake(xhci, &xhci->usb2_rhub, do_wakeup);
> >>
> >>         if (!HCD_HW_ACCESSIBLE(hcd))
> >>                 return 0;
> >>
> >>         .....
> >>         clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
> >>         clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
> >>
> >> I am not sure if it is safe to move xhci_disable_hub_port_wake after HCD_HW_ACCESSIBLE check, Or need add additional run_time_resume before it. 
> 
> We probably need to runtime resume first in case we need to adjust the wakeup settings 
> 
> > 
> > Frank, I prefer adding runtime resume at xhci-plat.c like below, let's see what
> > Mathias says.
> > 
> > 
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > index c1edcc9b13ce..47a5a10381a7 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -440,6 +440,9 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
> >  	ret = xhci_priv_suspend_quirk(hcd);
> >  	if (ret)
> >  		return ret;
> > +
> > +	if (pm_runtime_suspended(dev))
> > +		pm_runtime_resume(dev);
> >  	/*
> >  	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
> >  	 * to do wakeup during suspend.
> > 
> 
> Yes, looks like a solution to me.
> Just checked that driver-api/pm/devices.rst also suggest calling
> pm_runtime_resume() in ->suspend callback if device needs to adjust wakeup
> capabilities.
> 
> Frank Li, does this work for you?
> 
> Peter, if we now make sure xhci host is not runtime suspended at system suspend,
> does it mean that the !HCD_HW_ACCESSIBLE(hcd) check you added to xhci_suspend()
> is no longer needed?

Yes, it is no longer needed if xhci host is not runtime suspended.

-- 

Thanks,
Peter Chen

