Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE83213D04
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 17:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgGCPyl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 11:54:41 -0400
Received: from mga07.intel.com ([134.134.136.100]:64386 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgGCPyk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 11:54:40 -0400
IronPort-SDR: VqGC1HxPJgFgSOb8J0sgDzyxTHi4qSe9NpRkjQr0+RAgDC/Pyz6yxjjA7DKKK7ucToxkuBPFEW
 VPrzT712hcGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9671"; a="212182818"
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; 
   d="scan'208";a="212182818"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2020 08:54:36 -0700
IronPort-SDR: t3LDikhz+/toI6zWH8wgX7P6fTedOBgZkGRxotdnORcZxbEqrdhb13RJXXv+AcWv5/GyrWkFew
 2GimKqbtvr6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; 
   d="scan'208";a="313349334"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 03 Jul 2020 08:54:35 -0700
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 4 comp_code 1
To:     Fabian Melzow <fabian.melzow@gmail.com>
Cc:     linux-usb@vger.kernel.org
References: <20200620211913.1535bac0@ping>
 <264e8287-b538-0798-36a6-7eafc4387a8d@linux.intel.com>
 <20200630185803.2a72c123@ping>
 <f41aab00-ea04-bdd2-4174-33b2b19dc850@linux.intel.com>
 <20200701195138.21940697@ping>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <663b3b0e-126e-7d21-1221-3fda6da432d9@linux.intel.com>
Date:   Fri, 3 Jul 2020 18:57:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200701195138.21940697@ping>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1.7.2020 20.51, Fabian Melzow wrote:
> Am Tue, 30 Jun 2020 22:03:29 +0300
> schrieb Mathias Nyman <mathias.nyman@linux.intel.com>:
> 
>> On 30.6.2020 19.58, Fabian Melzow wrote:
> 
>>> I successful applied the patch against Linux 5.7.4, but get this
>>> error when compiling drivers/usb/host/xhci-ring.c:
>>>
>>>   CC [M]  drivers/usb/host/xhci-ring.o
>>> drivers/usb/host/xhci-ring.c: In function ‘xhci_handle_cmd_stop_ep’:
>>> drivers/usb/host/xhci-ring.c:857:3: error: implicit declaration of
>>> function ‘xhci_reset_halted_ep’
>>> [-Werror=implicit-function-declaration] 857 |
>>> xhci_reset_halted_ep(xhci, slot_id, ep_index, reset_type); |
>>> ^~~~~~~~~~~~~~~~~~~~ 
>>
>> Right, forgot that you need another patch before this.
> 
> Applied it and after recompiling I get:
> 
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Get port status 5-1 read: 0x2a0, return 0x100
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Waiting for status stage event
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Successful Set TR Deq Ptr cmd, deq = @fedf51f0
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Ignoring reset ep completion code of 1
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Giveback URB 0000000096cbf5fe, len = 0, expected = 4, status = -32
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Set TR Deq Ptr cmd, new deq seg = 00000000a8c5372f (0xfedf5000 dma), new deq ptr = 00000000037c6b7a (0xfedf51f0 dma), new cycle = 1
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Queueing new dequeue state
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: New dequeue pointer = 0xfedf51f0 (DMA)
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: New dequeue segment = 00000000a8c5372f (virtual)
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Cycle state = 0x1
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Finding endpoint context
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Cleaning up stalled endpoint ring
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Stalled endpoint for slot 1 ep 0
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Successful Set TR Deq Ptr cmd, deq = @fedf51c0
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Set TR Deq Ptr cmd, new deq seg = 00000000a8c5372f (0xfedf5000 dma), new deq ptr = 000000007e18677c (0xfedf51c0 dma), new cycle = 1
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: New dequeue pointer = 0xfedf51c0 (DMA)
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: New dequeue segment = 00000000a8c5372f (virtual)
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Cycle state = 0x1
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Finding endpoint context
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Removing canceled TD starting at 0xfedf5190 (dma).
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Stopped on Transfer TRB for slot 1 ep 0
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
> Jul 01 19:06:29 ping kernel: xhci_hcd 0000:09:00.3: Cancel URB 000000009a11684b, dev 2, ep 0x0, starting at offset 0xfedf5190
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Successful Set TR Deq Ptr cmd, deq = @fede7830
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Ignoring reset ep completion code of 1
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Giveback URB 000000009a11684b, len = 0, expected = 4, status = -32
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Set TR Deq Ptr cmd, new deq seg = 0000000010319786 (0xfede7000 dma), new deq ptr = 0000000083eff911 (0xfede7830 dma), new cycle = 1
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Queueing new dequeue state
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: New dequeue pointer = 0xfede7830 (DMA)
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: New dequeue segment = 0000000010319786 (virtual)
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Cycle state = 0x1
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Finding endpoint context
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Cleaning up stalled endpoint ring
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Stalled endpoint for slot 2 ep 0
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Successful Set TR Deq Ptr cmd, deq = @fede7800
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Ignoring reset ep completion code of 1
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Giveback URB 000000009a11684b, len = 0, expected = 10, status = -32
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Set TR Deq Ptr cmd, new deq seg = 0000000010319786 (0xfede7000 dma), new deq ptr = 00000000ad85653f (0xfede7800 dma), new cycle = 1
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Queueing new dequeue state
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: New dequeue pointer = 0xfede7800 (DMA)
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: New dequeue segment = 0000000010319786 (virtual)
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Cycle state = 0x1
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Finding endpoint context
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Cleaning up stalled endpoint ring
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Stalled endpoint for slot 2 ep 0
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Waiting for status stage event
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Waiting for status stage event
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: Waiting for status stage event
> Jul 01 19:06:24 ping kernel: xhci_hcd 0000:09:00.3: xhci_hub_status_data: stopping port polling.
> Jul 01 19:06:24 ping kernel: usb usb6: bus auto-suspend, wakeup 1
> 
> Look like the problem is fixed, but if you want, you can check the
> debuglogs at http://fabi.bplaced.net/debuglogs2.tar.xz

Thanks, I'll need to take a closer look at those.
I'll be away for the next two weeks which will cause some delay

-Mathias

