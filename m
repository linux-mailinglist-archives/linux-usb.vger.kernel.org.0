Return-Path: <linux-usb+bounces-30927-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D82DBC873AB
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 22:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 853ED351C01
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 21:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388012FC006;
	Tue, 25 Nov 2025 21:29:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5632B2FAC0A
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 21:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764106148; cv=none; b=cfTZojjyCb1EzsfL6STM21S5uD2RoZfUn3JSDpkcXkd70Wu9D4osxkTI7fCSXVAXUw4XNxw7u1t3iPysq4ac/eg9jeT0fjqV3l3nTyxQZm8haZSoRXiDHB38HBaUEAZQsDh0n0EYaBLjDkBGyJv0LievIAUns2MPDuk+m+h58nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764106148; c=relaxed/simple;
	bh=Zdpii0LSGFDbxKbo7AhO4oOhZM3qOinDvvZATCa/Sow=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bj5NdPuTr6sp+AlTVPyx5guNBbxZnB8Li3FwC5wXLKS/5dTFjy75vsK70+iGHzPytZrmuO3uaNvqxx86MYl1yL2iYGBLKGu2e3E+AN9E1yXtmXRwFr9rpc6Tup92mNpzXn5iCDhTzsdtvcLSWhmtX4Vyb8Cp5HLufZgtVukeKOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-4348db9e727so50841905ab.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 13:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764106146; x=1764710946;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHAA01S5qV0ahBi2iQTagcMAT0dAavilbuefhw3nVeE=;
        b=ZwEosFfiI4IJ3n7NwKzWvvbuMcvTyj99wnY4Pszc1RSj9tCCDWFNRVzwjQ9fF+kVlE
         BPvlhSmdHIEKWkLFHiTUvl15OYXskKcbVCmZvf6z8dziqMc7btT7oYwmz00YQohzCU9E
         W75zg+pyJARFYUlvswmdpnD6MTGfb4/XY8ifIfHvlLIxjVTusJ/fnmqF6tRfQcHWsiYK
         H2WwhWt901sPv/euFRODNE9gshIfs/TMn6YGGLJRbMx19wN+cDHC3mSg5jekqMgPQt7T
         LdviAbHPuCSDbae/0nPb9JRNgWMURy76jnWy/TSYDqBc8xeAYvr2Q8wGdRpWvyrqgw4l
         DlQA==
X-Forwarded-Encrypted: i=1; AJvYcCWG6I5qbpUoZCmFP/Oyx2q7NGxno+1KyeUKWsph6ZGEv1SBYypSXxodTwwRVteJ8KjFe/oBJHi+DBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPgYReebDx9y9Zi0wqOW7A5NrZEn2DOypaWk++70rM2kUcVxkE
	Vj4oepz3ByOgjsLY7DMYx1o7AEICQfWqhlpd0KfNAqY1qTTnUkNrYnmVL4Xq/MZCV7yjO2Vi43r
	9VtYZQi6FHdYcPlwne68uG2aKiqZcd67NJ6NHna6Ri3X35PhYlpQppKvrQpA=
X-Google-Smtp-Source: AGHT+IEi9qrOcWMQCAiUQzBf4+A5vGHRO1b2ucfssRVjfdWi9zJVJjB4av6fs55BrITFZw6Lh6vw2CNLFtVAwSAiUL6CLrVek4P8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1561:b0:434:96ea:ff59 with SMTP id
 e9e14a558f8ab-435dd1254d7mr36666915ab.34.1764106146615; Tue, 25 Nov 2025
 13:29:06 -0800 (PST)
Date: Tue, 25 Nov 2025 13:29:06 -0800
In-Reply-To: <50389e6f-a379-44cd-a18b-ded86d0b9f7e@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69261fa2.a70a0220.d98e3.00be.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] memory leak in v4l2_ctrl_handler_init_class
 (2)
From: syzbot <syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, ssranevjti@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Tested-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com

Tested on:

commit:         30f09200 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16d25612580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f30cc590c4f6da44
dashboard link: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1099cf42580000

Note: testing is done by a robot and is best-effort only.

