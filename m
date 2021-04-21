Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D50366EDD
	for <lists+linux-usb@lfdr.de>; Wed, 21 Apr 2021 17:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243749AbhDUPMz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Apr 2021 11:12:55 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:46069 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240463AbhDUPMx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Apr 2021 11:12:53 -0400
Received: by mail-io1-f71.google.com with SMTP id y15-20020a5d9b0f0000b02903e840cb5f09so15330669ion.12
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 08:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=R3uYg2uJLiGS0r/f+irqbv2XMxfvS8kMSZjyQAHZ0hE=;
        b=kxowNoz9q5mO70X8DMxz0qVnBi61/e9EYabufk5BDi3hkvu/TB4/8E+qVyo/t9IptK
         c1tkO4hhREyvXAwuo5fE9EgWPfHtIL8QgSLFvJTTI/cML9lqjol7zN1D3/fzb47xz0ST
         3s0xcNZDrMdyDzfW/DP2/mNonIDbf72mqK8HjG/5+EukNmwA8bdar6QT8+7EEbWBFMFX
         AjFLHIalNpi2/Y2EnsvhO/Uyc/yzWxpxiV44b1Ngcs5YMxq9l9GMuhTGla2eZ/zxlotF
         h8WEqmgA84nTo090d7gBLHziJeDT6v/OdZzhBjsIxiPGKF7u8oCnf2TzKyuM1hL3RkGx
         v9iw==
X-Gm-Message-State: AOAM532jF8D6FsV5keo7tj+WT+On7ppzM6kqZLx/uUrU2lOe2pED2kh8
        Cv2c17Glk5Q1K0rwu+gDN3zk0dhyMcrlVMlXlnFPWk6xZ6K5
X-Google-Smtp-Source: ABdhPJwqS9K1zJy+X/XA3qerCkv6kgVyL/4Y/YHCpVzWPqdYg+2W+FEHZU+qV2nrUopa19x+Sd7iaZ+EFeY0tMAyBzrHYNouCMlH
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aaa:: with SMTP id l10mr26736498ilv.29.1619017938422;
 Wed, 21 Apr 2021 08:12:18 -0700 (PDT)
Date:   Wed, 21 Apr 2021 08:12:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001ad5d605c07cfd2e@google.com>
Subject: [syzbot] memory leak in usb_set_configuration (2)
From:   syzbot <syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mathias.nyman@linux.intel.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    9cdbf646 Merge tag 'io_uring-5.12-2021-04-16' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=136ce5a6d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd35e661e44323ea
dashboard link: https://syzkaller.appspot.com/bug?extid=d1e69c888f0d3866ead4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16ecba29d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143cf955d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881120e1400 (size 1024):
  comm "kworker/0:2", pid 3660, jiffies 4294952380 (age 24.950s)
  hex dump (first 32 bytes):
    c8 78 3c 12 81 88 ff ff c8 78 3c 12 81 88 ff ff  .x<......x<.....
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff82ba5d37>] kmalloc include/linux/slab.h:554 [inline]
    [<ffffffff82ba5d37>] kzalloc include/linux/slab.h:684 [inline]
    [<ffffffff82ba5d37>] usb_set_configuration+0x187/0xb90 drivers/usb/core/message.c:1992
    [<ffffffff82bb69ec>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<ffffffff82ba874c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<ffffffff825f67f9>] really_probe+0x159/0x4a0 drivers/base/dd.c:559
    [<ffffffff825f6bc4>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
    [<ffffffff825f72de>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:851
    [<ffffffff825f3747>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<ffffffff825f6e72>] __device_attach+0x122/0x250 drivers/base/dd.c:919
    [<ffffffff825f53e6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<ffffffff825f1935>] device_add+0x5d5/0xc40 drivers/base/core.c:3242
    [<ffffffff841df2d9>] usb_new_device.cold+0x16a/0x582 drivers/usb/core/hub.c:2555
    [<ffffffff82b9b24e>] hub_port_connect drivers/usb/core/hub.c:5223 [inline]
    [<ffffffff82b9b24e>] hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
    [<ffffffff82b9b24e>] port_event drivers/usb/core/hub.c:5509 [inline]
    [<ffffffff82b9b24e>] hub_event+0x142e/0x20c0 drivers/usb/core/hub.c:5591
    [<ffffffff81259619>] process_one_work+0x2c9/0x600 kernel/workqueue.c:2275
    [<ffffffff81259f09>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2421
    [<ffffffff81261638>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<ffffffff8100227f>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

BUG: memory leak
unreferenced object 0xffff888110a217a0 (size 32):
  comm "kworker/0:2", pid 3660, jiffies 4294952380 (age 24.950s)
  hex dump (first 32 bytes):
    31 2d 31 3a 30 2e 32 34 31 00 00 00 00 00 00 00  1-1:0.241.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8223411c>] kvasprintf+0x6c/0xf0 lib/kasprintf.c:25
    [<ffffffff822341f8>] kvasprintf_const+0x58/0x110 lib/kasprintf.c:49
    [<ffffffff822f402b>] kobject_set_name_vargs+0x3b/0xe0 lib/kobject.c:289
    [<ffffffff825ec413>] dev_set_name+0x63/0x90 drivers/base/core.c:3028
    [<ffffffff82ba6269>] usb_set_configuration+0x6b9/0xb90 drivers/usb/core/message.c:2099
    [<ffffffff82bb69ec>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<ffffffff82ba874c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<ffffffff825f67f9>] really_probe+0x159/0x4a0 drivers/base/dd.c:559
    [<ffffffff825f6bc4>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
    [<ffffffff825f72de>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:851
    [<ffffffff825f3747>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<ffffffff825f6e72>] __device_attach+0x122/0x250 drivers/base/dd.c:919
    [<ffffffff825f53e6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<ffffffff825f1935>] device_add+0x5d5/0xc40 drivers/base/core.c:3242
    [<ffffffff841df2d9>] usb_new_device.cold+0x16a/0x582 drivers/usb/core/hub.c:2555
    [<ffffffff82b9b24e>] hub_port_connect drivers/usb/core/hub.c:5223 [inline]
    [<ffffffff82b9b24e>] hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
    [<ffffffff82b9b24e>] port_event drivers/usb/core/hub.c:5509 [inline]
    [<ffffffff82b9b24e>] hub_event+0x142e/0x20c0 drivers/usb/core/hub.c:5591

BUG: memory leak
unreferenced object 0xffff88810c472800 (size 256):
  comm "kworker/0:2", pid 3660, jiffies 4294952409 (age 24.660s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 08 28 47 0c 81 88 ff ff  .........(G.....
    08 28 47 0c 81 88 ff ff b0 c4 5e 82 ff ff ff ff  .(G.......^.....
  backtrace:
    [<ffffffff825f1b71>] kmalloc include/linux/slab.h:554 [inline]
    [<ffffffff825f1b71>] kzalloc include/linux/slab.h:684 [inline]
    [<ffffffff825f1b71>] device_private_init drivers/base/core.c:3084 [inline]
    [<ffffffff825f1b71>] device_add+0x811/0xc40 drivers/base/core.c:3134
    [<ffffffff82ba6589>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<ffffffff82bb69ec>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<ffffffff82ba874c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<ffffffff825f67f9>] really_probe+0x159/0x4a0 drivers/base/dd.c:559
    [<ffffffff825f6bc4>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
    [<ffffffff825f72de>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:851
    [<ffffffff825f3747>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<ffffffff825f6e72>] __device_attach+0x122/0x250 drivers/base/dd.c:919
    [<ffffffff825f53e6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<ffffffff825f1935>] device_add+0x5d5/0xc40 drivers/base/core.c:3242
    [<ffffffff841df2d9>] usb_new_device.cold+0x16a/0x582 drivers/usb/core/hub.c:2555
    [<ffffffff82b9b24e>] hub_port_connect drivers/usb/core/hub.c:5223 [inline]
    [<ffffffff82b9b24e>] hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
    [<ffffffff82b9b24e>] port_event drivers/usb/core/hub.c:5509 [inline]
    [<ffffffff82b9b24e>] hub_event+0x142e/0x20c0 drivers/usb/core/hub.c:5591
    [<ffffffff81259619>] process_one_work+0x2c9/0x600 kernel/workqueue.c:2275
    [<ffffffff81259f09>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2421
    [<ffffffff81261638>] kthread+0x178/0x1b0 kernel/kthread.c:292

[  176.


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
