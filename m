Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCFFAF334A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 16:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388718AbfKGPeO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 10:34:14 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:49733 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388230AbfKGPeL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 10:34:11 -0500
Received: by mail-io1-f69.google.com with SMTP id x1so2107675ior.16
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 07:34:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=osDgrR7+lhnA50ozJ9XpSP5eOLnLOIc3AVbZc33gEAU=;
        b=KK9Dvv0SkWlFAvCbRP1PX5TBU7x3y+mofK7Vt72/3sEvY9HQ/UANITs1CBJ/PAaAR1
         xJBRlNGfjQj89msVRADLZHLN6MAQ20jQOp2FkM3tkS8ZPHMeJPY3/B5A/CKAztC7GyXY
         e3pX+LFDe53vLicetjrIPquqDimXickj+y+PNtX2Ss73uVJsHvBk91pc+Sa8Luf+dD3Z
         /tgQbNt0Aw4FzUlKdL3HndyFkhtkiRQ6DnNZk4KgT8TDNiIaLz+Qstn6PerKWRnaW6hl
         glRXVJAt0Myy7avL4p0ngzGH+la6xkc+DC+Ajg97BK/Y5TpnuAAg0yTvQhFFz0vx+v/C
         Pmyg==
X-Gm-Message-State: APjAAAX4eb/0+iMUGgoJFkA7H/sAEv8JcoHQV/4YdYfMFnhYyN9hwgvX
        aF/dSU27RJ2y0wWYVIpTukUqsVEFY971lM2cB1V36PMMOwQy
X-Google-Smtp-Source: APXvYqxuKrKOoebLn1vTcIFUPCuUSPVp9E0atQGaXraOKl+d8s9V7HDrPJCcKrN1GZYrnnQAAGkbtkYezQ7fGdeYdocRoz/f6OQE
MIME-Version: 1.0
X-Received: by 2002:a5e:8219:: with SMTP id l25mr115557iom.292.1573140849022;
 Thu, 07 Nov 2019 07:34:09 -0800 (PST)
Date:   Thu, 07 Nov 2019 07:34:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007ce1f40596c3651f@google.com>
Subject: KASAN: slab-out-of-bounds Read in build_audio_procunit (2)
From:   syzbot <syzbot+622d4ecb979f45c6a775@syzkaller.appspotmail.com>
To:     allison@lohutok.net, alsa-devel@alsa-project.org,
        andreyknvl@google.com, benquike@gmail.com,
        dan.carpenter@oracle.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        perex@perex.cz, rfontana@redhat.com,
        syzkaller-bugs@googlegroups.com, tiwai@suse.com, wang6495@umn.edu,
        yuehaibing@huawei.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    d60bbfea usb: raw: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=132e5bcce00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
dashboard link: https://syzkaller.appspot.com/bug?extid=622d4ecb979f45c6a775
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1478c6b4e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=117cbf8ae00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+622d4ecb979f45c6a775@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: 0:2 : does not exist
==================================================================
BUG: KASAN: slab-out-of-bounds in uac_extension_unit_iExtension  
include/uapi/linux/usb/audio.h:483 [inline]
BUG: KASAN: slab-out-of-bounds in build_audio_procunit+0xeab/0x13f0  
sound/usb/mixer.c:2434
Read of size 1 at addr ffff8881d4aaa735 by task kworker/1:2/83

CPU: 1 PID: 83 Comm: kworker/1:2 Not tainted 5.4.0-rc6+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:634
  uac_extension_unit_iExtension include/uapi/linux/usb/audio.h:483 [inline]
  build_audio_procunit+0xeab/0x13f0 sound/usb/mixer.c:2434
  parse_audio_extension_unit sound/usb/mixer.c:2483 [inline]
  parse_audio_unit+0x1812/0x36f0 sound/usb/mixer.c:2761
  snd_usb_mixer_controls+0x715/0xb90 sound/usb/mixer.c:3095
  snd_usb_create_mixer+0x2b5/0x1890 sound/usb/mixer.c:3445
  usb_audio_probe+0xc76/0x2010 sound/usb/card.c:653
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2202
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2202
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2537
  hub_port_connect drivers/usb/core/hub.c:5184 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
  port_event drivers/usb/core/hub.c:5470 [inline]
  hub_event+0x1df8/0x3800 drivers/usb/core/hub.c:5552
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 83:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
  kmalloc include/linux/slab.h:561 [inline]
  usb_get_configuration+0x311/0x3100 drivers/usb/core/config.c:862
  usb_enumerate_device drivers/usb/core/hub.c:2370 [inline]
  usb_new_device+0xd3/0x160 drivers/usb/core/hub.c:2506
  hub_port_connect drivers/usb/core/hub.c:5184 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
  port_event drivers/usb/core/hub.c:5470 [inline]
  hub_event+0x1df8/0x3800 drivers/usb/core/hub.c:5552
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 211:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  kasan_set_free_info mm/kasan/common.c:332 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
  slab_free_hook mm/slub.c:1424 [inline]
  slab_free_freelist_hook mm/slub.c:1475 [inline]
  slab_free mm/slub.c:3025 [inline]
  kfree+0xe4/0x320 mm/slub.c:3977
  do_new_mount fs/namespace.c:2827 [inline]
  do_mount+0x68a/0x1bf0 fs/namespace.c:3143
  ksys_mount+0xd7/0x150 fs/namespace.c:3352
  __do_sys_mount fs/namespace.c:3366 [inline]
  __se_sys_mount fs/namespace.c:3363 [inline]
  __x64_sys_mount+0xba/0x150 fs/namespace.c:3363
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881d4aaa600
  which belongs to the cache kmalloc-256 of size 256
The buggy address is located 53 bytes to the right of
  256-byte region [ffff8881d4aaa600, ffff8881d4aaa700)
The buggy address belongs to the page:
page:ffffea000752aa80 refcount:1 mapcount:0 mapping:ffff8881da002780  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 ffffea000752c900 0000000a0000000a ffff8881da002780
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d4aaa600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8881d4aaa680: 00 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc
> ffff8881d4aaa700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                      ^
  ffff8881d4aaa780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8881d4aaa800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
