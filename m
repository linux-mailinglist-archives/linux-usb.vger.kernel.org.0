Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 654B91295E2
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2019 13:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfLWMMn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Dec 2019 07:12:43 -0500
Received: from mga03.intel.com ([134.134.136.65]:39606 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726663AbfLWMMn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Dec 2019 07:12:43 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Dec 2019 04:12:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,347,1571727600"; 
   d="scan'208";a="299661965"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 23 Dec 2019 04:12:41 -0800
Subject: Re: ERROR: unexpected command completion code 0x11 for DJ-Tech CTRL
 (resending as plain text ;)
To:     "Rene D. Obermueller" <cmdrrdo@gmail.com>
Cc:     linux-usb@vger.kernel.org
References: <348c50de-f922-8295-ef87-cf5cdea5c7f4@gmail.com>
 <0a9215c0-99b3-cf8f-381b-e4997e3f5cfe@linux.intel.com>
 <d65f140c-0854-62a5-f21e-5d92f0575635@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <98997f07-80ef-b86a-6702-448e68ff4ffa@linux.intel.com>
Date:   Mon, 23 Dec 2019 14:14:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d65f140c-0854-62a5-f21e-5d92f0575635@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20.12.2019 17.50, Rene D. Obermueller wrote:
> Hello Mathias,
> 
> 
> On 20.12.19 15:48, Mathias Nyman wrote:
> 
>> 0x11 is Parameter error "Asserted by a command if a Context parameter is invalid."
>>
>> adding xhci tracing will show more details.
> [...]
>> Your log shows it's related to the input context pointed to when
>> we issue a configure endpoint command:
> [...]
>>
>> Could be any part of the input context.
>> (input control context, slot context, or one of the endpoint context).
>>
>> xhci tracepoints will show the input control context and the slot context.
>> If those seem fine we might need to add a hack that just dumps everything, including all endpoint contexts
> 
> 
> thanks for the explanation and instructions. Attaching the trace output.
> 
> I've had a brief look at the trace, and I didn't see anything that was obvious to me, but that's probably not saying much. ;)
> 

The Maximum Packet Size of the full-speed bulk endpoint looks a bit suspicious (maxp 4)

12478.521580: xhci_add_endpoint: State disabled mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk OUT burst 0 maxp 4 deq 00000000fff71001

For full speed bulk endpoints only support 8, 16, 32 and 64 bytes Max Packet sizes.
Host are not required to support other values. See USB2 spec section 5.8.3 for details

Maybe forcing it to one of the allowed values could work.
Does the below hack help? (untested)?

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 3b1388fa2f36..29102776baed 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1476,8 +1476,12 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
         if (!usb_endpoint_xfer_isoc(&ep->desc))
                 err_count = 3;
         /* Some devices get this wrong */
-       if (usb_endpoint_xfer_bulk(&ep->desc) && udev->speed == USB_SPEED_HIGH)
-               max_packet = 512;
+       if (usb_endpoint_xfer_bulk(&ep->desc) {
+                       if (udev->speed == USB_SPEED_HIGH)
+                               max_packet = 512;
+                       if (udev->speed == USB_SPEED_FULL)
+                               max_packet = 1 << (fls(clamp_val(max_packet, 8, 64)) - 1);
+               }
         /* xHCI 1.0 and 1.1 indicates that ctrl ep avg TRB Length should be 8 */
         if (usb_endpoint_xfer_control(&ep->desc) && xhci->hci_version >= 0x100)
                 avg_trb_len = 8;
