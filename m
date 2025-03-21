Return-Path: <linux-usb+bounces-21987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61AEA6B26A
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 01:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B586884801
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 00:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EA0374D1;
	Fri, 21 Mar 2025 00:44:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97827200CB
	for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 00:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742517882; cv=none; b=RpI+I0ihHS+vijglKSOufzmty7Kf1ZNfDMF9cB7PlFQcF8F7QjC961b/FhkOmzZAA7K71eLL6h74XT3vXP9e05kRU5+i+BGP3au6woCnaY5HqjC83JP1Da/lNdbV0fLwedS4BWUUmY3XbNCbzhIsv6En4d/MdNQsVbrHX7CUETE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742517882; c=relaxed/simple;
	bh=gVrx8JwHkvcVCcTs9bw8eqzimuLsp2e3hep1h4EuT30=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=itiARNn0E0BzWVDJ1+Yrx6154oerxCgpsNjj4Ljunb9DX1nDaKhMgcJ2TjvLs/pqVXmsyPTbnjxhR4kttTwqG3Y/aRA/7akmtJYarYuU5U5H+qMMIGwcXSJX0XiZw9RZ3drSniiKoJRvGjVjjM4T9IJvMM7EU70yxT7xDaMB9is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b3f480d86so122804939f.3
        for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 17:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742517878; x=1743122678;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLe3EfXEq7ymtnT+1ejTFU9x1KX0C5ejSjskerXlAxg=;
        b=qvtIucK1Xn+WV5TsuVPvkOEjWANLAV083IOzt7kaP3qI6qoOUEv9PUcjJ9sXcJ8mkx
         xJ8ksojM4WjIsbvKJInZ37nLEClU1fw7B73K1b5sfv4XfmobkIG5IAk61moNIOtf1NBO
         GOTnvf4X2vOgtwWefEuNhc0mlv1gCV0yPRA6f5lHY1qa+7IiY+37bG41/n5RsWoBfLge
         G06UzIt5M0uRNq0aewjWZijxB7K6i1vSXt7PmYQOjrrAzbbX6CA6Hdh4OhRlssoy48Xs
         5EAJnno3VwwjKUIPhjiqj/KDqa2UItkY1Fh1IMWcjhFTBhr+IesVl9TIWnLeDko7jLSm
         l9OA==
X-Forwarded-Encrypted: i=1; AJvYcCX+NEwIBSvkfOje2ZduvLHsuhdmLf5RSx13wj0XzAld5CRL2qA5tyGNJ4PZlKykhgU0KKfXSwsQzYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSpSulgPaT3xVFPTqMWpOk5HuBkalu36/APqzIdR3FQ9WK9FMe
	18ZBwoKZ33EmtIvzorWyhLfkc68XG0OWLmXQhfNn9r+yRe9GxcHzQQ3oDLVs1GhCl6J7wI2G5Pu
	N6q2+YNAB7cEGmeYjuvNiFiAnj4tZeyorWO7MHKoi2TP5kcOBWamzLmM=
X-Google-Smtp-Source: AGHT+IHxevJ6n34X7cYaD0ykzZlag17qgnTsXf8laxxIPzy7Zgti7tAsNnVcIMCE0N3ISW7WkjIarSLmswV+Livoq7AQsQRNyib1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3047:b0:3d2:b154:49dc with SMTP id
 e9e14a558f8ab-3d5960cd132mr19329485ab.5.1742517878710; Thu, 20 Mar 2025
 17:44:38 -0700 (PDT)
Date: Thu, 20 Mar 2025 17:44:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67dcb676.050a0220.31a16b.0016.GAE@google.com>
Subject: [syzbot] Monthly usb report (Mar 2025)
From: syzbot <syzbot+listade70b662293f9976322@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 4 new issues were detected and 2 were fixed.
In total, 85 issues are still open and 375 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  13032   Yes   KASAN: slab-use-after-free Read in hdm_disconnect
                   https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761
<2>  3328    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<3>  1931    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<4>  1385    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<5>  1142    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<6>  1096    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<7>  723     Yes   INFO: rcu detected stall in syscall_exit_to_user_mode (2)
                   https://syzkaller.appspot.com/bug?extid=a68ef3b1f46bc3aced5c
<8>  674     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<9>  667     Yes   WARNING: ODEBUG bug in release_nodes
                   https://syzkaller.appspot.com/bug?extid=624d9e79ec456915d85d
<10> 652     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

