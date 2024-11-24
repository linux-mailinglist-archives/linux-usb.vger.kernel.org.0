Return-Path: <linux-usb+bounces-17818-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F309D6CC5
	for <lists+linux-usb@lfdr.de>; Sun, 24 Nov 2024 07:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B928B213C5
	for <lists+linux-usb@lfdr.de>; Sun, 24 Nov 2024 06:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AA9188704;
	Sun, 24 Nov 2024 06:15:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F211186E20
	for <linux-usb@vger.kernel.org>; Sun, 24 Nov 2024 06:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732428905; cv=none; b=QPB2WfLQThMg/J2ydFlzg7IjIyxZ18rLXcMv6xpy/ZViabDkGKccfU6C0rYZe8w9jzdakDBd3T9fBfEdPXnBq5ozDxfzX6em8Agl7bbbl0+LIltgfqfDn8VT8rG6vRHdvPTdDkpIYz7wYl6mpFFsFMeJ5J0+LWVsrb1Te+bARIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732428905; c=relaxed/simple;
	bh=yeNCFnf7JLEG+Txx7kfYTh9rCxVCgbbE10o8+WBLx8w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WmbjUCfX0ViURDg74FG937eJ4YsI3xoqG6p8aLylrjvw8cwBNh+OplufAgVv35a4oTNlla2ytCKcVZYvhlRrTxkDkvm2tJ6WhdwCpZMppLjD+iDweKIEB08ks2EhKZeOwUX46q+Y7T9gxFXObMkijvgzCyC2GnBVQnOctv1f/nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-83abf723da3so345163539f.3
        for <linux-usb@vger.kernel.org>; Sat, 23 Nov 2024 22:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732428902; x=1733033702;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37DcHQSnQqigjF3B9FsTGkJi7xMOT+nc2TbxsA+afeU=;
        b=IhVeQQPCNbLjyxYD9ph64uNE13QR9pbH6Ypbg9YdD1ex8vgCvuq5bCh+8mhd39p9lG
         fMWgMmVHVq+U4qJ0k1fnI4R9iv3umpxT61TPJlhToMm840quQJStlGI76GlWNac7fiMt
         avCWgPfi2ipAYsWS6rjR2L7NUCM1LacWjzjH0wRgw2Eod98nq2l4rNl0zpB5U1qZXvcF
         Nm4sP9pIDFQXwUJZOBcehobSyLYYAYpzlEJ1TTVy6VSOMMoHcN6m2kmg4KcXTSOHR3g5
         PJDr7spJehJw78Ys+9WhKZTB8DuB7sddELLepxZJep1EzOEY3ktcAbOPZHAxM5jg7AVi
         Czzg==
X-Forwarded-Encrypted: i=1; AJvYcCW951fGVaNcuYdG2xMJzpTT69EtF0Gdpkml5kvNHXr+J+Q9+IcO7HApoW1S8pvsor4O7JTQgBG/6D4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkOY9FFq0ny69h32BDpl3W+r5VYznyqh3EVgcmMx0Jhsgw0+si
	lTfFsUZfHxsOfY4kFRdBj8TlRfsLRmEaQIdvv6SNVXe6g3h+MThNG96DENJNxI9l8umTtROuz/Y
	CRsWlU8WkqVzqXVpowZMU2TDirQpSWmwcM1bBugIkJRi/HCiXRz0hKZg=
X-Google-Smtp-Source: AGHT+IHDP9UJh3rqI8nZi1MSqLFUDpvVT0wVt5S1MLnMyJKsK9GRuY2H5qd8nRzXlcfdutVRyKeYTPxJifHIQ5RI3PvhoWGNt+4g
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12cc:b0:3a7:7f30:18e1 with SMTP id
 e9e14a558f8ab-3a79aeacd61mr71302945ab.17.1732428902704; Sat, 23 Nov 2024
 22:15:02 -0800 (PST)
Date: Sat, 23 Nov 2024 22:15:02 -0800
In-Reply-To: <66f5cc9a.050a0220.46d20.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6742c466.050a0220.1cc393.0035.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in iguanair_probe/usb_submit_urb (2)
From: syzbot <syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	oneukum@suse.com, sean@mess.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit b3e40fc85735b787ce65909619fcd173107113c2
Author: Oliver Neukum <oneukum@suse.com>
Date:   Thu May 2 11:51:40 2024 +0000

    USB: usb_parse_endpoint: ignore reserved bits

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=135d0530580000
start commit:   43fb83c17ba2 Merge tag 'soc-arm-6.13' of git://git.kernel...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10dd0530580000
console output: https://syzkaller.appspot.com/x/log.txt?x=175d0530580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58b000b917043826
dashboard link: https://syzkaller.appspot.com/bug?extid=ffba8e636870dac0e0c0
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12515930580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11ca8ec0580000

Reported-by: syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com
Fixes: b3e40fc85735 ("USB: usb_parse_endpoint: ignore reserved bits")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

