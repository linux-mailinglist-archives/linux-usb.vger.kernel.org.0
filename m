Return-Path: <linux-usb+bounces-31006-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBD1C8E4B1
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 13:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B2FD3A6D6F
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 12:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67BB332901;
	Thu, 27 Nov 2025 12:43:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56C8331A41
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247416; cv=none; b=oittfYfZsVv8Tggtr7fIpPta/67GvnzFTrx/klrU5JGElKD9/QSSa2OeAfKM5Lhh8sx6b51NQ0nLlYbxaxo09EgbcfMQ6DZz42PFnw+SbhDeLegM2v7MB6KJrFJa249mnv1eVab4OM0Tlu7n9Mj9SOo4AhakyA5n2A5g0duprlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247416; c=relaxed/simple;
	bh=htpQjyGg6rbL8pVJRI8Z62yalTqT/UlYgmSsEjm1l/g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AX1VZwE+nRx59ovehBIDPFKcCKxLAKkWE8Fzr96XixNut8bid3IcFb4VWHQWqVBBEzI6RFGs5G8ehqtHzQLfpWleyVcUsvge3ahI6NPgJSM0N12dYf5fRP2T47ZklBaINKxERnl7VtKvqYQSS+lGd0f8Eb6bUW+IDytAv5o+6O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-949056882beso51296539f.2
        for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 04:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764247414; x=1764852214;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1YF+f9gxsYrbRK90d6oxxj20fDjsgXfWi5xDRotlj30=;
        b=FfKhafBHvHV5iKwnPH4yynn2Ihr5yVKy0U3jr7KUB9ns5TsEJoZ959OC6bWMdYVfeI
         +cSrwK9qyGP0NO/s9SmeAJTkYSz+spB8cPvwx1RgupIvMI7i4AHoajE4FDge8ErlsvST
         06VNm53ZpH/attkoRkEohuVul6QCqHxQzbU/l30GKnTc0BBeyDq7ZHmKOMaHBkgOOotZ
         ikk5xdAWhy6XY24czH2m7WgVv1RNyLT3VfAtgrdlAm+c7HaDDx02QJY6HKHj6EocTnDQ
         xbclsQZKHirI7wJBRqd26bUVZVuBNEsuNm/pxd10ajejzQgv3o36z8wia4aPpELpqFXg
         cyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKSmC/N7XA55bXhOIvQTKxsy6J53zud4Y5XIrX5wU4dbU5ewsNPkZWpWwIW9PLhoGD4r8Yr4Y4XJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMV56usLpaiTzdRJ3i8GH/Z9ads9A8jx/DGU/+vwIqVBeErgPT
	aNdNFJMwSkFg77IxmKsDPLqY9P8jNUQz+ZU4DBYEVoS+PMXo6/BzhfVV7BqIxSwusUEeI6w+BAJ
	5Gby8457Ltx/8tigMsp5XRn1AuhtgNDq5IwgdPhjN7EVTzgUd1LJB72djKGk=
X-Google-Smtp-Source: AGHT+IGiFOaYwaQvJtH2XjtTe/5PPk4b+HZ1y5xwxIvm7wGJyXqr9bNMrSgIgFCoqtu3AJATKUT0/svzh3b5Da/635LvIv/SmnWR
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b42:b0:433:74ba:8be9 with SMTP id
 e9e14a558f8ab-435b9845bb0mr190411075ab.5.1764247413954; Thu, 27 Nov 2025
 04:43:33 -0800 (PST)
Date: Thu, 27 Nov 2025 04:43:33 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69284775.a70a0220.d98e3.0106.GAE@google.com>
Subject: [syzbot] Monthly usb report (Nov 2025)
From: syzbot <syzbot+lista20ff1fea8bd2755f707@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 3 new issues were detected and 1 were fixed.
In total, 76 issues are still open and 401 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  6383    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<2>  3842    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<3>  3008    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<4>  2141    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<5>  1824    Yes   possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<6>  1646    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<7>  1411    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<8>  1068    Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<9>  853     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<10> 807     Yes   INFO: rcu detected stall in syscall_exit_to_user_mode (2)
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

