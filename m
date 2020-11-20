Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B569B2BACA6
	for <lists+linux-usb@lfdr.de>; Fri, 20 Nov 2020 16:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgKTPE1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Nov 2020 10:04:27 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:34418 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbgKTPE0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Nov 2020 10:04:26 -0500
Received: by mail-io1-f70.google.com with SMTP id q6so1704582iog.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2020 07:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=N9nVbERAPlmc2Zl9tnDKdKr4IWIYE1yHK9lzwmnFKrQ=;
        b=ZESpHEbPjvQMumIhsLWuP23O2Qp0a9sO0Nqtofmsf7VIm+wwyWMuEcIPwEwn/GospZ
         FBKkUHN7b8jYdkTRRGBv5Dt3JjWXs0zvt3NDGB/fNc0eYLWpkl/s4/rubwkrk4DQU+FI
         jEJf0BSYTdoreT6XnJfIC0UfH9as8Eepmun1f6XY+AQcef/nfB2uNYk4K5hVQzAbOqCM
         OXka5xfO8D+e4zSJ94eEqpKgIt1BBE793GyluJo5m4U2NYoPX6b8g8wG5jGl9x4wWXkw
         24JlwBXXAYFxH58XlKBX/VzWzAN3+41VBHHnAex2BJXfankHpdiwlllkPx2oIRXN+ZBc
         7HeQ==
X-Gm-Message-State: AOAM533N+xgyC5o6rwZv3GtHKCUNOa3l0kh6JqpPWD00Q/AregWsdUyt
        kAFXupnvpIUiQt/bQJhpdkbm4ezGXUeN37hzrfsYjYKYWLjb
X-Google-Smtp-Source: ABdhPJxxyHz2VsNeLGuiGa7EDr67+q4GlyNusFYU3ixgg39QjBInR5zIoz9MnG/3WM/d19Pr+2efH+coE2k7UX6jbrEfsrUGEbuD
MIME-Version: 1.0
X-Received: by 2002:a6b:5919:: with SMTP id n25mr10560216iob.204.1605884664234;
 Fri, 20 Nov 2020 07:04:24 -0800 (PST)
Date:   Fri, 20 Nov 2020 07:04:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f6530105b48b2816@google.com>
Subject: WARNING in cm109_input_ev/usb_submit_urb
From:   syzbot <syzbot+150f793ac5bc18eee150@syzkaller.appspotmail.com>
To:     eli.billauer@gmail.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    4d02da97 Merge tag 'net-5.10-rc5' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14416dc5500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c5734ed83831aefc
dashboard link: https://syzkaller.appspot.com/bug?extid=150f793ac5bc18eee150
compiler:       clang version 11.0.0 (https://github.com/llvm/llvm-project.git ca2dcbd030eadbf0aa9b660efe864ff08af6e18b)

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+150f793ac5bc18eee150@syzkaller.appspotmail.com

------------[ cut here ]------------
URB 000000001dc45296 submitted while active
WARNING: CPU: 0 PID: 17232 at drivers/usb/core/urb.c:378 usb_submit_urb+0xf57/0x1510 drivers/usb/core/urb.c:378
Modules linked in:
CPU: 0 PID: 17232 Comm: syz-executor.2 Not tainted 5.10.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:usb_submit_urb+0xf57/0x1510 drivers/usb/core/urb.c:378
Code: 5c 41 5d 41 5e 41 5f 5d e9 76 5b ff ff e8 01 2f 05 fc c6 05 07 61 6b 07 01 48 c7 c7 c0 cd 3b 8a 4c 89 e6 31 c0 e8 e9 3b d5 fb <0f> 0b e9 20 f1 ff ff e8 dd 2e 05 fc eb 05 e8 d6 2e 05 fc bb a6 ff
RSP: 0018:ffffc90007fef6d8 EFLAGS: 00010046
RAX: 43026b24801f6b00 RBX: ffff88802d664908 RCX: 0000000000040000
RDX: ffffc9000cd3d000 RSI: 000000000003ffff RDI: 0000000000040000
RBP: 0000000000000a20 R08: ffffffff815d2bc2 R09: ffffed1017383ffc
R10: ffffed1017383ffc R11: 0000000000000000 R12: ffff88802d664900
R13: dffffc0000000000 R14: dffffc0000000000 R15: ffff88801c943050
FS:  00007f61c5444700(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2de23000 CR3: 000000001caa5000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 cm109_submit_buzz_toggle drivers/input/misc/cm109.c:351 [inline]
 cm109_toggle_buzzer_async drivers/input/misc/cm109.c:487 [inline]
 cm109_input_ev+0x1dc/0x3a0 drivers/input/misc/cm109.c:621
 input_handle_event+0x895/0x1510 drivers/input/input.c:376
 input_inject_event+0x1e8/0x280 drivers/input/input.c:471
 kd_sound_helper+0xfc/0x200 drivers/tty/vt/keyboard.c:242
 input_handler_for_each_handle+0xc8/0x160 drivers/input/input.c:2356
 kd_mksound+0x6c/0x140 drivers/tty/vt/keyboard.c:266
 do_con_trol drivers/tty/vt/vt.c:2152 [inline]
 do_con_write+0x3325/0xdee0 drivers/tty/vt/vt.c:2911
 con_write+0x20/0x40 drivers/tty/vt/vt.c:3255
 process_output_block drivers/tty/n_tty.c:595 [inline]
 n_tty_write+0xcc2/0x1160 drivers/tty/n_tty.c:2333
 do_tty_write drivers/tty/tty_io.c:962 [inline]
 tty_write+0x585/0x8f0 drivers/tty/tty_io.c:1046
 vfs_write+0x220/0xab0 fs/read_write.c:603
 ksys_write+0x11b/0x220 fs/read_write.c:658
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x45deb9
Code: 0d b4 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db b3 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f61c5443c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000000000003a680 RCX: 000000000045deb9
RDX: 0000000000001006 RSI: 00000000200002c0 RDI: 0000000000000007
RBP: 000000000118bf60 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000118bf2c
R13: 00007ffd5f57ac1f R14: 00007f61c54449c0 R15: 000000000118bf2c


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
