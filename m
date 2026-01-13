Return-Path: <linux-usb+bounces-32208-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92262D162C5
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 02:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 020E3303E654
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 01:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83D7267B89;
	Tue, 13 Jan 2026 01:31:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AED231829
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 01:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267889; cv=none; b=fO/I7NhnUuz43nHYh49qBo84SCXXFumPGa6Weqac8rof5+ECToT+IxYZEtRaexJFgvLR0rLt1kd4Y4M3f1+ouXci822k6B9k8BX0VSSX5lSUPJqNKPVkFIblvXOKS5EewNNka6JVk8SWZseMylRVA7RYFimdHHiBF8NNVhzgNz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267889; c=relaxed/simple;
	bh=cPVbCRsG+VL1amT8hkAv3uVf0J6xRYlfmnvinHj36+s=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=O4LG9Nfi+Bvhzbxn4ltsAlfj5ke8ZvSQ+tyGYYQhUAOWK+gxCk2R7lTq5Qab8P190q+h84kMtc3DgMYZDAuQyD6ZQ06nI+7WxNsbV01DR1DQ+AZAOJlyt0nN4qdhYbyRd1vMfmrOe3pwhtkWdkvIn/TkfW5uXXKAad4+HtTZ3g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7c7095cf155so9232198a34.2
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 17:31:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267886; x=1768872686;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gYBkkU3AJSxZp/vIRemJ1L0TH34Mn0KY8QJUgedjP10=;
        b=typvQX4JDkoeyKFVfdE3dZGXFo5mjL6yIh3IoIJClDCo1ODbztZtpHYZEqV12kvwN6
         ePMHh+tbxYjP5WUbLCK9FiUrFW4PVefpU8o+z4F+HBpdbZduCRlpgDqhsqdBDNeSXtY3
         yEhWXyLYi2C3XOv1n70SIVyN2WOeG8YlzMMQ0OsqLxKJ+sOwGE6FgkrlXnQpWvylsBBh
         c4RD/gUStw33juvP2ejFhQTMMuzr5dmO/MjkF20J3uFbaYwLQb3uEOdIuYTUXbWVnVSj
         sCmMhn2zSTxRBh6lMwjfir1LFfW9+1Ry/hYj/4cqjAbqICyjBXRgdfG25KwpcMUuhYCy
         TAmg==
X-Forwarded-Encrypted: i=1; AJvYcCWUuhq0Mcg16Ohm76WnoSGp+Uq8ysBxwovnReNYx7U1qD2IMGCK8dsdbJWPxuhdWyl4MHiQ5QJHkLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4G6EMbkDmZybClXKzWvcP8sFAhLPVL/L3qcg6YRyVQhXsYTfN
	QOk2Wezy7/JghFPtFZGlq+d/qACnZ7rTDaPgyBMut4p/u1U+yGDB08+HUviPZwkeKvTw8CFl2Jd
	lgx3NIB8L+rJrMam1zNTeRqWvGqkqHn7RG/DjpdaM5aspTa/Ti7f/DIoINVM=
X-Google-Smtp-Source: AGHT+IFVjlNzr7zWnEOxwwrZ2e6Lvnq7szNDSPoVQa9zxV+B3VSjEdEh9G2553Ewf2B6+jtIZ+sEsI9smb4fivoJJsFEbFF0rLH1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c31c:b0:65f:6601:b367 with SMTP id
 006d021491bc7-65f6601cb2dmr4074241eaf.74.1768267886315; Mon, 12 Jan 2026
 17:31:26 -0800 (PST)
Date: Mon, 12 Jan 2026 17:31:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6965a06e.050a0220.38aacd.0004.GAE@google.com>
Subject: [syzbot] [sound?] [usb?] KASAN: slab-out-of-bounds Write in
 copy_to_urb (2)
From: syzbot <syzbot+6db0415d6d5c635f72cb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
	tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    54e82e93ca93 Merge tag 'core_urgent_for_v6.19_rc4' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17467f92580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=513255d80ab78f2b
dashboard link: https://syzkaller.appspot.com/bug?extid=6db0415d6d5c635f72cb
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17e4d922580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10c67f92580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-54e82e93.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f3befb5f53a4/vmlinux-54e82e93.xz
kernel image: https://storage.googleapis.com/syzbot-assets/92820ca1dbd8/bzImage-54e82e93.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6db0415d6d5c635f72cb@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in copy_to_urb+0x261/0x460 sound/usb/pcm.c:1487
Write of size 264 at addr ffff88804337e800 by task syz.0.17/5506

CPU: 0 UID: 0 PID: 5506 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:200
 __asan_memcpy+0x40/0x70 mm/kasan/shadow.c:106
 copy_to_urb+0x261/0x460 sound/usb/pcm.c:1487
 prepare_playback_urb+0x953/0x13d0 sound/usb/pcm.c:1611
 prepare_outbound_urb+0x377/0xc50 sound/usb/endpoint.c:333
 snd_usb_endpoint_start+0x4db/0x1530 sound/usb/endpoint.c:1596
 start_endpoints+0xa1/0x280 sound/usb/pcm.c:291
 snd_usb_substream_playback_trigger+0x3e0/0x830 sound/usb/pcm.c:1711
 snd_pcm_do_start+0xb7/0x180 sound/core/pcm_native.c:1454
 snd_pcm_action_single sound/core/pcm_native.c:1310 [inline]
 snd_pcm_action+0xe7/0x240 sound/core/pcm_native.c:1393
 __snd_pcm_lib_xfer+0x1762/0x1d00 sound/core/pcm_lib.c:2405
 snd_pcm_oss_write3+0x1bc/0x350 sound/core/oss/pcm_oss.c:1241
 snd_pcm_plug_write_transfer+0x2cb/0x4c0 sound/core/oss/pcm_plugin.c:630
 snd_pcm_oss_write2 sound/core/oss/pcm_oss.c:1373 [inline]
 snd_pcm_oss_write1 sound/core/oss/pcm_oss.c:1439 [inline]
 snd_pcm_oss_write+0xa2b/0xf20 sound/core/oss/pcm_oss.c:2794
 vfs_write+0x27e/0xb30 fs/read_write.c:684
 ksys_write+0x145/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8ffad8f7c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe0de78008 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f8ffafe5fa0 RCX: 00007f8ffad8f7c9
RDX: 00000000000005ce RSI: 0000200000000600 RDI: 0000000000000004
RBP: 00007f8ffae13f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f8ffafe5fa0 R14: 00007f8ffafe5fa0 R15: 0000000000000003
 </TASK>

Allocated by task 5506:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5657 [inline]
 __kmalloc_noprof+0x41d/0x800 mm/slub.c:5669
 data_ep_set_params sound/usb/endpoint.c:1242 [inline]
 snd_usb_endpoint_set_params+0x1741/0x2f10 sound/usb/endpoint.c:1379
 snd_usb_hw_params+0xb12/0x12e0 sound/usb/pcm.c:576
 snd_pcm_hw_params+0x89d/0x1d30 sound/core/pcm_native.c:804
 snd_pcm_oss_change_params_locked+0x21cd/0x3f70 sound/core/oss/pcm_oss.c:965
 snd_pcm_oss_make_ready_locked+0x7d/0x300 sound/core/oss/pcm_oss.c:1186
 snd_pcm_oss_write1 sound/core/oss/pcm_oss.c:1404 [inline]
 snd_pcm_oss_write+0x281/0xf20 sound/core/oss/pcm_oss.c:2794
 vfs_write+0x27e/0xb30 fs/read_write.c:684
 ksys_write+0x145/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88804337e800
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 0 bytes inside of
 allocated 240-byte region [ffff88804337e800, ffff88804337e8f0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4337e
ksm flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000000 ffff88801a441b40 ffffea000158d7c0 dead000000000003
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 5368, tgid 5368 (syz-executor), ts 97563098162, free_ts 97561893679
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x234/0x290 mm/page_alloc.c:1857
 prep_new_page mm/page_alloc.c:1865 [inline]
 get_page_from_freelist+0x24e0/0x2580 mm/page_alloc.c:3915
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5210
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2486
 alloc_slab_page mm/slub.c:3075 [inline]
 allocate_slab+0x86/0x3b0 mm/slub.c:3248
 new_slab mm/slub.c:3302 [inline]
 ___slab_alloc+0xe53/0x1820 mm/slub.c:4656
 __slab_alloc+0x65/0x100 mm/slub.c:4779
 __slab_alloc_node mm/slub.c:4855 [inline]
 slab_alloc_node mm/slub.c:5251 [inline]
 __kmalloc_cache_noprof+0x41e/0x700 mm/slub.c:5771
 kmalloc_noprof include/linux/slab.h:957 [inline]
 tc_action_net_init include/net/act_api.h:162 [inline]
 tunnel_key_init_net+0x65/0x190 net/sched/act_tunnel_key.c:849
 ops_init+0x35c/0x5c0 net/core/net_namespace.c:137
 setup_net+0x110/0x330 net/core/net_namespace.c:446
 copy_net_ns+0x3e3/0x570 net/core/net_namespace.c:581
 create_new_namespaces+0x3e7/0x6a0 kernel/nsproxy.c:130
 unshare_nsproxy_namespaces+0x11c/0x170 kernel/nsproxy.c:226
 ksys_unshare+0x4c8/0x8c0 kernel/fork.c:3171
 __do_sys_unshare kernel/fork.c:3242 [inline]
 __se_sys_unshare kernel/fork.c:3240 [inline]
 __x64_sys_unshare+0x38/0x50 kernel/fork.c:3240
page last free pid 4584 tgid 4584 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0xbc8/0xd30 mm/page_alloc.c:2943
 vfree+0x25a/0x400 mm/vmalloc.c:3466
 __ebt_unregister_table+0x531/0x600 net/bridge/netfilter/ebtables.c:1176
 ops_exit_list net/core/net_namespace.c:199 [inline]
 ops_undo_list+0x49a/0x990 net/core/net_namespace.c:252
 cleanup_net+0x4d8/0x7a0 net/core/net_namespace.c:696
 process_one_work kernel/workqueue.c:3257 [inline]
 process_scheduled_works+0xad1/0x1770 kernel/workqueue.c:3340
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3421
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

Memory state around the buggy address:
 ffff88804337e780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88804337e800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff88804337e880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fc fc
                                                             ^
 ffff88804337e900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88804337e980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

