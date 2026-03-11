Return-Path: <linux-usb+bounces-34582-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOt8HS6DsWmjCwAAu9opvQ
	(envelope-from <linux-usb+bounces-34582-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:58:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB49265E32
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1A7D301253A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865FE366810;
	Wed, 11 Mar 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="prQCEWwz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B9B337688;
	Wed, 11 Mar 2026 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241128; cv=none; b=CJKCk/CVwYn4LEfv7tVG836mhes2J9BSO7EsSx3I9qFS3rx1eOJ1RoSjOWrH/dfEWdsAHW3ioiDEvDsBDedj2hZiT3t5Ovhz2quWaGASXVyfdUQK2lJtIQI57ji3W+X3rLJWMY/03A3fDXDxVzbRGIKKeeIRnDiRYOzHzjLPGn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241128; c=relaxed/simple;
	bh=3UwwGA7p1224trkn2l3lnBOIO6zwoCMBxvu/3n1GBnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2B3LcaevSVi2mGqEeHJzuEl3+4JvJuP8rLuqtDZd3d/roDA2bgfDF9S2/aSGcnVULrDXMEnGEOmXVC4l3OlyZXuSQ9FWUWo6pBcws/d5lJ+rwvVtScxwqQ2TJDcvVhPnOHRCuGhKs7mN1dPJPYhDmPewQH4PiYPlfdll/rB/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=prQCEWwz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A99C4CEF7;
	Wed, 11 Mar 2026 14:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773241127;
	bh=3UwwGA7p1224trkn2l3lnBOIO6zwoCMBxvu/3n1GBnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prQCEWwzc2c26hzWCQXpbLIVIsXlF2APJXq4ME+yQ7XEp8IDqBOARuSceQg+zJA5u
	 zWofnfjZLH78djAVv0aBq1L0a5JNFoXMJZO8gkSijTmVnQ9xZm2+4Aj0Itan2/212Z
	 fk8eDVRBfW+zBA8hGQORnDn1W6Cs97y21PqAA4vw=
Date: Wed, 11 Mar 2026 15:58:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhaoyang Yu <2426767509@qq.com>
Cc: sergei.shtylyov@gmail.com, daniel@zonque.org, haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] USB: pxa27x_udc: check return value of clk_enable
Message-ID: <2026031145-stencil-italics-89b3@gregkh>
References: <tencent_648835A07EDBB7CA94B66FAF5662EC2F1407@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_648835A07EDBB7CA94B66FAF5662EC2F1407@qq.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34582-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[qq.com];
	FREEMAIL_CC(0.00)[gmail.com,zonque.org,free.fr,lists.infradead.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qq.com:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 0CB49265E32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 01:56:14PM +0000, Zhaoyang Yu wrote:
> clk_enable() may fail according to the API contract.
> Previously, udc_enable() ignored its return value and returned void.
> 
> Modify udc_enable() to return the error code. Additionally, update
> all of its callers (pxa_udc_pullup, pxa_udc_vbus_session,
> pxa27x_udc_start, pxa_udc_probe, and pxa_udc_resume) to check
> this return value and handle the failure properly with necessary
> cleanups or rollbacks.
> 
> Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
> ---
> Changes in v3:
> - Changed udc_enable() return type from void to int.
> - Propagated the error to all caller functions and added proper
>   error handling/rollback per Greg KH's review.
> 
> Changes in v2:
> - Fixed a formatting issue by moving the 'int ret' declaration to
>   the beginning of the function block.
> 
>  drivers/usb/gadget/udc/pxa27x_udc.c | 60 ++++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
> index 897f53601b5b..0a5f05f8e73c 100644
> --- a/drivers/usb/gadget/udc/pxa27x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa27x_udc.c
> @@ -1462,7 +1462,7 @@ static int pxa_udc_wakeup(struct usb_gadget *_gadget)
>  	return 0;
>  }
>  
> -static void udc_enable(struct pxa_udc *udc);
> +static int udc_enable(struct pxa_udc *udc);
>  static void udc_disable(struct pxa_udc *udc);
>  
>  /**
> @@ -1519,14 +1519,18 @@ static int should_disable_udc(struct pxa_udc *udc)
>  static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
>  {
>  	struct pxa_udc *udc = to_gadget_udc(_gadget);
> +	int ret;
>  
>  	if (!udc->gpiod && !udc->udc_command)
>  		return -EOPNOTSUPP;
>  
>  	dplus_pullup(udc, is_active);
>  
> -	if (should_enable_udc(udc))
> -		udc_enable(udc);
> +	if (should_enable_udc(udc)) {
> +		ret = udc_enable(udc);
> +		if (ret)
> +			return ret;
> +	}

DOn't you need to change the pullup?

>  	if (should_disable_udc(udc))
>  		udc_disable(udc);
>  	return 0;
> @@ -1545,10 +1549,14 @@ static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
>  static int pxa_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
>  {
>  	struct pxa_udc *udc = to_gadget_udc(_gadget);
> +	int ret;
>  
>  	udc->vbus_sensed = is_active;
> -	if (should_enable_udc(udc))
> -		udc_enable(udc);
> +	if (should_enable_udc(udc)) {
> +		ret = udc_enable(udc);
> +		if (ret)
> +			return ret;
> +	}

Shouldn't you change vbus_sensed?


>  	if (should_disable_udc(udc))
>  		udc_disable(udc);
>  
> @@ -1691,12 +1699,18 @@ static void udc_init_data(struct pxa_udc *dev)
>   * Enables the udc device : enables clocks, udc interrupts, control endpoint
>   * interrupts, sets usb as UDC client and setups endpoints.
>   */
> -static void udc_enable(struct pxa_udc *udc)
> +static int udc_enable(struct pxa_udc *udc)
>  {
> +	int ret;
> +
>  	if (udc->enabled)
> -		return;
> +		return 0;
>  
> -	clk_enable(udc->clk);
> +	ret = clk_enable(udc->clk);
> +	if (ret) {
> +		dev_err(udc->dev, "clk_enable failed: %d\n", ret);
> +		return ret;
> +	}
>  	udc_writel(udc, UDCICR0, 0);
>  	udc_writel(udc, UDCICR1, 0);
>  	udc_clear_mask_UDCCR(udc, UDCCR_UDE);
> @@ -1726,6 +1740,8 @@ static void udc_enable(struct pxa_udc *udc)
>  	pio_irq_enable(&udc->pxa_ep[0]);
>  
>  	udc->enabled = 1;
> +
> +	return 0;
>  }
>  
>  /**
> @@ -1761,10 +1777,16 @@ static int pxa27x_udc_start(struct usb_gadget *g,
>  		}
>  	}
>  
> -	if (should_enable_udc(udc))
> -		udc_enable(udc);
> +	if (should_enable_udc(udc)) {
> +		retval = udc_enable(udc);
> +		if (retval)
> +			goto fail_enable;
> +	}

No other unwinding is needed?

thanks,

greg k-h

