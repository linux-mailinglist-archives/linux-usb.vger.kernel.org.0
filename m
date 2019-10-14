Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3E3D6338
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 15:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729994AbfJNNBG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 09:01:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:56901 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728811AbfJNNBF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Oct 2019 09:01:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Oct 2019 06:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; 
   d="scan'208";a="220093634"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga004.fm.intel.com with ESMTP; 14 Oct 2019 06:01:03 -0700
Subject: Re: Regression: USB/xhci issues on some systems with newer kernel
 versions
To:     Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>,
        linux-usb@vger.kernel.org
References: <3edaf835-7cde-37d9-5a0a-5a9b21a02968@gmx.at>
 <4dfc2bca-e333-4f05-e795-23cbe481d53e@linux.intel.com>
 <485bd962-2a2d-1e15-54c6-3685fb7597a3@gmx.at>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <50ecb110-8ab6-929b-e33e-025e04a12bc8@linux.intel.com>
Date:   Mon, 14 Oct 2019 16:03:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <485bd962-2a2d-1e15-54c6-3685fb7597a3@gmx.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3.10.2019 18.13, Bernhard Gebetsberger wrote:
> I sent the instructions to one of the users in the bug tracker.
> Here is the download link for his logs: https://www.sendspace.com/file/413hlj
> 

Thanks.
Traces show driver handles the Transaction error normally by issuing a endpoint reset,
which is successful, but after that there is no activity on that endpoint even if there
are over 120 transfers requests (TRB) pending.
After over 40 seconds the class driver starts canceling the pending transfers.

after soft retry the xhci driver should ring the doorbell of the endpoint, and hardware
should start processing pending TRBs, but ring is not handling pending TRBs
Looks like either driver or hardware fails to start the endpoint ring again

I'll add some more tracing to check driver correctly rings the endpoint doorbell.


Details of trace:

-Several TRBs (over 120) queued for slot 4 ep 3 (ep1in-bulk), starting at 0xff2d1000, up to 0xff2d1800 (0x10 per TRB)

   164.884097: xhci_urb_enqueue: ep1in-bulk: urb 000000005ebe7973 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
   164.884099: xhci_queue_trb: BULK: Buffer 00000000f9e2304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
   164.884101: xhci_inc_enq: BULK 00000000be510b60: enq 0x00000000ff2d1010(0x00000000ff2d1000) deq 0x00000000ff2d1000(0x00000000ff2d1000)
   ...
   164.884304: xhci_urb_enqueue: ep1in-bulk: urb 00000000fee4e260 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
   164.884304: xhci_queue_trb: BULK: Buffer 00000000ff3a304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
   164.884304: xhci_inc_enq: BULK 00000000be510b60: enq 0x00000000ff2d1800(0x00000000ff2d1000) deq 0x00000000ff2d1000(0x00000000ff2d1000)

-Transaction error 3 seconds later for TRB at 0xff2d1000

   167.578273: xhci_handle_event: EVENT: TRB 00000000ff2d1000 status 'USB Transaction Error' len 3860 slot 4 ep 3 type 'Transfer Event' flags e:c
   167.578288: xhci_handle_transfer: BULK: Buffer 00000000f9e2304c length 3860 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C

-Soft retry by issuing a host side reset endpoint command,

   167.578297: xhci_queue_trb: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 4 ep 3 flags C
   167.578416: xhci_handle_event: EVENT: TRB 00000000ffefe440 status 'Success' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:c

-Host side of endpoint reset successful, endpoint is in stopped state as it should

   167.578417: xhci_handle_command: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 4 ep 3 flags C
   167.578419: xhci_handle_cmd_reset_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst

-Driver should ring endpoint doorbell, and hardware should continue procressing TRBs
No activity at all on slot 4 ep 3, other endpoints continue running normally.
Check driver really rang ep doorbell

A lot later class driver asks to cancel pending tranfer:

   214.132531: xhci_urb_dequeue: ep1in-bulk: urb 000000005ebe7973 pipe 3221259648 slot 4 length 0/3860 sgs 0/0 stream 0 flags 00010200
   214.132548: xhci_dbg_cancel_urb: Cancel URB 000000005ebe7973, dev 2, ep 0x81, starting at offset 0xff2d1000

-xhci driver tries to stop endpoint to cancel transfer:

   214.132555: xhci_queue_trb: CMD: Stop Ring Command: slot 4 sp 0 ep 3 flags C

-but it fails as slot is not in a proper state to be stopped, ep is in halted state after failed stop attempt.

   214.132679: xhci_handle_event: EVENT: TRB 00000000ffefe450 status 'Context State Error' len 0 slot 4 ep 0 type 'Command Completion Event' flags e:C
   214.132680: xhci_handle_command: CMD: Stop Ring Command: slot 4 sp 0 ep 3 flags C
   214.132682: xhci_handle_cmd_stop_ep: State halted mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 0 maxp 512

-After this endpoint stays in halted state, xhci driver fails to recover from this while canceling the reset of the TRBs
  
-Mathias
