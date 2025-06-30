Return-Path: <linux-usb+bounces-25267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C84AED4E6
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 08:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C27451643EC
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 06:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A851FDE22;
	Mon, 30 Jun 2025 06:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MSczNZRH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F411E5702
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 06:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266123; cv=none; b=cBWqBEQYklgugiyspbzdNbsPCQ/fH4zQ07d/NBmJirr+ScpQdEAoASOdi/OpFAbXKrYzK9rCWK1nk9ctarEdJT7MB/tqURwlmxSNWDhM4hCChvKAvtkQWPQ2kwDa6nMCl6K8OHGCf/bWzMrxHaAU7gJHcCjFV2CWpQ1ys85kI7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266123; c=relaxed/simple;
	bh=W3/qUmYR6QyOvmumbF5zNgCLQg69m81T3y9dtD4rHzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Az2Ch8udyLY0G4JZiX9KUrCN+xlucTMETbIjxtO1ZtwI/FQvez5S8LRW+5L5KsugUmVRUylutuWBaQf+GCfzmQs0cXqYtwyPQ87yUzz6PghbyfIzIbvWzv6Zrda7eO1zneUOkfD4U4I25b6SUS8f9ubx5gs3JDnr9hTqiZ8RpA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MSczNZRH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5551a770828so814135e87.1
        for <linux-usb@vger.kernel.org>; Sun, 29 Jun 2025 23:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751266119; x=1751870919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pku19sNVP6VuOr/+3IUAfIt54nYSogJc7sn5HCCxY5g=;
        b=MSczNZRHiw4DqU0S9f5kOy6d563U0yx5WA/asWam17R6sFevTzMrnrEgNxTEZBlQ1H
         8gbdNKHXIpabSd/taOtXmnNIvz3Y7J6DkIstPf5DOAUsvbIh6SgGBHZC6ZwiBnis9sK2
         kSRkfb1Fv7iHwWnCSc+vXEdmfZ6C5RBCEZzVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266119; x=1751870919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pku19sNVP6VuOr/+3IUAfIt54nYSogJc7sn5HCCxY5g=;
        b=Lcgb2KkhxnEdyuc3ULVinaCAfJPKqHxYoyde999h4lM8SFaP/0DInx0sXzrmS63UXn
         /IaKmAWhL/oEL+/ldDjPmMbUcint0dkmf1vJdg5nCC46qZeXxMzkKlslF4wkAtOJs1Vp
         GBgSc4pbnjE4bZmLo1VUE+kJURrzhe0n9fPAi5K7+8tNtkC38xhTkmDqf8Mxu/OeZe89
         hUAILh+OmkBJ3s4PPe/YYKDrckRSRO5udeMwm2yzahx2DCyA3lOdDl3/eePqkvUslW2G
         DP7UcAvPcs9p/E8qAKkn5c2yJfBO64KEdPgMFQBDfN3G74QE6xa5cvddC3VsNOgaxLWi
         MJ2g==
X-Forwarded-Encrypted: i=1; AJvYcCXMNyMkjYFuHS3wwiuAe+DpQ6DGpwEhVA7fcLQdHDhzMFxXKJ8BUidcF3h9I+9Zf2TVn/JwGZUP3Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfoBxmQWQPJzINPTQVVj6iwfD5VmevNecwy/XCUXTygC4VZ/xh
	6/L/FrRll26qPBul6XzQ+ArenzhXkRirZNU3U3N2vowAqrLcY0MwO+6UxyaUearxjUvjKm93UCE
	/Avk=
X-Gm-Gg: ASbGncsNYqMRF8YDneDIX1cQPG9b/ItAVvGvjGU9lBKFXgWD6o87LWweyRCq1eKaB3B
	4J86HwJAg9l1XD7/0MpAM2VPTVm111AIWbMmybtmcVukutTnh1+wN0H2aifn7WjfzIOd+fWoexZ
	/g+NMI9Fb9+QHE7frbD07cxKiatu6hu6F/v4FoMYIu0GDtBR8YG5FSky32gNk6EuyuWI/sFjEVi
	YNHSM96gojqJROkJMrywwDJadr6mIsq3A7cP90oI/TvrPM0u7OYCrIM688kMfpq9aWZfkzaXlAk
	eretXu2DLxfMT7sWFcd2BocofIBKstEycONi9kqAGSFIV9nCElRK/IC8QYwp4P1WsSw4azXSlS/
	72gY/5+fd61toeyRBxxanhk1I
X-Google-Smtp-Source: AGHT+IE94GMC8FnMxhjBxEaTLxXoA4YXb+cHWUpFD27oPIkX/O9CS3Xc1P7fAPQQ3vYm9NA9ofziNg==
X-Received: by 2002:a05:6512:4011:b0:553:d122:f904 with SMTP id 2adb3069b0e04-5550b88e3b8mr3716094e87.23.1751266118836;
        Sun, 29 Jun 2025 23:48:38 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cefebsm1308127e87.184.2025.06.29.23.48.36
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 23:48:36 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b51f5218so4277898e87.0
        for <linux-usb@vger.kernel.org>; Sun, 29 Jun 2025 23:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzVv41Xdy0RAxTl++LFaCJbTJjpHT7qa8iyK+u7Sa4lmEWxtdsYcSTh9lZNJtdTnGt5p/xo8Ap8do=@vger.kernel.org
X-Received: by 2002:a05:6512:3e2a:b0:553:3770:c912 with SMTP id
 2adb3069b0e04-5550ba2bc7emr3296124e87.47.1751266115614; Sun, 29 Jun 2025
 23:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627101939.3649295-1-xu.yang_2@nxp.com> <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu> <20250629233924.GC20732@pendragon.ideasonboard.com>
In-Reply-To: <20250629233924.GC20732@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 08:48:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCswzMouJrRn2A3EAbGzHTf88q_qQ=DC_KX7dbf_LJzqBg@mail.gmail.com>
X-Gm-Features: Ac12FXygHhnlFKiXR-4gqAGeNFFl6ex4EPtMW2SIZttm2I0yNPjkXicKbD_z69Y
Message-ID: <CANiDSCswzMouJrRn2A3EAbGzHTf88q_qQ=DC_KX7dbf_LJzqBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Christoph Hellwig <hch@lst.de>
Cc: Alan Stern <stern@rowland.harvard.edu>, Xu Yang <xu.yang_2@nxp.com>, 
	ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, hdegoede@redhat.com, 
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de, 
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 01:39, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jun 27, 2025 at 10:23:36AM -0400, Alan Stern wrote:
> > On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
> > > This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> > > functions to support alloc and free buffer in a dma-noncoherent way.
> > >
> > > To explicit manage the memory ownership for the kernel and device,
> > > this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> > > and call it at proper time.  The management requires the user save
> > > sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/core/hcd.c | 30 ++++++++++++++++
> > >  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/usb.h    |  9 +++++
> > >  3 files changed, 119 insertions(+)
> > >
> > > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > > index c22de97432a0..5fa00d32afb8 100644
> > > --- a/drivers/usb/core/hcd.c
> > > +++ b/drivers/usb/core/hcd.c
> > > @@ -1496,6 +1496,34 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
> > >  }
> > >  EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
> > >
> > > +static void usb_dma_noncoherent_sync_for_cpu(struct usb_hcd *hcd,
> > > +                                        struct urb *urb)
> > > +{
> > > +   enum dma_data_direction dir;
> > > +
> > > +   if (!urb->sgt)
> > > +           return;
> > > +
> > > +   dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> >
> > Are the following operations really necessary if the direction is OUT?
> > There are no bidirectional URBs, and an OUT transfer never modifies the
> > contents of the transfer buffer so the buffer contents will be the same
> > after the URB completes as they were when the URB was submitted.
>
> The arch part of dma_sync_sgtable_for_cpu(DMA_TO_DEVICE) is a no-op on
> all architectures but microblaze, mips, parisc and powerpc (at least in
> some configurations of those architectures).
>
> The IOMMU DMA mapping backend calls into the arch-specific code, and
> also handles swiotlb, which is a no-op for DMA_TO_DEVICE. There's also
> some IOMMU-related arch-specific handling for sparc.
>
> I think dma_sync_sgtable_for_cpu() should be called for the
> DMA_TO_DEVICE direction, to ensure proper operation in those uncommon
> but real cases where platforms need to perform some operation. It has a
> non-zero cost on other platforms, as the CPU will need to go through a
> few function calls to end up in no-ops and then go back up the call
> stack.
>
> invalidate_kernel_vmap_range() may not be needed. I don't recall why it
> was added. The call was introduced in
>
> commit 20e1dbf2bbe2431072571000ed31dfef09359c08
> Author: Ricardo Ribalda <ribalda@chromium.org>
> Date:   Sat Mar 13 00:55:20 2021 +0100
>
>     media: uvcvideo: Use dma_alloc_noncontiguous API
>
> Ricardo, do we need to invalidate the vmap range in the DMA_TO_DEVICE
> case ?

That change came from Christoph
https://lore.kernel.org/linux-media/20210128150955.GA30563@lst.de/

"""

Given that we vmap the addresses this also needs
flush_kernel_vmap_range / invalidate_kernel_vmap_range calls for
VIVT architectures.

"""

>
> > > +   invalidate_kernel_vmap_range(urb->transfer_buffer,
> > > +                                urb->transfer_buffer_length);
> > > +   dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
>
> In the DMA_FROM_DEVICE case, shouldn't the vmap range should be
> invalidated after calling dma_sync_sgtable_for_cpu() ? Otherwise I think
> speculative reads coming between invalidation and dma sync could result
> in data corruption.
>
> > > +}
> >
> > This entire routine should be inserted at the appropriate place in
> > usb_hcd_unmap_urb_for_dma() instead of being standalone.
> >
> > > +static void usb_dma_noncoherent_sync_for_device(struct usb_hcd *hcd,
> > > +                                           struct urb *urb)
> > > +{
> > > +   enum dma_data_direction dir;
> > > +
> > > +   if (!urb->sgt)
> > > +           return;
> > > +
> > > +   dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > > +   flush_kernel_vmap_range(urb->transfer_buffer,
> > > +                           urb->transfer_buffer_length);
> > > +   dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> > > +}
> >
> > Likewise, this code belongs inside usb_hcd_map_urb_for_dma().
> >
> > Also, the material that this routine replaces in the uvc and stk1160
> > drivers do not call flush_kernel_vmap_range().  Why did you add that
> > here?  Was this omission a bug in those drivers?
> >
> > Alan Stern
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

