Return-Path: <linux-usb+bounces-23026-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637FCA87996
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 09:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28B8A3ACD59
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 07:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F147D258CF2;
	Mon, 14 Apr 2025 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HJjkdySB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1080D2586EA
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 07:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617440; cv=none; b=TBNw5sBRBKy1A291NiXuOpTxwFxaxtjXmYSr/0bpVaiCLd5PTdfuxmJPYarD/8qOhWfuRJ6+1mCf0u03sea1xZXvs7CS77mOKJ7EqsI1JLG6IxfqIpADMz8Skbjr51KnsjGg3Kcm43a80KQAUQREJx3ZowT+dR/ZBEooJPd0aCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617440; c=relaxed/simple;
	bh=zYOOAj0RHOC2nMeK3NzMZ540J6d7eLtu46RSTkpcy2c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkMImn8rOaTi/W2c2FZ0HpHop5PPnbHFcxgb/+vdyRScugTPBOJGpGSTWGRqSCZ8EjGP3+ZRUH+nrna9X6FHMulU0+IQyLk+Ixsw5Ia3zCJnaB/mXGf9ngpjp2QbdGURIJO7K18KDq+JrG1r7Ul7tdzodGx6Eu1GputMr6LRNQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HJjkdySB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso5213495e9.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 00:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744617436; x=1745222236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9TBTlTPn5k+6QG+FEmRz5qBtdMYH+ZZpLD3hItH2sU=;
        b=HJjkdySBvfsXJY+HPlwz/7+UjP6w6KveZmLHV59gsmFN8x5fYA31ThwojMisw3dNrf
         0gWgu/WjhAp37w3+LejHE6R3Ms84nSWW52GGflSof0OmVkctxZB26aSNL5CVibTWGyBK
         blxhXfPO9J/hNa+E9aMI+O4TDjoVvH2U+7RajUJSzeA2BZmischSwrBOfPz19bLm4njZ
         aS6jwaUZQS4qGixZIyCbAuI5LY1pPBzxeTCX5h+yPDHZgcy2tw6h+M6HXqSv2cK5udHS
         QmWWLHloZlUZM1outYzIu8mk6lf2hx4iyRxrWPEtELFikmFjiU+prI9bF6ATLzIzYSU4
         Uh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744617436; x=1745222236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9TBTlTPn5k+6QG+FEmRz5qBtdMYH+ZZpLD3hItH2sU=;
        b=OSy5hg2oilQJp3R7xoLwwc/GB2PeHgPHF4yOl6go7KrrpOVwPMwGCap8CqB7mvbdIF
         wD8b4VHLaSNPfHKnVNvrq+hTRmu2pv8aiUaboGZldxhOI900zZa7xZWqzbZCyc5MtuTd
         A50c0pf+m9LYxT6hprbWKugbE8URcG2s3dVr+ZufUSkt0C2pkvO+vFy4U8lmiRxmCABJ
         U2Bbe9vw7oRERj+mm6H7eutBRqPB0Z2yO2078wEjdvkm2KG08Z7oNd7EVKtf5kN6sM90
         44QAfL5KbXoGeA0WZDkgufd9xAeSyNTRkYe9Rg83AFnfuAPnkuuMrpeyqkK9Tl2QaywW
         K6Jw==
X-Gm-Message-State: AOJu0YyFzyg6RbRpL64wbbVTfWsXFiunWkFHs7DjEcDCfuAgPeqQDgNW
	7vjuEQpgny/dNq2aDOHRibiOCHRpJEjLp3dtqCxNXpemaNRP9lBYJ8+7yZGvE74=
X-Gm-Gg: ASbGnctrVrUBA2rO1pcOWUOgqDYutN64f2pLaBqj5L90T49PA4RkyeAeCweX2bylYlM
	tCMsr039pmcALjq2GTw74GU1vGB/di1fduzFSFioacb0S+Ye5CbC88IP0kK9Fkdsxap+WneTJJ4
	WqnE8VbLZDUsFPmKNOk96+cIt3sJAF3E9zG/RBpSaAeXAGZSZQrwt5eoV6TeyCNWPuAzgiRSgPK
	Q8cbPQlk3DMf6RyvETIiZtedqpAqttj6DUoW/58vs7HoaV0OuqvAdKI5foxLfuHfyJclt1lHi2H
	/bQhiG6LMnUq+k/oPCoqFCsIhQJCEme9ykDX7mTxe7Q1DcZ8gsUnqXtWY6lg6aW8u27fddM6OUk
	N7AW5N2YdZCz1CKU7VddeUW4H9jKrHA==
X-Google-Smtp-Source: AGHT+IEHEJmSjyiFOaDSx9GQT25mhDZpVpyEBgKpB2LtRy+t8V5JfJINp3oXiD0uRKLllt01N0flyg==
X-Received: by 2002:a05:600c:548e:b0:43b:c938:1d0e with SMTP id 5b1f17b1804b1-43f3a923582mr36561905e9.2.1744617436218;
        Mon, 14 Apr 2025 00:57:16 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23158849sm172700255e9.0.2025.04.14.00.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 00:57:15 -0700 (PDT)
Date: Mon, 14 Apr 2025 09:57:12 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
Message-ID: <20250414095712.471779f5@mordecai>
In-Reply-To: <2025041424-delay-distill-50b8@gregkh>
References: <20250320154733.392410-1-ptesarik@suse.com>
	<20250325134000.575794-1-ptesarik@suse.com>
	<2025041110-starch-abroad-5311@gregkh>
	<20250414090216.596ebd11@mordecai>
	<2025041424-delay-distill-50b8@gregkh>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.48; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Apr 2025 09:12:09 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Mon, Apr 14, 2025 at 09:02:16AM +0200, Petr Tesarik wrote:
> > On Fri, 11 Apr 2025 15:57:19 +0200
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> >   
> > > On Tue, Mar 25, 2025 at 02:40:00PM +0100, Petr Tesarik wrote:  
> > > > Remove a misleading comment and issue a warning if a zone modifier is
> > > > specified when allocating a hcd buffer.
> > > > 
> > > > There is no valid use case for a GFP zone modifier in hcd_buffer_alloc():
> > > > - PIO mode can use any kernel-addressable memory
> > > > - dma_alloc_coherent() ignores memory zone bits
> > > > 
> > > > This function is called by usb_alloc_coherent() and indirectly by
> > > > usb_submit_urb(). Despite the comment, no in-tree users currently pass
> > > > GFP_DMA.
> > > > 
> > > > Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> > > > ---
> > > >  drivers/usb/core/buffer.c | 10 ++++++----
> > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
> > > > index 87230869e1fa..10844cd42e66 100644
> > > > --- a/drivers/usb/core/buffer.c
> > > > +++ b/drivers/usb/core/buffer.c
> > > > @@ -108,10 +108,6 @@ void hcd_buffer_destroy(struct usb_hcd *hcd)
> > > >  }
> > > >  
> > > >  
> > > > -/* sometimes alloc/free could use kmalloc with GFP_DMA, for
> > > > - * better sharing and to leverage mm/slab.c intelligence.
> > > > - */
> > > > -
> > > >  void *hcd_buffer_alloc(
> > > >  	struct usb_bus		*bus,
> > > >  	size_t			size,
> > > > @@ -128,6 +124,12 @@ void *hcd_buffer_alloc(
> > > >  	if (hcd->localmem_pool)
> > > >  		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);
> > > >  
> > > > +	/*
> > > > +	 * Zone modifiers are ignored by DMA API, and PIO should always use
> > > > +	 * GFP_KERNEL.
> > > > +	 */
> > > > +	WARN_ON_ONCE(mem_flags & GFP_ZONEMASK);    
> > > 
> > > You just rebooted the box if this happens, do you REALLY want to do
> > > that?  People generally do not like their data lost :(  
> > 
> > FWIW my box does not reboot on a warning. But I admit there are people
> > who want to run their systems with panic_on_warn (although I suspect
> > they already experience some sudden reboots, so they had better be
> > prepared).  
> 
> There are billions of Linux systems out there with panic-on-warn enabled :(
> 
> > > Why not just fix the callers, OR if this really isn't going to be
> > > allowed, return an error and just fail the whole submission?  And stick
> > > around to fix up all of the drivers that end up triggering this...  
> > 
> > That's the point. AFAICS there are _no_ in-tree callers that would pass
> > GFP_DMA or GFP_DMA32 to hcd_buffer_alloc(), directly or indirectly. But
> > nobody should be tempted to add the flag, because I cannot imagine how
> > that would ever be the right thing to do.
> > 
> > I can change it back to mem_flags &= ~GFP_ZONEMASK to fix it silently;
> > I simply thought that driver authors may appreciate a warning that
> > they're trying to do something silly.  
> 
> A warning is fine, but don't reboot a box please.  dev_warn() with a
> ratelimit and then return an error perhaps?

If we're concerned about breaking existing systems in the wild, then we
should merely issue a warning that the flag is ignored. So, probably a
ratelimited dev_warn() and continue operation.

> > Whatever works for you, but please keep in mind that there seems to be
> > agreement among mm people that DMA and DMA32 zones should be removed
> > from the kernel eventually.  
> 
> I agree, they should be removed as they don't do what people think they
> do.  So why not just remove them entirely, otherwise are you going to go
> and add this type of checking to all bus subsystems?

I'm kind of testing grounds here. But yes, I'm browsing all in-tree
occurrences of GFP_DMA and GFP_DMA32, looking for corner cases that
may break. So far, I have found exactly one user of the DMA zone who
appears to be quite right: s390 I/O channels to cope with the legacy
31-bit addressing of the CCW instruction. JFYI.

Petr T

