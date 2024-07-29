Return-Path: <linux-usb+bounces-12587-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF44493FEA8
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 22:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27E14B21F57
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 20:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641D8189F39;
	Mon, 29 Jul 2024 20:00:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08421891C4
	for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 20:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722283207; cv=none; b=f8RKYQum2YVNudZkv5X7STfqUPzo2qISlpyin95LOtD3rUv5yeJ6XqO7ZjQjyLcTBs8tMM17qpOBdhW0T1DLsJPSuG8bMj62hgljdORl2dLU5NcW19Opyrvw7BnCYVvFLxcPyTfyWiMBBRwfK6eYhlv5CMCib2JukQFQv+GiBM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722283207; c=relaxed/simple;
	bh=k6BKGK6zvvx1FTptgx+Z1Rfw+VltyDEbzn/+HluoFNE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Y7skEdwHstWwIb5JxFlTSKgN2A7AI8YaER7pl4uUYWwXhBkieexzWKrh5Q98+axbzYnxcgkU0ctzrzd+1+lB3bvrcsMlQNxIYJ8x9IwHYOfTiwFYRdjJUvIuZe8CEOblP3JLkb7n4uWJDt/9yihsgu9VQSskYoyi303itxVGzlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-39ad7e6b4deso55456655ab.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 13:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722283205; x=1722888005;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FD2BT1A/vVoyYUFr1yXG0cNDdoGiIzYRMHcW8QayngE=;
        b=ldFIUHSfiBy00zeOtuKTuI5S6d5eg9HRVeiF8vA6lQR0VuHbn/8/qFcxNz9SDEqQmI
         L+a+hrXvhRkF/4Apm/amTm14YgYVwZhm1yz+fYsyPQaaepMytQbBiA473589ZAayBa4V
         fvAzb7cXK6Zx+NuA6MvKMvGDn/bPA5PYLYcZrhanhFsvkc1axbZUmY5Pr/G3Tk4QUqTV
         AkAHz/gzef1BvF1tuXtFzXqJUH6AtdDdtY1k7s7w9xUa1vSTrbRpLli/uCoBODV3iZ0l
         uaUeF6oAHNS2FUwX/V2bvtcKFovelt7sLcGR4/SJHsZBs26JH85uwR4EgaegpHpX85Gy
         /zqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVZzEStLkjas6/L4bnv4YNmGzzdTzXy4O2NNhGvNoJGntfJxqY+mhNhA1qWAXZ9T1HxkJmU4gKk4h2TSIUHkoyCiz6Hx/Ou8jG
X-Gm-Message-State: AOJu0YyCw1x1zW5Po9ZHK9x4nTS1KUp8YIvsNi/G1l49q4oXhJ8Qn+Mk
	PFgeL6tb34uCmrkxhOkOB3MAtxY3ihkuPeemzKTR2eAsfx8D3BU0dgVYO3RR9T4RlOR2s7Slel4
	Pc9UTxgW96ohC0bRic9tiRLOqwtVZomN36dTXFXesIznGdolSxWtOLo0=
X-Google-Smtp-Source: AGHT+IExrDm0332VUVax83+e/2y/2uKOBWocpWYLm6HxJRvLLIh1W6yYxsU1rub+r8ob2O91cAZzAY6C9mqIXh0VEu3sbxc5/eL+
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c245:0:b0:381:24e:7a8c with SMTP id
 e9e14a558f8ab-39aec2ca2bemr8248005ab.1.1722283204763; Mon, 29 Jul 2024
 13:00:04 -0700 (PDT)
Date: Mon, 29 Jul 2024 13:00:04 -0700
In-Reply-To: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009f6f85061e684e92@google.com>
Subject: Re: [syzbot] [media?] [usb?] WARNING in smsusb_init_device/usb_submit_urb
From: syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com
Tested-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com

Tested on:

commit:         93306970 Merge tag '6.11-rc-smb3-server-fixes' of git:..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=150f68d3980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8cdd6022e793d4ad
dashboard link: https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15b341c9980000

Note: testing is done by a robot and is best-effort only.

