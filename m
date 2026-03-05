Return-Path: <linux-usb+bounces-34126-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJRfDjADqmliJgEAu9opvQ
	(envelope-from <linux-usb+bounces-34126-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 23:26:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A99A218E49
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 23:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C9F030E103A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 22:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE39D3630B3;
	Thu,  5 Mar 2026 22:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfwlPNen"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB7B342CB0
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 22:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772749396; cv=none; b=SMHfZQ/mQfPJjVG/6DpzKNiih0oHHfbPMLSLSqasptg2TTk3WWzMsSNhh2zBf9IUgpZ4LNUIc3g7tIYgFLzSS4A/s04NIIA6qUTqpIwyhve0mggaylMnyzgdllI8+XbVXn2nypb5d2Xcy3NSNspitcLhirfb+Q7/Ga++ahPeeNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772749396; c=relaxed/simple;
	bh=Fylk1fGlx9IbRrxfCSZyqhLJ8IgzjXWRk3SRPYOTRY0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYqz5DOsZrEfvlD1OFA5utliGEsV5kTEN9l6G/nz8kEV2c5E9CfZi0QtO8oR9cxAmQttph7JjMutoikCAYqU51b85GwXS8ac6bBHMm7xgLKiyML9vaiUOQmGvrQ1L/iUT63KAgVofuLbbfiXVwtRklhZ0Rg/++zDCMg35W1PJkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfwlPNen; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-660d77cacc2so6057252a12.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 14:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772749393; x=1773354193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXxIK6LDCjXrbH47U3uBLKABcpuD9wr8eg7xN5cAq+M=;
        b=hfwlPNen1liAJsPSEQZsl32Ng2M/1G1txCOGSeKGH+2ugsf5RJ95dtFOq3+2GWClaz
         RphWBwSXSMqwav/G9Myv4j3PPxKjfAwfVKJObnuHdKvwNTr5KwZlZcVncJxE4+BOfsvY
         yQnBPuXTQu0BhLkU4EJY+cbRffTFerghKdHbR2ju3ur2P8pFpgLCX6cWT85G1mEVIsKt
         ADTYpRKk0tNLsyOB9wSuXt/vmqtd/0mNuKrkYZvzU2mmJCEobLA8Dqm/jnaRGcsN2MQg
         84kf5VkHprFeUpsnsHS5SgJ0kGMFBBJdnTQJNEaSn1DKX+9raKSt+oxR3u2lxhQxvjbG
         bb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749393; x=1773354193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mXxIK6LDCjXrbH47U3uBLKABcpuD9wr8eg7xN5cAq+M=;
        b=JvPeAur1or8lqx5IkwBnBWE4UrThsrHfpiAhtCvYnk2JLnwPL6FBUQNRSNi6WqUWAX
         G0XMV+CUU9XbvoyaZyL8J/Tlle5SbptvBklr97B/p2GIPCQj6EfEnb+X4hNfsQl5qWGP
         iX2dbl8hj+1Dnjhr+0lL6ErcYCJRQ1VgoAdSgvlOS6TvPGIbp+5ybfWdfuDr1Kw2ON2U
         aHRWGzHIsHwtKoeG1PaGFEhevhRcU/oatjiBwHHKSnzI+1IHg1hwQtBxLFjnmmqfwGp5
         22VTpiyWrDpuaLMrsQlfKeCqS9jBsDTjuEc3kIGNM8qTedhNZ1AlHHx9pueSlPQrl9Gh
         xNHw==
X-Forwarded-Encrypted: i=1; AJvYcCWF4L37FPEd8WTprtRbeX0fqv8aP9X8wsOaVUZ03zDJ+Uh6+AtjKoc6A7qxiV8RIwvlgdv9onGomUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG8ilBOwR/Hu3+nTLqV+gj7Sk6vP47irqYfTDZTI1CrLpaC9oR
	KWazsfKYel8fZ1WMlkHZ9uS+yVR4Y9LrU7jQinFFxZVspFiEVsHXkBnP
X-Gm-Gg: ATEYQzyjF3gjtAbI0vFG/ZorOSaRCISHKwWFeV3o0gaHvDIK+Mm4kGkC9itaRi0bPtF
	kftElvPmSTgNm1T7z8dg0kZ9CF2MO3r+YT/3Z6Nif+wwcmGJvSwl97uqGrqJlz39yDg0vuzdqTp
	96r5EWrjTrSGAN6lx4vREmjoKth3/ElWazW9gBnk4yoJIrkmET31FWeGSjE4eIiHeZQtrS1Ag5s
	FsR2LK1pFcLqlIX2HOAZtlc2T85VzjkoZ60S198fUDgZrji9nj7GJv/v3ItdhBADi4AEcgrpWQq
	aYW78O5zP5tetpmWCmjW7rBVaqyWpE15tYclFwz6oHDhCCq/Pvdj491+d/pQqM5ndkA3LnoWE8w
	dMFiDrGUwOJsqVExBU9rItPOUCQlon/KQDrVzf7fnwoUUqi97NPnHlAJn00HJOFxJWUyW40y709
	esJGOe1hfsnYhaUmLW5/GoXhaztZBlnxeD
X-Received: by 2002:a05:6402:3596:b0:65c:5def:26f2 with SMTP id 4fb4d7f45d1cf-66143b1689amr2399113a12.11.1772749393199;
        Thu, 05 Mar 2026 14:23:13 -0800 (PST)
Received: from foxbook (bfj19.neoplus.adsl.tpnet.pl. [83.28.47.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660a96af982sm3374862a12.26.2026.03.05.14.23.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 05 Mar 2026 14:23:12 -0800 (PST)
Date: Thu, 5 Mar 2026 23:23:09 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com, Thinh.Nguyen@synopsys.com
Subject: Re: [RFC PATCH 07/12] usb: xhci: split core allocation and
 initialization
Message-ID: <20260305232309.7fb3734c.michal.pecio@gmail.com>
In-Reply-To: <20260305144824.3264408-8-niklas.neronin@linux.intel.com>
References: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
	<20260305144824.3264408-8-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9A99A218E49
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34126-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

On Thu,  5 Mar 2026 15:48:19 +0100, Niklas Neronin wrote:
> Separate allocation and initialization in the xHCI core:
> * xhci_mem_init() now only handles memory allocation.
> * xhci_init() now only handles initialization.
> 
> This split allows xhci_init() to be reused when resuming from S4
> suspend-to-disk.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci.c | 37 +++++++++++++------------------------
>  1 file changed, 13 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 338e93f39937..0c2239b5b805 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -536,23 +536,9 @@ static void xhci_set_dev_notifications(struct xhci_hcd *xhci)
>  	writel(dev_notf, &xhci->op_regs->dev_notification);
>  }
>  
> -/*
> - * Initialize memory for HCD and xHC (one-time init).
> - *
> - * Program the PAGESIZE register, initialize the device context array, create
> - * device contexts (?), set up a command ring segment (or two?), create event
> - * ring (one for now).
> - */

OK, the old comment is no longer relevant, but maybe add a new one?
/* Setup basic xHCI registers after HC reset */ or something like that.

> -static int xhci_init(struct usb_hcd *hcd)
> +static void xhci_init(struct usb_hcd *hcd)
>  {
>  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> -	int retval;
> -
> -	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
> -
> -	retval = xhci_mem_init(xhci, GFP_KERNEL);
> -	if (retval)
> -		return retval;
>  
>  	/* Set the Number of Device Slots Enabled to the maximum supported value */
>  	xhci_enable_max_dev_slots(xhci);
> @@ -587,9 +573,6 @@ static int xhci_init(struct usb_hcd *hcd)
>  		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
>  		compliance_mode_recovery_timer_init(xhci);
>  	}
> -
> -	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Finished %s", __func__);
> -	return 0;
>  }
>  
>  /*-------------------------------------------------------------------------*/
> @@ -1187,11 +1170,14 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  		 * first with the primary HCD, and then with the secondary HCD.
>  		 * If we don't do the same, the host will never be started.
>  		 */
> -		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
> -		retval = xhci_init(hcd);
> +		xhci_dbg(xhci, "Allocate the xhci_hcd\n");
> +		retval = xhci_mem_init(xhci, GFP_KERNEL);

xhci_hcd is allocated, now we allocate everything else :)

I would move those xhci_dbg() inside xhci_mem_init() and xhci_init()
instead of replicating them at every call site. If they are neeeded.

>  		if (retval)
>  			return retval;
>  
> +		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
> +		xhci_init(hcd);
> +
>  		xhci_dbg(xhci, "Start the primary HCD\n");
>  		retval = xhci_run(hcd);
>  		if (!retval && xhci->shared_hcd) {
> @@ -5523,12 +5509,15 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>  
>  	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
>  
> -	xhci_dbg(xhci, "Calling HCD init\n");
> -	/* Initialize HCD and host controller data structures. */
> -	retval = xhci_init(hcd);
> +	xhci_dbg(xhci, "Allocate the xhci_hcd\n");
> +	/* Allocate xHCI data structures */
> +	retval = xhci_mem_init(xhci, GFP_KERNEL);
>  	if (retval)
>  		return retval;
> -	xhci_dbg(xhci, "Called HCD init\n");
> +
> +	xhci_dbg(xhci, "Initialize the xhci_hcd\n");
> +	/* Initialize HCD and host controller data structures */
> +	xhci_init(hcd);
>  
>  	if (xhci_hcd_is_usb3(hcd))
>  		xhci_hcd_init_usb3_data(xhci, hcd);
> -- 
> 2.50.1
> 

