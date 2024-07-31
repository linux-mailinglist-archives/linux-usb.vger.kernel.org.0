Return-Path: <linux-usb+bounces-12709-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80853942D9B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 13:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C11EB24148
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 11:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6015E1AED29;
	Wed, 31 Jul 2024 11:57:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249A1AE86B
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 11:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722427025; cv=none; b=CRf+CSM7mbzgZSZ70t1mUC1juV2xInSruNsOJcpASdTgFWIJywB1DGNPTWv41CdInJg/bF2UyLXGZo2BuDK7bVt+ntzat+4oHNSOoDW7FFpZdGnTIyQpYu/mp6vm7c46+Jq1ONXpvYPGCznPADnvlNxp79gBSGJ9wMZcmADaSVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722427025; c=relaxed/simple;
	bh=hQUoUT6P370vSdku525I9ZyIqVpjyDqZTAwNNZoSxuo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=abygAunUy/MzjcISS/UL9bh8hcxCgK+ir4udD7XBaHEOO9VeWtRbsXUg9t0AR+M03KTVpBYvn998rymzOpRgRZhoN1TcfUSLuqBlFhwIheoIly8j2NrBEe9fA3xesMvMQH9XHoUCB8Cn6xKaQJtj6oX8D21DTpoAZp3QSj6MgLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-396a820a8a3so13130225ab.1
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 04:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722427022; x=1723031822;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSrgeN+yuzirQre8G4sG5Sw6kVPo4mH3hIOR53sJbwQ=;
        b=pBv2zhwaqleJ/1HeAS4Fc5q97P3GRucG2RrcBvlAdubZOyrnNPzwowz6CFM1VSaB6K
         PfzFsIrRqbmg6ohmWowrZ00CzhhTswoozNrXpmDHss5SX2sQHUXRQvL6VoGba+kBTXq+
         c4AeddfaK0DxKBwZ1PYn875dKW7/quA2PkyhMH3IPRlBj8M+6LXUFVzeMWv+zqcgl1iW
         B+Un9d9MNPzrVqbSpC+XfxtX80b0q3vIU/1YxlAZkSMBpnkGZA/FxxaRmlbHYRkBIYIG
         IYqHjGlZJKpaJVkyAhMjHCASUxeMMC7iQTpPOCG/6zMobz8nZHGv9xpOzBi0xbjpsKmb
         lI+g==
X-Forwarded-Encrypted: i=1; AJvYcCU00bTq9gPLoGx3EkckCg/8VDSaik3FtHAfbhpIXtUY9tkFqNHPlrG8kK/IpgaEvzuAM/ObjJxU4g4DGQqJCzJFzENlmhpNrtxD
X-Gm-Message-State: AOJu0Yz192e/2KczU4IVq8CHLoKtM18m85/pPy6Lkj8LBp6IBQSlR9+1
	TUosQD5T0Lc4no+6/yX+6+o0+l4UcnTDf5lA0gLmhXxJoYjJU2dCmeNkDnx/FECA+/dAeUyXnqm
	o7xUZf37dH1Qup5xk2RV+wnr+GSTQOfRG73P9UPDS6rpyeggbYlu3/Bo=
X-Google-Smtp-Source: AGHT+IG6yJHm71PfnjSzpzV2tajfrhXIQF3DZ9LmFmTF0gSF9zc7EprT5Loy3CMpp2Oq1hqsKdRV7a+B3kc8FcJHdRu9wenzlL2s
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa2:b0:381:37d6:e590 with SMTP id
 e9e14a558f8ab-39b06af47damr3064295ab.2.1722427022641; Wed, 31 Jul 2024
 04:57:02 -0700 (PDT)
Date: Wed, 31 Jul 2024 04:57:02 -0700
In-Reply-To: <00000000000022a23c061604edb3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d61bb8061e89caa5@google.com>
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in __run_timer_base
From: syzbot <syzbot+1acbadd9f48eeeacda29@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, davem@davemloft.net, 
	dvyukov@google.com, elver@google.com, glider@google.com, 
	gregkh@linuxfoundation.org, hdanton@sina.com, jhs@mojatatu.com, 
	kasan-dev@googlegroups.com, keescook@chromium.org, kuba@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-usb@vger.kernel.org, luyun@kylinos.cn, 
	netdev@vger.kernel.org, pctammela@mojatatu.com, rafael@kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, 
	victor@mojatatu.com, vinicius.gomes@intel.com, viro@zeniv.linux.org.uk, 
	vladimir.oltean@nxp.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 22f00812862564b314784167a89f27b444f82a46
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Fri Jun 14 01:30:43 2024 +0000

    USB: class: cdc-wdm: Fix CPU lockup caused by excessive log messages

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14f906bd980000
start commit:   89be4025b0db Merge tag '6.10-rc1-smb3-client-fixes' of git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9016f104992d69c
dashboard link: https://syzkaller.appspot.com/bug?extid=1acbadd9f48eeeacda29
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=145ed3fc980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11c1541c980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: USB: class: cdc-wdm: Fix CPU lockup caused by excessive log messages

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

