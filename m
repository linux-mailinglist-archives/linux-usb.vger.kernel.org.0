Return-Path: <linux-usb+bounces-27236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E7EB339D4
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 10:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAC93188560E
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 08:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13432BDC28;
	Mon, 25 Aug 2025 08:44:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A785F1E231E
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756111480; cv=none; b=JSijjsJMNYanC0RhTacYlKiiLh5takGvGbAVp6sewogwqsHG6XXzXQGPQKbEZTR3b7uMURZ9nDg37ZWOTXnjDHo5G4LoLnQf3B67DjolUovrplDVCeLGX71TZmRIruCwBjTaXhD54HzC7cn25lTvAhUoy/cgKcgkdSBo9F5ka98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756111480; c=relaxed/simple;
	bh=60YGKx1jOXWqzikn9Qdwng7JZDsIVBL6yOYKm8/8GhM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dGUF1ULvaPT3oCW2+2+I14VszkRvcRcmBtcKP+FAMXDgcUEp6Hvexj0l/UPxUPahCxNo0gmEpZrIxjoK77VsXe4hSjOPZv2pXbzM2WnLNxcv9f7S5SJtqoIBTVDLFREciKE/YeXOsDrpMK34UolNpb3try8OducZ5OCD503uJD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3e671c9e964so42649315ab.3
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 01:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756111478; x=1756716278;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27gF5zpDZDPhSEuAe3Ncb5f06Cl0miIJLfhXt+1oVn0=;
        b=Itlim+/2TCkIcqeLdjivlQfrIFnRiGIvRqR/vgjUGZvCrj9l9+u/kVMhLycYPFR8Y4
         n2YZdBV7s8kSVdCCKQLgSvCzfBfH9p2l98vEDxfhXhjapUvBw5AewNmDV5RxEYtS/mMs
         QCKGKbwYpieGlJfxWBf198c0E4NVOtXaO6PZ/HrWdqnQgM1iwyNqJHaKzbyjowAL/b/0
         oxc9Ym1CsHLNKhMJPuw+UFDjzcYYmt6Y0HqLtLNshWEA2B3fLizQKDvRCbI0J+rEfUGy
         JRLypJWFT3L58f7Xde5B7rC4Csuk/61p1oTBhGKkM+45Goo2k+MHF4JDtuz2aMePe3Kn
         NhFA==
X-Forwarded-Encrypted: i=1; AJvYcCV2J5nOQXOS2fDagQBDBHBAjMlPP7Dnx3kr7NeziJmQwD7WHHxBK3+GfObbLVx0F2MiJPkNSPxUdpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZtjWO/ZQzr03v1LoZ2dAS/56iUXG0Gqp6Zlu5GOQqibTTt8C7
	HrsYMJIcbKo+OdDhy5k8NcmxiWezoAl8h6H3QA0VO0wN61e92y2AA/TlINb8qK5tnsjltPICBfT
	/vuZndTTPAbSKQwh1nAOVtwMEJyk6G8NO3izVtjRbku2+CPVXjTBHEprkINk=
X-Google-Smtp-Source: AGHT+IE4ixtNXfe9U/VI3FK5ddT/fLjiPEmCNsFQNmL6djAfqRsUe1ELUMgZHuAKwgDgI37kKkC2JR8BEu6zib3XeM3jH6IJTkTK
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19cf:b0:3ec:6e58:beb5 with SMTP id
 e9e14a558f8ab-3ec6e58c207mr42422425ab.3.1756111477864; Mon, 25 Aug 2025
 01:44:37 -0700 (PDT)
Date: Mon, 25 Aug 2025 01:44:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ac2275.a00a0220.33401d.0405.GAE@google.com>
Subject: [syzbot] Monthly usb report (Aug 2025)
From: syzbot <syzbot+listfc56ad5a17ace4adf6e6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 3 new issues were detected and 1 were fixed.
In total, 81 issues are still open and 390 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  17047   Yes   KASAN: slab-use-after-free Read in hdm_disconnect
                   https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761
<2>  5297    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<3>  2703    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<4>  2176    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<5>  1454    Yes   possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<6>  1418    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<7>  1396    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<8>  907     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<9>  734     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<10> 532     Yes   WARNING in usb_tx_block/usb_submit_urb
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

