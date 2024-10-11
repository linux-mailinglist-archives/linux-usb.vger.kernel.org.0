Return-Path: <linux-usb+bounces-16081-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C799A301
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 13:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8568728498D
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 11:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CCF216A0C;
	Fri, 11 Oct 2024 11:51:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7523D20ADD3
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728647485; cv=none; b=EMNWx6fX91P+oatbQMUkLVW6D401G4YLbAywd8x8be+RBdzsa+KQ82dtD+F3qbfA+Pfc4l2IVdXZV/d1xFy99a7pT7bI2/ZTQJBHH+R8TfUEZ3Od7zKXQLlFZwsTy/7mPOR2pJE9SMtLG7hFAQQecZayZT8d9I97bEdc3y7pmZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728647485; c=relaxed/simple;
	bh=9O7BztCHO3KtV0SdChqcEH5ondx/3hwV164O7Oa05NA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=tDxhJncjuysb4nKhH3gSTj67JHNocT3N7qPjp+MdVujT2rOQos2TMuwMiy5Z3d04LmnaSYJzpTCV5iUlpfQ0w7VpCSRl9K7IP4AYWVGrB4vCSx1OcTWsPEzr71Bk6TmlhJPLlYkl1Jfw9rUCLT1R3/xuyuxsTFISDoeX3FQuaQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a3453139c0so23028355ab.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 04:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728647484; x=1729252284;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BEDDXhRBsKWXoiInxqiJ4ScpciEaFalrxT16qh3qfqo=;
        b=VAL6BacDcfpTeySmWnjQb40Z1T8B1ZUGOKtTykIdAkd2CfCk8+updsok4ogqKLvI99
         cOwQZ2m3gI6lNnEnXro2B2bpbGHPHIN0Tt2o8EbU/Uqd6cKSZWEaA2IIXwh53pFsM+Fd
         kcDDra2Iov6ScLt4o4+mj/z7lqGjpzGz3qLW7YnitaZxKeasXBsI1nknvcQDn/AiYp75
         1qJCD7do9Cnz/PwBD5tN+5HGjFI2bfUGQ5wPWg/TCQ52+7wNhNMA8tJQ1s9GHleVl/mS
         BoRfRPGcjgUr7jldhkRPfmS/qXUCdYxMWEGe3nHVT5cSlSQhba1cqJWCOkf0apNXR2u9
         LJDg==
X-Forwarded-Encrypted: i=1; AJvYcCXx+gWgooT9FAOG+I6lHgpIazZ4pDHhqolQEKvGEyQICZZbaFgstF6Iv1yhoFjMycYI6I5WgX3mjUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlST0Y60xkOHbdjmMPhgpdat0xAb7HVDc1Kj7ixErDV+2BKZG5
	0SpkGvqpiCdVnv/HF+99qQE5vjeHvGVNQ8K26m4srNx/uz+V73KTM5pLVH4B374tRxBEJQmtf9y
	nJaMLr+sRjnkI+FonJTgbL6yr2Obdl1qqtHx6e4RZG+Q7xLaG0C3IvBs=
X-Google-Smtp-Source: AGHT+IE1Dp7Kc13iub8S0zyHAHgCX/IWIH+GiwadtRoRAvR+gfvYitKqBvz+V+HKCxTswK8eKcjpCbJATswT8QsabgdhtCnXwg3S
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17c9:b0:3a0:bd91:3842 with SMTP id
 e9e14a558f8ab-3a3b5fe9b56mr15811205ab.24.1728647483675; Fri, 11 Oct 2024
 04:51:23 -0700 (PDT)
Date: Fri, 11 Oct 2024 04:51:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6709113b.050a0220.4cbc0.0003.GAE@google.com>
Subject: [syzbot] [usb?] WARNING: ODEBUG bug in corrupted (3)
From: syzbot <syzbot+90f31ac02b7ae5e8b578@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4a9fe2a8ac53 dt-bindings: usb: dwc3-imx8mp: add compatible..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=10b02707980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=90f31ac02b7ae5e8b578
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1597a7d0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/883c5319cb52/disk-4a9fe2a8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/caf4421ed2ef/vmlinux-4a9fe2a8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d8e3beb01d49/bzImage-4a9fe2a8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+90f31ac02b7ae5e8b578@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff88811dc037c8 object type: timer_list hint: rtl_ips_nic_off_wq_callback+0x0/0x680 drivers/net/wireless/realtek/rtlwifi/ps.c:283
WARNING: CPU: 1 PID: 5503 at lib/debugobjects.c:514 debug_print_object+0x1a3/0x2b0 lib/debugobjects.c:514


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

