Return-Path: <linux-usb+bounces-32665-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFVKOntGdGnX4AAAu9opvQ
	(envelope-from <linux-usb+bounces-32665-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 05:11:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A677C719
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 05:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0999301442B
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 04:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB8025771;
	Sat, 24 Jan 2026 04:11:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B432F2AF1B
	for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 04:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769227895; cv=none; b=C8ERItJWtF4g3Ca2BTmgPA6ge+4/8FzR8cYDiKR9gfklCO5VGNQgM0OE1UkX0t5+V+8tk1wtXpy7ZL5xLxLPzo1Xj46R4Z+7R3e9VlUdd05VRQ8R4NMZmLIwBJ2X5lVPNUN9X7dIAvCZq3xi4ld8Ui7ybkpR3fl7Y4GwbGPPIeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769227895; c=relaxed/simple;
	bh=AogT48jOEJimrMGNVhJmVsrfrH8qGpLSAuWUxnvbXJw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pG6rAEV5KPb4fqhTc6KGJEEVPCmlyrH9NjOfk/BWaBgrrBBGZTZ2QuENHkELT+0oL9FMv6A1LI284xzBrgfp+Qy45MbLaDcDQ+43QwCNrIK2lVxc7Nf9p0yDXiaYanUdNwa37TI6ZCc9Fugv/91Rih47/ldRTZR0GY/EJp3gw4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-661094d05b7so3860293eaf.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 20:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769227892; x=1769832692;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nsT63nLQm2Jr6krI7kAWzNYUHErBII77jzazaIWNoJM=;
        b=TBW9zaCc3C6XI2dqpYTJB8uby9Cs13YpW/p+Kes+hDiRD30lvRriPjgtX898v+/IW3
         89ddn3KayLJ3QLo8imIMqRRxJTcY53AfnIFGqhE0XPy7VCuQbzHcFa5zzGKu5Gik4h36
         CR2yO61/JwggQgBpmdXupnWib2CElWmaWtasWiAywciHGL6GHO+VvsewPFkm776I7U0t
         +RxLfSS1fLREgkKEEpAL5XiH3vwpb/NwVitTD2adHLPf6nk8XKJiJCgxp5UB+d2Kzcaj
         8VD5WIR0H4SuyndmBKxbLAdW/Za0aecUYt9xBct6eRnh9HyscGUwmUnqmENeROnJXAnn
         61zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKS+gah0AUUr5u07CdKeknd40WJ713bsr8r1ULZMtqSw6biAqdaSttYk0HcsaxhCiYwauLX7uPKbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp4iXZ1mmJv+6YLs8JyUjflUTB75L9kLP0x5NztXTm8MX1YsPl
	ToAfgx4BLb0u8m9uUDdoKSXEtx0z3MX91AVpo5wxhhAD/B30+Buu7BRY9hJEzM/0n6PneZ7RKTJ
	A+F+ZKnLqNByJM1X1VTngTr1dfwzBb2XKSo4u+sulPq+uqiq8gJbW2MrU5Hw=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2911:b0:65f:19:9621 with SMTP id
 006d021491bc7-662cab02016mr2478641eaf.25.1769227892734; Fri, 23 Jan 2026
 20:11:32 -0800 (PST)
Date: Fri, 23 Jan 2026 20:11:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69744674.a00a0220.33ccc7.0000.GAE@google.com>
Subject: [syzbot] [lsm?] [input?] [usb?] memory leak in prepare_creds (6)
From: syzbot <syzbot+dd3b43aa0204089217ee@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, sergeh@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=9d7d0fbecb37bff8];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32665-lists,linux-usb=lfdr.de,dd3b43aa0204089217ee];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,storage.googleapis.com:url,appspotmail.com:email]
X-Rspamd-Queue-Id: 35A677C719
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    6c790212c588 Merge tag 'devicetree-fixes-for-6.19-3' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16019d22580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d7d0fbecb37bff8
dashboard link: https://syzkaller.appspot.com/bug?extid=dd3b43aa0204089217ee
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=117a579a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=118ef852580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1ceba1c1c7bd/disk-6c790212.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d83b71fd8384/vmlinux-6c790212.xz
kernel image: https://storage.googleapis.com/syzbot-assets/07ef6040f444/bzImage-6c790212.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dd3b43aa0204089217ee@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888108b89480 (size 184):
  comm "syz-executor", pid 5994, jiffies 4294943386
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 369454a7):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    kmem_cache_alloc_noprof+0x412/0x580 mm/slub.c:5270
    prepare_creds+0x22/0x600 kernel/cred.c:185
    copy_creds+0x44/0x290 kernel/cred.c:286
    copy_process+0x7a7/0x2870 kernel/fork.c:2086
    kernel_clone+0xac/0x6e0 kernel/fork.c:2651
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2792
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881032ee1a0 (size 32):
  comm "syz-executor", pid 5994, jiffies 4294943386
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    f8 52 86 00 81 88 ff ff 00 00 00 00 00 00 00 00  .R..............
  backtrace (crc 336e1c5f):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_noprof+0x465/0x680 mm/slub.c:5669
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    lsm_blob_alloc+0x4d/0x80 security/security.c:192
    lsm_cred_alloc security/security.c:209 [inline]
    security_prepare_creds+0x2d/0x290 security/security.c:2763
    prepare_creds+0x395/0x600 kernel/cred.c:215
    copy_creds+0x44/0x290 kernel/cred.c:286
    copy_process+0x7a7/0x2870 kernel/fork.c:2086
    kernel_clone+0xac/0x6e0 kernel/fork.c:2651
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2792
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888108b89540 (size 184):
  comm "syz-executor", pid 5994, jiffies 4294943447
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 17b2a574):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    kmem_cache_alloc_noprof+0x412/0x580 mm/slub.c:5270
    prepare_creds+0x22/0x600 kernel/cred.c:185
    copy_creds+0x44/0x290 kernel/cred.c:286
    copy_process+0x7a7/0x2870 kernel/fork.c:2086
    kernel_clone+0xac/0x6e0 kernel/fork.c:2651
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2792
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881032eee80 (size 32):
  comm "syz-executor", pid 5994, jiffies 4294943447
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    f8 52 86 00 81 88 ff ff 00 00 00 00 00 00 00 00  .R..............
  backtrace (crc 336e1c5f):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_noprof+0x465/0x680 mm/slub.c:5669
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    lsm_blob_alloc+0x4d/0x80 security/security.c:192
    lsm_cred_alloc security/security.c:209 [inline]
    security_prepare_creds+0x2d/0x290 security/security.c:2763
    prepare_creds+0x395/0x600 kernel/cred.c:215
    copy_creds+0x44/0x290 kernel/cred.c:286
    copy_process+0x7a7/0x2870 kernel/fork.c:2086
    kernel_clone+0xac/0x6e0 kernel/fork.c:2651
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2792
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888109bf16c0 (size 184):
  comm "syz-executor", pid 5994, jiffies 4294943507
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc a1f2f9ed):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    kmem_cache_alloc_noprof+0x412/0x580 mm/slub.c:5270
    prepare_creds+0x22/0x600 kernel/cred.c:185
    copy_creds+0x44/0x290 kernel/cred.c:286
    copy_process+0x7a7/0x2870 kernel/fork.c:2086
    kernel_clone+0xac/0x6e0 kernel/fork.c:2651
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2792
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888109151e00 (size 32):
  comm "syz-executor", pid 5994, jiffies 4294943507
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    f8 52 86 00 81 88 ff ff 00 00 00 00 00 00 00 00  .R..............
  backtrace (crc 336e1c5f):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_noprof+0x465/0x680 mm/slub.c:5669
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    lsm_blob_alloc+0x4d/0x80 security/security.c:192
    lsm_cred_alloc security/security.c:209 [inline]
    security_prepare_creds+0x2d/0x290 security/security.c:2763
    prepare_creds+0x395/0x600 kernel/cred.c:215
    copy_creds+0x44/0x290 kernel/cred.c:286
    copy_process+0x7a7/0x2870 kernel/fork.c:2086
    kernel_clone+0xac/0x6e0 kernel/fork.c:2651
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2792
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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

