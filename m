Return-Path: <linux-usb+bounces-31890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9FECF0AF0
	for <lists+linux-usb@lfdr.de>; Sun, 04 Jan 2026 08:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08FEB301C951
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jan 2026 07:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00422E7F22;
	Sun,  4 Jan 2026 07:03:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234326FC5
	for <linux-usb@vger.kernel.org>; Sun,  4 Jan 2026 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767510207; cv=none; b=EkgTd1v8TuPTjOLtYM69p+3kNdos8tt8McqWDiUlrSaj6rEQCXKImu2RYcF8mKOi5YN65psd/hRe4b1oTgAytJ8xGriqDdB12j8wE9vBKJumSKPSe2HrAERJJo9nArOs+hvyEkFmFIDVjxmidkSrwZi6kdoieb0gLvTUcttSuRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767510207; c=relaxed/simple;
	bh=74HteuS1toYw2ezipiDqT1lPBLLETbqmRoGJ02H215w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=L1Lor1euGoKdtNjSgQOQVV+gDxPRsh7BPvKWnVn1RU2ad2JCBzssfCOutrdNDhNLnbpsmdt3TZ4ooq34xtmrngZ+ul6XOpbqy5wPQNuCgnIaqO7Zz5Rl/7UUd05CTHvloTzgnxdBayT2T/lRsa2bPM5C8KyZS54Yu+OA2K41Atw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-65e902a9ce8so3252766eaf.0
        for <linux-usb@vger.kernel.org>; Sat, 03 Jan 2026 23:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767510204; x=1768115004;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTfmVeh+pGfDsMukXLgNyjtrE+o5tQSc5/TDKBswtxo=;
        b=bq3qJBpvml79BYZZNW2eAa+uV4yBVB/jKn8HaqPfhk6MlhU0RS9qtL5OK9zMFeobFR
         UlVZyAeqt32u2FlvR+KStCjKmz1cgKfd1M9cnZDOnfLYENgawLGdN/6i4nkqksT0tf7O
         8m8Rg1fkX1Ijug+qetDGG3l+P0ZZIGSC8J45jqlqUqMZ6sgt5XJ0yxp35QUhnyNitaa/
         NxczwZs/v3T4aI9yVchX25qIl8KtN2tbpxFoR7FaArIXU3cg9tbz9Zzl1IxcXY9HvXfk
         YFbmNcY/ufCRIGeFvw7zF2uBXQevG/lDfvVbBNZdpljkQl3DI90SiydYxx94J/TfuS+J
         jeJA==
X-Forwarded-Encrypted: i=1; AJvYcCVRPA1tmbuMRP7XVY4xDF50ntSBmWZ+cFfdjQadkJuhz7FcLWT1X4ccgJphjwxpdoin/XGnKXHL23Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YweqNvl3qQ87Nuvk8aoPdmGZ+kWjZnZdTH9uvItTFEHvHDJ581I
	WWROXOFSR2MM3YmUJENAtVprjR+k3ozi3AzDAz725juFutRvIi03ymL18GrOK147qdi6iz9isbV
	kYKeWk54XN69rP0/oVsOHX5woLQOCzq71PjkNOy/p4pdsafyNj6DGekuARI8=
X-Google-Smtp-Source: AGHT+IGy01DRRRbhVK4YZTgsDtCAx/w5JRgUK+t7UXn1IvHcdmhZvxqvQcGEhmZznwGaCo2JSo1wCxPAay5orn/KAJuXOliZXz+k
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f03:b0:65f:1ab0:cdbd with SMTP id
 006d021491bc7-65f2691fa45mr1873479eaf.37.1767510204060; Sat, 03 Jan 2026
 23:03:24 -0800 (PST)
Date: Sat, 03 Jan 2026 23:03:24 -0800
In-Reply-To: <69038243.a70a0220.5b2ed.0048.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <695a10bc.050a0220.a1b6.0386.GAE@google.com>
Subject: Re: [syzbot] [usb?] BUG: corrupted list in usb_hcd_link_urb_to_ep (5)
From: syzbot <syzbot+e69c25cf38a53d0cf64c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    aacb0a6d604a Merge tag 'pmdomain-v6.19-rc3' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16578f92580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a11e0f726bfb6765
dashboard link: https://syzkaller.appspot.com/bug?extid=e69c25cf38a53d0cf64c
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1627369a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d70d8ecc100f/disk-aacb0a6d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/905258eeaaeb/vmlinux-aacb0a6d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/92f24a766750/bzImage-aacb0a6d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e69c25cf38a53d0cf64c@syzkaller.appspotmail.com

list_add double add: new=ffff888028dc3118, prev=ffff888028dc3118, next=ffff8880761de078.
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:35!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 7322 Comm: syz.2.605 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:__list_add_valid_or_report+0x143/0x190 lib/list_debug.c:35
Code: 89 f1 48 c7 c7 c0 b6 f2 8b 48 89 ee e8 d6 9a e7 fc 90 0f 0b 48 89 f2 48 89 e9 4c 89 e6 48 c7 c7 40 b7 f2 8b e8 be 9a e7 fc 90 <0f> 0b 48 89 f7 48 89 34 24 e8 cf db 73 fd 48 8b 34 24 e9 07 ff ff
RSP: 0018:ffffc90004ca7580 EFLAGS: 00010086
RAX: 0000000000000058 RBX: ffff888028dc3100 RCX: ffffffff819c8fa5
RDX: 0000000000000000 RSI: ffffffff819d0b89 RDI: 0000000000000005
RBP: ffff8880761de078 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000004 R11: 0000000000000001 R12: ffff888028dc3118
R13: ffff8880761de080 R14: 0000000000000000 R15: ffff888028dc3118
FS:  00007fa72ab066c0(0000) GS:ffff8881248f5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000002000 CR3: 000000007860f000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __list_add_valid include/linux/list.h:96 [inline]
 __list_add include/linux/list.h:158 [inline]
 list_add_tail include/linux/list.h:191 [inline]
 usb_hcd_link_urb_to_ep+0x220/0x3a0 drivers/usb/core/hcd.c:1158
 dummy_urb_enqueue+0x2a7/0x920 drivers/usb/gadget/udc/dummy_hcd.c:1288
 usb_hcd_submit_urb+0x25b/0x1cf0 drivers/usb/core/hcd.c:1546
 usb_submit_urb+0x899/0x1970 drivers/usb/core/urb.c:587
 cm109_submit_buzz_toggle+0xd9/0x180 drivers/input/misc/cm109.c:351
 cm109_toggle_buzzer_async drivers/input/misc/cm109.c:484 [inline]
 cm109_input_ev+0x23d/0x280 drivers/input/misc/cm109.c:615
 input_event_dispose drivers/input/input.c:322 [inline]
 input_handle_event+0x151/0x14d0 drivers/input/input.c:370
 input_inject_event+0x1e8/0x3b0 drivers/input/input.c:424
 kd_sound_helper+0x17a/0x280 drivers/tty/vt/keyboard.c:256
 input_handler_for_each_handle+0xd7/0x250 drivers/input/input.c:2520
 kd_mksound+0x88/0x130 drivers/tty/vt/keyboard.c:280
 handle_ascii drivers/tty/vt/vt.c:2327 [inline]
 do_con_trol drivers/tty/vt/vt.c:2644 [inline]
 do_con_write+0x3246/0x8280 drivers/tty/vt/vt.c:3228
 con_write+0x23/0xb0 drivers/tty/vt/vt.c:3565
 process_output_block drivers/tty/n_tty.c:557 [inline]
 n_tty_write+0x434/0x1280 drivers/tty/n_tty.c:2366
 iterate_tty_write drivers/tty/tty_io.c:1006 [inline]
 file_tty_write.constprop.0+0x503/0x9b0 drivers/tty/tty_io.c:1081
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x7d3/0x11d0 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa729b8f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fa72ab06038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fa729de5fa0 RCX: 00007fa729b8f749
RDX: 0000000000001006 RSI: 0000200000001980 RDI: 0000000000000005
RBP: 00007fa729c13f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fa729de6038 R14: 00007fa729de5fa0 R15: 00007ffdb843d7a8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_add_valid_or_report+0x143/0x190 lib/list_debug.c:35
Code: 89 f1 48 c7 c7 c0 b6 f2 8b 48 89 ee e8 d6 9a e7 fc 90 0f 0b 48 89 f2 48 89 e9 4c 89 e6 48 c7 c7 40 b7 f2 8b e8 be 9a e7 fc 90 <0f> 0b 48 89 f7 48 89 34 24 e8 cf db 73 fd 48 8b 34 24 e9 07 ff ff
RSP: 0018:ffffc90004ca7580 EFLAGS: 00010086
RAX: 0000000000000058 RBX: ffff888028dc3100 RCX: ffffffff819c8fa5
RDX: 0000000000000000 RSI: ffffffff819d0b89 RDI: 0000000000000005
RBP: ffff8880761de078 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000004 R11: 0000000000000001 R12: ffff888028dc3118
R13: ffff8880761de080 R14: 0000000000000000 R15: ffff888028dc3118
FS:  00007fa72ab066c0(0000) GS:ffff8881248f5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000002000 CR3: 000000007860f000 CR4: 00000000003526f0


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

