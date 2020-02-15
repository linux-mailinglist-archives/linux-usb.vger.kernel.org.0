Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CABCE15FCF4
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2020 06:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgBOFg6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Feb 2020 00:36:58 -0500
Received: from funyu.konbu.org ([51.15.241.64]:47442 "EHLO funyu.konbu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgBOFg6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 15 Feb 2020 00:36:58 -0500
Received: from tungsten (24.205.49.163.rev.vmobile.jp [163.49.205.24])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by funyu.konbu.org (Postfix) with ESMTPSA id CC3E2280821;
        Sat, 15 Feb 2020 05:36:52 +0000 (UTC)
Date:   Sat, 15 Feb 2020 14:36:47 +0900
From:   Boris ARZUR <boris@konbu.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
Message-ID: <20200215053647.GA10345@tungsten>
References: <20200210213906.GA24079@roeck-us.net>
 <20200211054953.GA2401@tungsten>
 <20200211161522.GA1894@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211161522.GA1894@roeck-us.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Guenter,

>> The first time around I was 0/ changing fonts 1/ trimming the dump message
>> in the kernel 2/ filming my screen. That's not practical at all...
Mmm, pstore does seem to work on my machine. CHROME_PSTORE is not available
to me because I'm not on x86, I just enabled the rest and nothing pops up
in /sys/fs/pstore...

So I took pictures (OCR did not help):
- https://funyu.konbu.org/pQUF2P08etcpVxuKZ0A720%2b0/IMG_20200215_134343.jpg.webp
  is a stack trace for your earlier patch "min_t", in
  https://www.spinics.net/lists/linux-usb/msg191019.html ;
- https://funyu.konbu.org/pQUF2P08etcpVxuKZ0A720%2b0/IMG_20200215_135816.jpg.webp
  is a stack trace for your later patch "container_of", in
  https://www.spinics.net/lists/linux-usb/msg191074.html .

Both patches crash (without even loading the machine), but "container_of" is
a bit more resilient.

Thanks, Boris.

Guenter Roeck wrote:
>Hi Boris,
>
>On Tue, Feb 11, 2020 at 02:49:53PM +0900, Boris ARZUR wrote:
>> Hello Guenter,
>> 
>> >In the meantime, can you by any chance test the attached patch ? It _might_
>> >fix the problem, but it is a bit of a wild shot.
>> I tried your patch, but the machine does not finish booting.
>> 
>> 
>> I would like to give you a dump, but the screen scrolls fast, and what's
>> left when paused is not interesting. How do I get it to dump on disk?
>> 
>> My journalctl doesn't show anything. I have no kmesg.log anywhere.
>> The first time around I was 0/ changing fonts 1/ trimming the dump message
>> in the kernel 2/ filming my screen. That's not practical at all...
>> 
>> 
>> I have been looking a bit at things. I believe that part of the issue
>> is the need to re-align the buffer we get in the URB. I'm wondering if asking
>> for a specific alignment when creating the URB could be doable.
>> 
>> 
>> As a stop-gap, maybe doing things like in tegra ehci could fix our bug:
>> https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci-tegra.c#L288
>> i.e. having the old pointer before the new buffer instead of at the end of
>> it.
>> 
>> Now if something is overwriting the buffer end, that would also be hiding the
>> issue... but if the bug is related to lengths that don't match between
>> allocation and free, that could work. In this case, that would also be
>> hiding the issue :)
>> 
>See below for a patch (untested) doing just that. It may solve your immediate
>problem, though it would still suffer from the buffer end overwrite.
>
>> 
>> >Unfortunately, I have been unable to reproduce the problem. It is seen only
>> >with certain phones and with certain Ethernet adapters, and I was unable
>> >to get any of those. I'll keep trying.
>> If you want, I can run a kernel with some printk instrumentation or run
>> experiments. I'll research a bit on how to get that kernel oops data, that
>
>Unfortunately I have no real idea what to look out for. The problem may be
>related to the phone sending more than one Ethernet packet in a single USB
>transfer. See rndis_rx_fixup() for how that is handled in the driver.
>I don't know how that would result in the observed problem, though.
>
>Thanks,
>Guenter
>
>---
>From 8efa9c598f2390dca2e97cbbe41e981caba41ca1 Mon Sep 17 00:00:00 2001
>From: Guenter Roeck <linux@roeck-us.net>
>Date: Mon, 10 Feb 2020 14:04:06 -0800
>Subject: [PATCH] usb: dwc2: Simplify DMA alignment code
>
>The code to align buffers for DMA was first introduced with commit
>3bc04e28a030 ("usb: dwc2: host: Get aligned DMA in a more supported way").
>It was updated with commit 56406e017a88 ("usb: dwc2: Fix DMA alignment
>to start at allocated boundary") because it did not really align buffers to
>DMA boundaries but to DWC2_USB_DMA_ALIGN. This was then optimized in commit
>1e111e885238 ("usb: dwc2: Fix inefficient copy of unaligned buffers")
>to only copy actual data rather than the whole buffer. Commit 4a4863bf2e79
>("usb: dwc2: Fix DMA cache alignment issues") changed this further to add
>a padding at the end of the buffer to ensure that the old data pointer is
>not in the same cache line as the buffer.
>
>This last commit states "Otherwise, the stored_xfer_buffer gets corrupted
>for IN URBs on non-cache-coherent systems". However, such corruptions are
>still observed. Either case, DMA is not expected to overwrite more memory
>than it is supposed to do, suggesting that the commit may have been hiding
>a problem rather than fixing it.
>
>On top of that, DMA alignment is still not guaranteed since it only happens
>if the original buffer is not aligned to DWC2_USB_DMA_ALIGN, which is still
>a constant of 4 and not associated with DMA alignment.
>
>Move the old data pointer back to the beginning of the new buffer,
>restoring most of the original commit and to simplify the code. Define
>DWC2_USB_DMA_ALIGN to dma_get_cache_alignment() to fix the DMA alignment
>for real this time.
>
>Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>---
> drivers/usb/dwc2/hcd.c | 50 +++++++++++++++++++-----------------------
> 1 file changed, 22 insertions(+), 28 deletions(-)
>
>diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
>index 2c81b346b464..9e04b3a314eb 100644
>--- a/drivers/usb/dwc2/hcd.c
>+++ b/drivers/usb/dwc2/hcd.c
>@@ -2470,21 +2470,24 @@ static int dwc2_alloc_split_dma_aligned_buf(struct dwc2_hsotg *hsotg,
> 	return 0;
> }
> 
>-#define DWC2_USB_DMA_ALIGN 4
>+#define DWC2_USB_DMA_ALIGN	dma_get_cache_alignment()
>+
>+struct dma_aligned_buffer {
>+	void *kmalloc_ptr;
>+	void *old_xfer_buffer;
>+	u8 data[0];
>+};
> 
> static void dwc2_free_dma_aligned_buffer(struct urb *urb)
> {
>-	void *stored_xfer_buffer;
>+	struct dma_aligned_buffer *temp;
> 	size_t length;
> 
> 	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
> 		return;
> 
>-	/* Restore urb->transfer_buffer from the end of the allocated area */
>-	memcpy(&stored_xfer_buffer,
>-	       PTR_ALIGN(urb->transfer_buffer + urb->transfer_buffer_length,
>-			 dma_get_cache_alignment()),
>-	       sizeof(urb->transfer_buffer));
>+	temp = container_of(urb->transfer_buffer,
>+			    struct dma_aligned_buffer, data);
> 
> 	if (usb_urb_dir_in(urb)) {
> 		if (usb_pipeisoc(urb->pipe))
>@@ -2492,17 +2495,17 @@ static void dwc2_free_dma_aligned_buffer(struct urb *urb)
> 		else
> 			length = urb->actual_length;
> 
>-		memcpy(stored_xfer_buffer, urb->transfer_buffer, length);
>+		memcpy(temp->old_xfer_buffer, temp->data, length);
> 	}
>-	kfree(urb->transfer_buffer);
>-	urb->transfer_buffer = stored_xfer_buffer;
>+	urb->transfer_buffer = temp->old_xfer_buffer;
>+	kfree(temp->kmalloc_ptr);
> 
> 	urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
> }
> 
> static int dwc2_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
> {
>-	void *kmalloc_ptr;
>+	struct dma_aligned_buffer *temp, *kmalloc_ptr;
> 	size_t kmalloc_size;
> 
> 	if (urb->num_sgs || urb->sg ||
>@@ -2510,31 +2513,22 @@ static int dwc2_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
> 	    !((uintptr_t)urb->transfer_buffer & (DWC2_USB_DMA_ALIGN - 1)))
> 		return 0;
> 
>-	/*
>-	 * Allocate a buffer with enough padding for original transfer_buffer
>-	 * pointer. This allocation is guaranteed to be aligned properly for
>-	 * DMA
>-	 */
>+	/* Allocate a buffer with enough padding for alignment */
> 	kmalloc_size = urb->transfer_buffer_length +
>-		(dma_get_cache_alignment() - 1) +
>-		sizeof(urb->transfer_buffer);
>+		sizeof(struct dma_aligned_buffer) + DWC2_USB_DMA_ALIGN - 1;
> 
> 	kmalloc_ptr = kmalloc(kmalloc_size, mem_flags);
> 	if (!kmalloc_ptr)
> 		return -ENOMEM;
> 
>-	/*
>-	 * Position value of original urb->transfer_buffer pointer to the end
>-	 * of allocation for later referencing
>-	 */
>-	memcpy(PTR_ALIGN(kmalloc_ptr + urb->transfer_buffer_length,
>-			 dma_get_cache_alignment()),
>-	       &urb->transfer_buffer, sizeof(urb->transfer_buffer));
>-
>+	/* Position our struct dma_aligned_buffer such that data is aligned */
>+	temp = PTR_ALIGN(kmalloc_ptr + 1, DWC2_USB_DMA_ALIGN) - 1;
>+	temp->kmalloc_ptr = kmalloc_ptr;
>+	temp->old_xfer_buffer = urb->transfer_buffer;
> 	if (usb_urb_dir_out(urb))
>-		memcpy(kmalloc_ptr, urb->transfer_buffer,
>+		memcpy(temp->data, urb->transfer_buffer,
> 		       urb->transfer_buffer_length);
>-	urb->transfer_buffer = kmalloc_ptr;
>+	urb->transfer_buffer = temp->data;
> 
> 	urb->transfer_flags |= URB_ALIGNED_TEMP_BUFFER;
> 
>-- 
>2.17.1
>
