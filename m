Return-Path: <linux-usb+bounces-36869-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMPcDpZC+Gn9rwIAu9opvQ
	(envelope-from <linux-usb+bounces-36869-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 08:54:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C144B909B
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 08:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF126300102D
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 06:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564CD2D3739;
	Mon,  4 May 2026 06:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PC2DKX0v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFF71A7264;
	Mon,  4 May 2026 06:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877648; cv=none; b=u1gDgqwSgAsNEa13CxeOmRSjvj4XQL/SzkkFiOH8u433nzFuaSQ/lrRoVHsZqTc0cr2ydyyjQSl2hHVaEG0RcaIpjS/o5Ni741Zb7ScJYodTpqLJnZTDJG6VCXY3r/SyiRWPb6oV08OPuOVbJ3mKJwVdZ7joRcOY2Lb+IGaNqoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877648; c=relaxed/simple;
	bh=YT7SuSZKIYRzwSIC772zIe9Rbr4DpvQSRPjAqlHqtTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT5ZOiWP1fSkcbGkSpar+eayES4bi3AKjnacUMG6mbwxy9P49YBz6yk4kXCnz3hn2SXYlT3+c4n6jJHTXxOKrrP9Px9pOtA82XcBAwWz0ekQuIq4V3ivWN4xulzctfyDkpTGvYgPgy4pzHwm2y8WEdS2csSHqEWAxCFusFyNYcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PC2DKX0v; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777877647; x=1809413647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YT7SuSZKIYRzwSIC772zIe9Rbr4DpvQSRPjAqlHqtTI=;
  b=PC2DKX0vnvltUzTKL8flZEtBvF1lxVfT9xv9RZJ6wG0X3cF+2HiIq5TG
   YI+EPmepUvtZo9p45wdtZFPYWT0umwZmPo0aDaddCuKAbiZSXUftBeMHq
   GkAshE4rBa8OLt/xaYt89nPCeTvl3R9atc5GJyLT+1AWqWGVYAAZHs9Jk
   3Eva3FoO20NkWubsmpzoJYeJiWqTaUWsiBF9GMvTwNem6cYuuTMIL73by
   E3bFRv/0zgdJurdludABAVrsgfbQz0+k8cO0HGx0m6CKIQf9w2ad+FtOq
   foC7DPdV+vE77TR0h6Q7wAAXiX1s3yPSdjNaD95qTWPi+VfLEyVqqFedv
   g==;
X-CSE-ConnectionGUID: MqTWZYpxTjqa0tRXnR4b+A==
X-CSE-MsgGUID: R39YNcLpT/OUldM3fWR4Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78436582"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78436582"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:54:07 -0700
X-CSE-ConnectionGUID: 4fIDrQGiQMehUqh5P8+CxA==
X-CSE-MsgGUID: XWVP1wWiS+aifHH5tpwXOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="228938699"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 03 May 2026 23:54:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8381A98; Mon, 04 May 2026 08:54:02 +0200 (CEST)
Date: Mon, 4 May 2026 08:54:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] thunderbolt: Separate out common NHI bits
Message-ID: <20260504065402.GB6785@black.igk.intel.com>
References: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
 <20260428-topic-usb4_nonpcie_prepwork-v2-2-452fb9d63f77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-topic-usb4_nonpcie_prepwork-v2-2-452fb9d63f77@oss.qualcomm.com>
X-Rspamd-Queue-Id: 91C144B909B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36869-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,black.igk.intel.com:mid]

Hi,

On Tue, Apr 28, 2026 at 08:49:45PM +0200, Konrad Dybcio wrote:
> + * @pre_nvm_auth: hook to run before TBT3 NVM authentication

Thunderbolt 3 NVM authentication

> + * @post_nvm_auth: hook to run after TBT3 NVM authentication

ditto here.

> + * @request_ring_irq: NHI specific interrupt retrieval hook
> + * @release_ring_irq: NHI specific interrupt release hook
> + * @is_present: Whether the device is currently present on the parent bus
> + * @init_interrupts: NHI specific interrupt initialization hook
>   */
>  struct tb_nhi_ops {
>  	int (*init)(struct tb_nhi *nhi);
> @@ -47,6 +61,12 @@ struct tb_nhi_ops {
>  	int (*runtime_suspend)(struct tb_nhi *nhi);
>  	int (*runtime_resume)(struct tb_nhi *nhi);
>  	void (*shutdown)(struct tb_nhi *nhi);
> +	void (*pre_nvm_auth)(struct tb_nhi *nhi);
> +	void (*post_nvm_auth)(struct tb_nhi *nhi);
> +	int (*request_ring_irq)(struct tb_ring *ring, bool no_suspend);
> +	void (*release_ring_irq)(struct tb_ring *ring);
> +	bool (*is_present)(struct tb_nhi *nhi);
> +	int (*init_interrupts)(struct tb_nhi *nhi);
>  };
>  
>  extern const struct tb_nhi_ops icl_nhi_ops;
> @@ -101,4 +121,15 @@ extern const struct tb_nhi_ops icl_nhi_ops;
>  
>  #define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
>  
> +/* Host interface quirks */
> +#define QUIRK_AUTO_CLEAR_INT	BIT(0)
> +#define QUIRK_E2E		BIT(1)
> +
> +/*
> + * Minimal number of vectors when we use MSI-X. Two for control channel
> + * Rx/Tx and the rest four are for cross domain DMA paths.
> + */
> +#define MSIX_MIN_VECS		6
> +#define MSIX_MAX_VECS		16
> +
>  #endif
> diff --git a/drivers/thunderbolt/nhi_ops.c b/drivers/thunderbolt/nhi_ops.c
> index 8c50066f3411..530337a78322 100644
> --- a/drivers/thunderbolt/nhi_ops.c
> +++ b/drivers/thunderbolt/nhi_ops.c
> @@ -11,6 +11,7 @@
>  
>  #include "nhi.h"
>  #include "nhi_regs.h"
> +#include "pci.h"
>  #include "tb.h"
>  
>  /* Ice Lake specific NHI operations */
> @@ -176,6 +177,8 @@ static int icl_nhi_resume(struct tb_nhi *nhi)
>  
>  static void icl_nhi_shutdown(struct tb_nhi *nhi)
>  {
> +	nhi_pci_shutdown(nhi);
> +
>  	icl_nhi_force_power(nhi, false);
>  }
>  
> @@ -186,4 +189,10 @@ const struct tb_nhi_ops icl_nhi_ops = {
>  	.runtime_suspend = icl_nhi_suspend,
>  	.runtime_resume = icl_nhi_resume,
>  	.shutdown = icl_nhi_shutdown,
> +	.pre_nvm_auth = nhi_pci_start_dma_port,
> +	.post_nvm_auth = nhi_pci_complete_dma_port,
> +	.request_ring_irq = nhi_pci_ring_request_msix,
> +	.release_ring_irq = nhi_pci_ring_release_msix,
> +	.is_present = nhi_pci_is_present,
> +	.init_interrupts = nhi_pci_init_msi,
>  };
> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> new file mode 100644
> index 000000000000..400ba88db034
> --- /dev/null
> +++ b/drivers/thunderbolt/pci.c
> @@ -0,0 +1,507 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Thunderbolt driver - PCI NHI driver
> + *
> + * Copyright (c) 2014 Andreas Noever <andreas.noever@gmail.com>
> + * Copyright (C) 2018, Intel Corporation
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/errno.h>
> +#include <linux/pci.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/iommu.h>
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/platform_data/x86/apple.h>
> +#include <linux/property.h>
> +#include <linux/string_helpers.h>
> +
> +#include "nhi.h"
> +#include "nhi_regs.h"
> +#include "pci.h"
> +#include "tb.h"
> +

Kernel-doc

> +struct tb_nhi_pci {
> +	struct tb_nhi nhi;
> +	struct ida msix_ida;
> +};
> +
> +static inline struct tb_nhi_pci *nhi_to_pci(struct tb_nhi *nhi)
> +{
> +	return container_of(nhi, struct tb_nhi_pci, nhi);
> +}
> +
> +static void nhi_pci_check_quirks(struct tb_nhi_pci *nhi_pci)
> +{
> +	struct tb_nhi *nhi = &nhi_pci->nhi;
> +	struct pci_dev *pdev = to_pci_dev(nhi->dev);
> +
> +	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
> +		/*
> +		 * Intel hardware supports auto clear of the interrupt
> +		 * status register right after interrupt is being
> +		 * issued.
> +		 */
> +		nhi->quirks |= QUIRK_AUTO_CLEAR_INT;
> +
> +		switch (pdev->device) {
> +		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
> +		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
> +			/*
> +			 * Falcon Ridge controller needs the end-to-end
> +			 * flow control workaround to avoid losing Rx
> +			 * packets when RING_FLAG_E2E is set.
> +			 */
> +			nhi->quirks |= QUIRK_E2E;
> +			break;
> +		}
> +	}
> +}
> +
> +static int nhi_pci_check_iommu_pdev(struct pci_dev *pdev, void *data)
> +{
> +	if (!pdev->external_facing ||
> +	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_PRE_BOOT_PROTECTION))
> +		return 0;
> +	*(bool *)data = true;
> +	return 1; /* Stop walking */
> +}
> +
> +static void nhi_pci_check_iommu(struct tb_nhi_pci *nhi_pci)
> +{
> +	struct tb_nhi *nhi = &nhi_pci->nhi;
> +	struct pci_dev *pdev = to_pci_dev(nhi->dev);
> +	struct pci_bus *bus = pdev->bus;
> +	bool port_ok = false;
> +
> +	/*
> +	 * Ideally what we'd do here is grab every PCI device that
> +	 * represents a tunnelling adapter for this NHI and check their
> +	 * status directly, but unfortunately USB4 seems to make it
> +	 * obnoxiously difficult to reliably make any correlation.
> +	 *
> +	 * So for now we'll have to bodge it... Hoping that the system
> +	 * is at least sane enough that an adapter is in the same PCI
> +	 * segment as its NHI, if we can find *something* on that segment
> +	 * which meets the requirements for Kernel DMA Protection, we'll
> +	 * take that to imply that firmware is aware and has (hopefully)
> +	 * done the right thing in general. We need to know that the PCI
> +	 * layer has seen the ExternalFacingPort property which will then
> +	 * inform the IOMMU layer to enforce the complete "untrusted DMA"
> +	 * flow, but also that the IOMMU driver itself can be trusted not
> +	 * to have been subverted by a pre-boot DMA attack.
> +	 */
> +	while (bus->parent)
> +		bus = bus->parent;
> +
> +	pci_walk_bus(bus, nhi_pci_check_iommu_pdev, &port_ok);
> +
> +	nhi->iommu_dma_protection = port_ok;
> +	dev_dbg(nhi->dev, "IOMMU DMA protection is %s\n",
> +		str_enabled_disabled(port_ok));
> +}
> +
> +int nhi_pci_init_msi(struct tb_nhi *nhi)
> +{
> +	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
> +	struct pci_dev *pdev = to_pci_dev(nhi->dev);
> +	struct device *dev = &pdev->dev;
> +	int res, irq, nvec;
> +
> +	ida_init(&nhi_pci->msix_ida);
> +
> +	/*
> +	 * The NHI has 16 MSI-X vectors or a single MSI. We first try to
> +	 * get all MSI-X vectors and if we succeed, each ring will have
> +	 * one MSI-X. If for some reason that does not work out, we
> +	 * fallback to a single MSI.
> +	 */
> +	nvec = pci_alloc_irq_vectors(pdev, MSIX_MIN_VECS, MSIX_MAX_VECS,
> +				     PCI_IRQ_MSIX);
> +	if (nvec < 0) {
> +		nvec = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
> +		if (nvec < 0)
> +			return nvec;
> +
> +		INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
> +
> +		irq = pci_irq_vector(pdev, 0);
> +		if (irq < 0)
> +			return irq;
> +
> +		res = devm_request_irq(&pdev->dev, irq, nhi_msi,
> +				       IRQF_NO_SUSPEND, "thunderbolt", nhi);
> +		if (res)
> +			return dev_err_probe(dev, res, "request_irq failed, aborting\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static bool nhi_pci_imr_valid(struct pci_dev *pdev)
> +{
> +	u8 val;
> +
> +	if (!device_property_read_u8(&pdev->dev, "IMR_VALID", &val))
> +		return !!val;
> +
> +	return true;
> +}
> +
> +void nhi_pci_start_dma_port(struct tb_nhi *nhi)
> +{
> +	struct pci_dev *pdev = to_pci_dev(nhi->dev);
> +	struct pci_dev *root_port;
> +
> +	/*
> +	 * During host router NVM upgrade we should not allow root port to
> +	 * go into D3cold because some root ports cannot trigger PME
> +	 * itself. To be on the safe side keep the root port in D0 during
> +	 * the whole upgrade process.
> +	 */
> +	root_port = pcie_find_root_port(pdev);
> +	if (root_port)
> +		pm_runtime_get_noresume(&root_port->dev);
> +}
> +
> +void nhi_pci_complete_dma_port(struct tb_nhi *nhi)
> +{
> +	struct pci_dev *pdev = to_pci_dev(nhi->dev);
> +	struct pci_dev *root_port;
> +
> +	root_port = pcie_find_root_port(pdev);
> +	if (root_port)
> +		pm_runtime_put(&root_port->dev);
> +}
> +
> +int nhi_pci_ring_request_msix(struct tb_ring *ring, bool no_suspend)
> +{
> +	struct tb_nhi *nhi = ring->nhi;
> +	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
> +	struct pci_dev *pdev = to_pci_dev(nhi->dev);
> +	unsigned long irqflags;
> +	int ret;
> +
> +	if (!pdev->msix_enabled)
> +		return 0;
> +
> +	ret = ida_alloc_max(&nhi_pci->msix_ida, MSIX_MAX_VECS - 1, GFP_KERNEL);
> +	if (ret < 0)
> +		return ret;
> +
> +	ring->vector = ret;
> +
> +	ret = pci_irq_vector(pdev, ring->vector);
> +	if (ret < 0)
> +		goto err_ida_remove;
> +
> +	ring->irq = ret;
> +
> +	irqflags = no_suspend ? IRQF_NO_SUSPEND : 0;
> +	ret = request_irq(ring->irq, ring_msix, irqflags, "thunderbolt", ring);
> +	if (ret)
> +		goto err_ida_remove;
> +
> +	return 0;
> +
> +err_ida_remove:
> +	ida_free(&nhi_pci->msix_ida, ring->vector);
> +
> +	return ret;
> +}
> +
> +void nhi_pci_ring_release_msix(struct tb_ring *ring)
> +{
> +	struct tb_nhi_pci *nhi_pci = nhi_to_pci(ring->nhi);
> +
> +	if (ring->irq <= 0)
> +		return;
> +
> +	free_irq(ring->irq, ring);
> +	ida_free(&nhi_pci->msix_ida, ring->vector);
> +	ring->vector = 0;
> +	ring->irq = 0;
> +}
> +
> +void nhi_pci_shutdown(struct tb_nhi *nhi)

Why these are not static?

> +{
> +	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
> +	struct pci_dev *pdev = to_pci_dev(nhi->dev);
> +
> +	/*
> +	 * We have to release the irq before calling flush_work. Otherwise an
> +	 * already executing IRQ handler could call schedule_work again.
> +	 */
> +	if (!pdev->msix_enabled) {
> +		devm_free_irq(nhi->dev, pdev->irq, nhi);
> +		flush_work(&nhi->interrupt_work);
> +	}
> +	ida_destroy(&nhi_pci->msix_ida);
> +}
> +
> +bool nhi_pci_is_present(struct tb_nhi *nhi)
> +{
> +	return pci_device_is_present(to_pci_dev(nhi->dev));
> +}
> +
> +static const struct tb_nhi_ops pci_nhi_default_ops = {
> +	.pre_nvm_auth = nhi_pci_start_dma_port,
> +	.post_nvm_auth = nhi_pci_complete_dma_port,
> +	.request_ring_irq = nhi_pci_ring_request_msix,
> +	.release_ring_irq = nhi_pci_ring_release_msix,
> +	.shutdown = nhi_pci_shutdown,
> +	.is_present = nhi_pci_is_present,
> +	.init_interrupts = nhi_pci_init_msi,

You populate them here so there is no need to expose outside of pci.c.

> +};
> +
> +static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tb_nhi_pci *nhi_pci;
> +	struct tb_nhi *nhi;
> +	int res;
> +
> +	if (!nhi_pci_imr_valid(pdev))
> +		return dev_err_probe(dev, -ENODEV, "firmware image not valid, aborting\n");
> +
> +	res = pcim_enable_device(pdev);
> +	if (res)
> +		return dev_err_probe(dev, res, "cannot enable PCI device, aborting\n");
> +
> +	nhi_pci = devm_kzalloc(dev, sizeof(*nhi_pci), GFP_KERNEL);
> +	if (!nhi_pci)
> +		return -ENOMEM;
> +
> +	nhi = &nhi_pci->nhi;
> +	nhi->dev = dev;
> +	nhi->ops = (const struct tb_nhi_ops *)id->driver_data ?: &pci_nhi_default_ops;
> +
> +	nhi->iobase = pcim_iomap_region(pdev, 0, "thunderbolt");
> +	res = PTR_ERR_OR_ZERO(nhi->iobase);
> +	if (res)
> +		return dev_err_probe(dev, res, "cannot obtain PCI resources, aborting\n");
> +
> +	nhi_pci_check_quirks(nhi_pci);
> +	nhi_pci_check_iommu(nhi_pci);
> +
> +	pci_set_master(pdev);
> +
> +	res = nhi_probe(&nhi_pci->nhi);
> +	if (res)
> +		return dev_err_probe(dev, res, "NHI common probe failed\n");

You can make nhi_probe() log error so you can just do here

	return nhi_probe(...);

> +
> +	return 0;
> +}
> +
> +static void nhi_pci_remove(struct pci_dev *pdev)
> +{
> +	struct tb *tb = pci_get_drvdata(pdev);
> +	struct tb_nhi *nhi = tb->nhi;
> +
> +	pm_runtime_get_sync(&pdev->dev);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_forbid(&pdev->dev);
> +
> +	tb_domain_remove(tb);
> +	nhi_shutdown(nhi);
> +}
> +
> +/*
> + * During suspend the Thunderbolt controller is reset and all PCIe
> + * tunnels are lost. The NHI driver will try to reestablish all tunnels
> + * during resume. This adds device links between the tunneled PCIe
> + * downstream ports and the NHI so that the device core will make sure
> + * NHI is resumed first before the rest.
> + */
> +bool tb_apple_add_links(struct tb_nhi *nhi)

Okay you moved it here good. I think we can call it in nhi_pci_probe()
directly so no need to expose outside.

> +{
> +	struct pci_dev *nhi_pdev = to_pci_dev(nhi->dev);
> +	struct pci_dev *upstream, *pdev;
> +	bool ret;
> +
> +	if (!x86_apple_machine)
> +		return false;
> +
> +	switch (nhi_pdev->device) {
> +	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
> +	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
> +	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
> +	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	upstream = pci_upstream_bridge(nhi_pdev);
> +	while (upstream) {
> +		if (!pci_is_pcie(upstream))
> +			return false;
> +		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
> +			break;
> +		upstream = pci_upstream_bridge(upstream);
> +	}
> +
> +	if (!upstream)
> +		return false;
> +
> +	/*
> +	 * For each hotplug downstream port, create add device link
> +	 * back to NHI so that PCIe tunnels can be re-established after
> +	 * sleep.
> +	 */
> +	ret = false;
> +	for_each_pci_bridge(pdev, upstream->subordinate) {
> +		const struct device_link *link;
> +
> +		if (!pci_is_pcie(pdev))
> +			continue;
> +		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
> +		    !pdev->is_pciehp)
> +			continue;
> +
> +		link = device_link_add(&pdev->dev, nhi->dev,
> +				       DL_FLAG_AUTOREMOVE_SUPPLIER |
> +				       DL_FLAG_PM_RUNTIME);
> +		if (link) {
> +			dev_dbg(nhi->dev, "created link from %s\n",
> +				dev_name(&pdev->dev));
> +			ret = true;
> +		} else {
> +			dev_warn(nhi->dev, "device link creation from %s failed\n",
> +				 dev_name(&pdev->dev));
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static struct pci_device_id nhi_ids[] = {
> +	/*
> +	 * We have to specify class, the TB bridges use the same device and
> +	 * vendor (sub)id on gen 1 and gen 2 controllers.
> +	 */
> +	{
> +		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
> +		.vendor = PCI_VENDOR_ID_INTEL,
> +		.device = PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
> +		.subvendor = 0x2222, .subdevice = 0x1111,
> +	},
> +	{
> +		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
> +		.vendor = PCI_VENDOR_ID_INTEL,
> +		.device = PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
> +		.subvendor = 0x2222, .subdevice = 0x1111,
> +	},
> +	{
> +		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
> +		.vendor = PCI_VENDOR_ID_INTEL,
> +		.device = PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI,
> +		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
> +	},
> +	{
> +		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
> +		.vendor = PCI_VENDOR_ID_INTEL,
> +		.device = PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI,
> +		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
> +	},
> +
> +	/* Thunderbolt 3 */
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_NHI) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_NHI) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_USBONLY_NHI) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_NHI) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_USBONLY_NHI) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_NHI) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_NHI) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_USBONLY_NHI) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ICL_NHI0),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ICL_NHI1),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	/* Thunderbolt 4 */
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_NHI0),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_NHI1),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_H_NHI0),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_H_NHI1),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADL_NHI0),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADL_NHI1),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPL_NHI0),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPL_NHI1),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_M_NHI0),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_P_NHI0),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_P_NHI1),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_LNL_NHI0),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_LNL_NHI1),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_M_NHI0),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_M_NHI1),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_P_NHI0),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_P_NHI1),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_WCL_NHI0),
> +	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_80G_NHI) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_40G_NHI) },
> +
> +	/* Any USB4 compliant host */
> +	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_USB4, ~0) },
> +
> +	{ 0,}
> +};
> +
> +MODULE_DEVICE_TABLE(pci, nhi_ids);
> +MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
> +MODULE_LICENSE("GPL");
> +
> +static struct pci_driver nhi_driver = {
> +	.name = "thunderbolt",
> +	.id_table = nhi_ids,
> +	.probe = nhi_pci_probe,
> +	.remove = nhi_pci_remove,
> +	.shutdown = nhi_pci_remove,
> +	.driver.pm = &nhi_pm_ops,
> +};
> +
> +static int __init nhi_init(void)
> +{
> +	int ret;
> +
> +	ret = tb_domain_init();
> +	if (ret)
> +		return ret;
> +
> +	ret = pci_register_driver(&nhi_driver);
> +	if (ret)
> +		tb_domain_exit();
> +
> +	return ret;
> +}
> +
> +static void __exit nhi_unload(void)
> +{
> +	pci_unregister_driver(&nhi_driver);
> +	tb_domain_exit();
> +}
> +
> +rootfs_initcall(nhi_init);
> +module_exit(nhi_unload);
> diff --git a/drivers/thunderbolt/pci.h b/drivers/thunderbolt/pci.h
> new file mode 100644
> index 000000000000..8ce272a10661
> --- /dev/null
> +++ b/drivers/thunderbolt/pci.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __TBT_PCI_H
> +#define __TBT_PCI_H

__TB_PCI_H

> +
> +#include <linux/types.h>
> +
> +void nhi_pci_start_dma_port(struct tb_nhi *nhi);
> +void nhi_pci_complete_dma_port(struct tb_nhi *nhi);
> +int nhi_pci_ring_request_msix(struct tb_ring *ring, bool no_suspend);
> +void nhi_pci_ring_release_msix(struct tb_ring *ring);
> +bool nhi_pci_is_present(struct tb_nhi *nhi);
> +void nhi_pci_shutdown(struct tb_nhi *nhi);
> +int nhi_pci_init_msi(struct tb_nhi *nhi);

And sinse these are already callbacks no need to expose in this header.

> +
> +#endif
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 0680209e349c..9647650ee02d 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -209,32 +209,6 @@ static int nvm_authenticate_device_dma_port(struct tb_switch *sw)
>  	return -ETIMEDOUT;
>  }
>  
> -static void nvm_authenticate_start_dma_port(struct tb_switch *sw)
> -{
> -	struct pci_dev *pdev = to_pci_dev(sw->tb->nhi->dev);
> -	struct pci_dev *root_port;
> -
> -	/*
> -	 * During host router NVM upgrade we should not allow root port to
> -	 * go into D3cold because some root ports cannot trigger PME
> -	 * itself. To be on the safe side keep the root port in D0 during
> -	 * the whole upgrade process.
> -	 */
> -	root_port = pcie_find_root_port(pdev);
> -	if (root_port)
> -		pm_runtime_get_noresume(&root_port->dev);
> -}
> -
> -static void nvm_authenticate_complete_dma_port(struct tb_switch *sw)
> -{
> -	struct pci_dev *pdev = to_pci_dev(sw->tb->nhi->dev);
> -	struct pci_dev *root_port;
> -
> -	root_port = pcie_find_root_port(pdev);
> -	if (root_port)
> -		pm_runtime_put(&root_port->dev);
> -}
> -
>  static inline bool nvm_readable(struct tb_switch *sw)
>  {
>  	if (tb_switch_is_usb4(sw)) {
> @@ -260,6 +234,7 @@ static inline bool nvm_upgradeable(struct tb_switch *sw)
>  
>  static int nvm_authenticate(struct tb_switch *sw, bool auth_only)
>  {
> +	struct tb_nhi *nhi = sw->tb->nhi;
>  	int ret;
>  
>  	if (tb_switch_is_usb4(sw)) {
> @@ -276,7 +251,8 @@ static int nvm_authenticate(struct tb_switch *sw, bool auth_only)
>  
>  	sw->nvm->authenticating = true;
>  	if (!tb_route(sw)) {
> -		nvm_authenticate_start_dma_port(sw);
> +		if (nhi->ops && nhi->ops->pre_nvm_auth)
> +			nhi->ops->pre_nvm_auth(nhi);
>  		ret = nvm_authenticate_host_dma_port(sw);
>  	} else {
>  		ret = nvm_authenticate_device_dma_port(sw);
> @@ -2745,6 +2721,7 @@ static int tb_switch_set_uuid(struct tb_switch *sw)
>  
>  static int tb_switch_add_dma_port(struct tb_switch *sw)
>  {
> +	struct tb_nhi *nhi = sw->tb->nhi;
>  	u32 status;
>  	int ret;
>  
> @@ -2804,8 +2781,10 @@ static int tb_switch_add_dma_port(struct tb_switch *sw)
>  	 */
>  	nvm_get_auth_status(sw, &status);
>  	if (status) {
> -		if (!tb_route(sw))
> -			nvm_authenticate_complete_dma_port(sw);
> +		if (!tb_route(sw)) {
> +			if (nhi->ops && nhi->ops->post_nvm_auth)
> +				nhi->ops->post_nvm_auth(nhi);
> +		}
>  		return 0;
>  	}
>  
> @@ -2819,8 +2798,10 @@ static int tb_switch_add_dma_port(struct tb_switch *sw)
>  		return ret;
>  
>  	/* Now we can allow root port to suspend again */
> -	if (!tb_route(sw))
> -		nvm_authenticate_complete_dma_port(sw);
> +	if (!tb_route(sw)) {
> +		if (nhi->ops && nhi->ops->post_nvm_auth)
> +			nhi->ops->post_nvm_auth(nhi);
> +	}
>  
>  	if (status) {
>  		tb_sw_info(sw, "switch flash authentication failed\n");
> 
> -- 
> 2.54.0

