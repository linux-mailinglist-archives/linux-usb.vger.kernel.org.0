Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDD12A9D2
	for <lists+linux-usb@lfdr.de>; Sun, 26 May 2019 14:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbfEZM60 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 May 2019 08:58:26 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:50957 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfEZM6Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 May 2019 08:58:25 -0400
Received: by mail-it1-f195.google.com with SMTP id a186so13033483itg.0
        for <linux-usb@vger.kernel.org>; Sun, 26 May 2019 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=inQTV1Z0gJKzbwP6Z2SUXZUk5axOrsDl8jgpMomhBw0=;
        b=GO350rD9D39nyve7Hxv9YlVGqQNk4NLMXGeXRsTRnVyESPeO03TcRfW4bcxuB8x57m
         a6TUvYly2npSbut+4p5l1sYKG5rIu8itny7ijgSllmyHXfze9QH1boOXaz+DiyBan/Uo
         52uApQ2zH43rmlc3QuWC8EZ6q9AW9GqQMNDZKLxVcgg95gCdogf+rglA+p3WwuaG69Ri
         oD7rLa0ZOf1lU//XxGc2xWWZFEotBiqOUaNiKNCKmqTKnCkEn3OWqkMZni8X8fCLepRQ
         nPSSILhVbHUFFZ30hnfOohKxyTuk66xey2FuCrGeA+L0JS4xBhCxUwR8SvrkET4cNJNa
         bgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=inQTV1Z0gJKzbwP6Z2SUXZUk5axOrsDl8jgpMomhBw0=;
        b=YIKUyAnedo9snC7qV0+KHmUygtEpRusJTRT/M0LD4rt57NKpco8b66uhLEDEyCLMnB
         capFtDK54WjJz6io5UlGO1Br5m3qgZ/8KcoIBkGKTPU80xoRqy7lmNBKF74Lm1eqxsyi
         aTqG9YVP6bS88zk1ShLVF3WaxU9dIzF/f3Txxh3f6Y9v1jnqdnIltIDqiZXcZ9xd1jzq
         3cDAXIvBlwCqoXtH2+dFCzd+K5X8FJdmFSHObf03Gecb4paBjxUSnl9FFwfM+qXYwnMe
         pwGAHq/qjLh21Q/rQWQF81gIsljTKSYWyYogKSwzWNYJU3MUAat3orwWjkVGHFzjikPB
         3Xnw==
X-Gm-Message-State: APjAAAXYwOSTA5/GCu0CDBz7BOPn3Vs0BJeL97tuTKC1IIRjyQ7ywbgi
        bpRggdyufe4ga94Zj6fNUMOMhP7AbFfQ/BHkJgnDSw==
X-Google-Smtp-Source: APXvYqzeoIYFh+RLz4ra4CSSNh1VULShRpWGDrIz41W1gMP2WaH/WejFL5gpVrJiDfZfSN/uyYdJ0KvN1uIeWkGOyVY=
X-Received: by 2002:a24:910b:: with SMTP id i11mr27031774ite.76.1558875504923;
 Sun, 26 May 2019 05:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <0ae6261e-96b3-cf8b-d523-a6b8851c951b@gmx.net> <CAKv9HNaJg3OB3DrC_aJe0M97dFP9A0_Jew_wFqReHvzDoFF+sg@mail.gmail.com>
In-Reply-To: <CAKv9HNaJg3OB3DrC_aJe0M97dFP9A0_Jew_wFqReHvzDoFF+sg@mail.gmail.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Sun, 26 May 2019 14:58:12 +0200
Message-ID: <CAKv+Gu8fHfmMk63jzvtUGpHb=Nf1bzUvXay8_Hi4YTz=96pQNg@mail.gmail.com>
Subject: Re: usb: dwc2: RODATA_FULL_DEFAULT_ENABLED causes kernel oops
To:     =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>
Cc:     Stefan Wahren <wahrenst@gmx.net>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will.deacon@arm.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 26 May 2019 at 12:45, Antti Sepp=C3=A4l=C3=A4 <a.seppala@gmail.com>=
 wrote:
>
> On Sun, 26 May 2019 at 13:11, Stefan Wahren <wahrenst@gmx.net> wrote:
> >
> > Hi,
> >
> > i want to remind about an issue which was originally reported by Wayne
> > Piekarski [1]. I'm able to reproduce this oops with Mainline Linux 5.0.=
2
> > on a Raspberry Pi 3B+ (arm64/defconfig) and according to Jan Kratochvil
> > [2] this applies to 5.1.0 and 5.2.0.
> >
> > The crash is reproducible since commit c55191e96ca ("arm64: mm: apply
> > r/o permissions of VM areas to its linear alias as well"), but the root
> > cause of the crash was introduced much earlier with commit 56406e017a88
> > ("usb: dwc2: Fix DMA alignment to start at allocated boundary").
> >
> > I tested successfully the following workarounds with the RPi 3B+:
> >
> > 1) Disable RODATA_FULL_DEFAULT_ENABLED
> >
> > 2) revert commit 56406e017a88 ("usb: dwc2: Fix DMA alignment to start a=
t
> > allocated boundary")
> >
> > It would be nice if someone can come up with a proper solution.
> >
> > Regards
> > Stefan
> >
> > [1] - https://marc.info/?l=3Dlinux-usb&m=3D155440243702650&w=3D2
> > [2] - https://bugzilla.kernel.org/show_bug.cgi?id=3D203149
> >
>
> Hello.
>
> This is just a shot in the dark but have you tried to apply DMA cache
> alignment issue fix [1] as a third workaround alternative?
> If it helps the fix should be merged upstream.
>

Is transfer_buffer_length guaranteed to be a multiple of the max
D-cache line size in the system? If not, you will need to explicitly
flush the cache in dwc2_alloc_aligned_buffer() after memcpy()ing the
original buffer address into the newly allocated buffer, or subsequent
cache invalidation done in the DMA layer may wipe it.

Alternatively, you can round up transfer_buffer_length to be a
multiple of L1_CACHE_BYTES, e.g.,

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index b50ec3714fd8..84d43435d86e 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -2480,8 +2480,9 @@ static void dwc2_free_dma_aligned_buffer(struct urb *=
urb)
                return;

        /* Restore urb->transfer_buffer from the end of the allocated area =
*/
-       memcpy(&stored_xfer_buffer, urb->transfer_buffer +
-              urb->transfer_buffer_length, sizeof(urb->transfer_buffer));
+       memcpy(&stored_xfer_buffer,
+              urb->transfer_buffer +
L1_CACHE_ALIGN(urb->transfer_buffer_length),
+              sizeof(urb->transfer_buffer));

        if (usb_urb_dir_in(urb)) {
                if (usb_pipeisoc(urb->pipe))
@@ -2512,7 +2515,7 @@ static int dwc2_alloc_dma_aligned_buffer(struct
urb *urb, gfp_t mem_flags)
         * pointer. This allocation is guaranteed to be aligned properly fo=
r
         * DMA
         */
-       kmalloc_size =3D urb->transfer_buffer_length +
+       kmalloc_size =3D L1_CACHE_ALIGN(urb->transfer_buffer_length) +
                sizeof(urb->transfer_buffer);

        kmalloc_ptr =3D kmalloc(kmalloc_size, mem_flags);
@@ -2523,7 +2526,7 @@ static int dwc2_alloc_dma_aligned_buffer(struct
urb *urb, gfp_t mem_flags)
         * Position value of original urb->transfer_buffer pointer to the e=
nd
         * of allocation for later referencing
         */
-       memcpy(kmalloc_ptr + urb->transfer_buffer_length,
+       memcpy(kmalloc_ptr + L1_CACHE_ALIGN(urb->transfer_buffer_length),
               &urb->transfer_buffer, sizeof(urb->transfer_buffer));

        if (usb_urb_dir_out(urb))
