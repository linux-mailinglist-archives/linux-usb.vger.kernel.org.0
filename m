Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC81364655
	for <lists+linux-usb@lfdr.de>; Mon, 19 Apr 2021 16:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240345AbhDSOlm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Apr 2021 10:41:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:22280 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240459AbhDSOlm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Apr 2021 10:41:42 -0400
IronPort-SDR: O3MDFGyxgAh2O76+grdMYZixqQIuTBuENWjtyH+gueoC1dziMT5VfPiIIjNEQwYAd5lXLtxHVs
 0A7gz8njyg1g==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="256649705"
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; 
   d="scan'208";a="256649705"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2021 07:41:12 -0700
IronPort-SDR: mTMla0W0qCRqNJWbqY6N2uRETA5EpzpR9t3JLj8j2G6sAy5kl5Q5MkEM4gh+gUxGPwiopVSRSI
 4aFD1ICql1Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,234,1613462400"; 
   d="scan'208";a="616614418"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 19 Apr 2021 07:41:10 -0700
Subject: Re: [PATCH] [RFC] xhci: Add Link TRB sync quirk for ASM3142
To:     Ole Salscheider <ole@salscheider.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <20210416093729.41865-1-ole@salscheider.org>
 <9bf0060c-3427-a261-531c-c075054ae094@linux.intel.com>
 <5c92dd8c-c8b0-40b5-addb-2df360673462@salscheider.org>
 <a8b56a79-e092-a344-7508-8c22b6568898@salscheider.org>
From:   Mathias Nyman <mathias.nyman@intel.com>
Message-ID: <e68b481e-a9a1-787e-b263-461bc9597b65@intel.com>
Date:   Mon, 19 Apr 2021 17:43:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a8b56a79-e092-a344-7508-8c22b6568898@salscheider.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 19.4.2021 13.52, Ole Salscheider wrote:
> 
> 
> I tried it a second time today and now I got the DMA error also when tracing was active. You can find the dmesg and trace outputs here:
> 
> https://stuff.salscheider.org/dmesg_out2
> https://stuff.salscheider.org/trace_out2
> 

Thanks. 
It really looks like we just don't get an event for the last transfers TRB on the segment.
In this case bulk transfers are used, one TD per URB, with one TRB in only per TD.

From the trace:
Queue the second last transfer TRB on this segment:
  365.159991: xhci_urb_enqueue: ep3in-bulk: urb 0000000029404272 pipe 3225518720 slot 1 length 0/32768 sgs 0/0 stream 0 flags 00000204
  365.159991: xhci_queue_trb: BULK: Buffer 00000000fe388000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
  365.159991: xhci_inc_enq: BULK 00000000ff812306: enq 0x00000000ffe77fe0(0x00000000ffe77000) deq 0x00000000ffe77f90(0x00000000ffe77000) segs 2 stream 0 free_trbs 504 bounce 102

Queue the last transfer TRB on this segment at ..77fe0. (note xhci_inc_enq show enq value _after_ it increased it)
  365.160043: xhci_urb_enqueue: ep3in-bulk: urb 00000000518e7c2f pipe 3225518720 slot 1 length 0/32768 sgs 0/0 stream 0 flags 00000204
  365.160044: xhci_queue_trb: BULK: Buffer 00000000fe380000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
  365.160044: xhci_inc_enq: BULK 00000000ff812306: enq 0x00000000ffe77ff0(0x00000000ffe77000) deq 0x00000000ffe77fa0(0x00000000ffe77000) segs 2 stream 0 free_trbs 504 bounce 1024 cycle 1

(omitted get events for TRBs at ..77fa0, ..77fb0, ..77fc0)
(omitted queue TRBs at next segment at ..76000, 76010, ..76020)

Event for completed TRB at 77fd0 (second last Transer on segment)
  365.160815: xhci_handle_event: EVENT: TRB 00000000ffe77fd0 status 'Short Packet' len 16388 slot 1 ep 7 type 'Transfer Event' flags e:c
  365.160815: xhci_handle_transfer: BULK: Buffer 00000000fe388000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
  365.160817: xhci_inc_deq: BULK 00000000ff812306: enq 0x00000000ffe76030(0x00000000ffe76000) deq 0x00000000ffe77fe0(0x00000000ffe77000) segs 2 stream 0 free_trbs 505 bounce 1024 cycle 1

Queue Transfer TRB at 76030
  365.160831: xhci_urb_enqueue: ep3in-bulk: urb 0000000029404272 pipe 3225518720 slot 1 length 0/32768 sgs 0/0 stream 0 flags 00000204
  365.160831: xhci_queue_trb: BULK: Buffer 00000000fe388000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
  365.160831: xhci_inc_enq: BULK 00000000ff812306: enq 0x00000000ffe76040(0x00000000ffe76000) deq 0x00000000ffe77fe0(0x00000000ffe77000) segs 2 stream 0 free_trbs 504 bounce 1024 cycle 1

Event for TRB at ..76000, the first TRB on the next segment.
Note that we didn't get an event for last transfer TRB at ..77fe0,
  365.161182: xhci_handle_event: EVENT: TRB 00000000ffe76000 status 'Success' len 0 slot 1 ep 7 type 'Transfer Event' flags e:c
  365.161183: xhci_inc_deq: EVENT 00000000837a99ac: enq 0x00000000ffeec000(0x00000000ffeec000) deq 0x00000000ffeec6e0(0x00000000ffeec000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 0
  365.161228: xhci_handle_event: EVENT: TRB 00000000ffe76010 status 'Short Packet' len 16388 slot 1 ep 7 type 'Transfer Event' flags e:c
  365.161236: xhci_inc_deq: EVENT 00000000837a99ac: enq 0x00000000ffeec000(0x00000000ffeec000) deq 0x00000000ffeec6f0(0x00000000ffeec000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 0
  365.161567: xhci_handle_event: EVENT: TRB 00000000ffe76020 status 'Success' len 0 slot 1 ep 7 type 'Transfer Event' flags e:c
  365.161573: xhci_inc_deq: EVENT 00000000837a99ac: enq 0x00000000ffeec000(0x00000000ffeec000) deq 0x00000000ffeec700(0x00000000ffeec000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 0
  365.161618: xhci_handle_event: EVENT: TRB 00000000ffe76030 status 'Short Packet' len 16388 slot 1 ep 7 type 'Transfer Event' flags e:c
  365.161623: xhci_inc_deq: EVENT 00000000837a99ac: enq 0x00000000ffeec000(0x00000000ffeec000) deq 0x00000000ffeec710(0x00000000ffeec000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 0

Five seconds later driver start canceling TRBs due to timeout

In some cases the Link TRB might be given to HW (cycle bit written) before the last transfer TRB as
inc_enq() is called before giveback_first_trb().
This shouldn't be the case here as we only have one TRB per URB (no chain or more_trbs_coming set).
Maybe still worth double checking this.
We have memory barriers after writing the TRB, but not after the later cycle bit write.
maybe still try if a wmb() after writing the cycle bit in giveback_first_trb() helps.

One interesting thing is that every second transfer completes short, and every other as success (full).
When we miss one TRB I'd expect the order to get messed up, but it doesn't.
It's as if hw doesn't consider that last transfer TRB valid, and just skips it.

tracing shows the content of the TRB while it's written, before writing the cycle bit.
Could be worth dumping transfer ring after issue is seen and check TRB still looks valid:
cat /sys/kernel/debug/usb/xhci/<your controller>/devices/<xx>/ep<yy>/trbs
you need to figure out which controller, device and endpoint number for this.

How about your delayed link TRB cycle write patch? did it help trigger an event for the last transfer 
TRB, or did it just help as controller couldn't go past the link TRB and was less out of sync with
the driver?

Also trying latest upstream kernel instead of 5.8 could help.

Thanks
-Mathias

