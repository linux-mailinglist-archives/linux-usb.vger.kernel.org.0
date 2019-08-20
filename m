Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAB8095C7B
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 12:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbfHTKpC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 06:45:02 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:34188 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfHTKpC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Aug 2019 06:45:02 -0400
Received: by mail-io1-f70.google.com with SMTP id u84so7399267iod.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2019 03:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=OjFpoNmid4vCPaUS2pOVp2kq3d/fwQVjZ44NKXZ2Cdk=;
        b=BXDYAd8HyDS2p2K7D3n8wZi214gTQdpn3xrSZMj+7481LRX3COKDdm2mUlPbGBVBkN
         1XdOHHo/wf4u4QpajFJ568geEo2gXNR34FjuzniPWKzGagf0rdVpodICqF9KkYZ55NRm
         wo7DA9GX6jlHo+KffpbvNYC6t2m4I2S7FjItKRzGoaJZvPaaYuwrGM9G8hd7HGZvWClG
         vUu0E8j/jNWYScYwZjQm3XPW6LnqxTMVolZ3o3E4gk2wmirFYvv4b4ANh3BxtF3LeTxf
         cJeuz4mwZu9tSVmlv61sMB+jbShyoYvb11biKbEptwcPsrm8H79JWnnDQaOaBjWL87zA
         95Fg==
X-Gm-Message-State: APjAAAX2tWCqtIQY/f88DN67tbjqLHFwUtCxBqyw+JNY0ylwpuRKJGI/
        jcjZtu2uhbgXZkFTw8CVQQCJsJEsgY05Bt7gXhXMFD5wo3cp
X-Google-Smtp-Source: APXvYqxVktNfERvi8wEwMZsY4F7Nbb29i3wWukrxQspVWnjQsP5i0pv3JoC/ReRHg9bXoNiAw3oLn7Yd4Kq+3W85rlD+kzCIvymK
MIME-Version: 1.0
X-Received: by 2002:a02:ce37:: with SMTP id v23mr3035747jar.46.1566297901149;
 Tue, 20 Aug 2019 03:45:01 -0700 (PDT)
Date:   Tue, 20 Aug 2019 03:45:01 -0700
In-Reply-To: <1566297095.11678.11.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000002b9f005908a2602@google.com>
Subject: Re: WARNING in wdm_write/usb_submit_urb
From:   syzbot <syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bjorn@mork.no, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-usb@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
INFO: task hung in wdm_flush

INFO: task syz-executor.1:2841 blocked for more than 143 seconds.
       Not tainted 5.3.0-rc5+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.1  D28520  2841   1862 0x00000004
Call Trace:
  schedule+0x9a/0x250 kernel/sched/core.c:3944
  wdm_flush+0x18a/0x460 drivers/usb/class/cdc-wdm.c:590
  filp_close+0xb4/0x160 fs/open.c:1166
  __close_fd+0x133/0x200 fs/file.c:636
  __do_sys_close fs/open.c:1185 [inline]
  __se_sys_close fs/open.c:1183 [inline]
  __x64_sys_close+0x69/0x100 fs/open.c:1183
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x413511
Code: 48 8b 40 30 83 80 00 01 00 00 ff 48 8b 6c 24 20 48 83 c4 28 c3 48 8d  
05 07 31 24 00 48 89 04 24 48 c7 44 24 08 16 00 00 00 e8 <1b> 57 01 00 0f  
0b 48 8d 05 15 00 22 00 48 89 04 24 48 c7 44 24 08
RSP: 002b:00007ffc1111a550 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 0000000000413511
RDX: fffffffffffffff7 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 0000000000000001 R08: ffffffffffffffff R09: ffffffffffffffff
R10: 00007ffc1111a630 R11: 0000000000000293 R12: 000000000075bf20
R13: 000000000000a6c3 R14: 0000000000760488 R15: ffffffffffffffff
INFO: task syz-executor.5:2855 blocked for more than 143 seconds.
       Not tainted 5.3.0-rc5+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.5  D28168  2855   1871 0x00000004
Call Trace:
  schedule+0x9a/0x250 kernel/sched/core.c:3944
  wdm_flush+0x18a/0x460 drivers/usb/class/cdc-wdm.c:590
  filp_close+0xb4/0x160 fs/open.c:1166
  __close_fd+0x133/0x200 fs/file.c:636
  __do_sys_close fs/open.c:1185 [inline]
  __se_sys_close fs/open.c:1183 [inline]
  __x64_sys_close+0x69/0x100 fs/open.c:1183
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x413511
Code: 48 8b 40 30 83 80 00 01 00 00 ff 48 8b 6c 24 20 48 83 c4 28 c3 48 8d  
05 07 31 24 00 48 89 04 24 48 c7 44 24 08 16 00 00 00 e8 <1b> 57 01 00 0f  
0b 48 8d 05 15 00 22 00 48 89 04 24 48 c7 44 24 08
RSP: 002b:00007fff97397960 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 0000000000413511
RDX: fffffffffffffff7 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 0000000000000001 R08: ffffffffffffffff R09: ffffffffffffffff
R10: 00007fff97397a40 R11: 0000000000000293 R12: 000000000075bf20
R13: 000000000000a894 R14: 0000000000760488 R15: ffffffffffffffff

Showing all locks held in the system:
1 lock held by khungtaskd/23:
  #0: 0000000084b787af (rcu_read_lock){....}, at:  
debug_show_all_locks+0x53/0x269 kernel/locking/lockdep.c:5254
1 lock held by rsyslogd/1604:
2 locks held by getty/1694:
  #0: 000000001a489867 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
  #1: 00000000a1f14aef (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
2 locks held by getty/1695:
  #0: 00000000b6d2253c (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
  #1: 000000006c54f9ae (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
2 locks held by getty/1696:
  #0: 00000000393fdbe8 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
  #1: 00000000946abfea (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
2 locks held by getty/1697:
  #0: 00000000b4d6d459 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
  #1: 00000000b782f4b1 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
2 locks held by getty/1698:
  #0: 000000005059df5d (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
  #1: 000000009805da5f (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
2 locks held by getty/1699:
  #0: 00000000bed26f3a (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
  #1: 000000004ed38206 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156
2 locks held by getty/1700:
  #0: 0000000040122501 (&tty->ldisc_sem){++++}, at:  
tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:272
  #1: 00000000ddb347fb (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x223/0x1ae0 drivers/tty/n_tty.c:2156

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 23 Comm: khungtaskd Not tainted 5.3.0-rc5+ #1
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  nmi_cpu_backtrace.cold+0x55/0x96 lib/nmi_backtrace.c:101
  nmi_trigger_cpumask_backtrace+0x1b0/0x1c7 lib/nmi_backtrace.c:62
  trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
  check_hung_uninterruptible_tasks kernel/hung_task.c:205 [inline]
  watchdog+0x9a4/0xe50 kernel/hung_task.c:289
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0 skipped: idling at native_safe_halt  
arch/x86/include/asm/irqflags.h:60 [inline]
NMI backtrace for cpu 0 skipped: idling at arch_safe_halt  
arch/x86/include/asm/irqflags.h:103 [inline]
NMI backtrace for cpu 0 skipped: idling at default_idle+0x28/0x2e0  
arch/x86/kernel/process.c:580


Tested on:

commit:         e06ce4da usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1767eb4a600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1667eb4a600000

