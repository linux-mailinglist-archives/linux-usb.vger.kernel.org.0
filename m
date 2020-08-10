Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B895924076C
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 16:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgHJOYn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 10:24:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59887 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725979AbgHJOYm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Aug 2020 10:24:42 -0400
Received: (qmail 300635 invoked by uid 1000); 10 Aug 2020 10:24:41 -0400
Date:   Mon, 10 Aug 2020 10:24:41 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+c2c3302f9c601a4b1be2@syzkaller.appspotmail.com>
Cc:     andreyknvl@gmail.com, andreyknvl@google.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: WARNING in slab_pre_alloc_hook
Message-ID: <20200810142441.GB299045@rowland.harvard.edu>
References: <000000000000589ccd05ac845d6e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000589ccd05ac845d6e@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 10, 2020 at 04:36:25AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    449dc8c9 Merge tag 'for-v5.9' of git://git.kernel.org/pub/..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=16581652900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6ef84fa8ee48e528
> dashboard link: https://syzkaller.appspot.com/bug?extid=c2c3302f9c601a4b1be2
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16e8de34900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1244eb62900000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c2c3302f9c601a4b1be2@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> do not call blocking ops when !TASK_RUNNING; state=1 set at [<00000000370c7c68>] prepare_to_wait+0xb1/0x2a0 kernel/sched/wait.c:247
> WARNING: CPU: 1 PID: 340 at kernel/sched/core.c:7253 __might_sleep+0x135/0x190 kernel/sched/core.c:7253
> Kernel panic - not syncing: panic_on_warn set ...
> CPU: 1 PID: 340 Comm: syz-executor677 Not tainted 5.8.0-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0xf6/0x16e lib/dump_stack.c:118
>  panic+0x2aa/0x6e1 kernel/panic.c:231
>  __warn.cold+0x20/0x50 kernel/panic.c:600
>  report_bug+0x1bd/0x210 lib/bug.c:198
>  handle_bug+0x41/0x80 arch/x86/kernel/traps.c:234
>  exc_invalid_op+0x14/0x40 arch/x86/kernel/traps.c:254
>  asm_exc_invalid_op+0x12/0x20 arch/x86/include/asm/idtentry.h:536
> RIP: 0010:__might_sleep+0x135/0x190 kernel/sched/core.c:7253
> Code: 65 48 8b 1c 25 40 ef 01 00 48 8d 7b 10 48 89 fe 48 c1 ee 03 80 3c 06 00 75 2b 48 8b 73 10 48 c7 c7 e0 9e 06 86 e8 ed 12 f6 ff <0f> 0b e9 46 ff ff ff e8 1f b2 4b 00 e9 29 ff ff ff e8 15 b2 4b 00
> RSP: 0018:ffff8881cdb77a28 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: ffff8881c6458000 RCX: 0000000000000000
> RDX: ffff8881c6458000 RSI: ffffffff8129ec93 RDI: ffffed1039b6ef37
> RBP: ffffffff86fdade2 R08: 0000000000000001 R09: ffff8881db32f54f
> R10: 0000000000000000 R11: 0000000030343354 R12: 00000000000001f2
> R13: 0000000000000000 R14: 0000000000000068 R15: ffffffff83c1b1aa
>  slab_pre_alloc_hook.constprop.0+0xea/0x200 mm/slab.h:498
>  slab_alloc_node mm/slub.c:2816 [inline]
>  slab_alloc mm/slub.c:2900 [inline]
>  kmem_cache_alloc_trace+0x46/0x220 mm/slub.c:2917
>  kmalloc include/linux/slab.h:554 [inline]
>  dummy_urb_enqueue+0x7a/0x880 drivers/usb/gadget/udc/dummy_hcd.c:1251
>  usb_hcd_submit_urb+0x2b2/0x22d0 drivers/usb/core/hcd.c:1547
>  usb_submit_urb+0xb4e/0x13e0 drivers/usb/core/urb.c:570
>  yurex_write+0x3ea/0x820 drivers/usb/misc/yurex.c:495

The yurex driver shouldn't use GFP_KERNEL in a context where the current 
state isn't TASK_RUNNING.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git 449dc8c9

Index: usb-devel/drivers/usb/misc/yurex.c
===================================================================
--- usb-devel.orig/drivers/usb/misc/yurex.c
+++ usb-devel/drivers/usb/misc/yurex.c
@@ -492,7 +492,7 @@ static ssize_t yurex_write(struct file *
 	prepare_to_wait(&dev->waitq, &wait, TASK_INTERRUPTIBLE);
 	dev_dbg(&dev->interface->dev, "%s - submit %c\n", __func__,
 		dev->cntl_buffer[0]);
-	retval = usb_submit_urb(dev->cntl_urb, GFP_KERNEL);
+	retval = usb_submit_urb(dev->cntl_urb, GFP_ATOMIC);
 	if (retval >= 0)
 		timeout = schedule_timeout(YUREX_WRITE_TIMEOUT);
 	finish_wait(&dev->waitq, &wait);
