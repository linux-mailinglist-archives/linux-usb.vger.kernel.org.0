Return-Path: <linux-usb+bounces-25446-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F25AF726A
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 13:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70CB6188754E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 11:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F222E3B0F;
	Thu,  3 Jul 2025 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NLGZHWH3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796DD2E3AFB
	for <linux-usb@vger.kernel.org>; Thu,  3 Jul 2025 11:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542343; cv=none; b=teUn0+nqyo+NicT+iedGSxyciaAZF6383R0u/P7l9tG0zdhoSUrb3WZZXeVj2+Ky29CYLNRFsZE4JxC0ROwBbeeSkp6WXqn/fqZm2JnaIISFsAEDFEsFGcEsDfTWlLbFAM5nZjEeHdQ0OEQHEIVFVNbdhq16KLJX4d4zz17ED7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542343; c=relaxed/simple;
	bh=KJzjzf9bW3qMR/ty207m83vi9+0PfbsKBzq78I8hpFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJz+Nuj5hRlv3onE6x86CjOoiD2Wx3z/2PlogYC9yEnGmbfszVrEpKcHeP7sWAts6Fatdu9tbnq7RRMFkq1+60xVNQj2CCNxviH1/f41OWKX5jrQMdHkXWZ7GjPgnnMLo7Idayad58FiFZQYa55rZrhNCYXqNgcXBk/DXl5GxZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NLGZHWH3; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-555163cd09aso4633321e87.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751542339; x=1752147139; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77UnFw9JQduiCE+rJYJRimYgiLY5u6VunHggtrV7ibM=;
        b=NLGZHWH37pQrSRgyI3bV4Jlm82lpHIk2SSvGaSSFG1W6nXCukmYLN6OIwONc8RsffW
         TsOkH8dHE1D9T18diE/txNHQSiQxbD/puBbMCPZKyBskxKNIeT4F5qFwI4+wYDXhfHwD
         wKmWD48dVYvmdgENmAQSAwuPjGqJHibBTito0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542339; x=1752147139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77UnFw9JQduiCE+rJYJRimYgiLY5u6VunHggtrV7ibM=;
        b=SWx2PTQMlKt6GCQzLbPIC6Z+aW9tVWr+/hOf+KKgYg6I9qB2ZZvuXECOSW3XNiDh7a
         2c3358C/clktrvYAgzBLoUpq1bXcpTSqbUm9zuKhuhwWhasTWTL1msToDl16y/3mHvLn
         sWElWmocXpLnFf4cnhj6JWF7ShBUK8zzVbYXjHkl0WBDlabimH5lUPFgcxgoi/jfACDQ
         GZKXYj45B2lHqfNLhVs9aVQVkIYqt8D6/Q9WA5wZ6LU6j41KfQc8V84vh+QkPhTaqDHY
         11rzxAWzRDwI2ubd5KRTbHmajnOzTnECSqXnnvryOFa5ZYRO5loqWA5aNk/NMnd8kZHQ
         eSDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXavqekefAqSqh3lOBc3jfb+q/sMGAcHj5wBvWrPUPGfPp0IRpXfgDsD2WBIG0Dhm/xTQVV4jx7HdE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4PWmEE5+86lSSQAcHemi+r176Clc/S4Y4MntONbWD3AztPEM8
	ttLHsVLeg8Afv0jGxnY51OYrKbGflUlZ7rmtCtLHMVHcSB267C6fG7gOtHa/suW4i0C/akGB4Bo
	2v3kEFQ==
X-Gm-Gg: ASbGncvHlitqGh15nw15SEVSrjG0+5b6Y8HgtdqXC0xYPe/fzF/kpJvSc4UjjONEEyS
	1pzi1jYtkyWwEC0fMYswBOnqvULd3epnHEmxlv8gBsgmrf33KbjnbYfsIWnEykghyvm1IuLBUNA
	Er+XvNipSKX6EgMjJJk9knXOG4wwAKpHpYiWGHT8I5ktydbtXTFLDljEqC3RnnHqMDFUIQxNpx1
	GvHUiVeb8Gzb0c6sapJz6cdL9bI5cf6bVmdl7ag6/90YzazxCFmjRyPdydIqDgSVBEFbKQWCbQW
	gLmZspD2YMIQtb/zA6g6zKvFJCuIehZ3U/Ug0JkVjFDTacepi7GSTL+WBGw0jzRuaBB1LFHO1P3
	mRhv4JyA9h9+lhEt4mBTKHzew
X-Google-Smtp-Source: AGHT+IF61ecWcmf/r0ubduIrbV5UOzqt2aGVzGKZWvLh0mLgRwywZ3e8SxkhRS1zvVGp5keqQLg0LQ==
X-Received: by 2002:a05:6512:1386:b0:554:f74b:789e with SMTP id 2adb3069b0e04-556283465e1mr2365663e87.43.1751542337915;
        Thu, 03 Jul 2025 04:32:17 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a73c6sm2409448e87.128.2025.07.03.04.32.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 04:32:16 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-555163cd09aso4633229e87.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 04:32:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpAEfVkd9WHfDCwjlIL3JfNXd76rNIgA7L0XgTFHEXIaWwDfC5fLbimTYDuQFIaSDopXy0KEU3oqs=@vger.kernel.org
X-Received: by 2002:a05:6512:108b:b0:554:f9c5:6b41 with SMTP id
 2adb3069b0e04-5562834a7edmr2259331e87.46.1751542335622; Thu, 03 Jul 2025
 04:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702110222.3926355-1-xu.yang_2@nxp.com> <20250702110222.3926355-3-xu.yang_2@nxp.com>
 <CANiDSCum3xkgr1QgdvsuZ3ySNJyoLUe_RWyeSDiM0S87YJ-uTw@mail.gmail.com> <rvg5yvwij5wsegqclcwv4qnuim3mlohxpdgrd77d7mctxofbj3@r4d56gjavldb>
In-Reply-To: <rvg5yvwij5wsegqclcwv4qnuim3mlohxpdgrd77d7mctxofbj3@r4d56gjavldb>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Jul 2025 13:32:02 +0200
X-Gmail-Original-Message-ID: <CANiDSCt98rP2RtUfC2EFL+H2U4TMV3BKEhAfpPK1Nm+tU=4j4Q@mail.gmail.com>
X-Gm-Features: Ac12FXyU9jtrH9KJyPUY_j3S31gGzwl5u1stIZzn0hYn0Is9alW4iNoy3AaTnF0
Message-ID: <CANiDSCt98rP2RtUfC2EFL+H2U4TMV3BKEhAfpPK1Nm+tU=4j4Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, 
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de, 
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, dafna.hirschfeld@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

Hi Xu

On Thu, 3 Jul 2025 at 10:51, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Jul 02, 2025 at 02:30:45PM +0200, Ricardo Ribalda wrote:
> > Hi Xu
> >
> > The code looks much cleaner :)
> >
> > It seems that the hcd.c uses the urb transfer_flags to know the
> > direction of the transfer.
> > But the uvc driver is not setting it, you probably want to set it.
>
> The USB HCD will get transfer direction from endpoint capability. So
> we needn't add such info to transfer_flags.

For future me...

usb_submit_urb() set that flag. :)

Thanks!
>
> >
> > On Wed, 2 Jul 2025 at 13:01, Xu Yang <xu.yang_2@nxp.com> wrote:
> > >
> > > This will use USB noncoherent API to alloc/free urb buffers, then
> > > uvc driver needn't to do dma sync operations by itself.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > ---
> > > Changes in v3:
> > >  - no changes
> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 56 ++++++++-----------------------
> > >  1 file changed, 14 insertions(+), 42 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index e3567aeb0007..614cf4781221 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -1280,15 +1280,6 @@ static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
> > >         return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
> > >  }
> >
> > The uvc_stream_to_dmadev() function is not used anymore, please drop it.
>
> Sure.
>
> Thanks,
> Xu Yang
>
> >
> >
> >
> > >
> > > -static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
> > > -{
> > > -       /* Sync DMA. */
> > > -       dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
> > > -                                   uvc_urb->sgt,
> > > -                                   uvc_stream_dir(uvc_urb->stream));
> > > -       return usb_submit_urb(uvc_urb->urb, mem_flags);
> > > -}
> > > -
> > >  /*
> > >   * uvc_video_decode_data_work: Asynchronous memcpy processing
> > >   *
> > > @@ -1310,7 +1301,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
> > >                 uvc_queue_buffer_release(op->buf);
> > >         }
> > >
> > > -       ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
> > > +       ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
> > >         if (ret < 0)
> > >                 dev_err(&uvc_urb->stream->intf->dev,
> > >                         "Failed to resubmit video URB (%d).\n", ret);
> > > @@ -1736,12 +1727,6 @@ static void uvc_video_complete(struct urb *urb)
> > >         /* Re-initialise the URB async work. */
> > >         uvc_urb->async_operations = 0;
> > >
> > > -       /* Sync DMA and invalidate vmap range. */
> > > -       dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> > > -                                uvc_urb->sgt, uvc_stream_dir(stream));
> > > -       invalidate_kernel_vmap_range(uvc_urb->buffer,
> > > -                                    uvc_urb->stream->urb_size);
> > > -
> > >         /*
> > >          * Process the URB headers, and optionally queue expensive memcpy tasks
> > >          * to be deferred to a work queue.
> > > @@ -1750,7 +1735,7 @@ static void uvc_video_complete(struct urb *urb)
> > >
> > >         /* If no async work is needed, resubmit the URB immediately. */
> > >         if (!uvc_urb->async_operations) {
> > > -               ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
> > > +               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
> > >                 if (ret < 0)
> > >                         dev_err(&stream->intf->dev,
> > >                                 "Failed to resubmit video URB (%d).\n", ret);
> > > @@ -1765,17 +1750,15 @@ static void uvc_video_complete(struct urb *urb)
> > >   */
> > >  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
> > >  {
> > > -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> > > +       struct usb_device *udev = stream->dev->udev;
> > >         struct uvc_urb *uvc_urb;
> > >
> > >         for_each_uvc_urb(uvc_urb, stream) {
> > >                 if (!uvc_urb->buffer)
> > >                         continue;
> > >
> > > -               dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
> > > -               dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
> > > -                                      uvc_stream_dir(stream));
> > > -
> > > +               usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
> > > +                                    uvc_stream_dir(stream), uvc_urb->sgt);
> > >                 uvc_urb->buffer = NULL;
> > >                 uvc_urb->sgt = NULL;
> > >         }
> > > @@ -1786,26 +1769,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
> > >  static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> > >                                  struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> > >  {
> > > -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> > > -
> > > -       uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> > > -                                              uvc_stream_dir(stream),
> > > -                                              gfp_flags, 0);
> > > -       if (!uvc_urb->sgt)
> > > -               return false;
> > > -       uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
> > > -
> > > -       uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> > > -                                                uvc_urb->sgt);
> > > -       if (!uvc_urb->buffer) {
> > > -               dma_free_noncontiguous(dma_dev, stream->urb_size,
> > > -                                      uvc_urb->sgt,
> > > -                                      uvc_stream_dir(stream));
> > > -               uvc_urb->sgt = NULL;
> > > -               return false;
> > > -       }
> > > +       struct usb_device *udev = stream->dev->udev;
> > >
> > > -       return true;
> > > +       uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
> > > +                                               gfp_flags, &uvc_urb->dma,
> > > +                                               uvc_stream_dir(stream),
> > > +                                               &uvc_urb->sgt);
> > > +       return !!uvc_urb->buffer;
> > >  }
> > >
> > >  /*
> > > @@ -1953,6 +1923,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
> > >                 urb->complete = uvc_video_complete;
> > >                 urb->number_of_packets = npackets;
> > >                 urb->transfer_buffer_length = size;
> > > +               urb->sgt = uvc_urb->sgt;
> > >
> > >                 for (i = 0; i < npackets; ++i) {
> > >                         urb->iso_frame_desc[i].offset = i * psize;
> > > @@ -2009,6 +1980,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
> > >                                   size, uvc_video_complete, uvc_urb);
> > >                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
> > >                 urb->transfer_dma = uvc_urb->dma;
> > > +               urb->sgt = uvc_urb->sgt;
> > >
> > >                 uvc_urb->urb = urb;
> > >         }
> > > @@ -2120,7 +2092,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
> > >
> > >         /* Submit the URBs. */
> > >         for_each_uvc_urb(uvc_urb, stream) {
> > > -               ret = uvc_submit_urb(uvc_urb, gfp_flags);
> > > +               ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
> > >                 if (ret < 0) {
> > >                         dev_err(&stream->intf->dev,
> > >                                 "Failed to submit URB %u (%d).\n",
> > > --
> > > 2.34.1
> > >
> > >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda

