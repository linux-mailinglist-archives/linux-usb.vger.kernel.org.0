Return-Path: <linux-usb+bounces-16908-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F129B8060
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 17:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 141411F21036
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 16:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BC01BCA0D;
	Thu, 31 Oct 2024 16:41:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B91A1BBBE5
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 16:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730392865; cv=none; b=pCFgHCHpJJBHT5yEpIxc9n40nX//j+CxUvaIxTXN1a4sCl4QXq4qcxcXnVYkBEYVtkRxmJJVlkr/IDBjSSKJmDR37SB8p/ZdpvEwgqYTqK7BlJqsHhgf1uDlOLQW3c5ctQhlxzD1Cihl5nWiqY7keah9KeI6e72If4/sl+xAVZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730392865; c=relaxed/simple;
	bh=+T8lN1gLzbQbrwa76oDCjzsFDN/dUBtdXM0uxc+LlPs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ROZTGbhtvgZTHAe3ckzQgZKb0HM6LqmuRVhrPA8EM6y6CinwB5/BPuZpk/KngVefv+7nq3MyM8UmQXiFi/hY9oiPcjzDrpvMi9H6RK3vaaSuEre8bqYWWt8U242VL4C/vSJpQ/XnqjfR3Bs/c0oRRfBxCTGifCeLORAjfgL1EK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a3c27c72d5so9901445ab.2
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 09:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730392863; x=1730997663;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5kf59B9cpnpRcxM0Wk+olT2viW8x/tZqSOwO5xKyJ8=;
        b=JUnb+eV0BgmhWfD4voEfsCjCyygWWdUZ/YWPhTrUtxc3iZJ01B+Cv7HO7aYQo2E5X2
         VQF9HjdWuYkrezPLksCj2ocvv0R8iUR8jN+4lwNNJGNa3+kPd5qkQs7tdBEwhFblJJfh
         DbgggHYK/8MkcRyCbgpIVkg89/9YgYUZMQRmllD0z9ObeBLUzvSk//YXtBPjoDsIcnNJ
         h1KgKCiggAfu75ALQRQr2fuGXxyrhCbiwLeXEtYPkNaVggxAWy+49IKeqXHssfecCTun
         MbGUPSmxrZYK/EwEpeyd/LvIYvEeZmMHEe9ZK6eijtB7F3LY5Y4yG5AdOaS/UuuKEa0O
         9m4A==
X-Forwarded-Encrypted: i=1; AJvYcCURPGO1TtiZmWvXhQN4KP7ZCVzwjX5StTqA3vmxPLfpMbfY9Vx3xeakjaNg1h7+/ApIVpt2/yUjbmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrZwABDSkouLzDRfqN3V7+wx6NJ/b/SY/DxiOYCWMo9OKL/dy3
	cHZttv4XDxJvvCx5AJVrQQYm/SRQTLAlkBzx7+ulmqLWrDIziaG40EdLJo8vSUkCshwF63a9/5j
	KyPo4q+8KELhdgJFDqjXX5olKTGQyZpRSta6Ydc73w0xqmvBsuVlSLZo=
X-Google-Smtp-Source: AGHT+IF7vDX78RdpCp96aKe/0IDWhbKJMsM8GMsk5dPvk8HvTRPiy3lCOgNmo7/5JinNDCI88x1azOXCsGSpofcokwYdSk67hVPQ
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:160b:b0:3a4:d94f:5b53 with SMTP id
 e9e14a558f8ab-3a6b0384ea3mr6044505ab.19.1730392862708; Thu, 31 Oct 2024
 09:41:02 -0700 (PDT)
Date: Thu, 31 Oct 2024 09:41:02 -0700
In-Reply-To: <c6b63e97-6839-4beb-bb94-e5914837a041@lucifer.local>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6723b31e.050a0220.35b515.0165.GAE@google.com>
Subject: Re: [syzbot] [mm?] [input?] [usb?] INFO: rcu detected stall in brk (2)
From: syzbot <syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, jannh@google.com, liam.howlett@oracle.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
Tested-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com

Tested on:

commit:         cffcc47b mm/mlock: set the correct prev on failure
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/ mm-hotfixes-unstable
console output: https://syzkaller.appspot.com/x/log.txt?x=1304a630580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6648774f7c39d413
dashboard link: https://syzkaller.appspot.com/bug?extid=7402e6c8042635c93ead
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

