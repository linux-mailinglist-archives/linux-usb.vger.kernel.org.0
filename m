Return-Path: <linux-usb+bounces-12294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE09384C0
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jul 2024 15:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E9E31C20AE8
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jul 2024 13:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F171662E8;
	Sun, 21 Jul 2024 13:36:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2094161914
	for <linux-usb@vger.kernel.org>; Sun, 21 Jul 2024 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721568964; cv=none; b=tyq5obOhaPK9FVeaWKXq8J6AWwEOAi1kpt82hmyOs7KCiHuY0u5+OxMwl6ALVJGfP0BWoFP0i60AEznBQTlA2jnbj1zvXPf0o45RSwnivLp60Ls9reRNXuX1jklBRzXfnpfdAo2cCpzDyMVInbMhCf7JCVIojXD0JkbiYcy2tMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721568964; c=relaxed/simple;
	bh=4U0BbAADFywgbtDIyIVL/LjKJ3rmL8ea7vGwwovYG74=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QE1uvBa2fPlf584PSYUgJ24N9flHo4yemdBS1kL2TsrRW4quKkFW1ZQH/BiGndEbYotyrqmeOMp4R4R2oDRpTL1RCj/eyUWSLWDHMJNmdsgKNJOGYdq7pgT/IXpkjHOmVuAKAOBDPQ6Hfaww7MYs+JfTfOnwQRE1l1DwnCuSzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-397fb955949so40103375ab.2
        for <linux-usb@vger.kernel.org>; Sun, 21 Jul 2024 06:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721568962; x=1722173762;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nz1UnFLAroi3pASI6lDspsZ447bwQwghhsCOEF90SzY=;
        b=GChmz9njqsV4K2hFJieLioPKkhK9GTPwUWLcjlzoLcgfrXhu6h4pGgSrRjOT7zzgXG
         qKnL8QZ+Wz8BSUwObOGl7l0YCDpx2N4rj0bgETdV9ZSXjknsb3/WfltGsVsRLzsosqXg
         R8Mb5UHlpSOJntww+IdImNx8+DL0dUykcLIXmRiw+/DlOZcLIxC8g4htFbQDcdgTSjTf
         x51SVholBVP+cCPkf/hjNvV+E43CBKcgJb8aGJ0HmNuxg63yyrKf0wC+kStUoYVWcQw5
         OVAucATXHQ7MxesqlO11DmBg6lEYTj7waBCLheTVdgQTOvqumk9NpZ5naQIYQJRaKZUs
         R1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVOfR2D+y3xGClvX2PNMW5fsA6XOMrKRrMb1Lrcbq/A6AB89V7C+ssa2LdMcTaHjW6pHAAom1w1P/pLLQO+ICxhNKfEjDRYtQ6v
X-Gm-Message-State: AOJu0YxwVRKRZ+7tnS87ia210QEZLvCl8KrgcrOER28rExvIKzLLDD3+
	wiob7uUxC6U+OP6fwJmUSdbImQKGUETUfBfJFLnB1LPJUUJ0FpqBee0teaeCBM0n+RnTw0XOKp0
	D8nkaIi2Vzixo9o08fElxNhhi7yovioaMnGYT9vcXOkgiHTuSsvUndkA=
X-Google-Smtp-Source: AGHT+IEPG2xFPa10wFFssYabV8AvacYNIR5eSjxQjBBTIk68tCS6oDKI5bQyWj0iRsonWiE63orhnCn6N1iOOL88IUCRu7hglyl4
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c04:b0:381:a6b6:2dbd with SMTP id
 e9e14a558f8ab-398e725d3f0mr4496465ab.4.1721568961906; Sun, 21 Jul 2024
 06:36:01 -0700 (PDT)
Date: Sun, 21 Jul 2024 06:36:01 -0700
In-Reply-To: <000000000000dd5b9f061ab3d7a4@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006e5e08061dc2027e@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in uevent_show
From: syzbot <syzbot+edd9fe0d3a65b14588d5@syzkaller.appspotmail.com>
To: andriy.shevchenko@linux.intel.com, f.fainelli@gmail.com, 
	fancer.lancer@gmail.com, gregkh@linuxfoundation.org, 
	ilpo.jarvinen@linux.intel.com, jirislaby@kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, marcello.bauer@9elements.com, rafael@kernel.org, 
	stern@rowland.harvard.edu, sylv@sylv.io, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit a7f3813e589fd8e2834720829a47b5eb914a9afe
Author: Marcello Sylvester Bauer <sylv@sylv.io>
Date:   Thu Apr 11 14:51:28 2024 +0000

    usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12d54f2d980000
start commit:   d35b2284e966 Add linux-next specific files for 20240607
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11d54f2d980000
console output: https://syzkaller.appspot.com/x/log.txt?x=16d54f2d980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d8bf5cd6bcca7343
dashboard link: https://syzkaller.appspot.com/bug?extid=edd9fe0d3a65b14588d5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10905c26980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1122da8c980000

Reported-by: syzbot+edd9fe0d3a65b14588d5@syzkaller.appspotmail.com
Fixes: a7f3813e589f ("usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

