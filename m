Return-Path: <linux-usb+bounces-36409-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMIlAmI56GnTHAIAu9opvQ
	(envelope-from <linux-usb+bounces-36409-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 04:58:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9DB441A9C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 04:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 305CB300E14F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 02:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D3839D6F7;
	Wed, 22 Apr 2026 02:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvU3J7YT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE9139A7F0;
	Wed, 22 Apr 2026 02:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776826708; cv=none; b=T3DWfyO3mNlOh5qdoTRXlSNVP8c8aFHz7Ms98BiLGoi1eMsr/hXLJxMAHH8M1kmGbRVdSYCA7lgW1zXr4esKmUWsCaWd2bme1dHZW1QgHyofqwUE6oNpuyHQPW9ZIhioEs7pPw1CdhmVsU0Ek06hRjv6cMKqaGGGOR/VZABfkII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776826708; c=relaxed/simple;
	bh=BHJEUobqOTAr0RO/CwhDxdht8RIZ3yFaV1WkE/uG8WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmGpWUV+g/dUXC0zHmEGmgfgvLZiSNvdh9TeXpIc7o1dzcseathNzcnAz98Al4Q45PKFNUwW6+aWEPmipZZPusTn2Gt6RTXPoV1rNr96cAs16V3qHpWwtjdKPau9uNH1N3xMUHGix3c7S8LSHQEZebR5akJ9qmwGr4OnrNWrtac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvU3J7YT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C38C2BCB0;
	Wed, 22 Apr 2026 02:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776826707;
	bh=BHJEUobqOTAr0RO/CwhDxdht8RIZ3yFaV1WkE/uG8WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HvU3J7YTWVFpBtUa9RjNu5zWYPwaZo0kvkbhDi3nNFcpT7gAqBLaFJjAP1fr96I7d
	 BuO8rRsGiRHJevAOdNMw2RawT0FRxYZvGn589pOYhpqsDqGwwnWptmOUb766PN/hxo
	 1a5E8MSGh7GcKYDDOFG/Xh5uYP9BaijT+6o91/WnAWCEyD4978AipJeIkOptkNzm7R
	 GqcBHxgymkG/R/dGMjKaAQVsVhNv7eIDsFN3addsl6vOwsd/TiSmfjjokrKpnVNrhe
	 1PlzyxnlvJdvnTSSzcQ0fBkWzLguxBLb7yfjP4qEtigJUiwxOkXp4ryWlHLaGSkkPj
	 Tm+a8Nv3Rd8gQ==
Date: Wed, 22 Apr 2026 10:58:23 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/3] usb: chipidea: udc: support dynamic gadget add/remove
Message-ID: <aeg5TwH33EC9iFWo@nchen-desktop>
References: <20260421082436.1264442-1-xu.yang_2@nxp.com>
 <20260421082436.1264442-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421082436.1264442-2-xu.yang_2@nxp.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36409-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 9F9DB441A9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-21 16:24:35, Xu Yang wrote:
> When the device is connected and enumerated by the host, switching the
> role from device to host leaves an asynchronous vbus_event_work() to be
> run. This can affect EHCI host controller initialization process.
> 
> If vbus_event_work() runs after ehci_run() sets USBCMD.RUNSTOP bit, then
> RUNSTOP bit will be cleared. As a result, the host controller fails to
> operate.
> 
> The log below shows what happens:
> 
> [   87.819925] ci_hdrc ci_hdrc.0: EHCI Host Controller
> [   87.819963] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
> [   87.955634] ci_hdrc ci_hdrc.0: USB 2.0, controller refused to start: -110
> [   87.955658] ci_hdrc ci_hdrc.0: startup error -110
> [   87.955682] ci_hdrc ci_hdrc.0: USB bus 1 deregistered
> 
> The problem is that the chipidea UDC driver call usb_udc_vbus_handler() to
> pull down data line but it doesn't guarantee that this operation has
> completed before the host controller starts running.
> 
> Now UDC core can properly delete usb gadget device and make sure that vbus
> work is cancelled or completed after usb_del_gadget_udc() is returned. But
> the udc.c only call usb_del_gadget_udc() in ci_hdrc_gadget_destroy(). To
> avoid above issue, let the gadget device add/remove dynamically during USB
> role switching.
> 
> To support dynamic gadget add/remove, this firstly clear ci->gadget and
> ci->ci_hw_ep memory so the driver won't access stale data when initialize
> and reuse these data structures again. Secondly, this assign udc_start()
> and udc_stop() to rdrv->start and rdrv->stop, meanwhile it removes
> udc_id_switch_for_device() and udc_id_switch_for_host(). The things in
> them also properly be merged to udc_start()/udc_stop().
> 
> Since ci_hdrc_gadget_init() doesn't add gadget anymore, this also adjust
> the order of ci_handle_vbus_change() and ci_role_start(), otherwise, NULL
> pointer will be met.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/core.c | 11 +++----
>  drivers/usb/chipidea/udc.c  | 65 +++++++++++++++++++------------------
>  2 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 7cfabb04a4fb..95d9db159ce8 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1191,19 +1191,16 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  
>  	ci->role = ci_get_role(ci);
>  	if (!ci_otg_is_fsm_mode(ci)) {
> -		/* only update vbus status for peripheral */
> -		if (ci->role == CI_ROLE_GADGET) {
> -			/* Pull down DP for possible charger detection */
> -			hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
> -			ci_handle_vbus_change(ci);
> -		}
> -
>  		ret = ci_role_start(ci, ci->role);
>  		if (ret) {
>  			dev_err(dev, "can't start %s role\n",
>  						ci_role(ci)->name);
>  			goto stop;
>  		}
> +
> +		/* only update vbus status for peripheral */
> +		if (ci->role == CI_ROLE_GADGET)
> +			ci_handle_vbus_change(ci);
>  	}
>  
>  	ret = devm_request_irq(dev, ci->irq, ci_irq_handler, IRQF_SHARED,
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index d4277d6611ee..d52f89489893 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -2044,6 +2044,8 @@ static int init_eps(struct ci_hdrc *ci)
>  {
>  	int retval = 0, i, j;
>  
> +	memset(ci->ci_hw_ep, 0, sizeof(ci->ci_hw_ep));
> +
>  	for (i = 0; i < ci->hw_ep_max/2; i++)
>  		for (j = RX; j <= TX; j++) {
>  			int k = i + j * ci->hw_ep_max/2;
> @@ -2289,6 +2291,8 @@ static int udc_start(struct ci_hdrc *ci)
>  	struct usb_otg_caps *otg_caps = &ci->platdata->ci_otg_caps;
>  	int retval = 0;
>  
> +	memset(&ci->gadget, 0, sizeof(ci->gadget));
> +
>  	ci->gadget.ops          = &usb_gadget_ops;
>  	ci->gadget.speed        = USB_SPEED_UNKNOWN;
>  	ci->gadget.max_speed    = USB_SPEED_HIGH;
> @@ -2327,10 +2331,15 @@ static int udc_start(struct ci_hdrc *ci)
>  
>  	ci->gadget.ep0 = &ci->ep0in->ep;
>  
> +	if (ci->platdata->pins_device)
> +		pinctrl_select_state(ci->platdata->pctl,
> +				     ci->platdata->pins_device);
> +
>  	retval = usb_add_gadget_udc(dev, &ci->gadget);
>  	if (retval)
>  		goto destroy_eps;
>  
> +	ci_udc_enable_vbus_irq(ci, true);
>  	return retval;
>  
>  destroy_eps:
> @@ -2342,38 +2351,20 @@ static int udc_start(struct ci_hdrc *ci)
>  	return retval;
>  }
>  
> -/*
> - * ci_hdrc_gadget_destroy: parent remove must call this to remove UDC
> - *
> - * No interrupts active, the IRQ has been released
> +/**
> + * udc_stop: deinitialize gadget role
> + * @ci: chipidea controller
>   */
> -void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
> +static void udc_stop(struct ci_hdrc *ci)
>  {
> -	if (!ci->roles[CI_ROLE_GADGET])
> -		return;
> -
> +	ci_udc_enable_vbus_irq(ci, false);
>  	usb_del_gadget_udc(&ci->gadget);
> +	ci->vbus_active = 0;
>  
>  	destroy_eps(ci);
>  
>  	dma_pool_destroy(ci->td_pool);
>  	dma_pool_destroy(ci->qh_pool);
> -}
> -
> -static int udc_id_switch_for_device(struct ci_hdrc *ci)
> -{
> -	if (ci->platdata->pins_device)
> -		pinctrl_select_state(ci->platdata->pctl,
> -				     ci->platdata->pins_device);
> -
> -	ci_udc_enable_vbus_irq(ci, true);
> -	return 0;
> -}
> -
> -static void udc_id_switch_for_host(struct ci_hdrc *ci)
> -{
> -	ci_udc_enable_vbus_irq(ci, false);
> -	ci->vbus_active = 0;
>  
>  	if (ci->platdata->pins_device && ci->platdata->pins_default)
>  		pinctrl_select_state(ci->platdata->pctl,
> @@ -2422,7 +2413,6 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
>  int ci_hdrc_gadget_init(struct ci_hdrc *ci)
>  {
>  	struct ci_role_driver *rdrv;
> -	int ret;
>  
>  	if (!hw_read(ci, CAP_DCCPARAMS, DCCPARAMS_DC))
>  		return -ENXIO;
> @@ -2431,8 +2421,8 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
>  	if (!rdrv)
>  		return -ENOMEM;
>  
> -	rdrv->start	= udc_id_switch_for_device;
> -	rdrv->stop	= udc_id_switch_for_host;
> +	rdrv->start	= udc_start;
> +	rdrv->stop	= udc_stop;
>  #ifdef CONFIG_PM_SLEEP
>  	rdrv->suspend	= udc_suspend;
>  	rdrv->resume	= udc_resume;
> @@ -2440,9 +2430,22 @@ int ci_hdrc_gadget_init(struct ci_hdrc *ci)
>  	rdrv->irq	= udc_irq;
>  	rdrv->name	= "gadget";
>  
> -	ret = udc_start(ci);
> -	if (!ret)
> -		ci->roles[CI_ROLE_GADGET] = rdrv;
> +	ci->roles[CI_ROLE_GADGET] = rdrv;
>  
> -	return ret;
> +	/* Pull down DP for possible charger detection */
> +	hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
> +	return 0;
> +}
> +
> +/*
> + * ci_hdrc_gadget_destroy: parent remove must call this to remove UDC
> + *
> + * No interrupts active, the IRQ has been released
> + */
> +void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
> +{
> +	struct device *dev = &ci->gadget.dev;
> +
> +	if (ci->roles[CI_ROLE_GADGET] && device_is_registered(dev))
> +		udc_stop(ci);
>  }
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

