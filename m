Return-Path: <linux-usb+bounces-23297-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC86AA9658F
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 12:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26484189D501
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 10:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68440215066;
	Tue, 22 Apr 2025 10:11:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C85D20C49E
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316698; cv=none; b=TA1E/QK/OS0kk3ssY6QGp8tegu38z3JNBV90Qxn6Qw91dUGDY+LKalQFbWY4rf3X4GoMWmvHmNskIVhnOQXq3+WjqauYy1v0Swr8ke+MlB38k4A63R5dKNbn16rbVc/fYb0MMAL1IZ0lwRmtEhyQ/FGVM1VWIhx5qXL3NtPO2bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316698; c=relaxed/simple;
	bh=MWUFUNecvpXcdMbud403wZ/d6p1TLqwCZ5uEPwkbkG4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=onJwv3LyjRT3JNOqwzl8MoqBd0HqN9laRjH5/15MeZGUvhdjvPMKxbMBepMZwJt2YJXTX6cmmOmc1DOcYqCOQzAMbwJ3YtaRhm8seSMjgWZ7q7sMoO5QpuaCZ2hpo4YqINlyE+9iKmy/uTSRTY9vzwL02pkqWmYIBcQ6hiQHd9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d6e10e3644so50998615ab.1
        for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 03:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316695; x=1745921495;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7by8Hd1y07KQKCgDpakP7z5mlzzdM53Tyvd/b08rTLM=;
        b=jNMpcD8l8GG2me9kZ5EqxFWrfyxNAiZ6ixUg6Guk3LOVlHBds5s0ottVj+gyhgh//x
         UATJ7g3yxxfULvJIEzt4/lsOelpqU6SPzQuXDxHdkLhS4JT4ROY7qCUPtmoOuo3H9Nte
         UO08Agb/0xPFZ/4+U0xsJ3pHw334n0sU6ALaVugrL+m43pVCDW38taxa8WEOEvP1t0eI
         j4kmbQ5exCuD8XvKipjxssDtRuc5xgYfV3cx2aeG7h7+RB+htWoOu6OaUiHMRF35dgVb
         pmLB6UM0plVEZuIC9IdOKnff3dubSF22iOaYxdhyPWL+BD9bh3ipXy4LsN7fD6gsrPXh
         NJZg==
X-Forwarded-Encrypted: i=1; AJvYcCUoSsiTm0PejCCxLGpHilVu4XXQuNvU6vKceveaPSLb2RyAKy9NR3RiOAbg8UUKXuDh1fPhiNrBPmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdKdFfs8Ka80fpPZHUGienWGCy0NFw06ZE1d5qCB+SEk3lA3pV
	HpSbPmaOC7CscyhvoiyRRF+DSg2z8xizaPQxcT6KYJRp2vs23iXcBbElR5DAy/YzAFTbtvurd4O
	ZPv7RcUNWG7CVzo/xix9fKf79AeYMwN7b169SZZRrqVc40PWXmIlEy+E=
X-Google-Smtp-Source: AGHT+IG4ZJd9zZVzc2dbL/TOKSbKtOJRI6V0rqKfbiaN2WZbk3d5sAhqrMmm7zSN2g7xud56+4VnBqwqEJfmt/15e4aq+3oUUELH
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c0b:b0:3d8:2178:5c79 with SMTP id
 e9e14a558f8ab-3d88ed9561bmr158041055ab.7.1745316695258; Tue, 22 Apr 2025
 03:11:35 -0700 (PDT)
Date: Tue, 22 Apr 2025 03:11:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68076b57.050a0220.8500a.0009.GAE@google.com>
Subject: [syzbot] Monthly usb report (Apr 2025)
From: syzbot <syzbot+listc77a48b31fc59287ba96@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 5 new issues were detected and 0 were fixed.
In total, 89 issues are still open and 376 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  13990   Yes   KASAN: slab-use-after-free Read in hdm_disconnect
                   https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761
<2>  8298    Yes   WARNING in ath6kl_bmi_get_target_info (2)
                   https://syzkaller.appspot.com/bug?extid=92c6dd14aaa230be6855
<3>  3819    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<4>  3395    Yes   WARNING in plfxlc_mac_release
                   https://syzkaller.appspot.com/bug?extid=51a42f7c2e399392ea82
<5>  2051    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<6>  1387    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<7>  1253    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<8>  1108    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<9>  1273    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<10> 766     Yes   INFO: rcu detected stall in syscall_exit_to_user_mode (2)
                   https://syzkaller.appspot.com/bug?extid=a68ef3b1f46bc3aced5c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

