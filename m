Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00734E8726
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 12:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfJ2Lac (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 07:30:32 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54124 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfJ2Lac (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 07:30:32 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9TBUQTG040734;
        Tue, 29 Oct 2019 06:30:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572348626;
        bh=xZtxTdaiaPsIHFNdFYD5qOjUJIAFyZBwjrAx4qpz1oA=;
        h=To:CC:From:Subject:Date;
        b=kd3vS0JXuzWdEvVx30u80vHS0eqJK0s9MMNDT9+tjg5kt4PoQqZw90K/o++br8b/v
         9Q2sG3aPL5OYdm3D1jVAEanpzUQaHF/KhV1p3MYV7SOVEGRXUCBEdtY7bonHtOdQ+H
         qPsD0eYTmX54bPNVqrsX0s8zVAJ65U11wct/BChw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9TBUQZr087585
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 29 Oct 2019 06:30:26 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 29
 Oct 2019 06:30:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 29 Oct 2019 06:30:14 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TBUOjV027210;
        Tue, 29 Oct 2019 06:30:24 -0500
To:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "Bin Liu [EP]" <b-liu@ti.com>
From:   Roger Quadros <rogerq@ti.com>
Subject: g_audio breaks with dwc3
Message-ID: <c97b96cf-65f6-5143-838f-a3e9d1a5c5b2@ti.com>
Date:   Tue, 29 Oct 2019 13:30:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
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

I'm on v5.4-rc5 on TI's dra7 platform

root@dra7xx-evm:~# modprobe g_audio
[   79.951077] g_audio gadget: Linux USB Audio Gadget, version: Feb 2, 2012
[   79.957849] g_audio gadget: g_audio ready

Now I plug the EVM's USB to PC host.

root@dra7xx-evm:~# [   85.359410] g_audio gadget: high-speed config #1: Linux USB Audio Gadget
[   85.450574] 8<--- cut here ---
[   85.453645] Unable to handle kernel paging request at virtual address ecb769dc
[   85.460900] pgd = 08bb55ef
[   85.463618] [ecb769dc] *pgd=aca1141e(bad)
[   85.467651] Internal error: Oops: 8000000d [#1] SMP ARM
[   85.472897] Modules linked in: usb_f_uac2 u_audio g_audio libcomposite xhci_plat_hcd xhci_hcd usbcore dwc3 evdev udc_core usb_common spi_nor snd_soc_simple_card snd_soc_simple_card_utils leds_gpio led_class 4
[   85.523128] CPU: 0 PID: 1240 Comm: irq/170-dwc3 Not tainted 5.4.0-rc5 #50
[   85.529945] Hardware name: Generic DRA74X (Flattened Device Tree)
[   85.536066] PC is at 0xecb769dc
[   85.539240] LR is at dwc3_gadget_giveback+0x44/0x50 [dwc3]
[   85.544749] pc : [<ecb769dc>]    lr : [<bf1730b8>]    psr: 60000093
[   85.551041] sp : ece43d98  ip : 00000002  fp : 00000000
[   85.556288] r10: ebc75348  r9 : ecc41580  r8 : 00000000
[   85.561533] r7 : eb9dca80  r6 : ed7860b4  r5 : ecb000c0  r4 : ecb768ec
[   85.568088] r3 : ecb769dc  r2 : 00000000  r1 : ed7860b4  r0 : ecb000c0
[   85.574643] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   85.581894] Control: 10c5387d  Table: ac81c06a  DAC: 00000051
[   85.587664] Process irq/170-dwc3 (pid: 1240, stack limit = 0x8547d39d)
[   85.594219] Stack: (0xece43d98 to 0xece44000)
[   85.598595] 3d80:                                                       ecb000c0 ecb000f4
[   85.606808] 3da0: ecb76840 bf1767a4 ecb000c0 ecb768ec 20000093 eb9dca80 00000000 ecc41580
[   85.615023] 3dc0: ebc75348 bf1771dc eb9dca80 00000000 ecc41580 00000008 00000001 ecb000c0
[   85.623238] 3de0: ecb000c0 bf1400f0 00000002 ecc41580 ecb000c0 bf1e565c 00000000 ecaae000
[   85.631452] 3e00: bf1ea364 00000002 00000002 ecb769c0 00000000 bf1ea3e4 ecaae800 bf14c018
[   85.639665] 3e20: e4e1700c ee004080 40000093 e4e17014 ecb76840 eb9dca80 00000000 00000000
[   85.647880] 3e40: 00000403 c0d05148 ed744c00 f10cf000 00000000 00000004 ecc76540 f19d2954
[   85.656095] 3e60: e4e18d18 ecb76840 f10cf000 c0d05148 ecb63b14 00000000 00000004 ecc76540
[   85.664307] 3e80: ecb76840 bf177a18 ecb76840 f10cf000 c0d05148 bf1793d8 ecc76540 bf1703b4
[   85.672521] 3ea0: eebae5e4 ee004080 e4e18d18 f19d2954 e4e18d20 0000c040 ed786240 ec874f24
[   85.680735] 3ec0: 00000001 00000000 00000004 ecc76540 ecb76840 bf1759e8 00000002 c0904abc
[   85.688947] 3ee0: ece43f3c c08da434 ecb768ec 60000013 bf183f4c bf183f60 2df1e000 c08da990
[   85.697163] 3f00: e53817f1 00000013 00000000 ece43f0c 0000c040 f19d2954 ec874f00 ec874f00
[   85.705377] 3f20: ec974f00 ec874f24 00000001 00000000 ec974f00 ec874f00 c0199f98 c0199fb4
[   85.713589] 3f40: 00000000 ffffe000 ec874f24 c019a2b8 ffffe000 00000000 c019a0d4 f19d2954
[   85.721804] 3f60: ffffe000 00000000 eb8fcec0 ebbc6540 ece42000 ec874f00 c019a1b0 ec907c9c
[   85.730019] 3f80: ebbc655c c015ca68 00000001 eb8fcec0 c015c934 00000000 00000000 00000000
[   85.738232] 3fa0: 00000000 00000000 00000000 c01010e8 00000000 00000000 00000000 00000000
[   85.746445] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   85.754657] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[   85.762922] [<bf1730b8>] (dwc3_gadget_giveback [dwc3]) from [<bf1767a4>] (__dwc3_gadget_ep_disable+0x8c/0x298 [dwc3])
[   85.773605] [<bf1767a4>] (__dwc3_gadget_ep_disable [dwc3]) from [<bf1771dc>] (dwc3_gadget_ep_disable+0x38/0xc4 [dwc3])
[   85.784370] [<bf1771dc>] (dwc3_gadget_ep_disable [dwc3]) from [<bf1400f0>] (usb_ep_disable+0x20/0xb0 [udc_core])
[   85.794602] [<bf1400f0>] (usb_ep_disable [udc_core]) from [<bf1e565c>] (u_audio_stop_playback+0x90/0xc0 [u_audio])
[   85.805007] [<bf1e565c>] (u_audio_stop_playback [u_audio]) from [<bf1ea3e4>] (afunc_set_alt+0x80/0xf8 [usb_f_uac2])
[   85.815507] [<bf1ea3e4>] (afunc_set_alt [usb_f_uac2]) from [<bf14c018>] (composite_setup+0x58c/0x1c68 [libcomposite])
[   85.826190] [<bf14c018>] (composite_setup [libcomposite]) from [<bf177a18>] (dwc3_ep0_delegate_req+0x34/0x48 [dwc3])
[   85.836785] [<bf177a18>] (dwc3_ep0_delegate_req [dwc3]) from [<bf1793d8>] (dwc3_ep0_interrupt+0x740/0xc70 [dwc3])
[   85.847117] [<bf1793d8>] (dwc3_ep0_interrupt [dwc3]) from [<bf1759e8>] (dwc3_thread_interrupt+0x974/0x1380 [dwc3])
[   85.857532] [<bf1759e8>] (dwc3_thread_interrupt [dwc3]) from [<c0199fb4>] (irq_thread_fn+0x1c/0x78)
[   85.866625] [<c0199fb4>] (irq_thread_fn) from [<c019a2b8>] (irq_thread+0x108/0x22c)
[   85.874320] [<c019a2b8>] (irq_thread) from [<c015ca68>] (kthread+0x134/0x148)
[   85.881492] [<c015ca68>] (kthread) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
[   85.888745] Exception stack(0xece43fb0 to 0xece43ff8)
[   85.893818] 3fa0:                                     00000000 00000000 00000000 00000000
[   85.902031] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   85.910244] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   85.916890] Code: bf141240 ed36a400 bf17e3a0 ed786240 (ed7860cc)
[   85.923014] ---[ end trace 37c9436d97be3dd3 ]---
[   85.927882] genirq: exiting task "irq/170-dwc3" (1240) is an active IRQ thread (irq 170)


dwc3 trace dump is below

# tracer: nop
#
# entries-in-buffer/entries-written: 888/888   #P:2
#
#                              _-----=> irqs-off
#                             / _----=> need-resched
#                            | / _---=> hardirq/softirq
#                            || / _--=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
         modprobe-1238  [000] .n..    79.937579: dwc3_alloc_request: ep0out: req 36600525 length 0/0 zsI ==> 0
         modprobe-1238  [000] dn..    79.962419: dwc3_gadget_ep_cmd: ep0out: cmd 'Start New Configuration' [409] params 00000000 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962425: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962429: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962432: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962435: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962438: dwc3_gadget_ep_cmd: ep2out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962441: dwc3_gadget_ep_cmd: ep2in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962444: dwc3_gadget_ep_cmd: ep3out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962447: dwc3_gadget_ep_cmd: ep3in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962450: dwc3_gadget_ep_cmd: ep4out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962454: dwc3_gadget_ep_cmd: ep4in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962457: dwc3_gadget_ep_cmd: ep5out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962460: dwc3_gadget_ep_cmd: ep5in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962463: dwc3_gadget_ep_cmd: ep6out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962466: dwc3_gadget_ep_cmd: ep6in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962470: dwc3_gadget_ep_cmd: ep7out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962473: dwc3_gadget_ep_cmd: ep7in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962476: dwc3_gadget_ep_cmd: ep8out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962479: dwc3_gadget_ep_cmd: ep8in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962482: dwc3_gadget_ep_cmd: ep9out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962486: dwc3_gadget_ep_cmd: ep9in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962489: dwc3_gadget_ep_cmd: ep10out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962492: dwc3_gadget_ep_cmd: ep10in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962495: dwc3_gadget_ep_cmd: ep11out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962498: dwc3_gadget_ep_cmd: ep11in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962501: dwc3_gadget_ep_cmd: ep12out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962503: dwc3_gadget_ep_cmd: ep12in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962507: dwc3_gadget_ep_cmd: ep13out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962510: dwc3_gadget_ep_cmd: ep13in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962513: dwc3_gadget_ep_cmd: ep14out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962516: dwc3_gadget_ep_cmd: ep14in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962520: dwc3_gadget_ep_cmd: ep15out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962523: dwc3_gadget_ep_cmd: ep15in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962526: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 00001000 00000500 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962529: dwc3_gadget_ep_enable: ep0out: mps 512/512 streams 0 burst 1 ring 0/0 flags E:swbp:>
         modprobe-1238  [000] dn..    79.962532: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 00001000 02000500 00000000 --> status: Successful
         modprobe-1238  [000] dn..    79.962534: dwc3_gadget_ep_enable: ep0in: mps 512/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
         modprobe-1238  [000] dn..    79.962536: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
         modprobe-1238  [000] dn..    79.962541: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    79.962610: dwc3_event: event (00150301): Link Change [RX.Detect]
     irq/170-dwc3-1240  [000] d...    80.060939: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1240  [000] d...    80.060942: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1240  [000] d...    80.063935: dwc3_event: event (00050301): Link Change [RX.Detect]
     irq/170-dwc3-1240  [000] d...    80.066937: dwc3_event: event (00030301): Link Change [U3]
     irq/170-dwc3-1240  [000] d...    85.177646: dwc3_event: event (00000101): Reset [U0]
     irq/170-dwc3-1240  [000] d...    85.194388: dwc3_event: event (00000201): Connection Done [U0]
     irq/170-dwc3-1240  [000] d...    85.194396: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.194399: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
     irq/170-dwc3-1240  [000] d...    85.194402: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.194403: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.194404: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1240  [000] d...    85.257402: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.257405: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 64)
     irq/170-dwc3-1240  [000] d...    85.257415: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 18 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.257421: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.257424: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.257447: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.257448: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.257454: dwc3_gadget_giveback: ep0out: req 36600525 length 18/18 ZsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.257456: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.257457: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.257463: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.257493: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.257495: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.257499: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.257504: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.260548: dwc3_event: event (00050301): Link Change [RX.Detect]
     irq/170-dwc3-1240  [000] d...    85.261043: dwc3_event: event (00000101): Reset [U0]
     irq/170-dwc3-1240  [000] d...    85.274388: dwc3_event: event (00000201): Connection Done [U0]
     irq/170-dwc3-1240  [000] d...    85.274394: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.274395: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
     irq/170-dwc3-1240  [000] d...    85.274398: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.274400: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.274402: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1240  [000] d...    85.337355: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.337357: dwc3_ctrl_req: Set Address(Addr = 11)
     irq/170-dwc3-1240  [000] d...    85.337361: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.337363: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.337368: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.337380: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.337381: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.337385: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.337390: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.357404: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.357406: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 18)
     irq/170-dwc3-1240  [000] d...    85.357413: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 18 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.357419: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.357423: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.357443: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.357445: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.357449: dwc3_gadget_giveback: ep0out: req 36600525 length 18/18 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.357451: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.357452: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.357457: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.357497: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.357499: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.357503: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.357508: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.357651: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.357653: dwc3_ctrl_req: Get BOS Descriptor(Index = 0, Length = 5)
     irq/170-dwc3-1240  [000] d...    85.357659: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 5 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.357665: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.357674: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.357700: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.357701: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.357705: dwc3_gadget_giveback: ep0out: req 36600525 length 5/5 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.357713: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.357714: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.357719: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.357773: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.357775: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.357778: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.357784: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.357869: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.357870: dwc3_ctrl_req: Get BOS Descriptor(Index = 0, Length = 22)
     irq/170-dwc3-1240  [000] d...    85.357876: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 22 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.357881: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.357891: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.357897: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.357898: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.357902: dwc3_gadget_giveback: ep0out: req 36600525 length 22/22 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.357909: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.357910: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.357915: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.357949: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.357951: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.357954: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.357960: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358064: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.358066: dwc3_ctrl_req: Get Configuration Descriptor(Index = 0, Length = 9)
     irq/170-dwc3-1240  [000] d...    85.358075: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 9 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.358081: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358085: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.358111: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.358112: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.358116: dwc3_gadget_giveback: ep0out: req 36600525 length 9/9 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.358123: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.358124: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.358130: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358184: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.358186: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.358189: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.358195: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358237: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.358239: dwc3_ctrl_req: Get Configuration Descriptor(Index = 0, Length = 219)
     irq/170-dwc3-1240  [000] d...    85.358246: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 219 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.358251: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358261: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.358286: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.358287: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.358291: dwc3_gadget_giveback: ep0out: req 36600525 length 219/219 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.358292: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.358293: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.358298: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358315: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.358316: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.358320: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.358326: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358355: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.358356: dwc3_ctrl_req: Get String Descriptor(Index = 0, Length = 255)
     irq/170-dwc3-1240  [000] d...    85.358363: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.358368: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358377: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.358403: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.358404: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.358408: dwc3_gadget_giveback: ep0out: req 36600525 length 4/4 ZsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.358415: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.358416: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.358421: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358479: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.358480: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.358484: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.358489: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358730: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.358731: dwc3_ctrl_req: Get String Descriptor(Index = 2, Length = 255)
     irq/170-dwc3-1240  [000] d...    85.358738: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 46 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.358744: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358753: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.358778: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.358780: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.358784: dwc3_gadget_giveback: ep0out: req 36600525 length 46/46 ZsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.358785: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.358786: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.358792: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358846: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.358847: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.358851: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.358857: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358920: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.358921: dwc3_ctrl_req: Get String Descriptor(Index = 1, Length = 255)
     irq/170-dwc3-1240  [000] d...    85.358928: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 66 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.358933: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.358942: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.358971: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.358972: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.358976: dwc3_gadget_giveback: ep0out: req 36600525 length 66/66 ZsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.358983: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.358984: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.358989: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.359045: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.359047: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.359050: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.359055: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.359396: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.359397: dwc3_ctrl_req: Set Configuration(Config = 1)
     irq/170-dwc3-1240  [000] d...    85.366188: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.366191: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.366197: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366238: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.366240: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.366244: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.366246: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.366251: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366285: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.366287: dwc3_ctrl_req: Get String Descriptor(Index = 5, Length = 255)
     irq/170-dwc3-1240  [000] d...    85.366294: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 34 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.366299: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366308: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.366328: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.366329: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.366334: dwc3_gadget_giveback: ep0out: req 36600525 length 34/34 ZsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.366335: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.366336: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.366341: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366414: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.366417: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.366421: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.366427: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366526: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.366529: dwc3_ctrl_req: Get String Descriptor(Index = 2, Length = 255)
     irq/170-dwc3-1240  [000] d...    85.366536: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 46 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.366542: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366550: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.366556: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.366557: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.366562: dwc3_gadget_giveback: ep0out: req 36600525 length 46/46 ZsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.366568: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.366569: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.366575: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366619: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.366621: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.366625: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.366630: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366681: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.366683: dwc3_ctrl_req: Get String Descriptor(Index = 1, Length = 255)
     irq/170-dwc3-1240  [000] d...    85.366690: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 66 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.366695: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366703: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.366721: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.366723: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.366727: dwc3_gadget_giveback: ep0out: req 36600525 length 66/66 ZsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.366734: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.366735: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.366741: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366798: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.366799: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.366803: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.366809: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366900: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.366902: dwc3_ctrl_req: a1 02 00 01 00 05 02 00
     irq/170-dwc3-1240  [000] d...    85.366909: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 2 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.366915: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.366923: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.366946: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.366948: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.366952: dwc3_gadget_giveback: ep0out: req 36600525 length 2/2 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.366958: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.366959: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.366965: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.367023: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.367025: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.367029: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.367034: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.367041: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.367042: dwc3_ctrl_req: a1 02 00 01 00 05 0e 00
     irq/170-dwc3-1240  [000] d...    85.367049: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 14 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.367054: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.367056: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.367084: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.367085: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.367089: dwc3_gadget_giveback: ep0out: req 36600525 length 14/14 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.367096: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.367097: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.367102: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.367160: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.367161: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.367165: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.367171: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.367643: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.367646: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 1)
     irq/170-dwc3-1240  [000] d...    85.367655: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Configuration' [401] params 00000802 04030600 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.367661: dwc3_gadget_ep_enable: ep1out: mps 256/1024 streams 15 burst 0 ring 0/0 flags E:swbp:>
     irq/170-dwc3-1240  [000] d...    85.367664: dwc3_alloc_request: ep1out: req f11a91c0 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.367667: dwc3_ep_queue: ep1out: req f11a91c0 length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.367668: dwc3_alloc_request: ep1out: req d9b92dec length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.367670: dwc3_ep_queue: ep1out: req d9b92dec length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.367677: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.367679: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.367684: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.367705: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.367707: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.367711: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.367712: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.367718: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.367772: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.367775: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1240  [000] d...    85.367782: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.367788: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.367796: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.367815: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.367816: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.367820: dwc3_gadget_giveback: ep0out: req 36600525 length 4/4 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.367827: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.367828: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.367833: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.367852: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.367853: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.367857: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.367863: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.368358: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.368361: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
     irq/170-dwc3-1240  [000] d...    85.368367: dwc3_ep_dequeue: ep1out: req f11a91c0 length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.368368: dwc3_gadget_giveback: ep1out: req f11a91c0 length 0/256 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.368371: dwc3_free_request: ep1out: req f11a91c0 length 0/256 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.368372: dwc3_ep_dequeue: ep1out: req d9b92dec length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.368373: dwc3_gadget_giveback: ep1out: req d9b92dec length 0/256 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.368374: dwc3_free_request: ep1out: req d9b92dec length 0/256 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.368377: dwc3_gadget_ep_disable: ep1out: mps 256/1024 streams 15 burst 0 ring 0/0 flags E:swbp:>
     irq/170-dwc3-1240  [000] d...    85.368380: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.368381: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.368387: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.368395: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.368396: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.368399: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.368401: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.368407: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.368477: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.368479: dwc3_ctrl_req: a1 02 00 01 00 06 02 00
     irq/170-dwc3-1240  [000] d...    85.368485: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 2 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.368491: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.368498: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.368521: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.368523: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.368527: dwc3_gadget_giveback: ep0out: req 36600525 length 2/2 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.368534: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.368535: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.368540: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.368564: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.368566: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.368569: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.368575: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.368637: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.368639: dwc3_ctrl_req: a1 02 00 01 00 06 0e 00
     irq/170-dwc3-1240  [000] d...    85.368645: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 14 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.368650: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.368658: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.368660: dwc3_event: event (000090c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.368684: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.368685: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.368689: dwc3_gadget_giveback: ep0out: req 36600525 length 14/14 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.368695: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.368697: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.368702: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.368718: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.368720: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.368723: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.368728: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.369303: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.369304: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1240  [000] d...    85.369312: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.369318: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.369320: dwc3_alloc_request: ep1in: req d9b92dec length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.369322: dwc3_ep_queue: ep1in: req d9b92dec length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.369324: dwc3_alloc_request: ep1in: req f11a91c0 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.369325: dwc3_ep_queue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.369329: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.369330: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.369335: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.369357: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.369358: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.369362: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.369364: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.369369: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.369385: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.369386: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1240  [000] d...    85.369392: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.369398: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.369400: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.369430: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.369431: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.369435: dwc3_gadget_giveback: ep0out: req 36600525 length 4/4 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.369443: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.369444: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.369449: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.369481: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.369482: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.369486: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.369491: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.369929: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.369931: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1240  [000] d...    85.369936: dwc3_ep_dequeue: ep1in: req d9b92dec length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.369937: dwc3_gadget_giveback: ep1in: req d9b92dec length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.369939: dwc3_free_request: ep1in: req d9b92dec length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.369940: dwc3_ep_dequeue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.369941: dwc3_gadget_giveback: ep1in: req f11a91c0 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.369943: dwc3_free_request: ep1in: req f11a91c0 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.369944: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.369953: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.369954: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.369959: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.369982: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.369983: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.369987: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.369988: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.369995: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.370215: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.370217: dwc3_ctrl_req: Get String Descriptor(Index = 12, Length = 255)
     irq/170-dwc3-1240  [000] d...    85.370223: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 36 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.370229: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.370236: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.370242: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.370244: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.370247: dwc3_gadget_giveback: ep0out: req 36600525 length 36/36 ZsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.370254: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.370255: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.370260: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.370293: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.370294: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.370298: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.370303: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.370343: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.370344: dwc3_ctrl_req: Get String Descriptor(Index = 14, Length = 255)
     irq/170-dwc3-1240  [000] d...    85.370350: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 34 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.370356: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.370364: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.370380: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.370381: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.370385: dwc3_gadget_giveback: ep0out: req 36600525 length 34/34 ZsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.370391: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.370392: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.370398: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.370424: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.370425: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.370429: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.370435: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.419112: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.419114: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1240  [000] d...    85.419122: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.419129: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.419131: dwc3_alloc_request: ep1in: req f11a91c0 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.419133: dwc3_ep_queue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.419134: dwc3_alloc_request: ep1in: req d9b92dec length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.419136: dwc3_ep_queue: ep1in: req d9b92dec length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.419138: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.419139: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.419145: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.419168: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.419169: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.419173: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.419175: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.419180: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.419187: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.419188: dwc3_ctrl_req: Get String Descriptor(Index = 15, Length = 255)
     irq/170-dwc3-1240  [000] d...    85.419194: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 30 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.419200: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.419209: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.419215: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.419216: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.419221: dwc3_gadget_giveback: ep0out: req 36600525 length 30/30 ZsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.419227: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.419228: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.419233: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.419250: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.419251: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.419255: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.419260: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.419318: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.419320: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1240  [000] d...    85.419326: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.419331: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.419340: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.419357: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.419358: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.419362: dwc3_gadget_giveback: ep0out: req 36600525 length 4/4 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.419368: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.419369: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.419375: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.419405: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.419406: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.419410: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.419416: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.422166: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.422168: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1240  [000] d...    85.422172: dwc3_ep_dequeue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.422174: dwc3_gadget_giveback: ep1in: req f11a91c0 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.422175: dwc3_free_request: ep1in: req f11a91c0 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.422177: dwc3_ep_dequeue: ep1in: req d9b92dec length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.422178: dwc3_gadget_giveback: ep1in: req d9b92dec length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.422179: dwc3_free_request: ep1in: req d9b92dec length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.422181: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.422185: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.422186: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.422192: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.422229: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.422231: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.422234: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.422236: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.422242: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.422990: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.422991: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1240  [000] d...    85.422999: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.423005: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.423007: dwc3_alloc_request: ep1in: req d9b92dec length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.423009: dwc3_ep_queue: ep1in: req d9b92dec length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.423010: dwc3_alloc_request: ep1in: req f11a91c0 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.423012: dwc3_ep_queue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.423014: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.423015: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.423020: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.423058: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.423059: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.423062: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.423064: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.423071: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.423129: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.423130: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1240  [000] d...    85.423137: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.423142: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.423150: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.423176: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.423177: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.423181: dwc3_gadget_giveback: ep0out: req 36600525 length 4/4 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.423188: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.423189: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.423194: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.423229: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.423231: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.423234: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.423240: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.423776: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.423777: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1240  [000] d...    85.423781: dwc3_ep_dequeue: ep1in: req d9b92dec length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.423783: dwc3_gadget_giveback: ep1in: req d9b92dec length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.423786: dwc3_free_request: ep1in: req d9b92dec length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.423787: dwc3_ep_dequeue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.423788: dwc3_gadget_giveback: ep1in: req f11a91c0 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.423790: dwc3_free_request: ep1in: req f11a91c0 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.423791: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.423794: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.423795: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.423800: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.423817: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.423818: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.423822: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.423824: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.423829: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.425024: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.425025: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 1)
     irq/170-dwc3-1240  [000] d...    85.425035: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Configuration' [401] params 00000802 04030600 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.425041: dwc3_gadget_ep_enable: ep1out: mps 256/1024 streams 15 burst 0 ring 0/0 flags E:swbp:>
     irq/170-dwc3-1240  [000] d...    85.425042: dwc3_alloc_request: ep1out: req f11a91c0 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.425044: dwc3_ep_queue: ep1out: req f11a91c0 length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.425047: dwc3_alloc_request: ep1out: req d9b92dec length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.425048: dwc3_ep_queue: ep1out: req d9b92dec length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.425050: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.425051: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.425057: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.425092: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.425093: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.425097: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.425098: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.425104: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.425111: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.425112: dwc3_ctrl_req: Get String Descriptor(Index = 13, Length = 255)
     irq/170-dwc3-1240  [000] d...    85.425118: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 32 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.425123: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.425126: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.425158: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.425159: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.425163: dwc3_gadget_giveback: ep0out: req 36600525 length 32/32 ZsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.425171: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.425172: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.425178: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.425232: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.425233: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.425237: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.425242: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.425303: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.425304: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1240  [000] d...    85.425310: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.425316: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.425323: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.425353: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.425354: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.425358: dwc3_gadget_giveback: ep0out: req 36600525 length 4/4 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.425366: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.425367: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.425373: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.425427: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.425429: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.425432: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.425438: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.426487: dwc3_event: event (2df800c4): ep1out: Transfer Not Ready [11768] (Not Active)
     irq/170-dwc3-1240  [000] d...    85.426491: dwc3_prepare_trb: ep1out: trb e01e6ac6 buf 00000000ac91c800 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1240  [000] d...    85.426494: dwc3_prepare_trb: ep1out: trb c8c4694d buf 00000000ac91c900 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1240  [000] d...    85.426501: dwc3_gadget_ep_cmd: ep1out: cmd 'Start Transfer' [2e000406] params 00000000 fe05d000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.426731: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.426732: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1240  [000] d...    85.426740: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.426746: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.426748: dwc3_alloc_request: ep1in: req ee75d6ac length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.426749: dwc3_ep_queue: ep1in: req ee75d6ac length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.426751: dwc3_alloc_request: ep1in: req c26c10a3 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.426752: dwc3_ep_queue: ep1in: req c26c10a3 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.426760: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.426761: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.426767: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.426802: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.426803: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.426807: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.426808: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.426814: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.426858: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.426860: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1240  [000] d...    85.426866: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.426871: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.426879: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.426895: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.426897: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.426901: dwc3_gadget_giveback: ep0out: req 36600525 length 4/4 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.426907: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.426908: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.426914: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.426943: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.426944: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.426948: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.426953: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.427404: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.427405: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1240  [000] d...    85.427410: dwc3_ep_dequeue: ep1in: req ee75d6ac length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.427411: dwc3_gadget_giveback: ep1in: req ee75d6ac length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.427413: dwc3_free_request: ep1in: req ee75d6ac length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.427414: dwc3_ep_dequeue: ep1in: req c26c10a3 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.427415: dwc3_gadget_giveback: ep1in: req c26c10a3 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.427416: dwc3_free_request: ep1in: req c26c10a3 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.427418: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.427421: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.427422: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.427428: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.427458: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.427459: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.427463: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.427465: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.427470: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.427477: dwc3_event: event (2e006084): ep1out: Transfer In Progress [11776] (SIm)
     irq/170-dwc3-1240  [000] d...    85.427479: dwc3_complete_trb: ep1out: trb e01e6ac6 buf 00000000ac91c800 size 1x 0 ctrl 0b800c68 (hlcS:SC:isoc-first)
     irq/170-dwc3-1240  [000] d...    85.427486: dwc3_gadget_giveback: ep1out: req f11a91c0 length 256/256 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.427488: dwc3_ep_queue: ep1out: req f11a91c0 length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.427490: dwc3_prepare_trb: ep1out: trb 88fcdc4e buf 00000000ac91c800 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1240  [000] d...    85.427496: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20407] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.428232: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.428233: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1240  [000] d...    85.428241: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.428247: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.428249: dwc3_alloc_request: ep1in: req c26c10a3 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.428250: dwc3_ep_queue: ep1in: req c26c10a3 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.428252: dwc3_alloc_request: ep1in: req ee75d6ac length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.428253: dwc3_ep_queue: ep1in: req ee75d6ac length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.428261: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.428262: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.428268: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.428294: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.428295: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.428298: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.428300: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.428305: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.428356: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.428358: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1240  [000] d...    85.428364: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.428369: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.428378: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.428384: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.428385: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.428390: dwc3_gadget_giveback: ep0out: req 36600525 length 4/4 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.428396: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.428397: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.428402: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.428437: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.428438: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.428442: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.428447: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.428484: dwc3_event: event (2e086084): ep1out: Transfer In Progress [11784] (SIm)
     irq/170-dwc3-1240  [000] d...    85.428486: dwc3_complete_trb: ep1out: trb c8c4694d buf 00000000ac91c900 size 1x 0 ctrl 0b820c68 (hlcS:SC:isoc-first)
     irq/170-dwc3-1240  [000] d...    85.428491: dwc3_gadget_giveback: ep1out: req d9b92dec length 256/256 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.428493: dwc3_ep_queue: ep1out: req d9b92dec length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.428495: dwc3_prepare_trb: ep1out: trb c7d5a344 buf 00000000ac91c900 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1240  [000] d...    85.428500: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20407] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.433973: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.433976: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
     irq/170-dwc3-1240  [000] d...    85.433981: dwc3_ep_dequeue: ep1out: req f11a91c0 length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.433985: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.434087: dwc3_free_request: ep1out: req f11a91c0 length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.434088: dwc3_ep_dequeue: ep1out: req d9b92dec length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.434091: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [d08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.434193: dwc3_free_request: ep1out: req d9b92dec length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.434194: dwc3_gadget_ep_disable: ep1out: mps 256/1024 streams 15 burst 0 ring 4/2 flags E:swBp:>
     irq/170-dwc3-1240  [000] d...    85.434197: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [c08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.434301: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.434302: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.434307: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.434315: dwc3_event: event (080201c4): ep1out: Endpoint Command Complete
     irq/170-dwc3-1240  [000] d...    85.434316: dwc3_event: event (080001c4): ep1out: Endpoint Command Complete
     irq/170-dwc3-1240  [000] d...    85.434338: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.434340: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.434343: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.434345: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.434351: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.434988: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.434991: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1240  [000] d...    85.434995: dwc3_ep_dequeue: ep1in: req c26c10a3 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.434997: dwc3_gadget_giveback: ep1in: req c26c10a3 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.435000: dwc3_free_request: ep1in: req c26c10a3 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.435001: dwc3_ep_dequeue: ep1in: req ee75d6ac length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.435002: dwc3_gadget_giveback: ep1in: req ee75d6ac length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.435004: dwc3_free_request: ep1in: req ee75d6ac length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.435005: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.435008: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.435009: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.435015: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.435032: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.435034: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.435037: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.435039: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.435044: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.441339: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.441341: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 1)
     irq/170-dwc3-1240  [000] d...    85.441350: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Configuration' [401] params 00000802 04030600 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.441356: dwc3_gadget_ep_enable: ep1out: mps 256/1024 streams 15 burst 0 ring 0/0 flags E:swbp:>
     irq/170-dwc3-1240  [000] d...    85.441358: dwc3_alloc_request: ep1out: req ee75d6ac length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.441359: dwc3_ep_queue: ep1out: req ee75d6ac length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.441361: dwc3_alloc_request: ep1out: req c26c10a3 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.441362: dwc3_ep_queue: ep1out: req c26c10a3 length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.441365: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.441366: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.441372: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.441389: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.441390: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.441394: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.441395: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.441401: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.441505: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.441506: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1240  [000] d...    85.441513: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.441518: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.441526: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.441552: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.441553: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.441557: dwc3_gadget_giveback: ep0out: req 36600525 length 4/4 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.441565: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.441566: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.441572: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.441604: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.441606: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.441609: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.441615: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.442485: dwc3_event: event (2e7800c4): ep1out: Transfer Not Ready [11896] (Not Active)
     irq/170-dwc3-1240  [000] d...    85.442490: dwc3_prepare_trb: ep1out: trb e01e6ac6 buf 00000000ac91c800 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1240  [000] d...    85.442494: dwc3_prepare_trb: ep1out: trb c8c4694d buf 00000000ac91c900 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1240  [000] d...    85.442500: dwc3_gadget_ep_cmd: ep1out: cmd 'Start Transfer' [2e800406] params 00000000 fe05d000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.442542: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.442543: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1240  [000] d...    85.442551: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.442557: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.442558: dwc3_alloc_request: ep1in: req d9b92dec length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.442560: dwc3_ep_queue: ep1in: req d9b92dec length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.442561: dwc3_alloc_request: ep1in: req f11a91c0 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.442563: dwc3_ep_queue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.442570: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.442571: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.442577: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.442612: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.442614: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.442617: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.442619: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.442624: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.442671: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.442672: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1240  [000] d...    85.442678: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.442684: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.442686: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.442693: dwc3_event: event (000090c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.442720: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.442721: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.442726: dwc3_gadget_giveback: ep0out: req 36600525 length 4/4 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.442734: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.442735: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.442740: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.442795: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.442796: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.442800: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.442805: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.443272: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.443274: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1240  [000] d...    85.443278: dwc3_ep_dequeue: ep1in: req d9b92dec length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.443279: dwc3_gadget_giveback: ep1in: req d9b92dec length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.443281: dwc3_free_request: ep1in: req d9b92dec length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.443282: dwc3_ep_dequeue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.443283: dwc3_gadget_giveback: ep1in: req f11a91c0 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.443285: dwc3_free_request: ep1in: req f11a91c0 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.443286: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.443294: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.443295: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.443301: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.443317: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.443318: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.443322: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.443323: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.443330: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.443490: dwc3_event: event (2e806084): ep1out: Transfer In Progress [11904] (SIm)
     irq/170-dwc3-1240  [000] d...    85.443491: dwc3_complete_trb: ep1out: trb e01e6ac6 buf 00000000ac91c800 size 1x 0 ctrl 0ba00c68 (hlcS:SC:isoc-first)
     irq/170-dwc3-1240  [000] d...    85.443496: dwc3_gadget_giveback: ep1out: req ee75d6ac length 256/256 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.443498: dwc3_ep_queue: ep1out: req ee75d6ac length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.443500: dwc3_prepare_trb: ep1out: trb 88fcdc4e buf 00000000ac91c800 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1240  [000] d...    85.443506: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20407] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.444061: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.444062: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1240  [000] d...    85.444070: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.444076: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.444077: dwc3_alloc_request: ep1in: req f11a91c0 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.444079: dwc3_ep_queue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.444081: dwc3_alloc_request: ep1in: req d9b92dec length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.444082: dwc3_ep_queue: ep1in: req d9b92dec length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.444090: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.444091: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.444096: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.444132: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.444133: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.444137: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.444138: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.444144: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.444210: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.444212: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1240  [000] d...    85.444218: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000ad6f1000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.444224: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.444232: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.444256: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1240  [000] d...    85.444258: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000ad6f1000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1240  [000] d...    85.444262: dwc3_gadget_giveback: ep0out: req 36600525 length 4/4 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.444268: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.444270: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.444275: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.444329: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.444331: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1240  [000] d...    85.444335: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.444340: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.449686: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.449688: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
     irq/170-dwc3-1240  [000] d...    85.449693: dwc3_ep_dequeue: ep1out: req ee75d6ac length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.449697: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.449799: dwc3_free_request: ep1out: req ee75d6ac length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.449800: dwc3_ep_dequeue: ep1out: req c26c10a3 length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.449803: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [d08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.449905: dwc3_free_request: ep1out: req c26c10a3 length 0/256 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.449906: dwc3_gadget_ep_disable: ep1out: mps 256/1024 streams 15 burst 0 ring 3/1 flags E:swBp:>
     irq/170-dwc3-1240  [000] d...    85.449909: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [c08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.450013: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.450013: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.450019: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.450026: dwc3_event: event (080201c4): ep1out: Endpoint Command Complete
     irq/170-dwc3-1240  [000] d...    85.450027: dwc3_event: event (080001c4): ep1out: Endpoint Command Complete
     irq/170-dwc3-1240  [000] d...    85.450043: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1240  [000] d...    85.450044: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1240  [000] d...    85.450047: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
     irq/170-dwc3-1240  [000] d...    85.450049: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1240  [000] d...    85.450055: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1240  [000] d...    85.450547: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1240  [000] d...    85.450550: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1240  [000] d...    85.450555: dwc3_ep_dequeue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.450556: dwc3_gadget_giveback: ep1in: req f11a91c0 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.450557: dwc3_free_request: ep1in: req f11a91c0 length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.450559: dwc3_ep_dequeue: ep1in: req d9b92dec length 0/192 zsI ==> -115
     irq/170-dwc3-1240  [000] d...    85.450560: dwc3_gadget_giveback: ep1in: req d9b92dec length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.450561: dwc3_free_request: ep1in: req d9b92dec length 0/192 zsI ==> -104
     irq/170-dwc3-1240  [000] d...    85.450562: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1240  [000] d...    85.450564: dwc3_gadget_giveback: ep1out: req ee75d6ac length 0/256 zsI ==> -108
     irq/170-dwc3-1240  [000] d...    85.450566: dwc3_gadget_giveback: ep1out: req c26c10a3 length 0/256 zsI ==> -108
     irq/170-dwc3-1240  [000] d...    85.450567: dwc3_gadget_giveback: : req d4301893 length 0/0 zsI ==> 0


-- 
cheers,
-roger
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
