Return-Path: <linux-usb+bounces-34192-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aerkATj3rGmkwgEAu9opvQ
	(envelope-from <linux-usb+bounces-34192-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 05:12:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAEF22E73F
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 05:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EECA302DB7C
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 04:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2A72C234A;
	Sun,  8 Mar 2026 04:12:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6002124A07C
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 04:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772943148; cv=none; b=lYBg2GK1F9qnVKWg1+qoZVczuKkeOGQy6/hiROQWx3Vp/9TQH7yu7LOZ1tH/v9WyKmmuhqammTxH1e/plbhiAbe54Uadp7rge+0LGSIc4fWIg8QVC6cpKxM5qDekZcXQVJLU2p8mFIgZzbVONFj5jGH6GsNyAVA9o8yWQ3+AMmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772943148; c=relaxed/simple;
	bh=qYRRhJ/rjVX6gADAftLWWxxgi7AUGT+kfAfgu9FnizM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SEabc64uUAUKOhXu4fLdrl/joOoeaacjIkVtYWbTrsbZnKc8HhZvF5N/kmLPu3o79Ync/j7Fb6PNLAPAPGuct9PndEyY5e+5AhWKfnr6+xE+avL/vyzGSYMHwH90do0s61d2nwfyOTphzVjd6cCk0SsYYO8QeX/02qu3N0deaPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679caf7ec07so171677831eaf.1
        for <linux-usb@vger.kernel.org>; Sat, 07 Mar 2026 20:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772943146; x=1773547946;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zA1wgT+unS1d+T7tI8dP5Kbt/EPIFkFNGoMj1Twx1A8=;
        b=WeGKgN9LuFxXIEoogOFzjGOqA/GN/tQeddla96RVARm97F81ksqvmtQoTSgUpAzWXO
         Dq4MgDgut0SfKwKK72ke9kD9TuSlKxpOTruH7z+pgyn+ZlVDjeIKRhJW2BIH7NcmmkMA
         EEX6nbYLp7GEDyHbbRwEcZ3FYYRAbke0ptDaOYrgx/gPpIrw9kXvP9yZM8jKAZOmxyJx
         J3SOCJ4K0jiU27rQsZNxiuTkFBsoZ5HVbktsmX+uHtJjTLl6Z35Jha6MbhKyhu2osiEX
         Gh32WtrYVYWbuXiPs7j66FhCHRwyseMcVcvqYWuzoyVf/HdNc8Jcz0CeL9zxCNJ70Jus
         gTNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIvomWY5A6cG7aEZSKBO0QrIgGxYwgJKjKeuZJokf/8NmkrEZvyud4te8bn3Vape8UQB/554wY7k4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy33MEGwc7exA3llc0xGZycQ5S9EtAFaclx07DaeTUeEso3tMh4
	AyhrBKgz+WLmCkbZsfEXGls3AHt0+zDkKh8XkhhrkzUsPy8kfvgKw9ImvMz2nyy+wlYb81PX3pp
	SPLPGiaTFprSIZYfeO1QcGDW5T3Lgl3tSBJvxGsfNUwSkvVNXcxnAHwkhkLo=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b92:b0:679:975b:f227 with SMTP id
 006d021491bc7-67b9bd2e167mr4624023eaf.42.1772943146303; Sat, 07 Mar 2026
 20:12:26 -0800 (PST)
Date: Sat, 07 Mar 2026 20:12:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69acf72a.050a0220.310d8.0004.GAE@google.com>
Subject: [syzbot] [sound?] general protection fault in snd_scarlett2_init
From: syzbot <syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com>
To: g@b4.vu, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
	tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 3FAEF22E73F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=f1500201919951cc];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34192-lists,linux-usb=lfdr.de,ae893a8901067fde2741];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.949];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,storage.googleapis.com:url,syzkaller.appspot.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    bb375c251ab4 dt-bindings: usb: st,st-ohci-300x: convert to..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=138f1b5a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f1500201919951cc
dashboard link: https://syzkaller.appspot.com/bug?extid=ae893a8901067fde2741
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ffb006580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12ebbb5a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2475c3172471/disk-bb375c25.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/30449aa672dd/vmlinux-bb375c25.xz
kernel image: https://storage.googleapis.com/syzbot-assets/46d3937d1c16/bzImage-bb375c25.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com

usb 4-1: 0:6 : does not exist
usb 4-1: 0:7 : does not exist
usb 4-1: 0:8 : does not exist
usb 4-1: 0:9 : does not exist
usb 4-1: 0:10 : does not exist
usb 4-1: Focusrite Scarlett Gen 3 Mixer Driver enabled (pid=0x8215); report any issues to https://github.com/geoffreybennett/scarlett-gen2/issues
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 28 Comm: kworker/1:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_endpoint_num include/uapi/linux/usb/ch9.h:479 [inline]
RIP: 0010:scarlett2_find_fc_interface sound/usb/mixer_scarlett2.c:8261 [inline]
RIP: 0010:scarlett2_init_private sound/usb/mixer_scarlett2.c:8295 [inline]
RIP: 0010:snd_scarlett2_controls_create sound/usb/mixer_scarlett2.c:8684 [inline]
RIP: 0010:snd_scarlett2_init.cold+0xbad/0x6c79 sound/usb/mixer_scarlett2.c:9407
Code: 84 c0 74 06 0f 8e ca 0b 00 00 48 8b 44 24 20 48 8d 7b 02 48 89 fa 40 88 a8 48 02 00 00 b8 ff ff 37 00 48 c1 ea 03 48 c1 e0 2a <0f> b6 04 02 48 89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 9e 0b 00 00
RSP: 0018:ffffc900001e68d8 EFLAGS: 00010286
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff81543c4b
RDX: 0000000000000000 RSI: ffffffff81543c5d RDI: 0000000000000002
RBP: 0000000000000001 R08: 0000000000000001 R09: 00000000000000ff
R10: 00000000000000ff R11: 0000000000000000 R12: ffff88811dd24804
R13: dffffc0000000000 R14: ffff88811dd248a8 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8882687d3000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000558c34efbe88 CR3: 00000000094ae000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 snd_usb_mixer_apply_create_quirk+0x1c21/0x2b80 sound/usb/mixer_quirks.c:4446
 snd_usb_create_mixer+0x7a2/0x1910 sound/usb/mixer.c:3641
 usb_audio_probe+0xf6d/0x3a90 sound/usb/card.c:1033
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:583 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:661
 __driver_probe_device+0x1de/0x400 drivers/base/dd.c:803
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:833
 __device_attach_driver+0x1ff/0x3e0 drivers/base/dd.c:961
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1033
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x64/0x160 drivers/base/bus.c:574
 device_add+0x11d9/0x1950 drivers/base/core.c:3689
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2208
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:583 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:661
 __driver_probe_device+0x1de/0x400 drivers/base/dd.c:803
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:833
 __device_attach_driver+0x1ff/0x3e0 drivers/base/dd.c:961
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1033
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x64/0x160 drivers/base/bus.c:574
 device_add+0x11d9/0x1950 drivers/base/core.c:3689
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x314d/0x4af0 drivers/usb/core/hub.c:5953
 process_one_work+0x9d7/0x1920 kernel/workqueue.c:3275
 process_scheduled_works kernel/workqueue.c:3358 [inline]
 worker_thread+0x5da/0xe40 kernel/workqueue.c:3439
 kthread+0x370/0x450 kernel/kthread.c:467
 ret_from_fork+0x6c3/0xcb0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:usb_endpoint_num include/uapi/linux/usb/ch9.h:479 [inline]
RIP: 0010:scarlett2_find_fc_interface sound/usb/mixer_scarlett2.c:8261 [inline]
RIP: 0010:scarlett2_init_private sound/usb/mixer_scarlett2.c:8295 [inline]
RIP: 0010:snd_scarlett2_controls_create sound/usb/mixer_scarlett2.c:8684 [inline]
RIP: 0010:snd_scarlett2_init.cold+0xbad/0x6c79 sound/usb/mixer_scarlett2.c:9407
Code: 84 c0 74 06 0f 8e ca 0b 00 00 48 8b 44 24 20 48 8d 7b 02 48 89 fa 40 88 a8 48 02 00 00 b8 ff ff 37 00 48 c1 ea 03 48 c1 e0 2a <0f> b6 04 02 48 89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 9e 0b 00 00
RSP: 0018:ffffc900001e68d8 EFLAGS: 00010286

RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff81543c4b
RDX: 0000000000000000 RSI: ffffffff81543c5d RDI: 0000000000000002
RBP: 0000000000000001 R08: 0000000000000001 R09: 00000000000000ff
R10: 00000000000000ff R11: 0000000000000000 R12: ffff88811dd24804
R13: dffffc0000000000 R14: ffff88811dd248a8 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8882687d3000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4cb1355900 CR3: 00000001175e2000 CR4: 00000000003506f0
----------------
Code disassembly (best guess):
   0:	84 c0                	test   %al,%al
   2:	74 06                	je     0xa
   4:	0f 8e ca 0b 00 00    	jle    0xbd4
   a:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
   f:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
  13:	48 89 fa             	mov    %rdi,%rdx
  16:	40 88 a8 48 02 00 00 	mov    %bpl,0x248(%rax)
  1d:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
  22:	48 c1 ea 03          	shr    $0x3,%rdx
  26:	48 c1 e0 2a          	shl    $0x2a,%rax
* 2a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax <-- trapping instruction
  2e:	48 89 fa             	mov    %rdi,%rdx
  31:	83 e2 07             	and    $0x7,%edx
  34:	38 d0                	cmp    %dl,%al
  36:	7f 08                	jg     0x40
  38:	84 c0                	test   %al,%al
  3a:	0f 85 9e 0b 00 00    	jne    0xbde


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

