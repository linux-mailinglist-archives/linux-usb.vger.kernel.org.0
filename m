Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5A9F9FC46
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 09:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfH1Hzp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 03:55:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:35413 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbfH1Hzo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 03:55:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 00:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; 
   d="scan'208";a="180479864"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2019 00:55:42 -0700
Subject: Re: fsck on ext4: "WARN Wrong bounce buffer write length: 1024 != 0"
To:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Harald Dunkel <harald.dunkel@aixigo.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org
References: <22367f07-3448-f771-0363-b5c6f500b77d@aixigo.com>
 <20190827163511.GM28066@mit.edu>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <7b5b6185-fc81-8675-06d1-fc7dae3b47b0@linux.intel.com>
Date:   Wed, 28 Aug 2019 10:57:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827163511.GM28066@mit.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27.8.2019 19.35, Theodore Y. Ts'o wrote:
> On Tue, Aug 27, 2019 at 08:00:14AM +0200, Harald Dunkel wrote:
>> FYI: "fsck -y" on an external USB drive (USB-C, ext4) gave
>> me a ton of messages
>>
>> :
>> [  191.261939] xhci_hcd 0000:05:00.0: WARN Wrong bounce buffer write length: 1024 != 0
>> [  191.263743] xhci_hcd 0000:05:00.0: WARN Wrong bounce buffer write length: 1024 != 0
>> [  191.263788] xhci_hcd 0000:05:00.0: WARN Wrong bounce buffer write length: 1024 != 0
>> [  191.263840] xhci_hcd 0000:05:00.0: WARN Wrong bounce buffer write length: 1024 != 0
>> [  191.266857] xhci_hcd 0000:05:00.0: WARN Wrong bounce buffer write length: 1024 != 0
>> :
>>
>> Related to 597c56e372dab2c7f79b8d700aad3a5deebf9d1b, AFAICT.
>>
>> Kernel is 4.19.67-1 (Debian proposed-updates).
> 
> +mathias.nyman@intel.com, linux-usb@vger.kernel.org
> linux-ext4 to BCC
> 
> That's a USB XHCI issue, not an ext4 issue.  I'm handing this to the
> XHCI maintainer and the Linux USB mailing list.
> 

The warning message is incorrect, data should be fine.

Looks like this length check code was copied from the read side to the write side,
but some details were not updated.

Below code should fix it:

--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3202,10 +3202,10 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
         if (usb_urb_dir_out(urb)) {
                 len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
                                    seg->bounce_buf, new_buff_len, enqd_len);
-               if (len != seg->bounce_len)
+               if (len != new_buff_len)
                         xhci_warn(xhci,
                                 "WARN Wrong bounce buffer write length: %zu != %d\n",
-                               len, seg->bounce_len);
+                               len, new_buff_len);
                 seg->bounce_dma = dma_map_single(dev, seg->bounce_buf,
                                                  max_pkt, DMA_TO_DEVICE);
         } else {

   

I'll submit a proper patch

-Mathias
