Return-Path: <linux-usb+bounces-24995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22DAE36DA
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 09:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 938287A847C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 07:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC4F202C3E;
	Mon, 23 Jun 2025 07:31:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE19C1F09B3
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663888; cv=none; b=BIkJ0ILwp2jK0J3tcP3HHOVR4ibayU45BNOmmYXtIT1kiJlhV6HQrEpJi7MiUFD/UFDL14p9SkGITc+/8Qi2dyGewFLJz2VRbyYY8/D2qI0272Nc0R7oFkb4v9zGSF1ldhAZqpFS5/VCFb/5Vbs5e/+tx7Iojdmv9RnjD5MvhtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663888; c=relaxed/simple;
	bh=yP74EpJuA4orpT9iEFd0R2RfcQhxdIw1Mp6c9MaOj9o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AS+yuw7htsXRLnwym9xuXOkKPas+RPyTq1wX8YaHXmE1yhaN+ZHQ8NixmWRwJCvJqaGluCj19VC1tsXIcC3cd6JqNnOyktsVpHHki8grn2RKDN7jz61yxcDeDnBgTnKgLIzOuPjsIFpxMct8Brjwjnc5vUM90YE0eZXULY7vpBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cff1087deso724979239f.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 00:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663886; x=1751268686;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pqLQksYdsEPNV2rKPBe9UgMfKqk5BssYsyD0kAdjx5Q=;
        b=gQAcLotdUY8t2idRkENkFuBQLuSzO3uekXyOYLJNUI20ODDsgobTaa8L7pGQdywEYQ
         RLkumBmRkkK/ZA78eGJQRr6i6a7Gz5BVXu++wxnt7ItIBe9HsYXkwLbAnQrZPO6fV1iE
         9DUNW+J9wqM5BZNDXZx+E/uH8NCvHdv7Bb8jgTRZbsjd9v5VTlGZXg1PIem5Uui4aGf1
         3dhPmrWORdzTp78j13YKdc1QLKsxWi1q6pC1fQZDdmpMAS82hUx6X/aTUy5NlDu7DSZx
         2pfBrEMaBOiwP8ZtrphCDtArOS+PVKmyhK1ICxvKVyeCHL48biopdXqSRz2o7x6qHvLf
         EFNA==
X-Forwarded-Encrypted: i=1; AJvYcCWTaoKAP2d+Nl4U38NSFTurPtdXo2cMGVjHUT9Xydfmch+90Ec+e2noZjYaTDparjDVybPXSGu7pgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKFMuyYkv5z+t2tC9Cnd1R5/dwu01NTIR9c8xyB91gkvwyKxRO
	oVhWxGBiYMQC+ieS/ACUgbJayyEvYBS49h/QaHby/5i0DigspNelBqQHvLI021VN0Fqo2/Az6IE
	L/i3OrSREu8uwpfxvGhVhCXF+GjI+vm1NX9i9LkNBsjtt6ohtKnZNEIkkEzA=
X-Google-Smtp-Source: AGHT+IGIcBLax78afmUPmZgof1DY+wNcN37l1u7UiYLKiPflmWa+va7XqzdorSNPfJRoY4BEvUA1UT2vLojw6qHpWenLtwuWFx1q
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:154e:b0:873:1c2d:18e7 with SMTP id
 ca18e2360f4ac-8762d19a846mr1140533539f.10.1750663885915; Mon, 23 Jun 2025
 00:31:25 -0700 (PDT)
Date: Mon, 23 Jun 2025 00:31:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685902cd.a00a0220.2e5631.0011.GAE@google.com>
Subject: [syzbot] Monthly usb report (Jun 2025)
From: syzbot <syzbot+listcb3a4e412ba5e3e8d7fa@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 5 new issues were detected and 2 were fixed.
In total, 91 issues are still open and 383 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  4437    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<2>  2128    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<3>  1607    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<4>  1391    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<5>  1219    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<6>  1041    Yes   possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<7>  821     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<8>  723     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<9>  603     Yes   KASAN: slab-out-of-bounds Read in mcp2221_raw_event
                   https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
<10> 522     Yes   WARNING in usb_tx_block/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=355c68b459d1d96c4d06

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

