Return-Path: <linux-usb+bounces-9752-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9338B19FD
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 06:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB51C1C22B9B
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 04:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B636239AF0;
	Thu, 25 Apr 2024 04:40:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC72D60A
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 04:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714020024; cv=none; b=CDtZvMPzw/keoJo2QzHZ4yEvgQBe8rP7jeDJ8cgh1pHBXhFKWAexc5nl+88GH0Ir2aAMbzpNXrJBUupaV3uo3RnvJBZfNTUDZssyyILjk++LPHx7pNi0oWMKcYDIzN+MsGNUXgB+aE4RASWj9mS95OHgVSScrdfuTQvEAfw/A0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714020024; c=relaxed/simple;
	bh=OB4j5qf0qyRv6yR1XjDD4cTYtOSzDvN4WD6jbh+e+AY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VI+tA8K1OkQWovX3rZ0Ct3OVM3sOL3vrZTj3a61l8yS1U1bm5scOP0F+HfD0Y9IiVDZngP2eRuWDzpStI40UlucN2iODSIwC6hOrug7pl/uIWBnReROwyfV3JKwNMrFgenVq9YcVovSp6efNVpptWF+75LaZDA8TL29xIXwoBsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7da42114485so63606039f.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 21:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714020022; x=1714624822;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/ttKuR8pOzX6ztDSujrzrffKCoFJ2lZGFJSRw0DI08=;
        b=dokWZo0WQXhZFja2jxhwQ7AjwQuhyeMOyz1zWJC0uBFO7PQyieyZYn07u+AGcJAyN0
         CWBZH9x8FyLKD4dURD1tqrgICMmkw1R+KIBA5JWyZMmqj8eTnYlSz3RCZQskwyYu9+m6
         svGNW1kgwO3k6Jen74HfB0Lzty6JPwtrMFHIN7p+QSsHHa63qgDk+VBD3dtC+jvusmGS
         1Eih78aWVojXMIFlZWvjNo3tElB6yUMGwmj9r4FWGlBs+1TtcAcP1ebiqUpznRIB8sgA
         KXT0N/MPMcCO1oAJXbYBHz4yyB1SoihX8uEgaeaHxOUYrl5McmQQqGVfCEf3dWlwe9Aa
         qgRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT6kgmeFhJZlPwvUa8ShneWAsDxMBP9JBedu+Nq6HeuMyYwPm58oZ/mqq7MCWzTqzidDfnbRq3hiq1yepehmiqIjhGwvDQrI39
X-Gm-Message-State: AOJu0YyHfWZ6Y0MeHpfJBYMLtBCtZ8nSAVp6/tjGyDASGAjHp3n+H7Sg
	zJ/LG0VkvZ19Gf+emn17u+sEqoBN7LSeha8l1Xn0TP9YDMSn4ksNyJ80iAGmr7JrlRPgdLSdhw/
	rBluwcgxmOQgrdCEhTzp1ftEgwQtyq+bm3qV6XS4wAiF3bQ/m6WREdkw=
X-Google-Smtp-Source: AGHT+IGNUeczjB2l6ldWR8gLoiEJtGJJPFZ1g2EpL1+lMYxXT3CjO5HuAm2LMtNcDbCnrC+YbGij+iWXpSJPRpvzJbjEtSsHsR7Q
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:27cc:b0:7da:bccd:c3e3 with SMTP id
 l12-20020a05660227cc00b007dabccdc3e3mr88303ios.1.1714020022409; Wed, 24 Apr
 2024 21:40:22 -0700 (PDT)
Date: Wed, 24 Apr 2024 21:40:22 -0700
In-Reply-To: <000000000000d23cfc061133c3ae@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000092e8f90616e4627f@google.com>
Subject: Re: [syzbot] [usb?] WARNING in wdm_rxwork/usb_submit_urb (2)
From: syzbot <syzbot+c6a1953c27ace6cc34e5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a160e1202ca3 usb: dwc3: qcom: Add multiport suspend/resume..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=12b37a9b180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6fe204286ac73e15
dashboard link: https://syzkaller.appspot.com/bug?extid=c6a1953c27ace6cc34e5
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1492bcef180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166f3d27180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/17ff4370c4e0/disk-a160e120.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7ef5dd31b4c4/vmlinux-a160e120.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f0fdddbf376c/bzImage-a160e120.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c6a1953c27ace6cc34e5@syzkaller.appspotmail.com

------------[ cut here ]------------
URB ffff8881022a5e00 submitted while active
WARNING: CPU: 1 PID: 35 at drivers/usb/core/urb.c:379 usb_submit_urb+0x14da/0x1730 drivers/usb/core/urb.c:379
Modules linked in:
CPU: 1 PID: 35 Comm: kworker/1:1 Not tainted 6.9.0-rc5-syzkaller-00104-ga160e1202ca3 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
Workqueue: events wdm_rxwork
RIP: 0010:usb_submit_urb+0x14da/0x1730 drivers/usb/core/urb.c:379
Code: fe eb cb bb fe ff ff ff e9 c1 f3 ff ff e8 1e ea 2c fd c6 05 81 4e 68 05 01 90 48 c7 c7 60 a3 30 87 48 89 de e8 a7 1a f3 fc 90 <0f> 0b 90 90 e9 b6 fe ff ff bb f8 ff ff ff e9 91 f3 ff ff 48 89 ef
RSP: 0018:ffffc90000257c20 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff8881022a5e00 RCX: ffffffff811902c9
RDX: ffff888102efba00 RSI: ffffffff811902d6 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000293
R13: ffff88810abe8090 R14: ffff88810abe8050 R15: ffffffff899ade98
FS:  0000000000000000(0000) GS:ffff8881f6500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000564d6da62000 CR3: 0000000115de4000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 wdm_rxwork+0xf3/0x200 drivers/usb/class/cdc-wdm.c:989
 process_one_work+0x9a9/0x1ac0 kernel/workqueue.c:3254
 process_scheduled_works kernel/workqueue.c:3335 [inline]
 worker_thread+0x6c8/0xf70 kernel/workqueue.c:3416
 kthread+0x2c1/0x3a0 kernel/kthread.c:388
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

