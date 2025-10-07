Return-Path: <linux-usb+bounces-28957-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3B5BC01A7
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 05:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4637C189C101
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 03:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC5F1DF271;
	Tue,  7 Oct 2025 03:33:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC841BC41
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 03:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759808010; cv=none; b=MBxtSZoyt/MG7VFDNZbCwbn/9bKoWJWiFm43MLB7fkwMJ3zvx4TZ+3RdCpP/4vDy0656koNRbxmFqiF/4lnzg3kQ2yRRfJEkCmsOxdEJMEuOS86oYUhb1/hIQDEuMxEuiV35y+jbkWcAYbpgPq0GXnuUdd3UWCuAk2PCJVwZMR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759808010; c=relaxed/simple;
	bh=Qo152Ck+YxuMOkvgcNAkaVmRHYF98a6hzVfseUr0S40=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UeDsGgqPJor/Z8qMIq2gJAzbNxlkW8d7AQRjUCsFpn/tnOCIRoLN1l9vnnBTOy+ugxajIkGDlKlwke8peccpz0X0XGT2rWUcEmZ9xuAaADpOQgldhn3iXLPl8nygVZzmKEGYgm8evMZTQBNW2nJC0TNz+zB4xg538udsNWkd3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-42f67904af6so7506945ab.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 20:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759808007; x=1760412807;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=952owU/EqtMgqLf+gZ7Jn7cvNDb68sFa+jvCW3cWFcw=;
        b=hxyKT4kp98nDY/hvKT+1MwaXqi8yAvBYq1BrtF7Nh4VpN42+XoTft19AnNyATAH++I
         iooN+9oESJY1CUxaJXQjyv42YeZJn+T/Ug3L9wjbRf39tlEyYC2VAfu/QuaUX6P0dPJV
         uld+oxko4PjF7FMLQusmYUUE5FkxsHkKJJggNCa/hcFgou4BG5GR0fl/hVfaZBiwCb6J
         gFX1Yw56eNIur3ADXAXFeNLcS4B+wvTNMw+U+6iQDsHNSIdtNoaXbvjvxfDZzTDVRgFE
         bS0nM3XOJORMOOLlgabh9vhZAi+xJFaZL/AlllN+JmSwfouc+smd6w3uFpl3XAQz29d1
         mZkA==
X-Forwarded-Encrypted: i=1; AJvYcCXVNadcyH+2xlfBQY80BxU84swQINA4wWY8DOtkqY+14GZ+DwLfXrua8huLQYi74ern5zFQCSwuUiU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Tzj+MtsxMijpSWo664ruasVFxbGZlnPhH6F4om6j0+P7nsZw
	VYaWrTNTdiqFM3t68okbBDKLlxfzDdg8/JM/oLC5EQ8rYQSshxjImnepPix4ds9Y/tBS+JbGTx9
	8Bu/mgIGu6wHeLJHAYrTYJ9zx7Z2o4gwN32V8l6otn1MW/Vse1UjbzFszMME=
X-Google-Smtp-Source: AGHT+IHQ10nqe4mSpqPwa3nNHorUsWgHZKJ2FqxJQeZOaMmqnrsm53K08Tu0e1xbDfvom7tMXDbULT8NHg7BXiVrLem8dRi8ZQ8j
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:156f:b0:423:feda:f14f with SMTP id
 e9e14a558f8ab-42e7ad018aemr243117805ab.12.1759808007446; Mon, 06 Oct 2025
 20:33:27 -0700 (PDT)
Date: Mon, 06 Oct 2025 20:33:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68e48a07.050a0220.256323.0014.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: vmalloc-out-of-bounds Read in kcov_remote_stop
From: syzbot <syzbot+90984d3713722683112e@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fd94619c4336 Merge tag 'zonefs-6.18-rc1' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15c381e2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2b03b8b7809165e
dashboard link: https://syzkaller.appspot.com/bug?extid=90984d3713722683112e
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/201636e25a0b/disk-fd94619c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b63e3832240c/vmlinux-fd94619c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/11fc378734e8/bzImage-fd94619c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+90984d3713722683112e@syzkaller.appspotmail.com

usb 5-1: config 0 descriptor??
appletouch 5-1:0.85: Failed to read mode from device.
appletouch 5-1:0.85: probe with driver appletouch failed with error -5
usb 5-1: USB disconnect, device number 31
==================================================================
BUG: KASAN: vmalloc-out-of-bounds in __list_add_valid_or_report+0x4e/0x130 lib/list_debug.c:29
Read of size 8 at addr ffffc9000ffa1008 by task kworker/1:1/44

CPU: 1 UID: 0 PID: 44 Comm: kworker/1:1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/18/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 __list_add_valid_or_report+0x4e/0x130 lib/list_debug.c:29
 __list_add_valid include/linux/list.h:96 [inline]
 __list_add include/linux/list.h:158 [inline]
 list_add include/linux/list.h:177 [inline]
 kcov_remote_area_put kernel/kcov.c:156 [inline]
 kcov_remote_stop+0x52d/0x660 kernel/kcov.c:1060
 hub_event+0x45d2/0x4a20 drivers/usb/core/hub.c:5997
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x439/0x7d0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

The buggy address belongs to a vmalloc virtual mapping
Memory state around the buggy address:
 ffffc9000ffa0f00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc9000ffa0f80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>ffffc9000ffa1000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                      ^
 ffffc9000ffa1080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc9000ffa1100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
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

