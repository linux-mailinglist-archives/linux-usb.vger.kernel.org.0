Return-Path: <linux-usb+bounces-17619-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2640D9CE178
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 15:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3F0C1F21ED8
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 14:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937101CF5C0;
	Fri, 15 Nov 2024 14:42:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B0754769
	for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731681745; cv=none; b=mvEGSHdi5AwmhttZbjjlT5A7dKwRzuGtFeP/RshFgzPjyIio63tR9J7774fSYMURa8Aij6pnjwOoNJoCezuhEWMBZnM8RIBQAFMj0p+FsC2xF7AjN9DChlF10EUGo2s3WqtATRECexWEYQ5Hc+r6TneXLjBVe476owRZ5sYsKYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731681745; c=relaxed/simple;
	bh=LtNSkAzLSXCtPPaTga+LAQj/4pDrX/irLQXSdAVhvK4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iYdliADT5LL0LrQgyDw0QcJR0eYriSouj9sR844Srqdt3K5PUm4f8eMG2dRzfQlUnHoDZOWf9+hIR+TK57KvWA4i7rqrEEc2EgUk9M9G7d4c9BWHi1BHA+vImpp0T5rJyAsHEAcajx4tsxj/5gpxUsr9JbVawDlRvjMUZ9DbIgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a6b7974696so21340865ab.1
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 06:42:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731681743; x=1732286543;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbN2ypUO22bhAatVep/TVVxgQVG+AeOeRHiEpaGVRlY=;
        b=XaUvekPJtowRB5/7Yaat+VH3HyCfBQiDebfa9CKq3cJcGXjcZ/VSv71FZbIgQ/YD5I
         YKgMCEmq1GV6S/yaG5wkdMD7X7T6yxjy+gjW1ZP3twBvU5HHokDrj4uKrbb/uYiUcVD2
         61ONF9w9RrKigzAn/sZEt8OSuzzgQw9xlN1jQ4FiCFqHlsvCBjrORc0tLxo5L9868hwb
         lq1imIryEIq4e6gdJ664zAkK4PbZMUhx0dUll3qZVEcVz5mJd4qp03Jj8t5vSrXuI2gk
         Zo50l1FQyVAcnoMksdo5UR5PtR0mNMjgVig/ZEv0lmhekwNZF+fed25wVnqPwLazJC5z
         y6oA==
X-Forwarded-Encrypted: i=1; AJvYcCWCQBlZgXKBGKPi1q79aEM6W4HGLHKvEY9mW1gDsk73V6/gOTk+J4tnPrWnSXsC7F+ETmu24lfgK4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUGTcMI//w4drSF9TZlp6QdHLM9u/W0kt2ic988M3Ls9/gvLFM
	aNxfN/UlIcDdwlVeAsIHli4ZVPsP5fYqLyYNGEKo4kOc0zKZ4SdpiSJE7//r+Y5gUqjvyEatugw
	uh/Jf+JDE0/gpZtIjPfBeA4loU3uDYsEc0r84lzWoi50NNhFNLjHZ/bo=
X-Google-Smtp-Source: AGHT+IEBeF6O3ZdAfz5TdbPb9Sj1ENMdzbhjcE0E3Ozv7YtXAqQMUb3hcM5t3X3XkyzK/DVlImRQEbPw3ZkCKjXBGqhYNDrDH7di
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca4f:0:b0:3a2:7592:2c5 with SMTP id
 e9e14a558f8ab-3a748078111mr30608885ab.17.1731681743038; Fri, 15 Nov 2024
 06:42:23 -0800 (PST)
Date: Fri, 15 Nov 2024 06:42:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67375dcf.050a0220.bb738.0002.GAE@google.com>
Subject: [syzbot] Monthly usb report (Nov 2024)
From: syzbot <syzbot+list77c90b8abe21b2b55fe6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 12 new issues were detected and 1 were fixed.
In total, 100 issues are still open and 359 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  9169    Yes   KASAN: slab-use-after-free Read in hdm_disconnect
                   https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761
<2>  4442    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<3>  1537    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<4>  1524    Yes   INFO: task hung in uevent_show (2)
                   https://syzkaller.appspot.com/bug?extid=592e2ab8775dbe0bf09a
<5>  1203    Yes   INFO: rcu detected stall in hub_event
                   https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
<6>  1062    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<7>  967     Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<8>  878     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<9>  862     Yes   INFO: task hung in usb_get_descriptor (2)
                   https://syzkaller.appspot.com/bug?extid=e8db9d9e65feff8fa471
<10> 660     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

