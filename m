Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC1641697F6
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 14:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgBWNyB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 08:54:01 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36683 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgBWNyB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 08:54:01 -0500
Received: by mail-pl1-f195.google.com with SMTP id a6so2879693plm.3
        for <linux-usb@vger.kernel.org>; Sun, 23 Feb 2020 05:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pDiAOQ98TFLcXYNm+4FtoBMwVy2pS8X1Lqk0Q6xu1Yc=;
        b=ZQxa4isFJQwk668NC1OeJiq+4Ufi+BdZutU4H+o52yQUltDoMdwemqPVvscc1Jlox8
         sjIOh6iWZ4AeyAI541c4imYY3nxGgFAMuNA9d/voHIx0NVNKsQPTp/63q1S3OqHFoitK
         BOUG50pal54R7MuJXAnSQIJY0E4e2WVylxj3Hu1q+QduZn6xADu0oYsuHRA10orV1JUB
         SM/6cy6qmNSbTiKjDS2YrpS6r954tDaMVIfQihvQcGcba7W/nQ2z2K/yca7zrTED1c7o
         MNEk4OvJUSjxzEAQ/RrOYCvWhnUjBzIpcw5NexELPG2ldzQ0BzlUnov0HrCOb87GJJYp
         ctUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pDiAOQ98TFLcXYNm+4FtoBMwVy2pS8X1Lqk0Q6xu1Yc=;
        b=jKGtNyUMZ74XyoJ/ga9NzeP3E08S3r99WYiX4qsj3Teu6qTaTQDcHiB9yvFemfholE
         FKfYsEwO8tHT7w9ZNyFupd431ynDirJ0zMDOqNGVei6qgcmM3+i2ypNNzmTlGLgAQxoB
         qHZKwHmdWbRMR8CfBFEK3I0hEw3Tpni6dc5QhzRmVlQF5sPhgWNnlSULBJwwD/luDVA+
         gMe9heybcoSsMQn5huJuj79NJ6WCGD2KVjXBnJjWyVsaw/UbZnY6fMd0rNTQuh15kGLJ
         CWEfQodQVxRlV9B91xAWiU6dLS7Dv9I1ny22U/7LiMRlUMAMpEiUqlHxZSJ5/P5n68Qz
         9JtQ==
X-Gm-Message-State: APjAAAUMvTzf7D2vpVW08fy7StxalvmfEbKWjcBqQ56gMtuQ5G4EM4cg
        Y3fierY3vJELh5fhsP6fVPs=
X-Google-Smtp-Source: APXvYqzz+4B5j5wGbEJoyvEAwhQrqPek0m0Up3uzLjHpJEFZn2jTAP9Zm7njEwcQMHWHppc9Rv0V0w==
X-Received: by 2002:a17:90a:9416:: with SMTP id r22mr14917897pjo.2.1582466039126;
        Sun, 23 Feb 2020 05:53:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r198sm9646613pfr.54.2020.02.23.05.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2020 05:53:58 -0800 (PST)
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
To:     Boris ARZUR <boris@konbu.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>, a.seppala@gmail.com
References: <20200210213906.GA24079@roeck-us.net>
 <20200211054953.GA2401@tungsten> <20200211161522.GA1894@roeck-us.net>
 <20200215053647.GA10345@tungsten> <20200219211056.GA829@roeck-us.net>
 <20200223120247.GA21552@tungsten>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1bdb58d1-850e-708f-5d13-a62094a0aa93@roeck-us.net>
Date:   Sun, 23 Feb 2020 05:53:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200223120247.GA21552@tungsten>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Boris,

On 2/23/20 4:02 AM, Boris ARZUR wrote:
> Hi Guenter,
> 
> I tried your series of patch. rndis_host tethering & loading the machine
> seems to work fine. No more crashing.
> 
> That being said, I now have an issue with regular USB keys (I tried a few):
> usb 3-1: reset high-speed USB device number 2 using dwc2
> 
> I was able to reproduce this issue with the unpatched kernel, by disabling
> the early return in dwc2_alloc_dma_aligned_buffer(), see attached.
> There are times were re-allocation fails, either with your patch or with
> the (almost-)original code.
> 
> In particular it seems that there is a packet of lenght 13, usb_urb_dir_in() == true,
> usb_pipetype(urb->pipe) == PIPE_BULK, that comes in every 2s or so, that
> does not reallocate properly.
> 
> In the original code, it's not a problem thanks to the early return, but your code
> wants 512B (maxp) and forces reallocation...
> 

Thanks for finding this. Back to the drawing board.

> Thanks, Boris.
> 
> Guenter Roeck wrote:
>> On Sat, Feb 15, 2020 at 02:36:47PM +0900, Boris ARZUR wrote:
>>> Hi Guenter,
>>>
>>>>> The first time around I was 0/ changing fonts 1/ trimming the dump message
>>>>> in the kernel 2/ filming my screen. That's not practical at all...
>>> Mmm, pstore does seem to work on my machine. CHROME_PSTORE is not available
>>> to me because I'm not on x86, I just enabled the rest and nothing pops up

Your system is Veyron, isn't it ? It does support pstore (I am using one for
my testing as well), but I guess that depends on the BIOS/firmware installed.

Guenter

>>> in /sys/fs/pstore...
>>>
>>> So I took pictures (OCR did not help):
>>> - https://funyu.konbu.org/pQUF2P08etcpVxuKZ0A720%2b0/IMG_20200215_134343.jpg.webp
>>>    is a stack trace for your earlier patch "min_t", in
>>>    https://www.spinics.net/lists/linux-usb/msg191019.html ;
>>> - https://funyu.konbu.org/pQUF2P08etcpVxuKZ0A720%2b0/IMG_20200215_135816.jpg.webp
>>>    is a stack trace for your later patch "container_of", in
>>>    https://www.spinics.net/lists/linux-usb/msg191074.html .
>>>
>>> Both patches crash (without even loading the machine), but "container_of" is
>>> a bit more resilient.
>>>
>>
>> Yes, those patches didn't address the core problem. Can you test with the
>> attached two patches ?
>>
>> Thanks,
>> Guenter
> 
>>From a1c0551b62b038b495177737828f986961184110 Mon Sep 17 00:00:00 2001
>> From: Guenter Roeck <linux@roeck-us.net>
>> Date: Mon, 10 Feb 2020 14:04:06 -0800
>> Subject: [PATCH 1/2] usb: dwc2: Simplify DMA alignment code
>>
>> The code to align buffers for DMA was first introduced with commit
>> 3bc04e28a030 ("usb: dwc2: host: Get aligned DMA in a more supported way").
>> It was updated with commit 56406e017a88 ("usb: dwc2: Fix DMA alignment
>> to start at allocated boundary") because it did not really align buffers to
>> DMA boundaries but to DWC2_USB_DMA_ALIGN. This was then optimized in commit
>> 1e111e885238 ("usb: dwc2: Fix inefficient copy of unaligned buffers")
>> to only copy actual data rather than the whole buffer. Commit 4a4863bf2e79
>> ("usb: dwc2: Fix DMA cache alignment issues") changed this further to add
>> a padding at the end of the buffer to ensure that the old data pointer is
>> not in the same cache line as the buffer.
>>
>> This last commit states "Otherwise, the stored_xfer_buffer gets corrupted
>> for IN URBs on non-cache-coherent systems". However, such corruptions are
>> still observed. Either case, DMA is not expected to overwrite more memory
>> than it is supposed to do, suggesting that the commit may have been hiding
>> a problem rather than fixing it.
>>
>> On top of that, DMA alignment is still not guaranteed since it only happens
>> if the original buffer is not aligned to DWC2_USB_DMA_ALIGN, which is still
>> a constant of 4 and not really associated with DMA alignment.
>>
>> Move the old data pointer back to the beginning of the new buffer,
>> restoring most of the original commit and to simplify the code. Define
>> DWC2_USB_DMA_ALIGN to dma_get_cache_alignment() to fix the DMA alignment
>> for real this time.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> drivers/usb/dwc2/hcd.c | 50 +++++++++++++++++++-----------------------
>> 1 file changed, 22 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
>> index b90f858af960..b5841197165a 100644
>> --- a/drivers/usb/dwc2/hcd.c
>> +++ b/drivers/usb/dwc2/hcd.c
>> @@ -2469,21 +2469,24 @@ static int dwc2_alloc_split_dma_aligned_buf(struct dwc2_hsotg *hsotg,
>> 	return 0;
>> }
>>
>> -#define DWC2_USB_DMA_ALIGN 4
>> +#define DWC2_USB_DMA_ALIGN	dma_get_cache_alignment()
>> +
>> +struct dma_aligned_buffer {
>> +	void *kmalloc_ptr;
>> +	void *old_xfer_buffer;
>> +	u8 data[0];
>> +};
>>
>> static void dwc2_free_dma_aligned_buffer(struct urb *urb)
>> {
>> -	void *stored_xfer_buffer;
>> +	struct dma_aligned_buffer *temp;
>> 	size_t length;
>>
>> 	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
>> 		return;
>>
>> -	/* Restore urb->transfer_buffer from the end of the allocated area */
>> -	memcpy(&stored_xfer_buffer,
>> -	       PTR_ALIGN(urb->transfer_buffer + urb->transfer_buffer_length,
>> -			 dma_get_cache_alignment()),
>> -	       sizeof(urb->transfer_buffer));
>> +	temp = container_of(urb->transfer_buffer,
>> +			    struct dma_aligned_buffer, data);
>>
>> 	if (usb_urb_dir_in(urb)) {
>> 		if (usb_pipeisoc(urb->pipe))
>> @@ -2491,17 +2494,17 @@ static void dwc2_free_dma_aligned_buffer(struct urb *urb)
>> 		else
>> 			length = urb->actual_length;
>>
>> -		memcpy(stored_xfer_buffer, urb->transfer_buffer, length);
>> +		memcpy(temp->old_xfer_buffer, temp->data, length);
>> 	}
>> -	kfree(urb->transfer_buffer);
>> -	urb->transfer_buffer = stored_xfer_buffer;
>> +	urb->transfer_buffer = temp->old_xfer_buffer;
>> +	kfree(temp->kmalloc_ptr);
>>
>> 	urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
>> }
>>
>> static int dwc2_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
>> {
>> -	void *kmalloc_ptr;
>> +	struct dma_aligned_buffer *temp, *kmalloc_ptr;
>> 	size_t kmalloc_size;
>>
>> 	if (urb->num_sgs || urb->sg ||
>> @@ -2509,31 +2512,22 @@ static int dwc2_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
>> 	    !((uintptr_t)urb->transfer_buffer & (DWC2_USB_DMA_ALIGN - 1)))
>> 		return 0;
>>
>> -	/*
>> -	 * Allocate a buffer with enough padding for original transfer_buffer
>> -	 * pointer. This allocation is guaranteed to be aligned properly for
>> -	 * DMA
>> -	 */
>> +	/* Allocate a buffer with enough padding for alignment */
>> 	kmalloc_size = urb->transfer_buffer_length +
>> -		(dma_get_cache_alignment() - 1) +
>> -		sizeof(urb->transfer_buffer);
>> +		sizeof(struct dma_aligned_buffer) + DWC2_USB_DMA_ALIGN - 1;
>>
>> 	kmalloc_ptr = kmalloc(kmalloc_size, mem_flags);
>> 	if (!kmalloc_ptr)
>> 		return -ENOMEM;
>>
>> -	/*
>> -	 * Position value of original urb->transfer_buffer pointer to the end
>> -	 * of allocation for later referencing
>> -	 */
>> -	memcpy(PTR_ALIGN(kmalloc_ptr + urb->transfer_buffer_length,
>> -			 dma_get_cache_alignment()),
>> -	       &urb->transfer_buffer, sizeof(urb->transfer_buffer));
>> -
>> +	/* Position our struct dma_aligned_buffer such that data is aligned */
>> +	temp = PTR_ALIGN(kmalloc_ptr + 1, DWC2_USB_DMA_ALIGN) - 1;
>> +	temp->kmalloc_ptr = kmalloc_ptr;
>> +	temp->old_xfer_buffer = urb->transfer_buffer;
>> 	if (usb_urb_dir_out(urb))
>> -		memcpy(kmalloc_ptr, urb->transfer_buffer,
>> +		memcpy(temp->data, urb->transfer_buffer,
>> 		       urb->transfer_buffer_length);
>> -	urb->transfer_buffer = kmalloc_ptr;
>> +	urb->transfer_buffer = temp->data;
>>
>> 	urb->transfer_flags |= URB_ALIGNED_TEMP_BUFFER;
>>
>> -- 
>> 2.17.1
>>
> 
>>From 9df13854b3717f8c16a2012dec614f737bb8c15d Mon Sep 17 00:00:00 2001
>> From: Guenter Roeck <linux@roeck-us.net>
>> Date: Mon, 10 Feb 2020 13:11:00 -0800
>> Subject: [PATCH 2/2] usb: dwc2: Allocate input buffers as multiples of
>> wMaxPacketSize
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=UTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> The following messages are seen on Veyron Chromebooks running v4.19 or
>> later kernels.
>>
>> dwc2 ff580000.usb: dwc2_update_urb_state(): trimming xfer length
>> dwc2 ff580000.usb: dwc2_hc_chhltd_intr_dma: Channel 7 - ChHltd set, but reason is unknown
>> dwc2 ff580000.usb: hcint 0x00000002, intsts 0x04600021
>>
>> This is typically followed by a crash.
>>
>> Unable to handle kernel paging request at virtual address 29f9d9fc
>> pgd = 4797dac9
>> [29f9d9fc] *pgd=80000000004003, *pmd=00000000
>> Internal error: Oops: a06 [#1] PREEMPT SMP ARM
>> Modules linked in: ip6t_REJECT rfcomm i2c_dev uinput hci_uart btbcm ...
>> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         4.19.87-07825-g4ab3515f6e4d #1
>> Hardware name: Rockchip (Device Tree)
>> PC is at memcpy+0x50/0x330
>> LR is at 0xdd9ac94
>> ...
>> [<c0a89f50>] (memcpy) from [<c0783b94>] (dwc2_free_dma_aligned_buffer+0x5c/0x7c)
>> [<c0783b94>] (dwc2_free_dma_aligned_buffer) from [<c0765dcc>] (__usb_hcd_giveback_urb+0x78/0x130)
>> [<c0765dcc>] (__usb_hcd_giveback_urb) from [<c07678fc>] (usb_giveback_urb_bh+0xa0/0xe4)
>> [<c07678fc>] (usb_giveback_urb_bh) from [<c023a164>] (tasklet_action_common+0xc0/0xdc)
>> [<c023a164>] (tasklet_action_common) from [<c02021f0>] (__do_softirq+0x1b8/0x434)
>> [<c02021f0>] (__do_softirq) from [<c0239a14>] (irq_exit+0xdc/0xe0)
>> [<c0239a14>] (irq_exit) from [<c029f260>] (__handle_domain_irq+0x94/0xd0)
>> [<c029f260>] (__handle_domain_irq) from [<c05da780>] (gic_handle_irq+0x74/0xb0)
>> [<c05da780>] (gic_handle_irq) from [<c02019f8>] (__irq_svc+0x58/0x8c)
>>
>> The crash suggests that the memory after the end of a temporary DMA-aligned
>> buffer is overwritten.
>>
>> The problem is typically only seen in kernels which include commit
>> 56406e017a88 ("usb: dwc2: Fix DMA alignment to start at allocated
>> boundary"), presumably because that commit moves the pointer to the old
>> buffer to the end of the newly allocated buffer, where it is more likely
>> to be overwritten.
>>
>> Code analysis shows that the transfer size programmed into the chip for
>> input transfers is a multiple of an endpoint's maximum packet size
>> (wMaxPacketSize). In the observed situation, the transfer size and thus
>> the size of the input buffer is 1522 bytes. With a maximum packet size
>> of 64 bytes, the chip is programmed to receive up to 1536 bytes of data.
>> This overwrites the end of the buffer.
>>
>> To work around the problem, always allocate a multiple of wMaxPacketSize
>> bytes for receive buffers. Do this even for DMA-aligned buffers if the
>> receive buffer size is not a multiple of wMaxPacketSize. At the same time,
>> do not update chan->xfer_len if the transfer size is 0.
>>
>> Reported-by: Boris ARZUR <boris@konbu.org>
>> Cc: Boris ARZUR <boris@konbu.org>
>> Cc: Jonathan Bell <jonathan@raspberrypi.org>
>> Cc: Antti Seppälä <a.seppala@gmail.com>
>> Fixes: 56406e017a88 ("usb: dwc2: Fix DMA alignment to start at allocated boundary")
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> drivers/usb/dwc2/hcd.c | 37 +++++++++++++++++++++++++++----------
>> 1 file changed, 27 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
>> index b5841197165a..f27dc11e409c 100644
>> --- a/drivers/usb/dwc2/hcd.c
>> +++ b/drivers/usb/dwc2/hcd.c
>> @@ -1313,18 +1313,20 @@ static void dwc2_hc_start_transfer(struct dwc2_hsotg *hsotg,
>> 			if (num_packets > max_hc_pkt_count) {
>> 				num_packets = max_hc_pkt_count;
>> 				chan->xfer_len = num_packets * chan->max_packet;
>> +			} else if (chan->ep_is_in) {
>> +				/*
>> +				 * Always program an integral # of max packets for IN
>> +				 * transfers.
>> +				 * Note: This assumes that the input buffer is
>> +				 * aligned accordingly.
>> +				 */
>> +				chan->xfer_len = num_packets * chan->max_packet;
>> 			}
>> 		} else {
>> 			/* Need 1 packet for transfer length of 0 */
>> 			num_packets = 1;
>> 		}
>>
>> -		if (chan->ep_is_in)
>> -			/*
>> -			 * Always program an integral # of max packets for IN
>> -			 * transfers
>> -			 */
>> -			chan->xfer_len = num_packets * chan->max_packet;
>>
>> 		if (chan->ep_type == USB_ENDPOINT_XFER_INT ||
>> 		    chan->ep_type == USB_ENDPOINT_XFER_ISOC)
>> @@ -2505,16 +2507,31 @@ static void dwc2_free_dma_aligned_buffer(struct urb *urb)
>> static int dwc2_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
>> {
>> 	struct dma_aligned_buffer *temp, *kmalloc_ptr;
>> +	struct usb_host_endpoint *ep = urb->ep;
>> +	int maxp = usb_endpoint_maxp(&ep->desc);
>> 	size_t kmalloc_size;
>>
>> -	if (urb->num_sgs || urb->sg ||
>> -	    urb->transfer_buffer_length == 0 ||
>> +	if (urb->num_sgs || urb->sg || urb->transfer_buffer_length == 0)
>> +		return 0;
>> +
>> +	/*
>> +	 * Input transfer buffer size must be a multiple of the endpoint's
>> +	 * maximum packet size to match the transfer limit programmed into
>> +	 * the chip.
>> +	 * See calculation of chan->xfer_len in dwc2_hc_start_transfer().
>> +	 */
>> +	if (usb_urb_dir_out(urb))
>> +		kmalloc_size = urb->transfer_buffer_length;
>> +	else
>> +		kmalloc_size = roundup(urb->transfer_buffer_length, maxp);
>> +
>> +	if (kmalloc_size == urb->transfer_buffer_length &&
>> 	    !((uintptr_t)urb->transfer_buffer & (DWC2_USB_DMA_ALIGN - 1)))
>> 		return 0;
>>
>> 	/* Allocate a buffer with enough padding for alignment */
>> -	kmalloc_size = urb->transfer_buffer_length +
>> -		sizeof(struct dma_aligned_buffer) + DWC2_USB_DMA_ALIGN - 1;
>> +	kmalloc_size += sizeof(struct dma_aligned_buffer) +
>> +		DWC2_USB_DMA_ALIGN - 1;
>>
>> 	kmalloc_ptr = kmalloc(kmalloc_size, mem_flags);
>> 	if (!kmalloc_ptr)
>> -- 
>> 2.17.1
>>
> 

