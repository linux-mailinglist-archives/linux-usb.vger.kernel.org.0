Return-Path: <linux-usb+bounces-17309-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D9E9C03CC
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 12:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB9721F23402
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 11:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351371F4FB5;
	Thu,  7 Nov 2024 11:23:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7F1F4272
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 11:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730978611; cv=none; b=q3RIhHeLryYHc+l2NLX8ZVJm6HWejf2SJfxya0aGIxoGKE7qX7l93bpWEdV5hKmnoYGoOkNLVjhp5/XwXDQiPVVbZo0bMM1EXlb2cl77hbQXQZda6/a/ph7xq9Rov72Iqtgrl4Hs2adIvlnmCBIqpPfHe4bCtNOIzz+hCt/s59E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730978611; c=relaxed/simple;
	bh=s5UT5HgPcntTLBBbulvSef+fdeZb72tgWUD/xLCztAo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DnF7FmKeBR0lgr1NxuAMXI5keRyTz78ExdFnrZPtNgHpn+cc0voaITm5HjGTbv6+YomxPN6ac4hnYX3Tn0C+oWos9vtrAKhlLLgGFiRKVT0eiK70b7w+tjEeRbicxaiOH61WpcsUzIqCHfDAmvUbC0VzJvVfx0q6n2F88yHU5t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a6bf539ceaso16923805ab.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2024 03:23:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730978609; x=1731583409;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tjg0QzqzR4+N7rFXC/w+bcZK/Kgsx/GEUChMY69BWM=;
        b=BPB4ehJQpGNkCeIJZf0M8fSIZDqd4Ea1wVW++AD5vTDImDWGWxFSW7eCp6Vahl+EVB
         aW95ZZOXOpCZ1XhIsnlagC6/vs9citl2jb+k3Soi1/9rtt1cwm6IoyMJkyTwi1iI/3zm
         NnAek7WC3X7yt28i++hUvEmUPHJQwe9vdgVoX91RvkltFexgMha1ZwcW0uYUWyPyD+rJ
         nrPtFdFh3hCfSzpplzvy3df096lh9q6hJGGvtOF5R4rzN8EMTDRochKr0jUb4Qy5tQM5
         Nkl8kLwnR4FnvGCfQ/tzKY78Qw1BDy33/1UTgtOBoSYRRiBQWa5pN7I7gkxVATxkjlXK
         HgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiLCMG2dLJsMLQxc5A4t+nfHkEqWMLBG23GjG0Vo/kk/4vYEQ1rpXo27aRy4hPAhyxJylGfpHyryM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqvZh0TNcmzehqp8Ubij+1EZc2lG1o3EjUYQKdt6Lzqet600UB
	92azNpCyEfycBrm9nyo90vuI286kIKT1CiAMm7Sn374c5XkdChfxXa1ow7Z42AUGi8fRXrovczH
	qL9UzD3f93ne0quqUlKcvf7LaXsjX9/kvETgUYT8SXuLN5iha6V9lIJc=
X-Google-Smtp-Source: AGHT+IEBb61qVJ8a32ByhOLlCFATQK26mCOWDejJTVMGjW06IBcaqVTMYW98KIKIs17VWzsCsz/ZGrRw3ul4M6rkfMRXQ6cw5R+Z
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c56d:0:b0:3a6:c000:4490 with SMTP id
 e9e14a558f8ab-3a6ee2c170fmr6403965ab.1.1730978609535; Thu, 07 Nov 2024
 03:23:29 -0800 (PST)
Date: Thu, 07 Nov 2024 03:23:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <672ca331.050a0220.2dcd8c.0027.GAE@google.com>
Subject: [syzbot] [usb?] KCSAN: data-race in mon_reader_del /
 usb_hcd_submit_urb (4)
From: syzbot <syzbot+c683dd44ac477cf58d36@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7758b206117d Merge tag 'tracefs-v6.12-rc6' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11a8ae30580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8028551073794907
dashboard link: https://syzkaller.appspot.com/bug?extid=c683dd44ac477cf58d36
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1ee9943bd133/disk-7758b206.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9edb15a0c4b5/vmlinux-7758b206.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a602adbca7b6/bzImage-7758b206.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c683dd44ac477cf58d36@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in mon_reader_del / usb_hcd_submit_urb

write to 0xffff8881026af088 of 4 bytes by task 22112 on cpu 1:
 mon_stop drivers/usb/mon/mon_main.c:166 [inline]
 mon_reader_del+0x1bd/0x260 drivers/usb/mon/mon_main.c:73
 mon_bin_release+0x66/0x120 drivers/usb/mon/mon_bin.c:793
 __fput+0x17a/0x6d0 fs/file_table.c:431
 ____fput+0x1c/0x30 fs/file_table.c:459
 task_work_run+0x13a/0x1a0 kernel/task_work.c:239
 exit_task_work include/linux/task_work.h:43 [inline]
 do_exit+0x5dd/0x17f0 kernel/exit.c:939
 do_group_exit+0x102/0x150 kernel/exit.c:1088
 get_signal+0xf2a/0x1070 kernel/signal.c:2917
 arch_do_signal_or_restart+0x95/0x4b0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x59/0x130 kernel/entry/common.c:218
 do_syscall_64+0xd6/0x1c0 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff8881026af088 of 4 bytes by task 5308 on cpu 0:
 usbmon_urb_submit include/linux/usb/hcd.h:723 [inline]
 usb_hcd_submit_urb+0x86/0x1510 drivers/usb/core/hcd.c:1518
 usb_submit_urb+0xa80/0xb70 drivers/usb/core/urb.c:581
 usb_start_wait_urb+0x91/0x190 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x182/0x240 drivers/usb/core/message.c:154
 get_port_status drivers/usb/core/hub.c:604 [inline]
 hub_ext_port_status+0xbf/0x480 drivers/usb/core/hub.c:621
 usb_hub_port_status drivers/usb/core/hub.c:671 [inline]
 port_event drivers/usb/core/hub.c:5714 [inline]
 hub_event+0x538/0x2910 drivers/usb/core/hub.c:5903
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0x483/0x9a0 kernel/workqueue.c:3310
 worker_thread+0x51d/0x6f0 kernel/workqueue.c:3391
 kthread+0x1d1/0x210 kernel/kthread.c:389
 ret_from_fork+0x4b/0x60 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

value changed: 0x00000001 -> 0x00000000

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 5308 Comm: kworker/0:4 Tainted: G        W          6.12.0-rc6-syzkaller-00099-g7758b206117d #0
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Workqueue: usb_hub_wq hub_event
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

