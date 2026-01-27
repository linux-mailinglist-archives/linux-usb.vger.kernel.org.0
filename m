Return-Path: <linux-usb+bounces-32806-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFY5D5S3eGlzsQEAu9opvQ
	(envelope-from <linux-usb+bounces-32806-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 14:03:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3D9949F3
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 14:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A1753049ED2
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 12:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D67F355816;
	Tue, 27 Jan 2026 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYV4IRYp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AA8355025
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518627; cv=none; b=OKVUkr3UNAoXnu8Jc1m+TOWNRCOX+1tsokacS5j1NEPBu/YBX37SjgpJaWT7uBmCgum2kPIkuY0NN/IRm58VthLW8QKzt1qgZxyX9+r43VUfv3DLFfkCV1a7jPH5kZ4j6OLCB8rM2Od37aW0+ANcmtJRRNZlzCfqKja31W670T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518627; c=relaxed/simple;
	bh=ILV0qxuHHtluFEtOUZXJKcB/DqkyV5DAHVgMiyIdzaY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ho0RoNtJ1ngkOha3cORFuw7StsmksS8uw2Ux8/ObbfubFqmRBhhXXgtV33O3yLqdFavzsTnYSzDypOOpg2dvNaLcRryl9SQghzPFJT61OOJJTClbsPQPV3kLzSZgYAFTYYmN7xsbXJPms2PrtCDeeKpYE3t2Ru61r5z80EXUYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYV4IRYp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769518626; x=1801054626;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=ILV0qxuHHtluFEtOUZXJKcB/DqkyV5DAHVgMiyIdzaY=;
  b=ZYV4IRYpnFIEiRdo4HuGc3UnyUDB8DTGGwaLFlZH3EGj6B91fhMgh/Xz
   fW4z1RxWNjoa8rnSbHnNfPTKyxG0xzzC71E0vluIdD+JlIJ3biSWPGzs/
   yL8uXa2/7Ka6zj0mEQ1pRZ6IV7wMKqzBzDYlXQFxdh9757ke+Mikt2LzK
   eSuDuLkYXuWzyS/syIAX/VKcsRkOTmSnBOXSDbdX0oMJgmZSsJpMOQsPc
   9dcLARqRxTpvEoic6tIKSp/71hpTtiyv7okIcVszFhEhEOmBZDZJv87Ce
   M5K0GQVZ/PXFpgWK5tRN/JfrwxNO6cGAf3ZgdCtCYJ8hZ76X/2DCSeSCG
   Q==;
X-CSE-ConnectionGUID: bft350Z0Tkm6KUv09KoJJA==
X-CSE-MsgGUID: p+Xxw3P5Qs2N2ngu+biF+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70802492"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70802492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:57:05 -0800
X-CSE-ConnectionGUID: K1o3ABVHRbiU9jf4xRKvHA==
X-CSE-MsgGUID: qVmtUyILRJuBxQ5kgLTxxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207867467"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.250.130]) ([10.94.250.130])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:57:03 -0800
Message-ID: <8deab843-8ff5-4925-93a9-31dcbdd0720e@linux.intel.com>
Date: Tue, 27 Jan 2026 14:57:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and
 route transfers per slot
To: raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, kenny@panix.com, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com, michal.pecio@gmail.com, zhanjun@uniontech.com
References: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>
 <FF69E7CC57E8D606+20260127023900.2145949-1-raoxu@uniontech.com>
Content-Language: en-US
In-Reply-To: <FF69E7CC57E8D606+20260127023900.2145949-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-32806-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 8E3D9949F3
X-Rspamd-Action: no action



On 27/01/2026 4.39, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Some xHCI hosts expose multiple MSI/MSI-X vectors and support multiple
> interrupters with independent event rings, but Linux commonly routes all
> transfer completions through interrupter 0.
> 
> This is not about increasing USB link throughput, but about avoiding a
> driver-imposed single hot spot. On hosts that already provide multiple
> MSI/MSI-X vectors and independent event rings, routing all completions
> through interrupter 0 creates unnecessary contention (serialized event
> handling/locks and coupled moderation), increasing CPU cost and tail
> latency under many active devices/endpoints. Using secondary interrupters
> simply matches the hardware's design, similar in spirit to merged
> xHCI-sideband work: exploit available parallel paths rather than
> funneling all events through one.
> 
> Allocate a small capped set of secondary interrupters in xhci_mem_init()
> (MAX_SECONDARY_INTRNUM, default 4) and request up to the matching number
> of IRQ vectors (bounded by what PCI core provides).  Dispatch each vector
> to its interrupter via the per-vector irq_ctx.
> 
> Route transfers per USB device (slot) by assigning vdev->interrupter at
> device allocation time and programming the interrupter target (slot
> context + TRB_INTR_TARGET) from that selection, so completions land on the
> selected event ring.  Drain a slot's secondary event ring at selected
> command completion boundaries to reduce late-event artifacts when teardown
> happens on interrupter 0.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> 

...

> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index b3efd6d8fd9c..4ff3e29070b1 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -150,6 +150,8 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
>  	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
>  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>  	int ret;
> +	unsigned int irqs_num;
> +	int i;
>  	struct xhci_irq_ctx *ctx;
> 
>  	/*
> @@ -173,7 +175,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
> 
>  	/* TODO: Check with MSI Soc for sysdev */
>  	xhci->nvecs = pci_alloc_irq_vectors(pdev, 1, xhci->nvecs,
> -					    PCI_IRQ_MSIX | PCI_IRQ_MSI);
> +					    PCI_IRQ_MSIX | PCI_IRQ_MSI | PCI_IRQ_AFFINITY);
>  	if (xhci->nvecs < 0) {
>  		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
>  			       "failed to allocate IRQ vectors");
> @@ -183,14 +185,30 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
>  	memset(xhci->irq_ctx, 0, sizeof(xhci->irq_ctx));
>  	xhci->irqs_enabled = 0;
> 
> -	ctx = &xhci->irq_ctx[0];
> -	ctx->hcd = hcd;
> -	ctx->intr_num = 0;
> -	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd", ctx);
> -	if (ret)
> -		goto free_irq_vectors;
> +	/*
> +	 * Request up to 1 + secondary_irqs_alloc vectors (vector 0 + secondary),
> +	 * limited by what PCI core actually allocated.
> +	 */
> +	irqs_num = min_t(unsigned int,
> +		     (unsigned int)xhci->nvecs,
> +		     (unsigned int)(1 + xhci->secondary_irqs_alloc));
> +
> +	for (i = 0; i < irqs_num; i++) {
> +		ctx = &xhci->irq_ctx[i];
> +		ctx->hcd = hcd;
> +		ctx->intr_num = i;
> +		ret = request_irq(pci_irq_vector(pdev, i), xhci_msi_irq, 0,
> +				  "xhci_hcd", ctx);
> +		if (ret) {
> +			while (--i >= 0)
> +				free_irq(pci_irq_vector(pdev, i), &xhci->irq_ctx[i]);
> +			xhci->irqs_enabled = 0;
> +			memset(xhci->irq_ctx, 0, sizeof(xhci->irq_ctx));
> +			goto free_irq_vectors;

Won't this 'goto' end up freeing all IRQ vectors?

Now, if requesting an IRQ for a secondary interrupter fails,
the xhci driver will then fall back to using the legacy IRQ?

> +		}
> +		xhci->irqs_enabled++;
> +	}

Maybe it would be useful to add a debug message here, for example:
	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "enabled %u %s interrupters",
		       xhci->irqs_enabled, pdev->msix_enabled ? "MSI-X" : "MSI");

I'm not sure whether this information is already reported elsewhere.

Thanks,
Niklas


