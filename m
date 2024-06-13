Return-Path: <linux-usb+bounces-11248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ECD9062CD
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 05:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3538B2344F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 03:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAD113440F;
	Thu, 13 Jun 2024 03:40:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC0E133993
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 03:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718250005; cv=none; b=Ucl8tKKsdPpAXxpQ7GJ0Y2jP3aSPaff7Z8nlP+mhZtjozdO08RjFrTa+4hntRYSpEcKT2GhciIc0s5gR+5BXY/dm0a/uP/kgSJRHK+WFAxnFFzmtKJwtFMqj2hoAk5FPbK315VNviiD2+WnF23SLdRKa++XdmCDXtDIKr6B6tl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718250005; c=relaxed/simple;
	bh=U8wfKXZ6dXDuTnGtLn+oGkITmPDjqSK9YVtUdYEmccw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CSmv4yP4G7u/YZqmM3icR/cFT/qIi9wBTcGp+wjLGO+7HJp3rkkDSvcKirIm4ewA55Fxn2r7HgH1HVxxrAuWyb2RA1yMmdg37JuG/WDd1XGNb5m/fjotNVyeL8qQIrm/x/06lbfrpepyo2rpTUJi5LqJtKjLB9LQ/sPgDKyojN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-37596e877e9so5966685ab.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 20:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718250003; x=1718854803;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gwf8U+aeM/znZoLJ/KePv4osrbUt6PFY/I+1iIJ7DYw=;
        b=kDGQwoeKYaIG7kSafbZyM4XfZ0evkm5a8yfnVRAl+oIU/tlEfU78XP1HH3sCcEOm2l
         r5UOmL6TkuBooSxZfhpPOYl2uCV8bP1J4VmnvraVD4LrlmGrBQHz/TMajh4OX2EdvIt4
         oUvjJwzl2Ss+4Q/Ey5DQTHiY11an6XpMw3fER6Lw8zTEBcMff82QR3yOClVRbmPfGuB+
         mIQIwRoOfUvf01Jqx+V1Mfvwpo37pZstOXg3gd5i2fXYH2yOOpAo7F3qIItQzFRQPLLM
         2D+MUuSQnCUh7F+Ti2aJB/51WrzS3LdLE8qbS4nEUh0H+N+09y6Ae+HsHY4l0PiTrZH5
         SuOA==
X-Forwarded-Encrypted: i=1; AJvYcCWXS2aVIq7ZechhMBwCRAuzSmfS4FPbCQCwYlOomOh5YrcR+5JixVxN6kWVPIq/MCqa7ZZjJC/FC6p4p+bPJDRvSgzQ3Oh/e18Q
X-Gm-Message-State: AOJu0Yy+mQCZqnHeZAZWI6c5FmM/5J21xSTI0ovP8mGneWUjuebpgx/V
	PR+WR+2Qv6g0ZZeMiQXbUJB0jaD2QZvD2Hv0L5oFV4u9ta/enh/5Oeur4zGIv7uqhLy40QbBGkb
	ybpaqDoBqy1XXVrE/OH9Wv0VY8afreAwYiYIyUStzQgr4vNbQGC33gG0=
X-Google-Smtp-Source: AGHT+IE2dSvCixNi5QNUPAzHQTktaN00DZRyly7IMMNum1otnzGQYkd70dFBmlq6wef7VaY+UUAJd0mRwmJPGOVhu/1ngJbXFG3n
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c54a:0:b0:375:88ec:810d with SMTP id
 e9e14a558f8ab-375cd238b0fmr2195325ab.5.1718250003518; Wed, 12 Jun 2024
 20:40:03 -0700 (PDT)
Date: Wed, 12 Jun 2024 20:40:03 -0700
In-Reply-To: <871507d8-b4ff-4af8-8bba-9a3149c41e8a@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000186749061abd412c@google.com>
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in raw_ioctl
From: syzbot <syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com

Tested on:

commit:         8867bbd4 mm: arm64: Fix the out-of-bounds issue in con..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=179339ca980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3b4350cf56c61c80
dashboard link: https://syzkaller.appspot.com/bug?extid=5f996b83575ef4058638
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14ad2856980000

Note: testing is done by a robot and is best-effort only.

