Return-Path: <linux-usb+bounces-31793-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C06BFCE6358
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 09:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 395A7300FA09
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 08:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A85D2E1C6B;
	Mon, 29 Dec 2025 08:12:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962CC257431
	for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 08:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766995952; cv=none; b=JOoQN7cu20tTbmMFYTgAgpWcWkPTp9ljaI2V4MAZbPIwH051Ab6BTD6K2Q3p9cM57gtNKTG0dSW0pqvhATAnzd7r8u4w8q6XFGysy6efqdHhKpnA3yHxzeBXWhDpl214AVQe08dOoCWX6R2jhKj7xcbvJQ33VT9asUujhHNlc0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766995952; c=relaxed/simple;
	bh=Rrlz275y1aWNSMm4m0y+jrrXx3XFMn02TjQ0EBJHPPc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=u+UBAD+Ov/SE14tQX/9tzG33g8oGHURliLl1QCqhJC00HnAS13z7yrNkS+NNeuyJathd9VsH2G4lzVBUudIz6ogi0YllvOwX8rTyHX58uIXUjJCfMWaZV0MePQDbwhmWrlUsf6D1FSBQ1B086h/7HDGwOOxuCRo7fNqJyeFTTxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7c72ccd60f5so21103810a34.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 00:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766995949; x=1767600749;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9E7Q9KyxjjRA7BSH00pAcN19gwV5HKsdKTMGUXCavE=;
        b=POjNzM9kti5vXvSuqOcV/TKOv33PuxZMWCcOwUBE5WBMEGXXGtOrKXeyYt/cS90Nzu
         kVKIObmiVcofmsGAoPXMnOxNHTxwNVXC+T4AQgnc5nqdxiZldj+BbOr57pNXjV6IC7bO
         1pVBM8YYLEKiAloiRhqpPTdl1FEMASL1a+rW9rRYIHqA8Qiq6tFpe7epkGTsA95NS0Qx
         eVwITu71HMbcVl0czeBdnHKWul+Nrw+rcu7ExPjGPe3INkMbTcqZXcOmlmDK1xodVHBG
         Fbo5GpLQNAp1Yoote8L9vfQudXFUqmgmPB96KqIWAAX3eLUTKpwMwtiRzv9iiI/q9Eva
         GnIw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ4tK22JX3/SxWNP5E4QhYQ7RC8loy9FDgFKleYinYimxFH63uZk4gRkG9hqUbJBjKKFLFEI1DXIM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6G8sQYqfnfaFg7gEruF3YWkq7EDpmAILfh9Q1MCVlHXPJfnal
	fjLgqHmPhK/cLl2i7wxQf1elZp7h1p3pAIhN5Wr8VUzQSa/5H/M/n6KhpS+gGSMKBH1jZk2pn+3
	R//u6xHsUp4ojdPDBFK53l5I74VA5g3xl3OaKj1emNwlVxJRWXnOX46snpTk=
X-Google-Smtp-Source: AGHT+IHjeaKE8BtS39VGIt6q842BcgLQltYsmEgFO10No6ceTlGYFK9Ednpb7xl8AHAftdwIQjL9T/UYlmPaKpjJVJPG9fz5jRcU
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:611:b0:65b:3957:697a with SMTP id
 006d021491bc7-65d0ea97125mr13948035eaf.41.1766995949483; Mon, 29 Dec 2025
 00:12:29 -0800 (PST)
Date: Mon, 29 Dec 2025 00:12:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <695237ed.a70a0220.c527.0023.GAE@google.com>
Subject: [syzbot] Monthly usb report (Dec 2025)
From: syzbot <syzbot+listaf526c275c87de3776e4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 8 new issues were detected and 0 were fixed.
In total, 81 issues are still open and 402 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  6725    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<2>  5297    No    WARNING in kcov_remote_start (6)
                   https://syzkaller.appspot.com/bug?extid=3f51ad7ac3ae57a6fdcc
<3>  4187    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<4>  3195    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<5>  2150    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<6>  2026    Yes   possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<7>  1999    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<8>  1413    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<9>  1199    Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<10> 918     Yes   INFO: task hung in hub_port_init (3)
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

