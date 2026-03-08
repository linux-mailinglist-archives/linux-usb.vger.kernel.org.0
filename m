Return-Path: <linux-usb+bounces-34248-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Dy8A27+rWkV+gEAu9opvQ
	(envelope-from <linux-usb+bounces-34248-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 23:55:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5ED232940
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 23:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2451530166C8
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 22:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E571D33D51F;
	Sun,  8 Mar 2026 22:54:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E532AAD1
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 22:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773010489; cv=none; b=pHakplS2nRHwAYmiHY+O3YcuTPC6LbEUFPtaBXSBwxk0iuMwDvAcE+a+1qJ6locrH1t9MSEazOOdR/YOrlUwr/XNjrc90LA4LSSRNCvlPBsk84rf5Fpepbidq5B7snYmYh+jgH46WdlowrN/et7f/9y7PiyNFW7U3n2PyYzJCyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773010489; c=relaxed/simple;
	bh=IOe4m1XGjs2LAOTuBIFG3ya7/aH0NvMwY3Ygez6kvYk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GDjK+NYpzVxNKgUHb7RFFNkG6KoWUPtih4b6/JHQau2L3H/LQJdglQRY0DxfRhilxF2+vkN2KSGpVKUIi1uzgA1kOclZGC7bv/VAGDDeDYNZe548CMMypHYBI+wY/XWwBOLK6WvHJ+Y/a0aMeWN9c+j6M4/CnShkRTOxwftn1oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67ba8d8546cso19301395eaf.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Mar 2026 15:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773010487; x=1773615287;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=klmV39Nldt/BfDzkGU2IfR5AFtDZJ6Lqo+Yc/PdnYY0=;
        b=QnyCs9Et0fraj7nJ3lE9Vyre4+xezV5gSEPREsSNk1eaEy0CEuS/CImhFOV+r3k1EU
         DaDxuyWissjYj23HenMMtOTuZ7sJ6ejqAXN51FN+FoAbYxGZdxfF2IwS6zhiQuwk14Es
         5RT/veLHBp6jQYvkWEJhsOSqWUG7a3nhDJuhuww2EPHmktvFFKNuYZ+JA7LAjMU37GEM
         w2YoOrap6i73gHGT5TS/7hFsmpUAtVMMzdFwb6+fdkebAtgvDJEM79n7OVEUMEXu2Z8p
         dVGTK7HKCZxv9BeuGcafOTil4U6zU9S+YlYkQXn4Go8+kiHUoiveCehwdnJzpUMqvC4U
         D4yg==
X-Forwarded-Encrypted: i=1; AJvYcCUQRZPBgkhUPRhXlE8EnO+2XvzQSJ4HwtkhZJOWbzNdXJwkkhGsV1o5fxEkqxDCdjjBZ8G6y0I8Ego=@vger.kernel.org
X-Gm-Message-State: AOJu0YxexJjVhtsgkWdnuqDxYgkjHhko8EKgfCl/KcUOeANqdC3SZGvA
	Obk2cSOiJ/D0EMmJ8nv+YLtu9FBD2SWOp1kJc4vU8R2+NjLvPpfqjGo/STAEUohHnN8x8Hq1pru
	QauauhPD3pDtJbX/ZLp4U3dfp0Izay8VTEU4DuIlD60k19DmlUKkUu0f/ipg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2207:b0:67b:b13c:5a12 with SMTP id
 006d021491bc7-67bb13c5b4cmr1608311eaf.45.1773010486761; Sun, 08 Mar 2026
 15:54:46 -0700 (PDT)
Date: Sun, 08 Mar 2026 15:54:46 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69adfe36.a70a0220.52840.0008.GAE@google.com>
Subject: [syzbot] [mm?] WARNING: suspicious RCU usage in usb_tx_block
From: syzbot <syzbot+602b46de41ef3a75dfb3@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 7C5ED232940
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=f1500201919951cc];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34248-lists,linux-usb=lfdr.de,602b46de41ef3a75dfb3];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.942];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,goo.gl:url,googlegroups.com:email,storage.googleapis.com:url,appspotmail.com:email]
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    bb375c251ab4 dt-bindings: usb: st,st-ohci-300x: convert to..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=13e19552580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f1500201919951cc
dashboard link: https://syzkaller.appspot.com/bug?extid=602b46de41ef3a75dfb3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2475c3172471/disk-bb375c25.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/30449aa672dd/vmlinux-bb375c25.xz
kernel image: https://storage.googleapis.com/syzbot-assets/46d3937d1c16/bzImage-bb375c25.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+602b46de41ef3a75dfb3@syzkaller.appspotmail.com

=============================
WARNING: suspicious RCU usage
syzkaller #0 Not tainted
-----------------------------
kernel/sched/core.c:8846 Illegal context switch in RCU-sched read-side critical section!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
8 locks held by syz-executor/16541:
 #0: ffffffff898137d0 (dup_mmap_sem){.+.+}-{0:0}, at: dup_mm kernel/fork.c:1529 [inline]
 #0: ffffffff898137d0 (dup_mmap_sem){.+.+}-{0:0}, at: copy_mm kernel/fork.c:1582 [inline]
 #0: ffffffff898137d0 (dup_mmap_sem){.+.+}-{0:0}, at: copy_process+0x4594/0x7800 kernel/fork.c:2223
 #1: ffff888114e4cb40 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:554 [inline]
 #1: ffff888114e4cb40 (&mm->mmap_lock){++++}-{4:4}, at: dup_mmap+0x11f/0x1f30 mm/mmap.c:1740
 #2: ffff88811c64b340 (&mm->mmap_lock/1){+.+.}-{4:4}, at: mmap_write_lock_nested include/linux/mmap_lock.h:544 [inline]
 #2: ffff88811c64b340 (&mm->mmap_lock/1){+.+.}-{4:4}, at: dup_mmap+0x1ba/0x1f30 mm/mmap.c:1747
 #3: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
 #3: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:850 [inline]
 #3: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: __pte_offset_map+0x2f/0x300 mm/pgtable-generic.c:288
 #4: ffff8881356161f8 (ptlock_ptr(ptdesc)#2){+.+.}-{3:3}
, at: spin_lock include/linux/spinlock.h:341 [inline]
, at: pte_offset_map_lock+0x10f/0x320 mm/pgtable-generic.c:402
 #5: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
 #5: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:850 [inline]
 #5: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: __pte_offset_map+0x2f/0x300 mm/pgtable-generic.c:288
 #6: ffff88813be78978 (ptlock_ptr(ptdesc)#2/1){+.+.}-{3:3}, at: copy_pte_range mm/memory.c:1269 [inline]
 #6: ffff88813be78978 (ptlock_ptr(ptdesc)#2/1){+.+.}-{3:3}, at: copy_pmd_range mm/memory.c:1405 [inline]
 #6: ffff88813be78978 (ptlock_ptr(ptdesc)#2/1){+.+.}-{3:3}, at: copy_pud_range mm/memory.c:1442 [inline]
 #6: ffff88813be78978 (ptlock_ptr(ptdesc)#2/1){+.+.}-{3:3}, at: copy_p4d_range mm/memory.c:1466 [inline]
 #6: ffff88813be78978 (ptlock_ptr(ptdesc)#2/1){+.+.}-{3:3}, at: copy_page_range+0xc75/0x2630 mm/memory.c:1552
 #7: ffffffff896e04e0 (rcu_read_lock_sched){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
 #7: ffffffff896e04e0 (rcu_read_lock_sched){....}-{1:2}, at: rcu_read_lock_sched include/linux/rcupdate.h:948 [inline]
 #7: ffffffff896e04e0 (rcu_read_lock_sched){....}-{1:2}, at: pfn_valid include/linux/mmzone.h:2197 [inline]
 #7: ffffffff896e04e0 (rcu_read_lock_sched){....}-{1:2}, at: page_table_check_set+0x4f/0xa10 mm/page_table_check.c:105

stack backtrace:
CPU: 0 UID: 0 PID: 16541 Comm: syz-executor Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 lockdep_rcu_suspicious.cold+0x4f/0xb1 kernel/locking/lockdep.c:6876
 __might_resched+0x2e0/0x330 kernel/sched/core.c:8846
 usb_kill_urb+0x8e/0x320 drivers/usb/core/urb.c:705
 usb_tx_block+0x91/0x320 drivers/net/wireless/marvell/libertas/if_usb.c:429
 if_usb_send_fw_pkt.isra.0+0x2e4/0x550 drivers/net/wireless/marvell/libertas/if_usb.c:366
 if_usb_receive_fwload+0x5d3/0x780 drivers/net/wireless/marvell/libertas/if_usb.c:592
 __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
 dummy_timer+0xd85/0x3670 drivers/usb/gadget/udc/dummy_hcd.c:1995
 __run_hrtimer kernel/time/hrtimer.c:1785 [inline]
 __hrtimer_run_queues+0x50e/0xa70 kernel/time/hrtimer.c:1849
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1866
 handle_softirqs+0x1de/0x9d0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0xed/0x150 kernel/softirq.c:723
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
 sysvec_apic_timer_interrupt+0x8f/0xb0 arch/x86/kernel/apic/apic.c:1056
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:__sanitizer_cov_trace_pc+0xb/0x70 kernel/kcov.c:213
Code: 5a 00 be 03 00 00 00 5b e9 e2 26 1a 01 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 65 8b 05 25 16 43 0b <48> 8b 34 24 65 48 8b 15 01 16 43 0b a9 00 01 ff 00 74 1b f6 c4 01
RSP: 0018:ffffc9001495f398 EFLAGS: 00000202
RAX: 0000000080000003 RBX: 00000000001475a1 RCX: ffffffff821a7c7e
RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff88811632ba00
RBP: 0000000000000001 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000008
R13: 0000000000000001 R14: 0000000000000001 R15: 0000000000000000
 rcu_read_unlock_sched include/linux/rcupdate.h:970 [inline]
 pfn_valid include/linux/mmzone.h:2207 [inline]
 page_table_check_set+0x86d/0xa10 mm/page_table_check.c:105
 __page_table_check_ptes_set+0x1db/0x230 mm/page_table_check.c:215
 page_table_check_ptes_set include/linux/page_table_check.h:83 [inline]
 set_ptes include/linux/pgtable.h:413 [inline]
 __copy_present_ptes mm/memory.c:1115 [inline]
 copy_present_ptes+0xcc4/0x4590 mm/memory.c:1194
 copy_pte_range mm/memory.c:1317 [inline]
 copy_pmd_range mm/memory.c:1405 [inline]
 copy_pud_range mm/memory.c:1442 [inline]
 copy_p4d_range mm/memory.c:1466 [inline]
 copy_page_range+0xe45/0x2630 mm/memory.c:1552
 dup_mmap+0xcb9/0x1f30 mm/mmap.c:1841
 dup_mm kernel/fork.c:1530 [inline]
 copy_mm kernel/fork.c:1582 [inline]
 copy_process+0x459f/0x7800 kernel/fork.c:2223
 kernel_clone+0xfc/0x9a0 kernel/fork.c:2654
 __do_sys_clone+0xd9/0x120 kernel/fork.c:2795
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x106/0x7b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3e86fc5212
Code: 89 e7 e8 71 8b f7 ff 45 31 c0 31 d2 31 f6 64 48 8b 04 25 10 00 00 00 bf 11 00 20 01 4c 8d 90 d0 02 00 00 b8 38 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 66 89 c5 85 c0 75 3b 64 48 8b 04 25 10 00 00
RSP: 002b:00007fff99746eb0 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
RAX: ffffffffffffffda RBX: 00007fff99746eb0 RCX: 00007f3e86fc5212
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000001200011
RBP: 00007fff9974703c R08: 0000000000000000 R09: 0000000000000001
R10: 00005555833b67d0 R11: 0000000000000246 R12: 0000000000000000
R13: 00000000000927c0 R14: 0000000000301ae6 R15: 00007fff99747090
 </TASK>
BUG: sleeping function called from invalid context at drivers/usb/core/urb.c:705
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 16541, name: syz-executor
preempt_count: 103, expected: 0
RCU nest depth: 2, expected: 0
8 locks held by syz-executor/16541:
 #0: 
ffffffff898137d0 (dup_mmap_sem){.+.+}-{0:0}, at: dup_mm kernel/fork.c:1529 [inline]
ffffffff898137d0 (dup_mmap_sem){.+.+}-{0:0}, at: copy_mm kernel/fork.c:1582 [inline]
ffffffff898137d0 (dup_mmap_sem){.+.+}-{0:0}, at: copy_process+0x4594/0x7800 kernel/fork.c:2223
 #1: ffff888114e4cb40 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:554 [inline]
 #1: ffff888114e4cb40 (&mm->mmap_lock){++++}-{4:4}, at: dup_mmap+0x11f/0x1f30 mm/mmap.c:1740
 #2: 
ffff88811c64b340 (&mm->mmap_lock
/1){+.+.}-{4:4}, at: mmap_write_lock_nested include/linux/mmap_lock.h:544 [inline]
/1){+.+.}-{4:4}, at: dup_mmap+0x1ba/0x1f30 mm/mmap.c:1747
 #3: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
 #3: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:850 [inline]
 #3: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: __pte_offset_map+0x2f/0x300 mm/pgtable-generic.c:288
 #4: ffff8881356161f8 (ptlock_ptr(ptdesc)
#2){+.+.}-{3:3}, at: spin_lock include/linux/spinlock.h:341 [inline]
#2){+.+.}-{3:3}, at: pte_offset_map_lock+0x10f/0x320 mm/pgtable-generic.c:402
 #5: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
 #5: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:850 [inline]
 #5: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: __pte_offset_map+0x2f/0x300 mm/pgtable-generic.c:288
 #6: ffff88813be78978 (ptlock_ptr(ptdesc)
#2/1){+.+.}-{3:3}
, at: copy_pte_range mm/memory.c:1269 [inline]
, at: copy_pmd_range mm/memory.c:1405 [inline]
, at: copy_pud_range mm/memory.c:1442 [inline]
, at: copy_p4d_range mm/memory.c:1466 [inline]
, at: copy_page_range+0xc75/0x2630 mm/memory.c:1552
 #7: ffffffff896e04e0 (rcu_read_lock_sched){....}-{1:2}
, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
, at: rcu_read_lock_sched include/linux/rcupdate.h:948 [inline]
, at: pfn_valid include/linux/mmzone.h:2197 [inline]
, at: page_table_check_set+0x4f/0xa10 mm/page_table_check.c:105
irq event stamp: 4986957
hardirqs last  enabled at (4986956): [<ffffffff876b20b2>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:178 [inline]
hardirqs last  enabled at (4986956): [<ffffffff876b20b2>] _raw_spin_unlock_irqrestore+0x52/0x80 kernel/locking/spinlock.c:194
hardirqs last disabled at (4986957): [<ffffffff876b1dc2>] __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:130 [inline]
hardirqs last disabled at (4986957): [<ffffffff876b1dc2>] _raw_spin_lock_irqsave+0x52/0x60 kernel/locking/spinlock.c:162
softirqs last  enabled at (4986950): [<ffffffff8176f0bd>] __do_softirq kernel/softirq.c:656 [inline]
softirqs last  enabled at (4986950): [<ffffffff8176f0bd>] invoke_softirq kernel/softirq.c:496 [inline]
softirqs last  enabled at (4986950): [<ffffffff8176f0bd>] __irq_exit_rcu+0xed/0x150 kernel/softirq.c:723
softirqs last disabled at (4986953): [<ffffffff8176f0bd>] __do_softirq kernel/softirq.c:656 [inline]
softirqs last disabled at (4986953): [<ffffffff8176f0bd>] invoke_softirq kernel/softirq.c:496 [inline]
softirqs last disabled at (4986953): [<ffffffff8176f0bd>] __irq_exit_rcu+0xed/0x150 kernel/softirq.c:723
Preemption disabled at:
[<0000000000000000>] 0x0
CPU: 0 UID: 0 PID: 16541 Comm: syz-executor Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 __might_resched.cold+0x1ec/0x232 kernel/sched/core.c:8884
 usb_kill_urb+0x8e/0x320 drivers/usb/core/urb.c:705
 usb_tx_block+0x91/0x320 drivers/net/wireless/marvell/libertas/if_usb.c:429
 if_usb_send_fw_pkt.isra.0+0x2e4/0x550 drivers/net/wireless/marvell/libertas/if_usb.c:366
 if_usb_receive_fwload+0x5d3/0x780 drivers/net/wireless/marvell/libertas/if_usb.c:592
 __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
 dummy_timer+0xd85/0x3670 drivers/usb/gadget/udc/dummy_hcd.c:1995
 __run_hrtimer kernel/time/hrtimer.c:1785 [inline]
 __hrtimer_run_queues+0x50e/0xa70 kernel/time/hrtimer.c:1849
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1866
 handle_softirqs+0x1de/0x9d0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0xed/0x150 kernel/softirq.c:723
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
 sysvec_apic_timer_interrupt+0x8f/0xb0 arch/x86/kernel/apic/apic.c:1056
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:__sanitizer_cov_trace_pc+0xb/0x70 kernel/kcov.c:213
Code: 5a 00 be 03 00 00 00 5b e9 e2 26 1a 01 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 65 8b 05 25 16 43 0b <48> 8b 34 24 65 48 8b 15 01 16 43 0b a9 00 01 ff 00 74 1b f6 c4 01
RSP: 0018:ffffc9001495f398 EFLAGS: 00000202
RAX: 0000000080000003 RBX: 00000000001475a1 RCX: ffffffff821a7c7e
RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff88811632ba00
RBP: 0000000000000001 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000008
R13: 0000000000000001 R14: 0000000000000001 R15: 0000000000000000
 rcu_read_unlock_sched include/linux/rcupdate.h:970 [inline]
 pfn_valid include/linux/mmzone.h:2207 [inline]
 page_table_check_set+0x86d/0xa10 mm/page_table_check.c:105
 __page_table_check_ptes_set+0x1db/0x230 mm/page_table_check.c:215
 page_table_check_ptes_set include/linux/page_table_check.h:83 [inline]
 set_ptes include/linux/pgtable.h:413 [inline]
 __copy_present_ptes mm/memory.c:1115 [inline]
 copy_present_ptes+0xcc4/0x4590 mm/memory.c:1194
 copy_pte_range mm/memory.c:1317 [inline]
 copy_pmd_range mm/memory.c:1405 [inline]
 copy_pud_range mm/memory.c:1442 [inline]
 copy_p4d_range mm/memory.c:1466 [inline]
 copy_page_range+0xe45/0x2630 mm/memory.c:1552
 dup_mmap+0xcb9/0x1f30 mm/mmap.c:1841
 dup_mm kernel/fork.c:1530 [inline]
 copy_mm kernel/fork.c:1582 [inline]
 copy_process+0x459f/0x7800 kernel/fork.c:2223
 kernel_clone+0xfc/0x9a0 kernel/fork.c:2654
 __do_sys_clone+0xd9/0x120 kernel/fork.c:2795
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x106/0x7b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3e86fc5212
Code: 89 e7 e8 71 8b f7 ff 45 31 c0 31 d2 31 f6 64 48 8b 04 25 10 00 00 00 bf 11 00 20 01 4c 8d 90 d0 02 00 00 b8 38 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 66 89 c5 85 c0 75 3b 64 48 8b 04 25 10 00 00
RSP: 002b:00007fff99746eb0 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
RAX: ffffffffffffffda RBX: 00007fff99746eb0 RCX: 00007f3e86fc5212
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000001200011
RBP: 00007fff9974703c R08: 0000000000000000 R09: 0000000000000001
R10: 00005555833b67d0 R11: 0000000000000246 R12: 0000000000000000
R13: 00000000000927c0 R14: 0000000000301ae6 R15: 00007fff99747090
 </TASK>
BUG: scheduling while atomic: syz-executor/16541/0x00000104
8 locks held by syz-executor/16541:
 #0: ffffffff898137d0
 (dup_mmap_sem){.+.+}-{0:0}, at: dup_mm kernel/fork.c:1529 [inline]
 (dup_mmap_sem){.+.+}-{0:0}, at: copy_mm kernel/fork.c:1582 [inline]
 (dup_mmap_sem){.+.+}-{0:0}, at: copy_process+0x4594/0x7800 kernel/fork.c:2223
 #1: ffff888114e4cb40 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:554 [inline]
 #1: ffff888114e4cb40 (&mm->mmap_lock){++++}-{4:4}, at: dup_mmap+0x11f/0x1f30 mm/mmap.c:1740
 #2: ffff88811c64b340 (&mm->mmap_lock/1){+.+.}-{4:4}, at: mmap_write_lock_nested include/linux/mmap_lock.h:544 [inline]
 #2: ffff88811c64b340 (&mm->mmap_lock/1){+.+.}-{4:4}, at: dup_mmap+0x1ba/0x1f30 mm/mmap.c:1747
 #3: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
 #3: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:850 [inline]
 #3: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}, at: __pte_offset_map+0x2f/0x300 mm/pgtable-generic.c:288
 #4: ffff8881356161f8 (ptlock_ptr(ptdesc)#2
){+.+.}-{3:3}, at: spin_lock include/linux/spinlock.h:341 [inline]
){+.+.}-{3:3}, at: pte_offset_map_lock+0x10f/0x320 mm/pgtable-generic.c:402
 #5: ffffffff896e05a0 (rcu_read_lock){....}-{1:3}
, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
, at: rcu_read_lock include/linux/rcupdate.h:850 [inline]
, at: __pte_offset_map+0x2f/0x300 mm/pgtable-generic.c:288
 #6: 
ffff88813be78978
 (ptlock_ptr(ptdesc)#2/1){+.+.}-{3:3}
, at: copy_pte_range mm/memory.c:1269 [inline]
, at: copy_pmd_range mm/memory.c:1405 [inline]
, at: copy_pud_range mm/memory.c:1442 [inline]
, at: copy_p4d_range mm/memory.c:1466 [inline]
, at: copy_page_range+0xc75/0x2630 mm/memory.c:1552
 #7: ffffffff896e04e0 (rcu_read_lock_sched
){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
){....}-{1:2}, at: rcu_read_lock_sched include/linux/rcupdate.h:948 [inline]
){....}-{1:2}, at: pfn_valid include/linux/mmzone.h:2197 [inline]
){....}-{1:2}, at: page_table_check_set+0x4f/0xa10 mm/page_table_check.c:105
Modules linked in:
irq event stamp: 4986957
hardirqs last  enabled at (4986956): [<ffffffff876b20b2>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:178 [inline]
hardirqs last  enabled at (4986956): [<ffffffff876b20b2>] _raw_spin_unlock_irqrestore+0x52/0x80 kernel/locking/spinlock.c:194
hardirqs last disabled at (4986957): [<ffffffff876b1dc2>] __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:130 [inline]
hardirqs last disabled at (4986957): [<ffffffff876b1dc2>] _raw_spin_lock_irqsave+0x52/0x60 kernel/locking/spinlock.c:162
softirqs last  enabled at (4986950): [<ffffffff8176f0bd>] __do_softirq kernel/softirq.c:656 [inline]
softirqs last  enabled at (4986950): [<ffffffff8176f0bd>] invoke_softirq kernel/softirq.c:496 [inline]
softirqs last  enabled at (4986950): [<ffffffff8176f0bd>] __irq_exit_rcu+0xed/0x150 kernel/softirq.c:723
softirqs last disabled at (4986953): [<ffffffff8176f0bd>] __do_softirq kernel/softirq.c:656 [inline]
softirqs last disabled at (4986953): [<ffffffff8176f0bd>] invoke_softirq kernel/softirq.c:496 [inline]
softirqs last disabled at (4986953): [<ffffffff8176f0bd>] __irq_exit_rcu+0xed/0x150 kernel/softirq.c:723
Preemption disabled at:
[<0000000000000000>] 0x0
----------------
Code disassembly (best guess):
   0:	5a                   	pop    %rdx
   1:	00 be 03 00 00 00    	add    %bh,0x3(%rsi)
   7:	5b                   	pop    %rbx
   8:	e9 e2 26 1a 01       	jmp    0x11a26ef
   d:	66 90                	xchg   %ax,%ax
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	f3 0f 1e fa          	endbr64
  23:	65 8b 05 25 16 43 0b 	mov    %gs:0xb431625(%rip),%eax        # 0xb43164f
* 2a:	48 8b 34 24          	mov    (%rsp),%rsi <-- trapping instruction
  2e:	65 48 8b 15 01 16 43 	mov    %gs:0xb431601(%rip),%rdx        # 0xb431637
  35:	0b
  36:	a9 00 01 ff 00       	test   $0xff0100,%eax
  3b:	74 1b                	je     0x58
  3d:	f6 c4 01             	test   $0x1,%ah


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

