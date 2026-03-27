Return-Path: <linux-usb+bounces-35533-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBVSOqcnxmnQGwUAu9opvQ
	(envelope-from <linux-usb+bounces-35533-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 07:45:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 402C833FFC5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 07:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 983D030DC4E4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 06:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8C63BED2E;
	Fri, 27 Mar 2026 06:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Twq5MyQS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93278248883;
	Fri, 27 Mar 2026 06:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774593480; cv=none; b=oVbOn3knaZYvfxr9IHZdcPlrJkinwKEwZptwV6Q8UXUEdhYzCTkOhrCzR2Y/2MbJboLV99dhDIeomozSn/9MYtOpfX8l0yoOGMVEpFa8jrzHxjzlOUR5G4Z2fgMS3UMjgbfRsd9DkQVFhO8feJXf6FYHdU6h8GwWX62JkHqDYlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774593480; c=relaxed/simple;
	bh=HrnmeLkD5wmpSf6twO0rfiroXmNXU6y77468epKlJM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODR5ed2E8ir2JrAt24f0RkREZ0M+FH4Akbb3ftwUCuHV3s9P7MDEJWAYk+5qfFKaUBbBklNZ8xpBNb0ccnp76AecyBSelIu08yCmqt20KIdbeTVVmmkkgD0srpHWtt77CGtodO17hGaXUrt4LKhhOtak9aMbpX5zXyFAuJgtRd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Twq5MyQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE55C19423;
	Fri, 27 Mar 2026 06:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774593480;
	bh=HrnmeLkD5wmpSf6twO0rfiroXmNXU6y77468epKlJM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Twq5MyQSg58Egx5BZr0+ls7uvN84oPSehGSSuE46oaLtK6++g3ZwUTDbAWifQ2nhI
	 T0nNCPjQv9YHvL7DPx5j7x/EZt0sWxlkIZYMMlAp+LOUh0ItzOQw+izPoZZaXQVTf1
	 eFeu6hWYJStwAzWoRWfoXr7jXAPHaqv8FCIzMKRyGh8x3huVr4rjPvmIg2qXzWREua
	 oTiRVKin9vO1RSpt8Fn3F/BWKxaYHEsvKGcL+sa9Jvoh7IMbk8Z5IvACVidC9qR9Xc
	 uh1Jz7g4P0rnvKOBPzenGEDoAjJq6cWrTspuTVxyBkj3J/p1BA8n7pAUdnLCej1qJ0
	 21z2oGIdTbSlg==
Date: Fri, 27 Mar 2026 15:37:57 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, hao.li@linux.dev,
	cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
	linux@roeck-us.net, andy.shevchenko@gmail.com, hch@lst.de,
	Jeff.kirsher@gmail.com
Subject: Re: [PATCH] mm/slab: align kmalloc to cacheline when DMA API
 debugging is active
Message-ID: <acYlxRBhSMcwBnja@hyeyoo>
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35533-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:email,harvard.edu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 402C833FFC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:58:46AM +0500, Mikhail Gavrilov wrote:
> When CONFIG_DMA_API_DEBUG is enabled, the DMA debug infrastructure
> tracks active mappings per cacheline and warns if two different DMA
> mappings share the same cacheline ("cacheline tracking EEXIST,
> overlapping mappings aren't supported").
>
> On x86_64, ARCH_KMALLOC_MINALIGN defaults to 8, so small kmalloc
> allocations (e.g. the 8-byte hub->buffer and hub->status in the USB
> hub driver) frequently land in the same 64-byte cacheline.  When both
> are DMA-mapped, this triggers a false positive warning.

Is it feasible to suppress the warning if dma_get_cache_alignment() is
smaller than L1_CACHE_BYTES?
 
> This has been reported repeatedly since v5.14 (when the EEXIST check
> was added) across various USB host controllers and devices including
> xhci_hcd with USB hubs, USB audio devices, and USB ethernet adapters.
> 
> Raise ARCH_KMALLOC_MINALIGN to L1_CACHE_BYTES when CONFIG_DMA_API_DEBUG
> is enabled, ensuring each kmalloc allocation occupies its own cacheline
> and eliminating the false positive.
> 
> Verified with a kernel module reproducer that performs two kmalloc(8)
> allocations back-to-back and DMA-maps both:
> 
>   Before: allocations share a cacheline, EEXIST fires within ~50 pairs
>   After:  64 pairs allocated, all in separate cachelines, no warning
> 
> Fixes: 2b4bbc6231d7 ("dma-debug: report -EEXIST errors in add_dma_entry")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215740
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Jeff Kirsher <Jeff.kirsher@gmail.com>
> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

-- 
Cheers,
Harry / Hyeonggon

