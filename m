Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF9A2ADE37
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 19:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731260AbgKJSZT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 13:25:19 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:44771 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgKJSZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Nov 2020 13:25:19 -0500
Received: by mail-io1-f72.google.com with SMTP id f2so6653544ion.11
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2020 10:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=TXO+2A0GRnZizAfhKjCrCYfOZAWglOyhJBANsYg+Qvc=;
        b=bI+W+wxWEnnczyFkGy85G5VCGBAqm/+UDxZt0hy7lhY7HUG+dfOtM+KLJPTVxaSuxG
         XjdQjycddiRrX4+GFS7jIrNwdBBY714yR2vEQVVIEdqOdLQNk8soFg/gvhjD7xQkm5PG
         NCe/XTKnhDi5+AWmh7cswxd8ZMehDZByZxux7zlAekoehpvxBhccecfkIeYE7yoPGKar
         ZPMoNiipeVRKGICrLAo9zIcplfNEGtdRsXBvXwW3DcUTfLMK35vK/EHO6pRUwFuqlbNt
         vRlvkCvtpWGNmr59EphoxaCyJ8JYW9yg/8fFybPuWrX484KqbPOAPi8hJD6JxB5wYUm0
         hR0A==
X-Gm-Message-State: AOAM532kfT0lzczJLqzCyifYkvhYolAnmaRUf3h/41HBaHzZjBgYj/aA
        SvGJi0ZtCmmHkBtfmNjFb0euOObOwcNDCia7q15UrF9oZFgy
X-Google-Smtp-Source: ABdhPJwOHCB5GIUsMAjuGWZhIROaeRgS5LavfkwflgWhakL1m4qFtjBI3qpAhgnHK0rtN3vyMX/l36L3iy0g6HpmuV4fwW9qY9W5
MIME-Version: 1.0
X-Received: by 2002:a6b:e911:: with SMTP id u17mr15144787iof.200.1605032718053;
 Tue, 10 Nov 2020 10:25:18 -0800 (PST)
Date:   Tue, 10 Nov 2020 10:25:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000335e105b3c4cd69@google.com>
Subject: memory leak in ath9k_hif_usb_firmware_cb
From:   syzbot <syzbot+6692c72009680f7c4eb2@syzkaller.appspotmail.com>
To:     eli.billauer@gmail.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    407ab579 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=134dd026500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3f13716fa0212fd
dashboard link: https://syzkaller.appspot.com/bug?extid=6692c72009680f7c4eb2
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=163be156500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1775d04e500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6692c72009680f7c4eb2@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888109b4dc00 (size 192):
  comm "kworker/1:2", pid 3705, jiffies 4294941906 (age 14.110s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 18 dc b4 09 81 88 ff ff  ................
  backtrace:
    [<000000006422299c>] kmalloc include/linux/slab.h:557 [inline]
    [<000000006422299c>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<000000007744b258>] ath9k_hif_usb_alloc_tx_urbs drivers/net/wireless/ath/ath9k/hif_usb.c:829 [inline]
    [<000000007744b258>] ath9k_hif_usb_alloc_urbs+0x148/0x640 drivers/net/wireless/ath/ath9k/hif_usb.c:1008
    [<000000006c8e4116>] ath9k_hif_usb_dev_init drivers/net/wireless/ath/ath9k/hif_usb.c:1102 [inline]
    [<000000006c8e4116>] ath9k_hif_usb_firmware_cb+0x88/0x1f0 drivers/net/wireless/ath/ath9k/hif_usb.c:1235
    [<00000000e5c70763>] request_firmware_work_func+0x47/0x90 drivers/base/firmware_loader/main.c:1079
    [<0000000089bbfbae>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<00000000d58def96>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<000000001b9033f3>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<000000001b3150ee>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff88810efed240 (size 192):
  comm "kworker/1:2", pid 3705, jiffies 4294941906 (age 14.110s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 58 d2 fe 0e 81 88 ff ff  ........X.......
  backtrace:
    [<000000006422299c>] kmalloc include/linux/slab.h:557 [inline]
    [<000000006422299c>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<000000007744b258>] ath9k_hif_usb_alloc_tx_urbs drivers/net/wireless/ath/ath9k/hif_usb.c:829 [inline]
    [<000000007744b258>] ath9k_hif_usb_alloc_urbs+0x148/0x640 drivers/net/wireless/ath/ath9k/hif_usb.c:1008
    [<000000006c8e4116>] ath9k_hif_usb_dev_init drivers/net/wireless/ath/ath9k/hif_usb.c:1102 [inline]
    [<000000006c8e4116>] ath9k_hif_usb_firmware_cb+0x88/0x1f0 drivers/net/wireless/ath/ath9k/hif_usb.c:1235
    [<00000000e5c70763>] request_firmware_work_func+0x47/0x90 drivers/base/firmware_loader/main.c:1079
    [<0000000089bbfbae>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<00000000d58def96>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<000000001b9033f3>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<000000001b3150ee>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff88810efedb40 (size 192):
  comm "kworker/1:2", pid 3705, jiffies 4294941906 (age 14.110s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 58 db fe 0e 81 88 ff ff  ........X.......
  backtrace:
    [<000000006422299c>] kmalloc include/linux/slab.h:557 [inline]
    [<000000006422299c>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<000000007744b258>] ath9k_hif_usb_alloc_tx_urbs drivers/net/wireless/ath/ath9k/hif_usb.c:829 [inline]
    [<000000007744b258>] ath9k_hif_usb_alloc_urbs+0x148/0x640 drivers/net/wireless/ath/ath9k/hif_usb.c:1008
    [<000000006c8e4116>] ath9k_hif_usb_dev_init drivers/net/wireless/ath/ath9k/hif_usb.c:1102 [inline]
    [<000000006c8e4116>] ath9k_hif_usb_firmware_cb+0x88/0x1f0 drivers/net/wireless/ath/ath9k/hif_usb.c:1235
    [<00000000e5c70763>] request_firmware_work_func+0x47/0x90 drivers/base/firmware_loader/main.c:1079
    [<0000000089bbfbae>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<00000000d58def96>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<000000001b9033f3>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<000000001b3150ee>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff88810efedf00 (size 192):
  comm "kworker/1:2", pid 3705, jiffies 4294941906 (age 14.110s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 18 df fe 0e 81 88 ff ff  ................
  backtrace:
    [<000000006422299c>] kmalloc include/linux/slab.h:557 [inline]
    [<000000006422299c>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<000000007744b258>] ath9k_hif_usb_alloc_tx_urbs drivers/net/wireless/ath/ath9k/hif_usb.c:829 [inline]
    [<000000007744b258>] ath9k_hif_usb_alloc_urbs+0x148/0x640 drivers/net/wireless/ath/ath9k/hif_usb.c:1008
    [<000000006c8e4116>] ath9k_hif_usb_dev_init drivers/net/wireless/ath/ath9k/hif_usb.c:1102 [inline]
    [<000000006c8e4116>] ath9k_hif_usb_firmware_cb+0x88/0x1f0 drivers/net/wireless/ath/ath9k/hif_usb.c:1235
    [<00000000e5c70763>] request_firmware_work_func+0x47/0x90 drivers/base/firmware_loader/main.c:1079
    [<0000000089bbfbae>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<00000000d58def96>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<000000001b9033f3>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<000000001b3150ee>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff88810efedc00 (size 192):
  comm "kworker/1:2", pid 3705, jiffies 4294941906 (age 14.110s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 18 dc fe 0e 81 88 ff ff  ................
  backtrace:
    [<000000006422299c>] kmalloc include/linux/slab.h:557 [inline]
    [<000000006422299c>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<000000007744b258>] ath9k_hif_usb_alloc_tx_urbs drivers/net/wireless/ath/ath9k/hif_usb.c:829 [inline]
    [<000000007744b258>] ath9k_hif_usb_alloc_urbs+0x148/0x640 drivers/net/wireless/ath/ath9k/hif_usb.c:1008
    [<000000006c8e4116>] ath9k_hif_usb_dev_init drivers/net/wireless/ath/ath9k/hif_usb.c:1102 [inline]
    [<000000006c8e4116>] ath9k_hif_usb_firmware_cb+0x88/0x1f0 drivers/net/wireless/ath/ath9k/hif_usb.c:1235
    [<00000000e5c70763>] request_firmware_work_func+0x47/0x90 drivers/base/firmware_loader/main.c:1079
    [<0000000089bbfbae>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<00000000d58def96>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<000000001b9033f3>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<000000001b3150ee>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
