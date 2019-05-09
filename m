Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B49DF18CAD
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 17:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbfEIPHt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 11:07:49 -0400
Received: from mga18.intel.com ([134.134.136.126]:33170 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726234AbfEIPHs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 May 2019 11:07:48 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 May 2019 08:07:47 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by FMSMGA003.fm.intel.com with ESMTP; 09 May 2019 08:07:45 -0700
Subject: Re: [PATCH 1/4] usb: xhci: add Immediate Data Transfer support
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
References: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
 <1556285012-28186-2-git-send-email-mathias.nyman@linux.intel.com>
 <CGME20190509103220eucas1p1330f2827916b55e05b1b791504963630@eucas1p1.samsung.com>
 <bc747768-7457-0df6-f57e-4aeac9c8bf0c@samsung.com>
 <3fe85fcc-a202-f746-6cd6-d3f5523348f8@linux.intel.com>
 <a369ba3931e3df113101ce9e52634e5c2ef0b957.camel@suse.de>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <b4e49d68-a94e-f6fb-6439-78ef0ff898ef@linux.intel.com>
Date:   Thu, 9 May 2019 18:10:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <a369ba3931e3df113101ce9e52634e5c2ef0b957.camel@suse.de>
Content-Type: multipart/mixed;
 boundary="------------6A10BD124C5667F71A81D538"
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------6A10BD124C5667F71A81D538
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9.5.2019 14.51, Nicolas Saenz Julienne wrote:
> On Thu, 2019-05-09 at 14:40 +0300, Mathias Nyman wrote:
>> On 9.5.2019 13.32, Marek Szyprowski wrote:
>>> Dear All,
>>>
>>> On 2019-04-26 15:23, Mathias Nyman wrote:
>>>> From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>>>>
>>>> Immediate data transfers (IDT) allow the HCD to copy small chunks of
>>>> data (up to 8bytes) directly into its output transfer TRBs. This avoids
>>>> the somewhat expensive DMA mappings that are performed by default on
>>>> most URBs submissions.
>>>>
>>>> In the case an URB was suitable for IDT. The data is directly copied
>>>> into the "Data Buffer Pointer" region of the TRB and the IDT flag is
>>>> set. Instead of triggering memory accesses the HC will use the data
>>>> directly.
>>>>
>>>> The implementation could cover all kind of output endpoints. Yet
>>>> Isochronous endpoints are bypassed as I was unable to find one that
>>>> matched IDT's constraints. As we try to bypass the default DMA mappings
>>>> on URB buffers we'd need to find a Isochronous device with an
>>>> urb->transfer_buffer_length <= 8 bytes.
>>>>
>>>> The implementation takes into account that the 8 byte buffers provided
>>>> by the URB will never cross a 64KB boundary.
>>>>
>>>> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>>>> Reviewed-by: Felipe Balbi <felipe.balbi@linux.intel.com>
>>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>
>>> I've noticed that this patch causes regression on various Samsung Exynos
>>> 5420/5422/5800 boards, which have USB3.0 host ports provided by
>>> DWC3/XHCI hardware module. The regression can be observed with ASIX USB
>>> 2.0 ethernet dongle, which stops working after applying this patch (eth0
>>> interface is registered, but no packets are transmitted/received). I can
>>> provide more debugging information or do some tests, just let me know
>>> what do you need. Reverting this commit makes ASIX USB ethernet dongle
>>> operational again.
>>>
>>
>> Thanks for reporting.
>>
>> Would it be possible to check if your ASIX ethernet dongle works on some
>> desktop/laptop setup with this same IDT patch?
>>
>> Also Exynos xhci traces could help, they would show the content of the TRBs
>> using IDT.
>> Maybe byte order gets messed up?
>>
>> Take traces with:
>>
>> mount -t debugfs none /sys/kernel/debug
>> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
>> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
>>
>> <connect ASIX eth dongle, try to use it>
>>
>> send /sys/kernel/debug/tracing/trace content to me
>>
>> If we can't get this fixed I'll revert the IDT patch
> 
> Hi Matthias, thanks for your help.
> 
> I'll also be looking into it, so please send me the logs too.
> 

Got the logs off list, thanks

The "Buffer" data in Control transfer Data stage look suspicious.

grep "flags I:" trace_fail  | grep Data
kworker/0:2-124   [000] d..1    63.092399: xhci_queue_trb: CTRL: Buffer 0000000018b65000 length 6 TD size 0 intr 0 type 'Data Stage' flags I:i:c:s:i:e:C
ifconfig-1429  [005] d..1    93.181231: xhci_queue_trb: CTRL: Buffer 0000000018b65000 length 6 TD size 0 intr 0 type 'Data Stage' flags I:i:c:s:i:e:C
ifconfig-1429  [007] dn.2    93.182050: xhci_queue_trb: CTRL: Buffer 0000000000000000 length 8 TD size 0 intr 0 type 'Data Stage' flags I:i:c:s:i:e:C
ifconfig-1429  [007] d..2    93.182499: xhci_queue_trb: CTRL: Buffer 0000000080000000 length 8 TD size 0 intr 0 type 'Data Stage' flags I:i:c:s:i:e:C
ifconfig-1429  [007] d..2    93.182736: xhci_queue_trb: CTRL: Buffer 0000000080000000 length 8 TD size 0 intr 0 type 'Data Stage' flags I:i:c:s:i:e:C
kworker/0:3-1409  [000] d..3    93.382630: xhci_queue_trb: CTRL: Buffer 0000000080000000 length 8 TD size 0 intr 0 type 'Data Stage' flags I:i:c:s:i:e:C

First guess would be that in case URB has URB_NO_TRANSFER_DMA_MAP set then data
will be mapped and urb->transfer_dma is already set.
The IDT patch uses urb->trabfer_dma as a temporary buffer, and copies the
urb->transfer_buffer there.
if transfer buffer is already dma mapped the urb->transfer_buffer can be garbage,
(shouldn't, but it can be)

Below code avoids IDT if URB_NO_TRANSFER_DMA_MAP is set, and doesn't touch
urb->transfer_dma (patch attached)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fed3385..f080054 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3423,11 +3423,14 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
  
         if (urb->transfer_buffer_length > 0) {
                 u32 length_field, remainder;
+               u64 addr;
  
                 if (xhci_urb_suitable_for_idt(urb)) {
-                       memcpy(&urb->transfer_dma, urb->transfer_buffer,
+                       memcpy(&addr, urb->transfer_buffer,
                                urb->transfer_buffer_length);
                         field |= TRB_IDT;
+               } else {
+                       addr = (u64) urb->transfer_dma;
                 }
  
                 remainder = xhci_td_remainder(xhci, 0,
@@ -3440,8 +3443,8 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
                 if (setup->bRequestType & USB_DIR_IN)
                         field |= TRB_DIR_IN;
                 queue_trb(xhci, ep_ring, true,
-                               lower_32_bits(urb->transfer_dma),
-                               upper_32_bits(urb->transfer_dma),
+                               lower_32_bits(addr),
+                               upper_32_bits(addr),
                                 length_field,
                                 field | ep_ring->cycle_state);
         }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a450a99..7f8b950 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2160,7 +2160,8 @@ static inline bool xhci_urb_suitable_for_idt(struct urb *urb)
  {
         if (!usb_endpoint_xfer_isoc(&urb->ep->desc) && usb_urb_dir_out(urb) &&
             usb_endpoint_maxp(&urb->ep->desc) >= TRB_IDT_MAX_SIZE &&
-           urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE)
+           urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE &&
+           !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
                 return true;
  
         return false;

If that doesn't help, then it's possible DATA trbs in control transfer can't
use IDT at all. IDT is supported for Normal TRBs, which have a different trb
type than DATA trbs in control transfers.

Also xhci specs 4.11.7 limit IDT usage:

"If the IDT flag is set in one TRB of a TD, then it shall be the only Transfer
  TRB of the TD"

A whole control transfer is one TD, and it already contains a SETUP transfer TRB
which is using the IDT flag.

Following disables IDT for control transfers (testpatch attached as well)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fed3385..4c1c9ad 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3424,12 +3424,6 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
         if (urb->transfer_buffer_length > 0) {
                 u32 length_field, remainder;
  
-               if (xhci_urb_suitable_for_idt(urb)) {
-                       memcpy(&urb->transfer_dma, urb->transfer_buffer,
-                              urb->transfer_buffer_length);
-                       field |= TRB_IDT;
-               }
-
                 remainder = xhci_td_remainder(xhci, 0,
                                 urb->transfer_buffer_length,
                                 urb->transfer_buffer_length,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a450a99..2e16ff7 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2158,9 +2158,11 @@ static inline struct xhci_ring *xhci_urb_to_transfer_ring(struct xhci_hcd *xhci,
   */
  static inline bool xhci_urb_suitable_for_idt(struct urb *urb)
  {
-       if (!usb_endpoint_xfer_isoc(&urb->ep->desc) && usb_urb_dir_out(urb) &&
+       if (!usb_endpoint_xfer_control(&urb->ep->desc) &&
+           !usb_endpoint_xfer_isoc(&urb->ep->desc) && usb_urb_dir_out(urb) &&
             usb_endpoint_maxp(&urb->ep->desc) >= TRB_IDT_MAX_SIZE &&
-           urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE)
+           urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE &&
+           !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
                 return true;
  
         return false;

-Mathias

--------------6A10BD124C5667F71A81D538
Content-Type: text/x-patch;
 name="0001-xhci-Don-t-use-IDT-tranfers-when-not-supported.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xhci-Don-t-use-IDT-tranfers-when-not-supported.patch"

From c92d0e83f24d9a8f401ef5c91ebc8263fd9d2a56 Mon Sep 17 00:00:00 2001
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Thu, 9 May 2019 17:47:28 +0300
Subject: [TESTPATCH2] xhci: Don't use IDT tranfers when not supported

control tranfer data stage can't support IDT as xHCI can't have two
IDT flags in the same TD.
The SETUP stage is already using IDT
see xhci 4.11.7 for details

Also don't use IDT if tranfer buffer is already dma mapped.
There is no benefit with IDT then.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 6 ------
 drivers/usb/host/xhci.h      | 6 ++++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fed3385..4c1c9ad 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3424,12 +3424,6 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	if (urb->transfer_buffer_length > 0) {
 		u32 length_field, remainder;
 
-		if (xhci_urb_suitable_for_idt(urb)) {
-			memcpy(&urb->transfer_dma, urb->transfer_buffer,
-			       urb->transfer_buffer_length);
-			field |= TRB_IDT;
-		}
-
 		remainder = xhci_td_remainder(xhci, 0,
 				urb->transfer_buffer_length,
 				urb->transfer_buffer_length,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a450a99..2e16ff7 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2158,9 +2158,11 @@ static inline struct xhci_ring *xhci_urb_to_transfer_ring(struct xhci_hcd *xhci,
  */
 static inline bool xhci_urb_suitable_for_idt(struct urb *urb)
 {
-	if (!usb_endpoint_xfer_isoc(&urb->ep->desc) && usb_urb_dir_out(urb) &&
+	if (!usb_endpoint_xfer_control(&urb->ep->desc) &&
+	    !usb_endpoint_xfer_isoc(&urb->ep->desc) && usb_urb_dir_out(urb) &&
 	    usb_endpoint_maxp(&urb->ep->desc) >= TRB_IDT_MAX_SIZE &&
-	    urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE)
+	    urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE &&
+	    !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
 		return true;
 
 	return false;
-- 
2.7.4


--------------6A10BD124C5667F71A81D538
Content-Type: text/x-patch;
 name="0001-xhci-don-t-use-IDT-transfer-buffer-is-already-dma-ma.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xhci-don-t-use-IDT-transfer-buffer-is-already-dma-ma.pa";
 filename*1="tch"

From 485c5ede4d2e237c7f28f0cbb891151f88718e5b Mon Sep 17 00:00:00 2001
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Thu, 9 May 2019 17:47:28 +0300
Subject: [TESTPATCH1] xhci: don't use IDT transfer buffer is already dma
 mapped

Limit IDT usage if transfer buffer is already mapped.
Also don't use urb->transfer_dma as a temporary buffer

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 9 ++++++---
 drivers/usb/host/xhci.h      | 3 ++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fed3385..f080054 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3423,11 +3423,14 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 	if (urb->transfer_buffer_length > 0) {
 		u32 length_field, remainder;
+		u64 addr;
 
 		if (xhci_urb_suitable_for_idt(urb)) {
-			memcpy(&urb->transfer_dma, urb->transfer_buffer,
+			memcpy(&addr, urb->transfer_buffer,
 			       urb->transfer_buffer_length);
 			field |= TRB_IDT;
+		} else {
+			addr = (u64) urb->transfer_dma;
 		}
 
 		remainder = xhci_td_remainder(xhci, 0,
@@ -3440,8 +3443,8 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		if (setup->bRequestType & USB_DIR_IN)
 			field |= TRB_DIR_IN;
 		queue_trb(xhci, ep_ring, true,
-				lower_32_bits(urb->transfer_dma),
-				upper_32_bits(urb->transfer_dma),
+				lower_32_bits(addr),
+				upper_32_bits(addr),
 				length_field,
 				field | ep_ring->cycle_state);
 	}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a450a99..7f8b950 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2160,7 +2160,8 @@ static inline bool xhci_urb_suitable_for_idt(struct urb *urb)
 {
 	if (!usb_endpoint_xfer_isoc(&urb->ep->desc) && usb_urb_dir_out(urb) &&
 	    usb_endpoint_maxp(&urb->ep->desc) >= TRB_IDT_MAX_SIZE &&
-	    urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE)
+	    urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE &&
+	    !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
 		return true;
 
 	return false;
-- 
2.7.4


--------------6A10BD124C5667F71A81D538--
