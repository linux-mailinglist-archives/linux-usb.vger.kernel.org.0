Return-Path: <linux-usb+bounces-35539-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBGeJDU6xmm7HgUAu9opvQ
	(envelope-from <linux-usb+bounces-35539-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 09:05:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 004AE340BF2
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 09:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7842C3018598
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 08:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120AB3CCFBA;
	Fri, 27 Mar 2026 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMzp/MVP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF03CA4B4;
	Fri, 27 Mar 2026 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598430; cv=none; b=VE+ilrlov6YWrNiJh09x6blgLYeMnzbqkBUUWMbHWEjo+1ThXz0uQse46TxPzaGlusn5DArBZ996s6v8wAVGUFe1+v6zbR1y9kw2efvTbsERhIl8meUYCZWKC+oEOmRKtEJW8wm2ltWuWty2gwaIe2MzmL52FbFY8ct5I3Ls8xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598430; c=relaxed/simple;
	bh=UwiT4eozaNGhaqFAauKAmgowg7gYec1LshvaOOfoH98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhWTUQ7NtOrJ81CNJn9Owu9PtArUOFAU9tS3rj94IZZqooE2PU+hHsIWAxGK5QnlCbdb8t28mbQHYtN5SMfdh8q3xUyCMhZJsRFdp1BLRhrkTWaP7AwHJEVfF1Q498WfE6tBoBauetI34J11qvVQRBXNrfaBglUpLstPxg2HJfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMzp/MVP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817F2C19423;
	Fri, 27 Mar 2026 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774598429;
	bh=UwiT4eozaNGhaqFAauKAmgowg7gYec1LshvaOOfoH98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AMzp/MVPmPrMezJQOn1mDo5LbPa0YLeYE9UEXhRtDjY761/eB6HLSdUWo0k4iudr2
	 THtMHRLbROmmOI9KZrwzdmsJ6gh7yTMDPscEk/RomiGW8sOv93Er7o6APa6N/E0DRq
	 t2i/tWzBCaBv/NGniY6Wi5Lh13A3njCwJIxTSvU3bMFDQtinLe9H3pIUbOuoEGYrsw
	 l/o5a82T9A1KUIklrp6f2umrcYamik9UYi6skrdYy0rfIH2LR0QH3EbqgR1Ryqx3ib
	 RBfCEdSdBhnzq0K4STJ1DRkIn67MSohEnbSIOigrsd53k4/yf2+jKNKrEfrLBL2yiE
	 N0m1ObfRtkHWA==
Date: Fri, 27 Mar 2026 17:00:27 +0900
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
Message-ID: <acY5G-lKZQEsUbRw@hyeyoo>
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
 <acYlxRBhSMcwBnja@hyeyoo>
 <CABXGCsMTk6kDuJxsTAUKP6npTvp4X6Ryng+P4xjMUsPbTA43+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABXGCsMTk6kDuJxsTAUKP6npTvp4X6Ryng+P4xjMUsPbTA43+Q@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35539-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de,arm.com];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 004AE340BF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:50:07AM +0500, Mikhail Gavrilov wrote:
> On Fri, Mar 27, 2026 at 11:38 AM Harry Yoo (Oracle) <harry@kernel.org> wrote:
> >
> > On Fri, Mar 27, 2026 at 10:58:46AM +0500, Mikhail Gavrilov wrote:
> > > When CONFIG_DMA_API_DEBUG is enabled, the DMA debug infrastructure
> > > tracks active mappings per cacheline and warns if two different DMA
> > > mappings share the same cacheline ("cacheline tracking EEXIST,
> > > overlapping mappings aren't supported").
> > >
> > > On x86_64, ARCH_KMALLOC_MINALIGN defaults to 8, so small kmalloc
> > > allocations (e.g. the 8-byte hub->buffer and hub->status in the USB
> > > hub driver) frequently land in the same 64-byte cacheline.  When both
> > > are DMA-mapped, this triggers a false positive warning.
> >
> > Is it feasible to suppress the warning if dma_get_cache_alignment() is
> > smaller than L1_CACHE_BYTES?
> 
> Hi Harry,

Hi Mikhail,

Please keep in mind that I have limited understanding of DMA API,
but just wanted to double check if there is (or isn't) a sane way to
fix it on dma-debug side.

> Good question. I considered the dma-debug side, but the issue is
> that the cacheline overlap check in add_dma_entry() is intentionally
> strict -- it catches real bugs on non-coherent architectures where
> two DMA buffers sharing a cacheline can corrupt data.

But dma_get_cache_alignment() < L1_CACHE_BYTES means the architecture
actually allows overlapping cachelines, no?

A non-coherent architecture where two DMA buffers sharing a cacheline
could corrupt data should define ARCH_DMA_MINALIGN >= L1_CACHE_BYTES.

I'm not sure what kind of a real bug this will hide,
or am I missing something?

> Alan Stern discussed this in the bugzilla [1] and concluded that
> the slab alignment approach "seems reasonable" [2],

As long as there's no good alternative way to fix, yeah.

> noting that turning on debugging should not affect the way the kernel
> behaves -- otherwise what you're debugging isn't the same as what normally
> happens.

Yeah, this is why I'm trying to double check if there's no feasible
alternative.

> But given the way the DMA API debugging is set up, I don't
> see any alternative."

I'm trying to say adding the (dma_get_cache_alignment() <
L1_CACHE_BYTES) check might be considered as an alternative ;)
 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=215740#c31
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=215740#c44

-- 
Cheers,
Harry / Hyeonggon

