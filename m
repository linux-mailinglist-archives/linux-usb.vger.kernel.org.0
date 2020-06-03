Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDE01EC8E4
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 07:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgFCFlS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 01:41:18 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:44160 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgFCFlS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jun 2020 01:41:18 -0400
Received: by mail-il1-f198.google.com with SMTP id b8so711093ilr.11
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2020 22:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=7PaEP4t/B3kjXAbvlDlHJVPzwZvbdoEtutPTrhsFWoQ=;
        b=PFSouSt2MrkJyonfOZHLwVexxTPzx1ITMJ5Pnuj0rDbt1B8wuVlBo7OYoeWKxheOQ+
         C1idRUZQKFlgFFr+5xjHIXu0qxuuhPkOPGKE88GIwYIKyubooJweHBzc1jSfDJbDie33
         rEqUw4hQGsRt0ek/tWSlyhRQ3p4Wm4mjWCnWKTcGqQ1AIqtXJ08T5Hw8d75LOyiTuT9Y
         uIeflB3/k19rxaMpwmT20uVFOU0QkoKxpvN0ydndNoDshF0koIsXwRlKqGxFu0SixQTc
         K/q5y5TK752rt7GIqnBGFWxlg9DmA3PPRvT0Y3yGwlh4jnpkR2mJil2D/9jTeF4YfWIU
         q5tg==
X-Gm-Message-State: AOAM533JQ/jxaoQ7e3Ot/h2GfZwI7GVOYGemUQkp/ayx8jekqkEtA238
        X6cwJi9cpawSmHFUka/6fp7+4I3hX/bTCQtLj2Dlgr2H079n
X-Google-Smtp-Source: ABdhPJw8f0fUZU9WLJrKfj4Zf3cfsWMIJgeIP97nKn/peVLTrc3yEoIobmLcvScJqjw+IkFqoqIl2uHaHfiJNbTCmdjDBo/kMwho
MIME-Version: 1.0
X-Received: by 2002:a02:810:: with SMTP id 16mr28697375jac.17.1591162876898;
 Tue, 02 Jun 2020 22:41:16 -0700 (PDT)
Date:   Tue, 02 Jun 2020 22:41:16 -0700
In-Reply-To: <000000000000bbd09005a6fdc6cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000eb4b905a7277a7d@google.com>
Subject: Re: WARNING in snd_usbmidi_submit_urb/usb_submit_urb
From:   syzbot <syzbot+5f1d24c49c1d2c427497@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ingrassia@epigenesys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    1ee08de1 Merge tag 'for-5.8/io_uring-2020-06-01' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15f9e516100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b46ebd806238a886
dashboard link: https://syzkaller.appspot.com/bug?extid=5f1d24c49c1d2c427497
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1667dcca100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f9e516100000

The bug was bisected to:

commit f2c2e717642c66f7fe7e5dd69b2e8ff5849f4d10
Author: Andrey Konovalov <andreyknvl@google.com>
Date:   Mon Feb 24 16:13:03 2020 +0000

    usb: gadget: add raw-gadget interface

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=164afcf2100000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=154afcf2100000
console output: https://syzkaller.appspot.com/x/log.txt?x=114afcf2100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+5f1d24c49c1d2c427497@syzkaller.appspotmail.com
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")

------------[ cut here ]------------
URB 0000000044767a7f submitted while active
WARNING: CPU: 1 PID: 9186 at drivers/usb/core/urb.c:363 usb_submit_urb+0x10c1/0x13b0 drivers/usb/core/urb.c:363
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 9186 Comm: syz-executor730 Not tainted 5.7.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x188/0x20d lib/dump_stack.c:118
 panic+0x2e3/0x75c kernel/panic.c:221
 __warn.cold+0x2f/0x35 kernel/panic.c:582
 report_bug+0x27b/0x2f0 lib/bug.c:195
 fixup_bug arch/x86/kernel/traps.c:105 [inline]
 fixup_bug arch/x86/kernel/traps.c:100 [inline]
 do_error_trap+0x12b/0x220 arch/x86/kernel/traps.c:197
 do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:216
 invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
RIP: 0010:usb_submit_urb+0x10c1/0x13b0 drivers/usb/core/urb.c:363
Code: 89 de e8 c2 16 66 fc 84 db 0f 85 42 f6 ff ff e8 85 15 66 fc 4c 89 fe 48 c7 c7 40 b3 ab 88 c6 05 98 27 78 05 01 e8 57 29 37 fc <0f> 0b e9 20 f6 ff ff c7 44 24 14 01 00 00 00 e9 d7 f6 ff ff 41 bd
RSP: 0018:ffffc90007dc72b0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815cd4c7 RDI: fffff52000fb8e48
RBP: dffffc0000000000 R08: ffff888095b144c0 R09: ffffed1015ce45f1
R10: ffff8880ae722f83 R11: ffffed1015ce45f0 R12: 0000000000000cc0
R13: 00000000fffffff0 R14: ffff888095974000 R15: ffff88809fa06600
 snd_usbmidi_submit_urb+0x19/0x60 sound/usb/midi.c:194
 snd_usbmidi_input_start_ep sound/usb/midi.c:2313 [inline]
 snd_usbmidi_input_start.part.0+0xbe/0x1c0 sound/usb/midi.c:2329
 snd_usbmidi_input_start sound/usb/midi.c:1119 [inline]
 substream_open.isra.0+0x505/0x830 sound/usb/midi.c:1119
 open_substream+0x42e/0x880 sound/core/rawmidi.c:299
 rawmidi_open_priv+0x2e8/0x6e0 sound/core/rawmidi.c:342
 snd_rawmidi_kernel_open+0x1b5/0x270 sound/core/rawmidi.c:382
 midisynth_subscribe+0xf2/0x330 sound/core/seq/seq_midi.c:170
 subscribe_port sound/core/seq/seq_ports.c:412 [inline]
 check_and_subscribe_port+0x5b5/0x800 sound/core/seq/seq_ports.c:495
 snd_seq_port_connect+0x2e4/0x510 sound/core/seq/seq_ports.c:564
 snd_seq_ioctl_subscribe_port+0x1df/0x310 sound/core/seq/seq_clientmgr.c:1484
 snd_seq_kernel_client_ctl+0xeb/0x130 sound/core/seq/seq_clientmgr.c:2353
 snd_seq_oss_midi_open+0x3cb/0x640 sound/core/seq/oss/seq_oss_midi.c:364
 snd_seq_oss_synth_setup_midi+0x123/0x520 sound/core/seq/oss/seq_oss_synth.c:269
 snd_seq_oss_open+0x7fa/0x980 sound/core/seq/oss/seq_oss_init.c:261
 odev_open+0x6c/0x90 sound/core/seq/oss/seq_oss.c:125
 soundcore_open+0x446/0x600 sound/sound_core.c:593
 chrdev_open+0x219/0x5c0 fs/char_dev.c:414
 do_dentry_open+0x546/0x1340 fs/open.c:828
 do_open fs/namei.c:3229 [inline]
 path_openat+0x1e59/0x27d0 fs/namei.c:3346
 do_filp_open+0x192/0x260 fs/namei.c:3373
 do_sys_openat2+0x585/0x7d0 fs/open.c:1179
 do_sys_open+0xc3/0x140 fs/open.c:1195
 do_syscall_32_irqs_on arch/x86/entry/common.c:337 [inline]
 do_fast_syscall_32+0x270/0xe90 arch/x86/entry/common.c:396
 entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139
Kernel Offset: disabled
Rebooting in 86400 seconds..

