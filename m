Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD1B14D3DC5
	for <lists+linux-usb@lfdr.de>; Thu, 10 Mar 2022 00:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbiCIXz1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Mar 2022 18:55:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbiCIXz0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Mar 2022 18:55:26 -0500
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E1812223A
        for <linux-usb@vger.kernel.org>; Wed,  9 Mar 2022 15:54:25 -0800 (PST)
Received: by mail-io1-f72.google.com with SMTP id g16-20020a05660203d000b005f7b3b0642eso2723464iov.16
        for <linux-usb@vger.kernel.org>; Wed, 09 Mar 2022 15:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=FZKkfb+B9Ye8SW4sgOk+aViFCG1Zd9t6idiFkhiqLKA=;
        b=szZCnoiRlIVgvNb1QzHdS5cyJ9cuwDMcU6Q1VkMxlPvQERNKiQEYGMKWRdEfICdwLk
         s5hKcjoQBUbGTK5EWuRzDW1qDhnhkvR5SY8k8ZroJzyEsNUwetjgkHNz20Gtx5Yo9vfW
         geE6NTUKAzKNquUMa8TdKEuLWssyK839gFXTKGa66WqwWLva4ZJva0Qy2pqo1C0lFPTL
         fNhtePDgsKjLGXucAvNRyNBg6KpKOhkC5msE09TXwafQ8A9orvrjtMcqSiG3s70lM9w2
         p5n2R7iYMhZKH5RiGHZmYX3tTjUWNIX6o/ZvoC3i3iWXvKeZqw4rDcau9FKd3s/UKRzN
         KJyw==
X-Gm-Message-State: AOAM531erihUwtgGCl0WR7P5fY+YGU4ONiN4WlfyhgJHkFMYwi8lgfIx
        A4jf26ZzNcAJ/U96AtoNjs2gfX30QAq1jDWc2kOxnVvPdEwy
X-Google-Smtp-Source: ABdhPJyVHy/khyyLSyf05JTis72no6NvtkZogjvY6QKKugmN/bv16pOOktXDBrhtnfxHZvR7dvaajtm3yJlsPwJXk3Ttq0pln574
MIME-Version: 1.0
X-Received: by 2002:a92:7513:0:b0:2b9:5b61:e376 with SMTP id
 q19-20020a927513000000b002b95b61e376mr1558659ilc.193.1646870064861; Wed, 09
 Mar 2022 15:54:24 -0800 (PST)
Date:   Wed, 09 Mar 2022 15:54:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000351b8605d9d1d1bf@google.com>
Subject: [syzbot] memory leak in usb_get_configuration
From:   syzbot <syzbot+f0fae482604e6d9a87c9@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, pavel.hofman@ivitera.com,
        rob@robgreener.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    0014404f9c18 Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15864216700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f0a704147ec8e32
dashboard link: https://syzkaller.appspot.com/bug?extid=f0fae482604e6d9a87c9
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13a63dbe700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10e150a1700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f0fae482604e6d9a87c9@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810c0289e0 (size 32):
  comm "kworker/1:2", pid 139, jiffies 4294947862 (age 15.910s)
  hex dump (first 32 bytes):
    09 02 12 00 01 00 00 00 00 09 04 00 00 00 d0 bb  ................
    3a 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  :...............
  backtrace:
    [<ffffffff82c98127>] kmalloc include/linux/slab.h:586 [inline]
    [<ffffffff82c98127>] usb_get_configuration+0x1c7/0x1cd0 drivers/usb/core/config.c:919
    [<ffffffff82c863f9>] usb_enumerate_device drivers/usb/core/hub.c:2398 [inline]
    [<ffffffff82c863f9>] usb_new_device+0x1a9/0x2e0 drivers/usb/core/hub.c:2536
    [<ffffffff82c88ea4>] hub_port_connect drivers/usb/core/hub.c:5358 [inline]
    [<ffffffff82c88ea4>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
    [<ffffffff82c88ea4>] port_event drivers/usb/core/hub.c:5660 [inline]
    [<ffffffff82c88ea4>] hub_event+0x1364/0x21a0 drivers/usb/core/hub.c:5742
    [<ffffffff8126a41f>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
    [<ffffffff8126ad49>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
    [<ffffffff81274705>] kthread+0x125/0x160 kernel/kthread.c:377
    [<ffffffff810021ef>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

BUG: memory leak
unreferenced object 0xffff88810a600f40 (size 64):
  comm "kworker/1:2", pid 139, jiffies 4294947866 (age 15.870s)
  hex dump (first 32 bytes):
    01 00 00 00 01 00 00 00 09 04 00 00 00 d0 bb 3a  ...............:
    00 00 00 00 00 00 00 00 f2 89 02 0c 81 88 ff ff  ................
  backtrace:
    [<ffffffff82c9871d>] kmalloc include/linux/slab.h:586 [inline]
    [<ffffffff82c9871d>] kzalloc include/linux/slab.h:714 [inline]
    [<ffffffff82c9871d>] usb_parse_configuration drivers/usb/core/config.c:772 [inline]
    [<ffffffff82c9871d>] usb_get_configuration+0x7bd/0x1cd0 drivers/usb/core/config.c:944
    [<ffffffff82c863f9>] usb_enumerate_device drivers/usb/core/hub.c:2398 [inline]
    [<ffffffff82c863f9>] usb_new_device+0x1a9/0x2e0 drivers/usb/core/hub.c:2536
    [<ffffffff82c88ea4>] hub_port_connect drivers/usb/core/hub.c:5358 [inline]
    [<ffffffff82c88ea4>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
    [<ffffffff82c88ea4>] port_event drivers/usb/core/hub.c:5660 [inline]
    [<ffffffff82c88ea4>] hub_event+0x1364/0x21a0 drivers/usb/core/hub.c:5742
    [<ffffffff8126a41f>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
    [<ffffffff8126ad49>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
    [<ffffffff81274705>] kthread+0x125/0x160 kernel/kthread.c:377
    [<ffffffff810021ef>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
