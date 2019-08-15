Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 287768EAF4
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 14:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730764AbfHOMCO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 15 Aug 2019 08:02:14 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:25440 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730621AbfHOMCO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 08:02:14 -0400
IronPort-SDR: 6vxp7tz3voSVm8fkFzJ9nEGGB/IyanbmAbEVl0F7ki/uMC8BWszGtXANp4k8n1egIEBaBgpa+P
 2ojY9hL7FFeuF7+q3RkDJ+A4Bd7JWbGkJZyOHTS/BCnM+e+L5w8uESZ0jlwWqwuFbrdx6eyb0w
 XXY3QaSBOzBMRM1WKT3KW+RmBsCY71PexhRFzqOlxJEjztljc7vEDlB/tcGk2n47nmzXHdf4HB
 GWTDYpA7SldNyBs4Tw5dX+/FnhtWY2ozxB2UE1XK6wDP1unN6YXHunhpuKnb9uu3941F5AZpCc
 bi0=
X-IronPort-AV: E=Sophos;i="5.64,389,1559548800"; 
   d="scan'208";a="42281585"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 15 Aug 2019 04:02:10 -0800
IronPort-SDR: ZfCK+ypoYsjXdtBZlZJCz8qeBBdDjILDMDkZgvht/wnL3m9MXVTeZxIEr0FzBe+kmx03EMKdkj
 o9oIld3GYsi64taoMK2tqZA0glBPThKneKi/o1rUzzPe9qT2SqXE0ead7MbSg6bgArIjgCo1dg
 J2nJ9tjG8OT0hfY9/w2dy28nkt7+GA74pJ0wNHSs2XNY5CPu/cY3d4VK8PcpU50YJqLp0pmefs
 bxy/Ny6eYFzXJJ24tjikDJlcmxKJx1MP4pR8BYIMjq5ce1thlUgFsz54Ky0FpwKkL56mnAb2DH
 L5I=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Oliver Neukum <oneukum@suse.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: AW: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Topic: AW: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
Thread-Index: AdVSeH/taFnFr9I1T4OXjPctlrQ3Ev//86kA///uBTCAAF8egIABinwc
Date:   Thu, 15 Aug 2019 12:02:05 +0000
Message-ID: <1565870525382.10504@mentor.com>
References: <db0e8930ea94408ca7a38192ddfd203f@SVR-IES-MBX-03.mgc.mentorg.com>
         <1565771508.25764.3.camel@suse.com>
         <f5e22fea4e1c4baeb2fc98d324ad9060@SVR-IES-MBX-03.mgc.mentorg.com>,<1565788073.25764.8.camel@suse.com>
In-Reply-To: <1565788073.25764.8.camel@suse.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>> I don't think its a regression.
>
> It would be better to know than to assume.
>
Happens with kernel 4.14.102 also, not only with 4.14.129.
Looks more HW related.

>
>> Is there something i can do to force an error message to be seen
>> when the ETH2USB adapter stalls?
>
> You can activate dynamic debugging for the xhci_hcd module
> Remember that no data to transfer is not an error as such.
>
>> My current assumption is that the signal quality of the USB port is at a
>> corner case, and therefore some "better" Adapters work, some "bad ones"
>> don't. But as there is no error message seen in the dmesg, i am somehow lost.
>
> Two things you can do:
>
> 1. Generate a usbmon trace (it will be gigantic though)
> 2. Activate dynamic debugging for the xhci_hcd module
I did:
echo -n 'module xhci_hcd =p' > /sys/kernel/debug/dynamic_debug/control
echo -n 'usbcore =p' > /sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
(used this when hunting for another USB issue in the past also)

From traces/logs:
########################################
I can see in dmesg at a certain point, i assume this is where trouble starts:
[87800.393785] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.393869] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.393956] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.394045] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.394145] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.394216] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.394302] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.394385] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 15904 bytes untransferred
[87800.394587] xhci_hcd 0000:00:15.0: Transfer error for slot 3 ep 5 on endpoint
[87800.394596] xhci_hcd 0000:00:15.0: Cleaning up stalled endpoint ring
[87800.394600] xhci_hcd 0000:00:15.0: Finding endpoint context
[87800.394603] xhci_hcd 0000:00:15.0: Cycle state = 0x1
[87800.394606] xhci_hcd 0000:00:15.0: New dequeue segment = ffff8d9330b29900 (virtual)
[87800.394608] xhci_hcd 0000:00:15.0: New dequeue pointer = 0x174213400 (DMA)
[87800.394610] xhci_hcd 0000:00:15.0: Queueing new dequeue state
[87800.394613] xhci_hcd 0000:00:15.0: Set TR Deq Ptr cmd, new deq seg = ffff8d9330b29900 (0x174213000 dma), new deq ptr = ffff8d92b4213400 (0x174213400 dma), new cycle = 1
[87800.394618] xhci_hcd 0000:00:15.0: // Ding dong!
[87800.394622] xhci_hcd 0000:00:15.0: Giveback URB ffff8d931d65b600, len = 0, expected = 74, status = -71
[87800.394629] xhci_hcd 0000:00:15.0: Ignoring reset ep completion code of 1
[87800.394636] xhci_hcd 0000:00:15.0: Successful Set TR Deq Ptr cmd, deq = @174213400
[87800.394836] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.394916] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.395005] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.395090] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.395178] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.395263] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.395350] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.395436] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.395525] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.395613] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.395710] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.395785] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 9808 bytes untransferred
[87800.395868] xhci_hcd 0000:00:15.0: ep 0x82 - asked for 20480 bytes, 11328 bytes untransferred
[87800.398155] xhci_hcd 0000:00:15.0: Transfer error for slot 3 ep 5 on endpoint
[87800.398172] xhci_hcd 0000:00:15.0: Cleaning up stalled endpoint ring
[87800.398175] xhci_hcd 0000:00:15.0: Finding endpoint context
[87800.398179] xhci_hcd 0000:00:15.0: Cycle state = 0x1
[87800.398181] xhci_hcd 0000:00:15.0: New dequeue segment = ffff8d9330b29900 (virtual)
[87800.398184] xhci_hcd 0000:00:15.0: New dequeue pointer = 0x174213410 (DMA)
[87800.398186] xhci_hcd 0000:00:15.0: Queueing new dequeue state
[87800.398189] xhci_hcd 0000:00:15.0: Set TR Deq Ptr cmd, new deq seg = ffff8d9330b29900 (0x174213000 dma), new deq ptr = ffff8d92b4213410 (0x174213410 dma), new cycle = 1
[87800.398192] xhci_hcd 0000:00:15.0: // Ding dong!
[87800.398197] xhci_hcd 0000:00:15.0: Giveback URB ffff8d92b4374c00, len = 0, expected = 74, status = -71
[87800.398209] xhci_hcd 0000:00:15.0: Ignoring reset ep completion code of 1
[87800.398217] xhci_hcd 0000:00:15.0: Successful Set TR Deq Ptr cmd, deq = @174213410
[87800.401654] xhci_hcd 0000:00:15.0: Transfer error for slot 3 ep 5 on endpoint

These Transfer errors continue to happen, i think this is a massive slowdown then.

########################################
Trace shows around this timeframe:
          <idle>-0     [000] d.h2 87800.014500: xhci_queue_trb: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 3 ep 6 flags C
          <idle>-0     [000] d.h2 87800.014502: xhci_inc_enq: CMD ffff8d92b40f3e00: enq 0x0000000174342c60(0x0000000174342000) deq 0x0000000174342c50(0x0000000174342000) segs 1 stream 0 free_trbs 253 bounce 0 cycle 1
          <idle>-0     [000] d.h2 87800.014510: xhci_dbg_reset_ep: Cleaning up stalled endpoint ring
          <idle>-0     [000] d.h2 87800.014517: xhci_dbg_cancel_urb: Finding endpoint context
          <idle>-0     [000] d.h2 87800.014522: xhci_dbg_cancel_urb: Cycle state = 0x1
          <idle>-0     [000] d.h2 87800.014531: xhci_dbg_cancel_urb: New dequeue segment = ffff8d9330b29900 (virtual)
          <idle>-0     [000] d.h2 87800.014537: xhci_dbg_cancel_urb: New dequeue pointer = 0x1742138c0 (DMA)
          <idle>-0     [000] d.h2 87800.014543: xhci_dbg_reset_ep: Queueing new dequeue state
          <idle>-0     [000] d.h2 87800.014550: xhci_dbg_cancel_urb: Set TR Deq Ptr cmd, new deq seg = ffff8d9330b29900 (0x174213000 dma), new deq ptr = ffff8d92b42138c0 (0x1742138c0 dma), new cycle = 1
          <idle>-0     [000] d.h2 87800.014554: xhci_queue_trb: CMD: Set TR Dequeue Pointer Command: deq 00000001742138c1 stream 0 slot 3 ep 6 flags C
          <idle>-0     [000] d.h2 87800.014555: xhci_inc_enq: CMD ffff8d92b40f3e00: enq 0x0000000174342c70(0x0000000174342000) deq 0x0000000174342c50(0x0000000174342000) segs 1 stream 0 free_trbs 252 bounce 0 cycle 1
          <idle>-0     [000] d.h1 87800.014572: xhci_urb_giveback: ep3out-bulk: urb ffff8d92b4374180 pipe 3221324544 slot 3 length 0/470 sgs 0/0 stream 0 flags 00010000
          <idle>-0     [000] d.h2 87800.014583: xhci_handle_event: EVENT: TRB 0000000174342c50 status 'Success' len 0 slot 3 ep 0 type 'Command Completion Event' flags e:c
          <idle>-0     [000] d.h2 87800.014584: xhci_handle_command: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 3 ep 6 flags C
          <idle>-0     [000] d.h2 87800.014587: xhci_handle_cmd_reset_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk OUT burst 15 maxp 1024 deq 00000001742138c1 avg trb len 0
          <idle>-0     [000] d.h2 87800.014594: xhci_dbg_reset_ep: Ignoring reset ep completion code of 1
          <idle>-0     [000] d.h2 87800.014597: xhci_inc_deq: CMD ffff8d92b40f3e00: enq 0x0000000174342c70(0x0000000174342000) deq 0x0000000174342c60(0x0000000174342000) segs 1 stream 0 free_trbs 253 bounce 0 cycle 1
          <idle>-0     [000] d.h2 87800.014598: xhci_handle_event: EVENT: TRB 0000000174342c60 status 'Success' len 0 slot 3 ep 0 type 'Command Completion Event' flags e:c
          <idle>-0     [000] d.h2 87800.014599: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 00000001742138c1 stream 0 slot 3 ep 6 flags C
          <idle>-0     [000] d.h2 87800.014601: xhci_handle_cmd_set_deq: RS 00000 super-speed Ctx Entries 6 MEL 512 us Port# 10/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 3 State configured
          <idle>-0     [000] d.h2 87800.014602: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk OUT burst 15 maxp 1024 deq 00000001742138c1 avg trb len 0
          <idle>-0     [000] d.h2 87800.014608: xhci_dbg_cancel_urb: Successful Set TR Deq Ptr cmd, deq = @1742138c0
          <idle>-0     [000] d.h2 87800.014610: xhci_inc_deq: CMD ffff8d92b40f3e00: enq 0x0000000174342c70(0x0000000174342000) deq 0x0000000174342c70(0x0000000174342000) segs 1 stream 0 free_trbs 254 bounce 0 cycle 1
          <idle>-0     [000] dNh2 87800.139476: xhci_handle_event: EVENT: TRB 00000001cfa5a0f0 status 'Success' len 0 slot 3 ep 3 type 'Transfer Event' flags e:c
          <idle>-0     [000] dNh2 87800.139486: xhci_handle_transfer: INTR: Buffer 00000001dfadbaa8 length 8 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
          <idle>-0     [000] dNh2 87800.139490: xhci_inc_deq: INTR ffff8d92b0edf380: enq 0x00000001cfa5a100(0x00000001cfa5a000) deq 0x00000001cfa5a100(0x00000001cfa5a000) segs 2 stream 0 free_trbs 509 bounce 8 cycle 1
          <idle>-0     [000] dNh1 87800.139496: xhci_urb_giveback: ep1in-intr: urb ffff8d931fb43840 pipe 1073775488 slot 3 length 8/8 sgs 0/0 stream 0 flags 00010300
          <idle>-0     [000] dNh1 87800.139512: xhci_urb_enqueue: ep1in-intr: urb ffff8d931fb43840 pipe 1073775488 slot 3 length 0/8 sgs 0/0 stream 0 flags 00010300
          <idle>-0     [000] dNh2 87800.139518: xhci_queue_trb: INTR: Buffer 00000001dfadbaa8 length 8 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
          <idle>-0     [000] dNh2 87800.139519: xhci_inc_enq: INTR ffff8d92b0edf380: enq 0x00000001cfa5a110(0x00000001cfa5a000) deq 0x00000001cfa5a100(0x00000001cfa5a000) segs 2 stream 0 free_trbs 508 bounce 8 cycle 1
     AvbTxWrklow-271   [000] d.h1 87800.267463: xhci_handle_event: EVENT: TRB 00000001cfa5a100 status 'Success' len 0 slot 3 ep 3 type 'Transfer Event' flags e:c
     AvbTxWrklow-271   [000] d.h1 87800.267471: xhci_handle_transfer: INTR: Buffer 00000001dfadbaa8 length 8 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
     AvbTxWrklow-271   [000] d.h1 87800.267476: xhci_inc_deq: INTR ffff8d92b0edf380: enq 0x00000001cfa5a110(0x00000001cfa5a000) deq 0x00000001cfa5a110(0x00000001cfa5a000) segs 2 stream 0 free_trbs 509 bounce 8 cycle 1
     AvbTxWrklow-271   [000] d.h. 87800.267480: xhci_urb_giveback: ep1in-intr: urb ffff8d931fb43840 pipe 1073775488 slot 3 length 8/8 sgs 0/0 stream 0 flags 00010300
     AvbTxWrklow-271   [000] d.h. 87800.267494: xhci_urb_enqueue: ep1in-intr: urb ffff8d931fb43840 pipe 1073775488 slot 3 length 0/8 sgs 0/0 stream 0 flags 00010300
     AvbTxWrklow-271   [000] d.h1 87800.267499: xhci_queue_trb: INTR: Buffer 00000001dfadbaa8 length 8 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
     AvbTxWrklow-271   [000] d.h1 87800.267500: xhci_inc_enq: INTR ffff8d92b0edf380: enq 0x00000001cfa5a120(0x00000001cfa5a000) deq 0x00000001cfa5a110(0x00000001cfa5a000) segs 2 stream 0 free_trbs 508 bounce 8 cycle 1
          <idle>-0     [000] d.h2 87800.395533: xhci_handle_event: EVENT: TRB 00000001cfa5a110 status 'Success' len 0 slot 3 ep 3 type 'Transfer Event' flags e:c
          <idle>-0     [000] d.h2 87800.395543: xhci_handle_transfer: INTR: Buffer 00000001dfadbaa8 length 8 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
          <idle>-0     [000] d.h2 87800.395548: xhci_inc_deq: INTR ffff8d92b0edf380: enq 0x00000001cfa5a120(0x00000001cfa5a000) deq 0x00000001cfa5a120(0x00000001cfa5a000) segs 2 stream 0 free_trbs 509 bounce 8 cycle 1
          <idle>-0     [000] d.h1 87800.395554: xhci_urb_giveback: ep1in-intr: urb ffff8d931fb43840 pipe 1073775488 slot 3 length 8/8 sgs 0/0 stream 0 flags 00010300
          <idle>-0     [000] d.h1 87800.395570: xhci_urb_enqueue: ep1in-intr: urb ffff8d931fb43840 pipe 1073775488 slot 3 length 0/8 sgs 0/0 stream 0 flags 00010300
          <idle>-0     [000] d.h2 87800.395575: xhci_queue_trb: INTR: Buffer 00000001dfadbaa8 length 8 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
          <idle>-0     [000] d.h2 87800.395576: xhci_inc_enq: INTR ffff8d92b0edf380: enq 0x00000001cfa5a130(0x00000001cfa5a000) deq 0x00000001cfa5a120(0x00000001cfa5a000) segs 2 stream 0 free_trbs 508 bounce 8 cycle 1
          <idle>-0     [000] d.h2 87800.523536: xhci_handle_event: EVENT: TRB 00000001cfa5a120 status 'Success' len 0 slot 3 ep 3 type 'Transfer Event' flags e:c
          <idle>-0     [000] d.h2 87800.523546: xhci_handle_transfer: INTR: Buffer 00000001dfadbaa8 length 8 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
          <idle>-0     [000] d.h2 87800.523550: xhci_inc_deq: INTR ffff8d92b0edf380: enq 0x00000001cfa5a130(0x00000001cfa5a000) deq 0x00000001cfa5a130(0x00000001cfa5a000) segs 2 stream 0 free_trbs 509 bounce 8 cycle 1
          <idle>-0     [000] d.h1 87800.523556: xhci_urb_giveback: ep1in-intr: urb ffff8d931fb43840 pipe 1073775488 slot 3 length 8/8 sgs 0/0 stream 0 flags 00010300
          <idle>-0     [000] d.h1 87800.523571: xhci_urb_enqueue: ep1in-intr: urb ffff8d931fb43840 pipe 1073775488 slot 3 length 0/8 sgs 0/0 stream 0 flags 00010300
          <idle>-0     [000] d.h2 87800.523576: xhci_queue_trb: INTR: Buffer 00000001dfadbaa8 length 8 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
          <idle>-0     [000] d.h2 87800.523577: xhci_inc_enq: INTR ffff8d92b0edf380: enq 0x00000001cfa5a140(0x00000001cfa5a000) deq 0x00000001cfa5a130(0x00000001cfa5a000) segs 2 stream 0 free_trbs 508 bounce 8 cycle 1
....
     ksoftirqd/0-7     [000] d.s3 87801.459142: xhci_urb_enqueue: ep3out-bulk: urb ffff8d92965cd180 pipe 3221324544 slot 3 length 0/86 sgs 0/0 stream 0 flags 00010000
     ksoftirqd/0-7     [000] d.s4 87801.459146: xhci_queue_trb: BULK: Buffer 00000001565b18ba length 86 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
     ksoftirqd/0-7     [000] d.s4 87801.459147: xhci_inc_enq: BULK ffff8d92b0edf680: enq 0x00000001742138d0(0x0000000174213000) deq 0x00000001742138c0(0x0000000174213000) segs 2 stream 0 free_trbs 508 bounce 1024 cycle 1
          <idle>-0     [000] d.h2 87801.462490: xhci_handle_event: EVENT: TRB 00000001742138c0 status 'USB Transaction Error' len 86 slot 3 ep 6 type 'Transfer Event' flags e:c
          <idle>-0     [000] d.h2 87801.462518: xhci_handle_transfer: BULK: Buffer 00000001565b18ba length 86 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
          <idle>-0     [000] d.h2 87801.462534: xhci_queue_trb: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 3 ep 6 flags C
          <idle>-0     [000] d.h2 87801.462536: xhci_inc_enq: CMD ffff8d92b40f3e00: enq 0x0000000174342c80(0x0000000174342000) deq 0x0000000174342c70(0x0000000174342000) segs 1 stream 0 free_trbs 253 bounce 0 cycle 1
          <idle>-0     [000] d.h2 87801.462545: xhci_dbg_reset_ep: Cleaning up stalled endpoint ring
          <idle>-0     [000] d.h2 87801.462551: xhci_dbg_cancel_urb: Finding endpoint context
          <idle>-0     [000] d.h2 87801.462556: xhci_dbg_cancel_urb: Cycle state = 0x1
          <idle>-0     [000] d.h2 87801.462562: xhci_dbg_cancel_urb: New dequeue segment = ffff8d9330b29900 (virtual)
          <idle>-0     [000] d.h2 87801.462567: xhci_dbg_cancel_urb: New dequeue pointer = 0x1742138d0 (DMA)
          <idle>-0     [000] d.h2 87801.462574: xhci_dbg_reset_ep: Queueing new dequeue state
          <idle>-0     [000] d.h2 87801.462581: xhci_dbg_cancel_urb: Set TR Deq Ptr cmd, new deq seg = ffff8d9330b29900 (0x174213000 dma), new deq ptr = ffff8d92b42138d0 (0x1742138d0 dma), new cycle = 1


Really looks like this is a scenario where we have a device working with errors that can be recovered.
But because many errors are happening, it leads to a massive slowdown and finally a failure.
However, this takes a very long time, sometimes > 10 minutes.
And, because retries mostly work, we can't see errors in upper layers.

I'm not a USB expert, but maybe you can confirm this assumption?

Best regards
Carsten
