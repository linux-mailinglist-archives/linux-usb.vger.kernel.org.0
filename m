Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1AF38E307
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 11:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbhEXJN5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 05:13:57 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:42838 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbhEXJNy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 May 2021 05:13:54 -0400
Received: by mail-il1-f198.google.com with SMTP id d17-20020a9236110000b02901cf25fcfdcdso1432452ila.9
        for <linux-usb@vger.kernel.org>; Mon, 24 May 2021 02:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=GdTdHL+KOqNvXgIJuSUdMeBeXmXHAEdVzZubUmSeKOY=;
        b=X7GCJJr8sbY6rh7E/ARB1/ot8SLaRZqAnwL1gUPivccvapNDjXtZC2IOJ38/BfCd+S
         9vTtJir6aybHS+BP1IhQRlId658YqZV9VNmaGVJ05+D3MjPMhK+hc4ARK4wP1qBVeY0o
         5PsV84ypwomBG8mkbUiriC8MDKJlQjYNUqlIm1Y21DQV79tMlvxOUulcGdcDbGyENtEG
         oQlQzkQ6GO7bJUFEDURnJTthtqndGgZvSa4fo/lJDQpz6sOzYzbyjIgt5+RMDSrkuWVH
         4dj+8B4cCYPokjzJOfwzhnLy/d990pTC4bz2l/D0SNe/EdtQXD/9mSq1bFgCuZroHMga
         uZsA==
X-Gm-Message-State: AOAM530eMFICc6zDtED5zVqxHutGXt6a9UQ+feYVUYj8qwPnZPjCi3kN
        QDKpFfnG8nXnShapYC7zZv8l0RT3biAWkTkVSu1RiYEiVF9U
X-Google-Smtp-Source: ABdhPJzQ2nFNgotgVNBJm+iY42p8Zc/RBLk1WYDt33iJ8AYr/RQzL7GZl4Co4ETMgFwaTexg0CkQ6eDHIRkvUAuHgPYpdXZldHUh
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d15:: with SMTP id i21mr15549466ila.2.1621847546108;
 Mon, 24 May 2021 02:12:26 -0700 (PDT)
Date:   Mon, 24 May 2021 02:12:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dda06805c30fce63@google.com>
Subject: [syzbot] memory leak in smsc75xx_bind
From:   syzbot <syzbot+b558506ba8165425fee2@syzkaller.appspotmail.com>
To:     davem@davemloft.net, kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        steve.glendinning@shawell.net, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    6ebb6814 Merge tag 'perf-urgent-2021-05-23' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1334afc7d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ae7b129a135ab06b
dashboard link: https://syzkaller.appspot.com/bug?extid=b558506ba8165425fee2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ca4a35d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b558506ba8165425fee2@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888118ddde40 (size 192):
  comm "kworker/1:2", pid 1931, jiffies 4295045866 (age 18.790s)
  hex dump (first 32 bytes):
    40 39 e7 18 81 88 ff ff 00 00 00 00 00 00 00 00  @9..............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff84245b62>] kmalloc include/linux/slab.h:556 [inline]
    [<ffffffff84245b62>] kzalloc include/linux/slab.h:686 [inline]
    [<ffffffff84245b62>] smsc75xx_bind+0x7a/0x334 drivers/net/usb/smsc75xx.c:1460
    [<ffffffff82b5b2e6>] usbnet_probe+0x3b6/0xc30 drivers/net/usb/usbnet.c:1728
    [<ffffffff82be65e7>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<ffffffff82624159>] really_probe+0x159/0x500 drivers/base/dd.c:576
    [<ffffffff8262458b>] driver_probe_device+0x8b/0x100 drivers/base/dd.c:763
    [<ffffffff82624cb6>] __device_attach_driver+0xf6/0x120 drivers/base/dd.c:870
    [<ffffffff82621047>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<ffffffff82624832>] __device_attach+0x122/0x260 drivers/base/dd.c:938
    [<ffffffff82622ce6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<ffffffff8261f105>] device_add+0x5d5/0xd70 drivers/base/core.c:3320
    [<ffffffff82be3b89>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<ffffffff82bf3f0c>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<ffffffff82be5d4c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<ffffffff82624159>] really_probe+0x159/0x500 drivers/base/dd.c:576
    [<ffffffff8262458b>] driver_probe_device+0x8b/0x100 drivers/base/dd.c:763
    [<ffffffff82624cb6>] __device_attach_driver+0xf6/0x120 drivers/base/dd.c:870

BUG: memory leak
unreferenced object 0xffff888113abcf00 (size 192):
  comm "kworker/1:1", pid 8586, jiffies 4295046670 (age 10.750s)
  hex dump (first 32 bytes):
    40 69 0c 13 81 88 ff ff 00 00 00 00 00 00 00 00  @i..............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff84245b62>] kmalloc include/linux/slab.h:556 [inline]
    [<ffffffff84245b62>] kzalloc include/linux/slab.h:686 [inline]
    [<ffffffff84245b62>] smsc75xx_bind+0x7a/0x334 drivers/net/usb/smsc75xx.c:1460
    [<ffffffff82b5b2e6>] usbnet_probe+0x3b6/0xc30 drivers/net/usb/usbnet.c:1728
    [<ffffffff82be65e7>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<ffffffff82624159>] really_probe+0x159/0x500 drivers/base/dd.c:576
    [<ffffffff8262458b>] driver_probe_device+0x8b/0x100 drivers/base/dd.c:763
    [<ffffffff82624cb6>] __device_attach_driver+0xf6/0x120 drivers/base/dd.c:870
    [<ffffffff82621047>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<ffffffff82624832>] __device_attach+0x122/0x260 drivers/base/dd.c:938
    [<ffffffff82622ce6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<ffffffff8261f105>] device_add+0x5d5/0xd70 drivers/base/core.c:3320
    [<ffffffff82be3b89>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<ffffffff82bf3f0c>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<ffffffff82be5d4c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<ffffffff82624159>] really_probe+0x159/0x500 drivers/base/dd.c:576
    [<ffffffff8262458b>] driver_probe_device+0x8b/0x100 drivers/base/dd.c:763
    [<ffffffff82624cb6>] __device_attach_driver+0xf6/0x120 drivers/base/dd.c:870

BUG: memory leak
unreferenced object 0xffff888118ee1900 (size 192):
  comm "kworker/0:0", pid 8419, jiffies 4295046919 (age 8.260s)
  hex dump (first 32 bytes):
    40 49 0a 19 81 88 ff ff 00 00 00 00 00 00 00 00  @I..............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff84245b62>] kmalloc include/linux/slab.h:556 [inline]
    [<ffffffff84245b62>] kzalloc include/linux/slab.h:686 [inline]
    [<ffffffff84245b62>] smsc75xx_bind+0x7a/0x334 drivers/net/usb/smsc75xx.c:1460
    [<ffffffff82b5b2e6>] usbnet_probe+0x3b6/0xc30 drivers/net/usb/usbnet.c:1728
    [<ffffffff82be65e7>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<ffffffff82624159>] really_probe+0x159/0x500 drivers/base/dd.c:576
    [<ffffffff8262458b>] driver_probe_device+0x8b/0x100 drivers/base/dd.c:763
    [<ffffffff82624cb6>] __device_attach_driver+0xf6/0x120 drivers/base/dd.c:870
    [<ffffffff82621047>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<ffffffff82624832>] __device_attach+0x122/0x260 drivers/base/dd.c:938
    [<ffffffff82622ce6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<ffffffff8261f105>] device_add+0x5d5/0xd70 drivers/base/core.c:3320
    [<ffffffff82be3b89>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<ffffffff82bf3f0c>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<ffffffff82be5d4c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<ffffffff82624159>] really_probe+0x159/0x500 drivers/base/dd.c:576
    [<ffffffff8262458b>] driver_probe_device+0x8b/0x100 drivers/base/dd.c:763
    [<ffffffff82624cb6>] __device_attach_driver+0xf6/0x120 drivers/base/dd.c:870



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
