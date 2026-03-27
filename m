Return-Path: <linux-usb+bounces-35545-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EjAAq9ixmm+JAUAu9opvQ
	(envelope-from <linux-usb+bounces-35545-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 11:57:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF94342F75
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 11:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA7D230CE301
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 10:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB1A3DFC7D;
	Fri, 27 Mar 2026 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Opuy95OD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111213DEAEE;
	Fri, 27 Mar 2026 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607996; cv=none; b=etV9+RZNLNR1kgze9McAA+MflYOKRSbzUakDuUul4iTug7Gig6NefAtvqsu5iChCDZdpIpdTsChgykM0781Y0laoMnodOBsR64y4Pzzh9DyZTzjoF1rRxY7g9poGejDhkRs/XU3NWtmhmX4AvzMBru7w2PYLm7GbQmn4W9ox++0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607996; c=relaxed/simple;
	bh=AIVP9bcyyKqreECc+J/GC0UaewkHPBsWqu8hYlrdtTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7maUjsOZya6Mg4DXL/VlKsf9iXOwH9rs+tjxi3huNmpvp+QufKHeLWXQQUaXX/BqL3hm9MDv4xGIL/3aCnbQXdqbyPa3aKEyaKJGyfkQVHkrXWnCKhNXHBCB2CSMcOuCoGW25ijkb4qOzzFi42YwuElOdCzhvQd+DXtkbX49B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Opuy95OD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69763C19423;
	Fri, 27 Mar 2026 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774607995;
	bh=AIVP9bcyyKqreECc+J/GC0UaewkHPBsWqu8hYlrdtTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Opuy95ODt7LQ+ufn6YZUfsHjQFOj5mQ0x7Dg2hxD8OIqYuFZrmzUF5EWQaf7v/MwT
	 r0hkmHYgFTjbEWIoWRtVwlQTdXf7LetjaUcHPdNJ3YJ8RtrQAPW8fDdGqSPXWIr7Jn
	 STHtG8NrjmJXT1UlNaUtQInSjyK7psKHvoTp63zEeD4TQKPomdRMOeX/TPoiZWo3+v
	 AwH5Koh8kd87dgHNUXAwLMp/xCVXpIpsIPMa3XURId6FPb+WxVbNWQKOwMwHALvBOG
	 /7bDnfhpO47SSWljBU7nlQB5bUEXxl6FPSjRgd2eC1/1L9g7Ldmz57hLRSHDTph39N
	 iWxN0JpCVGBMA==
Date: Fri, 27 Mar 2026 19:39:53 +0900
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
Message-ID: <acZeeYA_UbaK7AVd@hyeyoo>
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
 <acYlxRBhSMcwBnja@hyeyoo>
 <CABXGCsMTk6kDuJxsTAUKP6npTvp4X6Ryng+P4xjMUsPbTA43+Q@mail.gmail.com>
 <acY5G-lKZQEsUbRw@hyeyoo>
 <CABXGCsPQo=Npum2aHet3QkZWkWEnEVMAw0KQ1AHPrNjMn=9bmA@mail.gmail.com>
 <acZDJ4Nfw4x7HCSr@hyeyoo>
 <CABXGCsO_C8++4+oPfZ+bQyrBnEGy5JFpXHkGNpfy+8=5BvVNfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABXGCsO_C8++4+oPfZ+bQyrBnEGy5JFpXHkGNpfy+8=5BvVNfg@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35545-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6DF94342F75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 03:25:00PM +0500, Mikhail Gavrilov wrote:
> On Fri, Mar 27, 2026 at 1:43 PM Harry Yoo (Oracle) <harry@kernel.org> wrote:
> >
> > Probably what I said was misleading...
> >
> > I didn't mean "the architecture is fine with overlapping cacheline".
> >
> > I meant "not defining ARCH_DMA_MINALIGN or defining it as smaller than
> > L1_CACHE_BYTES is how architectures tell kmalloc subsystem that
> > kmalloc objects don't have to be aligned with cacheline size."
> 
> Hi Harry,

Hi Mikhail,

> You're right, I was wrong about dma_get_cache_alignment() -- on
> x86_64 without ARCH_HAS_DMA_MINALIGN it returns 1, not
> L1_CACHE_BYTES.  Sorry for the confusion.

Don't worry!

> So your suggestion to suppress the warning in dma-debug when
> dma_get_cache_alignment() < L1_CACHE_BYTES would indeed work
> on x86_64 and other coherent platforms.

Thanks for confirming.

> I don't have a strong preference either way.  Both approaches
> solve the problem:
> 
>   - slab side: prevents the overlap from happening
>   - dma-debug side: tolerates the overlap when the arch says
>     cacheline alignment isn't required for DMA
> 
> Would you prefer I send a v2 with the dma-debug approach instead?

Yes please. I think keeping the same behavior regardless of the debug
option will be better in the long term.

> Happy to go whichever direction the maintainers prefer.

Thanks a lot for working on this!

-- 
Cheers,
Harry / Hyeonggon

