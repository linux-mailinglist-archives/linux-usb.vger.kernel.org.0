Return-Path: <linux-usb+bounces-29677-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5C6C0BE01
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 06:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DD1B18A151A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 05:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470412D8376;
	Mon, 27 Oct 2025 05:54:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522452D6619
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544475; cv=none; b=Tsaz24gEaCjMshZjak34ntVsCVmyFPl/+W3sTMd0XEfRbWp43LdV1a9uFr5WTdNiuoee9SgM36pbWuu4hAlQMbYjvq4ys+uuMpb3pJVD8s8+FOdpN5i7nyzSWCm9FvpExEkRaf98ZFlQ+94CKSuE8raqGP/jyX8AaLBfPBuGErE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544475; c=relaxed/simple;
	bh=cmSLGSqzlwkrEz2X2oOZHZFSJCV4L2jalMylM0No7Io=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=tuG61wVVnMIxFkYbDmXvKHpufNioYfEPZo+sWFA/0BTjhT4Cc4TiPsrljYk8IHsESbx1HenNKBXEA4KfF6a50m/2GmNf8d+al3XUeSNhNdcl2oEVqjrNu6wCyOO+k+GqlVcbImauHtqs/xdunP5QRhj9zDDCnSNHW2byDAutlOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-9374627bb7eso631128339f.1
        for <linux-usb@vger.kernel.org>; Sun, 26 Oct 2025 22:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761544473; x=1762149273;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZp28NjdJKGwBUq3/2ykCbGX8yok1IocFBjHQARFKno=;
        b=Zp+XMjEPhUk/cI+OhwpHoKBJ8Nn60ck9SaECtQe9d9Fg5fHOr9v3E9O7ZEWG6ElmRk
         lXzUvfhKfugf+dDYBq+HBOudF2jRwD2fiSM6FRW3FGcygSQANnWRHLGe0si3a3hUBw9a
         1TQ1J9c5jV7W/twWvUdjoI+1x6Yn0BD9fPu0dTEXaNOneF/tf71kUR0D5vdtLiHHKzAU
         CykxYYNzja+mGbGvKwdsXbPUeMmT4WAqultF4LKR3L2PX3lbJoALdvv8r8C5JJxiG/oX
         Jtlpp3PLVWO9qYVjKzz3UocqmdDsG7RUbB0NoUGTJJk5cwEOohTLcW2fEQIztARkUa9x
         MLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWagazx9nkkjWgYyDx2GRTh4bys02/X/P86FFeek1QvB5/3p7sSkCyaHR+laVm+XshqK9a/KIqgk54=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQFEZ0T1mjYIRedDOrT7IHZ3WfW3oUjMgGtSGODKeNAczG17xJ
	wdo4kfE1XRL+LLfR9FKptlzHk2qqF9FOaAsXVbC9PymPUwLSyVQKniIP+uVikYLKSUjlfEz1T9j
	lsRN9ZV4bUtUCVZtfTpIyTcap0b4dZEVDzfmJSHxZrAsnhZlZAekSn7jMUYc=
X-Google-Smtp-Source: AGHT+IGY4gsXql+Hprkct6Kf8jFxNCHba3q7qNRC+C6hMn/c5MdAvhYtCoYn45eXrZwwq0oykrvOq8zlye4qhU+EHNKB8NqdcURk
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3701:b0:430:b2a8:a9eb with SMTP id
 e9e14a558f8ab-431eb5f2f70mr134632585ab.1.1761544473438; Sun, 26 Oct 2025
 22:54:33 -0700 (PDT)
Date: Sun, 26 Oct 2025 22:54:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ff0919.050a0220.3344a1.028b.GAE@google.com>
Subject: [syzbot] Monthly usb report (Oct 2025)
From: syzbot <syzbot+list7c0b53ef3161a67fa35a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 4 new issues were detected and 2 were fixed.
In total, 79 issues are still open and 398 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  5985    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<2>  3364    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<3>  2780    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<4>  1578    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<5>  1405    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<6>  998     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<7>  807     Yes   INFO: rcu detected stall in syscall_exit_to_user_mode (2)
                   https://syzkaller.appspot.com/bug?extid=a68ef3b1f46bc3aced5c
<8>  806     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<9>  541     Yes   WARNING in usb_tx_block/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=355c68b459d1d96c4d06
<10> 501     No    INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

