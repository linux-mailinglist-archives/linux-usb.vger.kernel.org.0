Return-Path: <linux-usb+bounces-34180-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA4aBnEDrGkFjAEAu9opvQ
	(envelope-from <linux-usb+bounces-34180-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 11:52:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CD222B30F
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 11:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C732300652F
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 10:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7560C3090D9;
	Sat,  7 Mar 2026 10:52:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132C21CFE0
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772880747; cv=none; b=i4MYgTw5ct5QQhPqI/1DuPiPCON0rmIvARWOB0vZdVIvndN9vfUKo9XzdTNGF2JDdzjRoUIJaqsMPfxYlNcaYDUZgAL5f/fglJworbd4Ggent2z/q0ZUTlVGzq6cdHD5hK4jNBHQTlKpDxwLDQfpNi53wM5oIAGGCf2RVOT6mvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772880747; c=relaxed/simple;
	bh=/c+OXoUxVHpJsmfAesi6oi8uKIzHUj8rYtXlGQ2THy8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FIxdMMWnAmAiQsjCSESIcpCOiq06HvApyvUnftj3eJ31FZZZMKnXEtch5TqPR/zyMkJ8qf3TriFRt4AIAAwBA+rGh00uPl2xloYuKILIYEkA29x1htLE7n2B/MioPYnyPkT1D0V/sk21fyaejfq5qFjK3JrFmqtbbB+7izo2qOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-672c40f3873so162099763eaf.2
        for <linux-usb@vger.kernel.org>; Sat, 07 Mar 2026 02:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772880745; x=1773485545;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+2oUFEskwxh2vrZLB5eyDTqyerBPB0sAKoh0Hd4kYo4=;
        b=LNhUgfZY/Z4ExBfPefOTfrPAKIWfvIo4f1HpDH4817FWhsgeFwOa+xGmI5fJukxIdB
         NNcxQczoDdRqfocufxDurslgd91ZXXnEnqZ0Oz2P/9GrVNvKTrHvWu6ciahFZ9YK4ap4
         VtKG5md0FaQc6E49Lk0iliRrhJ5acdn0kUT/iiDNc/lGsJpkjbu3SVdA1GbRCK+7tpkY
         zPvzrRjA24wphaiUh3C462iOIXBXfCIKBgzZzyHb0L/Ugw6YZXHSuv7d5SDpgViZIuzo
         Z+nRXaoNmvmjwBHl/3TabAW1CvjdGCM/3LA21u/zsVnGKIAV4/roqs0xglc8RFLoiWwX
         lpew==
X-Forwarded-Encrypted: i=1; AJvYcCUOVLM5izOB5h44/xDN16XVflwvoLy52dFVozIUj2GwlUp2Aeqqj9yV72hMiyoy1YS98ugOXuh3FUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYfLJEb6V2v/rxDmPkJOYDTZB9yxJmje3SLpId2WADbeh16FkP
	vXFqQMBmamusQGSGMsD9fyktsv37TfsbkRiSEiegWZpXvwnA7ymvEh1XEhswmY35veiJvMN8pQh
	hmwU4H4BxaSfJ7Gj0kTBsVo3htiEps9vr4IFpkp4IXMcG9w0R+WAZef7TCjg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e843:0:b0:679:e930:b553 with SMTP id
 006d021491bc7-67b9bcdbaa1mr3039961eaf.32.1772880744881; Sat, 07 Mar 2026
 02:52:24 -0800 (PST)
Date: Sat, 07 Mar 2026 02:52:24 -0800
In-Reply-To: <68fc7c9c.050a0220.346f24.023c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ac0368.050a0220.13f275.004d.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset (4)
From: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 82CD222B30F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34180-lists,linux-usb=lfdr.de,19bed92c97bee999e5db];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.906];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,storage.googleapis.com:url,syzkaller.appspot.com:url]
X-Rspamd-Action: no action

syzbot has found a reproducer for the following issue on:

HEAD commit:    651690480a96 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11ec0806580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b2db5a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14fed8d6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0e393fccfaa3/disk-65169048.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2930e8c98c89/vmlinux-65169048.xz
kernel image: https://storage.googleapis.com/syzbot-assets/34e9e7d322b1/bzImage-65169048.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com

usb 1-1: reset high-speed USB device number 2 using dummy_hcd
usb 1-1: device descriptor read/8, error -32
Oops: general protection fault, probably [  120.351719][ T6052] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000040-0x0000000000000047]
CPU: 0 UID: 0 PID: 6052 Comm: kworker/0:7 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_gadget_udc_reset+0x27/0x60 drivers/usb/gadget/udc/core.c:1200
Code: 90 90 90 f3 0f 1e fa 41 56 53 49 89 f6 48 89 fb e8 6e 5c c0 fa 49 83 c6 40 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 f7 e8 cb 74 26 fb 4d 8b 1e 48 89 df 2e e8
RSP: 0018:ffffc9000415e4c8 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888029facc40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff8880341b2b6c R08: ffffffff8f6a4eb7 R09: 1ffffffff1ed49d6
R10: dffffc0000000000 R11: fffffbfff1ed49d7 R12: ffff888029facc40
R13: 1ffff110053f38a1 R14: 0000000000000040 R15: 1ffff110053f5987
FS:  0000000000000000(0000) GS:ffff88812633d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007eff7c4020c0 CR3: 00000000324ce000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 set_link_state+0x80b/0x1220 drivers/usb/gadget/udc/dummy_hcd.c:469
 dummy_hub_control+0xa09/0x1a00 drivers/usb/gadget/udc/dummy_hcd.c:-1
 rh_call_control drivers/usb/core/hcd.c:652 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:817 [inline]
 usb_hcd_submit_urb+0xdbe/0x1b50 drivers/usb/core/hcd.c:1538
 usb_start_wait_urb+0x12b/0x510 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 set_port_feature drivers/usb/core/hub.c:466 [inline]
 hub_port_reset+0x3c7/0x1820 drivers/usb/core/hub.c:3083
 hub_port_init+0x299/0x28c0 drivers/usb/core/hub.c:4939
 usb_reset_and_verify_device+0x1661/0x1af0 drivers/usb/core/hub.c:6215
 usb_reset_device+0x551/0xb40 drivers/usb/core/hub.c:6410
 sd_config+0x27f/0x15b0 drivers/media/usb/gspca/se401.c:221
 gspca_dev_probe2+0x81e/0x1450 drivers/media/usb/gspca/gspca.c:1529
 usb_probe_interface+0x668/0xc90 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:803
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:833
 __device_attach_driver+0x2d4/0x4c0 drivers/base/dd.c:961
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c8/0x450 drivers/base/dd.c:1033
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:574
 device_add+0x7b6/0xb80 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x2110 drivers/usb/core/message.c:2208
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x3b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:803
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:833
 __device_attach_driver+0x2d4/0x4c0 drivers/base/dd.c:961
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c8/0x450 drivers/base/dd.c:1033
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:574
 device_add+0x7b6/0xb80 drivers/base/core.c:3689
 usb_new_device+0x9f8/0x16e0 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2a49/0x4f60 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0xb02/0x1830 kernel/workqueue.c:3358
 worker_thread+0xa50/0xfc0 kernel/workqueue.c:3439
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:usb_gadget_udc_reset+0x27/0x60 drivers/usb/gadget/udc/core.c:1200
Code: 90 90 90 f3 0f 1e fa 41 56 53 49 89 f6 48 89 fb e8 6e 5c c0 fa 49 83 c6 40 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 f7 e8 cb 74 26 fb 4d 8b 1e 48 89 df 2e e8
RSP: 0018:ffffc9000415e4c8 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888029facc40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff8880341b2b6c R08: ffffffff8f6a4eb7 R09: 1ffffffff1ed49d6
R10: dffffc0000000000 R11: fffffbfff1ed49d7 R12: ffff888029facc40
R13: 1ffff110053f38a1 R14: 0000000000000040 R15: 1ffff110053f5987
FS:  0000000000000000(0000) GS:ffff88812633d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007eff7c4020c0 CR3: 00000000379ee000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	f3 0f 1e fa          	endbr64
   7:	41 56                	push   %r14
   9:	53                   	push   %rbx
   a:	49 89 f6             	mov    %rsi,%r14
   d:	48 89 fb             	mov    %rdi,%rbx
  10:	e8 6e 5c c0 fa       	call   0xfac05c83
  15:	49 83 c6 40          	add    $0x40,%r14
  19:	4c 89 f0             	mov    %r14,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	4c 89 f7             	mov    %r14,%rdi
  33:	e8 cb 74 26 fb       	call   0xfb267503
  38:	4d 8b 1e             	mov    (%r14),%r11
  3b:	48 89 df             	mov    %rbx,%rdi
  3e:	2e                   	cs
  3f:	e8                   	.byte 0xe8


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

