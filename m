Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6234E10395E
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 13:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729495AbfKTMBB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 07:01:01 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:54434 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729050AbfKTMBB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 07:01:01 -0500
Received: by mail-io1-f69.google.com with SMTP id f66so7834758ioa.21
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 04:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ukGeEFjZg7Kbee1zzEtl/Q1DuM+LvaagxRP8dEWk9kY=;
        b=MUCofUzY3oJ2jIGvqa6kuhuNxz6OfjIAw042j70ei8fMM5+Qsx6Cag23WsOovu7heQ
         hbLYGebWLqo72G4VhyJQpAsxIknJosYN9Sl1diqdrU/7YlJ2icalmIXEw1kOsQJqgR9c
         vTHZKkbXpMeuTdDvMHGvdu9b+KbLdvIpSl/nn54AnhgCXhNaPj+tuNe0glvOBi0UJXph
         xiOs1KEthopQK+va0OFmCss2cfD89EcR5o8eC+uRz8MhI5eIwIgMPzf1iafBDczKqx8K
         VmpYO2XRVa8MFit2LorTGV2ksrp6lXifswy1Q7rUZSI4y6UPJz1fb6mVecJu4UEcnFej
         2m0g==
X-Gm-Message-State: APjAAAU92TgtrgxkaL7qpy/gJpYwqboTzXLp+ZWNlNOdhD0GJgxcx+1c
        jNLEJoLwzvX5S5I1QKYGGSq2IbCHm07SgLMrF9SjBjbzT8Jp
X-Google-Smtp-Source: APXvYqzEZF16qz+QeJoyw8OIWF/W+6iZXGY/pQaxuMo4inRh3rtqbw5coAxc5p3e6qtT1rQV7R3VziSrh7PkIvdMKmeoAWxAkumI
MIME-Version: 1.0
X-Received: by 2002:a92:dccd:: with SMTP id b13mr2778086ilr.160.1574251260647;
 Wed, 20 Nov 2019 04:01:00 -0800 (PST)
Date:   Wed, 20 Nov 2019 04:01:00 -0800
In-Reply-To: <0000000000006ad6030574fead2e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002da08e0597c5efbd@google.com>
Subject: Re: possible deadlock in mon_bin_vma_fault
From:   syzbot <syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com>
To:     arnd@arndb.de, gregkh@linuxfoundation.org, jrdr.linux@gmail.com,
        keescook@chromium.org, kstewart@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        viro@zeniv.linux.org.uk, zaitcev@redhat.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has bisected this bug to:

commit 46eb14a6e1585d99c1b9f58d0e7389082a5f466b
Author: Pete Zaitcev <zaitcev@redhat.com>
Date:   Mon Jan 8 21:46:41 2018 +0000

     USB: fix usbmon BUG trigger

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14deb012e00000
start commit:   58c3f14f Merge tag 'riscv-for-linus-4.19-rc2' of git://git..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=16deb012e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=12deb012e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=531a917630d2a492
dashboard link: https://syzkaller.appspot.com/bug?extid=56f9673bb4cdcbeb0e92
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13dca13e400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17cbe492400000

Reported-by: syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com
Fixes: 46eb14a6e158 ("USB: fix usbmon BUG trigger")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
