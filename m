Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4CC485830
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jan 2022 19:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242910AbiAES2e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jan 2022 13:28:34 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:44990 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242898AbiAES2c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jan 2022 13:28:32 -0500
Received: by mail-io1-f69.google.com with SMTP id i188-20020a6b3bc5000000b00601decb6241so69453ioa.11
        for <linux-usb@vger.kernel.org>; Wed, 05 Jan 2022 10:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=qEDyEO7auNfBv5VOJ633PotzfERAc6GE4GN4Wp+cyOo=;
        b=eckmjTEZ9wXCNJtMTSi/YShH48DsofPhPdTPydWDZ2UuKq4Vx6+1DeYeXMWrbWVcGB
         4s4EsULrGsZYZimdemgIXIGhBCt1SJqUSUlcIU8UdIEJPgmzRXKsfAsUzHLRPPqULOHs
         1KLMLnpubs1C8NaOThoQLK649sOP/NGjYVkemUHTWmKbpfsJyMA/ndGMySZRTfsfSdE8
         Q7/cqfdcQz068Cc88eUJWM7we7/Y+6M0nPNXW8kRrckVBSfkRKyjk56Bi3RFk4SKEYGx
         vLSP53X8SYe89s2lD2Abkgg+uZsSD3G9tZoPpWY8lkhE9tVvO43tJi+s8xf3+Qu9VRmH
         Qyow==
X-Gm-Message-State: AOAM530BID5zOf0jK0GpzP+fAnFHU3pfDh9yKAiHSfErQjiPj4PfUzPV
        Jn8ENhsODHiY9aGnpuuQ4jfVbRzpm+t5x0oOtgJBOZv6zRLn
X-Google-Smtp-Source: ABdhPJyzrAGNM7VABsncvEgdFoW+7TeC5pHYdKUqPOhOQS/6CEusiD5XOd8J40/DdLg6ZSL+4iTjd/gpVuzzf2LFbg0FYqB3DpbC
MIME-Version: 1.0
X-Received: by 2002:a05:6602:13c9:: with SMTP id o9mr25848620iov.40.1641407311667;
 Wed, 05 Jan 2022 10:28:31 -0800 (PST)
Date:   Wed, 05 Jan 2022 10:28:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000be665505d4d9ebd6@google.com>
Subject: [syzbot] KMSAN: kernel-usb-infoleak in usbnet_write_cmd (3)
From:   syzbot <syzbot+003c0a286b9af5412510@syzkaller.appspotmail.com>
To:     glider@google.com, gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    81c325bbf94e kmsan: hooks: do not check memory in kmsan_in..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=14a07163b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2d8b9a11641dc9aa
dashboard link: https://syzkaller.appspot.com/bug?extid=003c0a286b9af5412510
compiler:       clang version 14.0.0 (/usr/local/google/src/llvm-git-monorepo 2b554920f11c8b763cd9ed9003f4e19b919b8e1f), GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=100165dbb00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10c97e77b00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+003c0a286b9af5412510@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: config 0 descriptor??
=====================================================
BUG: KMSAN: kernel-usb-infoleak in usb_submit_urb+0x6c1/0x2aa0 drivers/usb/core/urb.c:430
 usb_submit_urb+0x6c1/0x2aa0 drivers/usb/core/urb.c:430
 usb_start_wait_urb+0x153/0x4b0 drivers/usb/core/message.c:58
 usb_internal_control_msg drivers/usb/core/message.c:102 [inline]
 usb_control_msg+0x487/0x7c0 drivers/usb/core/message.c:153
 __usbnet_write_cmd drivers/net/usb/usbnet.c:2050 [inline]
 usbnet_write_cmd+0x3d3/0x480 drivers/net/usb/usbnet.c:2088
 mcs7830_set_reg drivers/net/usb/mcs7830.c:117 [inline]
 mcs7830_hif_set_mac_address drivers/net/usb/mcs7830.c:138 [inline]
 mcs7830_apply_base_config+0xd5/0x8a0 drivers/net/usb/mcs7830.c:387
 mcs7830_bind+0x753/0xb70 drivers/net/usb/mcs7830.c:492
 usbnet_probe+0x1284/0x4140 drivers/net/usb/usbnet.c:1747
 usb_probe_interface+0xf19/0x1600 drivers/usb/core/driver.c:396
 really_probe+0x67d/0x1510 drivers/base/dd.c:596
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:751
 driver_probe_device drivers/base/dd.c:781 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:898
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:969
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1016
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1d3e/0x2400 drivers/base/core.c:3394
 usb_set_configuration+0x37e9/0x3ed0 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0x13c/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x309/0x570 drivers/usb/core/driver.c:293
 really_probe+0x67d/0x1510 drivers/base/dd.c:596
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:751
 driver_probe_device drivers/base/dd.c:781 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:898
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:969
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1016
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1d3e/0x2400 drivers/base/core.c:3394
 usb_new_device+0x1b8e/0x2950 drivers/usb/core/hub.c:2563
 hub_port_connect drivers/usb/core/hub.c:5353 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
 port_event drivers/usb/core/hub.c:5643 [inline]
 hub_event+0x5ad2/0x8910 drivers/usb/core/hub.c:5725
 process_one_work+0xdb9/0x1820 kernel/workqueue.c:2298
 worker_thread+0x10bc/0x21f0 kernel/workqueue.c:2445
 kthread+0x721/0x850 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30

Uninit was stored to memory at:
 kmemdup+0x107/0x140 mm/util.c:130
 __usbnet_write_cmd drivers/net/usb/usbnet.c:2039 [inline]
 usbnet_write_cmd+0x1a0/0x480 drivers/net/usb/usbnet.c:2088
 mcs7830_set_reg drivers/net/usb/mcs7830.c:117 [inline]
 mcs7830_hif_set_mac_address drivers/net/usb/mcs7830.c:138 [inline]
 mcs7830_apply_base_config+0xd5/0x8a0 drivers/net/usb/mcs7830.c:387
 mcs7830_bind+0x753/0xb70 drivers/net/usb/mcs7830.c:492
 usbnet_probe+0x1284/0x4140 drivers/net/usb/usbnet.c:1747
 usb_probe_interface+0xf19/0x1600 drivers/usb/core/driver.c:396
 really_probe+0x67d/0x1510 drivers/base/dd.c:596
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:751
 driver_probe_device drivers/base/dd.c:781 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:898
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:969
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1016
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1d3e/0x2400 drivers/base/core.c:3394
 usb_set_configuration+0x37e9/0x3ed0 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0x13c/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x309/0x570 drivers/usb/core/driver.c:293
 really_probe+0x67d/0x1510 drivers/base/dd.c:596
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:751
 driver_probe_device drivers/base/dd.c:781 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:898
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:969
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1016
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1d3e/0x2400 drivers/base/core.c:3394
 usb_new_device+0x1b8e/0x2950 drivers/usb/core/hub.c:2563
 hub_port_connect drivers/usb/core/hub.c:5353 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
 port_event drivers/usb/core/hub.c:5643 [inline]
 hub_event+0x5ad2/0x8910 drivers/usb/core/hub.c:5725
 process_one_work+0xdb9/0x1820 kernel/workqueue.c:2298
 worker_thread+0x10bc/0x21f0 kernel/workqueue.c:2445
 kthread+0x721/0x850 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30

Uninit was stored to memory at:
 __dev_addr_set include/linux/netdevice.h:4655 [inline]
 eth_hw_addr_set include/linux/etherdevice.h:319 [inline]
 mcs7830_bind+0x230/0xb70 drivers/net/usb/mcs7830.c:488
 usbnet_probe+0x1284/0x4140 drivers/net/usb/usbnet.c:1747
 usb_probe_interface+0xf19/0x1600 drivers/usb/core/driver.c:396
 really_probe+0x67d/0x1510 drivers/base/dd.c:596
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:751
 driver_probe_device drivers/base/dd.c:781 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:898
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:969
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1016
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1d3e/0x2400 drivers/base/core.c:3394
 usb_set_configuration+0x37e9/0x3ed0 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0x13c/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x309/0x570 drivers/usb/core/driver.c:293
 really_probe+0x67d/0x1510 drivers/base/dd.c:596
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:751
 driver_probe_device drivers/base/dd.c:781 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:898
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:969
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1016
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1d3e/0x2400 drivers/base/core.c:3394
 usb_new_device+0x1b8e/0x2950 drivers/usb/core/hub.c:2563
 hub_port_connect drivers/usb/core/hub.c:5353 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
 port_event drivers/usb/core/hub.c:5643 [inline]
 hub_event+0x5ad2/0x8910 drivers/usb/core/hub.c:5725
 process_one_work+0xdb9/0x1820 kernel/workqueue.c:2298
 worker_thread+0x10bc/0x21f0 kernel/workqueue.c:2445
 kthread+0x721/0x850 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30

Local variable addr created at:
 mcs7830_bind+0x9b/0xb70 drivers/net/usb/mcs7830.c:476
 usbnet_probe+0x1284/0x4140 drivers/net/usb/usbnet.c:1747

Bytes 0-3 of 6 are uninitialized
Memory access of size 6 starts at ffff88811d26f2b0

CPU: 1 PID: 19 Comm: kworker/1:0 Not tainted 5.16.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
