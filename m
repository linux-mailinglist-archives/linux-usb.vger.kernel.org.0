Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA9A4B2E51
	for <lists+linux-usb@lfdr.de>; Fri, 11 Feb 2022 21:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346939AbiBKUR3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Feb 2022 15:17:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241049AbiBKUR2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Feb 2022 15:17:28 -0500
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D55CF9
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 12:17:27 -0800 (PST)
Received: by mail-io1-f71.google.com with SMTP id y4-20020a056602200400b006101b618529so7106215iod.19
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 12:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Xz1I+Xbcjqae8KA5fHK4lIyHe9puGRVstIsWlkTfrRs=;
        b=fPNZcuS3ZYoFLWY1VOzPRQPUONihfl1WHNKSKQPIBbgOQXeDiQscUxbl8bBYrL605c
         ra3gfgh0wFO0uV2wjIazriVxSOGK4v9k8PYVD8NSXyLQ+xuoUa0/LcR7Cxt3snAAPifR
         McnVefNaC6qZPNWhGxhGdjg7vE5Qvbhj3Zj5VugA8arMo3nWxaUGDXcF1z6b4y8c+5Yh
         WSzD4Yz8Q610sFQYQHmQIHMoW9wsRPjiqQjG7OOJLEKcVM/78ROR220OwLrrj7R+3ugJ
         vge2dTMjV6GMnrRM0U4OPdNu2884rzXakb5zLKIJ9PwyBPH6uzh4/ApdMeo41ytFesSA
         tzEQ==
X-Gm-Message-State: AOAM531lSzI0mvs+fupaKp+Wnr4k9S/qFu6QyPYAHjEA20WYySui7IV4
        JzE+vtbGizUJ4PVnhC4FyFvlz/2j0T4AFokIFCopf31QidlH
X-Google-Smtp-Source: ABdhPJwMw2Vqqid+0jG6nPmh+IC1qUUWXUyJR37yGE12sb0XQlZSlAZQ74KXxZFhgyE/KWnUJoUfbzywKoCguWZ8ReI+j5oIkThr
MIME-Version: 1.0
X-Received: by 2002:a92:c681:: with SMTP id o1mr1838769ilg.72.1644610646222;
 Fri, 11 Feb 2022 12:17:26 -0800 (PST)
Date:   Fri, 11 Feb 2022 12:17:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005cacef05d7c3c10d@google.com>
Subject: [syzbot] memory leak in hub_event (3)
From:   syzbot <syzbot+8caaaec4e7a55d75e243@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        noralf@tronnes.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    dfd42facf1e4 Linux 5.17-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14b4ef7c700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=48b71604a367da6e
dashboard link: https://syzkaller.appspot.com/bug?extid=8caaaec4e7a55d75e243
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1396902c700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1466e662700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8caaaec4e7a55d75e243@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810d49e800 (size 2048):
  comm "kworker/1:1", pid 25, jiffies 4294954629 (age 16.460s)
  hex dump (first 32 bytes):
    ff ff ff ff 31 00 00 00 00 00 00 00 00 00 00 00  ....1...........
    00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00  ................
  backtrace:
    [<ffffffff82c87a62>] kmalloc include/linux/slab.h:581 [inline]
    [<ffffffff82c87a62>] kzalloc include/linux/slab.h:715 [inline]
    [<ffffffff82c87a62>] usb_alloc_dev+0x32/0x450 drivers/usb/core/usb.c:582
    [<ffffffff82c91a47>] hub_port_connect drivers/usb/core/hub.c:5260 [inline]
    [<ffffffff82c91a47>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
    [<ffffffff82c91a47>] port_event drivers/usb/core/hub.c:5660 [inline]
    [<ffffffff82c91a47>] hub_event+0x1097/0x21a0 drivers/usb/core/hub.c:5742
    [<ffffffff8126c3ef>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
    [<ffffffff8126ccd9>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
    [<ffffffff81276765>] kthread+0x125/0x160 kernel/kthread.c:377
    [<ffffffff810022ff>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

BUG: memory leak
unreferenced object 0xffff88810f5bd660 (size 32):
  comm "kworker/1:1", pid 25, jiffies 4294954629 (age 16.460s)
  hex dump (first 32 bytes):
    31 2d 31 00 00 00 00 00 00 00 00 00 00 00 00 00  1-1.............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff822cae8c>] kvasprintf+0x6c/0xf0 lib/kasprintf.c:25
    [<ffffffff822caf68>] kvasprintf_const+0x58/0x110 lib/kasprintf.c:49
    [<ffffffff823c074b>] kobject_set_name_vargs+0x3b/0xe0 lib/kobject.c:289
    [<ffffffff826ae353>] dev_set_name+0x63/0x90 drivers/base/core.c:3193
    [<ffffffff82c87c20>] usb_alloc_dev+0x1f0/0x450 drivers/usb/core/usb.c:650
    [<ffffffff82c91a47>] hub_port_connect drivers/usb/core/hub.c:5260 [inline]
    [<ffffffff82c91a47>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
    [<ffffffff82c91a47>] port_event drivers/usb/core/hub.c:5660 [inline]
    [<ffffffff82c91a47>] hub_event+0x1097/0x21a0 drivers/usb/core/hub.c:5742
    [<ffffffff8126c3ef>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
    [<ffffffff8126ccd9>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
    [<ffffffff81276765>] kthread+0x125/0x160 kernel/kthread.c:377
    [<ffffffff810022ff>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

BUG: memory leak
unreferenced object 0xffff888109944200 (size 256):
  comm "kworker/1:1", pid 25, jiffies 4294954683 (age 15.920s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 08 42 94 09 81 88 ff ff  .........B......
    08 42 94 09 81 88 ff ff f0 e3 6a 82 ff ff ff ff  .B........j.....
  backtrace:
    [<ffffffff826b3d9b>] kmalloc include/linux/slab.h:581 [inline]
    [<ffffffff826b3d9b>] kzalloc include/linux/slab.h:715 [inline]
    [<ffffffff826b3d9b>] device_private_init drivers/base/core.c:3249 [inline]
    [<ffffffff826b3d9b>] device_add+0x89b/0xdf0 drivers/base/core.c:3299
    [<ffffffff8439de0c>] usb_new_device.cold+0x10f/0x58e drivers/usb/core/hub.c:2566
    [<ffffffff82c91d14>] hub_port_connect drivers/usb/core/hub.c:5358 [inline]
    [<ffffffff82c91d14>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
    [<ffffffff82c91d14>] port_event drivers/usb/core/hub.c:5660 [inline]
    [<ffffffff82c91d14>] hub_event+0x1364/0x21a0 drivers/usb/core/hub.c:5742
    [<ffffffff8126c3ef>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
    [<ffffffff8126ccd9>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
    [<ffffffff81276765>] kthread+0x125/0x160 kernel/kthread.c:377
    [<ffffffff810022ff>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
