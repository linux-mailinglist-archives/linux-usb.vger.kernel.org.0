Return-Path: <linux-usb+bounces-35542-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEjTC4tDxmlRIAUAu9opvQ
	(envelope-from <linux-usb+bounces-35542-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 09:44:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 883DA3413BA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 09:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 671D5300D975
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 08:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6364A3D8127;
	Fri, 27 Mar 2026 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdwmAEK9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAF93D9054;
	Fri, 27 Mar 2026 08:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601002; cv=none; b=Kjtfw+fCgLJvxL/ywna2fWSTXQVmH9lk4WOLzriMRcvUhuikFdM30QVgVErNnuUns9akpMxDJQ5l2ZiLPt5KGjrM4abq1YmSWUz5A/VfdxE6ZKz6CaPC2zhsJu7NaI+faaZ1IJG9rjh5lcwVNFDK7ue4VqxtuXqzaClOo9xvb3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601002; c=relaxed/simple;
	bh=uSAEwv+P0NWX+V8A9QMICb6Q1yjjMb/K72DG65M/P6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZZ7AwMBdX2PCgriEHUd82uWh6m3az82cdJgINKO+gkN3YA7jddAU5BOZIeCorzDrUw4DQnjXG7/B+iRGRqSdmwmswL+l8fqNSyI0F1da9Hku4EKTrTHxYPccUguzO208qyMWOv9hNBJbUlEkt+Q/yB6KJ10vwbhM3b/bthKdlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdwmAEK9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECFFC19423;
	Fri, 27 Mar 2026 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774601002;
	bh=uSAEwv+P0NWX+V8A9QMICb6Q1yjjMb/K72DG65M/P6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CdwmAEK9/IFM+EMSgv+GZ9ZiT76lRLLB86oWqQrq7C2uu9OiZLoSUXMc5BIsA0J00
	 IBMD0wPdVdFw4GyPS2ZKEvPE4iHbRUP/T2GgfjNh+seLgDT2o54Z6zZWTUt/k8nRlc
	 BF8aTp5KdnIH2qwAsAPnfy3OeORNSRCOj8UuzNJ+5UziM0BxVWkPCGEK2SvUxmVv+o
	 D+Xpgtx/RoNNYEJ29wK0jydMrqjUvCT1kCUWo+KywHkKhxUy2T2al3sO5Lqb6NVilB
	 f1dFDPvgKgA1A7bA2qCxhjUqluqXr+Ds1KHhO57uUaEkxyDQJekZ1WZrn67Izo3csm
	 JuATilun0kMpQ==
Date: Fri, 27 Mar 2026 17:43:19 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, hao.li@linux.dev,
	cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
	linux@roeck-us.net, andy.shevchenko@gmail.com, hch@lst.de,
	Jeff.kirsher@gmail.com, Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] mm/slab: align kmalloc to cacheline when DMA API
 debugging is active
Message-ID: <acZDJ4Nfw4x7HCSr@hyeyoo>
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
 <acYlxRBhSMcwBnja@hyeyoo>
 <CABXGCsMTk6kDuJxsTAUKP6npTvp4X6Ryng+P4xjMUsPbTA43+Q@mail.gmail.com>
 <acY5G-lKZQEsUbRw@hyeyoo>
 <CABXGCsPQo=Npum2aHet3QkZWkWEnEVMAw0KQ1AHPrNjMn=9bmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABXGCsPQo=Npum2aHet3QkZWkWEnEVMAw0KQ1AHPrNjMn=9bmA@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35542-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de,arm.com];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 883DA3413BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 01:07:21PM +0500, Mikhail Gavrilov wrote:
> On Fri, Mar 27, 2026 at 1:00 PM Harry Yoo (Oracle) <harry@kernel.org> wrote:
> >
> > But dma_get_cache_alignment() < L1_CACHE_BYTES means the architecture
> > actually allows overlapping cachelines, no?
> 
> Hi Harry,
> 
> On x86_64, dma_get_cache_alignment() returns L1_CACHE_BYTES (both
> are 64). The condition (dma_get_cache_alignment() < L1_CACHE_BYTES)
> would be false, so the check wouldn't suppress the warning.

How does dma_get_cache_alignment() return L1_CACHE_BYTES when
x86_64 doesn't define ARCH_HAS_DMA_MINALIGN?

> The problem isn't that the architecture allows overlapping --

Probably what I said was misleading...

I didn't mean "the architecture is fine with overlapping cacheline".

I meant "not defining ARCH_DMA_MINALIGN or defining it as smaller than
L1_CACHE_BYTES is how architectures tell kmalloc subsystem that
kmalloc objects don't have to be aligned with cacheline size."

> it's that kmalloc returns 8-byte aligned buffers that happen to land in
> the same 64-byte cacheline.
> The DMA debug code correctly identifies that two DMA mappings share
> a cacheline, but on coherent platforms this is harmless.

That happens only when the architecture can live with that.

> Adding a dev_is_dma_coherent() check in dma-debug would fix x86
> but would also silence the warning for any coherent device, including
> ones behind IOMMUs that might have non-coherent paths.

Sorry, I don't understand where the idea of adding a
dma_is_dma_coherent() check comes from ...

> That's why Alan's conclusion was that fixing the allocator side is safer --
> it doesn't weaken any debug checks, it just ensures the situation
> never arises.

-- 
Cheers,
Harry / Hyeonggon

