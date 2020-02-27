Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 508E9172AC7
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 23:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729944AbgB0WGk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 17:06:40 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:43338 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729932AbgB0WGj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 17:06:39 -0500
Received: by mail-vk1-f196.google.com with SMTP id o2so357248vka.10
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2020 14:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h1JBtpGGQqknlPjXxRS4o0KE0TNrNFTSYULOaY5i3mE=;
        b=FT9JV2RABj0iYNv516V9CYCqmtUq6csZgKudwouFIKmAzTKQj0fmK1o3zI4sZU1QUO
         I7UCVqt6pHmTITu710pWwrqzoIUlkHmDA/vyDYIrhuU5xIpPqfzxC72FPusuImyd1G86
         UUXlRESkMxaMIn4eEUSs5e6YgY/yJ90UZIbdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h1JBtpGGQqknlPjXxRS4o0KE0TNrNFTSYULOaY5i3mE=;
        b=Y5FeZDuorujNa+nSvfarVz09nUtEGf6xW3UJGYm6T79UGiF8vCvrlKGRaAsxHzFJye
         2wdR1PEY8oY5zvHqO3k6BGc8oA1SbWHRjfYNynfPWufYR6D5VlLhbNCtRTiL1BszOCQs
         6D7G5u449eElhL21B6zQIJUGZVNyv8HUmHGIYNwSdT2JsC9L9iEYsS9Tiw2rs2QP++dR
         zPVvz6Z46tTWGLxmfJ4SL6kfFC8G2hJ8OE4TdDtxjB/G1bf5bnDvkiAOgpwd+0znSDA3
         VwPj0ZXhu7CSVZT9kNGZnm0RB/uUi+XHDC8kqitZP67kDnVmADUOWk6EhoBvczhA43DK
         f+vw==
X-Gm-Message-State: ANhLgQ046K30ERPmuqfGjlwvq0HIkODorp0Y4mU/d/cBeWvaw8X2IDVI
        Zn6V2ih1Iz5jiprtJH1em4uM4TAKTpg=
X-Google-Smtp-Source: ADFU+vtJIYKrFU2efPNQo6tCQ9Xo/7i9lhNoDu0SF7KmH52Vf27e65e/Ww7ajw0bhaqiLTa9n4DjyA==
X-Received: by 2002:ac5:cd88:: with SMTP id i8mr927986vka.94.1582841198466;
        Thu, 27 Feb 2020 14:06:38 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 49sm626337uad.8.2020.02.27.14.06.37
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 14:06:37 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id k188so697145vsc.8
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2020 14:06:37 -0800 (PST)
X-Received: by 2002:a67:fa1a:: with SMTP id i26mr1029918vsq.169.1582841196490;
 Thu, 27 Feb 2020 14:06:36 -0800 (PST)
MIME-Version: 1.0
References: <20200226210414.28133-1-linux@roeck-us.net> <20200226210414.28133-2-linux@roeck-us.net>
In-Reply-To: <20200226210414.28133-2-linux@roeck-us.net>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 27 Feb 2020 14:06:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WDd4E-zDW73kb-qHo1QYQrD3BTgVpE70rzowpgeXVy7w@mail.gmail.com>
Message-ID: <CAD=FV=WDd4E-zDW73kb-qHo1QYQrD3BTgVpE70rzowpgeXVy7w@mail.gmail.com>
Subject: Re: [RFT PATCH 1/4] usb: dwc2: Simplify and fix DMA alignment code
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>,
        Boris ARZUR <boris@konbu.org>, linux-usb@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Martin Schiller <ms@dev.tdt.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Feb 26, 2020 at 1:04 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> The code to align buffers for DMA was first introduced with commit
> 3bc04e28a030 ("usb: dwc2: host: Get aligned DMA in a more supported way").
> It was updated with commit 56406e017a88 ("usb: dwc2: Fix DMA alignment
> to start at allocated boundary") because it did not really align buffers to
> DMA boundaries but to word offsets. This was then optimized in commit
> 1e111e885238 ("usb: dwc2: Fix inefficient copy of unaligned buffers")
> to only copy actual data rather than the whole buffer. Commit 4a4863bf2e79
> ("usb: dwc2: Fix DMA cache alignment issues") changed this further to add
> a padding at the end of the buffer to ensure that the old data pointer is
> not in the same cache line as the buffer.
>
> This last commit states "Otherwise, the stored_xfer_buffer gets corrupted
> for IN URBs on non-cache-coherent systems". However, such corruptions are
> still observed. This suggests that the commit may have been hiding a
> problem rather than fixing it. Further analysis shows that this is indeed
> the case: The code in dwc2_hc_start_transfer() assumes that the transfer
> size is a multiple of wMaxPacketSize, and rounds up the transfer size
> communicated to the chip accordingly. Added debug code confirms that
> the chip does under some circumstances indeed send more data than requested
> in the urb receive buffer size.
>
> On top of that, it turns out that buffers are still not guaranteed to be
> aligned to dma_get_cache_alignment(), but to DWC2_USB_DMA_ALIGN (4).
> Further debugging shows that packets aligned to DWC2_USB_DMA_ALIGN
> but not to dma_get_cache_alignment() are indeed common and work just fine.
> This suggests that commit 56406e017a88 was not really necessary because
> even without it packets were already aligned to DWC2_USB_DMA_ALIGN.
>
> To simplify the code, move the old data pointer back to the beginning of
> the new buffer, restoring most of the original commit. Stop aligning the
> buffer to dma_get_cache_alignment() since it isn't needed and only makes
> the code more complex. Instead, ensure that the allocated buffer is a
> multiple of wMaxPacketSize to ensure that the chip does not write beyond
> the end of the buffer.

I do like the cleanliness of being able to easily identify the old
buffer (AKA by putting it first) and I agree that the existing code
was only really guaranteeing 4-byte alignment and if we truly needed
more alignment then we'd be allocating a lot more bounce buffers
(which is pretty expensive).

...but the argument in commit 56406e017a88 ("usb: dwc2: Fix DMA
alignment to start at allocated boundary") is still a compelling one.
Maybe at least put a comment in the code next to the "#define
DWC2_USB_DMA_ALIGN" saying that we think that this is enough alignment
for anyone using dwc2's built-in DMA logic?


> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Boris Arzur <boris@konbu.org>
> Fixes: 56406e017a88 ("usb: dwc2: Fix DMA alignment to start at allocated boundary")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/usb/dwc2/hcd.c | 67 ++++++++++++++++++++++--------------------
>  1 file changed, 35 insertions(+), 32 deletions(-)

Sorry for such a mess and thank you for all the work tracking down and
documenting all the problems.  Clearly deep understanding of DMA is
not something I can claim.  :(

A few points of order first:
* Although get_maintainer doesn't identify him, it has seemed like
Felipe Balbi lands most of the dwc2 things.  Probably a good idea to
CC him.
* I have historically found Stefan Wahren interested in dwc2 fixes and
willing to test them on Raspberry Pi w/ various peripherals.
* Since one of the commits you refer to was written by Martin Schiller
it probably wouldn't hurt to CC him.


> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index b90f858af960..f6d8cc9cee34 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -2471,19 +2471,21 @@ static int dwc2_alloc_split_dma_aligned_buf(struct dwc2_hsotg *hsotg,
>
>  #define DWC2_USB_DMA_ALIGN 4
>
> +struct dma_aligned_buffer {
> +       void *old_xfer_buffer;
> +       u8 data[0];
> +};
> +
>  static void dwc2_free_dma_aligned_buffer(struct urb *urb)
>  {
> -       void *stored_xfer_buffer;
> +       struct dma_aligned_buffer *dma;
>         size_t length;
>
>         if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
>                 return;
>
> -       /* Restore urb->transfer_buffer from the end of the allocated area */
> -       memcpy(&stored_xfer_buffer,
> -              PTR_ALIGN(urb->transfer_buffer + urb->transfer_buffer_length,
> -                        dma_get_cache_alignment()),
> -              sizeof(urb->transfer_buffer));
> +       dma = container_of(urb->transfer_buffer,
> +                          struct dma_aligned_buffer, data);
>
>         if (usb_urb_dir_in(urb)) {
>                 if (usb_pipeisoc(urb->pipe))
> @@ -2491,49 +2493,50 @@ static void dwc2_free_dma_aligned_buffer(struct urb *urb)
>                 else
>                         length = urb->actual_length;
>
> -               memcpy(stored_xfer_buffer, urb->transfer_buffer, length);
> +               memcpy(dma->old_xfer_buffer, dma->data, length);
>         }
> -       kfree(urb->transfer_buffer);
> -       urb->transfer_buffer = stored_xfer_buffer;
> +       urb->transfer_buffer = dma->old_xfer_buffer;
> +       kfree(dma);
>
>         urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
>  }
>
>  static int dwc2_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
>  {
> -       void *kmalloc_ptr;
> +       struct dma_aligned_buffer *dma;
>         size_t kmalloc_size;
>
> -       if (urb->num_sgs || urb->sg ||
> -           urb->transfer_buffer_length == 0 ||
> +       if (urb->num_sgs || urb->sg || urb->transfer_buffer_length == 0 ||
> +           (urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) ||
>             !((uintptr_t)urb->transfer_buffer & (DWC2_USB_DMA_ALIGN - 1)))

Maybe I'm misunderstanding things, but it feels like we need something
more here.  Specifically I'm worried about the fact when the transfer
buffer is already aligned but the length is not a multiple of the
endpoint's maximum transfer size.  You need to handle that, right?
AKA something like this (untested):

/* Simple case of not having to allocate a bounce buffer */
if (urb->num_sgs || urb->sg || urb->transfer_buffer_length == 0 ||
    (urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
  return 0;

/* Can also avoid bounce buffer if alignment and size are good */
maxp = usb_endpoint_maxp(&ep->desc);
if (maxp == urb->transfer_buffer_length &&

    !((uintptr_t)urb->transfer_buffer & (DWC2_USB_DMA_ALIGN - 1)))
  return 0;


Other than that this looks good to me.

-Doug
