Return-Path: <linux-usb+bounces-32804-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOx0Iqi1eGlzsQEAu9opvQ
	(envelope-from <linux-usb+bounces-32804-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 13:55:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0219594899
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 13:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98E4C3019C81
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 12:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFB4355811;
	Tue, 27 Jan 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCrpgcFJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404983557F5
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518498; cv=none; b=JlbAgSKy9ygVBSUg+gH0bwOqUMBAmDriDA8PL2rnYzBzx3ujG9L/UpYg/vEiYEAXu3tzWV/SR1uSJWsiN/j/fmSjc/ruh0pxYcRvjPxM98j87rIwgh1qEPCPP9GMImN73imrKvlpq+KO7N5BzizKnjQVUHHgA5qgwSS3Bm/fY2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518498; c=relaxed/simple;
	bh=0ZfQOx548tyTsAkeF+LboTn7UQ+QlPsvrjl+FrEcG3M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cL2AhOj4yHHqnoGZ1PYXudEJfdgI48rVRwzqhy3wiYWupFix9c63W7WuFGoFTxmTueL9MA3UvwOl3Z26tPnLxK+PtAgCyURMQyEhUQqRIFfANlEimjU0Rka2wRaWM8YarYDN+puqY5pbrz2s5CZqDK/E/+QL+fESuJ5BiIHv7/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BCrpgcFJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769518496; x=1801054496;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=0ZfQOx548tyTsAkeF+LboTn7UQ+QlPsvrjl+FrEcG3M=;
  b=BCrpgcFJqXP1BVbtXsTNqjscvS4tCppLLJC7Da4HLAFV2e4TryHtpTHt
   qTvdKvbGAxztd9jJKa5OTr2y6sq0ow8C148fwKAsVK/SWVMvLlnsQKYBs
   4zgkR6JHPagaSXxx63xHJNzG3RJkZJVXjydlkmW0gnJ5GOgNAxwJVBz+R
   /X/klQjTSKA6axnJv2KgtIECBczSh8iv1BQ8R5MK1E+fKnZbRC6LXTzt7
   k80K1ux03b7CxDVVCAFFaA+sVrJKkDFm20cLpF+g5bMkZC2UMjd6DWTqm
   KV8D7Rt+flCZwxecKznIl3Pdi5+ztZUwYEbBiJl6+bVK4WsGxTlbJr57Q
   A==;
X-CSE-ConnectionGUID: PIi0Wv/7QiW9G7M3SzuycQ==
X-CSE-MsgGUID: K5UfHe9EQ/61WVm6UM/kmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81344506"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81344506"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:54:56 -0800
X-CSE-ConnectionGUID: 3cYjZb4rRB2Y+bpK+vUhYQ==
X-CSE-MsgGUID: cft6Srr3SlGgWKaBQYmaOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="245586135"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.250.130]) ([10.94.250.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:54:53 -0800
Message-ID: <bdc9d756-0f0e-46d9-ad3b-df8c3856636a@linux.intel.com>
Date: Tue, 27 Jan 2026 14:54:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH v11 1/2] usb: xhci: refactor IRQ/interrupter plumbing for
 multi-vector support
To: raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, kenny@panix.com, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com, michal.pecio@gmail.com, zhanjun@uniontech.com
References: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>
 <427F99629441CABE+20260127023843.2145548-1-raoxu@uniontech.com>
Content-Language: en-US
In-Reply-To: <427F99629441CABE+20260127023843.2145548-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-32804-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,uniontech.com:email]
X-Rspamd-Queue-Id: 0219594899
X-Rspamd-Action: no action



On 27/01/2026 4.38, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Prepare xHCI for multiple IRQ vectors/interrupters without changing the
> current behavior.
> 
> Introduce a per-vector irq context (hcd + intr_num) to use as request_irq()
> dev_id, and track the active vector count in xhci->irqs_enabled.  Use this
> single bound to enable/disable interrupters consistently across run/stop/
> resume and to sync/free IRQs.
> 
> Legacy IRQ fallback also keeps irqs_enabled >= 1 so interrupter 0 remains
> functional when MSI/MSI-X is unavailable.
> 
> No functional change intended: still uses interrupter 0 only.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> 
> ---
>  drivers/usb/host/xhci-mem.c  | 17 +++++++++++++++++
>  drivers/usb/host/xhci-pci.c  | 34 +++++++++++++++++++++++++---------
>  drivers/usb/host/xhci-ring.c |  9 +++++++--
>  drivers/usb/host/xhci.c      | 23 +++++++++++++----------
>  drivers/usb/host/xhci.h      | 16 +++++++++++++++-
>  5 files changed, 77 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index c708bdd69f16..524c58a149d3 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2402,6 +2402,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>  {
>  	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
>  	dma_addr_t	dma;
> +	unsigned int    i;
> 
>  	/*
>  	 * xHCI section 5.4.6 - Device Context array must be
> @@ -2495,6 +2496,22 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>  	if (!xhci->interrupters[0])
>  		goto fail;
> 
> +	/* Since only the main interrupt is used, secondary_irqs_alloc is set to 0. */
> +	xhci->secondary_irqs_alloc = 0;
> +
> +	/*
> +	 * Initialize all allocated interrupters here.
> +	 * Use allocated count as loop bound to avoid touching non-allocated
> +	 * or non-operational interrupters.
> +	 */
> +	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Add allocated interrupters");
> +	for (i = 0; i < xhci->secondary_irqs_alloc + 1; i++) {
> +		if (!xhci->interrupters[i])
> +			continue;
> +		xhci_add_interrupter(xhci, i);
> +		xhci->interrupters[i]->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
> +	}

Could you keep the above initialization code in xhci_init()?

Last year, I moved most register initialization from xhci_mem_init()
into xhci_init(). Keeping this separation has been helpful for debugging
and will also align better with the upcoming suspend/resume rework.

> +
>  	if (scratchpad_alloc(xhci, flags))
>  		goto fail;
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 585b2f3117b0..b3efd6d8fd9c 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -116,13 +116,12 @@ static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
>  static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
>  {
>  	struct usb_hcd *hcd = xhci_to_hcd(xhci);
> +	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);

Is there a reason for moving this outside the 'if (hcd->msix_enabled)' scope?

> +	int i;
> 
> -	if (hcd->msix_enabled) {
> -		struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
> -
> -		/* for now, the driver only supports one primary interrupter */
> -		synchronize_irq(pci_irq_vector(pdev, 0));
> -	}
> +	if (hcd->msix_enabled)
> +		for (i = 0; i < xhci->irqs_enabled; i++)
> +			synchronize_irq(pci_irq_vector(pdev, i));
>  }
> 
>  /* Legacy IRQ is freed by usb_remove_hcd() or usb_hcd_pci_shutdown() */
> @@ -130,11 +129,17 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
>  {
>  	struct usb_hcd *hcd = xhci_to_hcd(xhci);
>  	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
> +	int i;
> 
>  	if (hcd->irq > 0)
>  		return;
> 
> -	free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
> +	for (i = 0; i < xhci->irqs_enabled; i++)
> +		free_irq(pci_irq_vector(pdev, i), &xhci->irq_ctx[i]);
> +
> +	xhci->irqs_enabled = 0;
> +	memset(xhci->irq_ctx, 0, sizeof(xhci->irq_ctx));
> +
>  	pci_free_irq_vectors(pdev);
>  	hcd->msix_enabled = 0;
>  }
> @@ -145,6 +150,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
>  	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
>  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>  	int ret;
> +	struct xhci_irq_ctx *ctx;
> 
>  	/*
>  	 * Some Fresco Logic host controllers advertise MSI, but fail to
> @@ -174,11 +180,17 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
>  		goto legacy_irq;
>  	}
> 
> -	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
> -			  xhci_to_hcd(xhci));
> +	memset(xhci->irq_ctx, 0, sizeof(xhci->irq_ctx));
> +	xhci->irqs_enabled = 0;
> +
> +	ctx = &xhci->irq_ctx[0];
> +	ctx->hcd = hcd;
> +	ctx->intr_num = 0;
> +	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd", ctx);
>  	if (ret)
>  		goto free_irq_vectors;
> 
> +	xhci->irqs_enabled = 1;
>  	hcd->msi_enabled = 1;
>  	hcd->msix_enabled = pdev->msix_enabled;
>  	return 0;
> @@ -186,6 +198,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
>  free_irq_vectors:
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable %s interrupt",
>  		       pdev->msix_enabled ? "MSI-X" : "MSI");
> +	xhci->irqs_enabled = 0;
>  	pci_free_irq_vectors(pdev);
> 
>  legacy_irq:
> @@ -198,6 +211,9 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
>  		snprintf(hcd->irq_descr, sizeof(hcd->irq_descr), "%s:usb%d",
>  			 hcd->driver->description, hcd->self.busnum);
> 
> +	/* legacy IRQ path still needs interrupter 0 */
> +	xhci->irqs_enabled = 1;
> +
>  	/* fall back to legacy interrupt */
>  	ret = request_irq(pdev->irq, &usb_hcd_irq, IRQF_SHARED, hcd->irq_descr, hcd);
>  	if (ret) {
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 9315ba18310d..3ea134c07c5f 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3220,9 +3220,14 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
>  	return ret;
>  }
> 
> -irqreturn_t xhci_msi_irq(int irq, void *hcd)
> +irqreturn_t xhci_msi_irq(int irq, void *data)
>  {
> -	return xhci_irq(hcd);
> +	struct xhci_irq_ctx *ctx = data;
> +
> +	/* For now only vector 0 is requested; keep behavior unchanged. */
> +	if (!ctx || !ctx->hcd)
> +		return IRQ_NONE;
> +	return xhci_irq(ctx->hcd);
>  }
>  EXPORT_SYMBOL_GPL(xhci_msi_irq);
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index b3ba16b9718c..cbf96cb51583 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -576,10 +576,6 @@ static int xhci_init(struct usb_hcd *hcd)
>  	/* Set USB 3.0 device notifications for function remote wake */
>  	xhci_set_dev_notifications(xhci);
> 
> -	/* Initialize the Primary interrupter */
> -	xhci_add_interrupter(xhci, 0);
> -	xhci->interrupters[0]->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
> -
>  	/* Initializing Compliance Mode Recovery Data If Needed */
>  	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
>  		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
> @@ -594,9 +590,9 @@ static int xhci_init(struct usb_hcd *hcd)
> 
>  static int xhci_run_finished(struct xhci_hcd *xhci)
>  {
> -	struct xhci_interrupter *ir = xhci->interrupters[0];
>  	unsigned long	flags;
>  	u32		temp;
> +	int		i;
> 
>  	/*
>  	 * Enable interrupts before starting the host (xhci 4.2 and 5.5.2).
> @@ -609,8 +605,10 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
>  	temp |= (CMD_EIE);
>  	writel(temp, &xhci->op_regs->command);
> 
> -	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Enable primary interrupter");
> -	xhci_enable_interrupter(ir);
> +	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Enable all interrupters");
> +	for (i = 0; i < xhci->irqs_enabled; i++)
> +		if (xhci->interrupters[i])
> +			xhci_enable_interrupter(xhci->interrupters[i]);
> 
>  	if (xhci_start(xhci)) {
>  		xhci_halt(xhci);
> @@ -707,7 +705,7 @@ void xhci_stop(struct usb_hcd *hcd)
>  {
>  	u32 temp;
>  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> -	struct xhci_interrupter *ir = xhci->interrupters[0];
> +	int i;
> 
>  	mutex_lock(&xhci->mutex);
> 
> @@ -742,7 +740,9 @@ void xhci_stop(struct usb_hcd *hcd)
>  			"// Disabling event ring interrupts");
>  	temp = readl(&xhci->op_regs->status);
>  	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
> -	xhci_disable_interrupter(xhci, ir);
> +	for (i = 0; i < xhci->irqs_enabled; i++)
> +		if (xhci->interrupters[i])
> +			xhci_disable_interrupter(xhci, xhci->interrupters[i]);
> 
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
>  	xhci_mem_cleanup(xhci);
> @@ -1087,6 +1087,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  	bool			comp_timer_running = false;
>  	bool			pending_portevent = false;
>  	bool			suspended_usb3_devs = false;
> +	int			i;
> 
>  	if (!hcd->state)
>  		return 0;
> @@ -1180,7 +1181,9 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
>  		temp = readl(&xhci->op_regs->status);
>  		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
> -		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
> +		for (i = 0; i < xhci->irqs_enabled; i++)
> +			if (xhci->interrupters[i])
> +				xhci_disable_interrupter(xhci, xhci->interrupters[i]);
> 
>  		xhci_dbg(xhci, "cleaning up memory\n");
>  		xhci_mem_cleanup(xhci);
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 2b0796f6d00e..7707fd7564c5 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -45,6 +45,9 @@
>   */
>  #define MAX_HC_INTRS		128
> 
> +/* Software cap for secondary interrupters; not a hardware limit. */
> +#define MAX_SECONDARY_INTRNUM	4
> +
>  /*
>   * xHCI register interface.
>   * This corresponds to the eXtensible Host Controller Interface (xHCI)
> @@ -1497,6 +1500,11 @@ struct xhci_hub {
>  	u8			min_rev;
>  };
> 
> +struct xhci_irq_ctx {
> +	struct usb_hcd	*hcd;
> +	u8		intr_num;

Could you keep this as an 'unsigned int' to stay consistent with the other
"intr_num" variables?

Thanks,
Niklas

> +};
> +
>  /* There is one xhci_hcd structure per controller */
>  struct xhci_hcd {
>  	struct usb_hcd *main_hcd;
> @@ -1533,6 +1541,12 @@ struct xhci_hcd {
>  	/* data structures */
>  	struct xhci_device_context_array *dcbaa;
>  	struct xhci_interrupter **interrupters;
> +	/* Number of secondary interrupters successfully allocated */
> +	unsigned int		secondary_irqs_alloc;
> +	/* Number of IRQ vectors successfully requested (includes vector 0) */
> +	unsigned int		irqs_enabled;
> +	/* MSI/MSI-X vector contexts. Vector 0 uses [0], secondary use [1..] */
> +	struct xhci_irq_ctx	irq_ctx[MAX_SECONDARY_INTRNUM + 1];
>  	struct xhci_ring	*cmd_ring;
>  	unsigned int            cmd_ring_state;
>  #define CMD_RING_STATE_RUNNING         (1 << 0)
> @@ -1895,7 +1909,7 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup);
>  int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume);
> 
>  irqreturn_t xhci_irq(struct usb_hcd *hcd);
> -irqreturn_t xhci_msi_irq(int irq, void *hcd);
> +irqreturn_t xhci_msi_irq(int irq, void *data);
>  int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev);
>  int xhci_alloc_tt_info(struct xhci_hcd *xhci,
>  		struct xhci_virt_device *virt_dev,
> --
> 2.50.1
> 


