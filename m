Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B422321E810
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 08:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgGNGYS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 02:24:18 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:38476 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgGNGYR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 02:24:17 -0400
Received: by mail-io1-f72.google.com with SMTP id l13so9793718ioj.5
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 23:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=RT03fghYgVpOdhTEDCMhz1vBEd4P9LMPUSfWa3isbuc=;
        b=E/7AfWSAkDL5t6cqI2HtdoeIJC5vU3CNRfO4MAt0GpdUT12cqvZUVw7xzD23NIsC9v
         eNsVL2sLXY/xaLTIV0u5jcGHk4R2UzVtw9YgK+M/U+wj4ny3Ux3A29a77xDa9nehm68g
         Bhk8pkogcxdrcqHdGJH2IOjl5GlaiFb0g2RZLG1y+VHfvjnKrKu+qWRrJuBDw9EPm53q
         TtDyId7CiMehUZPn9++KtRo+NsxXguVoduVjsTALRozunu2d0MEprR7XZMznUl8esiP/
         wYa6LWO7hjIkQsA1b9PqHgshGd7Oo9inaDzVDs2sPr9BQyJ+SNOsFxhMG0X5A2CYJHcN
         k/4Q==
X-Gm-Message-State: AOAM530+a202nSCGhtqt/vOQ1KG2Ckd9SMJ/NNatOnfVJGGlBARTLPX8
        bCOSMmy0jhZGR6NabgDX+CXCgHDX70umFBTr4LkLJ8oFcXsg
X-Google-Smtp-Source: ABdhPJxLiXZP9hSpitpU1elNRbn2BRDSQARtjOoFIVEgpLDRVGobSZGL1kP338lCaaiRmWgpsUwqboLXT3BMIdn26pwBDT7x6jeV
MIME-Version: 1.0
X-Received: by 2002:a02:1d44:: with SMTP id 65mr4330455jaj.20.1594707856383;
 Mon, 13 Jul 2020 23:24:16 -0700 (PDT)
Date:   Mon, 13 Jul 2020 23:24:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004ce14905aa60dba3@google.com>
Subject: BUG: corrupted list in usb_hcd_link_urb_to_ep
From:   syzbot <syzbot+7700c25812eaa5e88c8c@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, m.szyprowski@samsung.com,
        noring@nocrew.org, syzkaller-bugs@googlegroups.com,
        tweek@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    0dc589da Merge tag 'iommu-fixes-v5.8-rc5' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1462e8e7100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a160d1053fc89af5
dashboard link: https://syzkaller.appspot.com/bug?extid=7700c25812eaa5e88c8c
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+7700c25812eaa5e88c8c@syzkaller.appspotmail.com

raw-gadget gadget: fail, usb_ep_enable returned -22
raw-gadget gadget: fail, usb_ep_enable returned -22
list_add double add: new=ffff88808f208718, prev=ffff88808f208718, next=ffff8880a6601a68.
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:29!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 441 Comm: syz-executor.4 Not tainted 5.8.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__list_add_valid.cold+0x26/0x3c lib/list_debug.c:29
Code: 57 ff ff ff 4c 89 e1 48 c7 c7 e0 90 93 88 e8 c1 06 c2 fd 0f 0b 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 20 92 93 88 e8 aa 06 c2 fd <0f> 0b 48 89 f1 48 c7 c7 a0 91 93 88 4c 89 e6 e8 96 06 c2 fd 0f 0b
RSP: 0018:ffffc9000846f068 EFLAGS: 00010086
RAX: 0000000000000058 RBX: ffff88808f208700 RCX: 0000000000000000
RDX: 0000000000040000 RSI: ffffffff815d4f87 RDI: fffff5200108ddff
RBP: ffff88808f208718 R08: 0000000000000058 R09: ffff8880ae6318e7
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8880a6601a68
R13: ffff88808f208718 R14: 0000000000000000 R15: ffff88808f208718
FS:  00007f08cc521700(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056495a9c9848 CR3: 000000009ef59000 CR4: 00000000001426f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __list_add include/linux/list.h:67 [inline]
 list_add_tail include/linux/list.h:100 [inline]
 usb_hcd_link_urb_to_ep+0x21d/0x390 drivers/usb/core/hcd.c:1173
 dummy_urb_enqueue+0x28e/0x890 drivers/usb/gadget/udc/dummy_hcd.c:1266
 usb_hcd_submit_urb+0x2ad/0x2220 drivers/usb/core/hcd.c:1547
 usb_submit_urb+0xb4e/0x1320 drivers/usb/core/urb.c:570
 snd_usbmidi_submit_urb sound/usb/midi.c:194 [inline]
 snd_usbmidi_input_start_ep sound/usb/midi.c:2313 [inline]
 snd_usbmidi_input_start.part.0+0x101/0x200 sound/usb/midi.c:2329
 snd_usbmidi_input_start sound/usb/midi.c:1119 [inline]
 substream_open.isra.0+0x82c/0xc10 sound/usb/midi.c:1119
 open_substream+0x42e/0x880 sound/core/rawmidi.c:299
 rawmidi_open_priv+0x519/0x6f0 sound/core/rawmidi.c:342
 snd_rawmidi_kernel_open+0x1b5/0x270 sound/core/rawmidi.c:382
 midisynth_subscribe+0xf2/0x350 sound/core/seq/seq_midi.c:170
 subscribe_port sound/core/seq/seq_ports.c:412 [inline]
 check_and_subscribe_port+0x89a/0xb80 sound/core/seq/seq_ports.c:495
 snd_seq_port_connect+0x2e6/0x520 sound/core/seq/seq_ports.c:564
 snd_seq_ioctl_subscribe_port+0x1fc/0x400 sound/core/seq/seq_clientmgr.c:1484
 snd_seq_kernel_client_ctl+0xeb/0x130 sound/core/seq/seq_clientmgr.c:2353
 snd_seq_oss_midi_open+0x466/0x6e0 sound/core/seq/oss/seq_oss_midi.c:364
 snd_seq_oss_synth_setup_midi+0x123/0x520 sound/core/seq/oss/seq_oss_synth.c:269
 snd_seq_oss_open+0x87e/0xa10 sound/core/seq/oss/seq_oss_init.c:261
 odev_open+0x6c/0x90 sound/core/seq/oss/seq_oss.c:125
 soundcore_open+0x445/0x600 sound/sound_core.c:593
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x501/0x1290 fs/open.c:828
 do_open fs/namei.c:3243 [inline]
 path_openat+0x1bb9/0x2750 fs/namei.c:3360
 do_filp_open+0x17e/0x3c0 fs/namei.c:3387
 do_sys_openat2+0x16f/0x3b0 fs/open.c:1179
 do_sys_open fs/open.c:1195 [inline]
 __do_sys_openat fs/open.c:1209 [inline]
 __se_sys_openat fs/open.c:1204 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1204
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:384
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x45cba9
Code: Bad RIP value.
RSP: 002b:00007f08cc520c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00000000004fa1c0 RCX: 000000000045cba9
RDX: 0000000000000000 RSI: 0000000020000000 RDI: ffffffffffffff9c
RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000813 R14: 00000000004caf66 R15: 00007f08cc5216d4
Modules linked in:
---[ end trace 514bb0012877d727 ]---
RIP: 0010:__list_add_valid.cold+0x26/0x3c lib/list_debug.c:29
Code: 57 ff ff ff 4c 89 e1 48 c7 c7 e0 90 93 88 e8 c1 06 c2 fd 0f 0b 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 20 92 93 88 e8 aa 06 c2 fd <0f> 0b 48 89 f1 48 c7 c7 a0 91 93 88 4c 89 e6 e8 96 06 c2 fd 0f 0b
RSP: 0018:ffffc9000846f068 EFLAGS: 00010086
RAX: 0000000000000058 RBX: ffff88808f208700 RCX: 0000000000000000
RDX: 0000000000040000 RSI: ffffffff815d4f87 RDI: fffff5200108ddff
RBP: ffff88808f208718 R08: 0000000000000058 R09: ffff8880ae6318e7
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8880a6601a68
R13: ffff88808f208718 R14: 0000000000000000 R15: ffff88808f208718
FS:  00007f08cc521700(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056495a9c9848 CR3: 000000009ef59000 CR4: 00000000001426f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
