Return-Path: <linux-usb+bounces-22131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB5A709F7
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 20:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D24BF3A86CE
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 19:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F0E1CBA02;
	Tue, 25 Mar 2025 19:07:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705391AD41F
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742929624; cv=none; b=ZnLatL77PsVXJvz5tVUhsu9c3A3gKqPeesh4jQhVU3L/wkF/wkB7NpDg/46z9Gz8lZLjgzoejSI1OsLHpQ4Xm3BqcpqWyc4vY+UvnjseqoxBJ1BnZK0iDBNE1SOnUFL3ST/dicQcGrDEncDKz620G7Hv9HpuUqC0lfeDjjrRHxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742929624; c=relaxed/simple;
	bh=WOM/LLp0RgmVJoWJDMoK3chj3lsZU2VAedMMvNUKJrk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WHljuuQfHaFpV4EV8N+e6SXKWev0WR5tg2yr/cL3QVTx9cfq4Okok3D2K1QNhvqRMDj2WMhKlmluBlCJTxfyQFNZQrqiKzY9TQ17mnxku4GUP/NNi12tWW4cxSUYqxyBlW55NbIVmSXs/+7uUFEn8PX5Iw07WjW9f06j5dhIMf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85dad58e80fso1194508639f.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 12:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742929621; x=1743534421;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsIsSKwvnvgu9UvmVVPieDuoJRM8nMXrJ64iZfB2uCc=;
        b=RUE0GVbCHEPG1mIJw45+b5ndu2t6T3sbPFWleuaxk5qnuaIP5boXGMUuuvb6DYpuvd
         51sL+10I+95v8GYCbZSoizAqiRokLyRlCmctP7hbWvKlnGrkN59MMPb6jgEDM2rW8SyZ
         1lSxCIEfnxESEGmomqihMdgucXvRWpvcgKtkEnWBNQMGcuKJksRAgLFNrAS2JTF3jFWK
         UUIbH+5QqX8Ats1Lf4PBSLjHqornauV4ldKDNEh9ZTc7OD2DLBomdELOqNPLsKKaDWUi
         niCEDYDXtgfpgzHYfZQIpoHNHL6WKYsvJQ4GDBc+BmqbF/lsJ6C4pGWwU3M2ZRy7DiG4
         VKZg==
X-Forwarded-Encrypted: i=1; AJvYcCVRDzXA0/I8Azcnds8har+6nFJhQ1yB+drQHgLJi650VyCoQWpTPpJgKXfwSpzKeqA6nZeYavjwf5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd9Q1TRGTLxjl6JBFYugJsFI4al9WJpDltSZc/Xfochh+wzPON
	BKNN86UsQ5/yTu9phescqX4p2SsQc9brRULjlOryp1m6Caz3A9/8i8DvTwseUsNCs509PJFei54
	LBdchvcDrUsd4b51eZFd07FLOyAoN6v1hBDMW/ykiT3bObPcKHmFK9MY=
X-Google-Smtp-Source: AGHT+IGPKv4GLrmy6f48OwPKgG50sMNIwGNkNf1MrfozlyeG1piUknHPlp7DUKLvYSUoScAO8IdC/7+fA/Lmxz1Tf1C42fuLvLTP
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2683:b0:3d3:f7ed:c903 with SMTP id
 e9e14a558f8ab-3d59605a645mr207012955ab.0.1742929621482; Tue, 25 Mar 2025
 12:07:01 -0700 (PDT)
Date: Tue, 25 Mar 2025 12:07:01 -0700
In-Reply-To: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in dib0700_i2c_xfer/usb_submit_urb
From: syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, 
	wsa@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com
Tested-by: syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com

Tested on:

commit:         5fc31936 Merge tag 'net-6.14-rc8' of git://git.kernel...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17c1324c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27515cfdbafbb90d
dashboard link: https://syzkaller.appspot.com/bug?extid=c38e5e60d0041a99dbf5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1459643f980000

Note: testing is done by a robot and is best-effort only.

