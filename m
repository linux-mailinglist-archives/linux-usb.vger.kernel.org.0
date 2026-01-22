Return-Path: <linux-usb+bounces-32625-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEjwDZAgcmmPdQAAu9opvQ
	(envelope-from <linux-usb+bounces-32625-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 14:05:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7D56703E
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 14:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1717A92265F
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 12:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CBF4418D2;
	Thu, 22 Jan 2026 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nER0k1jA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035E742983E
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 12:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769084078; cv=none; b=J972aJsS/dVktZYETsOuLlengimNuZJQb04G8JeUdxaUMkDJayhN/vG0GY8RkVgxntxSP21Kew0+8PT1yBVVTCp3NrL98NUJOCVPZ+lcoWJxCdOpCytJcUft+lfJIByQ4Oq78Rlif6fdH4Bmq2jA4qCZHrlGwzDfqTblUwN5IO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769084078; c=relaxed/simple;
	bh=URvu2K7L7Brmxz2ccTP4H/Bx2vE6W/e6TKUxRFb20S0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNtmv7wplCRx7EwJi71K6D78ROee3HhXTCP8umEZp+iB3d1LHLzksjf5au1UQdc2QvJGoqFKUFI9sY7EsFUkdBwQlsPXDe5yGWWtYDtDKubXLy3Ls/ZsegZJnsOXVev8hRMI+23JyPO8Z25o0jXsCsovDdte+o/aibyr3DQPDmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nER0k1jA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769084076; x=1800620076;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=URvu2K7L7Brmxz2ccTP4H/Bx2vE6W/e6TKUxRFb20S0=;
  b=nER0k1jA5KLQKQMMX6oHY2IFx7dngKWQEtVCj7s58xXquCNNxBOug2HR
   koTl0WGBDgfVAWh70LRVHStUWyMa0q3SN8wYss3qMcwY/gqVxYtyRHDK3
   bUMhTKtj/rvOldVde7TVsLdpThOj5Co81YaDtNieuvvrzBHzl7f+SDioV
   vz3MGctFgtfOWrvlvg7E7luViNWmCXYkNHVLlRc+uIK9QJBufE4g0NqDH
   xgQYhmy72JcSQRQIMVc3/MBN9+3v7uZVAncuCNsmHc8FTF/BGoE9NUd8C
   FzUnLppBOJSyHEycYln4QzEAhDTJzjTE3Ll3nAzr4jjQtPqgcm3NAoQ5d
   g==;
X-CSE-ConnectionGUID: 846w1J9MQq22EvF9BGcGKA==
X-CSE-MsgGUID: HF0OawW2SWK/KXHNfR8iZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70231564"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70231564"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 04:14:36 -0800
X-CSE-ConnectionGUID: aCXvgOMDQr6cAzZY34glbQ==
X-CSE-MsgGUID: 8tDW3mHvSwue6UeHu+ilwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="244326976"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.246.23.29]) ([10.246.23.29])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 04:14:33 -0800
Message-ID: <6b32133b-35ef-4ee5-89a8-5d4cd9e3ab68@linux.intel.com>
Date: Thu, 22 Jan 2026 14:14:18 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] usb:xhci:route device to secondary interrupters
To: raoxu <raoxu@uniontech.com>, mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 michal.pecio@gmail.com, zhanjun@uniontech.com, kenny@panix.com
References: <93A4C02E97C0BC96+20260120085500.2288734-1-raoxu@uniontech.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <93A4C02E97C0BC96+20260120085500.2288734-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,uniontech.com,panix.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32625-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,uniontech.com:email]
X-Rspamd-Queue-Id: 8A7D56703E
X-Rspamd-Action: no action


On 20/01/2026 10.55, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Some xHCI hosts expose multiple MSI/MSI-X vectors, but the driver
> currently routes all transfer completions through interrupter 0.
> This can lead to unnecessary contention on the primary event ring
> and IRQ vector.
> 
> Create a small set of secondary interrupters in xhci_mem_init().
> Cap the number in software (MAX_SECONDARY_INTRNUM, default 4).
> If any secondary allocation fails, roll back and keep using
> interrupter 0 only.
> 
> Unify primary and secondary handling on xhci->interrupters[].
> Use the same paths for enable/disable and teardown.
> Keep behavior consistent across run/stop/resume.
> 
> Route transfers per USB device (slot).
> Add vdev->interrupter in struct xhci_virt_device.
> Pick the default interrupter at device alloc time.
> Program TRB_INTR_TARGET() from vdev->interrupter->intr_num for
> bulk/ctrl/isoc/intr, so completions land on the selected event ring.
> 
> Route MSI/MSI-X IRQs to the right interrupter in xhci_msi_irq().
> Use a per-vector irq_ctx (hcd + intr_num) as dev_id for request_irq(),
> so each vector can select xhci->interrupters[intr_num] directly.
> Request vectors with PCI_IRQ_AFFINITY and sync all vectors on suspend.
> 
> Tested:
> S3 suspend/resume
> S4 hibernate/resume
> USB storage (U-disk), camera, mouse
> /proc/interrupts:
>   32:         51          0          0          0          0          0
>               0        320 IR-PCI-MSIX-0000:03:00.3    0-edge
>               xhci_hcd
>   33:       5696          0          0          0          0          0
>               0          0 IR-PCI-MSIX-0000:03:00.3    1-edge
>               xhci_hcd
>   34:          0      60682          0          0          0          0
>               0          0 IR-PCI-MSIX-0000:03:00.3    2-edge
>               xhci_hcd
>   35:          0          0      48205          0          0          0
>               0          0 IR-PCI-MSIX-0000:03:00.3    3-edge
>               xhci_hcd
>   36:          0          0          0         32          0          0
>               0          0 IR-PCI-MSIX-0000:03:00.3    4-edge
>               xhci_hcd
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---

...

> @@ -2495,6 +2506,34 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>  	if (!xhci->interrupters[0])
>  		goto fail;
> 
> +	/*
> +	 * Allocate secondary interrupters [1..max_interrupters-1].
> +	 * if alloc fail rollback to primary interrupt.
> +	 */
> +	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating secondary event ring");
> +	xhci->secondary_irqs_alloc = 0;
> +	secondary_intr_num = 0;
> +	if (xhci->max_interrupters > 1)
> +		secondary_intr_num = min_t(unsigned int,
> +					xhci->max_interrupters - 1,
> +					(unsigned int)MAX_SECONDARY_INTRNUM);
> +
> +	for (i = 0; i < secondary_intr_num; i++) {

Maybe;
	for (i = 1; i <= secondary_intr_num; i++) {
then you could drop all the 'i + 1'.

> +		/* Create secondary interrupter with intr_num = i + 1. */
> +		xhci->interrupters[i + 1] = xhci_create_secondary_interrupter(xhci_to_hcd(xhci),
> +				0, xhci->imod_interval, i + 1);

Could you please follow the same pattern used for the Primary Interrupter
allocation and initialization?

Specifically, use xhci_alloc_interrupter() here, and call xhci_add_interrupter()
from xhci_init(). This preserves the existing separation of responsibilities:
xhci_mem_init() for memory allocation and xhci_init() for initialization.

For example, in xhci_init():

	for (int i = 0; i < xhci->max_interrupters; i++) {
		if (!xhci->interrupters[i])
			continue;

		xhci_add_interrupter(xhci, i);
		xhci->interrupters[i]->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
	}

> +
> +		 /* Allocation failed; keep primary interrupter only. */
> +		if (!xhci->interrupters[i + 1]) {
> +			xhci_dbg_trace(xhci, trace_xhci_dbg_init,
> +					"keep primary interrupter only");
> +			xhci->secondary_irqs_alloc = 0;
> +			break;
> +		}
> +
> +		xhci->secondary_irqs_alloc++;
> +	}
> +
>  	if (scratchpad_alloc(xhci, flags))
>  		goto fail;
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 585b2f3117b0..208a17428afc 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -116,13 +116,15 @@ static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
>  static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
>  {
>  	struct usb_hcd *hcd = xhci_to_hcd(xhci);
> +	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
> +	int i;
> 
> -	if (hcd->msix_enabled) {
> -		struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
> -
> +	if (hcd->msix_enabled)
>  		/* for now, the driver only supports one primary interrupter */
>  		synchronize_irq(pci_irq_vector(pdev, 0));
> -	}
> +
> +	for (i = 0; i < xhci->secondary_irqs_enabled; i++)
> +		synchronize_irq(pci_irq_vector(pdev, i + 1));

Shouldn't the above be included in 'if (hcd->msix_enabled)'?

>  }
> 
>  /* Legacy IRQ is freed by usb_remove_hcd() or usb_hcd_pci_shutdown() */

...

> @@ -167,20 +180,54 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
> 
>  	/* TODO: Check with MSI Soc for sysdev */
>  	xhci->nvecs = pci_alloc_irq_vectors(pdev, 1, xhci->nvecs,
> -					    PCI_IRQ_MSIX | PCI_IRQ_MSI);
> +					    PCI_IRQ_MSIX | PCI_IRQ_MSI | PCI_IRQ_AFFINITY);
>  	if (xhci->nvecs < 0) {
>  		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
>  			       "failed to allocate IRQ vectors");
>  		goto legacy_irq;
>  	}
> 
> -	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
> -			  xhci_to_hcd(xhci));
> +	memset(xhci->irq_ctx, 0, sizeof(xhci->irq_ctx));
> +
> +	ctx = &xhci->irq_ctx[0];
> +	ctx->hcd = hcd;
> +	ctx->intr_num = 0;
> +	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd", ctx);
>  	if (ret)
>  		goto free_irq_vectors;
> 
>  	hcd->msi_enabled = 1;
>  	hcd->msix_enabled = pdev->msix_enabled;
> +
> +	if (xhci->nvecs <= 1)
> +		request_secondary_intrs = 0;
> +	else
> +		request_secondary_intrs = min_t(unsigned int,
> +					(unsigned int)(xhci->nvecs - 1),
> +					xhci->secondary_irqs_alloc);
> +
> +	/* Secondary transfer interrupters */
> +	xhci->secondary_irqs_enabled = 0;
> +	for (i = 0; i < request_secondary_intrs; i++) {
> +		ctx = &xhci->irq_ctx[i + 1];
> +		ctx->hcd = hcd;
> +		ctx->intr_num = i + 1;
> +
> +		ret = request_irq(pci_irq_vector(pdev, i + 1),
> +				xhci_msi_irq, 0, "xhci_hcd", ctx);
> +		if (ret)

Maybe free the IRQs here, before the break?
This would keep all related code together.

> +			break;
> +
> +		xhci->secondary_irqs_enabled++;
> +	}
> +
> +	if (i != 0 && i < request_secondary_intrs) {
> +		while (--i >= 0)
> +			free_irq(pci_irq_vector(pdev, i + 1), &xhci->irq_ctx[i + 1]);
> +
> +		xhci->secondary_irqs_enabled = 0;
> +	}
> +
>  	return 0;
> 
>  free_irq_vectors:

...

> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index b3ba16b9718c..713560cdb69a 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -597,6 +597,7 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
>  	struct xhci_interrupter *ir = xhci->interrupters[0];
>  	unsigned long	flags;
>  	u32		temp;
> +	int		i;
> 
>  	/*
>  	 * Enable interrupts before starting the host (xhci 4.2 and 5.5.2).
> @@ -612,6 +613,12 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Enable primary interrupter");
>  	xhci_enable_interrupter(ir);
> 
> +	/* Enable secondary interrupters (if any were successfully requested) */
> +	for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
> +		if (xhci->interrupters[i + 1])
> +			xhci_enable_interrupter(xhci->interrupters[i + 1]);
> +	}

The Primary and Secondary interrupter enabling could be handled in the same loop.
This would be much cleaner and more future-proof. For example:

	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Enable all interrupters");
	for (i = 0; i < xhci->max_interrupters; i++) {
		if (xhci->interrupters[i])
			xhci_enable_interrupter(xhci->interrupters[i]);

There is, however, a small complication. Some interrupters (e.g. xhci-sideband) are
non-operational. They are allocated and initialized, but do not have an IRQ and
therefore cannot be enabled.

To iterate over all interrupters and enable them generically, we need a
way to skip non-operational ones. A good approach would be to add a type variable
to interrupters. This could also be useful for future interrupter variants,
and would allow functions such as xhci_enable_interrupter() to become no-ops for
unsupported types.

If you’d like, I can provide a patch implementing this refactoring so you can build
your changes on top of it. Otherwise, please make this change in a separate commit.

>  	if (xhci_start(xhci)) {
>  		xhci_halt(xhci);
>  		spin_unlock_irqrestore(&xhci->lock, flags);

...

> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 2b0796f6d00e..73514b2b1651 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -45,6 +45,9 @@
>   */
>  #define MAX_HC_INTRS		128
> 
> +/* Software cap for secondary interrupters; not a hardware limit. */
> +#define MAX_SECONDARY_INTRNUM   4
> +
>  /*
>   * xHCI register interface.
>   * This corresponds to the eXtensible Host Controller Interface (xHCI)
> @@ -405,6 +408,11 @@ struct xhci_slot_ctx {
>  #define SLOT_STATE_ADDRESSED	2
>  #define SLOT_STATE_CONFIGURED	3
> 
> +/* Interrupter Target - tt_info[31:22] (xHCI Slot Context) */
> +#define SLOT_INTR_TARGET_SHIFT	22
> +#define SLOT_INTR_TARGET_MASK	(0x3ffU << SLOT_INTR_TARGET_SHIFT)
> +#define SLOT_INTR_TARGET(p)	(((p) & 0x3ffU) << SLOT_INTR_TARGET_SHIFT)
> +
>  /**
>   * struct xhci_ep_ctx
>   * @ep_info:	endpoint state, streams, mult, and interval information.
> @@ -764,6 +772,12 @@ struct xhci_virt_device {
>  	void				*debugfs_private;
>  	/* set if this endpoint is controlled via sideband access*/
>  	struct xhci_sideband	*sideband;
> +	/*
> +	 * Default transfer-event interrupter for this USB device.
> +	 * Queueing code programs TRB_INTR_TARGET() from vdev->interrupter
> +	 * to route transfer completion events to the selected event ring.
> +	 */
> +	struct xhci_interrupter *interrupter;
>  };
> 
>  /*
> @@ -1497,6 +1511,11 @@ struct xhci_hub {
>  	u8			min_rev;
>  };
> 
> +struct xhci_irq_ctx {
> +	struct usb_hcd *hcd;
> +	u8		intr_num;
> +};
> +
>  /* There is one xhci_hcd structure per controller */
>  struct xhci_hcd {
>  	struct usb_hcd *main_hcd;
> @@ -1533,6 +1552,12 @@ struct xhci_hcd {
>  	/* data structures */
>  	struct xhci_device_context_array *dcbaa;
>  	struct xhci_interrupter **interrupters;
> +	/* number of secondary interrupters successfully created */
> +	unsigned int            secondary_irqs_alloc;
> +	/* number of secondary interrupters successfully in use */
> +	unsigned int            secondary_irqs_enabled;

Why not rename this to "irqs_enabled", so it also covers the Primary Interrupter?

Both synchronize_irq() and free_irq() are called for all PCI IRQ vectors, so the
broader name would better reflect its actual usage.

Then you could combine Primary and Secondary into one loop:

	for (int i = 0; i < xhci->irqs_enabled; i++)
		free_irq(pci_irq_vector(pdev, i), &xhci->irq_ctx[i]);

	xhci->irqs_enabled = 0;

Thanks,
Niklas

> +	/* MSI/MSI-X vector contexts. Vector 0 uses [0], secondary use [1..] */
> +	struct xhci_irq_ctx	irq_ctx[MAX_SECONDARY_INTRNUM + 1];
>  	struct xhci_ring	*cmd_ring;
>  	unsigned int            cmd_ring_state;
>  #define CMD_RING_STATE_RUNNING         (1 << 0)
> @@ -1895,7 +1920,7 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup);
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


