Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CFE225B51
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 11:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgGTJWC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 05:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbgGTJWC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jul 2020 05:22:02 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D854DC061794
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 02:22:01 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id i3so12374450qtq.13
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 02:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=TUpkPogav0eNgJ7ldnrUfa8ZttMnxO/4xPh1oVuFi80=;
        b=JUTsBVoethEtW9dCHgi9CbhbnI4scMavPIuPRXjzo57oLAY0r0+RWatXDtqlBn3tH4
         hIHIC44+rn1xJTZOys4db7F9alvdNl6dJ00c3hZeMIpw8iucVfMaxMB6ApEXRy+UUuM1
         nVe2OjhyZkhC5I+9jpUpFQtnQbcTiDfWI1RCQ72pvsPJtQfom62EvCbbeDKv+HOZrTom
         t775xkiSasLVRw82kO2B/KLpHgto7XKZ4TzoYW2cY/Qmxux/PBQjjcoMmRIgbOHBWrwX
         m4+GETZkZ5ZHTZT06FTTjQGQHqd+xsYj1WxLZMaaEfC+fWna2vKdTvI1hOc6wIM0Yugw
         QPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=TUpkPogav0eNgJ7ldnrUfa8ZttMnxO/4xPh1oVuFi80=;
        b=mzsHt55ppFyMwrgVV42w3QZXPiB3qMVJu9k4DinputFpIHjTGcwpWB9GW9jmYsWtsg
         YPS9fomL2vgK5eJBkzl8Rg+s2PFVFpwVX1GFQqA5C3DvxmQd4K3Zj6DwksDgRJOEmXY8
         LdFl2Op/uyPLrZJaBAtPkFDASsNMb0P8gjDRG2Lb4HZA3I1twuH6xcaQSenaUPASe8Kh
         YHurYmWZAe7kxLNH6S/CMKqm7uGkKtt1pWx2IyN5elzcjqzdcKy6Bv+/s3Knwrh8zYAg
         R4EqwyRwZkimH5Nt3mf0WqKOMAXbKinKFU/9P5zSPuZWciDAgu9spDs/CV9adM0PfJVS
         BIbg==
X-Gm-Message-State: AOAM532lNxhU4u/5AEzaUKLtlju8DKXcMXCb24dI3Nr2/uIocUDNRg3u
        PAcMBSHoGrhK7sBXwq8ojrQENr3O8bAyusfICSUPTOA5
X-Google-Smtp-Source: ABdhPJzL7+ETfnuendUDk86D0LpUD7t6i79nFvzrfVK1zM8Gt6wP1mgwkgRVMNg+vxW//5ymr4Ox+cRETFWikUajsZ8=
X-Received: by 2002:ac8:2601:: with SMTP id u1mr22989335qtu.170.1595236919175;
 Mon, 20 Jul 2020 02:21:59 -0700 (PDT)
MIME-Version: 1.0
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Mon, 20 Jul 2020 11:21:47 +0200
Message-ID: <CAGRyCJF03pVWdyw_G0vZZdOR8QW0c65xaN5KWs8HoWA8ymXZjg@mail.gmail.com>
Subject: xhci status 'Babble Detected' and transaction errors with USB device
 performing UDP stress test through qmi_wwan
To:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I'm performing UDP stress test with an USB modem and kernel 5.6.12,
driver qmi_wwan

After a while the device does not return data anymore.

Enabling xhci debug info I saw in dmesg that it is continuously
reported a stalled endpoint

[ 2717.483690] xhci_hcd 0000:00:14.0: Finding endpoint context
[ 2717.483691] xhci_hcd 0000:00:14.0: Cycle state = 0x1
[ 2717.483692] xhci_hcd 0000:00:14.0: New dequeue segment =
000000006c088200 (virtual)
[ 2717.483693] xhci_hcd 0000:00:14.0: New dequeue pointer = 0x5008842b0 (DMA)
[ 2717.483694] xhci_hcd 0000:00:14.0: Queueing new dequeue state
[ 2717.483696] xhci_hcd 0000:00:14.0: Set TR Deq Ptr cmd, new deq seg
= 000000006c088200 (0x500884000 dma), new deq ptr = 000000001d584e33
(0x5008842b0 dma), new cycle = 1
[ 2717.483698] xhci_hcd 0000:00:14.0: // Ding dong!
[ 2717.483704] xhci_hcd 0000:00:14.0: Giveback URB 0000000022b51cad,
len = 0, expected = 1500, status = -71
[ 2717.483732] xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
[ 2717.483734] xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd,
deq = @5008842b0
[ 2717.487230] xhci_hcd 0000:00:14.0: Transfer error for slot 10 ep 28
on endpoint
[ 2717.487233] xhci_hcd 0000:00:14.0: Cleaning up stalled endpoint ring

Looking at trace I saw

    kworker/u8:2-154   [000] d.h.  2698.163480: xhci_handle_event:
EVENT: TRB 00000004c134e860 status 'Babble Detected' len 476 slot 10
ep 29 type 'Transfer Event' flags e:C
    kworker/u8:2-154   [000] d.h.  2698.163483: xhci_handle_transfer:
BULK: Buffer 00000000c3954bc0 length 1500 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:I:e:C
    kworker/u8:2-154   [000] d.h.  2698.163484: xhci_queue_trb: CMD:
Reset Endpoint Command: ctx 0000000000000000 slot 10 ep 29 flags t:C
    kworker/u8:2-154   [000] d.h.  2698.163485: xhci_inc_enq: CMD
00000000db2e184e: enq 0x0000000501a46500(0x0000000501a46000) deq
0x0000000501a464f0(0x0000000501a46000) segs 1 stream 0 free_trbs 253
bounce 0 cycle 1
    kworker/u8:2-154   [000] d.h.  2698.163487: xhci_dbg_reset_ep:
Cleaning up stalled endpoint ring

and then

kworker/u8:2-154   [000] d.h.  2698.163489: xhci_dbg_cancel_urb:
Finding endpoint context
    kworker/u8:2-154   [000] d.h.  2698.163491: xhci_dbg_cancel_urb:
Cycle state = 0x1
    kworker/u8:2-154   [000] d.h.  2698.163493: xhci_dbg_cancel_urb:
New dequeue segment = 000000003978462b (virtual)
    kworker/u8:2-154   [000] d.h.  2698.163496: xhci_dbg_cancel_urb:
New dequeue pointer = 0x4c134e870 (DMA)
    kworker/u8:2-154   [000] d.h.  2698.163497: xhci_dbg_reset_ep:
Queueing new dequeue state
    kworker/u8:2-154   [000] d.h.  2698.163500: xhci_dbg_cancel_urb:
Set TR Deq Ptr cmd, new deq seg = 000000003978462b (0x4c134e000 dma),
new deq ptr = 00000000d26a2952 (0x4c134e870 dma), new cycle = 1
    kworker/u8:2-154   [000] d.h.  2698.163501: xhci_queue_trb: CMD:
Set TR Dequeue Pointer Command: deq 00000004c134e871 stream 0 slot 10
ep 29 flags C
    kworker/u8:2-154   [000] d.h.  2698.163502: xhci_inc_enq: CMD
00000000db2e184e: enq 0x0000000501a46510(0x0000000501a46000) deq
0x0000000501a464f0(0x0000000501a46000) segs 1 stream 0 free_trbs 252
bounce 0 cycle 1
    kworker/u8:2-154   [000] d.h.  2698.163503:
xhci_ring_host_doorbell: Ring doorbell for Command Ring 0
    kworker/u8:2-154   [000] d.h.  2698.163507: xhci_urb_giveback:
ep14in-bulk: urb 00000000289be606 pipe 3221685888 slot 10 length
1024/1500 sgs 0/0 stream 0 flags 00010200
    kworker/u8:2-154   [000] d.h.  2698.163507: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4ed0(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
    kworker/u8:2-154   [000] d.h.  2698.163507: xhci_handle_event:
EVENT: TRB 00000004c1066db0 status 'Success' len 0 slot 10 ep 3 type
'Transfer Event' flags e:C
    kworker/u8:2-154   [000] d.h.  2698.163508: xhci_handle_transfer:
BULK: Buffer 00000004ac827000 length 4096 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:I:e:C
    kworker/u8:2-154   [000] d.h.  2698.163508: xhci_inc_deq: BULK
00000000679c20b6: enq 0x00000004c1066df0(0x00000004c1066000) deq
0x00000004c1066dc0(0x00000004c1066000) segs 2 stream 0 free_trbs 506
bounce 1024 cycle 1
    kworker/u8:2-154   [000] d.h.  2698.163508: xhci_urb_giveback:
ep1in-bulk: urb 00000000b00ce2e7 pipe 3225454208 slot 10 length
4096/4096 sgs 0/0 stream 0 flags 00010200
    kworker/u8:2-154   [000] d.h.  2698.163509: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4ee0(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
    kworker/u8:2-154   [000] d.h.  2698.163509: xhci_handle_event:
EVENT: TRB 0000000501a464f0 status 'Success' len 0 slot 10 ep 0 type
'Command Completion Event' flags e:C
    kworker/u8:2-154   [000] d.h.  2698.163509: xhci_handle_command:
CMD: Reset Endpoint Command: ctx 0000000000000000 slot 10 ep 29 flags
t:C
    kworker/u8:2-154   [000] d.h.  2698.163510:
xhci_handle_cmd_reset_ep: State stopped mult 1 max P. Streams 0
interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 2 maxp
1024 deq 00000004c134e871 avg trb len 0
    kworker/u8:2-154   [000] d.h.  2698.163512: xhci_dbg_reset_ep:
Ignoring reset ep completion code of 1
    kworker/u8:2-154   [000] d.h.  2698.163512: xhci_inc_deq: CMD
00000000db2e184e: enq 0x0000000501a46510(0x0000000501a46000) deq
0x0000000501a46500(0x0000000501a46000) segs 1 stream 0 free_trbs 253
bounce 0 cycle 1
    kworker/u8:2-154   [000] d.h.  2698.163513: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4ef0(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
    kworker/u8:2-154   [000] d.h.  2698.163513: xhci_handle_event:
EVENT: TRB 0000000501a46500 status 'Success' len 0 slot 10 ep 0 type
'Command Completion Event' flags e:C
    kworker/u8:2-154   [000] d.h.  2698.163513: xhci_handle_command:
CMD: Set TR Dequeue Pointer Command: deq 00000004c134e871 stream 0
slot 10 ep 29 flags C
    kworker/u8:2-154   [000] d.h.  2698.163514:
xhci_handle_cmd_set_deq: RS 00000 super-speed Ctx Entries 30 MEL 512
us Port# 15/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 10 State
configured
    kworker/u8:2-154   [000] d.h.  2698.163514:
xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 0
interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 2 maxp
1024 deq 00000004c134e871 avg trb len 0
    kworker/u8:2-154   [000] d.h.  2698.163516: xhci_dbg_cancel_urb:
Successful Set TR Deq Ptr cmd, deq = @4c134e870
    kworker/u8:2-154   [000] d.h.  2698.163517: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep14in
    kworker/u8:2-154   [000] d.h.  2698.163517: xhci_inc_deq: CMD
00000000db2e184e: enq 0x0000000501a46510(0x0000000501a46000) deq
0x0000000501a46510(0x0000000501a46000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
    kworker/u8:2-154   [000] d.h.  2698.163517: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4f00(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
    kworker/u8:2-154   [000] d.s.  2698.163524: xhci_urb_enqueue:
ep14in-bulk: urb 00000000289be606 pipe 3221685888 slot 10 length
0/1500 sgs 0/0 stream 0 flags 00010200
    kworker/u8:2-154   [000] d.s.  2698.163524: xhci_queue_trb: BULK:
Buffer 00000000c3b86240 length 1500 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:I:e:C
    kworker/u8:2-154   [000] d.s.  2698.163524: xhci_inc_enq: BULK
000000008e5540fa: enq 0x0000000500881b70(0x0000000500881000) deq
0x00000004c134e870(0x00000004c134e000) segs 4 stream 0 free_trbs 716
bounce 1024 cycle 0
    kworker/u8:2-154   [000] d.s.  2698.163525: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep14in
    kworker/u8:2-154   [000] ..s.  2698.163530: xhci_urb_enqueue:
ep1in-bulk: urb 00000000b00ce2e7 pipe 3225454208 slot 10 length 0/4096
sgs 0/0 stream 0 flags 00010200
    kworker/u8:2-154   [000] d.s.  2698.163530: xhci_queue_trb: BULK:
Buffer 00000004ac827000 length 4096 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:I:e:c
    kworker/u8:2-154   [000] d.s.  2698.163530: xhci_inc_enq: BULK
00000000679c20b6: enq 0x00000004c1066e00(0x00000004c1066000) deq
0x00000004c1066dc0(0x00000004c1066000) segs 2 stream 0 free_trbs 505
bounce 1024 cycle 1
    kworker/u8:2-154   [000] d.s.  2698.163530: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep1in
         python3-2591  [001] d...  2698.163973: xhci_urb_enqueue:
ep15out-bulk: urb 00000000845bfa62 pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2591  [001] d...  2698.163974: xhci_queue_trb: BULK:
Buffer 00000001a9784010 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2591  [001] d...  2698.163974: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bad40(0x00000005010ba000) deq
0x00000005010bad30(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2591  [001] d...  2698.163974: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.163981: xhci_handle_event:
EVENT: TRB 00000005010bad30 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.163982: xhci_handle_transfer:
BULK: Buffer 00000001a9784010 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.163982: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bad40(0x00000005010ba000) deq
0x00000005010bad40(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.163983: xhci_urb_giveback:
ep15out-bulk: urb 00000000845bfa62 pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.163983: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4f10(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2663  [002] dN..  2698.164433: xhci_urb_enqueue:
ep15out-bulk: urb 0000000005f460cf pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2663  [002] dN..  2698.164434: xhci_queue_trb: BULK:
Buffer 00000002c6a96810 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2663  [002] dN..  2698.164435: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bad50(0x00000005010ba000) deq
0x00000005010bad40(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2663  [002] dN..  2698.164435: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.164441: xhci_handle_event:
EVENT: TRB 00000005010bad40 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.164442: xhci_handle_transfer:
BULK: Buffer 00000002c6a96810 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.164443: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bad50(0x00000005010ba000) deq
0x00000005010bad50(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.164443: xhci_urb_giveback:
ep15out-bulk: urb 0000000005f460cf pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.164444: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4f20(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2591  [001] d...  2698.164614: xhci_urb_enqueue:
ep15out-bulk: urb 00000000e290d52b pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2591  [001] d...  2698.164614: xhci_queue_trb: BULK:
Buffer 00000001a9787810 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2591  [001] d...  2698.164614: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bad60(0x00000005010ba000) deq
0x00000005010bad50(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2591  [001] d...  2698.164615: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.164621: xhci_handle_event:
EVENT: TRB 00000005010bad50 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.164622: xhci_handle_transfer:
BULK: Buffer 00000001a9787810 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.164623: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bad60(0x00000005010ba000) deq
0x00000005010bad60(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.164623: xhci_urb_giveback:
ep15out-bulk: urb 00000000e290d52b pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.164623: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4f30(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2587  [001] dN..  2698.165130: xhci_urb_enqueue:
ep15out-bulk: urb 000000003d2f56e5 pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2587  [001] dN..  2698.165130: xhci_queue_trb: BULK:
Buffer 00000001a9786810 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2587  [001] dN..  2698.165131: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bad70(0x00000005010ba000) deq
0x00000005010bad60(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2587  [001] dN..  2698.165131: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.165140: xhci_handle_event:
EVENT: TRB 00000005010bad60 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.165140: xhci_handle_transfer:
BULK: Buffer 00000001a9786810 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.165141: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bad70(0x00000005010ba000) deq
0x00000005010bad70(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.165141: xhci_urb_giveback:
ep15out-bulk: urb 000000003d2f56e5 pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.165142: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4f40(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2663  [002] d...  2698.165424: xhci_urb_enqueue:
ep15out-bulk: urb 00000000066b9fda pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2663  [002] d...  2698.165425: xhci_queue_trb: BULK:
Buffer 00000002c6a94c10 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2663  [002] d...  2698.165425: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bad80(0x00000005010ba000) deq
0x00000005010bad70(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2663  [002] d...  2698.165426: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.165433: xhci_handle_event:
EVENT: TRB 00000005010bad70 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.165433: xhci_handle_transfer:
BULK: Buffer 00000002c6a94c10 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.165434: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bad80(0x00000005010ba000) deq
0x00000005010bad80(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.165434: xhci_urb_giveback:
ep15out-bulk: urb 00000000066b9fda pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.165434: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4f50(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2587  [001] dN..  2698.165831: xhci_urb_enqueue:
ep15out-bulk: urb 000000007b46e431 pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2587  [001] dN..  2698.165832: xhci_queue_trb: BULK:
Buffer 00000001a9785410 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2587  [001] dN..  2698.165832: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bad90(0x00000005010ba000) deq
0x00000005010bad80(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2587  [001] dN..  2698.165833: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.165839: xhci_handle_event:
EVENT: TRB 00000005010bad80 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.165840: xhci_handle_transfer:
BULK: Buffer 00000001a9785410 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.165840: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bad90(0x00000005010ba000) deq
0x00000005010bad90(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.165841: xhci_urb_giveback:
ep15out-bulk: urb 000000007b46e431 pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.165841: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4f60(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2587  [001] dN..  2698.166458: xhci_urb_enqueue:
ep15out-bulk: urb 00000000882613fe pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2587  [001] dN..  2698.166459: xhci_queue_trb: BULK:
Buffer 00000001a9785410 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2587  [001] dN..  2698.166459: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bada0(0x00000005010ba000) deq
0x00000005010bad90(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2587  [001] dN..  2698.166460: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.166466: xhci_handle_event:
EVENT: TRB 00000005010bad90 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.166467: xhci_handle_transfer:
BULK: Buffer 00000001a9785410 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.166467: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bada0(0x00000005010ba000) deq
0x00000005010bada0(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.166468: xhci_urb_giveback:
ep15out-bulk: urb 00000000882613fe pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.166468: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4f70(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2595  [001] dN..  2698.166828: xhci_urb_enqueue:
ep15out-bulk: urb 0000000075a92aeb pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2595  [001] dN..  2698.166829: xhci_queue_trb: BULK:
Buffer 00000001a9786810 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2595  [001] dN..  2698.166829: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010badb0(0x00000005010ba000) deq
0x00000005010bada0(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2595  [001] dN..  2698.166829: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.166836: xhci_handle_event:
EVENT: TRB 00000005010bada0 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.166836: xhci_handle_transfer:
BULK: Buffer 00000001a9786810 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.166837: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010badb0(0x00000005010ba000) deq
0x00000005010badb0(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.166837: xhci_urb_giveback:
ep15out-bulk: urb 0000000075a92aeb pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.166838: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4f80(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
 systemd-journal-322   [000] d.h.  2698.166888: xhci_handle_event:
EVENT: TRB 00000004c134e870 status 'USB Transaction Error' len 1500
slot 10 ep 29 type 'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.166891: xhci_handle_transfer:
BULK: Buffer 00000000c3954440 length 1500 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:I:e:C
 systemd-journal-322   [000] d.h.  2698.166893: xhci_queue_trb: CMD:
Reset Endpoint Command: ctx 0000000000000000 slot 10 ep 29 flags T:C
 systemd-journal-322   [000] d.h.  2698.166893: xhci_inc_enq: CMD
00000000db2e184e: enq 0x0000000501a46520(0x0000000501a46000) deq
0x0000000501a46510(0x0000000501a46000) segs 1 stream 0 free_trbs 253
bounce 0 cycle 1
 systemd-journal-322   [000] d.h.  2698.166895:
xhci_ring_host_doorbell: Ring doorbell for Command Ring 0
 systemd-journal-322   [000] d.h.  2698.166896: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4f90(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2663  [002] d...  2698.166896: xhci_urb_enqueue:
ep15out-bulk: urb 00000000e8c87658 pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.166896: xhci_handle_event:
EVENT: TRB 00000004c1066dc0 status 'Short Packet' len 2609 slot 10 ep
3 type 'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.166897: xhci_handle_transfer:
BULK: Buffer 00000004bba8b000 length 4096 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:I:e:C
 systemd-journal-322   [000] d.h.  2698.166898: xhci_inc_deq: BULK
00000000679c20b6: enq 0x00000004c1066e00(0x00000004c1066000) deq
0x00000004c1066dd0(0x00000004c1066000) segs 2 stream 0 free_trbs 506
bounce 1024 cycle 1
 systemd-journal-322   [000] d.h.  2698.166899: xhci_urb_giveback:
ep1in-bulk: urb 0000000022cd1a77 pipe 3225454208 slot 10 length
1487/4096 sgs 0/0 stream 0 flags 00010200
 systemd-journal-322   [000] d.h.  2698.166899: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4fa0(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
 systemd-journal-322   [000] d.h.  2698.166899: xhci_handle_event:
EVENT: TRB 0000000501a46510 status 'Success' len 0 slot 10 ep 0 type
'Command Completion Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.166899: xhci_handle_command:
CMD: Reset Endpoint Command: ctx 0000000000000000 slot 10 ep 29 flags
T:C
 systemd-journal-322   [000] d.h.  2698.166900:
xhci_handle_cmd_reset_ep: State stopped mult 1 max P. Streams 0
interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 2 maxp
1024 deq 00000004c134e871 avg trb len 0
 systemd-journal-322   [000] d.h.  2698.166902: xhci_dbg_reset_ep:
Ignoring reset ep completion code of 1
 systemd-journal-322   [000] d.h.  2698.166902: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep14in
 systemd-journal-322   [000] d.h.  2698.166903: xhci_inc_deq: CMD
00000000db2e184e: enq 0x0000000501a46520(0x0000000501a46000) deq
0x0000000501a46520(0x0000000501a46000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
 systemd-journal-322   [000] d.h.  2698.166903: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4fb0(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2663  [002] d...  2698.166905: xhci_queue_trb: BULK:
Buffer 00000002c6a97810 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2663  [002] d...  2698.166905: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010badc0(0x00000005010ba000) deq
0x00000005010badb0(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2663  [002] d...  2698.166905: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] ..s.  2698.166912: xhci_urb_enqueue:
ep1in-bulk: urb 0000000022cd1a77 pipe 3225454208 slot 10 length 0/4096
sgs 0/0 stream 0 flags 00010200
 systemd-journal-322   [000] d.s.  2698.166913: xhci_queue_trb: BULK:
Buffer 00000004bba8b000 length 4096 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:I:e:c
 systemd-journal-322   [000] d.s.  2698.166913: xhci_inc_enq: BULK
00000000679c20b6: enq 0x00000004c1066e10(0x00000004c1066000) deq
0x00000004c1066dd0(0x00000004c1066000) segs 2 stream 0 free_trbs 505
bounce 1024 cycle 1
 systemd-journal-322   [000] d.s.  2698.166913: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep1in
 systemd-journal-322   [000] d.h.  2698.166928: xhci_handle_event:
EVENT: TRB 00000005010badb0 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.166928: xhci_handle_transfer:
BULK: Buffer 00000002c6a97810 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.166929: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010badc0(0x00000005010ba000) deq
0x00000005010badc0(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.166929: xhci_urb_giveback:
ep15out-bulk: urb 00000000e8c87658 pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.166929: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4fc0(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2593  [003] d...  2698.166941: xhci_urb_enqueue:
ep15out-bulk: urb 0000000034fbbe49 pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2593  [003] d...  2698.166943: xhci_queue_trb: BULK:
Buffer 00000002c6b85c10 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2593  [003] d...  2698.166943: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010badd0(0x00000005010ba000) deq
0x00000005010badc0(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2593  [003] d...  2698.166943: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.166968: xhci_handle_event:
EVENT: TRB 00000005010badc0 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.166968: xhci_handle_transfer:
BULK: Buffer 00000002c6b85c10 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.166969: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010badd0(0x00000005010ba000) deq
0x00000005010badd0(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.166969: xhci_urb_giveback:
ep15out-bulk: urb 0000000034fbbe49 pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.166969: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4fd0(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2595  [001] dN..  2698.167555: xhci_urb_enqueue:
ep15out-bulk: urb 0000000069f6a5f2 pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2595  [001] dN..  2698.167555: xhci_queue_trb: BULK:
Buffer 00000001a9787810 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2595  [001] dN..  2698.167556: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bade0(0x00000005010ba000) deq
0x00000005010badd0(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2595  [001] dN..  2698.167556: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.167563: xhci_handle_event:
EVENT: TRB 00000005010badd0 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.167563: xhci_handle_transfer:
BULK: Buffer 00000001a9787810 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.167564: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bade0(0x00000005010ba000) deq
0x00000005010bade0(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.167564: xhci_urb_giveback:
ep15out-bulk: urb 0000000069f6a5f2 pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.167564: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4fe0(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2663  [002] d...  2698.167999: xhci_urb_enqueue:
ep15out-bulk: urb 00000000162f0714 pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2663  [002] d...  2698.167999: xhci_queue_trb: BULK:
Buffer 00000002c6a94010 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2663  [002] d...  2698.168000: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010badf0(0x00000005010ba000) deq
0x00000005010bade0(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2663  [002] d...  2698.168000: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.168006: xhci_handle_event:
EVENT: TRB 00000005010bade0 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.168007: xhci_handle_transfer:
BULK: Buffer 00000002c6a94010 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.168007: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010badf0(0x00000005010ba000) deq
0x00000005010badf0(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.168008: xhci_urb_giveback:
ep15out-bulk: urb 00000000162f0714 pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.168008: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4ff0(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 1
         python3-2589  [002] d...  2698.168168: xhci_urb_enqueue:
ep15out-bulk: urb 00000000cfc89c75 pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2589  [002] d...  2698.168169: xhci_queue_trb: BULK:
Buffer 00000002c6a95010 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2589  [002] d...  2698.168170: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bae00(0x00000005010ba000) deq
0x00000005010badf0(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2589  [002] d...  2698.168170: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.168176: xhci_handle_event:
EVENT: TRB 00000005010badf0 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:C
 systemd-journal-322   [000] d.h.  2698.168177: xhci_handle_transfer:
BULK: Buffer 00000002c6a95010 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.168177: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bae00(0x00000005010ba000) deq
0x00000005010bae00(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.168178: xhci_urb_giveback:
ep15out-bulk: urb 00000000cfc89c75 pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.168178: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4000(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 0
         python3-2587  [001] dN..  2698.168379: xhci_urb_enqueue:
ep15out-bulk: urb 0000000069f6a5f2 pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2587  [001] dN..  2698.168380: xhci_queue_trb: BULK:
Buffer 00000001a9784010 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2587  [001] dN..  2698.168380: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bae10(0x00000005010ba000) deq
0x00000005010bae00(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2587  [001] dN..  2698.168380: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.168390: xhci_handle_event:
EVENT: TRB 00000005010bae00 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:c
 systemd-journal-322   [000] d.h.  2698.168390: xhci_handle_transfer:
BULK: Buffer 00000001a9784010 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.168391: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bae10(0x00000005010ba000) deq
0x00000005010bae10(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.168391: xhci_urb_giveback:
ep15out-bulk: urb 0000000069f6a5f2 pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.168392: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4010(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 0
         python3-2593  [003] d...  2698.168736: xhci_urb_enqueue:
ep15out-bulk: urb 0000000051ae9449 pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2593  [003] d...  2698.168736: xhci_queue_trb: BULK:
Buffer 00000002c6b86c10 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2593  [003] d...  2698.168737: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bae20(0x00000005010ba000) deq
0x00000005010bae10(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2593  [003] d...  2698.168737: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.168744: xhci_handle_event:
EVENT: TRB 00000005010bae10 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:c
 systemd-journal-322   [000] d.h.  2698.168744: xhci_handle_transfer:
BULK: Buffer 00000002c6b86c10 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.168745: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bae20(0x00000005010ba000) deq
0x00000005010bae20(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.168745: xhci_urb_giveback:
ep15out-bulk: urb 0000000051ae9449 pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.168746: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4020(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 0
         python3-2589  [002] dN..  2698.169401: xhci_urb_enqueue:
ep15out-bulk: urb 00000000c458c8f7 pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2589  [002] dN..  2698.169403: xhci_queue_trb: BULK:
Buffer 00000002c6a95810 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2589  [002] dN..  2698.169403: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bae30(0x00000005010ba000) deq
0x00000005010bae20(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2589  [002] dN..  2698.169403: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.169410: xhci_handle_event:
EVENT: TRB 00000005010bae20 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:c
 systemd-journal-322   [000] d.h.  2698.169411: xhci_handle_transfer:
BULK: Buffer 00000002c6a95810 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.169411: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bae30(0x00000005010ba000) deq
0x00000005010bae30(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.169412: xhci_urb_giveback:
ep15out-bulk: urb 00000000c458c8f7 pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.169412: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4030(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 0
         python3-2587  [001] d...  2698.169554: xhci_urb_enqueue:
ep15out-bulk: urb 0000000075a92aeb pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2587  [001] d...  2698.169555: xhci_queue_trb: BULK:
Buffer 00000001a9786c10 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2587  [001] d...  2698.169555: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bae40(0x00000005010ba000) deq
0x00000005010bae30(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2587  [001] d...  2698.169555: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.169562: xhci_handle_event:
EVENT: TRB 00000005010bae30 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:c
 systemd-journal-322   [000] d.h.  2698.169562: xhci_handle_transfer:
BULK: Buffer 00000001a9786c10 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.169563: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bae40(0x00000005010ba000) deq
0x00000005010bae40(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.169563: xhci_urb_giveback:
ep15out-bulk: urb 0000000075a92aeb pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.169564: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4040(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 0
         python3-2594  [003] d...  2698.169629: xhci_urb_enqueue:
ep15out-bulk: urb 00000000ec45ccbb pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2594  [003] d...  2698.169630: xhci_queue_trb: BULK:
Buffer 00000002c6b86c10 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2594  [003] d...  2698.169630: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bae50(0x00000005010ba000) deq
0x00000005010bae40(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2594  [003] d...  2698.169630: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.169640: xhci_handle_event:
EVENT: TRB 00000005010bae40 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:c
 systemd-journal-322   [000] d.h.  2698.169640: xhci_handle_transfer:
BULK: Buffer 00000002c6b86c10 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.169641: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bae50(0x00000005010ba000) deq
0x00000005010bae50(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.169641: xhci_urb_giveback:
ep15out-bulk: urb 00000000ec45ccbb pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.169641: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4050(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 0
         python3-2587  [001] d...  2698.170161: xhci_urb_enqueue:
ep15out-bulk: urb 00000000882613fe pipe 3221718528 slot 10 length
0/508 sgs 0/0 stream 0 flags 00010000
         python3-2587  [001] d...  2698.170162: xhci_queue_trb: BULK:
Buffer 00000001a9787c10 length 508 TD size 0 intr 0 type 'Normal'
flags b:i:I:c:s:i:e:C
         python3-2587  [001] d...  2698.170162: xhci_inc_enq: BULK
0000000030ef4b9f: enq 0x00000005010bae60(0x00000005010ba000) deq
0x00000005010bae50(0x00000005010ba000) segs 2 stream 0 free_trbs 508
bounce 1024 cycle 0
         python3-2587  [001] d...  2698.170163: xhci_ring_ep_doorbell:
Ring doorbell for Slot 10 ep15out
 systemd-journal-322   [000] d.h.  2698.170169: xhci_handle_event:
EVENT: TRB 00000005010bae50 status 'Success' len 0 slot 10 ep 30 type
'Transfer Event' flags e:c
 systemd-journal-322   [000] d.h.  2698.170170: xhci_handle_transfer:
BULK: Buffer 00000001a9787c10 length 508 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:i:e:c
 systemd-journal-322   [000] d.h.  2698.170170: xhci_inc_deq: BULK
0000000030ef4b9f: enq 0x00000005010bae60(0x00000005010ba000) deq
0x00000005010bae60(0x00000005010ba000) segs 2 stream 0 free_trbs 509
bounce 1024 cycle 0
 systemd-journal-322   [000] d.h.  2698.170171: xhci_urb_giveback:
ep15out-bulk: urb 00000000882613fe pipe 3221718528 slot 10 length
508/508 sgs 0/0 stream 0 flags 00010000
 systemd-journal-322   [000] d.h.  2698.170171: xhci_inc_deq: EVENT
00000000a45e775e: enq 0x0000000501aa4000(0x0000000501aa4000) deq
0x0000000501aa4060(0x0000000501aa4000) segs 1 stream 0 free_trbs 254
bounce 0 cycle 0
 systemd-journal-322   [000] d.h.  2698.170388: xhci_handle_event:
EVENT: TRB 00000004c134e870 status 'USB Transaction Error' len 1500
slot 10 ep 29 type 'Transfer Event' flags e:c
 systemd-journal-322   [000] d.h.  2698.170392: xhci_handle_transfer:
BULK: Buffer 00000000c3954440 length 1500 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:I:e:C
 systemd-journal-322   [000] d.h.  2698.170393: xhci_queue_trb: CMD:
Reset Endpoint Command: ctx 0000000000000000 slot 10 ep 29 flags T:C
 systemd-journal-322   [000] d.h.  2698.170394: xhci_inc_enq: CMD
00000000db2e184e: enq 0x0000000501a46530(0x0000000501a46000) deq
0x0000000501a46520(0x0000000501a46000) segs 1 stream 0 free_trbs 253
bounce 0 cycle 1
 systemd-journal-322   [000] d.h.  2698.170396:
xhci_ring_host_doorbell: Ring doorbell for Command Ring 0

the trace then is continuously reporting transaction errors and
endpoint stalled.

Full traces and dmesg available at
https://drive.google.com/drive/folders/1O0innw1D-wfyCFz6tVsUg6cphgzw-W_-?usp=sharing

Can anyone see an xhci issue here, or is this a device issue?

Thanks a lot,
Daniele
