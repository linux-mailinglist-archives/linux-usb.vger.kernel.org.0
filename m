Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205981E037E
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 23:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388489AbgEXVxG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 17:53:06 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:44860 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387850AbgEXVxF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 May 2020 17:53:05 -0400
Received: by mail-il1-f197.google.com with SMTP id b8so13777688ilr.11
        for <linux-usb@vger.kernel.org>; Sun, 24 May 2020 14:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=W2XSpdpI4imP3oFttp3ea6rQjy1+gsYM/fLbimKy0J8=;
        b=kFydqyPyeZbnZ9japzbwTnxxSQI0ZY2trnKE5B/Brke8NEtv0gtqVSZAZb3dOF3rh0
         QS1aTZRPLjHpJkhuyLpSWw6VqcQi9RXjlsMBjPGjFa7c6VNgQ6g6MiTeRUMibAajgbKR
         lmv0/D56mozxb7sY4S448YEi8o0p9cbRihF+lxxSU7PeJQGG1t7lPknqiAZXUV/FUFhE
         rpt0myaBZ9LYozG6wF6WDv2vO7XWNfowTOoV8e7+CZDbA8RuNb1Ll6yFj9BtLhIri+08
         3b09IsluVU08quLGJq0QQ3qmYwC81OoM0AN/3AsH5HELmaSZjquuiRp/9JhUGbd5UYtg
         CRRA==
X-Gm-Message-State: AOAM531zzaFX2gLo8SUuXzGNBVBfxgfNBoDVjPnmlFD3z3QKjwpVp9Mn
        nKtqljuEBSHyVw9yZuYNWBadfKaohJAAnugHSkuv45sMSmqE
X-Google-Smtp-Source: ABdhPJxqwdoquD6CD1t/4vURcXUY094C2cwyZVIZOKx/NGCIbF4xF4jKrwBVk0W6TIG38UReDIw9O+Vu9CfgTfvRCzjbz4MkjNyl
MIME-Version: 1.0
X-Received: by 2002:a92:885c:: with SMTP id h89mr22924691ild.16.1590357183712;
 Sun, 24 May 2020 14:53:03 -0700 (PDT)
Date:   Sun, 24 May 2020 14:53:03 -0700
In-Reply-To: <000000000000cd404e058c9de28b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000000537605a66be3a8@google.com>
Subject: Re: WARNING in dlfb_submit_urb/usb_submit_urb
From:   syzbot <syzbot+53ce4a4246d0fe0fee34@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, balbi@kernel.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, gustavo@embeddedor.com,
        ingrassia@epigenesys.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has bisected this bug to:

commit c61769bd4777a922952aed0d042a2572e5bd9b74
Author: Andrey Konovalov <andreyknvl@google.com>
Date:   Thu May 7 17:06:57 2020 +0000

    usb: raw-gadget: support stalling/halting/wedging endpoints

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14add53c100000
start commit:   051143e1 Merge tag 'apparmor-pr-2020-05-21' of git://git.k..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=16add53c100000
console output: https://syzkaller.appspot.com/x/log.txt?x=12add53c100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b3368ce0cc5f5ace
dashboard link: https://syzkaller.appspot.com/bug?extid=53ce4a4246d0fe0fee34
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15be3ad6100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1559676e100000

Reported-by: syzbot+53ce4a4246d0fe0fee34@syzkaller.appspotmail.com
Fixes: c61769bd4777 ("usb: raw-gadget: support stalling/halting/wedging endpoints")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
