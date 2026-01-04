Return-Path: <linux-usb+bounces-31892-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 691B2CF0E9F
	for <lists+linux-usb@lfdr.de>; Sun, 04 Jan 2026 13:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DE083007DB3
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jan 2026 12:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32222C15B4;
	Sun,  4 Jan 2026 12:28:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C1E2C1580
	for <linux-usb@vger.kernel.org>; Sun,  4 Jan 2026 12:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767529707; cv=none; b=sEqfaaej85QlRnabpQayaL9wjxQZyYKlqYHml8EwJKQ6Yele5w7CTcZNNFyKwZe5CJmST/+p72nUFWV2o4DBPFKIKchrksB5wQ8RSOcKKNpEN+NEzLgPUkcRcNzTcVCrmmTvoK2UP5LMrjvmUvbd0p8lWv073PPKl8Gl4IkB8SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767529707; c=relaxed/simple;
	bh=Z3OFVwmx2Npn4JB808U7g/hTtdRnHDfk2JuJuSpyLJU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IUF5alDuySYSLF4NNPPMtMkgMbVcnIMLySBx8Nt6tXEjwFnryJqE/JHZj6weTmvLtK4LDWihaNs6aQ2ArZ2LEcYbpiJGYvauQyni3SuYRHruI7b2GV1c2vJ3OGiR92wrO70uDNV2/1ZBqMrizn9HO2qGYkMkiblpxS693Oo7DS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-65d004d4e48so29315944eaf.3
        for <linux-usb@vger.kernel.org>; Sun, 04 Jan 2026 04:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767529705; x=1768134505;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d31fsRXPxTPRrtHd7RNwgrt2ArM3Tcq4eAqlrqYmhwI=;
        b=YlhzAaEtxL+QbKbMdvV/KZw84ltSvFujFdi1h3nCfbnIZjHe9IbqHS6fFD0cDNL8m+
         oddDtAcYbvliAVX9YHtPJRUkyxEyF80V2gxly+LpitfrRAoCe6NANG2JyInogX3fd657
         hvFAVUsnr6SivecGaFpjb/PQHMtg8tEA2/Ad5zipLkajdxr9hZQfdv6I3JeoSCnIYXmu
         U/2NKP+D41c1pYYxRyR7jZftzpE8RtH6H58QDzW9243fuA5xB0dwbpiJrg69qC5KfJEn
         Iqc753lZ//1oeV9edrsb9NbAHspeCB/ZsDvUyM89xT+C5D9P7w5Ain8SN5RdekidKr+q
         9XFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4ZrXXY9DXElloq5YVpAbm31nsYgGTFCUd54PXpPca6lImEP9lFcFSFJJ9gMhLcYLq2T8jc6x1iMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgUqAoLZKKFaV9PKkVShqP3tFtSZZ4hZ2JmVw0FiQS5vAelMou
	ojCBT4Jcg/cXx0HkugR4tsW8DY+sqM8BVCvWkKbi8zYNFg7KKELY1BeBEyVtwkQi8mrl1m3Wrnw
	vgCHcNWUSPMIxsgczfj8qkhmVria55N5EcGzKrTx0lL5BdK9BmpDAv2Ahk7U=
X-Google-Smtp-Source: AGHT+IF0/jUoSyanIXEsVZEpCxY1yeRkYHeoZaeBQBJiGZWiAN8w3MPInS908N5bsSAKrE6cu+YbFM73iFJOUBJ/taAxF4eVgA+r
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:222a:b0:659:9a49:8eb2 with SMTP id
 006d021491bc7-65d0eb4df20mr19320195eaf.54.1767529704778; Sun, 04 Jan 2026
 04:28:24 -0800 (PST)
Date: Sun, 04 Jan 2026 04:28:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <695a5ce8.050a0220.a1b6.038e.GAE@google.com>
Subject: [syzbot] [usb?] WARNING: ODEBUG bug in rtl_usb_disconnect
From: syzbot <syzbot+7dfaac96168cbf5e949b@syzkaller.appspotmail.com>
To: dakr@kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e46bcc4e856e Merge 6.19-rc3 into usb-next
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=17056e22580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d5cd47f33691a0a2
dashboard link: https://syzkaller.appspot.com/bug?extid=7dfaac96168cbf5e949b
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1588269a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/425204d1cbf4/disk-e46bcc4e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8330ad1f4f4c/vmlinux-e46bcc4e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ac25bb52ee63/bzImage-e46bcc4e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7dfaac96168cbf5e949b@syzkaller.appspotmail.com

usb 2-1: USB disconnect, device number 15
------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff888125383810 object type: timer_list hint: rtl_ips_nic_off_wq_callback+0x0/0x680 include/linux/etherdevice.h:384
WARNING: lib/debugobjects.c:612 at debug_print_object+0x18e/0x2a0 lib/debugobjects.c:612, CPU#0: kworker/0:6/5947
Modules linked in:
CPU: 0 UID: 0 PID: 5947 Comm: kworker/0:6 Not tainted syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: usb_hub_wq hub_event

RIP: 0010:debug_print_object+0x19b/0x2a0 lib/debugobjects.c:612
Code: b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 4f 48 8d 3d d2 19 14 08 41 56 48 8b 14 dd e0 84 8a 87 4c 89 e6 <67> 48 0f b9 3a 58 83 05 8c 37 10 08 01 48 83 c4 18 5b 5d 41 5c 41
RSP: 0018:ffffc9000324f3e8 EFLAGS: 00010246

RAX: dffffc0000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: ffffffff878a8420 RSI: ffffffff878a8000 RDI: ffffffff8aa880b0
RBP: 0000000000000001 R08: ffff888125383810 R09: ffffffff876b9180
R10: ffffffff8aa491d7 R11: ffff888106f04528 R12: ffffffff878a8000
R13: ffffffff876b91c0 R14: ffffffff845c7cf0 R15: ffffc9000324f4e8
FS:  0000000000000000(0000) GS:ffff888268bf4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055acea04b3e1 CR3: 0000000105f78000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
 debug_check_no_obj_freed+0x4b7/0x600 lib/debugobjects.c:1129
 free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_pages_ok+0x376/0xe10 mm/page_alloc.c:1571
 device_release+0xa4/0x240 drivers/base/core.c:2565
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1ef/0x6f0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3797
 rtl_usb_disconnect+0x2b3/0x3a0 drivers/net/wireless/realtek/rtlwifi/usb.c:1077
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:571 [inline]
 device_remove+0x125/0x170 drivers/base/dd.c:563
 __device_release_driver drivers/base/dd.c:1282 [inline]
 device_release_driver_internal+0x44b/0x620 drivers/base/dd.c:1305
 bus_remove_device+0x22f/0x450 drivers/base/bus.c:616
 device_del+0x396/0x9f0 drivers/base/core.c:3878
 usb_disable_device+0x355/0x820 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x9e0 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5407 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1b50/0x5420 drivers/usb/core/hub.c:5953
 process_one_work+0x9ba/0x1b20 kernel/workqueue.c:3257
----------------
Code disassembly (best guess):
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	00 fc                	add    %bh,%ah
   7:	ff                   	(bad)
   8:	df 48 89             	fisttps -0x77(%rax)
   b:	fa                   	cli
   c:	48 c1 ea 03          	shr    $0x3,%rdx
  10:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  14:	75 4f                	jne    0x65
  16:	48 8d 3d d2 19 14 08 	lea    0x81419d2(%rip),%rdi        # 0x81419ef
  1d:	41 56                	push   %r14
  1f:	48 8b 14 dd e0 84 8a 	mov    -0x78757b20(,%rbx,8),%rdx
  26:	87
  27:	4c 89 e6             	mov    %r12,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	58                   	pop    %rax
  30:	83 05 8c 37 10 08 01 	addl   $0x1,0x810378c(%rip)        # 0x81037c3
  37:	48 83 c4 18          	add    $0x18,%rsp
  3b:	5b                   	pop    %rbx
  3c:	5d                   	pop    %rbp
  3d:	41 5c                	pop    %r12
  3f:	41                   	rex.B


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

