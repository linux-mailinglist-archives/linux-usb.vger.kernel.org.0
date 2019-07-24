Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8D9F73344
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 18:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbfGXQB1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 12:01:27 -0400
Received: from mga04.intel.com ([192.55.52.120]:23744 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728494AbfGXQB1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jul 2019 12:01:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jul 2019 09:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,303,1559545200"; 
   d="scan'208";a="321380911"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga004.jf.intel.com with ESMTP; 24 Jul 2019 09:01:25 -0700
Subject: Re: KERNEL CRASH when using XHCI devices (affects any architecture,
 any USB device)
To:     Maik Stohn <maik.stohn@seal-one.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <21B63064-BAD5-4DC3-8E1A-3986CD948A93@seal-one.com>
 <20190724142031.GA3087@kroah.com>
 <F200CEE8-2611-4A83-A5FE-3D8A9E588BCD@seal-one.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <fca83889-e320-d0e0-fbb7-d260f1fcaaed@linux.intel.com>
Date:   Wed, 24 Jul 2019 19:03:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <F200CEE8-2611-4A83-A5FE-3D8A9E588BCD@seal-one.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.7.2019 17.34, Maik Stohn wrote:
>>
>> Am 24.07.2019 um 16:20 schrieb Greg KH <gregkh@linuxfoundation.org>:
>>
>> On Wed, Jul 24, 2019 at 03:27:51PM +0200, Maik Stohn wrote:
>>> KERNEL CRASH when using XHCI devices (affects any architecture, any USB device)
>>>
>>> This was already reported as a kernel bug in bugzilla (https://bugzilla.kernel.org/show_bug.cgi?id=204257) but I got told to report it here since it is usb related...
>>>
>>> Affected kernels: 5.2, 5.2.1, 5.2.2, 5.3-rc1, ...
>>>
>>> This bug is already causing real world problems with existing software and devices using SCSI BOT with raw SCSI commands and libusb software.
>>>
>>> Reproduce (tested on several different machines with 5.2,5.2.1,5.2.2,5.3rc1):
>>>
>>> - usb flash drive attached to XHCI controller (e.g. USB3.0 flash drive attached to USB3.0 port)
>>> - generic scsi module loaded (e.g. /dev/sg0 comes up when attaching the flash drive)
>>> - command line tool "sg_raw" from "sg3-utils"
>>> - execute: and press a key + return (-s1 sends one byte which is read from stdin)
>>>    $ sudo sg_raw -s1 /dev/sg0 00 00 00 00 00 00 00 00 00 00
>>>
>>> -> KERNEL Oops
>>>
>>> - same for -s2, -s3, ... up to -s8   (sending 1 to 8 bytes, exactly the maximum of bytes on my 64 bit machine where the "DMA bypass optimization / IDT" kicks in, see below)
>>>
>>> Since this can be triggered by any normal user (without any special USB device needed) I think it is important enough to fix it for the existing 5.2 kernel as well.
>>>
>>> ---
>>>
>>> Patch introducing the crash:  https://patchwork.kernel.org/patch/10919167 / commit 33e39350ebd20fe6a77a51b8c21c3aa6b4a208cf - "usb: xhci: add Immediate Data Transfer support"
>>>
>>> Reason: NULL pointer dereference
>>>
>>> ---
>>>
>>> I took me quite some time to find the cause of this.
>>>
>>> I narrowed the crash down to the place inside of "xhci_queue_bulk_tx" in "xhci-ring.c" where the next SG is loaded
>>>
>>> ...
>>>     while (sg && sent_len >= block_len) {
>>>       /* New sg entry */
>>>       --num_sgs;
>>>       sent_len -= block_len;
>>>       if (num_sgs != 0) {
>>>         sg = sg_next(sg);
>>>         block_len = sg_dma_len(sg);           <================= CRASH
>>>                                                                  The comment of "sg_dma_len" clearly states "These macros should be used after a dma_map_sg call has been done..." - which was
>>>                                                                  omitted by the new "xhci_map_urb_for_dma" function since the transfer was considered suitable for IDT.
>>>         addr = (u64) sg_dma_address(sg);
>>>         addr += sent_len;
>>>       }
>>>     }
>>>     block_len -= sent_len;
>>>     send_addr = addr;
>>> ...
>>>
>>> This only happens if the transfer was cosnideres suitable for IDT.
>>> When I patched the function "xhci_urb_suitable_for_idt" to always return false (nothing suitable for IDT) everything was working fine.
>>>
>>>
>>> Unfortunately I'm not deep enough into the inner workings of the kernel usb host driver to find a solution for this other than reverting the patch for IDT.

Nice catch.
The immediate data (IDT) support assumed that when there is max 8 bytes of data,
and it's not already dma mapped then we can just copy the data directly from
urb->transfer_buffer.
											
I didn't take into account that this small amount of data can be in a sg list.

Does the below code help:

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 7a26496..f5c4144 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2175,7 +2175,8 @@ static inline bool xhci_urb_suitable_for_idt(struct urb *urb)
         if (!usb_endpoint_xfer_isoc(&urb->ep->desc) && usb_urb_dir_out(urb) &&
             usb_endpoint_maxp(&urb->ep->desc) >= TRB_IDT_MAX_SIZE &&
             urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE &&
-           !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
+           !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
+           !urb->num_sgs)
                 return true;
  
         return false;


-Mathias
