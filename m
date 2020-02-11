Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D52315949E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 17:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbgBKQP0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 11:15:26 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38269 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727561AbgBKQP0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 11:15:26 -0500
Received: by mail-pg1-f195.google.com with SMTP id d6so5963244pgn.5
        for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2020 08:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JMJcfNzj4u1bkV3JnTwtJDJkNgKxOFt9RXJ+LEY2aZU=;
        b=naazxcJdggcs5kxZRVbIm/XFHM2MEQe0rJthRZSe0BKI2tHVpqNEJ86vZh8CGPs3tz
         1TIZrsGt6apwLGTMwqR+PUR1te/SqCzUrv4s7dNf8EX3M0ByHOCfildSdjctvgNzdkyf
         cYu1ghbGqEVlFHyK2jjC5is+n5IVmJNx2piP0YZbcu3RqMX1b/H5FDQzBtUBMaJNHTJ9
         m3KxK3eppF/dtnB/26xja1uKzLWGuzHOwTPIJAiE7Gn++qMy4sQ0/5zCelv54/ISH8ow
         RzfMz5yEoQd0EOwqKSBtui1oWz9zYXN/v8oydK3DA6ntEU6fbyg4R8s8boS9R+eg2y7q
         ZPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JMJcfNzj4u1bkV3JnTwtJDJkNgKxOFt9RXJ+LEY2aZU=;
        b=aOws8vgMqwLFKabrCCIAJvl7CzeyhI7VJSYAWLHHsQUWVdw5gDtk8Cuq24kSJx8bOk
         4XnmRvNkFlQpi89jbiROQPCTVFchgehSQfWouCuc9wCpoGN/EFp3Tkirof3serj/ACYP
         8G+L6/A/9t4vMwvY3DXBiGsUH+67NOc3ayzlvX0wWIwKmZi0a8DgiPuyEl4Xv/BfpZiG
         QQuGIWDqGbU1f66eZgf64Y1BJ3f8lpdO0yJAHmNqF8xi7PdvOOoQ20h7GJ3vM1otiMoC
         dWt2QH87tVAoZ5LvER5X3oVfEBeLp9jUygj919x790L6h/U7OrsuG476hOazDpgEJO4d
         jW7w==
X-Gm-Message-State: APjAAAXZdMozHthd/t8F0mHVE0VxQ2YA+hiwVGDLE9l1NPzy7U1YhZqM
        blJfiHUBh/VvAVyC6vvWMJ0=
X-Google-Smtp-Source: APXvYqx9pzHICzpd8lC5VGTtFdc4cBMRYuGB8W/5zSD7C7bJ9vNDH390jtOh8ireI6yMMdUwul2Nfg==
X-Received: by 2002:a63:4525:: with SMTP id s37mr7521904pga.418.1581437725225;
        Tue, 11 Feb 2020 08:15:25 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g2sm4626062pgn.59.2020.02.11.08.15.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 08:15:24 -0800 (PST)
Date:   Tue, 11 Feb 2020 08:15:22 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Boris ARZUR <boris@konbu.org>
Cc:     linux-usb@vger.kernel.org,
        FelipeBalbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
Message-ID: <20200211161522.GA1894@roeck-us.net>
References: <20200210213906.GA24079@roeck-us.net>
 <20200211054953.GA2401@tungsten>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211054953.GA2401@tungsten>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Boris,

On Tue, Feb 11, 2020 at 02:49:53PM +0900, Boris ARZUR wrote:
> Hello Guenter,
> 
> >In the meantime, can you by any chance test the attached patch ? It _might_
> >fix the problem, but it is a bit of a wild shot.
> I tried your patch, but the machine does not finish booting.
> 
> 
> I would like to give you a dump, but the screen scrolls fast, and what's
> left when paused is not interesting. How do I get it to dump on disk?
> 
> My journalctl doesn't show anything. I have no kmesg.log anywhere.
> The first time around I was 0/ changing fonts 1/ trimming the dump message
> in the kernel 2/ filming my screen. That's not practical at all...
> 
> 
> I have been looking a bit at things. I believe that part of the issue
> is the need to re-align the buffer we get in the URB. I'm wondering if asking
> for a specific alignment when creating the URB could be doable.
> 
> 
> As a stop-gap, maybe doing things like in tegra ehci could fix our bug:
> https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci-tegra.c#L288
> i.e. having the old pointer before the new buffer instead of at the end of
> it.
> 
> Now if something is overwriting the buffer end, that would also be hiding the
> issue... but if the bug is related to lengths that don't match between
> allocation and free, that could work. In this case, that would also be
> hiding the issue :)
> 
See below for a patch (untested) doing just that. It may solve your immediate
problem, though it would still suffer from the buffer end overwrite.

> 
> >Unfortunately, I have been unable to reproduce the problem. It is seen only
> >with certain phones and with certain Ethernet adapters, and I was unable
> >to get any of those. I'll keep trying.
> If you want, I can run a kernel with some printk instrumentation or run
> experiments. I'll research a bit on how to get that kernel oops data, that

Unfortunately I have no real idea what to look out for. The problem may be
related to the phone sending more than one Ethernet packet in a single USB
transfer. See rndis_rx_fixup() for how that is handled in the driver.
I don't know how that would result in the observed problem, though.

Thanks,
Guenter

---
From 8efa9c598f2390dca2e97cbbe41e981caba41ca1 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Mon, 10 Feb 2020 14:04:06 -0800
Subject: [PATCH] usb: dwc2: Simplify DMA alignment code

The code to align buffers for DMA was first introduced with commit
3bc04e28a030 ("usb: dwc2: host: Get aligned DMA in a more supported way").
It was updated with commit 56406e017a88 ("usb: dwc2: Fix DMA alignment
to start at allocated boundary") because it did not really align buffers to
DMA boundaries but to DWC2_USB_DMA_ALIGN. This was then optimized in commit
1e111e885238 ("usb: dwc2: Fix inefficient copy of unaligned buffers")
to only copy actual data rather than the whole buffer. Commit 4a4863bf2e79
("usb: dwc2: Fix DMA cache alignment issues") changed this further to add
a padding at the end of the buffer to ensure that the old data pointer is
not in the same cache line as the buffer.

This last commit states "Otherwise, the stored_xfer_buffer gets corrupted
for IN URBs on non-cache-coherent systems". However, such corruptions are
still observed. Either case, DMA is not expected to overwrite more memory
than it is supposed to do, suggesting that the commit may have been hiding
a problem rather than fixing it.

On top of that, DMA alignment is still not guaranteed since it only happens
if the original buffer is not aligned to DWC2_USB_DMA_ALIGN, which is still
a constant of 4 and not associated with DMA alignment.

Move the old data pointer back to the beginning of the new buffer,
restoring most of the original commit and to simplify the code. Define
DWC2_USB_DMA_ALIGN to dma_get_cache_alignment() to fix the DMA alignment
for real this time.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/usb/dwc2/hcd.c | 50 +++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 2c81b346b464..9e04b3a314eb 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -2470,21 +2470,24 @@ static int dwc2_alloc_split_dma_aligned_buf(struct dwc2_hsotg *hsotg,
 	return 0;
 }
 
-#define DWC2_USB_DMA_ALIGN 4
+#define DWC2_USB_DMA_ALIGN	dma_get_cache_alignment()
+
+struct dma_aligned_buffer {
+	void *kmalloc_ptr;
+	void *old_xfer_buffer;
+	u8 data[0];
+};
 
 static void dwc2_free_dma_aligned_buffer(struct urb *urb)
 {
-	void *stored_xfer_buffer;
+	struct dma_aligned_buffer *temp;
 	size_t length;
 
 	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
 		return;
 
-	/* Restore urb->transfer_buffer from the end of the allocated area */
-	memcpy(&stored_xfer_buffer,
-	       PTR_ALIGN(urb->transfer_buffer + urb->transfer_buffer_length,
-			 dma_get_cache_alignment()),
-	       sizeof(urb->transfer_buffer));
+	temp = container_of(urb->transfer_buffer,
+			    struct dma_aligned_buffer, data);
 
 	if (usb_urb_dir_in(urb)) {
 		if (usb_pipeisoc(urb->pipe))
@@ -2492,17 +2495,17 @@ static void dwc2_free_dma_aligned_buffer(struct urb *urb)
 		else
 			length = urb->actual_length;
 
-		memcpy(stored_xfer_buffer, urb->transfer_buffer, length);
+		memcpy(temp->old_xfer_buffer, temp->data, length);
 	}
-	kfree(urb->transfer_buffer);
-	urb->transfer_buffer = stored_xfer_buffer;
+	urb->transfer_buffer = temp->old_xfer_buffer;
+	kfree(temp->kmalloc_ptr);
 
 	urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
 }
 
 static int dwc2_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
 {
-	void *kmalloc_ptr;
+	struct dma_aligned_buffer *temp, *kmalloc_ptr;
 	size_t kmalloc_size;
 
 	if (urb->num_sgs || urb->sg ||
@@ -2510,31 +2513,22 @@ static int dwc2_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
 	    !((uintptr_t)urb->transfer_buffer & (DWC2_USB_DMA_ALIGN - 1)))
 		return 0;
 
-	/*
-	 * Allocate a buffer with enough padding for original transfer_buffer
-	 * pointer. This allocation is guaranteed to be aligned properly for
-	 * DMA
-	 */
+	/* Allocate a buffer with enough padding for alignment */
 	kmalloc_size = urb->transfer_buffer_length +
-		(dma_get_cache_alignment() - 1) +
-		sizeof(urb->transfer_buffer);
+		sizeof(struct dma_aligned_buffer) + DWC2_USB_DMA_ALIGN - 1;
 
 	kmalloc_ptr = kmalloc(kmalloc_size, mem_flags);
 	if (!kmalloc_ptr)
 		return -ENOMEM;
 
-	/*
-	 * Position value of original urb->transfer_buffer pointer to the end
-	 * of allocation for later referencing
-	 */
-	memcpy(PTR_ALIGN(kmalloc_ptr + urb->transfer_buffer_length,
-			 dma_get_cache_alignment()),
-	       &urb->transfer_buffer, sizeof(urb->transfer_buffer));
-
+	/* Position our struct dma_aligned_buffer such that data is aligned */
+	temp = PTR_ALIGN(kmalloc_ptr + 1, DWC2_USB_DMA_ALIGN) - 1;
+	temp->kmalloc_ptr = kmalloc_ptr;
+	temp->old_xfer_buffer = urb->transfer_buffer;
 	if (usb_urb_dir_out(urb))
-		memcpy(kmalloc_ptr, urb->transfer_buffer,
+		memcpy(temp->data, urb->transfer_buffer,
 		       urb->transfer_buffer_length);
-	urb->transfer_buffer = kmalloc_ptr;
+	urb->transfer_buffer = temp->data;
 
 	urb->transfer_flags |= URB_ALIGNED_TEMP_BUFFER;
 
-- 
2.17.1

