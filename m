Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B70310519D
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 12:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfKULqr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 06:46:47 -0500
Received: from mga02.intel.com ([134.134.136.20]:40542 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbfKULqr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Nov 2019 06:46:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Nov 2019 03:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; 
   d="scan'208";a="219051523"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga002.jf.intel.com with ESMTP; 21 Nov 2019 03:46:45 -0800
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 2 comp_code 13
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     USB list <linux-usb@vger.kernel.org>
References: <F9C894A9-D1D8-455E-B5F6-C5EA08A80C79@canonical.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <4552b779-4b5a-7e81-39ec-0a4229b5d84d@linux.intel.com>
Date:   Thu, 21 Nov 2019 13:48:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <F9C894A9-D1D8-455E-B5F6-C5EA08A80C79@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.11.2019 9.38, Kai-Heng Feng wrote:
> Hi,
> 
> Currently there are two quirks for Dell TB16 to workaround an issue:
> "xhci: Bad Ethernet performance plugged in ASM1042A host", and
> "r8152: disable RX aggregation on Dell TB16 dock".
> 
> However, the issue wasn't analyzed and root caused. I'd like to understand what's really going on here.
> Reverting those two patches, and as soon as doing TX/RX over the ethernet on TB16, xhci_hcd errors out:
> 
> [   69.803804] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.803807] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1010 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.803900] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.803901] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1020 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.803998] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.803999] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1030 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.804096] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.804099] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1040 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.955830] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.955847] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1050 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.956704] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.956718] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1060 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   69.963802] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   69.963819] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1070 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> [   70.112302] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
> [   70.112321] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1080 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
> 
> So, under what circumstances the DMA pointer can be out of the TD?
> 

When the TRB pointer field of the transfer event doesn't point to a TRB
in the TD the xhci driver was expecting next.
In your case xhci driver expects an event for a TD (TRB) at 0x47c4b0fe0

Looks like driver didn't get that event, or didn't handle it properly.
Hardware continues processing TRBs in the ring, sending events for later TDs.

Your case looks something like this:
endpoint ring segment 1: 256 TRBs (47c047c4b0000 -47c4b0ff0)
000000047c4b0000  1st TRB
000000047c4b0010  2nd TRB
....
000000047c4b0fd0  TRB that driver has handled
000000047c4b0fe0  TRB driver expect an event for
000000047c4b0ff0  LINK TRB, Last TRB of this segment, points to next segment. (probably pointing to 000000047c4b1000
  
endpoint ring segment 2: 256 TRBs (probably 47c047c4b1000 -47c4b1ff0)
000000047c4b1000  TRB (Log donsn't cover this, probably hw competed?)
000000047c4b1010  TRB hardware has completed (short packet 13)
000000047c4b1020  TRB hardware has completed (short packet 13)
000000047c4b1030  TRB hardware has completed (short packet 13)
000000047c4b1040  TRB hardware has completed (short packet 13)
000000047c4b1050  TRB hardware has completed (short packet 13)
000000047c4b1060  TRB hardware has completed (short packet 13)
000000047c4b1070  TRB hardware has completed (short packet 13)
000000047c4b1080  TRB hardware has completed (short packet 13), hardware handling is here while software still waiting for an event for TRB at 47c4b0fe0

If you can get xhci traces, dmesg and a snapshot of the xhci event and transfer ring
ring after this, we could see if hardware ever wrote the missing event to the event ring,
or if driver just failed to handle it properly.

I don't have a nice way of triggering ring dumping at some specific instance, but there
is generic debugfs ring dump code in xhci-debugfs.c

(cat /sys/kernel/debug/usb/xhci/0000:3f:00.0/event-ring/trbs for sample output)
  
-Mathias




