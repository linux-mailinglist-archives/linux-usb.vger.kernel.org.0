Return-Path: <linux-usb+bounces-37332-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PCFDvwrA2oR1QEAu9opvQ
	(envelope-from <linux-usb+bounces-37332-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 15:32:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8B95213E7
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 15:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95CBF3033CB7
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 13:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F12399D09;
	Tue, 12 May 2026 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3i6TzmA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372D73911C4;
	Tue, 12 May 2026 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592013; cv=none; b=ESfNYEEkXc5l+82NGWaM1I96kFjyjr+j3l00npV7HIcAao0r7kxQNLwdCYqI+GwgIdKj8J2IeQ6Kz0biQ8589euPAKjrQgzQglTCoLMviktw5qCa6kdWzLgrv23wxXIwmI0wmlURhciz+fzFJqLs7L5No3DVt8D96xOweE0KL1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592013; c=relaxed/simple;
	bh=sLhxOS1lY0RznxrGupVA34mAo5GUIkWU/XRFJ5S5Nz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvzbikTveB9oONuwmmFsgirOfvXHBvdJg5LJj2v0XW/bhW5Te9LpvBXhSs1KGCylVsDDCIbytuBRLKLTIB/l1EHMPW1IxjwLzCZoYqOpCNQwYJjtGthtGY3sAJ25GJ6rXsDAS+U95ThXPaaskz0sf5QReAQVY3vBrLsgbgX9pjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3i6TzmA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778592012; x=1810128012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sLhxOS1lY0RznxrGupVA34mAo5GUIkWU/XRFJ5S5Nz8=;
  b=G3i6TzmAmIZYnFn4BJDXfkq9zUwhaYxm1CY7Ebyax2I/qzqsA3DPLWTw
   bc/YCpKNirIpustOM1iAbNu5vZcdy6BE5h56Ne0wGFaeKS3yH0QIsFetj
   OO71vBscUfnXQGnwbXDbFdD0umz/w/VoB/qmV2e1SrYT8FuypmTbll3w/
   256RrjF/pe/g7TmFEBcj3tMilBJLxNuCd/7funKObuttIKxp5wtFWrrr1
   g6ZrYPH2tyISTSE/nVq3suWS5/cTl+oJeFBJ0IUrB+XST40uzCz0Go2dI
   hdLQ9yu4lYenurBronV+Kt4nQMiP2DRNkla/IhxRRdXW06do0nXwGS2OV
   A==;
X-CSE-ConnectionGUID: wXNhYCtkRkSJrW076PUb3w==
X-CSE-MsgGUID: zZ8VU43mQSWusNPba19AYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79529844"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79529844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 06:20:11 -0700
X-CSE-ConnectionGUID: XbymDcdtTo2M9DOCGHvXbw==
X-CSE-MsgGUID: tL1a4dx9SPKy2vrrvv6/lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242760979"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 12 May 2026 06:20:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 675D998; Tue, 12 May 2026 15:20:08 +0200 (CEST)
Date: Tue, 12 May 2026 15:20:08 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/4] thunderbolt: Separate out common NHI bits
Message-ID: <20260512132008.GC84797@black.igk.intel.com>
References: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
 <20260428-topic-usb4_nonpcie_prepwork-v2-2-452fb9d63f77@oss.qualcomm.com>
 <20260504065402.GB6785@black.igk.intel.com>
 <7aab3f25-7609-499a-b701-8301719b9a82@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7aab3f25-7609-499a-b701-8301719b9a82@oss.qualcomm.com>
X-Rspamd-Queue-Id: CD8B95213E7
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37332-lists,linux-usb=lfdr.de];
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
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:06:58PM +0200, Konrad Dybcio wrote:
> On 5/4/26 8:54 AM, Mika Westerberg wrote:
> > Hi,
> 
> [...]
> 
> >> +void nhi_pci_shutdown(struct tb_nhi *nhi)
> > 
> > Why these are not static?
> 
> [...]
> 
> >> +static const struct tb_nhi_ops pci_nhi_default_ops = {
> >> +	.pre_nvm_auth = nhi_pci_start_dma_port,
> >> +	.post_nvm_auth = nhi_pci_complete_dma_port,
> >> +	.request_ring_irq = nhi_pci_ring_request_msix,
> >> +	.release_ring_irq = nhi_pci_ring_release_msix,
> >> +	.shutdown = nhi_pci_shutdown,
> >> +	.is_present = nhi_pci_is_present,
> >> +	.init_interrupts = nhi_pci_init_msi,
> > 
> > You populate them here so there is no need to expose outside of pci.c.
> 
> nhi_ops.c needs them too, as they were previously called
> unconditionally for all NHI flavors

OK.

> [...]
> 
> 
> >> +/*
> >> + * During suspend the Thunderbolt controller is reset and all PCIe
> >> + * tunnels are lost. The NHI driver will try to reestablish all tunnels
> >> + * during resume. This adds device links between the tunneled PCIe
> >> + * downstream ports and the NHI so that the device core will make sure
> >> + * NHI is resumed first before the rest.
> >> + */
> >> +bool tb_apple_add_links(struct tb_nhi *nhi)
> > 
> > Okay you moved it here good. I think we can call it in nhi_pci_probe()
> > directly so no need to expose outside.
> 
> Yeah that seems like a good idea. It's already there, behind N calls
> in the software CM case.
> 
> Do we have to check the CM type though, or do you think it'd be fine
> to just call it unconditionally? (either because there are presumably
> no Apple machines with ICM or because these devlinks would be harmless?)

I think you can call it unconditionally. It only does something for TB1-2
Apple systems.

For Apple TB3 we used to start ICM firmware but this was changed as the
driver learned SW CM. However, we never setup any device links so this
would not change anything.

