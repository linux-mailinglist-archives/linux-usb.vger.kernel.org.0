Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F78F17AC3B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 18:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbgCERTN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 12:19:13 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:54271 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgCERPL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 12:15:11 -0500
Received: by mail-il1-f199.google.com with SMTP id t11so5138816ill.20
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2020 09:15:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=TApa/K1UpIPJAFj/NkLQICS4FPsU50sEJCQmvi3wabw=;
        b=hfP501yJLrKldQVvlhxVmG5aoUyrCnF9yBj4h5agvaegEy0cFx4/agYF0M6UuCQWqF
         z/ybATN9AeiQbTdT7L0N5+tFuyHQAMduHVOo56z6/uAhL5kyo31qbKmosjVZ4u+XE33i
         ulr/7bBdzH93TIKjF+e0BwwOfbBxjhukZsX3nzpu898ksNA2WYuPK9YPsXb1tge2GmG8
         ZKMqa7pAynRwhVMe8hER+VvJTiCCRMXeIqMCHxbF+PefrT0UrcSgXarSt5dP4TFBrsPF
         kJY35JI7UCWfmD1GvexZeNn5k7gTNIXH2ABAOlmtkdaMQoagsK6Mh4aDmrb0WNKCp62T
         LYPA==
X-Gm-Message-State: ANhLgQ1C1shQ+dafISRaayi3uFWqLFaWQm8IDOxgjhGFJTqrYZOAPx9g
        rdbqmZYbSv+Pba4Un7h5K0y1+M0BTx5j0LaM5Ho/zZ5IFiff
X-Google-Smtp-Source: ADFU+vtjg8db37ytQ8seTPopABARXJlSV1kFMnfYyVCqeguR7BZ9p0EspGnptKV3HZMiMIyxOsBqlqy7Yk/5TCne9X1gpLZXtwAP
MIME-Version: 1.0
X-Received: by 2002:a92:8311:: with SMTP id f17mr9233809ild.82.1583428509286;
 Thu, 05 Mar 2020 09:15:09 -0800 (PST)
Date:   Thu, 05 Mar 2020 09:15:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d2c99705a01ead04@google.com>
Subject: WARNING in cxacru_cm/usb_submit_urb
From:   syzbot <syzbot+00c18ee8497dd3be6ade@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    d6ff8147 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=10c21731e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90a3d9bed5648419
dashboard link: https://syzkaller.appspot.com/bug?extid=00c18ee8497dd3be6ade
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16942bb5e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14b4aa2de00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+00c18ee8497dd3be6ade@syzkaller.appspotmail.com

usb 1-1: New USB device found, idVendor=0572, idProduct=cb00, bcdDevice=41.00
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
usb 1-1: string descriptor 0 read error: -71
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
WARNING: CPU: 0 PID: 102 at drivers/usb/core/urb.c:478 usb_submit_urb+0x1188/0x1460 drivers/usb/core/urb.c:478
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 102 Comm: kworker/0:2 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 panic+0x2aa/0x6e1 kernel/panic.c:221
 __warn.cold+0x2f/0x30 kernel/panic.c:582
 report_bug+0x27b/0x2f0 lib/bug.c:195
 fixup_bug arch/x86/kernel/traps.c:174 [inline]
 fixup_bug arch/x86/kernel/traps.c:169 [inline]
 do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:267
 do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
 invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
RIP: 0010:usb_submit_urb+0x1188/0x1460 drivers/usb/core/urb.c:478
Code: 4d 85 ed 74 46 e8 18 ce dd fd 4c 89 f7 e8 d0 5c 17 ff 41 89 d8 44 89 e1 4c 89 ea 48 89 c6 48 c7 c7 e0 e7 3b 86 e8 a0 5f b2 fd <0f> 0b e9 20 f4 ff ff e8 ec cd dd fd 0f 1f 44 00 00 e8 e2 cd dd fd
RSP: 0018:ffff8881d4f56fb8 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff812977dd RDI: ffffed103a9eade9
RBP: ffff8881d4fa9750 R08: ffff8881d6c14980 R09: ffffed103b646248
R10: ffffed103b646247 R11: ffff8881db23123f R12: 0000000000000001
R13: ffff8881cf17d948 R14: ffff8881c44cd0a0 R15: ffff8881d4fa9200
 cxacru_cm+0x3c2/0x8f0 drivers/usb/atm/cxacru.c:650
 cxacru_card_status+0x22/0xe0 drivers/usb/atm/cxacru.c:761
 cxacru_bind+0x7ab/0x119d drivers/usb/atm/cxacru.c:1213
 usbatm_usb_probe+0x2d7/0x1958 drivers/usb/atm/usbatm.c:1053
 cxacru_usb_probe+0xdf/0x1e0 drivers/usb/atm/cxacru.c:1367
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:374
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
 usb_generic_driver_probe+0x9d/0xe0 drivers/usb/core/generic.c:241
 usb_probe_device+0xd9/0x230 drivers/usb/core/driver.c:272
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2544
 hub_port_connect drivers/usb/core/hub.c:5191 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5331 [inline]
 port_event drivers/usb/core/hub.c:5477 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5559
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
