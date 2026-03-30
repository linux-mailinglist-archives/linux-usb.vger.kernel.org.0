Return-Path: <linux-usb+bounces-35653-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANw0Dc5HymkQ7QUAu9opvQ
	(envelope-from <linux-usb+bounces-35653-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:52:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AC935895E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57E893073D8C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DBC3B774E;
	Mon, 30 Mar 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEihBIF0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67303B6C07
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 09:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863919; cv=none; b=F/FwoFqQw7na1Y+X/WCc6aJka3ZLwDmGAKFEaVCSv/BSir+gCryYhZAiNjJn74g14zMfbudWJCnK0Li2RORn9z79RN1wKSRWmOIWsoq4n/QKWA3GWfRa65Xi2AgDcIx9GfhZZUCTQgWoubzGeFvS8zpcXhS6Lki21FKcRsK1hrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863919; c=relaxed/simple;
	bh=XD6SmwPmwVE7azTszrrUQuUWr7GMIaYgN9QzNUYC+is=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zxdy/kzxzZfCQjpfwSd2jGDOMbFbT9BQo/+JyNwrfFrUf7Jbot2bSIJ7S3qjtSh3hMxKs5wC2UoXzmdXWoW36LjgXVGa2yELEoycW0lXyi9k44pn9DiQ4rhby9DTWTN9JgfsjPmgRJjyjSyrESG2XXHRINOD3daZQzUWYqXUyA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEihBIF0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b97e6e48b24so726102766b.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 02:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863916; x=1775468716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSBHQ9W/Y7iY/BjNQLcvfZuKZKaBhaRsM3fB8kd4w9U=;
        b=rEihBIF0TXGaURZqymCfvRcVeuXcjwSqZotgBMZHB92oNr+hqKqd32hL0H5DUTLl/Y
         t3G/wuFQxFvwgKXyClvNpVLw4QeMubIpnGBEWUSP1mpOY/gvqldcbk/iobMj/6ebjPwt
         Nt9KjdQ87az23Qt7NooAkio1yQRIH8HMg1jhnLJ1x13wwnM/lBYkBfEkJ+5ssPrl07UU
         fiayKD0YIwrCM9vTXy1j1R899fazASPnit444NWgJJijHTNkRtcpGAcBV/ivSxRwe6Ah
         YxJ78XNAbE5mBFFzZ5cbZz0HIPAaHQicqzKBNP421ZfhCZWSedJwX8OTXDPQdOZOGGHb
         mWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863916; x=1775468716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSBHQ9W/Y7iY/BjNQLcvfZuKZKaBhaRsM3fB8kd4w9U=;
        b=NwnLFLLY4njkC4x8Z8z+e+DRx5PNpqtqa5IwH3/R5DMX9R0gNH8E5wpsDFoEPo4BDA
         fysDZM50yjCsRS9KxfLMnRNhWTzRTs/oC8tTAKJ8HV5XIOstItrFhJwFTZl6vxSU+t0L
         qLBEOqF2mRXfIvBqLvVrY3nR4eGMt2PoDi9r7wo0me86QHAsqSMQ4ZT1drChHRAyIPaD
         7BOdkfoX7Wbz0sp9kzACoXnei2KynyndUODUIHLfxZvmPcFK29TiJnmRtlwDHTHOu6X+
         Jq1ICU9eCuWddatNlGSH/E702YGOeykTocV8pvXshgOtOo2mDhRUKlhZCOHV9jCZ7UZF
         rbZA==
X-Forwarded-Encrypted: i=1; AJvYcCVVj9CTdXb9subLg9EN3w3RdEJGI8ET0xlqv3J1OAUol7fl1OtZBlsUIUDVFkzHoFulCh74X3Q1tq4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5gQSN/XcKoUIH4jS1jSDynfFrh6u2bFyQBJAU/fD02KxAFs76
	5rPY4/akOYEx2HVOARwfhie6EYSsRKuSQ1+ZHvoQpD9XZ98ZkMtjDRMh
X-Gm-Gg: ATEYQzyHJVE58md7jTu6bhxrs49WnfrndYjxM+zTsXKXNJvJJjbawBQ828vsuZiBskq
	jthwh87Vd3v2v2jbc2/8cyXMeFHBZ3vcYbCwmKuJp1hw/6jAGOx0zWrOTM+gku0pXeZ9e73AL1f
	07MWQiyhYvm4baPBUAmBO4aVw1t1CjW9wMtaXNVPjEZPeTXnkXhsHsiBCmxr0W5uS6ySsQoTPyS
	y5fzaYSACaM/Fyu+HIqaYaSsUVi9n1f4ow7O5MgHz+Eo6m2VWiuVa1T0GEBb+/6RqQUKP3aW3Rh
	Aii9mHsctV6zXHYk+CiZaub7C07LfCyq1cnAEa5iKYagnfnwlXceKJ1JRrOWuP5kcq8tN5Od5oe
	so7Iq/jZ/oia9vuZ7TaUnakRrB46ssun2whpsl6ioBV6RIUEmeVP53gJ+8umLk8fgQDNXRba75h
	deT/QEiair4r5ft/22J+z41m3jb1ynEXD6
X-Received: by 2002:a17:907:934b:b0:b97:b210:a91a with SMTP id a640c23a62f3a-b9b503516f2mr701972166b.13.1774863915879;
        Mon, 30 Mar 2026 02:45:15 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a6736sm274478966b.38.2026.03.30.02.45.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 30 Mar 2026 02:45:15 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:45:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
Subject: Re: [PATCH 9/9] usb: xhci: optimize resuming from S4
 (suspend-to-disk)
Message-ID: <20260330114510.2b1e5f05.michal.pecio@gmail.com>
In-Reply-To: <20260327123441.806564-10-niklas.neronin@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
	<20260327123441.806564-10-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35653-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: B2AC935895E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 13:34:40 +0100, Niklas Neronin wrote:
> On resume from S4 (power loss after suspend/hibernation), the xHCI
> driver previously freed, reallocated, and fully reinitialized all
> data structures. Most of this is unnecessary because the data is
> restored from a saved image; only the xHCI registers lose their
> values.

... and all runtime information must be wiped from data structures.
That's the tricky part here.

> 
> This patch optimizes S4 resume by performing only a host controller
> reset, which includes:
> * Freeing or clearing runtime-created data.
> * Rewriting xHCI registers.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-mem.c |  4 +--
>  drivers/usb/host/xhci.c     | 53 ++++++++++++++++++++++---------------
>  drivers/usb/host/xhci.h     |  2 ++
>  3 files changed, 35 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index f1b4f06d4b8b..4156822eb000 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -936,7 +936,7 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
>   * that tt_info, then free the child first. Recursive.
>   * We can't rely on udev at this point to find child-parent relationships.
>   */
> -static void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id)
> +void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id)
>  {
>  	struct xhci_virt_device *vdev;
>  	struct list_head *tt_list_head;
> @@ -1905,7 +1905,7 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
>  EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
>  
>  /* Cleanup roothub bandwidth data */
> -static void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
> +void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
>  {
>  	struct xhci_root_port_bw_info *rh_bw;
>  	struct xhci_tt_bw_info *tt_info, *tt_next;
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 232e6143ac4b..8fb2b91fc0cc 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1082,9 +1082,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  {
>  	u32			command, temp = 0;
>  	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
> +	struct xhci_segment	*seg;
>  	int			retval = 0;
>  	bool			pending_portevent = false;
>  	bool			suspended_usb3_devs = false;
> +	bool			reset_registers = false;
>  
>  	if (!hcd->state)
>  		return 0;
> @@ -1103,10 +1105,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  
>  	spin_lock_irq(&xhci->lock);
>  
> -	if (xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend)
> -		power_lost = true;
> -
> -	if (!power_lost) {
> +	if (power_lost || xhci->broken_suspend || xhci->quirks & XHCI_RESET_ON_RESUME) {
> +		xhci_dbg(xhci, "HC state lost, performing host controller reset\n");
> +		reset_registers = true;
> +	} else {
> +		xhci_dbg(xhci, "HC state intact, continuing without reset\n");

Maybe not a bad idea to log this function, but it could simply print
the value of reset_registers instead of two separate xhci_dbg().
And maybe also print power_lost and broken_suspend separately.

>  		/*
>  		 * Some controllers might lose power during suspend, so wait
>  		 * for controller not ready bit to clear, just as in xHC init.
> @@ -1144,11 +1147,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  		temp = readl(&xhci->op_regs->status);
>  		if ((temp & (STS_SRE | STS_HCE)) && !(xhci->xhc_state & XHCI_STATE_REMOVING)) {
>  			xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
> -			power_lost = true;
> +			reset_registers = true;
>  		}
>  	}
>  
> -	if (power_lost) {
> +	if (reset_registers) {
>  		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
>  				!(xhci_all_ports_seen_u0(xhci))) {
>  			timer_delete_sync(&xhci->comp_mode_recovery_timer);
> @@ -1172,27 +1175,33 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  		if (retval)
>  			return retval;

It's suspicious that xhci_halt() is called earlier without checking
retval. If it fails then xhci_reset() returns success and this check
passes and it seems that nothing good will happen.

No sure if the HC can be running here?

>  
> -		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
> -		temp = readl(&xhci->op_regs->status);
> -		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
> -		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
> +		cancel_delayed_work_sync(&xhci->cmd_timer);
> +
> +		/* Delete all remaining commands */
> +		xhci_cleanup_command_queue(xhci);

Considering that xhci_suspend() clears the command ring anyway, it
could probably do this too so we don't need to. 

BTW, debugfs/port_bandwidth interface queues commands and I'm not sure
if it's synchronized in any way with power management. IOW, it might be 
possible that command are pending at suspend, but I'm not sure.

> +
> +		/* Clear data which is re-initilized during runtime */
> +		xhci_for_each_ring_seg(xhci->interrupters[0]->event_ring->first_seg, seg)
> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
> +
> +		for (int i = xhci->max_slots; i > 0; i--)
> +			xhci_free_virt_devices_depth_first(xhci, i);

This loop is a bit ugly, it could be a function in xhci-mem.

> +
> +		xhci_rh_bw_cleanup(xhci);
> +
> +		xhci->cmd_ring_reserved_trbs = 0;
> +		xhci_for_each_ring_seg(xhci->cmd_ring->first_seg, seg)
> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);

This looks like a bug because it nukes link TRBs. I know that
xhci_init() will fix this up (unless somebody changes that without
updating here), but it looks confusing.

I think calling clear_command_ring() was clearer and less bug prone.

>  
> -		xhci_dbg(xhci, "cleaning up memory\n");
> -		xhci_mem_cleanup(xhci);
>  		xhci_debugfs_exit(xhci);

Interesting, it looks like there used to be a window of time when all
memory was freed but debugfs files still existed? Odd...

> -		xhci_dbg(xhci, "xhci_stop completed - status = %x\n",
> -			    readl(&xhci->op_regs->status));
> -
> -		/* USB core calls the PCI reinit and start functions twice:
> -		 * first with the primary HCD, and then with the secondary HCD.
> -		 * If we don't do the same, the host will never be started.
> -		 */
> -		retval = xhci_mem_init(xhci, GFP_KERNEL);
> -		if (retval)
> -			return retval;
>  
>  		xhci_init(hcd);
>  
> +		/*
> +		 * USB core calls the PCI reinit and start functions twice:
> +		 * first with the primary HCD, and then with the secondary HCD.
> +		 * If we don't do the same, the host will never be started.
> +		 */
>  		xhci_dbg(xhci, "Start the primary HCD\n");
>  		retval = xhci_run(hcd);
>  		if (!retval && xhci->shared_hcd) {
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index ade0198bf9ea..a76e183515b3 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1792,6 +1792,7 @@ void xhci_dbg_trace(struct xhci_hcd *xhci, void (*trace)(struct va_format *),
>  void xhci_mem_cleanup(struct xhci_hcd *xhci);
>  int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags);
>  void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev, int slot_id);
> +void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id);
>  int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id, struct usb_device *udev, gfp_t flags);
>  int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *udev);
>  void xhci_copy_ep0_dequeue_into_input_ctx(struct xhci_hcd *xhci,
> @@ -1803,6 +1804,7 @@ void xhci_update_tt_active_eps(struct xhci_hcd *xhci,
>  		struct xhci_virt_device *virt_dev,
>  		int old_active_eps);
>  void xhci_clear_endpoint_bw_info(struct xhci_bw_info *bw_info);
> +void xhci_rh_bw_cleanup(struct xhci_hcd *xhci);
>  void xhci_update_bw_info(struct xhci_hcd *xhci,
>  		struct xhci_container_ctx *in_ctx,
>  		struct xhci_input_control_ctx *ctrl_ctx,
> -- 
> 2.50.1
> 

