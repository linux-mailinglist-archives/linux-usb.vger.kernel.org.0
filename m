Return-Path: <linux-usb+bounces-16215-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9799E131
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 10:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA1651C2193F
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 08:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5871D0F42;
	Tue, 15 Oct 2024 08:33:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F511C877E
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 08:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728981209; cv=none; b=ECSSxzCaQS2IRPOLjahsZiJpIEe0Qlfs6SFH2849Ca5YBis4Di6a+h3K6hvV8ez+5koInG27YHaPVPw2t6l5z2EF6hf0A8mXx/y4z6afkKb3QXdk4/KZ+Ms8+Aevu4M6freQ8LQJuPdtzMgNc3c2a7koPL8tBPiBSNutmrELua8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728981209; c=relaxed/simple;
	bh=IFYFgGM3Odbd7g/GlONKnZB16g4OU8N2BUQmoNmX1/Y=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=NX6KnqdxccecCA9zoOe6lzLrOmb1UcgLLaMf4qaN61geCxht36Wfd0Xk5OQIP/eY7YMBbykAHtIp+0g0kUGEioZabpMmvBf40QBkKNFTwJmPXYQp3VlPnoloL5pDnZ7Ib/BfuBA+nhT2tCg6jnw++SVhzodqrp6twO8PvPt532A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a3b4395dedso40304025ab.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 01:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728981205; x=1729586005;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6gVaDSriwF5S9akQhORqAm27YecOFxvdJ7AKvsc18w=;
        b=FLscj8lNNokgggAT4lt/QfPN/iSCGVHeMad3HrzHL+YmhaNhN5AwrUmUX3M60nIpPD
         vrsY/J958r3JTtVE6fMSfHfMMVuN/JyBSVCSUd2D0wy7jYbMXyoSQ53czAST7303bq+I
         NKwFQbNiEbck1taF4GrHTgCswxCvamvlHArDyLneoulyBJXU0tgZqQbDuv9qkruHlkov
         n/hIJF7F08/r6mxuXjIVxzOrgBvzdtCHtghOhzrxWpzt4jsR88XiEdZnjqyeTQ/ONG3Y
         JHzBVBktdwv9uwIR+lBukiVxvt8ERKhu3tcT4itXLGNStJ6kjC7DK4+ymRKxGEkhU4XZ
         ZnNg==
X-Forwarded-Encrypted: i=1; AJvYcCV0q7rN5myqBkAgnERtq4NXGEB6J3NT+fOM1f2BKczj4AIWutnj2Ep09PSziYfX85YwP5yaYSO0i0g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrel5U4fBCC4n3MTSYkDLGFgPZ2KZwJs11XOkR5hvlpLCvB7LY
	muNcFM82CQZYNGDwRyIZ6C/aFNSPyHiazgrc+eoycT/M4tEC+x/zgX+W4koXGnHut2bsmlrqJiF
	G6FdIb0zkZMJjfJb3patekv2KyD4U33RcuNaiU4jDg1w3eDcK6t84eT4=
X-Google-Smtp-Source: AGHT+IEORFQpPPxNbNTUlO8T10ipbkVE6iPIvUK7JpxTN8XQMmau24jR5XiLTVQAI90UXX7g+yde1bySx4kZDR+VJH80pYA7gl+Q
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16cf:b0:3a0:8edc:d133 with SMTP id
 e9e14a558f8ab-3a3b5f94601mr122862275ab.9.1728981205423; Tue, 15 Oct 2024
 01:33:25 -0700 (PDT)
Date: Tue, 15 Oct 2024 01:33:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670e28d5.050a0220.f16b.0008.GAE@google.com>
Subject: [syzbot] Monthly usb report (Oct 2024)
From: syzbot <syzbot+listba1ecd1770f23c38128a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 13 new issues were detected and 0 were fixed.
In total, 92 issues are still open and 357 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  8249    Yes   KASAN: slab-use-after-free Read in hdm_disconnect
                   https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761
<2>  4105    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<3>  1286    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<4>  1138    Yes   INFO: rcu detected stall in hub_event
                   https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
<5>  881     Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<6>  874     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<7>  862     Yes   INFO: task hung in usb_get_descriptor (2)
                   https://syzkaller.appspot.com/bug?extid=e8db9d9e65feff8fa471
<8>  807     Yes   KASAN: invalid-free in dev_free
                   https://syzkaller.appspot.com/bug?extid=3e563d99e70973c0755c
<9>  656     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<10> 652     Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

