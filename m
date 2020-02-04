Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86AF6151D20
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 16:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgBDPXy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Feb 2020 10:23:54 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35468 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbgBDPXy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Feb 2020 10:23:54 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 014FNn0Q079542;
        Tue, 4 Feb 2020 09:23:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580829829;
        bh=G6JtbXYTj3huUEpGiJD/Oah5fU2VAHFpd/OcLjB8JkU=;
        h=To:From:Subject:Date;
        b=ZxEv31+HKpnRzM2wYYLi24fd49xq4sdHmQFPrcmDZkV1j3QNMPBkoDivP6XaX5eN6
         8dxfEILJkCnC82gXxSWLA1EV1E02h+wh8Dtwc2Xq9cn0dAYiJsS7/ghsd8sb8UxNRk
         ijczGL3C8qwGy6gxOZ8AQYdC4yT24yurTj2Okgqc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 014FNnRX004633
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Feb 2020 09:23:49 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 4 Feb
 2020 09:23:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 4 Feb 2020 09:23:48 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 014FNlo2111984;
        Tue, 4 Feb 2020 09:23:48 -0600
To:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   Roger Quadros <rogerq@ti.com>
Subject: dwc3: run stop times out on dra7
Message-ID: <70e4f2b0-7f2e-0fc0-1cfb-7479d78760e6@ti.com>
Date:   Tue, 4 Feb 2020 17:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

on v5.5. on dra7 platform connected to PC host.

root@dra7xx-evm:~# uname -a
Linux dra7xx-evm 5.5.0 #551 SMP Tue Feb 4 17:10:23 EET 2020 armv7l armv7l armv7l GNU/Linux
root@dra7xx-evm:~# modprobe g_zero
[   26.176210] zero gadget: Gadget Zero, version: Cinco de Mayo 2008
[   26.182384] zero gadget: zero ready
root@dra7xx-evm:~# modprobe -r g_zero
[   32.250704] ------------[ cut here ]------------
[   32.255368] WARNING: CPU: 1 PID: 1278 at drivers/usb/gadget/composite.c:2024 __composite_unbind+0xc8/0xd8 [libcomposite]
[   32.266330] Modules linked in: usb_f_ss_lb g_zero(-) libcomposite xhci_plat_hcd xhci_hcd usbcore dwc3 udc_core usb_common evdev spi_nor snd_soc_simple_card snd_soc_simple_card_utils leds_gpio led_class gpio_4
[   32.322121] CPU: 1 PID: 1278 Comm: modprobe Not tainted 5.5.0 #551
[   32.328330] Hardware name: Generic DRA74X (Flattened Device Tree)
[   32.334467] [<c0112968>] (unwind_backtrace) from [<c010cb88>] (show_stack+0x10/0x14)
[   32.342250] [<c010cb88>] (show_stack) from [<c08fee14>] (dump_stack+0xc0/0xe0)
[   32.349509] [<c08fee14>] (dump_stack) from [<c013a3a8>] (__warn+0xd0/0xf8)
[   32.356419] [<c013a3a8>] (__warn) from [<c013a478>] (warn_slowpath_fmt+0xa8/0xb8)
[   32.363951] [<c013a478>] (warn_slowpath_fmt) from [<bf17cafc>] (__composite_unbind+0xc8/0xd8 [libcomposite])
[   32.373872] [<bf17cafc>] (__composite_unbind [libcomposite]) from [<bf170474>] (usb_gadget_remove_driver+0x48/0x7c [udc_core])
[   32.385329] [<bf170474>] (usb_gadget_remove_driver [udc_core]) from [<bf170540>] (usb_gadget_unregister_driver+0x98/0xd8 [udc_core])
[   32.397303] [<bf170540>] (usb_gadget_unregister_driver [udc_core]) from [<c01d8774>] (sys_delete_module+0x1a0/0x248)
[   32.407875] [<c01d8774>] (sys_delete_module) from [<c01011e0>] (__sys_trace_return+0x0/0x20)
[   32.416348] Exception stack(0xecfdffa8 to 0xecfdfff0)
[   32.421424] ffa0:                   000363d8 00036414 00036414 00000800 0000006c 00000000
[   32.429637] ffc0: 000363d8 00036414 00000000 00000081 00000001 00000000 bea71c44 00000000
[   32.437850] ffe0: b6e732f0 bea708b4 0001b3cf b6e732fc
[   32.442958] ---[ end trace 17a4fad12463bfc1 ]---

backtrace is because dwc3_gadget_run_stop() times out at pulldown
and dwc3_gadget_pullup() returns -110
So,

usb_gadget_disconnect() does not call disconnect().

         ret = gadget->ops->pullup(gadget, 0);
         if (!ret) {
                 gadget->connected = 0;
                 gadget->udc->driver->disconnect(gadget);
         }

Any idea why controller stop might time out?

Tracelog blow

# tracer: nop
#
# entries-in-buffer/entries-written: 301/301   #P:2
#
#                              _-----=> irqs-off
#                             / _----=> need-resched
#                            | / _---=> hardirq/softirq
#                            || / _--=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
         modprobe-1271  [001] .n..    26.163268: dwc3_alloc_request: ep0out: req 88d44841 length 0/0 zsI ==> 0
         modprobe-1271  [001] d...    26.186288: dwc3_gadget_ep_cmd: ep0out: cmd 'Start New Configuration' [409] params 00000000 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186293: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186296: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186299: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186301: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186304: dwc3_gadget_ep_cmd: ep2out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186307: dwc3_gadget_ep_cmd: ep2in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186310: dwc3_gadget_ep_cmd: ep3out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186312: dwc3_gadget_ep_cmd: ep3in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186315: dwc3_gadget_ep_cmd: ep4out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186317: dwc3_gadget_ep_cmd: ep4in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186320: dwc3_gadget_ep_cmd: ep5out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186323: dwc3_gadget_ep_cmd: ep5in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186326: dwc3_gadget_ep_cmd: ep6out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186328: dwc3_gadget_ep_cmd: ep6in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186331: dwc3_gadget_ep_cmd: ep7out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186333: dwc3_gadget_ep_cmd: ep7in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186336: dwc3_gadget_ep_cmd: ep8out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186339: dwc3_gadget_ep_cmd: ep8in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186341: dwc3_gadget_ep_cmd: ep9out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186344: dwc3_gadget_ep_cmd: ep9in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186347: dwc3_gadget_ep_cmd: ep10out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186349: dwc3_gadget_ep_cmd: ep10in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186352: dwc3_gadget_ep_cmd: ep11out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186355: dwc3_gadget_ep_cmd: ep11in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186357: dwc3_gadget_ep_cmd: ep12out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186360: dwc3_gadget_ep_cmd: ep12in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186363: dwc3_gadget_ep_cmd: ep13out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186366: dwc3_gadget_ep_cmd: ep13in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186368: dwc3_gadget_ep_cmd: ep14out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186371: dwc3_gadget_ep_cmd: ep14in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186374: dwc3_gadget_ep_cmd: ep15out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186376: dwc3_gadget_ep_cmd: ep15in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186379: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 00001000 00000500 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186381: dwc3_gadget_ep_enable: ep0out: mps 512/512 streams 0 burst 1 ring 0/0 flags E:swbp:>
         modprobe-1271  [001] d...    26.186384: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 00001000 02000500 00000000 --> status: Successful
         modprobe-1271  [001] d...    26.186386: dwc3_gadget_ep_enable: ep0in: mps 512/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
         modprobe-1271  [001] d...    26.186388: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
         modprobe-1271  [001] d...    26.186394: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.186427: dwc3_event: event (00150301): Link Change [RX.Detect]
     irq/170-dwc3-1273  [000] d...    26.285124: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1273  [000] d...    26.285128: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1273  [000] d...    26.288116: dwc3_event: event (00050301): Link Change [RX.Detect]
     irq/170-dwc3-1273  [000] d...    26.291122: dwc3_event: event (00030301): Link Change [U3]
     irq/170-dwc3-1273  [000] d...    26.594415: dwc3_event: event (00000101): Reset [U0]
     irq/170-dwc3-1273  [000] d...    26.609168: dwc3_event: event (00000201): Connection Done [U0]
     irq/170-dwc3-1273  [000] d...    26.609177: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.609179: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
     irq/170-dwc3-1273  [000] d...    26.609183: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.609184: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1273  [000] d...    26.609189: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1273  [000] d...    26.674261: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.674265: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 64)
     irq/170-dwc3-1273  [000] d...    26.674275: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 18 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.674281: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.674284: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.674313: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.674315: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.674320: dwc3_gadget_giveback: ep0out: req 88d44841 length 18/18 ZsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.674327: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.674329: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.674334: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.674388: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.674390: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.674396: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.674402: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.677464: dwc3_event: event (00050301): Link Change [RX.Detect]
     irq/170-dwc3-1273  [000] d...    26.677965: dwc3_event: event (00000101): Reset [U0]
     irq/170-dwc3-1273  [000] d...    26.689238: dwc3_event: event (00000201): Connection Done [U0]
     irq/170-dwc3-1273  [000] d...    26.689244: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.689246: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
     irq/170-dwc3-1273  [000] d...    26.689249: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.689250: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1273  [000] d...    26.689251: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1273  [000] d...    26.754312: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.754315: dwc3_ctrl_req: Set Address(Addr = 17)
     irq/170-dwc3-1273  [000] d...    26.754319: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.754321: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1273  [000] d...    26.754328: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.754336: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.754337: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1273  [000] d...    26.754341: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.754346: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.774285: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.774286: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 18)
     irq/170-dwc3-1273  [000] d...    26.774295: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 18 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.774301: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.774303: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.774328: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.774330: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.774334: dwc3_gadget_giveback: ep0out: req 88d44841 length 18/18 zsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.774341: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.774342: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.774347: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.774406: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.774408: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.774412: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.774417: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.774485: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.774487: dwc3_ctrl_req: Get BOS Descriptor(Index = 0, Length = 5)
     irq/170-dwc3-1273  [000] d...    26.774493: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 5 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.774498: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.774506: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.774533: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.774534: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.774539: dwc3_gadget_giveback: ep0out: req 88d44841 length 5/5 zsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.774545: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.774546: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.774552: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.774622: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.774624: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.774628: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.774633: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.774740: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.774742: dwc3_ctrl_req: Get BOS Descriptor(Index = 0, Length = 22)
     irq/170-dwc3-1273  [000] d...    26.774747: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 22 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.774753: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.774761: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.774767: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.774768: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.774772: dwc3_gadget_giveback: ep0out: req 88d44841 length 22/22 zsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.774779: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.774780: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.774785: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.774824: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.774825: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.774829: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.774834: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.774979: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.774981: dwc3_ctrl_req: Get Configuration Descriptor(Index = 0, Length = 9)
     irq/170-dwc3-1273  [000] d...    26.774989: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 9 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.774994: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775002: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775029: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775030: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.775034: dwc3_gadget_giveback: ep0out: req 88d44841 length 9/9 zsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.775041: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.775042: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.775047: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775103: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.775105: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.775108: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.775114: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775251: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.775252: dwc3_ctrl_req: Get Configuration Descriptor(Index = 0, Length = 69)
     irq/170-dwc3-1273  [000] d...    26.775258: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 69 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.775264: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775271: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775287: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775289: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.775293: dwc3_gadget_giveback: ep0out: req 88d44841 length 69/69 zsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.775300: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.775301: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.775306: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775333: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.775335: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.775338: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.775344: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775504: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.775505: dwc3_ctrl_req: Get Configuration Descriptor(Index = 1, Length = 9)
     irq/170-dwc3-1273  [000] d...    26.775512: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 9 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.775518: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775526: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775552: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775554: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.775558: dwc3_gadget_giveback: ep0out: req 88d44841 length 9/9 zsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.775565: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.775566: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.775571: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775626: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.775627: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.775631: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.775636: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775643: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.775644: dwc3_ctrl_req: Get Configuration Descriptor(Index = 1, Length = 32)
     irq/170-dwc3-1273  [000] d...    26.775650: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 32 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.775656: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775658: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775674: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775676: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.775680: dwc3_gadget_giveback: ep0out: req 88d44841 length 32/32 zsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.775687: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.775688: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.775693: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775722: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.775723: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.775727: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.775732: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775779: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.775781: dwc3_ctrl_req: Get String Descriptor(Index = 0, Length = 255)
     irq/170-dwc3-1273  [000] d...    26.775790: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.775795: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775803: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775830: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775832: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.775836: dwc3_gadget_giveback: ep0out: req 88d44841 length 4/4 ZsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.775842: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.775843: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.775849: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775907: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.775908: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.775912: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.775917: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775952: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.775953: dwc3_ctrl_req: Get String Descriptor(Index = 2, Length = 255)
     irq/170-dwc3-1273  [000] d...    26.775960: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 24 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.775966: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.775973: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775989: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.775990: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.775994: dwc3_gadget_giveback: ep0out: req 88d44841 length 24/24 ZsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.776001: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.776002: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.776008: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.776039: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.776040: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.776044: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.776049: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.776066: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.776067: dwc3_ctrl_req: Get String Descriptor(Index = 1, Length = 255)
     irq/170-dwc3-1273  [000] d...    26.776073: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 58 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.776079: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.776081: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.776088: dwc3_event: event (000090c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.776117: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.776118: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.776122: dwc3_gadget_giveback: ep0out: req 88d44841 length 58/58 ZsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.776129: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.776131: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.776136: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.776175: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.776176: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.776180: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.776185: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.776254: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.776256: dwc3_ctrl_req: Get String Descriptor(Index = 3, Length = 255)
     irq/170-dwc3-1273  [000] d...    26.776262: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 66 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.776267: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.776275: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.776281: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.776282: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.776286: dwc3_gadget_giveback: ep0out: req 88d44841 length 66/66 ZsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.776292: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.776293: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.776299: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.776330: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.776332: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.776336: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.776341: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.777893: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.777895: dwc3_ctrl_req: Set Configuration(Config = 3)
     irq/170-dwc3-1273  [000] d...    26.777921: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00021004 06000200 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.777930: dwc3_gadget_ep_cmd: ep1in: cmd 'Start Transfer' [406] params 00000000 fe05e000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.777932: dwc3_gadget_ep_enable: ep1in: mps 512/1024 streams 15 burst 0 ring 0/0 flags E:swBp:<
     irq/170-dwc3-1273  [000] d...    26.777935: dwc3_alloc_request: ep1in: req f5bf02ed length 0/0 zsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.777940: dwc3_ep_queue: ep1in: req f5bf02ed length 0/4096 zsI ==> -115
     irq/170-dwc3-1273  [000] d...    26.777943: dwc3_prepare_trb: ep1in: trb 1febd846 buf 000000009e738000 size 4096 ctrl 00000811 (Hlcs:sC:normal)
     irq/170-dwc3-1273  [000] d...    26.777948: dwc3_gadget_ep_cmd: ep1in: cmd 'Update Transfer' [30007] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.777953: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Configuration' [401] params 00001004 04000200 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.777960: dwc3_gadget_ep_cmd: ep1out: cmd 'Start Transfer' [406] params 00000000 fe05d000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.777962: dwc3_gadget_ep_enable: ep1out: mps 512/1024 streams 15 burst 0 ring 0/0 flags E:swBp:>
     irq/170-dwc3-1273  [000] d...    26.777964: dwc3_alloc_request: ep1out: req 6f9b1e13 length 0/0 zsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.777970: dwc3_ep_queue: ep1out: req 6f9b1e13 length 0/4096 zsI ==> -115
     irq/170-dwc3-1273  [000] d...    26.777972: dwc3_prepare_trb: ep1out: trb 7f5de032 buf 00000000acbcc000 size 4096 ctrl 00000819 (HlcS:sC:normal)
     irq/170-dwc3-1273  [000] d...    26.777977: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20007] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.777990: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.777991: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1273  [000] d...    26.777996: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.778023: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.778025: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1273  [000] d...    26.778028: dwc3_gadget_giveback: ep0out: req 88d44841 length 0/0 zsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.778030: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.778035: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.778075: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1273  [000] d...    26.778077: dwc3_ctrl_req: Get String Descriptor(Index = 4, Length = 255)
     irq/170-dwc3-1273  [000] d...    26.778083: dwc3_prepare_trb: ep0in: trb 9dbd6747 buf 00000000ace8d000 size 42 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.778089: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.778097: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.778121: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1273  [000] d...    26.778123: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000ace8d000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1273  [000] d...    26.778127: dwc3_gadget_giveback: ep0out: req 88d44841 length 42/42 ZsI ==> 0
     irq/170-dwc3-1273  [000] d...    26.778134: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.778135: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.778140: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1273  [000] d...    26.778174: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1273  [000] d...    26.778176: dwc3_complete_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1273  [000] d...    26.778180: dwc3_prepare_trb: ep0out: trb 9dbd6747 buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1273  [000] d...    26.778185: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
         modprobe-1278  [001] dn..    32.447603: dwc3_gadget_ep_disable: ep1in: mps 512/1024 streams 15 burst 0 ring 1/0 flags E:swBp:<
         modprobe-1278  [001] dn..    32.447611: dwc3_gadget_ep_cmd: ep1in: cmd 'End Transfer' [30c08] params 00000000 00000000 00000000 --> status: Successful
         modprobe-1278  [001] dn..    32.447714: dwc3_gadget_giveback: ep1in: req f5bf02ed length 0/4096 zsI ==> -108
         modprobe-1278  [001] dn..    32.447718: dwc3_free_request: ep1in: req f5bf02ed length 0/4096 zsI ==> -108
         modprobe-1278  [001] dn..    32.447721: dwc3_gadget_ep_disable: ep1out: mps 512/1024 streams 15 burst 0 ring 1/0 flags E:swBp:>
         modprobe-1278  [001] dn..    32.447724: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20c08] params 00000000 00000000 00000000 --> status: Successful
         modprobe-1278  [001] dn..    32.447827: dwc3_gadget_giveback: ep1out: req 6f9b1e13 length 0/4096 zsI ==> -108
         modprobe-1278  [001] dn..    32.447829: dwc3_free_request: ep1out: req 6f9b1e13 length 0/4096 zsI ==> -108
         modprobe-1278  [001] .n..    32.447840: dwc3_free_request: ep0out: req 88d44841 length 42/42 ZsI ==> 0
         modprobe-1278  [001] dn..    32.447877: dwc3_gadget_ep_disable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
         modprobe-1278  [001] dn..    32.447881: dwc3_gadget_ep_cmd: ep0out: cmd 'End Transfer' [c08] params 00000000 00000000 00000000 --> status: Successful
         modprobe-1278  [001] dn..    32.447983: dwc3_gadget_ep_disable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
