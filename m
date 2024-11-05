Return-Path: <linux-usb+bounces-17118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5429BCE64
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 14:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AB201C2174D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 13:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3461D6DD1;
	Tue,  5 Nov 2024 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOSZ5PfX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A01D45FD;
	Tue,  5 Nov 2024 13:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730814965; cv=none; b=cxNB/petlLtBsGJcM4wqMeXq5kJTn9OrYmTVaZTBAPP8hBzzuaMr9HfaPR3cl3oUCEvYZgoxhWbWAabMmEeitySRoItetO+ssrsxx5hZl/G06W6D/36hyZk5UMfD+qI00Jsxd84NBLe3l0LwmRN07DIDn+I9iOoM22bilhB7cuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730814965; c=relaxed/simple;
	bh=B8zdbQ6cPYCK+6r67NeVRs7ZNcjG8oNdvJnXDQkqORM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4h4gmQTTI9KjYAfBLRSsGpPWemDrNfNb4clsBucOqhhBieVckdfnlIzdMTWdCZ6W0OZIFiqDuOO9CeLUD/vyoaks1tzNT68vqIcAVG7kAgYy+L+EkyJ8kmaZvW191Q4TIxQJe+R1FPZUciBHnD8GmY4ugexSqctPr896A6aXfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOSZ5PfX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404F4C4CECF;
	Tue,  5 Nov 2024 13:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730814964;
	bh=B8zdbQ6cPYCK+6r67NeVRs7ZNcjG8oNdvJnXDQkqORM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QOSZ5PfX5FLwW7vq+wN1jcMkHF3MzZIz6LSHNpHdsXrR1X0fCcNvXVfZ2/ycW8ZvP
	 w+PL72WiMFxFI3Z6dlgoT6Aeq7B8RGAWQTAZv5GyVL2ksui36tnytAEbkZbumtUPaD
	 GQsrXULOmAWespxKLsJVQGvM4q8aHn+3gdTubjDkVQaEl4RFepDBrAfFHiiQ58JLAL
	 9fAIqGs0D76c1jKDx6HBbzOLT3SwhhX0LF2JhHqVuADAKfYzHVc/Prru+0xlG5jR89
	 /qBEbk46oC4cZzMPa0sk6PL53agPVeNjyELsqN4hhBEs/KBJrm2V/gkNnt8iR4+HQQ
	 fL4E/WhbkroDw==
Message-ID: <48a687c7-24e2-4815-8cc1-d223b38e0e55@kernel.org>
Date: Tue, 5 Nov 2024 15:56:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: core: avoid reading register after bus clk is
 disabled
To: Xu Yang <xu.yang_2@nxp.com>, Thinh.Nguyen@synopsys.com,
 gregkh@linuxfoundation.org, d-gole@ti.com
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
References: <20241105071426.2411166-1-xu.yang_2@nxp.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241105071426.2411166-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Xu,

On 05/11/2024 09:14, Xu Yang wrote:
> The driver may go through below sequence when works as device mode:
> 
> dwc3_suspend()
>   dwc3_suspend_common()
>     dwc3_core_exit()
>       dwc3_clk_disable()
> 	clk_disable_unprepare(dwc->bus_clk);
>     dwc3_enable_susphy()
>       dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(i));
> 
> Then the driver will read dwc3 register after bus clk is disabled. If this
> happens, the kernel will hang there. This will move dwc3_enable_susphy()
> ahead to avoid such issue.
> 
> Fixes: 705e3ce37bcc ("usb: dwc3: core: Fix system suspend on TI AM62 platforms")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Thank you for the patch. But this was already addressed yesterday.

https://lore.kernel.org/all/20241104-am62-lpm-usb-fix-v1-1-e93df73a4f0d@kernel.org/

> ---
>  drivers/usb/dwc3/core.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index de434f78c560..b0f1e32d426f 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2347,6 +2347,15 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  			    (dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0)) &
>  			    DWC3_GUSB3PIPECTL_SUSPHY);
>  
> +	if (!PMSG_IS_AUTO(msg)) {

This alone is not enough as device might have been runtime suspended before
system suspend and we will still try to access the registers below causing a fault.

> +		/*
> +		 * TI AM62 platform requires SUSPHY to be
> +		 * enabled for system suspend to work.
> +		 */
> +		if (!dwc->susphy_state)
> +			dwc3_enable_susphy(dwc, true);
> +	}
> +
>  	switch (dwc->current_dr_role) {
>  	case DWC3_GCTL_PRTCAP_DEVICE:
>  		if (pm_runtime_suspended(dwc->dev))
> @@ -2398,15 +2407,6 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  		break;
>  	}
>  
> -	if (!PMSG_IS_AUTO(msg)) {
> -		/*
> -		 * TI AM62 platform requires SUSPHY to be
> -		 * enabled for system suspend to work.
> -		 */
> -		if (!dwc->susphy_state)
> -			dwc3_enable_susphy(dwc, true);
> -	}
> -
>  	return 0;
>  }
>  

-- 
cheers,
-roger

