Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02A5193D2F
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 11:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgCZKpC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 06:45:02 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36066 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbgCZKpB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 06:45:01 -0400
Received: by mail-pl1-f196.google.com with SMTP id g2so1979319plo.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 03:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RrPUkEdcvg/y0PcHJ6HKdHNJrtFFWRIeDiiLxBsymSg=;
        b=TFmukmOEEJ9JvbTUyj/fyAuzIACL0f7DZw5lHvjrmObXyFhLyn85sKcTW9nb6bb5lJ
         +8K7x/p+/PJqkq2Y8E7mHe3CJuxq2Yn/lsjcIx9tijhapEPrhgrXeTLlI8kyStJuVEhq
         q3uxaJo6lcwYGv2XBdaMbm2u3WjI9plJZaR9XViYpZWNYqJkw1iPw+uSHbAfOVrHM8tU
         Q6ASaqbifZBkCns14PZ6E7EXF5GhgOQ2wiRdalDwLSh7D2WDnQpyElG+23V4sypHLZHr
         voASvcQFP1zPKwYGh4irfocmMdv5MiRaynYHj0TqZzV7gCV79CefEJNItQ6iogBBdI1t
         MDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RrPUkEdcvg/y0PcHJ6HKdHNJrtFFWRIeDiiLxBsymSg=;
        b=dc4M6f0xCk6Oy+yVaOkVxjJrKru6ujBVVLkw7dH09dgBDCy/kS8fpI3FJo56zbcvhf
         aWjokt32pwTCTKgr2FsWX82aw1jnXmJiQLJ7iE8H/s3deNb29mO1VCc/D+QR/dKWg9oO
         XTdu1C4//TPhDbZ85ge3dfU0z+PAm5vfx9CqxB0W6D+XlO1GDzSpXjRENqOXojIpcMXX
         eVKdesOiE1VTRbBthL1ZLxdveoTcLfRLX5t5PHgCUT29LLHRAwL3S2RZEhZJUI+BId04
         4hbwoOTPozzvAZjfCKL5acvwVgKxuWms4rtphX45sVKHTx3fO34lxkb25F54sR9D6TcW
         NXaA==
X-Gm-Message-State: ANhLgQ0bZ7lJ/gKPo7EYITrNZ5wOoYT62E6CHuGjakxAf/SrOTkUnMLv
        mncr7PUsRkKQimUy4xtg1Yzu7FC16A/AqnLqTjSY4A==
X-Google-Smtp-Source: ADFU+vtm4pvZ1baADEMOm5q8Pq+om9KOooFXupVEi/ZshCBi906in5Vg+qwqtVBStK9fzAnqSREMEv1vvOyoKa3TD6E=
X-Received: by 2002:a17:90b:1985:: with SMTP id mv5mr2448311pjb.69.1585219500102;
 Thu, 26 Mar 2020 03:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006678a105a184ecb7@google.com> <CADG63jCCECPjZWmJfhn9RyJwFvDK3SYQTb8X2GPkrGumAuRfJA@mail.gmail.com>
In-Reply-To: <CADG63jCCECPjZWmJfhn9RyJwFvDK3SYQTb8X2GPkrGumAuRfJA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 26 Mar 2020 11:44:49 +0100
Message-ID: <CAAeHK+xi8zjUb8Laigmy7eKHU-36nhXdW_dCXp_MB1nPaLBW4g@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in hfa384x_usbin_callback
To:     Qiujun Huang <anenbupt@gmail.com>
Cc:     syzbot <syzbot+a57b24d359dc5577634a@syzkaller.appspotmail.com>,
        devel@driverdev.osuosl.org, Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, nishkadg.linux@gmail.com,
        osdevtc@gmail.com, syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 3:52 AM Qiujun Huang <anenbupt@gmail.com> wrote:
>
> #syz test: https://github.com/google/kasan.git e17994d1

Hi Qiujun,

I've already duped this bug to "KASAN: slab-out-of-bounds Read in
hfa384x_usbin_callback" since I had assumed they have the same root
cause. Are those bugs different? We can undup if needed.

Thanks!

>
> On Mon, Mar 23, 2020 at 8:39 PM syzbot
> <syzbot+a57b24d359dc5577634a@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    e17994d1 usb: core: kcov: collect coverage from usb comple..
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=15217373e00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=5d64370c438bc60
> > dashboard link: https://syzkaller.appspot.com/bug?extid=a57b24d359dc5577634a
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a720ade00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1467b755e00000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+a57b24d359dc5577634a@syzkaller.appspotmail.com
> >
> > ==================================================================
> > BUG: KASAN: use-after-free in memcpy include/linux/string.h:381 [inline]
> > BUG: KASAN: use-after-free in skb_put_data include/linux/skbuff.h:2284 [inline]
> > BUG: KASAN: use-after-free in hfa384x_int_rxmonitor drivers/staging/wlan-ng/hfa384x_usb.c:3412 [inline]
> > BUG: KASAN: use-after-free in hfa384x_usbin_rx drivers/staging/wlan-ng/hfa384x_usb.c:3312 [inline]
> > BUG: KASAN: use-after-free in hfa384x_usbin_callback+0x1993/0x2360 drivers/staging/wlan-ng/hfa384x_usb.c:3026
> > Read of size 34945 at addr ffff8881cda9f33c by task swapper/0/0
> >
> > CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc5-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Call Trace:
> >  <IRQ>
> >  __dump_stack lib/dump_stack.c:77 [inline]
> >  dump_stack+0xef/0x16e lib/dump_stack.c:118
> >  print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:374
> >  __kasan_report.cold+0x37/0x77 mm/kasan/report.c:506
> >  kasan_report+0xe/0x20 mm/kasan/common.c:641
> >  check_memory_region_inline mm/kasan/generic.c:185 [inline]
> >  check_memory_region+0x152/0x1c0 mm/kasan/generic.c:192
> >  memcpy+0x20/0x50 mm/kasan/common.c:127
> >  memcpy include/linux/string.h:381 [inline]
> >  skb_put_data include/linux/skbuff.h:2284 [inline]
> >  hfa384x_int_rxmonitor drivers/staging/wlan-ng/hfa384x_usb.c:3412 [inline]
> >  hfa384x_usbin_rx drivers/staging/wlan-ng/hfa384x_usb.c:3312 [inline]
> >  hfa384x_usbin_callback+0x1993/0x2360 drivers/staging/wlan-ng/hfa384x_usb.c:3026
> >  __usb_hcd_giveback_urb+0x29a/0x550 drivers/usb/core/hcd.c:1650
> >  usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1716
> >  dummy_timer+0x1258/0x32ae drivers/usb/gadget/udc/dummy_hcd.c:1966
> >  call_timer_fn+0x195/0x6f0 kernel/time/timer.c:1404
> >  expire_timers kernel/time/timer.c:1449 [inline]
> >  __run_timers kernel/time/timer.c:1773 [inline]
> >  __run_timers kernel/time/timer.c:1740 [inline]
> >  run_timer_softirq+0x5f9/0x1500 kernel/time/timer.c:1786
> >  __do_softirq+0x21e/0x950 kernel/softirq.c:292
> >  invoke_softirq kernel/softirq.c:373 [inline]
> >  irq_exit+0x178/0x1a0 kernel/softirq.c:413
> >  exiting_irq arch/x86/include/asm/apic.h:546 [inline]
> >  smp_apic_timer_interrupt+0x141/0x540 arch/x86/kernel/apic/apic.c:1146
> >  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:829
> >  </IRQ>
> > RIP: 0010:default_idle+0x28/0x300 arch/x86/kernel/process.c:696
> > Code: cc cc 41 56 41 55 65 44 8b 2d 44 77 72 7a 41 54 55 53 0f 1f 44 00 00 e8 b6 62 b5 fb e9 07 00 00 00 0f 00 2d ea 0c 53 00 fb f4 <65> 44 8b 2d 20 77 72 7a 0f 1f 44 00 00 5b 5d 41 5c 41 5d 41 5e c3
> > RSP: 0018:ffffffff87007d80 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
> > RAX: 0000000000000007 RBX: ffffffff8702cc40 RCX: 0000000000000000
> > RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffffffff8702d48c
> > RBP: fffffbfff0e05988 R08: ffffffff8702cc40 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> > R13: 0000000000000000 R14: ffffffff87e607c0 R15: 0000000000000000
> >  cpuidle_idle_call kernel/sched/idle.c:154 [inline]
> >  do_idle+0x3e0/0x500 kernel/sched/idle.c:269
> >  cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:361
> >  start_kernel+0xe16/0xe5a init/main.c:998
> >  secondary_startup_64+0xb6/0xc0 arch/x86/kernel/head_64.S:242
> >
> > The buggy address belongs to the page:
> > page:ffffea000736a600 refcount:32769 mapcount:0 mapping:0000000000000000 index:0x0 compound_mapcount: 0
> > flags: 0x200000000010000(head)
> > raw: 0200000000010000 dead000000000100 dead000000000122 0000000000000000
> > raw: 0000000000000000 0000000000000000 00008001ffffffff 0000000000000000
> > page dumped because: kasan: bad access detected
> >
> > Memory state around the buggy address:
> >  ffff8881cda9ff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >  ffff8881cda9ff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > >ffff8881cdaa0000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >                    ^
> >  ffff8881cdaa0080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >  ffff8881cdaa0100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ==================================================================
> >
> >
> > ---
> > This bug is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this bug report. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > syzbot can test patches for this bug, for details see:
> > https://goo.gl/tpsmEJ#testing-patches
