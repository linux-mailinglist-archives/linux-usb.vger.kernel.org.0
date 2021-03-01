Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B277328EC4
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 20:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238235AbhCATgm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 14:36:42 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:48469 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241943AbhCATaA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Mar 2021 14:30:00 -0500
Received: by mail-io1-f71.google.com with SMTP id c4so14098540ioq.15
        for <linux-usb@vger.kernel.org>; Mon, 01 Mar 2021 11:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=kFWEKt9pSCwuiE4RBqk9Q3t0VLtXCghwAKkDLZCRrKw=;
        b=nMoDv/AzjFPa5QS5nZ7tWrnCXijuElyDbRIa4vmhHHuEpyRlKmvS21YLYjgo/xlEf8
         FwvhPavbYFWGBK8U+Guk6YdLEl4LTGVXJoDmVDAglD1yQt3iSA8R/BLMChF5GZnkPT96
         AVpLV8+Z8rKGF39IBuLh+09N4bBr7axmFr5uFtiMlb+siRcnz33YiE9FJjjKp9FUTez3
         nLV+2N1Bg/jzt/M+EUL3dPNsI0JD5yo8ek7Okn6aQOoPXCMjFM44a/V9d4r4tozWW4UG
         gUUVXom7v3BYcLybpcMR4yXd5ujaXP47ZpXDqNG55W9zlwR9yb46wcEEyMI8kAeeb+QD
         BAiw==
X-Gm-Message-State: AOAM5300lZndejx7RnMntwf7LyFsdnc2+PuXx4E9j/3RpSxU4a3wexjm
        jjakEYWJOHztCcjsk5iQeCmCWxUITTYpwBMhBLzCcfhX7Tsx
X-Google-Smtp-Source: ABdhPJw1E0rEfeCYPYoAZMH/zrpEDqnfe9tOxPi1uLqyw+Jeyxtw0bPtkzQ6/2fOQuc2D3X5UcNdcA/z60c5WZ4VAgL9aaUqNKra
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:54e:: with SMTP id i14mr14797711ils.136.1614626956949;
 Mon, 01 Mar 2021 11:29:16 -0800 (PST)
Date:   Mon, 01 Mar 2021 11:29:16 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000036bf3f05bc7ea28a@google.com>
Subject: memory leak in edge_startup
From:   syzbot <syzbot+59f777bdcbdd7eea5305@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    29c395c7 Merge tag 'x86-entry-2021-02-24' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10d694dad00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=66b7497b2c5acd67
dashboard link: https://syzkaller.appspot.com/bug?extid=59f777bdcbdd7eea5305
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=162940dad00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1650737ad00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+59f777bdcbdd7eea5305@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810dc5a800 (size 2048):
  comm "kworker/1:3", pid 4818, jiffies 4294960503 (age 15.050s)
  hex dump (first 32 bytes):
    20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ...............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000153c6b11>] kmalloc include/linux/slab.h:554 [inline]
    [<00000000153c6b11>] kzalloc include/linux/slab.h:684 [inline]
    [<00000000153c6b11>] edge_startup+0x3f/0x11f0 drivers/usb/serial/io_edgeport.c:2833
    [<000000007c25fa28>] usb_serial_probe.cold+0x6ab/0xb84 drivers/usb/serial/usb-serial.c:1027
    [<0000000050250e6f>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<00000000f10f144c>] really_probe+0x159/0x4a0 drivers/base/dd.c:554
    [<0000000036a9ab90>] driver_probe_device+0x84/0x100 drivers/base/dd.c:740
    [<00000000a08d4f3b>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:846
    [<000000009356c1ed>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000aa8a21fd>] __device_attach+0x122/0x250 drivers/base/dd.c:914
    [<00000000ee865ab7>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<000000005ea173b6>] device_add+0x5d5/0xc40 drivers/base/core.c:3242
    [<000000003faa2805>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<0000000099ff1454>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000a57fa7c3>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<00000000f10f144c>] really_probe+0x159/0x4a0 drivers/base/dd.c:554
    [<0000000036a9ab90>] driver_probe_device+0x84/0x100 drivers/base/dd.c:740
    [<00000000a08d4f3b>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:846

BUG: memory leak
unreferenced object 0xffff888110c17540 (size 192):
  comm "kworker/1:3", pid 4818, jiffies 4294960524 (age 14.840s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 58 75 c1 10 81 88 ff ff  ........Xu......
  backtrace:
    [<000000003178be4d>] kmalloc include/linux/slab.h:559 [inline]
    [<000000003178be4d>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<0000000006a81376>] edge_startup+0xd20/0x11f0 drivers/usb/serial/io_edgeport.c:2926
    [<000000007c25fa28>] usb_serial_probe.cold+0x6ab/0xb84 drivers/usb/serial/usb-serial.c:1027
    [<0000000050250e6f>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<00000000f10f144c>] really_probe+0x159/0x4a0 drivers/base/dd.c:554
    [<0000000036a9ab90>] driver_probe_device+0x84/0x100 drivers/base/dd.c:740
    [<00000000a08d4f3b>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:846
    [<000000009356c1ed>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000aa8a21fd>] __device_attach+0x122/0x250 drivers/base/dd.c:914
    [<00000000ee865ab7>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<000000005ea173b6>] device_add+0x5d5/0xc40 drivers/base/core.c:3242
    [<000000003faa2805>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<0000000099ff1454>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000a57fa7c3>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<00000000f10f144c>] really_probe+0x159/0x4a0 drivers/base/dd.c:554
    [<0000000036a9ab90>] driver_probe_device+0x84/0x100 drivers/base/dd.c:740

BUG: memory leak
unreferenced object 0xffff888110c17240 (size 192):
  comm "kworker/1:3", pid 4818, jiffies 4294960524 (age 14.840s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 58 72 c1 10 81 88 ff ff  ........Xr......
  backtrace:
    [<000000003178be4d>] kmalloc include/linux/slab.h:559 [inline]
    [<000000003178be4d>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<000000004f167a1a>] edge_startup+0xebf/0x11f0 drivers/usb/serial/io_edgeport.c:2963
    [<000000007c25fa28>] usb_serial_probe.cold+0x6ab/0xb84 drivers/usb/serial/usb-serial.c:1027
    [<0000000050250e6f>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<00000000f10f144c>] really_probe+0x159/0x4a0 drivers/base/dd.c:554
    [<0000000036a9ab90>] driver_probe_device+0x84/0x100 drivers/base/dd.c:740
    [<00000000a08d4f3b>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:846
    [<000000009356c1ed>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000aa8a21fd>] __device_attach+0x122/0x250 drivers/base/dd.c:914
    [<00000000ee865ab7>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<000000005ea173b6>] device_add+0x5d5/0xc40 drivers/base/core.c:3242
    [<000000003faa2805>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<0000000099ff1454>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000a57fa7c3>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<00000000f10f144c>] really_probe+0x159/0x4a0 drivers/base/dd.c:554
    [<0000000036a9ab90>] driver_probe_device+0x84/0x100 drivers/base/dd.c:740



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
