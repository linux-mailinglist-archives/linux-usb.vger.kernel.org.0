Return-Path: <linux-usb+bounces-19480-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AB8A14DB1
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 11:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 539E57A07E3
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 10:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97B41FDE23;
	Fri, 17 Jan 2025 10:35:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44571FCCEF
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 10:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110130; cv=none; b=bzdukpyndeoOgkba8XL6lQPq5MqdGpgmOGGGCWNg72m2YCn8s9f6g9AdPnJtZuDREIbHYgNjxzZYCNyQbxE4/1xgUnyWK9/80WLWQKAW8pK2uhV2pbV0ZCNj1uEaUle2F0B0HBaP4H7bqOrvKQfYd2MTIxtFc3RbWRFebpamXD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110130; c=relaxed/simple;
	bh=LEbsSAoduuw6dbwpnRoztKpqMuNvDUTct96we7tyjWs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dc91EZxBmvb6vACtw5weX8JQQjUyaFJzJ01gzQfaOodBfIP9P7Yg4Huz1mhVrZ/DO8zXD6KXzwS3pPc5hJ13eytVD9DHmCodP6Q5cDqpwVact7keEmmFLdMwEQRiYGCk3F3wVajsgEuez6NQXkZ25Qk/7hnsBRhZDE0NZ+/mMTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce848eae40so29268565ab.2
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 02:35:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737110128; x=1737714928;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPOTt8WIH9oz3pJRz3X1OkRlX8zPBtnSu1hKhNRvgzA=;
        b=ZGR5mipmsJeh9W9xW3vhMCCHZTRHAKqXQ3FzyWP/xDegP+hK3zOjaX+k38nLbWzn+4
         b3jU3ZRMQhbznPSgIJ66P/IBTyb/KbZ3RhhIiUIJANvKf4pz1pAznfqpyBPHnPKF/tSo
         OaWme704VOCj8VX//5axQvEaNPMeXtjmnvaI7o3fFqcBkwwBZ06cG0ATvvCoSKKMt/NE
         W4EN+XCrwjLkyBg3t2O0BPCsJH+0pegKwjcS2aW2h8KcvePvJFaVjuIKWVg7dGI7H4lg
         wdSwniS//BwHSQjwWJbPxIXT2BX6TvIdrZpnMiNOgX5cF0aMeTGawbtZrAzmYGUe0yOb
         tWlg==
X-Forwarded-Encrypted: i=1; AJvYcCVhpybf5dZHLlah5jwuYi5mvnyFyht9eHyse5COFY8DBj5/nN3z4mlsc8I2+ReU8o3oiNrqD/3JQos=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJaeDsOKkxdm5uonpgYemy6NJDugrkCGZOxSQHtmmSs9wN4qQZ
	7gbo3vmqa5vYh1UHpv0Ja+X+5LxfSlc+t/w43oF4YoVKDC7jpT6olVyZB6en4VdTRmuN6ZqrWOJ
	u+mCobqjKmeAhu4T5dON6YbLJ/ho23BGE8pLbDVIwE1yklp+mN3qcRrs=
X-Google-Smtp-Source: AGHT+IHc06/fdRYkEEBnIuhhdcr7wlaExc3TrSiqtf+GZOI+qD0rIFHHQKSxrIsWp50C5QRU4eMBiYzm2+3Vekso3OuHl+HEAtKU
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b0e:b0:3a0:8c5f:90c0 with SMTP id
 e9e14a558f8ab-3cf744242d3mr14996365ab.10.1737110128013; Fri, 17 Jan 2025
 02:35:28 -0800 (PST)
Date: Fri, 17 Jan 2025 02:35:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <678a326f.050a0220.20d369.005a.GAE@google.com>
Subject: [syzbot] Monthly usb report (Jan 2025)
From: syzbot <syzbot+list56ddc892c28a2226dc97@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 1 new issues were detected and 0 were fixed.
In total, 92 issues are still open and 366 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  11028   Yes   KASAN: slab-use-after-free Read in hdm_disconnect
                   https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761
<2>  2087    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<3>  1905    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<4>  1368    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<5>  1163    Yes   KASAN: invalid-free in dev_free
                   https://syzkaller.appspot.com/bug?extid=3e563d99e70973c0755c
<6>  1046    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<7>  799     Yes   possible deadlock in blk_mq_alloc_request
                   https://syzkaller.appspot.com/bug?extid=ca7d7c797fee31d2b474
<8>  793     Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<9>  665     Yes   INFO: rcu detected stall in syscall_exit_to_user_mode (2)
                   https://syzkaller.appspot.com/bug?extid=a68ef3b1f46bc3aced5c
<10> 664     Yes   INFO: task hung in hub_port_init (3)
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

