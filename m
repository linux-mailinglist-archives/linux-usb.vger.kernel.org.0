Return-Path: <linux-usb+bounces-21666-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6957A5D409
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 02:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75F2A1897F64
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 01:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BA38634D;
	Wed, 12 Mar 2025 01:32:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF230288BA
	for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 01:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741743125; cv=none; b=ZwcABKg9fZennf6b7BsLj+tD8uMgSQXqswmwAwMuj2K0Q25XBU/UNS9LEubgpTyud2E2qV5AzM+V2pOOGdgQoL9XIe+BH6KtJ+mVpYVOvpzBgMDqyhucffMyudofeLDpXXj/QtDyLrf2PHAYKiJjczZKZF7KxLAhQ2QBGZS9pW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741743125; c=relaxed/simple;
	bh=F4l7NZLB0Rm6adwPa4hHZJV6NQ9v9upadFqBynFDWg0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UKAMAoZgw/1HdGhu0SYlvgggviBrnKEe7Gn7Tv7ms/1Oz78XuGfRgHFjo147xmLwiV2m1zUrP7wYSKxQyBMF2vptuIvbhYceXpDz7iH9SjTeGzOu4IjI2swXuO+o70cur8XcKou15Ev5JbiennQEE4plh/8OPKD5mvTRITaykI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b345c7197so329649239f.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 18:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741743123; x=1742347923;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAb8u3Wz9Zo/YhLhIkXP826nMoU4uGw8wY7NG1Aw4u0=;
        b=O6NtN4+YEThCZARggtXILnehjoO5AyCDtHLE/IcccHO2FFMfW4X+EqcA9/sw88Hd+/
         u5kyrdSuvki98aq1Fc7pSqa905fYTHWTKpBJC2QBQz5RP7oPQBYT6dZrnhd70xKx6/bu
         hyXRpXu7jBAjDB7wvRWaKPBNiJ0aYE2rF7szeRs5Dd9R6qLCgcgBdZwDClLJ/YKAYS+M
         x+cXwDGjjGLNPJcjVxaKOFTpSEDMssvJt0PR28ocXiyvjfHkvA+jxyxHxkN/F2fJAYj0
         5Evsq+vmjerEgbe2Hyr1s+c03YxT0BWxJ9J/8RFKVl21531kQ/TJa69EtTxzpfiIOIla
         BR9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKYnjrBuOkaWSzKDbbzDJhiPHNNfOdiFiklSa0SSB7FbmhNjjtSQoNvPhsSBx7NH8y2ZIde81y8sI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQZVq/FXzWUlOqDfFhTjr3m0C8IvYyx/tfkpGD2Py5PLRWS6fB
	fFvhOQwUbqb00Ub5G2OeMxAfECr7LFS6/bkRha3t+PUCDupTjSrJpPc/S41YBtBi2/ucaTIZA4Y
	nxOg65IACo94f3AJ+ef+/GG7JMi1niSJ3zmnl/rsFiOJtUXJ1eoT55y0=
X-Google-Smtp-Source: AGHT+IFVesQKcXqzbhSDZRVb3dMC47FpyAhRu+PzTx/pQcJli2sL7nUnmtuGIpcf1Zg9eOmXXDj12iJY4Jv6k1EUegT7+Z6OEBJa
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2142:b0:3cf:c7d3:e4b with SMTP id
 e9e14a558f8ab-3d441a12ceemr254723385ab.21.1741743122823; Tue, 11 Mar 2025
 18:32:02 -0700 (PDT)
Date: Tue, 11 Mar 2025 18:32:02 -0700
In-Reply-To: <67923cb2.050a0220.2eae65.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67d0e412.050a0220.14e108.0020.GAE@google.com>
Subject: Re: [syzbot] [usb?] [input?] WARNING: ODEBUG bug in devres_release_group
From: syzbot <syzbot+cf5f2dd02bbd4d2d411c@syzkaller.appspotmail.com>
To: bentiss@kernel.org, gregkh@linuxfoundation.org, jikos@kernel.org, 
	jkosina@suse.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, lizhi.xu@windriver.com, rafael@kernel.org, 
	stuart.a.hayhurst@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 48e487b002891eb0aeaec704c9bed51f028deff1
Author: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
Date:   Tue Jan 21 20:00:07 2025 +0000

    HID: corsair-void: Add missing delayed work cancel for headset status

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16abd478580000
start commit:   c4b9570cfb63 Merge tag 'audit-pr-20250121' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d46425e33fe266e
dashboard link: https://syzkaller.appspot.com/bug?extid=cf5f2dd02bbd4d2d411c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1233c9f8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147eb618580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: HID: corsair-void: Add missing delayed work cancel for headset status

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

