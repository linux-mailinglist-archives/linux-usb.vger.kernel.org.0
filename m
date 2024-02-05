Return-Path: <linux-usb+bounces-5859-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF0D8492F9
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 05:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CB631C2100A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 04:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8984B9463;
	Mon,  5 Feb 2024 04:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awhYFygf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A33AD32
	for <linux-usb@vger.kernel.org>; Mon,  5 Feb 2024 04:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707108048; cv=none; b=oQWPAPL8deo+k3fj2shpp0sOToxgZ4f7aTjc6AR+dpNEux5wyCMstkFc/lFpFjx5LaGiLFfnkEzjxA0EbDE3W1wbiF9OpWp15X/5ijeE+0VkBgpIulwrKZivGv7jLqW6Flhfberv1yh3mpA/4oWkzs9vYK/bjB+z52RTVxNLuak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707108048; c=relaxed/simple;
	bh=1b5YjNP1oFiZMCbM5bHHWqZ2n6FRBMJ/jybtcztkDw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KetMfJGkV8sw6U67ugfJjGzQG4+qfSArbV4E1fmuqlSy0DfvPk+Ogl6XIEerXsLGhNvWA7QQtMreQre212fwLMxk/429viu1ccJClwTOEwuGgH9KIG4LtbUo+v8SWcwjq+m7Ay6luj56J4ymoPk1qavvEm2s6hceOEwnCWzTAbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awhYFygf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFB7C433C7;
	Mon,  5 Feb 2024 04:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707108047;
	bh=1b5YjNP1oFiZMCbM5bHHWqZ2n6FRBMJ/jybtcztkDw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=awhYFygfWfQG8soSNTFYxe/ibUkcnpcLm//jXMYSxMGAXZ/8tnj3D6H7W/XVwhszj
	 G68bu6rCNVPZNi+Q08o0BAzWt5HcfyhvG8FIR3G4FoV98b7clwtNBLjcT4jYBKppbV
	 2mJhdnTpBo+FFHViB7+Gee6IygGcgaEEATjq7JydvM6b5NlxxhQh9f2xWiE6LGgIiY
	 kTMlTLtr8chZaOPy+pci1gnmnmLlAj94D8H6+Nfp541rIlQi9SwccPLBGIfg32ONfn
	 0PGGScKr2ev7/+J8cJtfUHmrHtG+2Tmj+cZAb4Q8V3ehIhKTqgyML8gfz8pOqAAEOC
	 G8FiUNA+XozrA==
Date: Mon, 5 Feb 2024 12:40:37 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, jun.li@nxp.com,
	linux-imx@nxp.com
Subject: Re: [PATCH] usb: chipidea: core: handle power lost in workqueue
Message-ID: <20240205044037.GB1200221@nchen-desktop>
References: <20240119123537.3614838-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119123537.3614838-1-xu.yang_2@nxp.com>

On 24-01-19 20:35:37, Xu Yang wrote:
> When power is recycled in usb controller during system power management,
> the controller will recognize it and switch role if role has been changed
> during power lost. In current design, it will be completed in resume()
> function. However, this may bring issues since usb class devices have
> their pm operations too and these device's resume() functions are still
> not being called at this point. When usb controller recognized host role
> should be stopped, these usb class devices will be removed at this point.
> But these usb class devices can't be removed in some cases, such as scsi
> devices. Since scsi driver may sync data to U-disk, however it will block
> there because scsi drvier can only handle pm request when is in suspended
> state. Therefore, there may exist a dependency between ci_resume() and usb
> class device's resume(). To break this potential dependency, we need to
> handle power lost work in a workqueue.
> 
> Fixes: 74494b33211d ("usb: chipidea: core: add controller resume support when controller is powered off")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

> ---
>  drivers/usb/chipidea/ci.h   |  2 ++
>  drivers/usb/chipidea/core.c | 44 ++++++++++++++++++++-----------------
>  2 files changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index d9bb3d3f026e..2a38e1eb6546 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -176,6 +176,7 @@ struct hw_bank {
>   * @enabled_otg_timer_bits: bits of enabled otg timers
>   * @next_otg_timer: next nearest enabled timer to be expired
>   * @work: work for role changing
> + * @power_lost_work: work for power lost handling
>   * @wq: workqueue thread
>   * @qh_pool: allocation pool for queue heads
>   * @td_pool: allocation pool for transfer descriptors
> @@ -226,6 +227,7 @@ struct ci_hdrc {
>  	enum otg_fsm_timer		next_otg_timer;
>  	struct usb_role_switch		*role_switch;
>  	struct work_struct		work;
> +	struct work_struct		power_lost_work;
>  	struct workqueue_struct		*wq;
>  
>  	struct dma_pool			*qh_pool;
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 41014f93cfdf..835bf2428dc6 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -856,6 +856,27 @@ static int ci_extcon_register(struct ci_hdrc *ci)
>  	return 0;
>  }
>  
> +static void ci_power_lost_work(struct work_struct *work)
> +{
> +	struct ci_hdrc *ci = container_of(work, struct ci_hdrc, power_lost_work);
> +	enum ci_role role;
> +
> +	disable_irq_nosync(ci->irq);
> +	pm_runtime_get_sync(ci->dev);
> +	if (!ci_otg_is_fsm_mode(ci)) {
> +		role = ci_get_role(ci);
> +
> +		if (ci->role != role) {
> +			ci_handle_id_switch(ci);
> +		} else if (role == CI_ROLE_GADGET) {
> +			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
> +				usb_gadget_vbus_connect(&ci->gadget);
> +		}
> +	}
> +	pm_runtime_put_sync(ci->dev);
> +	enable_irq(ci->irq);
> +}
> +
>  static DEFINE_IDA(ci_ida);
>  
>  struct platform_device *ci_hdrc_add_device(struct device *dev,
> @@ -1045,6 +1066,8 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&ci->lock);
>  	mutex_init(&ci->mutex);
> +	INIT_WORK(&ci->power_lost_work, ci_power_lost_work);
> +
>  	ci->dev = dev;
>  	ci->platdata = dev_get_platdata(dev);
>  	ci->imx28_write_fix = !!(ci->platdata->flags &
> @@ -1396,25 +1419,6 @@ static int ci_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static void ci_handle_power_lost(struct ci_hdrc *ci)
> -{
> -	enum ci_role role;
> -
> -	disable_irq_nosync(ci->irq);
> -	if (!ci_otg_is_fsm_mode(ci)) {
> -		role = ci_get_role(ci);
> -
> -		if (ci->role != role) {
> -			ci_handle_id_switch(ci);
> -		} else if (role == CI_ROLE_GADGET) {
> -			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
> -				usb_gadget_vbus_connect(&ci->gadget);
> -		}
> -	}
> -
> -	enable_irq(ci->irq);
> -}
> -
>  static int ci_resume(struct device *dev)
>  {
>  	struct ci_hdrc *ci = dev_get_drvdata(dev);
> @@ -1446,7 +1450,7 @@ static int ci_resume(struct device *dev)
>  		ci_role(ci)->resume(ci, power_lost);
>  
>  	if (power_lost)
> -		ci_handle_power_lost(ci);
> +		queue_work(system_freezable_wq, &ci->power_lost_work);
>  
>  	if (ci->supports_runtime_pm) {
>  		pm_runtime_disable(dev);
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen

