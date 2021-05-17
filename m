Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5BC382B6A
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 13:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236860AbhEQLqf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 07:46:35 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:34641 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236843AbhEQLqf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 May 2021 07:46:35 -0400
Received: by mail-io1-f70.google.com with SMTP id e84-20020a6bb5570000b029043a9371b108so3116444iof.1
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 04:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=yNWab/Z5VvNmNnAEZRLNLUgTQWMVLmoFtOOAnRJXdeI=;
        b=Kv4Bo4qyfnZdlo14UXpBzUD+YlGfm+BgHqrmKHQTRk4jd2BBJLuBO532AaDImeBiND
         Z8WlTpguaIKDsJg2lTpZlkpV7dK+Ow6tyo5lWCGrnr3YXoISegCv5jHek2duakVPL0u1
         KTwS1mKQrffxn30LkyDbRLWA3MegHuKFsvH3coTAioaWAnSKhWIRzDMh+sKfrTnKLdj/
         zhtD52BN/l+7Oelx6DH+Vf96BOdO26fa0PcKn6QiaGLAK/OwgaUpCoWX2oyfDkMi98lb
         gd6e5zPCJNcN0ZlJRQ1Z1tfGGF8BV9tu2hMOSHRLZiFZ0yPuuRxReNKtJIFoJ7bjPqof
         S6IQ==
X-Gm-Message-State: AOAM5306/6k8yK9ydLund+QCeFiQNn39+bGjxClFVziIaLXlLAqla3AA
        wAjtqQQNZAFW1+x8T0t+XrJPtJ/Ckrv/A7H0FWYQy12DZPGf
X-Google-Smtp-Source: ABdhPJwkC9VEMg4pb4pqQ6qKafmp2FCVbtE0XOdMPcR7GLHRvBtK/RqXqd/XPYfU2OZp4cskhzMbFfAzfvjuPvRKzBCKTnNx752Q
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a4d:: with SMTP id u13mr25316094ilv.64.1621251917658;
 Mon, 17 May 2021 04:45:17 -0700 (PDT)
Date:   Mon, 17 May 2021 04:45:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a4be9405c28520de@google.com>
Subject: [syzbot] general protection fault in line6_midibuf_write (2)
From:   syzbot <syzbot+0d2b3feb0a2887862e06@syzkaller.appspotmail.com>
To:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, perex@perex.cz,
        syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    e5242861 usb: gadget: s3c: Fix the error handling path in ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=15dd2111d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9f35f6ae509ee286
dashboard link: https://syzkaller.appspot.com/bug?extid=0d2b3feb0a2887862e06

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0d2b3feb0a2887862e06@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000019: 0000 [#1] SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000000c8-0x00000000000000cf]
CPU: 0 PID: 27882 Comm: syz-executor.1 Not tainted 5.12.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:midibuf_is_full sound/usb/line6/midibuf.c:44 [inline]
RIP: 0010:line6_midibuf_write+0x30/0x3f0 sound/usb/line6/midibuf.c:91
Code: 49 89 f5 41 54 55 89 d5 53 48 89 fb 4c 8d 7b 18 48 83 ec 28 e8 a1 12 95 fc 4c 89 fa 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 09 03 00 00 44 8b 63 18 31 ff
RSP: 0018:ffffc900000079f0 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: 00000000000000b0 RCX: ffffc900055a9000
RDX: 0000000000000019 RSI: ffffffff84ab519f RDI: 00000000000000b0
RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff87ac9e83
R10: ffffffff84ab1930 R11: 0000000000000001 R12: 00000000000000b0
R13: ffff88811544da80 R14: ffff8881161ca584 R15: 00000000000000c8
FS:  00007fe616b12700(0000) GS:ffff8881f6a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fef908ea130 CR3: 000000010da07000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 line6_data_received+0x281/0x520 sound/usb/line6/driver.c:296
 __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1656
 usb_hcd_giveback_urb+0x367/0x410 drivers/usb/core/hcd.c:1726
 dummy_timer+0x11f4/0x32a0 drivers/usb/gadget/udc/dummy_hcd.c:1971
 call_timer_fn+0x1a5/0x630 kernel/time/timer.c:1431
 expire_timers kernel/time/timer.c:1476 [inline]
 __run_timers.part.0+0x67c/0xa10 kernel/time/timer.c:1745
 __run_timers kernel/time/timer.c:1726 [inline]
 run_timer_softirq+0x80/0x120 kernel/time/timer.c:1758
 __do_softirq+0x1b0/0x944 kernel/softirq.c:345
 invoke_softirq kernel/softirq.c:221 [inline]
 __irq_exit_rcu kernel/softirq.c:422 [inline]
 irq_exit_rcu+0x110/0x1a0 kernel/softirq.c:434
 sysvec_apic_timer_interrupt+0x6a/0x90 arch/x86/kernel/apic/apic.c:1100
 </IRQ>
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:632
RIP: 0010:_raw_spin_unlock_irqrestore+0x3a/0x50 kernel/locking/spinlock.c:192
Code: 10 e8 6a 0c 76 fb 48 89 ef e8 32 c0 76 fb 81 e3 00 02 00 00 75 17 9c 58 f6 c4 02 75 17 48 85 db 74 01 fb 65 ff 0d 96 a5 50 7a <5b> 5d c3 e8 5e f2 94 fb eb e2 e8 b7 85 fe ff eb e2 0f 1f 44 00 00
RSP: 0018:ffffc900148ffe18 EFLAGS: 00000246
RAX: 0000000000000006 RBX: 0000000000000200 RCX: 1ffffffff11996b1
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff85b14972
RBP: ffff8881068a4008 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff81463c08 R11: 0000000000000000 R12: 0000000000000216
R13: ffff8881068a4008 R14: fffffffffffffff0 R15: 1ffff9200291ffcf
 spin_unlock_irqrestore include/linux/spinlock.h:409 [inline]
 raw_ioctl_ep0_stall drivers/usb/gadget/legacy/raw_gadget.c:751 [inline]
 raw_ioctl+0xed8/0x2720 drivers/usb/gadget/legacy/raw_gadget.c:1247
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x466217
Code: 3c 1c 48 f7 d8 49 39 c4 72 b8 e8 a4 48 02 00 85 c0 78 bd 48 83 c4 08 4c 89 e0 5b 41 5c c3 0f 1f 44 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe616b100b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fe616b11130 RCX: 0000000000466217
RDX: 0000000000000000 RSI: 0000000000005501 RDI: 0000000000000005
RBP: 0000000000000005 R08: 0000000000000010 R09: 00312e6364755f79
R10: 00007fe616b0fe57 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000020000000 R15: 00000000000010d0
Modules linked in:
---[ end trace 71f0ad4466d7d24b ]---
RIP: 0010:midibuf_is_full sound/usb/line6/midibuf.c:44 [inline]
RIP: 0010:line6_midibuf_write+0x30/0x3f0 sound/usb/line6/midibuf.c:91
Code: 49 89 f5 41 54 55 89 d5 53 48 89 fb 4c 8d 7b 18 48 83 ec 28 e8 a1 12 95 fc 4c 89 fa 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 09 03 00 00 44 8b 63 18 31 ff
RSP: 0018:ffffc900000079f0 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: 00000000000000b0 RCX: ffffc900055a9000
RDX: 0000000000000019 RSI: ffffffff84ab519f RDI: 00000000000000b0
RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff87ac9e83
R10: ffffffff84ab1930 R11: 0000000000000001 R12: 00000000000000b0
R13: ffff88811544da80 R14: ffff8881161ca584 R15: 00000000000000c8
FS:  00007fe616b12700(0000) GS:ffff8881f6a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fef908ea130 CR3: 000000010da07000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
