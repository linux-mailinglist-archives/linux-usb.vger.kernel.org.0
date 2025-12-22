Return-Path: <linux-usb+bounces-31664-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99696CD48A7
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 03:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D6933007FEF
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 02:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF8E23536B;
	Mon, 22 Dec 2025 02:03:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3B1A9FBA
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 02:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766369001; cv=none; b=QoaB566PhXe/23IwHfvfh5Ql6aSf4i5Wi+HMUZHIZCpLgL+MITxUurGCGAmHA2SIuJeLaysXIxzfZox6Jvexvaj9LWceGh0D7FmEqPbhWIQSeA9CAFeqrJVNQadMDcfZceo6leH0moKs1ZM8arqywBpdm+CFxiaOhBWR9lSQp2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766369001; c=relaxed/simple;
	bh=zFLHPVsuyouv7euXx50X48PlqBjMyVK0xF7LBlb7mtY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=K3BMZr1z5SJNLlUEr2/vw5DQNRlGk20Jc0Zp66ReDQidJjs0jXXTIQUdhbJzvVK4aCDhGOTc2BXT7MHZI/mJWgvA3AmH5jjApjqjFPQtZzO7xoMrh5Gh6UElqGplC2cPiGNSn4zkSy9s5Npg4NzoyM67ZM5oRB8LYPxW3OMvjaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7c7046514a2so2947728a34.0
        for <linux-usb@vger.kernel.org>; Sun, 21 Dec 2025 18:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766368998; x=1766973798;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+JYYZvSjrkEe/jNlzZuvpkQyLHDAD7I3SlH6xTdB/Hc=;
        b=LYqCjhLEhU5jiQRS2fznwN5BxIfDQqvdRQyWsBXc1ED5dtQpcjyFGK+y8avwTYJnJW
         E0U7OR2tPiCo1ZW0VzxNQlpjp7SJwFecX5rsxSfsTDrSn8SDS4VhijvwgaTof1xd3ShZ
         sDy6kkgylkkzRLpFNmX8aqounkyTj4KXzLAVyFq/y7GV87NH43wKJYhRBePArNZ1sXNt
         ZeUgBUOsjC8KJsgWWjBJs9Hf8zf1wLF4gMt1XZpZ+05HWGMSJSByGly2c7Jm2YfcKje6
         FD3Gu31WqoKyXt0kj1TWsWbRVOEuWh3d3vsTUtjmiLiaCiar8YAVuOoIDXFdtjBEPuk5
         oU1g==
X-Forwarded-Encrypted: i=1; AJvYcCVYDLE/lV8oYIHGICxMyHOx7r74jtaMcCowsLuNUenDhXm1tc1M1DJDsaM2V0pGsRxhI7qS3kLKR3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb+l8CayUPMlOjrv/dRXEtCRxdgDc0JV1WlmyF1L/W+ybHRAUm
	7x+yupMbF3cYT4Ot4BeHjwO8A2MoeuTKdotc3VdGpXBtFL9f8JYi1gkY2kVy6LMOa0SDmrA0MV2
	lGLhiX+twRweGQ+EOYMXMbxH+QdHnD9ecQldaJzDDPy+fLOm31gP1B37vBTo=
X-Google-Smtp-Source: AGHT+IG0txET1iA/h1g100dPSFyT7mNTVQTMpXbzrrZ3c/UhoIx8feFMKCpJQ1scE+E6yb5kztvKdlAWIOupDu0XLDpjCekam1zG
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:162a:b0:659:9a49:8e0d with SMTP id
 006d021491bc7-65d0ec0cb4fmr4630951eaf.79.1766368998352; Sun, 21 Dec 2025
 18:03:18 -0800 (PST)
Date: Sun, 21 Dec 2025 18:03:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6948a6e6.050a0220.1b4e0c.002e.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in vhci_tx_loop
From: syzbot <syzbot+549021d06a2b557303bd@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ea1013c15392 Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17d0977c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1f2b6fe1fdf1a00b
dashboard link: https://syzkaller.appspot.com/bug?extid=549021d06a2b557303bd
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dd818bf7bc64/disk-ea1013c1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/711f86610a41/vmlinux-ea1013c1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/023de520c887/bzImage-ea1013c1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+549021d06a2b557303bd@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in vhci_send_cmd_submit drivers/usb/usbip/vhci_tx.c:69 [inline]
BUG: KASAN: slab-use-after-free in vhci_tx_loop+0x38e/0x1a80 drivers/usb/usbip/vhci_tx.c:241
Read of size 8 at addr ffff888033c85fa0 by task vhci_tx/11778

CPU: 0 UID: 0 PID: 11778 Comm: vhci_tx Tainted: G             L      syzkaller #0 PREEMPT_{RT,(full)} 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 vhci_send_cmd_submit drivers/usb/usbip/vhci_tx.c:69 [inline]
 vhci_tx_loop+0x38e/0x1a80 drivers/usb/usbip/vhci_tx.c:241
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>

Allocated by task 6078:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:397 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:414
 kasan_kmalloc include/linux/kasan.h:262 [inline]
 __kmalloc_cache_noprof+0x1fb/0x6d0 mm/slub.c:5776
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 vhci_tx_urb drivers/usb/usbip/vhci_hcd.c:674 [inline]
 vhci_urb_enqueue+0x5cd/0xe30 drivers/usb/usbip/vhci_hcd.c:829
 usb_hcd_submit_urb+0x323/0x1b60 drivers/usb/core/hcd.c:1546
 usb_start_wait_urb+0x115/0x4f0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 get_bMaxPacketSize0 drivers/usb/core/hub.c:4851 [inline]
 hub_port_init+0xb1d/0x28d0 drivers/usb/core/hub.c:5047
 hub_port_connect drivers/usb/core/hub.c:5496 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x25b3/0x4f30 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3257 [inline]
 process_scheduled_works+0xad1/0x1770 kernel/workqueue.c:3340
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3421
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

Freed by task 11777:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2540 [inline]
 slab_free mm/slub.c:6668 [inline]
 kfree+0x1bd/0x900 mm/slub.c:6876
 pickup_urb_and_free_priv+0x225/0x400 drivers/usb/usbip/vhci_rx.c:46
 vhci_recv_ret_submit drivers/usb/usbip/vhci_rx.c:65 [inline]
 vhci_rx_pdu drivers/usb/usbip/vhci_rx.c:242 [inline]
 vhci_rx_loop+0x39f/0x9d0 drivers/usb/usbip/vhci_rx.c:265
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

The buggy address belongs to the object at ffff888033c85f80
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 32 bytes inside of
 freed 64-byte region [ffff888033c85f80, ffff888033c85fc0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x33c85
flags: 0x80000000000000(node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000000 ffff88813ff268c0 ffffea0000cc9bc0 dead000000000004
raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 5153, tgid 5153 (start-stop-daem), ts 24440846967, free_ts 22870254625
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x234/0x290 mm/page_alloc.c:1846
 prep_new_page mm/page_alloc.c:1854 [inline]
 get_page_from_freelist+0x28c0/0x2960 mm/page_alloc.c:3915
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5210
 alloc_pages_mpol+0xd1/0x380 mm/mempolicy.c:2486
 alloc_slab_page mm/slub.c:3075 [inline]
 allocate_slab+0x86/0x3b0 mm/slub.c:3248
 new_slab mm/slub.c:3302 [inline]
 ___slab_alloc+0xb10/0x1400 mm/slub.c:4656
 __slab_alloc+0xc6/0x1f0 mm/slub.c:4779
 __slab_alloc_node mm/slub.c:4855 [inline]
 slab_alloc_node mm/slub.c:5251 [inline]
 __do_kmalloc_node mm/slub.c:5656 [inline]
 __kmalloc_noprof+0x15f/0x7e0 mm/slub.c:5669
 kmalloc_noprof include/linux/slab.h:961 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 tomoyo_encode2 security/tomoyo/realpath.c:45 [inline]
 tomoyo_encode+0x28b/0x550 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x58d/0x5d0 security/tomoyo/realpath.c:283
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x213/0x4b0 security/tomoyo/file.c:822
 security_inode_getattr+0x12f/0x330 security/security.c:1869
 vfs_getattr fs/stat.c:259 [inline]
 vfs_fstat fs/stat.c:281 [inline]
 __do_sys_newfstat fs/stat.c:555 [inline]
 __se_sys_newfstat fs/stat.c:550 [inline]
 __x64_sys_newfstat+0xfc/0x200 fs/stat.c:550
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 1 tgid 1 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0xfe1/0x1170 mm/page_alloc.c:2943
 kasan_depopulate_vmalloc_pte+0x6d/0x90 mm/kasan/shadow.c:484
 apply_to_pte_range mm/memory.c:3182 [inline]
 apply_to_pmd_range mm/memory.c:3226 [inline]
 apply_to_pud_range mm/memory.c:3262 [inline]
 apply_to_p4d_range mm/memory.c:3298 [inline]
 __apply_to_page_range+0xb66/0x13d0 mm/memory.c:3334
 __kasan_release_vmalloc+0xa2/0xd0 mm/kasan/shadow.c:602
 kasan_release_vmalloc include/linux/kasan.h:592 [inline]
 kasan_release_vmalloc_node mm/vmalloc.c:2282 [inline]
 purge_vmap_node+0x214/0x8d0 mm/vmalloc.c:2299
 __purge_vmap_area_lazy+0x77a/0xb00 mm/vmalloc.c:2389
 _vm_unmap_aliases+0x718/0x7b0 mm/vmalloc.c:2983
 change_page_attr_set_clr+0x308/0xfb0 arch/x86/mm/pat/set_memory.c:2082
 change_page_attr_set arch/x86/mm/pat/set_memory.c:2123 [inline]
 set_memory_nx+0xd6/0x110 arch/x86/mm/pat/set_memory.c:2312
 free_init_pages arch/x86/mm/init.c:934 [inline]
 free_kernel_image_pages+0x85/0x100 arch/x86/mm/init.c:953
 kernel_init+0x31/0x1d0 init/main.c:1587
 ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

Memory state around the buggy address:
 ffff888033c85e80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888033c85f00: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
>ffff888033c85f80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                               ^
 ffff888033c86000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888033c86080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


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

