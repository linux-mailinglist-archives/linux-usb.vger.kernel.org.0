Return-Path: <linux-usb+bounces-27256-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E4AB344A9
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 16:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D07713BE287
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 14:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE582FC886;
	Mon, 25 Aug 2025 14:54:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D282FC008
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133646; cv=none; b=cf6ZFZBnCQ13gfwTR1wGAhE2I/RTRvL7ucCCRjFCJAfw2aEuhVvqVLpGfdaXdWzQCnTK1reag/mHI76z1WCgsgqK7HeFVXFHe5YKqj4onr+ihTZOgq0NHrvMorbwJopM72FV7xOtsGcsy13bVS22qE/keEy5jr6ThljmOtFBZhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133646; c=relaxed/simple;
	bh=RYFQttZPQBLdTyL00fjIksscvOx7+ZWQBTuIJxy7cw0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RnKPRsdxNFYGNxkLo58eGCuy55+Unsw/ybKkfhTdgzEv97UKkT6La2/rzyQaqY2jzIkv1YvM2XCCu4H2bVs6wzFtticbjkHlYeXsDt6RKgGVW2oktm5qNCJ3BqapcS1Z8cLM4RM0Yn4617vZQLC+bgE+dmwa3nyoSjw3ggUUxMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3e580be9806so49564125ab.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 07:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133644; x=1756738444;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ks23e8Q91CQ7KaAQ1Tjq9eK94AD7/WwIK7YtecKc1XM=;
        b=f2EZTXbJ60CSEUjcHFkMA2/g/503cc/Zcj4BYzjuzdJhLfabpVGycigaFYkZ5Ah6CA
         4kQOwvtECC0vsRMKtruRtTogArox9nEAjNasH7gmic1Szrvv/G/CHnjjF7UoA681794J
         +m56QDyaZjBuGhfFPHHjJogv/sPQDMyviCoe/8HzdFaVh+BDMZJg3nlu2UOK5zS6Y6Kf
         x5g+0cg2RM37OcbG18oIuwpy8OSLepjYlVs2oa3/hrD4J9jIJx5iTETuc94xa7h+hMhe
         VJVSAjPuJa9ghiAd7sUsjBSKxH5hUeldD6Xd3UtaNR2ErgybRS0yUaQykFsTnwLff4K5
         5MBA==
X-Forwarded-Encrypted: i=1; AJvYcCV/f2LmTGN+x6gr6Ec8HA2943HalpVAFJrl/+BY8aIcrgW5A5bTIUuzorJjK4KwtqIWReMb/lwU7bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/s4Gt4HqO1BmqUihzGVB7yZrfASYlp+9sjPXXqJou+Xa+Iu5
	gyI2xeb9X7162jL6Eb2NzivxHF8fIrqNKGInWi6jeCw22HZ5Tfd097hNlsv9lkqUIGKAXSZh+5K
	TFVDQgfVcBRYcVCKjdhWaYuoHax+HHJV7sijC9qtXAs3dgUekf4s7+aCiFe8=
X-Google-Smtp-Source: AGHT+IEV+VyyptRyr/7EBnA/JSPf8pu7sBw+c/GLiXBPcD6TdhCdNFG/G0lngV0hKVH63z5s5QlSb2A2h86r6wPSk1CAJDXfK+QI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1688:b0:3eb:e261:15e0 with SMTP id
 e9e14a558f8ab-3ebe2611d45mr77989085ab.28.1756133644131; Mon, 25 Aug 2025
 07:54:04 -0700 (PDT)
Date: Mon, 25 Aug 2025 07:54:04 -0700
In-Reply-To: <0d6d8778-a45e-498f-9e31-1d926f582d7e@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ac790c.050a0220.37038e.0095.GAE@google.com>
Subject: Re: [syzbot] [usb?] BUG: sleeping function called from invalid
 context in dummy_dequeue
From: syzbot <syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com>
To: bigeasy@linutronix.de, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, ysk@kzalloc.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com
Tested-by: syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com

Tested on:

commit:         8d245acc Merge tag 'char-misc-6.17-rc3' of git://git.k..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
console output: https://syzkaller.appspot.com/x/log.txt?x=17b38462580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e1e1566c7726877e
dashboard link: https://syzkaller.appspot.com/bug?extid=8baacc4139f12fa77909
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15ee6862580000

Note: testing is done by a robot and is best-effort only.

