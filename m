Return-Path: <linux-usb+bounces-32229-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F22FED17548
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 09:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D945C301B887
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 08:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D5937FF5C;
	Tue, 13 Jan 2026 08:35:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072F830DD37
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293305; cv=none; b=YF3ygZfhj4U3NhfigWL2onKBbd0RW3rxtN4/Vfvl+5LRERSdDMyoFeNORTei/vADgl4zgK3BkdzY6fs5jXsUqw2E6naQa0Qi8XcE1QhU45oELxDPP5eGGVS6HbaTufenawEy7qsLBt/K9+2zbrcZQpjbBN2rqQMfBlKa21+LdHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293305; c=relaxed/simple;
	bh=o/0q1o0P2E9SbZ91BvG9ltgs07T7tr5tklqjamNKg9Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EU0vrkCIMtzZBDW8gTLfsv/fNAdAatti/J0ngGKWkzZT6exLg0qCTcJTYD7Npp1rRl7wQQ+Fo3DU5rJSONT2XB0Wtu3G6QLO53gngiVvs6mYnG8DDCZ6U6HRSP67vb4sgHCNaDLsmQ4GJ3eQFE8bgaj3Ehw+nd/Mke6Tu+HdPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-459df8c820eso9380356b6e.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 00:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768293303; x=1768898103;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xIK3qU5C+FuG3rAv/kgcOGur3Ov7AtQeItaLy0rdrDE=;
        b=Ex6gFbIh5Y76IP6d//GoCW5sKZNFTDJnWU0odGaKRaUhx1fWQP8StTjVmgcCc4M6GG
         gDBF/W/KaNpy1E0jRyWrEqfwXRnDaZhkc+SJ4VxAhLgq8ex+v/WDaXmJLiuv3LLnjLIW
         qXmOxjPUnE5upzRHgQy+E+sKZl1sCuIGSw5VDTsRqcYIQghYyXl3R9bgmGhvVw1f9BA5
         /JG9Ft3/b9MC2evR1LAJ/06bR76eM/xDoN+K4glhJB0Fxsjzb+eoCpy7Yr6vgGLpL+Zq
         Alh4Xf5BN/exwrMn5LYIZwQ8m/VjZhidZoy6ZHX4i1iAxOGrKS5xqWYpVSdIgi0wWsTK
         vq4A==
X-Forwarded-Encrypted: i=1; AJvYcCWOiMpwrCfitrtBs7lMgTrl69EV0TM2/6t+u7oevejDCjyKjAqLvQ6Uw1azIcTqYssrrGNppn106RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSNuKrZHRlthHVsWGJbQJ002G21O2zqD8Cb11JYxq8RPgs60bM
	ovhDeqmyP2dai94frVPiuqW0NA3NJx7H1tl6tFu3faHTNuUNvUrtGAlIkV2EYn2y8vOS32Oxq3G
	JPBlnlfST5l+epANtHcm6skRcwN/JeLrqFs6Lo8Zn5G8VSquhgQaewlzWXoM=
X-Google-Smtp-Source: AGHT+IGL+XcC9VROi0O7xALS7+gJoQvrL3ffgJ/+GnEKx0OQcH2siQc25VM5sKs0VGkEnsmaCV0r8n2dHdN9vRoO2Wk5xWGWlYBh
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f006:b0:65f:6713:fdfc with SMTP id
 006d021491bc7-65f6713ff24mr6679406eaf.17.1768293303075; Tue, 13 Jan 2026
 00:35:03 -0800 (PST)
Date: Tue, 13 Jan 2026 00:35:03 -0800
In-Reply-To: <20260113075210.39425-1-coderlogicwei@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <696603b7.050a0220.3be5c5.0011.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
From: syzbot <syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, coderlogicwei@gmail.com, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com
Tested-by: syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com

Tested on:

commit:         b71e635f Merge tag 'cgroup-for-6.19-rc5-fixes' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17f0699a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1859476832863c41
dashboard link: https://syzkaller.appspot.com/bug?extid=30b78308ba7e64647ff8
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=117d15fa580000

Note: testing is done by a robot and is best-effort only.

