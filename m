Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94E6364A38
	for <lists+linux-usb@lfdr.de>; Mon, 19 Apr 2021 21:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239224AbhDSTGa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Apr 2021 15:06:30 -0400
Received: from salscheider.org ([202.61.254.1]:44642 "EHLO
        mail.salscheider.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234508AbhDSTGa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Apr 2021 15:06:30 -0400
Received: from [IPv6:2001:16b8:22bc:5000:ba61:907e:22f9:37e7] (200116b822bc5000ba61907e22f937e7.dip.versatel-1u1.de [IPv6:2001:16b8:22bc:5000:ba61:907e:22f9:37e7])
        by mail.salscheider.org (Postfix) with ESMTPSA id B3F351875E1;
        Mon, 19 Apr 2021 21:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salscheider.org;
        s=dkim; t=1618859159;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HqzyD1rN7jYT8pbYn/3idJeCpCCQfQZyS48uJjraP90=;
        b=B46l9fw4hiqIRUH9vIECdhdo9m58KG4LeACah3QbEqLXf0ExD+qmMgqiOxI6KXuQqQTPYR
        +zqZEDzR0b+8OMEOA3rVMvUoaOFp5kyJIIdxyFCXUxgOvlAYvBJPgTeZ99e/uXwobN0TTM
        riCbNmvCJ29BYG9az049i+n4SJqZx8A=
Subject: Re: [PATCH] [RFC] xhci: Add Link TRB sync quirk for ASM3142
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <20210416093729.41865-1-ole@salscheider.org>
 <9bf0060c-3427-a261-531c-c075054ae094@linux.intel.com>
 <5c92dd8c-c8b0-40b5-addb-2df360673462@salscheider.org>
 <a8b56a79-e092-a344-7508-8c22b6568898@salscheider.org>
 <e68b481e-a9a1-787e-b263-461bc9597b65@intel.com>
From:   Ole Salscheider <ole@salscheider.org>
Message-ID: <c9a18ec2-7fb1-f206-1d27-ce3fa52be762@salscheider.org>
Date:   Mon, 19 Apr 2021 21:05:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <e68b481e-a9a1-787e-b263-461bc9597b65@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

I'm sorry for messing the reply-to-all up... Here it comes again:

On 19.04.21 16:43, Mathias Nyman wrote:
> Hi
> 
> On 19.4.2021 13.52, Ole Salscheider wrote:
>>
>>
>> I tried it a second time today and now I got the DMA error also when tracing was active. You can find the dmesg and trace outputs here:
>>
>> https://stuff.salscheider.org/dmesg_out2
>> https://stuff.salscheider.org/trace_out2
>>
> 
> Thanks.
> It really looks like we just don't get an event for the last transfers TRB on the segment.
> In this case bulk transfers are used, one TD per URB, with one TRB in only per TD.
> 
>  From the trace:
> Queue the second last transfer TRB on this segment:
>    365.159991: xhci_urb_enqueue: ep3in-bulk: urb 0000000029404272 pipe 3225518720 slot 1 length 0/32768 sgs 0/0 stream 0 flags 00000204
>    365.159991: xhci_queue_trb: BULK: Buffer 00000000fe388000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
>    365.159991: xhci_inc_enq: BULK 00000000ff812306: enq 0x00000000ffe77fe0(0x00000000ffe77000) deq 0x00000000ffe77f90(0x00000000ffe77000) segs 2 stream 0 free_trbs 504 bounce 102
> 
> Queue the last transfer TRB on this segment at ..77fe0. (note xhci_inc_enq show enq value _after_ it increased it)
>    365.160043: xhci_urb_enqueue: ep3in-bulk: urb 00000000518e7c2f pipe 3225518720 slot 1 length 0/32768 sgs 0/0 stream 0 flags 00000204
>    365.160044: xhci_queue_trb: BULK: Buffer 00000000fe380000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
>    365.160044: xhci_inc_enq: BULK 00000000ff812306: enq 0x00000000ffe77ff0(0x00000000ffe77000) deq 0x00000000ffe77fa0(0x00000000ffe77000) segs 2 stream 0 free_trbs 504 bounce 1024 cycle 1
> 
> (omitted get events for TRBs at ..77fa0, ..77fb0, ..77fc0)
> (omitted queue TRBs at next segment at ..76000, 76010, ..76020)
> 
> Event for completed TRB at 77fd0 (second last Transer on segment)
>    365.160815: xhci_handle_event: EVENT: TRB 00000000ffe77fd0 status 'Short Packet' len 16388 slot 1 ep 7 type 'Transfer Event' flags e:c
>    365.160815: xhci_handle_transfer: BULK: Buffer 00000000fe388000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
>    365.160817: xhci_inc_deq: BULK 00000000ff812306: enq 0x00000000ffe76030(0x00000000ffe76000) deq 0x00000000ffe77fe0(0x00000000ffe77000) segs 2 stream 0 free_trbs 505 bounce 1024 cycle 1
> 
> Queue Transfer TRB at 76030
>    365.160831: xhci_urb_enqueue: ep3in-bulk: urb 0000000029404272 pipe 3225518720 slot 1 length 0/32768 sgs 0/0 stream 0 flags 00000204
>    365.160831: xhci_queue_trb: BULK: Buffer 00000000fe388000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
>    365.160831: xhci_inc_enq: BULK 00000000ff812306: enq 0x00000000ffe76040(0x00000000ffe76000) deq 0x00000000ffe77fe0(0x00000000ffe77000) segs 2 stream 0 free_trbs 504 bounce 1024 cycle 1
> 
> Event for TRB at ..76000, the first TRB on the next segment.
> Note that we didn't get an event for last transfer TRB at ..77fe0,
>    365.161182: xhci_handle_event: EVENT: TRB 00000000ffe76000 status 'Success' len 0 slot 1 ep 7 type 'Transfer Event' flags e:c
>    365.161183: xhci_inc_deq: EVENT 00000000837a99ac: enq 0x00000000ffeec000(0x00000000ffeec000) deq 0x00000000ffeec6e0(0x00000000ffeec000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 0
>    365.161228: xhci_handle_event: EVENT: TRB 00000000ffe76010 status 'Short Packet' len 16388 slot 1 ep 7 type 'Transfer Event' flags e:c
>    365.161236: xhci_inc_deq: EVENT 00000000837a99ac: enq 0x00000000ffeec000(0x00000000ffeec000) deq 0x00000000ffeec6f0(0x00000000ffeec000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 0
>    365.161567: xhci_handle_event: EVENT: TRB 00000000ffe76020 status 'Success' len 0 slot 1 ep 7 type 'Transfer Event' flags e:c
>    365.161573: xhci_inc_deq: EVENT 00000000837a99ac: enq 0x00000000ffeec000(0x00000000ffeec000) deq 0x00000000ffeec700(0x00000000ffeec000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 0
>    365.161618: xhci_handle_event: EVENT: TRB 00000000ffe76030 status 'Short Packet' len 16388 slot 1 ep 7 type 'Transfer Event' flags e:c
>    365.161623: xhci_inc_deq: EVENT 00000000837a99ac: enq 0x00000000ffeec000(0x00000000ffeec000) deq 0x00000000ffeec710(0x00000000ffeec000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 0
> 
> Five seconds later driver start canceling TRBs due to timeout
> 
> In some cases the Link TRB might be given to HW (cycle bit written) before the last transfer TRB as
> inc_enq() is called before giveback_first_trb().
> This shouldn't be the case here as we only have one TRB per URB (no chain or more_trbs_coming set).
> Maybe still worth double checking this.
> We have memory barriers after writing the TRB, but not after the later cycle bit write.
> maybe still try if a wmb() after writing the cycle bit in giveback_first_trb() helps.

I added the wmb() but it did not change anything.
I added debug output to inc_enq(), but the Link TRB is never given to 
the HW there, only in giveback_first_trb().

> One interesting thing is that every second transfer completes short, and every other as success (full).
> When we miss one TRB I'd expect the order to get messed up, but it doesn't.
> It's as if hw doesn't consider that last transfer TRB valid, and just skips it.
> 
> tracing shows the content of the TRB while it's written, before writing the cycle bit.
> Could be worth dumping transfer ring after issue is seen and check TRB still looks valid:
> cat /sys/kernel/debug/usb/xhci/<your controller>/devices/<xx>/ep<yy>/trbs
> you need to figure out which controller, device and endpoint number for this.

I think this is the output for the correct device and endpoint:

https://stuff.salscheider.org/trbs

> How about your delayed link TRB cycle write patch? did it help trigger an event for the last transfer
> TRB, or did it just help as controller couldn't go past the link TRB and was less out of sync with
> the driver?


You can find a trace of recording a few seconds of video with my patch here:

https://stuff.salscheider.org/trace_with_patch

As far as I can tell from it, the patch helps to trigger an event for 
all transfer TRBs. I also tried to record around 30 min of video with it 
and it did not encounter a problem while recording.

I however cannot start a new recording after stopping the first. And 
sometimes I observe hangs of the computer some time after stopping the 
recording. That might be some unwanted side-effect of my patch...

> Also trying latest upstream kernel instead of 5.8 could help.

My patch is against the master branch and I see the exact same problem 
there.

Best regards,
Ole
