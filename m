Return-Path: <linux-usb+bounces-17047-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A089BB3B2
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 12:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7FF0B24420
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 11:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD091B2186;
	Mon,  4 Nov 2024 11:31:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E105C18B473
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730719866; cv=none; b=dTxrUQY0PAd5RAzJyAX6aDO+Vr2P9gP+84tqEYCA9ryJOUhvngBtlFgIJPtJXjTrNBkJXhBE9EVAq3Twst5hVcJTO4u7GMFVZjO4br8VhgSNjjFJ3bejopR+fynrpjWHylLDYYPp2M45BxoBY7Mr/RTlRIPQyz6U/ttTV+zVlF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730719866; c=relaxed/simple;
	bh=USTEXjGieWszLGj5z6r32OOADjpD4CWIcX6mjLJKHQ4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=csRXmwxOSFiwKPbN4XZHIr0P1KtvPajnc8h5zRGwBOjTsWA8Q71U2Xwb0DPAzk89vJSp5wkrQg9D3llLhNSD0x5aYrPy9NzNIAQaBeFf3fsagIffdcbSHZ/WBLjxOi8wvJzLRMtuXwVP30BZz2tn9wG+MK5JZjieoUb+bRtzXos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-83ae0af926dso418249639f.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 03:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730719864; x=1731324664;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7K+Rxi0VCaGxt4BQbyfBUCQ8LjiJXLegtr22yoocie0=;
        b=GbM+gUX44ZgIw+xHWSyd/q/VMA9VWm72F+i+4YvbtPogDVxgpRpCjZakc5xaLQgU9o
         Lag3RE2d4qbDzc8Ay5uxmqFzv/geSvm0Vqhutg7q1Gn7duxQYkUE2dyncSN8nM9XXI4Q
         3u79Hor4ZxBLIdW2TtO+L618uEB6Vd/71JKH+buIxW0ca1eoiNw7lf5A39DaTdouiYrB
         cK6QICflBeo8UnnVpMJ2tTYrtukuDWw/49IbgNA/3LJ88PMU9dQ/MepCN+pjZ8Do69Ep
         viWzVQI6avd+fRVYzcztJus2r0tz2K7e5u2JgIpV2fI2r3ZH4vEA/B097bY3gZr7tnD3
         sLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaWmfhCcjy2P1SFOtKroyunqH7M+puprin9nJqpo2fsmWII8MLTT9ANAYbfsTADSeeWBC7K9GSzuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX0QXeWURyd+t/DHxNGERXctBtpS54yB0HfvBL9dPc4r+GGmVL
	Rou+blAldTAKlDOFZ1hWYJjjoyGKIq3lasPFiCcC6tFDw7jWZw2QpV1tonfKOgvdIembUO88HWt
	5m0Def9k9mh5IwLpdS7psCZ6Jb8kb9aj/1wEWR7l/0qK2Bqu9Y0jTzQU=
X-Google-Smtp-Source: AGHT+IEHvYw/XzmB2HY4/rJQxloYCEvLWoq1GowHu4aappO6X751IG15/mI2XWUfsn57t3nkVzFOEfFEIWW4ziCCkwXvAQWgEKMz
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1707:b0:39f:5e18:239d with SMTP id
 e9e14a558f8ab-3a6b02fbee5mr99594675ab.15.1730719864025; Mon, 04 Nov 2024
 03:31:04 -0800 (PST)
Date: Mon, 04 Nov 2024 03:31:03 -0800
In-Reply-To: <6728a3a7.050a0220.35b515.01b9.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6728b077.050a0220.35b515.01ba.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] [usb?] WARNING in io_get_cqe_overflow (2)
From: syzbot <syzbot+e333341d3d985e5173b2@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 3f1a546444738b21a8c312a4b49dc168b65c8706
Author: Jens Axboe <axboe@kernel.dk>
Date:   Sat Oct 26 01:27:39 2024 +0000

    io_uring/rsrc: get rid of per-ring io_rsrc_node list

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15aaa1f7980000
start commit:   c88416ba074a Add linux-next specific files for 20241101
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17aaa1f7980000
console output: https://syzkaller.appspot.com/x/log.txt?x=13aaa1f7980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=704b6be2ac2f205f
dashboard link: https://syzkaller.appspot.com/bug?extid=e333341d3d985e5173b2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16ec06a7980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c04740580000

Reported-by: syzbot+e333341d3d985e5173b2@syzkaller.appspotmail.com
Fixes: 3f1a54644473 ("io_uring/rsrc: get rid of per-ring io_rsrc_node list")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

