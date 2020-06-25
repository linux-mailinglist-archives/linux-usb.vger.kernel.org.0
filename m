Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5014020A0BD
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 16:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405309AbgFYOTA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 10:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404890AbgFYOS7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 10:18:59 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CECC08C5C1
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 07:18:58 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id i4so6177703iov.11
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 07:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=dwsEMTjh4AkNGvp2qoIt4h6xm7PWHPJTXExKo4DRdgw=;
        b=BSgZVkNdqH/xsK/oZNc9WV0oD9Ha94Zc33o+1xW2Ls0lRqmBKFavWRDQvtrQBD/hpe
         RGxB323ZBBG+JMSsg99mR7Q5MbLK99TTmLIShE7IFR491Vg4QjAbOWg7s1CV5mxQDuI8
         cO2a3rHdBgXzQPelKzJJuANCqwn2IhQvZG3fI9QuO4n9XBCOGzO3XtbBJsQkwxpluD9z
         74pp1ennYvoex5qzOWCvf2pQPqorZ3jHHZ/vUjsls6ojJ8EfJjLrjc0BxJoiDgog8NJ6
         T2VQRLJg2Odq7JVL530A1FNHnonaiDynXBO/nKqd8RuVId9BZ7UWH0pl5vqvb9tNx4T6
         M51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dwsEMTjh4AkNGvp2qoIt4h6xm7PWHPJTXExKo4DRdgw=;
        b=tGOJu0ZSYygqUHJ1WRal4zBlHYHBPvMI+O8LTtauV2CN80zTX+3J0JPPsudqrvpODL
         4as3OXT8nhGpTGSAgu4ETLLlJFMiMUV+E8CWSCyckC3JqmdD35DAWfJObHwYE4kXY7pF
         1izOdJmmuVqkkFHsNrsbFZfZEOcDddeXlRjO884c97IWUEoR8aZDtripHnqwr74QfWpq
         EjwJPWO+sxzjOOZkFewIBoBeR11rc03SANSABEutn3T2SZcgrVsGFQsmCmrmLF25v5ao
         rxPrUL8Xk1oMMO6cgH4aWvhyGdX7Eb5YA0wBM9GcnSdTt0Kbf6cEXME9OJWethwQ8IB4
         nTGg==
X-Gm-Message-State: AOAM530tn3DEkWTtKs3f7k2qcQ5oZtHccctPv1VjrL98bMLtg3HBhY3d
        5pP4/EfibqIj9Rpd+8p3VQJZK8O9rzSD+PAPUBFNNDqY
X-Google-Smtp-Source: ABdhPJzilj835AjbRSd0VX2u46a1/tpbqUc5QySW7GVMPxBmWIuZN3s36o7clADtaJ0qVwHdEBzNAVOtoDvo3limMLE=
X-Received: by 2002:a05:6602:2583:: with SMTP id p3mr38173876ioo.179.1593094737031;
 Thu, 25 Jun 2020 07:18:57 -0700 (PDT)
MIME-Version: 1.0
From:   Mark Deneen <mdeneen@gmail.com>
Date:   Thu, 25 Jun 2020 10:18:46 -0400
Message-ID: <CAP6JJ88avATE3w7HMn94wTti8GY7uncXKT=zLLRbVTz9xbXKVg@mail.gmail.com>
Subject: crash when cleaning up gadget configfs directory on sama5d2
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!  I can reliably produce an oops + reboot on sama5d2 when
attempting to remove a gadget configuration from configfs.

The stack trace follows:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1109 at
drivers/usb/gadget/function/u_serial.c:1184
gserial_free_port+0xe4/0xec
Modules linked in: can_raw can at91_sama5d2_adc
industrialio_triggered_buffer kfifo_buf gpio_sama5d2_piobu
industrialio m_can_platform m_can sdhci_of_at91 can_dev sdhci_pltfm
sdhci mmc_core ohci_at91 ohci_hcd ehci_atmel sch_fq_codel prox2_hal(O)
CPU: 0 PID: 1109 Comm: rmdir Tainted: G           O      5.7.6-prox2+ #1
Hardware name: Atmel SAMA5
[<c010c5a0>] (unwind_backtrace) from [<c0109ef4>] (show_stack+0x10/0x14)
[<c0109ef4>] (show_stack) from [<c012a4f8>] (__warn+0xbc/0xd4)
[<c012a4f8>] (__warn) from [<c012a574>] (warn_slowpath_fmt+0x64/0xc4)
[<c012a574>] (warn_slowpath_fmt) from [<c04c0f4c>] (gserial_free_port+0xe4/0xec)
[<c04c0f4c>] (gserial_free_port) from [<c04c0f94>] (gserial_free_line+0x40/0x74)
[<c04c0f94>] (gserial_free_line) from [<c04c0a8c>] (acm_free_instance+0x10/0x1c)
[<c04c0a8c>] (acm_free_instance) from [<c04b9f2c>]
(usb_put_function_instance+0x1c/0x28)
[<c04b9f2c>] (usb_put_function_instance) from [<c027f8b4>]
(config_item_put.part.0+0x90/0xb0)
[<c027f8b4>] (config_item_put.part.0) from [<c027e2bc>]
(configfs_rmdir+0x1b4/0x270)
[<c027e2bc>] (configfs_rmdir) from [<c0203560>] (vfs_rmdir+0x6c/0x1b4)
[<c0203560>] (vfs_rmdir) from [<c02077b8>] (do_rmdir+0x154/0x1bc)
[<c02077b8>] (do_rmdir) from [<c0100060>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xc118bfa8 to 0xc118bff0)
bfa0:                   bea1de4d bea1dd38 bea1de4d 00000001 00493a74 b6e770e8
bfc0: bea1de4d bea1dd38 00000000 00000028 0047c6d4 0047c2b0 00000000 00000000
bfe0: 00493b5c bea1db94 004509a3 b6e18858
---[ end trace db1d6cc2dc22fb43 ]---
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000004
pgd = 4b49c8b1
[00000004] *pgd=00000000
Internal error: Oops: 80000005 [#1] ARM
Modules linked in: can_raw can at91_sama5d2_adc
industrialio_triggered_buffer kfifo_buf gpio_sama5d2_piobu
industrialio m_can_platform m_can sdhci_of_at91 can_dev sdhci_pltfm
sdhci mmc_core ohci_at91 ohci_hcd ehci_atmel sch_fq_codel prox2_hal(O)
CPU: 0 PID: 1111 Comm: rmdir Tainted: G        W  O      5.7.6-prox2+ #1
Hardware name: Atmel SAMA5
PC is at 0x4
LR is at eth_stop+0x4c/0xa4
pc : [<00000004>]    lr : [<c04c2470>]    psr: 200f0093
sp : c1223de0  ip : 000003e8  fp : c78e3d40
r10: 00000000  r9 : c0899e04  r8 : 00000001
r7 : 00000001  r6 : a00f0013  r5 : c6014000  r4 : c62eb300
r3 : 00000004  r2 : c785f980  r1 : a00f0013  r0 : c62eb300
Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c53c7d  Table: 21224059  DAC: 00000051
Process rmdir (pid: 1111, stack limit = 0xbbf9cfde)
Stack: (0xc1223de0 to 0xc1224000)
3de0: c6014000 c1223e5c 00000000 00000001 00000001 c05515cc b3b5ffa3 c0204f00
3e00: 00000000 c6014000 00000000 c0d03208 c1223e68 c6014000 c1223e5c c05516cc
3e20: 00000000 c02020b8 00000000 c0d03208 c1223e68 c6014000 c1223ea4 c1223e5c
3e40: 00000001 c055256c c1223ea8 c7891c60 c1223e80 c7891c60 c789b850 c6014044
3e60: c6014044 c0211524 5e46c117 00000000 232aaf83 c0d03208 c6014000 00000000
3e80: c073f69c 00000000 00000000 c0d2da34 00000000 c05529f4 c788a2a8 c7891c60
3ea0: c789b850 c601403c c601403c c0d03208 232aaf83 c6014000 00000000 c0552a98
3ec0: c6014500 c04c2cd8 c785fa00 c04c3d2c 00000000 c04b9f2c c785fa00 c027f8b4
3ee0: 00000000 c785fa00 c7a9ed20 00000000 c789b850 c027e2bc 00000002 c0d03208
3f00: c788a2a8 c788a2a8 00000000 c79958c0 be84ce4c ffffff9c c1223f68 c1223f5c
3f20: c4b41000 c0203560 00000000 c0203244 00000001 00000000 c788a2a8 be84ce4c
3f40: ffffff9c c02077b8 c1223f68 c1223f5c c1223f7c c070b5c0 00000000 00000000
3f60: c6bacd90 c788ae58 13f1481e 00000008 c4b4103e 00100000 00000070 c0d03208
3f80: be84c6f0 be84ce4c be84cd38 00000000 00000028 c0100264 c1222000 00000028
3fa0: 00000000 c0100060 be84ce4c be84cd38 be84ce4c 00000001 004e9a74 b6f6d0e8
3fc0: be84ce4c be84cd38 00000000 00000028 004d26d4 004d22b0 00000000 00000000
3fe0: 004e9b5c be84cb94 004a69a3 b6f0e858 600f0030 be84ce4c 00000000 00000000
[<c04c2470>] (eth_stop) from [<c05515cc>] (__dev_close_many+0xac/0x12c)
[<c05515cc>] (__dev_close_many) from [<c05516cc>] (dev_close_many+0x80/0x118)
[<c05516cc>] (dev_close_many) from [<c055256c>]
(rollback_registered_many+0x114/0x504)
[<c055256c>] (rollback_registered_many) from [<c05529f4>]
(unregister_netdevice_queue+0x98/0x124)
[<c05529f4>] (unregister_netdevice_queue) from [<c0552a98>]
(unregister_netdev+0x18/0x20)
[<c0552a98>] (unregister_netdev) from [<c04c2cd8>] (gether_cleanup+0x14/0x28)
[<c04c2cd8>] (gether_cleanup) from [<c04c3d2c>] (ecm_free_inst+0x20/0x3c)
[<c04c3d2c>] (ecm_free_inst) from [<c04b9f2c>]
(usb_put_function_instance+0x1c/0x28)
[<c04b9f2c>] (usb_put_function_instance) from [<c027f8b4>]
(config_item_put.part.0+0x90/0xb0)
[<c027f8b4>] (config_item_put.part.0) from [<c027e2bc>]
(configfs_rmdir+0x1b4/0x270)
[<c027e2bc>] (configfs_rmdir) from [<c0203560>] (vfs_rmdir+0x6c/0x1b4)
[<c0203560>] (vfs_rmdir) from [<c02077b8>] (do_rmdir+0x154/0x1bc)
[<c02077b8>] (do_rmdir) from [<c0100060>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xc1223fa8 to 0xc1223ff0)
3fa0:                   be84ce4c be84cd38 be84ce4c 00000001 004e9a74 b6f6d0e8
3fc0: be84ce4c be84cd38 00000000 00000028 004d26d4 004d22b0 00000000 00000000
3fe0: 004e9b5c be84cb94 004a69a3 b6f0e858
Code: bad PC value
---[ end trace db1d6cc2dc22fb44 ]---

The tainted flag is set, but it has nothing to do with the oops.  I
can produce another trace with the module unloaded if needed to remove
the flag.

The oops occurs when I do the following:

rmdir /sys/kernel/config/usb_gadget/prox2/functions/ecm.usb0

I have been able to reproduce on kernels ranging from 4.4.x to 5.7.6.

This is the script that I am using to start / stop the gadget device:

#!/bin/sh

grep -q configfs /proc/mounts ||  mount -t configfs none /sys/kernel/config

case "$1" in
        "start" )
                if [ -e /sys/kernel/config/usb_gadget/prox2 ]; then
                        exit 0
                fi
                mkdir -p /sys/kernel/config/usb_gadget/prox2
                echo 0x0004 > /sys/kernel/config/usb_gadget/prox2/idVendor
                echo 0xF00D > /sys/kernel/config/usb_gadget/prox2/idProduct

                mkdir -p /sys/kernel/config/usb_gadget/prox2/strings/0x409
                echo "Internet Widgets, LTD" >
/sys/kernel/config/usb_gadget/prox2/strings/0x409/manufacturer
                echo nano-cv >
/sys/kernel/config/usb_gadget/prox2/strings/0x409/product
                mkdir -p /sys/kernel/config/usb_gadget/prox2/functions/acm.GS0
                mkdir -p /sys/kernel/config/usb_gadget/prox2/functions/ecm.usb0

                mkdir -p /sys/kernel/config/usb_gadget/prox2/configs/
                mkdir -p /sys/kernel/config/usb_gadget/prox2/configs/c.1
                mkdir -p
/sys/kernel/config/usb_gadget/prox2/configs/c.1/strings/0x409
                echo "CDC ACM+ECM" >
/sys/kernel/config/usb_gadget/prox2/configs/c.1/strings/0x409/configuration
                ln -s
/sys/kernel/config/usb_gadget/prox2/functions/acm.GS0
/sys/kernel/config/usb_gadget/prox2/configs/c.1/
                ln -s
/sys/kernel/config/usb_gadget/prox2/functions/ecm.usb0
/sys/kernel/config/usb_gadget/prox2/configs/c.1/
                echo 300000.gadget > /sys/kernel/config/usb_gadget/prox2/UDC
                ;;
        "stop" )
                if [ -e /sys/kernel/config/usb_gadget/prox2/UDC ]; then
                        echo > /sys/kernel/config/usb_gadget/prox2/UDC
2>/dev/null
                        rm -f
/sys/kernel/config/usb_gadget/prox2/configs/c.1/acm.GS0
/sys/kernel/config/usb_gadget/prox2/configs/c.1/ecm.usb0
                        rmdir
/sys/kernel/config/usb_gadget/prox2/configs/c.1/strings/0x409
2>/dev/null
                        rmdir
/sys/kernel/config/usb_gadget/prox2/configs/c.1 2>/dev/null
                        rmdir
/sys/kernel/config/usb_gadget/prox2/configs 2>/dev/null
                        rmdir
/sys/kernel/config/usb_gadget/prox2/functions/acm.GS0 2>/dev/null
                        rmdir
/sys/kernel/config/usb_gadget/prox2/functions/ecm.usb0 2>/dev/null
                        rmdir
/sys/kernel/config/usb_gadget/prox2/strings/0x409 2>/dev/null
                        rmdir /sys/kernel/config/usb_gadget/prox2 2>/dev/null
                fi
        ;;
        * )
                echo "Usage: gadget [start | stop]"
                exit 255
                ;;
esac
exit 0

Am I doing something incorrectly? What can I do to debug this further?

All the best,
Mark Deneen
