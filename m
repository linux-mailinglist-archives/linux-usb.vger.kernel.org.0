Return-Path: <linux-usb+bounces-34125-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VgA4H0YAqmm9JQEAu9opvQ
	(envelope-from <linux-usb+bounces-34125-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 23:14:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC2218D26
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 23:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E736C302BA41
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 22:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122353624AE;
	Thu,  5 Mar 2026 22:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNj2UIcu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A3F282F11
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 22:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772748865; cv=none; b=OtBJMlOES9G1QXqDbBxwWhP6gMY+puE/+W3/bhnoBWhC5D+KnUb8/PFyX2P7MKYTpx3GE8cUA7IQCA2yjOXNW4N9o1A8NEWuWCQuL4buxTILOWTWyKcUhQoorrqO3XpTKmjYCIQcuHwh1CWqEKX7AYRcy1DGWdx9KXF5rUNRnRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772748865; c=relaxed/simple;
	bh=BOj7k0jRIPdCCM2qvWW4UxtjEK1wOmgffd3+Fss+C04=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RPFNpKNLljBbcDY4FPp6VLZ1TxcC+8T5F9rpuMX7h/A2gIB18jFiZYPKyC3JgLBjFgFPyEnxd9kenMCQ08wn25l+aF/gY93uaY/xViw2MS2v/SN+eon+ZUsYQrczz6QvptgKJPJ7TdAOnJOJBmA3k3zyAlp8vxlKAe9zKQd0Tao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNj2UIcu; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b941bb3e23cso121494766b.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 14:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772748862; x=1773353662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okLTf7iTm6O+YKDsDLRKtlPefA1bPW8XtBPDLZm6YU8=;
        b=CNj2UIcupfrz6jkgxUEox01+B9dRjobNw7QAeU9I/C6MQwzYetNcNl7bsVuZCd6LPk
         v5PFzFG92bleUEFhBg7pQY54hg/xbtCjGRtZiZVzT5gBKrpM1cbvEuxciV0REQvVw1Xo
         uAQCTd/ni2QxSCW+6SYcTOaz6bFZSOdVvCcqQpo4Awn/xJUwIcrpDTXAYYoLILnNxe5J
         0vGzQAHyvYUIQYx5u+sjluoXZ4IWrLZQn3Ga9RAQZcv6PLtp3o4AgyHPSmvkJHr0DBbL
         TlV2c3WrAAtDbbusQZnTBE28NrWdnaG0HC89bxIBENN7WDTfYEiUXslDpRwXhfa6lJd6
         SUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772748862; x=1773353662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=okLTf7iTm6O+YKDsDLRKtlPefA1bPW8XtBPDLZm6YU8=;
        b=vfo3kH5fBgdSZ96UhSlsOocQGkxi2Ate6zWMqFA14OJT4UOWbs5q2arVDhk+ixJ6yh
         l/D4jG8JFNbahVdY1vv9IivOtvgczW5V95U+te8oUcWKbQ3NIsiarFrf+KSkutycWL5s
         +PyxhSJUS3HPS03d4dlkletZqSEQhRKkIgeClIglC0LIPDckmRn2AiadUJ5vZZTl9ev6
         ytlOhcuy5VLjque8PXUR4pCG1m+3lbQdOj8oRkpVekxcwbacPgmxdercZ3z+BumBaf3v
         wG2Qswve8JgNtw0wphTPyE6kR69m2raU0sCxRpdJSjIOccjn71uJrvCLJ6EBNXuggA7S
         JF4g==
X-Forwarded-Encrypted: i=1; AJvYcCWixuRLOJytTk87wx+vfr0NXzx6qVYkTKDrqqT/v1AxBu3p40KH36I5E0huhDM19xMdkZKAUsXD8EY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJPUkhH9nmF6Y+Us/0r8+1MOtap/OIWFNwa1imjVKg84mKvdRD
	za8/W5VZpu0B5iuuEE2/COqS/weWWZJzcPYt/IGryNrIj9kyXsPJv4t3
X-Gm-Gg: ATEYQzxYMGQax9uTgorRKGbpBUmkFyoHBD/kAiMVlBJkpE8/qF8pgQjD8TwveJ4qTRo
	uRxyTPdClL7gtMJUzJXCbUWZeagf+mJE8RdsZ0WiyXWwplgJswBsgmB7JrMHwDiqnpYGcz7gbCn
	qBewbEF7CrJ9TdDdXQ/g5SSdqp7aRF2Fkkr9lVkIKdrZ+W3VIrBfF3sHrwEBFXNXb7K7grFURaZ
	MkIzYNZ+ypJ8ckbWEQqCgYUgxEvPy8G19FKtnJfXiemHRwpp+yeDuocSdlEMxIaQAFbp42UR692
	8/Eh4YX4CVpkczrj887cSFd571vRFw90ODMpBVmJ7rtACBlI0FtCVSCE48qmVIghNdSauddCs5D
	aUCWqc9zQ1Ajc0SPkx/LQqIz6X6Q7sk6gZEjmJIOVVJ+DbULPogkJ+9fgMumiL9y08MuwRk0Sx6
	FzgA1JM0Qs5hpCarrGm0syQffI0soNWx9vYC7i2v+41Zw=
X-Received: by 2002:a17:906:9fc7:b0:b93:99a8:c366 with SMTP id a640c23a62f3a-b93f14f584cmr482070266b.55.1772748861527;
        Thu, 05 Mar 2026 14:14:21 -0800 (PST)
Received: from foxbook (bfj19.neoplus.adsl.tpnet.pl. [83.28.47.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae6131fsm958754266b.40.2026.03.05.14.14.20
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 05 Mar 2026 14:14:21 -0800 (PST)
Date: Thu, 5 Mar 2026 23:14:17 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com, Thinh.Nguyen@synopsys.com
Subject: Re: [RFC PATCH 06/12] usb: xhci: move initialization for lifetime
 objects
Message-ID: <20260305231417.4415aa36.michal.pecio@gmail.com>
In-Reply-To: <20260305144824.3264408-7-niklas.neronin@linux.intel.com>
References: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
	<20260305144824.3264408-7-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CBDC2218D26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34125-lists,linux-usb=lfdr.de];
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

On Thu,  5 Mar 2026 15:48:18 +0100, Niklas Neronin wrote:
> Initialize objects that exist for the lifetime of the driver only once,
> rather than repeatedly. These objects do not require re-initialization
> after events such as S4 (suspend-to-disk).
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-mem.c |  1 -
>  drivers/usb/host/xhci.c     | 15 ++++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 005b7bc1bfda..fae75969e49a 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2001,7 +2001,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>  	xhci->port_caps = NULL;
>  	xhci->interrupters = NULL;
>  
> -	xhci->page_size = 0;
>  	xhci->usb2_rhub.bus_state.bus_suspended = 0;
>  	xhci->usb3_rhub.bus_state.bus_suspended = 0;
>  }
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index d9519a9e9e17..338e93f39937 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -549,13 +549,6 @@ static int xhci_init(struct usb_hcd *hcd)
>  	int retval;
>  
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
> -	spin_lock_init(&xhci->lock);
> -
> -	INIT_LIST_HEAD(&xhci->cmd_list);

Can we prove that this list is empty?

If there is any leftover garbage there, INIT_LIST_HEAD simply leaks it.
Without it, the garbage stays on the list.

> -	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
> -	init_completion(&xhci->cmd_ring_stop_completion);
> -	xhci_hcd_page_size(xhci);
> -	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
>  
>  	retval = xhci_mem_init(xhci, GFP_KERNEL);
>  	if (retval)
> @@ -5522,6 +5515,14 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>  		dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
>  	}
>  
> +	spin_lock_init(&xhci->lock);
> +	INIT_LIST_HEAD(&xhci->cmd_list);
> +	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
> +	init_completion(&xhci->cmd_ring_stop_completion);
> +	xhci_hcd_page_size(xhci);
> +
> +	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
> +
>  	xhci_dbg(xhci, "Calling HCD init\n");
>  	/* Initialize HCD and host controller data structures. */
>  	retval = xhci_init(hcd);
> -- 
> 2.50.1
> 

