Return-Path: <linux-usb+bounces-12053-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF492992C
	for <lists+linux-usb@lfdr.de>; Sun,  7 Jul 2024 19:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 085FD1C20A6F
	for <lists+linux-usb@lfdr.de>; Sun,  7 Jul 2024 17:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292615644E;
	Sun,  7 Jul 2024 17:25:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702D3FBA5
	for <linux-usb@vger.kernel.org>; Sun,  7 Jul 2024 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720373119; cv=none; b=W9hOCmOeRZIt9/lVzimo358KHTQmiz0aIVfyoFHrehSEB0PkspmmYH+T4o0yEu0hOMGDhfioAqUuS/hpxEDLdHd+72XdF70VhHWWdVNfcDbL3qCtQ1lAw5e59Tx6bIYu1/O/Gwya1MUbtOt6zjJggV6Cf2OeDSyp+hfVVI8v73s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720373119; c=relaxed/simple;
	bh=hYWc0fnoJfL/S4AxDF/vL9lDRA/n49nxTnKu0Pd8jBU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ty7fmShkO2+WjoLBnpdwinUIeYt2gvmzjwz5S+Ir6YkAoaRBcJbUxbD77Bs4mq2tIAxgTvNaXP0a0KyaJvrA7fTw9Dberd2YPNH23AhIHdJoZYA2ayWVHWW6xi3LLKCeaoqlaNpkP4MwYvaR3GD8Yzm5MCjXvjHSiV9ePykUC1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-38268e4ebfeso42763055ab.1
        for <linux-usb@vger.kernel.org>; Sun, 07 Jul 2024 10:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720373117; x=1720977917;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uN3cimjsesEKu9bosGKjMpRnCpFu7332mLAefsdeDU=;
        b=l7B0GX79dXj4mYk/Oct3uHqU+aH/x4IkreU97L46xqkoeTSbK+U+U2r/UpswQB8FOy
         nzBF+vJH23tgtE7isx9Cg+oEE4PcnVcxvD92MrbkSwvPveSkofthz0CwGRguHpZLfwO/
         FIdNgUUp9SSdZcr58Qc71fawYsXMjPj/MDbCOo4vdNamDSezsDjXLwJfRoxvUDF+OJ+E
         j/v0WXRXTA557swOEfPr8/FJM7ClJr0XFJkHPga5u8sZ9iEqW02KUpPXF1P0VBB459h3
         fnE+y2+zoa1lput+TpsywRal4mxr7PM0xryKfd9Toqes+NpKx2lC47U4CXvNEoa4pJHB
         fiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVL5wIF6uptKvtxl9Ch2v5f9hrkQvY7NwFyx8W8kedoG3hiiqSfdMpQutlRhfaF5a08WheCFGaeN4GZZ8QeQ19V61du85bQvdI
X-Gm-Message-State: AOJu0YyEuJuyPwYzpyNOtK09shfkFc8lTbUL5IF0KtdK3RKSDsaaBVBx
	pUkKLVlOQ2cB8A/5J8Gxs5VYR0uWZSTNd60vCmXxKudMVLxCqqBsitStS8CRNNSy9ptEbkfrEMG
	m5s8f0l6GRBF2iNmsk7+TW6Oo94kW099V14NQ6TkbfBI9BAJEGaYoteE=
X-Google-Smtp-Source: AGHT+IHJspczQjbi5u6WVk8Kla2XnHKlRQt4j/sLjpUiVALsAIXJZDIORmT0ruBLT8rbNqwxN/XocmfrqlVBKVokPExgOmHGk/KH
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:2908:0:b0:376:4523:7ab1 with SMTP id
 e9e14a558f8ab-38398fd1e99mr1428115ab.2.1720373117164; Sun, 07 Jul 2024
 10:25:17 -0700 (PDT)
Date: Sun, 07 Jul 2024 10:25:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000087b507061cab9490@google.com>
Subject: [syzbot] [pm?] [usb?] possible deadlock in dpm_for_each_dev
From: syzbot <syzbot+2a03726f1d4eff48b278@syzkaller.appspotmail.com>
To: len.brown@intel.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, pavel@ucw.cz, 
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e9d22f7a6655 Merge tag 'linux_kselftest-fixes-6.10-rc7' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13fff269980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=864caee5f78cab51
dashboard link: https://syzkaller.appspot.com/bug?extid=2a03726f1d4eff48b278
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17013a35980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16d7af25980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c3dd72a93425/disk-e9d22f7a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9d79986da9dc/vmlinux-e9d22f7a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0df271bec574/bzImage-e9d22f7a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2a03726f1d4eff48b278@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000246 R12: 00007fb90b6ce6c0
R13: 00007fb90b60f210 R14: 0000000000000001 R15: 616e732f7665642f
 </TASK>
(NULL device *): loading /lib/firmware/dvb-usb-dib0700-1.20.fw failed with error -12
(NULL device *): Direct firmware load for dvb-usb-dib0700-1.20.fw failed with error -12
(NULL device *): Falling back to sysfs fallback for: dvb-usb-dib0700-1.20.fw
======================================================
WARNING: possible circular locking dependency detected
6.10.0-rc6-syzkaller-00061-ge9d22f7a6655 #0 Not tainted
------------------------------------------------------
syz-executor143/5112 is trying to acquire lock:
ffffffff8e1dd7b0 (umhelper_sem){++++}-{3:3}, at: usermodehelper_read_trylock+0x140/0x300 kernel/umh.c:215

but task is already holding lock:
ffffffff8ec6ea08 (dpm_list_mtx){+.+.}-{3:3}, at: device_pm_lock drivers/base/power/main.c:113 [inline]
ffffffff8ec6ea08 (dpm_list_mtx){+.+.}-{3:3}, at: dpm_for_each_dev+0x2b/0xc0 drivers/base/power/main.c:1961

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (dpm_list_mtx){+.+.}-{3:3}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
       __mutex_lock_common kernel/locking/mutex.c:608 [inline]
       __mutex_lock+0x136/0xd70 kernel/locking/mutex.c:752
       device_pm_add+0x78/0x320 drivers/base/power/main.c:137
       device_add+0x5e8/0xbf0 drivers/base/core.c:3642
       fw_load_sysfs_fallback drivers/base/firmware_loader/fallback.c:86 [inline]
       fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:162 [inline]
       firmware_fallback_sysfs+0x307/0x9e0 drivers/base/firmware_loader/fallback.c:238
       _request_firmware+0xcf5/0x12b0 drivers/base/firmware_loader/main.c:914
       request_firmware_work_func+0x12a/0x280 drivers/base/firmware_loader/main.c:1165
       process_one_work kernel/workqueue.c:3248 [inline]
       process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3329
       worker_thread+0x86d/0xd50 kernel/workqueue.c:3409
       kthread+0x2f0/0x390 kernel/kthread.c:389
       ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

-> #0 (umhelper_sem){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3134 [inline]
       check_prevs_add kernel/locking/lockdep.c:3253 [inline]
       validate_chain+0x18e0/0x5900 kernel/locking/lockdep.c:3869
       __lock_acquire+0x1346/0x1fd0 kernel/locking/lockdep.c:5137
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
       down_read+0xb1/0xa40 kernel/locking/rwsem.c:1526
       usermodehelper_read_trylock+0x140/0x300 kernel/umh.c:215
       fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:147 [inline]
       firmware_fallback_sysfs+0x184/0x9e0 drivers/base/firmware_loader/fallback.c:238
       _request_firmware+0xcf5/0x12b0 drivers/base/firmware_loader/main.c:914
       request_firmware drivers/base/firmware_loader/main.c:963 [inline]
       cache_firmware drivers/base/firmware_loader/main.c:1265 [inline]
       __async_dev_cache_fw_image+0xe7/0x320 drivers/base/firmware_loader/main.c:1379
       async_schedule_node_domain+0xdc/0x110 kernel/async.c:221
       async_schedule_domain include/linux/async.h:72 [inline]
       dev_cache_fw_image+0x36d/0x3e0 drivers/base/firmware_loader/main.c:1435
       dpm_for_each_dev+0x58/0xc0 drivers/base/power/main.c:1963
       device_cache_fw_images drivers/base/firmware_loader/main.c:1485 [inline]
       fw_pm_notify+0x24a/0x2f0 drivers/base/firmware_loader/main.c:1536
       notifier_call_chain+0x19f/0x3e0 kernel/notifier.c:93
       notifier_call_chain_robust kernel/notifier.c:128 [inline]
       blocking_notifier_call_chain_robust+0xe8/0x1e0 kernel/notifier.c:353
       pm_notifier_call_chain_robust+0x2c/0x60 kernel/power/main.c:102
       snapshot_open+0x1a1/0x280 kernel/power/user.c:77
       misc_open+0x313/0x390 drivers/char/misc.c:165
       chrdev_open+0x5b0/0x630 fs/char_dev.c:414
       do_dentry_open+0x970/0x1450 fs/open.c:955
       vfs_open+0x3e/0x330 fs/open.c:1086
       do_open fs/namei.c:3654 [inline]
       path_openat+0x2c01/0x35f0 fs/namei.c:3813
       do_filp_open+0x235/0x490 fs/namei.c:3840
       do_sys_openat2+0x13e/0x1d0 fs/open.c:1413
       do_sys_open fs/open.c:1428 [inline]
       __do_sys_openat fs/open.c:1444 [inline]
       __se_sys_openat fs/open.c:1439 [inline]
       __x64_sys_openat+0x247/0x2a0 fs/open.c:1439
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(dpm_list_mtx);
                               lock(umhelper_sem);
                               lock(dpm_list_mtx);
  rlock(umhelper_sem);

 *** DEADLOCK ***

5 locks held by syz-executor143/5112:
 #0: ffffffff8eb2f6e8 (misc_mtx){+.+.}-{3:3}, at: misc_open+0x5c/0x390 drivers/char/misc.c:129
 #1: ffffffff8e1e7368 (system_transition_mutex){+.+.}-{3:3}, at: lock_system_sleep+0x60/0xa0 kernel/power/main.c:56
 #2: ffffffff8e2077f0 ((pm_chain_head).rwsem){++++}-{3:3}, at: blocking_notifier_call_chain_robust+0xac/0x1e0 kernel/notifier.c:352
 #3: ffffffff8ec73968 (fw_lock){+.+.}-{3:3}, at: device_cache_fw_images drivers/base/firmware_loader/main.c:1483 [inline]
 #3: ffffffff8ec73968 (fw_lock){+.+.}-{3:3}, at: fw_pm_notify+0x232/0x2f0 drivers/base/firmware_loader/main.c:1536
 #4: ffffffff8ec6ea08 (dpm_list_mtx){+.+.}-{3:3}, at: device_pm_lock drivers/base/power/main.c:113 [inline]
 #4: ffffffff8ec6ea08 (dpm_list_mtx){+.+.}-{3:3}, at: dpm_for_each_dev+0x2b/0xc0 drivers/base/power/main.c:1961

stack backtrace:
CPU: 0 PID: 5112 Comm: syz-executor143 Not tainted 6.10.0-rc6-syzkaller-00061-ge9d22f7a6655 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2187
 check_prev_add kernel/locking/lockdep.c:3134 [inline]
 check_prevs_add kernel/locking/lockdep.c:3253 [inline]
 validate_chain+0x18e0/0x5900 kernel/locking/lockdep.c:3869
 __lock_acquire+0x1346/0x1fd0 kernel/locking/lockdep.c:5137
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
 down_read+0xb1/0xa40 kernel/locking/rwsem.c:1526
 usermodehelper_read_trylock+0x140/0x300 kernel/umh.c:215
 fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:147 [inline]
 firmware_fallback_sysfs+0x184/0x9e0 drivers/base/firmware_loader/fallback.c:238
 _request_firmware+0xcf5/0x12b0 drivers/base/firmware_loader/main.c:914
 request_firmware drivers/base/firmware_loader/main.c:963 [inline]
 cache_firmware drivers/base/firmware_loader/main.c:1265 [inline]
 __async_dev_cache_fw_image+0xe7/0x320 drivers/base/firmware_loader/main.c:1379
 async_schedule_node_domain+0xdc/0x110 kernel/async.c:221
 async_schedule_domain include/linux/async.h:72 [inline]
 dev_cache_fw_image+0x36d/0x3e0 drivers/base/firmware_loader/main.c:1435
 dpm_for_each_dev+0x58/0xc0 drivers/base/power/main.c:1963
 device_cache_fw_images drivers/base/firmware_loader/main.c:1485 [inline]
 fw_pm_notify+0x24a/0x2f0 drivers/base/firmware_loader/main.c:1536
 notifier_call_chain+0x19f/0x3e0 kernel/notifier.c:93
 notifier_call_chain_robust kernel/notifier.c:128 [inline]
 blocking_notifier_call_chain_robust+0xe8/0x1e0 kernel/notifier.c:353
 pm_notifier_call_chain_robust+0x2c/0x60 kernel/power/main.c:102
 snapshot_open+0x1a1/0x280 kernel/power/user.c:77
 misc_open+0x313/0x390 drivers/char/misc.c:165
 chrdev_open+0x5b0/0x630 fs/char_dev.c:414
 do_dentry_open+0x970/0x1450 fs/open.c:955
 vfs_open+0x3e/0x330 fs/open.c:1086
 do_open fs/namei.c:3654 [inline]
 path_openat+0x2c01/0x35f0 fs/namei.c:3813
 do_filp_open+0x235/0x490 fs/namei.c:3840
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1413
 do_sys_open fs/open.c:1428 [inline]
 __do_sys_openat fs/open.c:1444 [inline]
 __se_sys_openat fs/open.c:1439 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1439
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb90b681389
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 1b 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb90b60f208 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fb90b7013f8 RCX: 00007fb90b681389
RDX: 0000000000000000 RSI: 0000000020000080 RDI: ffffffffffffff9c
RBP: 00007fb90b7013f0 R08: 00007fb90b60efa7 R09: 0000000000000038
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fb90b6ce6c0
R13: 00007fb90b60f210 R14: 0000000000000001 R15: 616e732f7665642f
 </TASK>


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

