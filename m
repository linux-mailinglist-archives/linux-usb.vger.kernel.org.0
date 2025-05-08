Return-Path: <linux-usb+bounces-23802-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 067CAAAF60C
	for <lists+linux-usb@lfdr.de>; Thu,  8 May 2025 10:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72ABB4C755F
	for <lists+linux-usb@lfdr.de>; Thu,  8 May 2025 08:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2C723A9B3;
	Thu,  8 May 2025 08:52:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A516238178
	for <linux-usb@vger.kernel.org>; Thu,  8 May 2025 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694362; cv=none; b=Lt5RREi1gY+ZNZdk3bVsLCZsDwcKcaxZQyVjnaJL+tSUN7JmU0jRwrciTLFJ0dC3+pMZNVHytL1eIrS1/Hf9oPNN/vNvcV+f9hmYU8+B3+HRRhbBMbgyqSjJtN8/06PCXDShEY7hWnRrBVXUSV2pNZFRXgmPPyPyXpDe/MAvZ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694362; c=relaxed/simple;
	bh=7hb/9wCGqKPxrCN33zmqqog/8UFWoGcGlQk6uFFbQ5o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SQAYL566JkMPkJsCAodaqPHvSC4rxmoiHr+KR2tufUpx8FFnWPgnpxLuR7DG/F02NWBaA89E488296Izyn0lpHv/PVA3ie1BovRL/pcf8Mx+3/hXLyVu8iXlmuxaBsniWHW9MTfiG0BzKL/Ed8Id4W8efuR7fn0PiJPZF958a7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3da720ff4a0so8753515ab.3
        for <linux-usb@vger.kernel.org>; Thu, 08 May 2025 01:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694359; x=1747299159;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7aqf1RFZ8NyfDklbuzyfb2/V8iKPLDKy8JsxG49H8c=;
        b=EQmJRx4Xevp1rg7UQvX/5quPGNzXHt/gWDcchsSLoK1kerjtw5VmBDCDoE2wKim8zV
         mRy3SC/gf4SE3RwXGQAU0d46qwLMBMRwLBqHz9jwcmHjFZ373gO98CWQSHSCrT8CnMGG
         MfLp5fLU2PIaO3V7ADZ87kr+Kj2T0i/VRK+nsliGIfVAGx+tnUsn8ypG/INasisDiLwa
         1TbepxBUOXt2hbAQyU4yXcJHuApxiVyBuh8eU08IXreFI5rsGKq/KwEpiALklU5pQJE5
         Unctw8KkgGudDd5KJEQ5UylXH2uQS2gN4vdlAT6fV+9T6wR+9Bqudi/rEMqFq1IpC6Hd
         a9bg==
X-Forwarded-Encrypted: i=1; AJvYcCUhktUnxtF3zVI9IfBKvsU4ezpohoDt2/TLJui26aJ0hDI5woYSB+3tmlPzE7WFej+BqVfYpcJjAuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRB+Hr3vA95EhSFBFN3U5Qn3v3OJXlfVxxZfB4tzEYZhTC4uuz
	SUCR6V3ptCWAJkXZ7Zo9BYhHWqtmppbSazTU0/GMCIAarAPAaIqVQyJJvmIIbfYgjajdxN7FM6t
	0IycvGH/G7bsOrW0FI+GMyIPeRSCQkbLwOdMBfuTasck8JSLMR00Tv1E=
X-Google-Smtp-Source: AGHT+IGXqHjPWzxShGFKbPMDVg+g3TkFpDMrOrtt2YU7WYfYW/07SDfhYVdarpW2dYjIRre0ytM4f3gWuc1Pkmkm3N7JJCOJQjin
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:152e:b0:3d8:3b31:5046 with SMTP id
 e9e14a558f8ab-3da785986b8mr31927605ab.17.1746694359245; Thu, 08 May 2025
 01:52:39 -0700 (PDT)
Date: Thu, 08 May 2025 01:52:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681c70d7.050a0220.a19a9.00c6.GAE@google.com>
Subject: [syzbot] [sound?] [usb?] WARNING: ODEBUG bug in snd_rawmidi_free
From: syzbot <syzbot+d8f72178ab6783a7daea@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
	tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2a239ffbebb5 Merge tag 'sound-6.15-rc5' of git://git.kerne..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15045b68580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a9a25b7a36123454
dashboard link: https://syzkaller.appspot.com/bug?extid=d8f72178ab6783a7daea
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15cfd8d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=126c1a70580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3398c42fd2ef/disk-2a239ffb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a3e276dc6661/vmlinux-2a239ffb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f0c67a315802/bzImage-2a239ffb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d8f72178ab6783a7daea@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff888027cf0040 object type: timer_list hint: snd_usbmidi_error_timer+0x0/0x660 sound/usb/midi.c:2343
WARNING: CPU: 0 PID: 10 at lib/debugobjects.c:615 debug_print_object+0x16b/0x1e0 lib/debugobjects.c:612
Modules linked in:

CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0-rc4-syzkaller-00291-g2a239ffbebb5 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
Workqueue: usb_hub_wq hub_event

RIP: 0010:debug_print_object+0x16b/0x1e0 lib/debugobjects.c:612
Code: 4c 89 ff e8 47 42 63 fd 4d 8b 0f 48 c7 c7 c0 db c1 8b 48 8b 34 24 4c 89 ea 89 e9 4d 89 f0 41 54 e8 aa a9 c5 fc 48 83 c4 08 90 <0f> 0b 90 90 ff 05 57 95 c0 0a 48 83 c4 08 5b 41 5c 41 5d 41 5e 41
RSP: 0018:ffffc900000f6990 EFLAGS: 00010296

RAX: 847b0a2dc845ef00 RBX: dffffc0000000000 RCX: ffff88801b681e00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000002
RBP: 0000000000000000 R08: ffffc900000f6667 R09: 1ffff9200001eccc
R10: dffffc0000000000 R11: fffff5200001eccd R12: ffffffff892410d0
R13: ffffffff8bc1dd40 R14: ffff888027cf0040 R15: ffffffff8b6cc2e0
FS:  0000000000000000(0000) GS:ffff8881260cb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff286001b8 CR3: 00000000316c4000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
 debug_check_no_obj_freed+0x3a2/0x470 lib/debugobjects.c:1129
 slab_free_hook mm/slub.c:2311 [inline]
 slab_free mm/slub.c:4642 [inline]
 kfree+0x117/0x440 mm/slub.c:4841
 snd_rawmidi_free+0x3bc/0x410 sound/core/rawmidi.c:1934
 snd_rawmidi_dev_free+0x38/0x50 sound/core/rawmidi.c:1945
 __snd_device_free+0x1d2/0x2e0 sound/core/device.c:76
 snd_device_free_all+0xcf/0x180 sound/core/device.c:233
 snd_card_do_free sound/core/init.c:587 [inline]
 release_card_device+0x75/0x1b0 sound/core/init.c:153
 device_release+0x99/0x1c0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x228/0x480 lib/kobject.c:737
 snd_card_free_when_closed sound/core/init.c:618 [inline]
 snd_card_free+0x110/0x190 sound/core/init.c:650
 usb_audio_probe+0x18ea/0x1dc0 sound/usb/card.c:940
 usb_probe_interface+0x641/0xbc0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c1/0x390 drivers/usb/core/driver.c:291


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

