Return-Path: <linux-usb+bounces-24231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB13AC0C12
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 14:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D76E97A3EE7
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 12:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D892B28BAB5;
	Thu, 22 May 2025 12:58:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193D828BA83
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918710; cv=none; b=k5efwHLXJAE4cXAlfUA92m8IExH8MxHl6tVFFNy451037NMlZn8wc6WEgDNr3gmmM4s9PtlNdJ4OqXpP/YEL0Xp+wFk5kXKnnTICvN+3eLcUj7Q1g1XCDLf6GOJb9UQPWymH8OkXrbwUOtJ9KTL0VZx08W+smqIKJLvF3FYXigs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918710; c=relaxed/simple;
	bh=9NEiDlZ/5EMv3utNxd98rgwGqf0oxLDu+Ao4Q9/HPHU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TImxDIQAjCbpwaCauOrJxyh6BPDnO1LiW1hXGcNUuSNYOPlTb0QoI4kHG8KovNV3r3XYAg1f2lXzFH04YTmeFyVLaPYHJkudw8k8AOKzXwcDiBaY4F22GO89HFcLjcVvAkD00PH4KqRPzMH7qyk+ISniG2bBwVbebxXG6JnqVJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b418faf73so1350842639f.1
        for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 05:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918708; x=1748523508;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8GUGOx1mbmwZ48+UsYwPMItPU9r/8O8GI2wCz84pUa0=;
        b=wsQW5RUjTY1vpRCVpl4grWmoeEu4KwAKdCz4fUkBN1BiTsJvm4lwVicMj4I/X5x0i8
         jlwDbT+ShrBuujE8hSBJP9fVKPbWfkTrGerx0+MH1Gr5HqdVmCtxTri4kEIQK+jRGcgx
         fNSgBzRx0JTGlIKA013GvYJ/lEkGWObpEpIRLh7Tx2wieL0vM1gxTxKKY1MGFDtBZEOp
         feEwFSKgy+YOOWckMmAMDWFjgXwrGkrcyM9vcu5Q1zFqcCsTKLIGImUfdyP6ov2BQmcQ
         cWNZ1vTpx7ChVdlLaiaP7LrlZk2J91zDokw6GZ4NeDH/UmyGx5HrttK6X4TczmNiWBPS
         0CeA==
X-Forwarded-Encrypted: i=1; AJvYcCUnaAHbmayWxTxoMb83lDGaSW0mvrH3YOhmXjgvlz/VObkSxXinR02uKI1DtAFaIA7xTmxlV7tOaXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgxVrkKbf5gVax4voVvpY9HPR+JKsd1lEwfbw+5X3hHlJgYybI
	O9RAdqZdhxYowOrqjvTMwxuw4tIvW24ctpGrpvhCKRtKvhxo3v7cQK4fxirjbmxEssCUD5sjL8f
	2+HE3P6vf5XEsmSM/5rBgPLkQatYStf7tA0VMChY7eDSEYMAy/gSPpNeuVAk=
X-Google-Smtp-Source: AGHT+IHDEHTPqZiK/6s0Uuc9IWjO0zZ9IirjgjLcS19OmRsKitxdrlf75FTDHbk6UEphj0Wz+jqq4EFCwYJIjBH4WxA/zuVnOO8a
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4087:b0:864:4ab4:adf1 with SMTP id
 ca18e2360f4ac-86a2327d22cmr3043569939f.13.1747918708146; Thu, 22 May 2025
 05:58:28 -0700 (PDT)
Date: Thu, 22 May 2025 05:58:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682f1f74.a00a0220.2a3337.001b.GAE@google.com>
Subject: [syzbot] Monthly usb report (May 2025)
From: syzbot <syzbot+list431b29af76eb8b41eafb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 6 new issues were detected and 1 were fixed.
In total, 95 issues are still open and 378 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  14709   Yes   KASAN: slab-use-after-free Read in hdm_disconnect
                   https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761
<2>  9154    Yes   WARNING in ath6kl_bmi_get_target_info (2)
                   https://syzkaller.appspot.com/bug?extid=92c6dd14aaa230be6855
<3>  4164    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<4>  3644    Yes   WARNING in plfxlc_mac_release
                   https://syzkaller.appspot.com/bug?extid=51a42f7c2e399392ea82
<5>  2125    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<6>  1513    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<7>  1460    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<8>  1149    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<9>  798     Yes   INFO: rcu detected stall in syscall_exit_to_user_mode (2)
                   https://syzkaller.appspot.com/bug?extid=a68ef3b1f46bc3aced5c
<10> 752     Yes   WARNING in enable_work
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

