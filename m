Return-Path: <linux-usb+bounces-32230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653FD17C71
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 10:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ADDD3022A9A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 09:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33368387574;
	Tue, 13 Jan 2026 09:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeDt+e/Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158B930F949
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 09:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768297631; cv=none; b=BsKwYn+ZSfpmAAniH+BZzeu8t+cwpzZaM1gLj/CcoXKsFcL461T5554X2Y+tbSwUzuVWzcpHesXXEOWGzaqZ+cxA28Bwg8zAfYsJ6kN9Sc+AebIF7ZGKvUiqPW7Vw+BbEzi9NcBG5rXy27YmS6PEXaE2J2HRClfi/mxCyFTw4zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768297631; c=relaxed/simple;
	bh=2j1NVVDVzyUer7ueF+dbPwze2xv/ZoGZ0AXdbs/w+4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AW8f07Yx+AHrOWjWu/uNZEojf2xKGvOHK+vXxUvwwAxXfUYyovCFDjnryt7x+fhIFpAgJJbphYvcKVeppV1+M3gAa1RTNKAwN7IBxlRqyKEgf197MfTD5cDw9CIlv5bppGnQIjkE31+rJD2erJHSuq9KuNM5zf2P5FDK+hqgzqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeDt+e/Q; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b6f59c4f5so8082276e87.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 01:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768297628; x=1768902428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRryjjjXplBwJtxztVvByOat+XNsp7z4Smz1935l/Wk=;
        b=SeDt+e/QykqvLFyCgyPklnC7t3Zwty2tkKNFhG8XPUf1NweYjcJ6/0NxwVZ7ZQkUdZ
         JL+Eo7iYwJKFW5J/47IYJwD+TJ0Sl578IT62WhQuFDzSzl33jH00AoOvKbO8mpW0aNQD
         fCKKXoFHHdS4Sr5b6Yti/foJCTESlhHyHrQzwZNcTguo7Xs+yqXE6PWrYll+7zK5l7z+
         vSXCkmR80z1gUMql0yMjsz6KBu8/AG6QhGdHQT746n9shOoQF+1GKkMV9IqQ/+8B0vpZ
         /llIKvbfhL/CLaaCWs5+1xubVHOsYtVPG79c9FL4EnjAzlyO2h0fqGFC3jL1+1DSuYtN
         c4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768297628; x=1768902428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iRryjjjXplBwJtxztVvByOat+XNsp7z4Smz1935l/Wk=;
        b=EghZSTneua8K73/fzIaSeTqhC0ObmkAXay6Hi6gejIoCM0RF4VvA4FbpOMNWv8FbNP
         HsAKrEVbMlVcdPPBvYLJwPnxLTB7vPppGoSeWYzYwB4aSe0/nRaP+WEgfdfYUEZSiXaK
         v8zBkmlUP/yQU1GXupP5bsK7gdnfbbrNGWcBd/l1RGaSlUSe1JoB6nOk6TeADh6PKbmM
         GqtXKmuF4mJTRLna5QCKjUO0u13uFqxgMe+jRzTrswp4XnjAuufTrpmQ83OyGZkHbyEy
         EhxtHtGnQly6+bO0OedQu2pDs9UreY/jWzrjerpIrnP2UEgcdgKgGBJr4HHV9eP1kGf7
         /9HA==
X-Forwarded-Encrypted: i=1; AJvYcCUAZtdmMJMxuw+ra316Ad2wQiXDgny+r93cIUxzPa9q7aevFAf9uOeSz7zsP/hXFJol1F6d6Fl6+m0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDWMxz3LAvJL+TnimKO1l+0sfuv+2I1ImOxy0+r7UVh98pF+zR
	m/5Coq2W2oKZNDAlqvwguKBHena8DRvKNXf/nkrWe4iql4fSODsHZWhDYKhRA51WcFL8MDo8EWp
	pGgJiktQYxqJCe6mTGMTO/qo7jgEwfWU=
X-Gm-Gg: AY/fxX4dZ5zkkFtXWcIG850PNa45xfEZ7Srk/Jg0VSYKltHt2vhCm7cNaG+hV9Ye4qW
	7KhFefWN8NGpd59eonZ3Nxu6ssDnzOkftJCWCpdX8kLGMBVI3enXTB0/HHeMXpLoIddFNaL/hvx
	7x17g/+4YodK5JTEtQ54M285day1ekFbM5+gUyTUKjlwnEry93j8EHlIncSii2c3GsZdDjpLkbL
	lBGTbMvuqgl6XBwHmWCWvBhWkUdEq7bp3OaLwxbYZhnViiaxGS9zEgYlP1MHjpzTgsIu20Z
X-Google-Smtp-Source: AGHT+IFRl57rhcP0wr03j+wHyjCYMuVRxDTMrdy7fRpFPZ5ok5LP1EvoB+hsF8Z+4MbHIppYwqEclOZujgx0bbZcoR8=
X-Received: by 2002:a05:6512:3b12:b0:59b:72aa:58e4 with SMTP id
 2adb3069b0e04-59b72aa5a88mr6520985e87.16.1768297627909; Tue, 13 Jan 2026
 01:47:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260111123218.15972-1-karthiproffesional@gmail.com> <2026011101-important-hermit-3a31@gregkh>
In-Reply-To: <2026011101-important-hermit-3a31@gregkh>
From: karthikeyan K S <karthiproffesional@gmail.com>
Date: Tue, 13 Jan 2026 15:16:54 +0530
X-Gm-Features: AZwV_QhNoiPVBmCmEMe9pGG6kvTb_UmC-jEjGYn1u0CQxkcllNXk8jywN8zr3cs
Message-ID: <CAP_JKPuve2pHzcMwzApmNHFXHsmKHB2PFKWqBLf0gg0j0KTtmw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc2: add missing SLAB_CACHE_DMA flag for desc_hsisoc_cache
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hminas@synopsys.com, gregory.herrero@intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thanks for the detailed review.

> Are you sure this is ok? You are now taking from a _very_ limited chunk
> of memory for this controller.

All current allocation sites already pass GFP_DMA, so DMA-zone memory
is already being consumed today. That said, I fully understand the
concern about further constraining allocations at the cache level.

> What platform is this that requires this, and what changed to suddenly
> need this to be this way?

No specific platform requires this, and nothing is broken. I noticed
this during code review, as desc_gen_cache uses SLAB_CACHE_DMA while
desc_hsisoc_cache does not, despite both being used for DMA descriptors.

> So I would like to find out why this is needed now, all these years
> later. What caused this to show up at this point in time?

There is no functional need. The current code works correctly because
GFP_DMA is always passed at allocation time. This was only a
consistency cleanup, and using a Fixes tag here was incorrect.

Given that this is long-working code with no real-world issue, I agree
this change is not justified and I will withdraw the patch and not
resend it.

> Also, should this go to stable kernels?

No, since no bug is being fixed.

Regards,
Karthikeyan

On Sun, Jan 11, 2026 at 6:36=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Jan 11, 2026 at 12:32:18PM +0000, Karthikeyan K S wrote:
> > The desc_hsisoc_cache kmem_cache is used to allocate DMA descriptors
> > for High-Speed isochronous transfers. These descriptors are passed to
> > the hardware via dma_map_single() in dwc2_desc_list_alloc().
> >
> > The desc_gen_cache, which serves the same purpose for other transfer
> > types, correctly specifies SLAB_CACHE_DMA. However, desc_hsisoc_cache
> > was created without this flag, despite both caches being used
> > identically for DMA descriptor allocation.
> >
> > Add the missing SLAB_CACHE_DMA flag to desc_hsisoc_cache for
> > consistency and correctness on platforms with DMA zone restrictions.
> > This also protects against future allocations from this cache that
> > might omit GFP_DMA.
> >
> > Fixes: 3b5fcc9ac2f4 ("usb: dwc2: host: use kmem cache to allocate descr=
iptors")
> >
> > Signed-off-by: Karthikeyan K S <karthiproffesional@gmail.com>
>
> Nit, no blank line needed after the Fixes: line and before your s-o-b
> line.
>
> Also, should this go to stable kernels?
>
> But:
>
> > ---
> > v2: Resend with proper formatting (previous was corrupted by email clie=
nt)
> > ---
> >  drivers/usb/dwc2/hcd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> > index 30eb85066..556d6ab36 100644
> > --- a/drivers/usb/dwc2/hcd.c
> > +++ b/drivers/usb/dwc2/hcd.c
> > @@ -5273,7 +5273,7 @@ int dwc2_hcd_init(struct dwc2_hsotg *hsotg)
> >
> >               hsotg->desc_hsisoc_cache =3D kmem_cache_create("dwc2-hsis=
oc-desc",
> >                               sizeof(struct dwc2_dma_desc) *
> > -                             MAX_DMA_DESC_NUM_HS_ISOC, 512, 0, NULL);
> > +                             MAX_DMA_DESC_NUM_HS_ISOC, 512, SLAB_CACHE=
_DMA, NULL);
>
> Are you sure this is ok?  You are now taking from a _very_ limited chunk
> of memory for this controller.  What platform is this that requires
> this, and what changed to suddenly need this to be this way?  The driver
> has been working for a very long time without this, and I am loath to
> change this now as it might hit many existing systems that have a very
> limited GFP_DMA memory range that did not expect a new allocation there
> now.
>
> So I would like to find out why this is needed now, all these years
> later.  What caused this to show up at this point in time?
>
> thanks,
>
> greg k-h

