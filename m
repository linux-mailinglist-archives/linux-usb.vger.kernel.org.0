Return-Path: <linux-usb+bounces-21056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E0BA453CD
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 04:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 876D53B022E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 03:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753C9225A48;
	Wed, 26 Feb 2025 03:10:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D559225797
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 03:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740539404; cv=none; b=uTOl8zI+x+7ZFp+6wR6GMU+m60v82HJwq8aQgYkSeaIJWpKrpUBTMl0nLrdla0Rbt3kJBlWsB8UmqtplsYZgDAuMk6Zkcp1cW4mKQQlL+dxVjPJ6J5B5+Q66pNNXVUWYop86aijhOTMOT7cwI2lP5hm1vWBIGUbx+YdB9nHdOP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740539404; c=relaxed/simple;
	bh=obw1Sax1F2UAMmx1AGGj5gICIC2sjWZ9oZPNwJG9rfg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uW326bTqP2Lg+hjfBSqQTdbhTlsmf6Xfpws/BZZ4Gsg+ePc8wo9wjqqcxbp9hdlqteQOB6joRV14+qgrIcnIpzMv/yoaiVlRgAnCJBjRPXDbRY6K/p1QyUlj5BJfbov+hBXQDujT/Z5TLZkl6TJ1cgrPtyUWZOQxTM9zBCcbfwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d060cfe752so52109225ab.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 19:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740539401; x=1741144201;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pI5OF1BLxFeb9UKkgyFgef27z30POH6v7L/twCJv8dk=;
        b=kY42adox51IJBVJrYPQsVUfwiMccEuCpgv0PDexCpyv2XUUsYa0Tuv+PRHuZsZk2Rr
         63odJm72Zr1zDb54hWP2tKHJIM/gwqr59SyT99mCJoliW9MABG3FU6GZReCfqqeCmfV6
         jMO0NX99eynSazxy7HY+oo2GlglCFou2YLzth+tmliWQwriTmYzXuXL1RdFZehWnilyg
         wHvl4ZohbH5Kyc5p7XocY9posg4BY/ci2CWPrbzQmRy1RrS8xPUcAMLQgmqKrpBc1URR
         Th7PAz0LriFRx5JkSkkfdHocUNm0usPiiHzn2+gQqjy9DclEGjHCY7XqQ5/+pP5RbRR3
         8EFw==
X-Forwarded-Encrypted: i=1; AJvYcCXTq6kIJ6x1BIbFgJEHErZkQXcclB3dL40BSivQwwQEyc2LSM8GSR9F/QyKXu8wPpwx3Au/Yf/Jwlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB/JD1JlQ4uVo6DdBrJFKzFrmeOdjIqchuwbFcE+MNB6Vl7LBD
	pB4P7sQoYuXtPU18Pgf1yLKcZqO0lHDYCvA4uTjs/ECslESJscNmeucEAXiBatMZ+0rvDfCEm4m
	smoj4ymoYzbqkhrl2iepgPeUtphFWKg2Phh2LLYQrUAzJUXq2YhiUvM8=
X-Google-Smtp-Source: AGHT+IFnMGyYE6QlMavrFjUCDpJgSomAeZEaIsXHwmEdGE2tooAFABLuqmpirNOy8eiHcy3O++/DW6WQtKh7jTmkVkdyLUwNiJ++
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:368c:b0:3ce:6628:3c4 with SMTP id
 e9e14a558f8ab-3d2cb44f8cfmr179693375ab.6.1740539401708; Tue, 25 Feb 2025
 19:10:01 -0800 (PST)
Date: Tue, 25 Feb 2025 19:10:01 -0800
In-Reply-To: <000000000000c27c9e06197d59c3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67be8609.050a0220.38b081.0000.GAE@google.com>
Subject: Re: [syzbot] [usb?] [kernfs?] INFO: task hung in kernfs_add_one
From: syzbot <syzbot+e4804edf2708e8b7d2a5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 5189df7b8088268012882c220d6aca4e64981348
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Wed Oct 16 15:44:45 2024 +0000

    USB: gadget: dummy-hcd: Fix "task hung" problem

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17ceffdf980000
start commit:   2ccbdf43d5e7 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fa0ce06dcc735711
dashboard link: https://syzkaller.appspot.com/bug?extid=e4804edf2708e8b7d2a5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16ea2012980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12ba6851980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: USB: gadget: dummy-hcd: Fix "task hung" problem

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

