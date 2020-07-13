Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EECEC21A0F8
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 15:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726941AbgGINeV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 09:34:21 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:34948 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgGINeV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jul 2020 09:34:21 -0400
Received: by mail-il1-f199.google.com with SMTP id v12so1314509ilg.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2020 06:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=p05GjuBuUuhVaK6rQiY2NHA1lI9V1R73+yWzzZyD7e8=;
        b=RI1f2UtN575V3ptVsanwIMjZxsNCn1OH4hdrcYhbA1bae5qFlXcj4tyMHazfRsZv59
         T/umi9YuJYFbMrEPubs3VaAhUCre6SOZyfYHRM9iOlKZF+t8sI848csNwmuFCjam390D
         2MS+rc39L/UcR+DeBbpNqSeGEuA1FE9FL2bhc/rYLTfypwU8X2pyFsngSc8uxdwyidvO
         KxTOChHHl/UuDGc15DgxLJVSi365J65xS6VAjgmnvGyVlAZc3dZe6m2/3RlK1KU0UVpd
         Tc2eXXOCB1xwaXupYgeViqJsz6ct/DMqUzp9jIzj0zQt7tZDsOUcYDf3AM0TFdZ0UReY
         QJXw==
X-Gm-Message-State: AOAM531+vzTAGpJLkmgZ46hf5NQvLKYujuiP6oAepsQvWoADGzMp4oTZ
        ZoRJo5pjTsxmBkeAFw0WTDwHhKLXEI80XErTkbybUltJVD8D
X-Google-Smtp-Source: ABdhPJweJIxvnHtoIc/ZCFh/Lw4RDfki+fZiQDsNEp5e5lueOLWEtrpVn67URn1X0fYs9mny7kZEzev+f/mPU225bQrAvhc/JOVX
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1483:: with SMTP id j3mr73454055jak.65.1594301659925;
 Thu, 09 Jul 2020 06:34:19 -0700 (PDT)
Date:   Thu, 09 Jul 2020 06:34:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001ad77805aa024889@google.com>
Subject: WARNING in submit_audio_out_urb/usb_submit_urb
From:   syzbot <syzbot+c190f6858a04ea7fbc52@syzkaller.appspotmail.com>
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

HEAD commit:    768a0741 usb: dwc2: gadget: Remove assigned but never used..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1568d11f100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=999be4eb2478ffa5
dashboard link: https://syzkaller.appspot.com/bug?extid=c190f6858a04ea7fbc52
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=123aa2fb100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+c190f6858a04ea7fbc52@syzkaller.appspotmail.com

usb 1-1: send failed (error -32)
snd_usb_toneport 1-1:0.0: Line 6 TonePort GX now attached
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 0 != type 3
WARNING: CPU: 0 PID: 12 at drivers/usb/core/urb.c:478 usb_submit_urb+0xa17/0x13e0 drivers/usb/core/urb.c:478
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.8.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events line6_startup_work
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xf6/0x16e lib/dump_stack.c:118
 panic+0x2aa/0x6e1 kernel/panic.c:231
 __warn.cold+0x20/0x50 kernel/panic.c:600
 report_bug+0x1bd/0x210 lib/bug.c:198
 handle_bug+0x41/0x80 arch/x86/kernel/traps.c:235
 exc_invalid_op+0x13/0x40 arch/x86/kernel/traps.c:255
 asm_exc_invalid_op+0x12/0x20 arch/x86/include/asm/idtentry.h:563
RIP: 0010:usb_submit_urb+0xa17/0x13e0 drivers/usb/core/urb.c:478
Code: 84 e7 04 00 00 e8 a9 10 ca fd 4c 89 ef e8 41 79 12 ff 41 89 d8 44 89 e1 4c 89 f2 48 89 c6 48 c7 c7 80 a0 5d 86 e8 db 77 9e fd <0f> 0b e8 82 10 ca fd 0f b6 6c 24 08 48 c7 c6 e0 a1 5d 86 48 89 ef
RSP: 0018:ffff8881da227b10 EFLAGS: 00010086
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: ffff8881da211900 RSI: ffffffff8129b4e3 RDI: ffffed103b444f54
RBP: 0000000000000030 R08: 0000000000000001 R09: ffff8881db21fe8b
R10: 0000000000000000 R11: 0000000000000004 R12: 0000000000000000
R13: ffff8881d6ecd0a0 R14: ffff8881d3d8c690 R15: ffff8881d54c4000
 submit_audio_out_urb+0x6d6/0x1a00 sound/usb/line6/playback.c:271
 line6_submit_audio_out_all_urbs+0xc9/0x120 sound/usb/line6/playback.c:291
 line6_stream_start+0x187/0x230 sound/usb/line6/pcm.c:195
 line6_pcm_acquire+0x137/0x210 sound/usb/line6/pcm.c:318
 line6_startup_work+0x42/0x50 sound/usb/line6/driver.c:734
 process_one_work+0x94c/0x15f0 kernel/workqueue.c:2269
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
 kthread+0x392/0x470 kernel/kthread.c:291
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293
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
