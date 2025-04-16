Return-Path: <linux-usb+bounces-23022-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35AEA87855
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 09:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 359013ACC73
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 07:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA00B1B0439;
	Mon, 14 Apr 2025 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eHztPWAo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0104C1A2393
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 07:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614145; cv=none; b=BYsZh1kjKiBe+BWoKwlWXcjO7O5getXyWdntbyECBKCzUBsdNS5PybwGNPgcZslmpTTu/hhriq2Kphrx9f07DoBu/JQ9BXAaiSh9IrhXUzMD9e51wDhhwv1s0qievUWfmGz3YS6AegYGIv0YKw3d2RbjbQt2kfLo7gR53xOT43w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614145; c=relaxed/simple;
	bh=Hc7HcOE9e2xfwS+Yba+9po+qM0E+ToXA3rlLr2utogk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EO7hLJkTF/EGUWXPc5W+aOwC32raeAHUcJVBIwX9A6HNE3hyDn73TZ/VK6dY80Gqy4d6fuXx8/bZ0dDmMeUS2TYzR8XY7ThV5oz1XAC1O9cq8lf28BhDEmj+WeH7g6lwYVcNqXAiYH6DgH0ybqCgNLkHVZdQmLsT/w5VFj0l4JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eHztPWAo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so3432295e9.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 00:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744614141; x=1745218941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3AXJB7X8cY2GlpTWLWV9SYL5rD0/oReCy7Pl2X2GUw=;
        b=eHztPWAoVSbJ6oPGZJJofnT8RCARIW0C0olL+3js6PhoaJuLIdnnPp101mcZGlKYyS
         6EQx/YQvqgjFg0VnXxJLE4AHUlTLg4qHPRGMVvkGpoIXDYHY8flunRLyodYxj1yD8lDR
         axG2ZfLgqzYnk3n75mW7IyoSAQLGK9CdAabekDkwvBvgo4B6bkOoMDQpkwDXXSyKYqzD
         hp+mO7aRop22MfDguGmv0tKCpeO3uf+DzGXryR5QyDYVpPd6kacrNBF9kYxqV8s1u59z
         AmuM+z88PfNsY6OL6VOWY2eH0c1rLoVu72SEUrfMEIw3674KCr035pOPE8YfCftBRjAS
         rBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744614141; x=1745218941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3AXJB7X8cY2GlpTWLWV9SYL5rD0/oReCy7Pl2X2GUw=;
        b=kpLGlKg5++CoSBPEquHWyuOmZQr2HEgb46B01RiKnbXBhcoQRWuEQEJ+wxWPwg2J59
         RG72wFVpmw7/lIVQYsKu60wV92R2LuQZ9svFH+yAMfH1gOM5jr9ydBPZth1yKMMs0kWI
         PYPg4qzSQnLDbQ5LbmdAQ8lhbiUguV32dnEWbPlE0Ult72f21nox3jtnEJPFl6uQ1zY7
         eKcAwY+M4RrqROXa5WJXiQVWh3f22LznDsvfdKqlJFENl1Jm+gnQOUn3qQwZtKYs3Xdr
         9oe2fHX0MftEaGziNDfJKt7hp7Hj+fUUCLdAb89Btd6Oge0f7U+XfG+9dVtu3dKhDegB
         V9Fg==
X-Gm-Message-State: AOJu0Ywvnxh584kBbxt5B0C5RltmKlinx7C5XjLTZzKvDXkvUcU5iZnw
	6Lo0HJY+JC1duMG/zd0kX3WHpPi+jmVeBnOYFVJuv5EL7u+GHdKV9ljOdSCdyMsp6zffoWc6mAf
	xl7Q=
X-Gm-Gg: ASbGncv+wzgkpDyZhaRmElchZlbr8z1Nfn+gIziTk5eKEEpbUdlUF/r2IOSpzGuqAca
	7UX2rk73VWiD9ohNRFHmku2crEK0LDj1ryVTQy293hROQVPZY1e8RyghmMAvTEzK4wWuuAVKeZ5
	ATQ37VN9QhLyaP+dtLbiFTVoXYPUdaIq2HXZmMKSs0GB40cmdrI2XvGpsLj/ekBXYNm1CQ5D/gm
	tvihOGHADG1h16tW38sgYFcMywrzzr4sz6PR/tcpMkACMHTGE7nZwo7kYTUZMeh/lZqfhU1KvSk
	PBFrJ0ep219BQ2cTekqsly/ynWDrQwXfiEjNi3DpmWcLe6HXll+7dVCxjNeJp6gTiwVBrKS4ZhK
	94wADvWS8JNptXaR/Z8UPViQlMSzZ9A==
X-Google-Smtp-Source: AGHT+IHyNrwMNo+boqaLv+S+QNIOgUAKK+VbCzvu2zd1VIPFeUBLeP2NNN4mZ+Ov53shAuAsjV/NjA==
X-Received: by 2002:a05:600c:350b:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-43f3a9ab022mr37603105e9.4.1744614141124;
        Mon, 14 Apr 2025 00:02:21 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f36558b21sm117882355e9.18.2025.04.14.00.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 00:02:20 -0700 (PDT)
Date: Mon, 14 Apr 2025 09:02:16 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
Message-ID: <20250414090216.596ebd11@mordecai>
In-Reply-To: <2025041110-starch-abroad-5311@gregkh>
References: <20250320154733.392410-1-ptesarik@suse.com>
	<20250325134000.575794-1-ptesarik@suse.com>
	<2025041110-starch-abroad-5311@gregkh>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.48; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Apr 2025 15:57:19 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Mar 25, 2025 at 02:40:00PM +0100, Petr Tesarik wrote:
> > Remove a misleading comment and issue a warning if a zone modifier is
> > specified when allocating a hcd buffer.
> > 
> > There is no valid use case for a GFP zone modifier in hcd_buffer_alloc():
> > - PIO mode can use any kernel-addressable memory
> > - dma_alloc_coherent() ignores memory zone bits
> > 
> > This function is called by usb_alloc_coherent() and indirectly by
> > usb_submit_urb(). Despite the comment, no in-tree users currently pass
> > GFP_DMA.
> > 
> > Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> > ---
> >  drivers/usb/core/buffer.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
> > index 87230869e1fa..10844cd42e66 100644
> > --- a/drivers/usb/core/buffer.c
> > +++ b/drivers/usb/core/buffer.c
> > @@ -108,10 +108,6 @@ void hcd_buffer_destroy(struct usb_hcd *hcd)
> >  }
> >  
> >  
> > -/* sometimes alloc/free could use kmalloc with GFP_DMA, for
> > - * better sharing and to leverage mm/slab.c intelligence.
> > - */
> > -
> >  void *hcd_buffer_alloc(
> >  	struct usb_bus		*bus,
> >  	size_t			size,
> > @@ -128,6 +124,12 @@ void *hcd_buffer_alloc(
> >  	if (hcd->localmem_pool)
> >  		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);
> >  
> > +	/*
> > +	 * Zone modifiers are ignored by DMA API, and PIO should always use
> > +	 * GFP_KERNEL.
> > +	 */
> > +	WARN_ON_ONCE(mem_flags & GFP_ZONEMASK);  
> 
> You just rebooted the box if this happens, do you REALLY want to do
> that?  People generally do not like their data lost :(

FWIW my box does not reboot on a warning. But I admit there are people
who want to run their systems with panic_on_warn (although I suspect
they already experience some sudden reboots, so they had better be
prepared).

> Why not just fix the callers, OR if this really isn't going to be
> allowed, return an error and just fail the whole submission?  And stick
> around to fix up all of the drivers that end up triggering this...

That's the point. AFAICS there are _no_ in-tree callers that would pass
GFP_DMA or GFP_DMA32 to hcd_buffer_alloc(), directly or indirectly. But
nobody should be tempted to add the flag, because I cannot imagine how
that would ever be the right thing to do.

I can change it back to mem_flags &= ~GFP_ZONEMASK to fix it silently;
I simply thought that driver authors may appreciate a warning that
they're trying to do something silly.

Whatever works for you, but please keep in mind that there seems to be
agreement among mm people that DMA and DMA32 zones should be removed
from the kernel eventually.

Petr T

