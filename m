Return-Path: <linux-usb+bounces-34140-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OChRKx59qmkqSQEAu9opvQ
	(envelope-from <linux-usb+bounces-34140-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 08:07:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A21821C472
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 08:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06F6C3043BF9
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 07:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DD737269B;
	Fri,  6 Mar 2026 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIWtLu79"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C2B2D7DDB
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780741; cv=none; b=lnKRBppdHlGq7yim6YhMDhXXhXkFWsn05ZFbx6lbGEzDCraBFWl07ZRShp5UxavdDeMAA4VJC2fSQplrKolJ8dxNSr4in1U9a5seNB+IbtUhcjHJLCAqdBc6hh4n3lRE/vrUeDJ93xUeRBf4YjqRYqz6AuFeSX8rlLJLaHRALkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780741; c=relaxed/simple;
	bh=DkTLSq17L6ZdkQOajAl1Sx+Bs9pd146SBc2k8tvv9gI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qSV63MKPG7OcPD8GtkWa6WMByYXfW25SRME+UfhG417ndhw/bwyXaUwQsAFo5kxHH0ssG/NqOJCWk+V3zL1gb6AH1C3hDORxH39Z9BI9+O23oZe8WLUjSpnQ5TS5MYWpwZDI3jnpH7a+C5ahiZ3Ka0PnYYvmYE0+WI+jxyEqwhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIWtLu79; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b93718302beso316880166b.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 23:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772780738; x=1773385538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWm624vxD2IKzZRfzZLtD6+D30BV7zqB+ioGaMp2ic4=;
        b=VIWtLu79A3/yXW2PCvDYs/fv5+aKekeAkEEBUwBrs8xyP+oPRPVTp3pQXGH+/ZOvpG
         kvRlkPL4pcihwbPrlsIVUjZ4dmny9KnvUVvZgICnLz49W5wFDTElMCS9DwXr5nxmbhJB
         063Dx9iNyXERXqqt7TbCvcFnF5DvmXRco8TAf/377HDEkSW5rIhBs1O2raKdR6Y0ZUqZ
         qIuX9Kj7C9wWzf6POyKxEyKs1Vnr4FmAar4q7tCIb9b7jscWYgqJmTL3zQOBYvShV/WM
         BsAHHal+ioIsfvSzrhE2ZrPjZ1KwGLLWofIVBz5kNj8h1xcukuy70+IOcg+PIzIssdff
         xnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780738; x=1773385538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xWm624vxD2IKzZRfzZLtD6+D30BV7zqB+ioGaMp2ic4=;
        b=hNTRjs/cTyrfvcPsOn+HXlpDCzZsOH1M0rZxntBA78Hc9G90Zk/2u2HX9JwZXkp5SC
         1b+EDGnmxeWfGk3BA69UGQvU8PglCcqDXfn8V34FyOAo4aP4nx5QVljgjSB/FMHpanrf
         WqsV+PsC53uMyeWLVMZmt7iuMLQHl9LvF2GuXmZoP5zUZKed2lmUKUdnL8hoxQfiFzVC
         uGJySgZfVFivJvu6CrJcFGDtQ2nOxSFuL5acd0tTrRgWnLtWmGTMh9Xn6LrYHYwR2m/Q
         yYpG8zIEVB0vGYrLPXWwKSWpGjwm0GoszPe7nzpL/rcRXjN8mbCd8rGPE1d6XF5VlDI8
         Ttiw==
X-Forwarded-Encrypted: i=1; AJvYcCVzNh425OullHT9wifAIgfU0u6G5s3SLmY9tX6zDSoiX35KDNjoA94lRxIN0paCQTI538F2VPFv8uE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFi8egWA7sYF4oWuwbPhdOqJ3CwwPJO2vMFe3RQjTPhrOaClyP
	4SNxJ1kwtdu73Vv+R0Jm0r2pHSfmpbWPDtIxzOctS1OOKmP7OrQiYFrq
X-Gm-Gg: ATEYQzzVWzvP96MXj2UabJDW9hL2CNymRuA9wweT50zzK13FH9r7FnHsY7kX6tE5RdT
	7LAcEv7iaRvfEv/M599xtowSjk5dMqcisv9GoL6hrRQtHmOGV8sEf8mtiih93JjWuErs+jR0uW/
	KpHPEiH+LnVWT+HOwy5HijfM/3k7dU0uVkTNgSvlzWQE1d1XZ9UxoGk5BCIOWVCM72FnWn2qInZ
	DMvQtiBTSVqundlfmrLoD9jsZAS/Mo9kjFMM4BXqk/TaijOL900z79Ltjz7cEITLFlaJv7o311A
	EYZ7sJdZcLSeOCHOm1e9NFLk/MOyTZUDR8l82uhKyZu8lb9vMtkKV7djm5bxpAw0BJ/6fEjW1XH
	mlQZgU2btrrjBO9Re3VgzAxHMc+Npaczc2+g5Hcfh3c3nz+SQGagnb4RjQjEA+KVDHGxIyOG3sT
	6acMWwfPj4Jbnu5VUJcQ/oI5rZI5+pervD
X-Received: by 2002:a17:907:6092:b0:b94:1644:3846 with SMTP id a640c23a62f3a-b942dfa0473mr61619466b.43.1772780737265;
        Thu, 05 Mar 2026 23:05:37 -0800 (PST)
Received: from foxbook (bfj19.neoplus.adsl.tpnet.pl. [83.28.47.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f139e0dsm30155566b.41.2026.03.05.23.05.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 05 Mar 2026 23:05:37 -0800 (PST)
Date: Fri, 6 Mar 2026 08:05:33 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com, Thinh.Nguyen@synopsys.com
Subject: Re: [RFC PATCH 09/12] usb: xhci: optimize resuming from S4
 (suspend-to-RAM)
Message-ID: <20260306080533.0f7eef36.michal.pecio@gmail.com>
In-Reply-To: <20260305144824.3264408-10-niklas.neronin@linux.intel.com>
References: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
	<20260305144824.3264408-10-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0A21821C472
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34140-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Action: no action

In the subject, I think you meant S4 (suspend to *disk*).

On Thu,  5 Mar 2026 15:48:21 +0100, Niklas Neronin wrote:
> On resume from S4 (power loss after suspend/hibernation), the xHCI
> driver previously freed, reallocated, and fully reinitialized all
> data structures.

Actually, I don't understand this logic. Isn't it the case that:
- the Core Power Well always loses power in S3, S4 and S5
- the AUX Power Well usually keeps power in S3, S4 and S5, although it
  may also lose it in either state (in S3: weird/broken HW, FW bug)

So it seems that the driver should explicitly inspect root hub state
instead of guessing based on sleep level?

> Most of this is unnecessary because the data is restored from a saved
> image; only the xHCI registers lose their values.

Well, it was a simple way to guarantee that all driver data really are
at their defaults. So no stale entries on xhci->cmd_list, for example.

> This patch optimizes S4 resume by performing only a host controller
> reset, which includes:
> * Freeing or clearing runtime-created data.
> * Rewriting xHCI registers.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-mem.c |  2 +-
>  drivers/usb/host/xhci.c     | 46 +++++++++++++++++++------------------
>  drivers/usb/host/xhci.h     |  1 +
>  3 files changed, 26 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index fae75969e49a..46d977f9e5c5 100644
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
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index b22f10cfbe7b..e03f717d2314 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1075,9 +1075,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
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
> @@ -1096,10 +1098,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
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
>  		/*
>  		 * Some controllers might lose power during suspend, so wait
>  		 * for controller not ready bit to clear, just as in xHC init.
> @@ -1137,11 +1140,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
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
> @@ -1165,28 +1168,27 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  		if (retval)
>  			return retval;
>  
> -		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
> -		writel(STS_EINT, &xhci->op_regs->status);
> -		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
> +		/* Clear data which is re-initilized during runtime */
> +		xhci_for_each_ring_seg(xhci->interrupters[0]->event_ring->first_seg, seg)
> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
> +
> +		for (int i = xhci->max_ports; i > 0; i--)
> +			xhci_free_virt_devices_depth_first(xhci, i);
> +
> +		xhci->cmd_ring_reserved_trbs = 0;
> +		xhci_for_each_ring_seg(xhci->cmd_ring->first_seg, seg)
> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
>  
> -		xhci_dbg(xhci, "cleaning up memory\n");
> -		xhci_mem_cleanup(xhci);
>  		xhci_debugfs_exit(xhci);
> -		xhci_dbg(xhci, "xhci_stop completed - status = %x\n",
> -			    readl(&xhci->op_regs->status));
>  
> -		/* USB core calls the PCI reinit and start functions twice:
> +		xhci_dbg(xhci, "Re-initializing xHCI registers\n");
> +		xhci_init(hcd);
> +
> +		/*
> +		 * USB core calls the PCI reinit and start functions twice:
>  		 * first with the primary HCD, and then with the secondary HCD.
>  		 * If we don't do the same, the host will never be started.
>  		 */
> -		xhci_dbg(xhci, "Allocate the xhci_hcd\n");
> -		retval = xhci_mem_init(xhci, GFP_KERNEL);
> -		if (retval)
> -			return retval;
> -
> -		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
> -		xhci_init(hcd);
> -
>  		xhci_dbg(xhci, "Start the primary HCD\n");
>  		retval = xhci_run(hcd);
>  		if (!retval && xhci->shared_hcd) {
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index ade0198bf9ea..e6a51f1318c2 100644
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
> -- 
> 2.50.1
> 

