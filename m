Return-Path: <linux-usb+bounces-37808-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNDpNgExDmrj7wUAu9opvQ
	(envelope-from <linux-usb+bounces-37808-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 00:09:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D7159BC84
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 00:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BF88301C92A
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 22:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6143BAD92;
	Wed, 20 May 2026 22:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQEbojIv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141DF35AC01
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 22:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314938; cv=none; b=FS+EhXKdAROha6ItGRBtlxtkAEuPPSSBtmoodgbsIZ+TzeG7T3xoi9az/XPG4wOI6hd4w/0d5YeETTj2ZADWTJd3LYmmhlpUII44Rhsx1RjbkDKm+lC6UYMaTt8i8HKUL/d+k+6/CdXz9edklMJqwni1MiyvOu2cq6yWty32aTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314938; c=relaxed/simple;
	bh=To1/Y92yUpauKoVfsnuSOUNF9V2XmtW1GFWPU+8Nbx0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFxL8cuPraDPT6L1CsKPv74QlHxoMqKeB6TRPLG4tScpCAmO+jlzvORHndp6am67An4zs+RCVJe2qD+VkimwqeD7E5TTCIpUafGuCfpBaWunCKGeSMbRuP0lC4WTJMwZzvAD2XBj19iV67B9SYRthbjRvTSi4zXgsKtXMdR3WCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQEbojIv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so35843455e9.1
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 15:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779314934; x=1779919734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB8Qs3mhw8ib66lsF/0B5lxpOV4wsvQJODp7uB/3aFQ=;
        b=sQEbojIvLzpENbWVCmuVNIbbtrFskuNUTOVPVuN+ON/M28T58PI6kkQ3NUNdeBx2NC
         nbZud/BSIAyy1/WZP4v6mcqmH7cBeSjLhL+Pf4Q+dVrzqKUALl8fZIORlbrye89OXG3U
         YRzhbnfTxOAmSg15q1dRl3hkZpkjcYTrQSSJyJPbjuaMe/9bK+0TXaDRpi1GWXMday08
         yq1t8m0VlBcn7+j7656oMcSuGJQa5lGLw1PFqkklwefm1uISAGbMz/X5Ll10+PZBsS7l
         9dC/YR+fwPQ8msfWZZ2QM7zipDNnc0k3rcyTD3qJ7vrwDJelfBH9FvOOmCv5xa7KTqs2
         Bppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779314934; x=1779919734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AB8Qs3mhw8ib66lsF/0B5lxpOV4wsvQJODp7uB/3aFQ=;
        b=ePxznDUp9i4xA4OYY85+8w3HqboJdLTDChLIo/R5Bjou2v1FnMCNNEoVxPemDc4u7B
         cS6OTM0+kAartFuAZZQsOpgvAKNFqLvBClRdckc9G8XpweCtR9SVS/Vqd6QcxcZW9334
         9RZ35A7QmyJH2S06/ZEm8J36YEZTGltPOAZloSzz5MNnh0AG/SBI4jQNRflPV+E3+AUW
         MCa7A+q9WAhIMasnJipsWqhrIsxbQXm9YV+8egpRY9ZYITZtJFY5wAn/yjqnF1fyb6xU
         2aCN3dGRDyC6v8bJ8lQHIEKotqv5tw+rVUfUDqmyWsF4OnBp8/dddyFD8caIh+xxHpqU
         ms8g==
X-Forwarded-Encrypted: i=1; AFNElJ8GtUTL9HnVaqD+mScVEDDP/lOkNcAc+R4KJ1sUYXKpFA7ohSxruqWDBQSgIqTPTZpMvnzlKkrBdZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN0D7PkdYdchzvfeL+uG92/J5w8tNpy4NwFNYP8Ihjgr3Mdtk0
	0dHsj/L20N7el0RBr23ypMu5rHJxQbMwWHvahQq+KUASxmHuwslyTAJLtSxYig==
X-Gm-Gg: Acq92OHdtJieBj+xmIMp//J0GOKcsX/STN94603KvTNhQ54j+CgaliPul+6/sBoMzme
	JcpSOvKBSAjA3U/2nhpGqTK7lZF5nYlAP0mdof+NZ9ZBTt9VJoqGztE6VLesRdjJxDQXTIX0u67
	/Y2VxjWKnNOSVPObF6vh9b88OKuar/wWlI0WLpghrGzepuBX6QZQz4tUz5iDSYo64RQvpUCtqbq
	+O0sV6JW3vV2z4liybXgxPhUU++qMAMR1NyQO7yQ7XDUOMzVoPfXNtArMmFl9f7Rln71q1c+FBc
	8+kt/7aYc6qx6ujlB6I7cCzFwzrvoA3Xc6AdSR90moh04++NvSCMA1/1sGe5bOzP4PQi6ZZmwQ6
	Ectu4x3u219vV1nUqiBbJXWf6kLN6XkcQyg0FjipUly6zpzkvYsYPT1X0l/IdhJDaQy6/O62hc3
	erfl/fvXO8IiXahCl9198938odiT5hqDh1
X-Received: by 2002:a05:600c:8b77:b0:48e:82af:d9 with SMTP id 5b1f17b1804b1-490360bbdf9mr2304225e9.29.1779314933962;
        Wed, 20 May 2026 15:08:53 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d52c8bsm21436945e9.8.2026.05.20.15.08.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 20 May 2026 15:08:52 -0700 (PDT)
Date: Thu, 21 May 2026 00:08:48 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: xhci: allocate internal DCBAA mirror
 dynamically
Message-ID: <20260521000848.05cce0dd.michal.pecio@gmail.com>
In-Reply-To: <20260507083945.959370-4-niklas.neronin@linux.intel.com>
References: <20260507083945.959370-1-niklas.neronin@linux.intel.com>
	<20260507083945.959370-4-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37808-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 59D7159BC84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu,  7 May 2026 10:39:45 +0200, Niklas Neronin wrote:
> Allocate the internal virtual device array dynamically based on the
> maximum number of slots reported by the host controller. Previously,
> the array was always allocated to the absolute maximum of 255 entries.
> 
> Repurpose the 'MAX_HC_SLOTS' macro to limit the number of enabled slots.
> This mirrors how the maximum number of ports and interrupters are handled.
> 
> The allocation now uses kcalloc_node(), which zeroes the memory
> automatically, making the explicit memset() call unnecessary.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

Hi,

The series looks alright, but a few small comments below:

> ---
>  drivers/usb/host/xhci-mem.c | 14 ++++++++++++--
>  drivers/usb/host/xhci.c     |  4 +---
>  drivers/usb/host/xhci.h     |  9 ++++++---
>  3 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index ac915dacd886..1effc9f08678 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1953,8 +1953,11 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed command ring");
>  	xhci_cleanup_command_queue(xhci);
>  
> -	for (i = xhci->max_slots; i > 0; i--)
> -		xhci_free_virt_devices_depth_first(xhci, i);
> +	if (xhci->devs) {
> +		for (i = xhci->max_slots; i > 0; i--)
> +			xhci_free_virt_devices_depth_first(xhci, i);
> +		kfree(xhci->devs);
> +	}
>  
>  	dma_pool_destroy(xhci->segment_pool);
>  	xhci->segment_pool = NULL;
> @@ -2011,6 +2014,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>  	xhci->rh_bw = NULL;
>  	xhci->port_caps = NULL;
>  	xhci->interrupters = NULL;
> +	xhci->devs = NULL;
>  
>  	xhci->usb2_rhub.bus_state.bus_suspended = 0;
>  	xhci->usb3_rhub.bus_state.bus_suspended = 0;
> @@ -2417,6 +2421,12 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>  
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
>  
> +	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating internal virtual device array");

I don't think this is useful in any way. One look at the code makes it
clear that this is going to happen each time this function is called.

> +	xhci->devs = kcalloc_node(xhci->max_slots + 1, sizeof(*xhci->devs), flags,
> +				  dev_to_node(dev));
> +	if (!xhci->devs)
> +		goto fail;
> +
>  	xhci->dcbaa.ctx_array =
>  		dma_alloc_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), xhci->max_slots + 1),
>  				   &dcbaa->dma, flags);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 9a471bd72265..151a759806f8 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -5460,7 +5460,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>  	if (xhci->hci_version > 0x100)
>  		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
>  
> -	xhci->max_slots = HCS_MAX_SLOTS(hcs_params1);
> +	xhci->max_slots = min(HCS_MAX_SLOTS(hcs_params1), MAX_HC_SLOTS);

HCSPARAMS1.MaxSlots is 8 bits wide, so it will never exceed 255.
There is no need to add this check.

And the macro seems to porperly mask out excess bits picked up from
other fields, so no worries about that either. And if it didn't, it
should be fixed instead of (wrongly) assuming 255 slots.

>  	xhci->max_ports = min(HCS_MAX_PORTS(hcs_params1), MAX_HC_PORTS);
>  	/* xhci-plat or xhci-pci might have set max_interrupters already */
>  	if (!xhci->max_interrupters)
> @@ -5533,8 +5533,6 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>  	init_completion(&xhci->cmd_ring_stop_completion);
>  	xhci_hcd_page_size(xhci);
>  
> -	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
> -
>  	/* Allocate xHCI data structures */
>  	retval = xhci_mem_init(xhci, GFP_KERNEL);
>  	if (retval)
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index b467b875eeba..f977c8e6a90a 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -33,8 +33,11 @@
>  /* xHCI PCI Configuration Registers */
>  #define XHCI_SBRN_OFFSET	(0x60)
>  
> -/* Max number of USB devices for any host controller - limit in section 6.1 */
> -#define MAX_HC_SLOTS		256
> +/*
> + * Max number of Devices Slots. xHCI specification section 5.3.3
> + * Valid values are in the range of 1 to 255.
> + */
> +#define MAX_HC_SLOTS		255

Then if there are no other uses, this constant can simply be removed.

>  /*
>   * Max Number of Ports. xHCI specification section 5.3.3
>   * Valid values are in the range of 1 to 255.
> @@ -1552,7 +1555,7 @@ struct xhci_hcd {
>  	/* these are not thread safe so use mutex */
>  	struct mutex mutex;
>  	/* Internal mirror of the HW's dcbaa */
> -	struct xhci_virt_device	*devs[MAX_HC_SLOTS];
> +	struct xhci_virt_device	**devs;
>  	/* For keeping track of bandwidth domains per roothub. */
>  	struct xhci_root_port_bw_info	*rh_bw;
>  
> -- 
> 2.50.1
> 

