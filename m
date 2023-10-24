Return-Path: <linux-usb+bounces-2126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B677D4D73
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 12:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF5722819AB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 10:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799FD2510E;
	Tue, 24 Oct 2023 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkSh1nIZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB1B3FE1;
	Tue, 24 Oct 2023 10:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E925C433C8;
	Tue, 24 Oct 2023 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698142500;
	bh=mEUQjGN6AUBmfa+H+hNXq1xNSGPN8suHINWx+52wmbE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pkSh1nIZ8Kk4sMmOglQWhm8LtWqjPekV6G0M4XS9tVWb7evWdeMJ2bP66voXJ4VzX
	 vDX6uOduAY59EEnYairU7RqVtqc1XIE2QhjtntX50apXrav1026u3KRXEjSegl4QQA
	 S3GNMhfIe1Z+EK0iY8fw9xPb1k+Upx05GAWWj1cUUEQwkQnSV68ewoHhMLe3s/XiUr
	 g+AVFIyyIp/N4L9361zNPuyGwjnMdVibVISqERdMH/iRtM4FNYnTalkSorG32W46hL
	 XNqBPmgSLBVcoi5mApHUx1bG/mKTunCckbQkLJxTO6tUGpL2TOoQra7xrcDYUJHoBz
	 plMovqDfYLnqw==
Message-ID: <9be9fae5-f6f2-42fe-bd81-78ab50aafa06@kernel.org>
Date: Tue, 24 Oct 2023 13:14:55 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] usb: dwc3: Modify runtime pm ops to handle bus
 suspend
Content-Language: en-US
To: Elson Roy Serrao <quic_eserrao@quicinc.com>, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230814185043.9252-1-quic_eserrao@quicinc.com>
 <20230814185043.9252-4-quic_eserrao@quicinc.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20230814185043.9252-4-quic_eserrao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Elson,

On 14/08/2023 21:50, Elson Roy Serrao wrote:
> The current implementation blocks the runtime pm operations when cable
> is connected. This would block dwc3 to enter a low power state during
> bus suspend scenario. Modify the runtime pm ops to handle bus suspend
> case for such platforms where the controller low power mode entry/exit
> is handled by the glue driver. This enablement is controlled through a
> dt property and platforms capable of detecting bus resume can benefit
> from this feature. Also modify the remote wakeup operations to trigger
> runtime resume before sending wakeup signal.
> 
> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c   | 28 ++++++++++++++++++++++++++--
>  drivers/usb/dwc3/core.h   |  3 +++
>  drivers/usb/dwc3/gadget.c | 32 +++++++++++++++++++++++++-------
>  3 files changed, 54 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 9c6bf054f15d..9bfd9bb18caf 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1518,6 +1518,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>  	dwc->dis_split_quirk = device_property_read_bool(dev,
>  				"snps,dis-split-quirk");
>  
> +	dwc->runtime_suspend_on_usb_suspend = device_property_read_bool(dev,
> +				"snps,runtime-suspend-on-usb-suspend");
> +
>  	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
>  	dwc->tx_de_emphasis = tx_de_emphasis;
>  
> @@ -2029,6 +2032,9 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>  
>  	switch (dwc->current_dr_role) {
>  	case DWC3_GCTL_PRTCAP_DEVICE:
> +		/* runtime resume on bus resume scenario */
> +		if (PMSG_IS_AUTO(msg) && dwc->connected)
> +			break;
>  		ret = dwc3_core_init_for_resume(dwc);
>  		if (ret)
>  			return ret;
> @@ -2090,8 +2096,13 @@ static int dwc3_runtime_checks(struct dwc3 *dwc)
>  {
>  	switch (dwc->current_dr_role) {
>  	case DWC3_GCTL_PRTCAP_DEVICE:
> -		if (dwc->connected)
> +		if (dwc->connected) {
> +			/* bus suspend scenario */
> +			if (dwc->runtime_suspend_on_usb_suspend &&
> +			    dwc->suspended)

If dwc is already suspended why do we return -EBUSY?
Should this be !dwc->suspended?

> +				break;
>  			return -EBUSY;
> +		}
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
>  	default:
> @@ -2107,9 +2118,22 @@ static int dwc3_runtime_suspend(struct device *dev)
>  	struct dwc3     *dwc = dev_get_drvdata(dev);
>  	int		ret;
>  
> -	if (dwc3_runtime_checks(dwc))
> +	ret = dwc3_runtime_checks(dwc);
> +	if (ret)
>  		return -EBUSY;
>  
> +	switch (dwc->current_dr_role) {
> +	case DWC3_GCTL_PRTCAP_DEVICE:
> +		/* bus suspend case */
> +		if (!ret && dwc->connected)

No need to check !ret again as it will never happen because
we are returning -EBUSY earlier if (ret);

> +			return 0;
> +		break;
> +	case DWC3_GCTL_PRTCAP_HOST:
> +	default:
> +		/* do nothing */
> +		break;
> +	}
> +

While this takes care of runtime suspend case, what about system_suspend?
Should this check be moved to dwc3_suspend_common() instead?

>  	ret = dwc3_suspend_common(dwc, PMSG_AUTO_SUSPEND);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index a69ac67d89fe..f2f788a6b4b5 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1124,6 +1124,8 @@ struct dwc3_scratchpad_array {
>   * @num_ep_resized: carries the current number endpoints which have had its tx
>   *		    fifo resized.
>   * @debug_root: root debugfs directory for this device to put its files in.
> + * @runtime_suspend_on_usb_suspend: true if dwc3 runtime suspend is allowed
> + *			during bus suspend scenario.
>   */
>  struct dwc3 {
>  	struct work_struct	drd_work;
> @@ -1340,6 +1342,7 @@ struct dwc3 {
>  	int			last_fifo_depth;
>  	int			num_ep_resized;
>  	struct dentry		*debug_root;
> +	bool			runtime_suspend_on_usb_suspend;
>  };
>  
>  #define INCRX_BURST_MODE 0
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 5fd067151fbf..978ce0e91164 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2401,15 +2401,21 @@ static int dwc3_gadget_wakeup(struct usb_gadget *g)
>  		return -EINVAL;
>  	}
>  
> -	spin_lock_irqsave(&dwc->lock, flags);
>  	if (!dwc->gadget->wakeup_armed) {
>  		dev_err(dwc->dev, "not armed for remote wakeup\n");
> -		spin_unlock_irqrestore(&dwc->lock, flags);
>  		return -EINVAL;
>  	}
> -	ret = __dwc3_gadget_wakeup(dwc, true);
>  
> +	ret = pm_runtime_resume_and_get(dwc->dev);
> +	if (ret < 0) {
> +		pm_runtime_set_suspended(dwc->dev);
> +		return ret;
> +	}
> +
> +	spin_lock_irqsave(&dwc->lock, flags);
> +	ret = __dwc3_gadget_wakeup(dwc, true);
>  	spin_unlock_irqrestore(&dwc->lock, flags);
> +	pm_runtime_put_noidle(dwc->dev);
>  
>  	return ret;
>  }
> @@ -2428,6 +2434,12 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
>  		return -EINVAL;
>  	}
>  
> +	ret = pm_runtime_resume_and_get(dwc->dev);
> +	if (ret < 0) {
> +		pm_runtime_set_suspended(dwc->dev);
> +		return ret;
> +	}
> +
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	/*
>  	 * If the link is in U3, signal for remote wakeup and wait for the
> @@ -2438,6 +2450,7 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
>  		ret = __dwc3_gadget_wakeup(dwc, false);
>  		if (ret) {
>  			spin_unlock_irqrestore(&dwc->lock, flags);
> +			pm_runtime_put_noidle(dwc->dev);
>  			return -EINVAL;
>  		}
>  		dwc3_resume_gadget(dwc);
> @@ -2452,6 +2465,7 @@ static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
>  		dev_err(dwc->dev, "function remote wakeup failed, ret:%d\n", ret);
>  
>  	spin_unlock_irqrestore(&dwc->lock, flags);
> +	pm_runtime_put_noidle(dwc->dev);
>  
>  	return ret;
>  }
> @@ -2732,21 +2746,23 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
>  	/*
>  	 * Avoid issuing a runtime resume if the device is already in the
>  	 * suspended state during gadget disconnect.  DWC3 gadget was already
> -	 * halted/stopped during runtime suspend.
> +	 * halted/stopped during runtime suspend except for bus suspend case
> +	 * where we would have skipped the controller halt.
>  	 */
>  	if (!is_on) {
>  		pm_runtime_barrier(dwc->dev);
> -		if (pm_runtime_suspended(dwc->dev))
> +		if (pm_runtime_suspended(dwc->dev) && !dwc->connected)
>  			return 0;
>  	}
>  
>  	/*
>  	 * Check the return value for successful resume, or error.  For a
>  	 * successful resume, the DWC3 runtime PM resume routine will handle
> -	 * the run stop sequence, so avoid duplicate operations here.
> +	 * the run stop sequence except for bus resume case, so avoid
> +	 * duplicate operations here.
>  	 */
>  	ret = pm_runtime_get_sync(dwc->dev);
> -	if (!ret || ret < 0) {
> +	if ((!ret && !dwc->connected) || ret < 0) {
>  		pm_runtime_put(dwc->dev);
>  		if (ret < 0)
>  			pm_runtime_set_suspended(dwc->dev);
> @@ -4331,6 +4347,8 @@ static void dwc3_gadget_suspend_interrupt(struct dwc3 *dwc,
>  	}
>  
>  	dwc->link_state = next;
> +	pm_runtime_mark_last_busy(dwc->dev);
> +	pm_request_autosuspend(dwc->dev);
>  }
>  
>  static void dwc3_gadget_interrupt(struct dwc3 *dwc,

-- 
cheers,
-roger

