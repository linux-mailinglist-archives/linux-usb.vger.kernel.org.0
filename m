Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE405179AB
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 14:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbfEHMqH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 08:46:07 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:45964 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbfEHMqH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 May 2019 08:46:07 -0400
Received: by mail-io1-f71.google.com with SMTP id z2so9738702iog.12
        for <linux-usb@vger.kernel.org>; Wed, 08 May 2019 05:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=nIkx3XObc3rOajuepyLthZiX9rDW6umNcF9C59KOXUc=;
        b=QSIfeaIV09VAljnuD/5jMoXj4WrwEL7FfAl3KEOuCEm6NTBeGycqpJr8qhibrXRRLh
         S7mEA3ITSf79kdo10SFhmhFhZgiX0danlh5QdiKqyyUm+qs4FzpdOHrcOq9jyd6+U6PC
         yE74t3pXEx78QTqTfBWu1MTBl20MGTTSBaF5XT3GPjS6d92qdBlINMSROiG2ULS7or2h
         5gOdMV+kVuDZ/7dMtgeZcBaXb8Yq8qKpoMGytNAd2/GS185qJ2u1ZUg+RKYrlQJaraLG
         eUuQhc/mm0HKrZRZ4r1WNZ61Ublkk4r5YMxc15uuNdHSPP662FZv7ZcpHuqrzr5QYr6o
         ovPA==
X-Gm-Message-State: APjAAAU/dqyrSh0ZsQgIJFBAPCE+SZVvXKrTnCZShn8dxJlZ35wWhAlm
        BI1Rz+Ls/kOQAMg5Aoh0Gn9Fq39UBTX18JrEujhO1ml4TJyP
X-Google-Smtp-Source: APXvYqxbaE8JI0qE0JRSPcwLEL3eUNfrnfUUAmcuTHbd+H2TPTo2EOaImfCwhjxn5p452B0uz0Q9WHSR4NsUIon8xIPkxTkhlkA5
MIME-Version: 1.0
X-Received: by 2002:a05:660c:78e:: with SMTP id h14mr3240173itk.49.1557319566073;
 Wed, 08 May 2019 05:46:06 -0700 (PDT)
Date:   Wed, 08 May 2019 05:46:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000089a6e505885fb73d@google.com>
Subject: BUG: sleeping function called from invalid context in line6_pcm_acquire
From:   syzbot <syzbot+a07d0142e74fdd595cfb@syzkaller.appspotmail.com>
To:     alsa-devel@alsa-project.org, andreyknvl@google.com,
        keescook@chromium.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, perex@perex.cz,
        syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=10f0943ca00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4183eeef650d1234
dashboard link: https://syzkaller.appspot.com/bug?extid=a07d0142e74fdd595cfb
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+a07d0142e74fdd595cfb@syzkaller.appspotmail.com

BUG: sleeping function called from invalid context at  
kernel/locking/mutex.c:908
in_atomic(): 1, irqs_disabled(): 0, pid: 0, name: swapper/1
1 lock held by swapper/1/0:
  #0: 000000004ff5b49f ((&toneport->timer)){+.-.}, at: lockdep_copy_map  
include/linux/lockdep.h:170 [inline]
  #0: 000000004ff5b49f ((&toneport->timer)){+.-.}, at:  
call_timer_fn+0xce/0x5f0 kernel/time/timer.c:1315
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.1.0-rc3-319004-g43151d6 #6
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xe8/0x16e lib/dump_stack.c:113
  ___might_sleep.cold+0x11c/0x136 kernel/sched/core.c:6190
  __mutex_lock_common kernel/locking/mutex.c:908 [inline]
  __mutex_lock+0xcd/0x12b0 kernel/locking/mutex.c:1072
  line6_pcm_acquire+0x35/0x210 sound/usb/line6/pcm.c:311
  call_timer_fn+0x161/0x5f0 kernel/time/timer.c:1325
  expire_timers kernel/time/timer.c:1362 [inline]
  __run_timers kernel/time/timer.c:1681 [inline]
  __run_timers kernel/time/timer.c:1649 [inline]
  run_timer_softirq+0x58b/0x1400 kernel/time/timer.c:1694
  __do_softirq+0x22a/0x8cd kernel/softirq.c:293
  invoke_softirq kernel/softirq.c:374 [inline]
  irq_exit+0x187/0x1b0 kernel/softirq.c:414
  exiting_irq arch/x86/include/asm/apic.h:536 [inline]
  smp_apic_timer_interrupt+0xfe/0x4a0 arch/x86/kernel/apic/apic.c:1062
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:807
  </IRQ>
RIP: 0010:native_safe_halt+0x2/0x10 arch/x86/include/asm/irqflags.h:58
Code: 89 04 24 e8 50 6a a3 f3 48 8b 04 24 e9 d9 fe ff ff 48 89 df e8 3f 6a  
a3 f3 eb 8a 90 90 90 90 90 90 90 90 90 90 90 90 90 fb f4 <c3> 0f 1f 00 66  
2e 0f 1f 84 00 00 00 00 00 f4 c3 90 90 90 90 90 90
RSP: 0018:ffff8880a84bfdc0 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8880a84a20bc
RBP: ffffed1015094310 R08: ffff8880a84a1880 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8880a84a1880
R13: 0000000000000001 R14: 0000000000000000 R15: ffff8880a84a1880
  arch_safe_halt arch/x86/include/asm/paravirt.h:156 [inline]
  default_idle+0x24/0x2b0 arch/x86/kernel/process.c:576
  cpuidle_idle_call kernel/sched/idle.c:153 [inline]
  do_idle+0x321/0x400 kernel/sched/idle.c:262
  cpu_startup_entry+0x19/0x20 kernel/sched/idle.c:353
  start_secondary+0x30f/0x410 arch/x86/kernel/smpboot.c:267
  secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:243
==================================================================
BUG: KASAN: null-ptr-deref in memset include/linux/string.h:337 [inline]
BUG: KASAN: null-ptr-deref in submit_audio_out_urb+0x91e/0x1780  
sound/usb/line6/playback.c:246
Write of size 20 at addr 0000000000000010 by task swapper/1/0

CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W          
5.1.0-rc3-319004-g43151d6 #6
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xe8/0x16e lib/dump_stack.c:113
  kasan_report.cold+0x5/0x3c mm/kasan/report.c:321
  memset+0x20/0x40 mm/kasan/common.c:115
  memset include/linux/string.h:337 [inline]
  submit_audio_out_urb+0x91e/0x1780 sound/usb/line6/playback.c:246
  line6_submit_audio_out_all_urbs+0xce/0x120 sound/usb/line6/playback.c:295
  line6_stream_start+0x15b/0x1f0 sound/usb/line6/pcm.c:199
  line6_pcm_acquire+0x139/0x210 sound/usb/line6/pcm.c:322
  call_timer_fn+0x161/0x5f0 kernel/time/timer.c:1325
  expire_timers kernel/time/timer.c:1362 [inline]
  __run_timers kernel/time/timer.c:1681 [inline]
  __run_timers kernel/time/timer.c:1649 [inline]
  run_timer_softirq+0x58b/0x1400 kernel/time/timer.c:1694
  __do_softirq+0x22a/0x8cd kernel/softirq.c:293
  invoke_softirq kernel/softirq.c:374 [inline]
  irq_exit+0x187/0x1b0 kernel/softirq.c:414
  exiting_irq arch/x86/include/asm/apic.h:536 [inline]
  smp_apic_timer_interrupt+0xfe/0x4a0 arch/x86/kernel/apic/apic.c:1062
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:807
  </IRQ>
RIP: 0010:native_safe_halt+0x2/0x10 arch/x86/include/asm/irqflags.h:58
Code: 89 04 24 e8 50 6a a3 f3 48 8b 04 24 e9 d9 fe ff ff 48 89 df e8 3f 6a  
a3 f3 eb 8a 90 90 90 90 90 90 90 90 90 90 90 90 90 fb f4 <c3> 0f 1f 00 66  
2e 0f 1f 84 00 00 00 00 00 f4 c3 90 90 90 90 90 90
RSP: 0018:ffff8880a84bfdc0 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8880a84a20bc
RBP: ffffed1015094310 R08: ffff8880a84a1880 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8880a84a1880
R13: 0000000000000001 R14: 0000000000000000 R15: ffff8880a84a1880
  arch_safe_halt arch/x86/include/asm/paravirt.h:156 [inline]
  default_idle+0x24/0x2b0 arch/x86/kernel/process.c:576
  cpuidle_idle_call kernel/sched/idle.c:153 [inline]
  do_idle+0x321/0x400 kernel/sched/idle.c:262
  cpu_startup_entry+0x19/0x20 kernel/sched/idle.c:353
  start_secondary+0x30f/0x410 arch/x86/kernel/smpboot.c:267
  secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:243
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
