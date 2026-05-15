Return-Path: <linux-usb+bounces-37464-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDAjMgG9BmqMnQIAu9opvQ
	(envelope-from <linux-usb+bounces-37464-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 08:28:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEDD549FD6
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 08:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8898301707F
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 06:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AF8379C31;
	Fri, 15 May 2026 06:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGDRV9er"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6251D33D6CA;
	Fri, 15 May 2026 06:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826494; cv=none; b=eFAfO2r3H0LB1xLkihZ3NJzHYYfiRSvVSOlLDKWnlM7jDtV2eev/4TziQ80vV8ntTgofhMNe5aGQzgzQu1nCDcD1xRC4avajePQr2Gr2b6GO4sC8RmpnbVuAnd1SKlA8GAhmEDePSK16B9t64faLFPRkRtKTq7YHj3LvTEHXNbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826494; c=relaxed/simple;
	bh=eJ4XuuIu+wDeSQF4BPLclirsz66JqS6/xs4Inbu0rxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNZ9O5BBDF2tWVPy7B1kvRad5qSmP7B7JHjzIgyiXztLLlyjkAtX1VlEYfd6CqwzrxBsJ6UWOmXlGU164BRhgpu4kTrFws0Y+Mdq7aJRYb758t9S2OlVgIDTPdwJ0nzG7QvCPqVcD4Gk3amfgeUEvpAxUKarmq+RTUP3pnrPd4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGDRV9er; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778826493; x=1810362493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eJ4XuuIu+wDeSQF4BPLclirsz66JqS6/xs4Inbu0rxk=;
  b=KGDRV9erqjcFCOGq3OEe4x308rIjO1QoM3J86u1UcfXoh4JbERRomOaf
   wtp+Sk+qvzk8NeYRtC1WYDBJreD2/VQrCq+MbqKSeeKYRDg8vIJAnDFWY
   IcGYPOZtGpI2dR2GbFd1uZ//ekuRzITBUh6qi4mKGGRlZRFYpYZDloUkb
   KT1+YeXqttZM76kj/t+EjYPptm/zysQ002hnCK/YZZKk4fb0IS5rj6rMH
   Nq6KmQ1qWBA+oMdBzQXkMZKDkLQDhbvEpzPgIrxBggP89mmWwhoTUxh8Z
   MWz9hUE2hv+pBx83GTG01e19zKEricWDfmE0FcNDaW0q4zEkmqGZnP2tt
   Q==;
X-CSE-ConnectionGUID: yajUA2B4QZyv1FGXW9VAZQ==
X-CSE-MsgGUID: APfm93QtQWSkY1N60j2zDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90088792"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90088792"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 23:28:13 -0700
X-CSE-ConnectionGUID: YO+1JiP+RGOLgLtu0b8UPQ==
X-CSE-MsgGUID: 9p95Kh+ORGawLkr2fRFw+A==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2026 23:28:11 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2EB0A95; Fri, 15 May 2026 08:28:10 +0200 (CEST)
Date: Fri, 15 May 2026 08:28:10 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] thunderbolt: Separate out common NHI bits
Message-ID: <20260515062810.GG84797@black.igk.intel.com>
References: <20260513-topic-usb4_nonpcie_prepwork-v3-0-b87b5e408ac7@oss.qualcomm.com>
 <20260513-topic-usb4_nonpcie_prepwork-v3-2-b87b5e408ac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-topic-usb4_nonpcie_prepwork-v3-2-b87b5e408ac7@oss.qualcomm.com>
X-Rspamd-Queue-Id: 1DEDD549FD6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37464-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Action: no action

Hi,

On Wed, May 13, 2026 at 06:23:33PM +0200, Konrad Dybcio wrote:
>  	.runtime_suspend = icl_nhi_suspend,
>  	.runtime_resume = icl_nhi_resume,
>  	.shutdown = icl_nhi_shutdown,
> +	.pre_nvm_auth = nhi_pci_start_dma_port,
> +	.post_nvm_auth = nhi_pci_complete_dma_port,
> +	.request_ring_irq = nhi_pci_ring_request_msix,
> +	.release_ring_irq = nhi_pci_ring_release_msix,
> +	.is_present = nhi_pci_is_present,
> +	.init_interrupts = nhi_pci_init_msi,

I think we can actually move all this ICL (Intel integrated prior Nova
Lake) stuff into pci.c now. This is only PCI and that way we do not need to
expose any these functions outside of pci.c.

