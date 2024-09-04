Return-Path: <linux-usb+bounces-14671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7569196CAB8
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 01:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B4FC1F28553
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 23:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C6617BECA;
	Wed,  4 Sep 2024 23:10:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BECF1714B2
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 23:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725491404; cv=none; b=JcH34TIEQnGG8Hcoi1iyJN0KRRXSab9fAXAVw4TqJrHNUicRe8qXcdHizUrmwLtZ3IFlr+8DDqPZ5PorPpRYfoLPr6Qqv/0mfQsUp6BSbMYpDUxZx6mVE+E1qEwXf4p5uArFiCqnK5VgeVc+gW+9ehl3+R+52fcqPNb52/Fkl08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725491404; c=relaxed/simple;
	bh=XDCEXeZjDEgTsnaKTeQtn71nPRiCuzPxvN7L3apD7zM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LdFLSj+D6nGhXaSFauAcvz2Duu8XnNkqO+7sOfpBu//uPxP+VrY1UVa4I9a4lT/Jd/PWdtMWPC7GQLU/0iK8l6YjW6EinVgXHSJOIUqzIaBWuPlbCK2C+io1Tv/DrQTcoHQH1injeBM+7cQg6ilgSiiqZbTBViCxitRWD34LBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-82a20631362so26831139f.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2024 16:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725491402; x=1726096202;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/ho66xjoxyTrQbP+mTI+/BUPw0B7PvrXhsz5eATbiE=;
        b=MWJ2V12ULgPhJDX/+7haTCu1Sg2l+8dfb+z34QPZmjktRqI0isHb9z77BTyb64dSBX
         ylOsfPbK3AslHwAfbtnF5esv61tUJaMWYa8TKD3d37Dvsc6wNFDAZHgqpO7UNpobfFFu
         9TdFhl1x2lvwYWRymCq6V92ch7SSpqiBrPRf0kblQgICQNkEPzkpOnaESEeMNyPG/HeP
         IYqazCTgLYY2Q6H2gkYGMVW/Ez8ptvzEsH4/mnrtYnAStduxIXwmGG4W7Ubl/FhlJR6l
         jVJlKkVbLiPeOB9aSWu85JmEKeJAyfg9eAn5CSoTldbWTeLyvJWAVuWuXbUzdWLBwRlS
         +Tkw==
X-Forwarded-Encrypted: i=1; AJvYcCXV17znPJRjzsUIyWi/5t2MuI0+R/QMUJzkONQKDQyhhOwc3WHRRd8brXEi1kwNrmrZ3mZZV9sLYTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw01qNPjym41uQWOIx7xdi9JvLsvTK+mXJ/OEemC/FLU4KmU33p
	RqOrBqvmP+BKx7pOXHO+QRwWiSKqbiGWCf7ps0aULV4ZcgSTTazXBtl7AWUj9oB1nxr5Gfx5kts
	+inpt6+vUNndgvgRKfPKNioGPk7We331g2zmJLa96JJkRdyTa081sfBw=
X-Google-Smtp-Source: AGHT+IF39j2FjCLuhwIJ0BNVL6jmyKTmWOhxtJQqyLt7DgNe2elxCC9qyWzmlJYlUL4s4JpA3pYrwBl05j2I9Gogjz8+/FjhZjrn
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a6b:f70c:0:b0:804:2f5b:9a40 with SMTP id
 ca18e2360f4ac-82a791e8ec7mr8073639f.1.1725491402614; Wed, 04 Sep 2024
 16:10:02 -0700 (PDT)
Date: Wed, 04 Sep 2024 16:10:02 -0700
In-Reply-To: <0000000000008cec8b0619e97267@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001dc6ed062153467b@google.com>
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in __mod_timer (5)
From: syzbot <syzbot+ab28cee83cdcfd7f87ca@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, rafael@kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 22f00812862564b314784167a89f27b444f82a46
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Fri Jun 14 01:30:43 2024 +0000

    USB: class: cdc-wdm: Fix CPU lockup caused by excessive log messages

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14eb4cab980000
start commit:   e0cce98fe279 Merge tag 'tpmdd-next-6.10-rc2' of git://git...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9016f104992d69c
dashboard link: https://syzkaller.appspot.com/bug?extid=ab28cee83cdcfd7f87ca
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=126531d6980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b27be6980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: USB: class: cdc-wdm: Fix CPU lockup caused by excessive log messages

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

