Return-Path: <linux-usb+bounces-20716-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92CA38340
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 13:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E70AB1885445
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 12:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB7221B183;
	Mon, 17 Feb 2025 12:43:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F721A44E
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796202; cv=none; b=hOTg7aoI879J0TOUNTkE9ZFB9lnzF2vokJcL7qGkr3/xmCimw+UBb603wjED4wgtfRZUXYlYnsqkJyK+1Xu4Yd1N9nmpk9OPdF7at1ENXk1w6skVwEDTitoa9xvjyujYO7QHpU/kHFA84YMNecMLI5zeP3D58M0zDpUz9MesFEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796202; c=relaxed/simple;
	bh=gfy8olzSmquqHJJhjiA1LH5pxILJjxhoGkIG0l69GGA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kdUTlVxoLmOHbGRNX0alLr/f70qVCmJsA7GIwF7JFW3rKgo0WyqfrI9yMWO01uCQzQxiDOT6GcAkWId+fMh93kbJ/c/L+pAOXGayZ30UREg5p7adtb7+FT9hQa+/t69X7R93JaUsY59i5FSfQw1xPecc+VlYxlQYjTi74WRNC78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d18700311dso29931205ab.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 04:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739796200; x=1740401000;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wDw9iyxevBv/9S71sfUWyLvvFNlJ388y/KtiZ8XH0Kg=;
        b=R3fpKZ2SdYtXjzjl7+7QTRJhhB5tBgyOyot/Lp6xbLv6YIAFzjsonqy9p7v+0mOnPT
         K5zqA4+0E7kyTDnxIuQ4GuQtEVafTPu49pMsLnDOtv+pjSsDXEOSTv79fV+ZCtFapRt3
         qFdxaO2LUQO3iXTStGeUyRCUzFBeD3gTR+QGYI3IGF07M05xDIAlYiiIViDbTdO1074/
         bTDiLfiCBnCIr2aFKvNry2jSgsKnxcOmZ/t38HAr/C+eMHBFYcvdpzp184Qxk4mC0P58
         uqjJdFmWHLARiDZePzu6Ff8H+dyRktV5qrZmFsRwi4EaI8JqFOZivvc56RwilkDjtVPa
         Dc6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXK5Kbd0r7aZbg9ltBxJmh1Q7CRDuIibtzQS0mWjg2ukSUHdn+Y8zqW6yc9Q1R5Z4Urp1W9AQPckb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN+Sqgfb4iVmgwzPb4rECu1gfATy4evxrFxEBp3ooxs1+y+chW
	EgjgstHMdVG0Yt2dnlDDHWdto2Q0wFO8EEb7hHLXZ9t/ZZTRbFzOwYLNLcuoLWU4H8GAXUvHwHd
	MvcsyVyl4u7mqptJ/+nTFHQ9Fo3LSoDl27fQbwUx6LdEYjWYvTeTd20U=
X-Google-Smtp-Source: AGHT+IGlpccUW1QD7Ow2Bzpb7mg9p5jU8MXnxS/kPm4Ne5LGMjmoUncNp1qWi0lWqRvQ/h1VP4nl5vTvyJUEWG7OCM5cY6qnp9Rx
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184d:b0:3cf:bb11:a3a7 with SMTP id
 e9e14a558f8ab-3d280947db4mr74719115ab.17.1739796200205; Mon, 17 Feb 2025
 04:43:20 -0800 (PST)
Date: Mon, 17 Feb 2025 04:43:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67b32ee8.050a0220.173698.0031.GAE@google.com>
Subject: [syzbot] Monthly usb report (Feb 2025)
From: syzbot <syzbot+list1f6a7b0dda28c940b98f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 7 new issues were detected and 2 were fixed.
In total, 90 issues are still open and 372 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  12045   Yes   KASAN: slab-use-after-free Read in hdm_disconnect
                   https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761
<2>  2637    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<3>  1919    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<4>  1370    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<5>  1068    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<6>  924     Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<7>  700     Yes   INFO: rcu detected stall in syscall_exit_to_user_mode (2)
                   https://syzkaller.appspot.com/bug?extid=a68ef3b1f46bc3aced5c
<8>  668     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<9>  665     Yes   WARNING: ODEBUG bug in release_nodes
                   https://syzkaller.appspot.com/bug?extid=624d9e79ec456915d85d
<10> 579     Yes   WARNING in enable_work
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

