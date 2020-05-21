Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF3C11DD765
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 21:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729429AbgEUTiE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 15:38:04 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:36464 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728902AbgEUTiE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 May 2020 15:38:04 -0400
Received: by mail-il1-f197.google.com with SMTP id m9so6569506ili.3
        for <linux-usb@vger.kernel.org>; Thu, 21 May 2020 12:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=NkM41cRyykyrTcXhuRq+Uqt1euBLz5q82M1iSb3aSkc=;
        b=MVHQ9fyw/SopBx2QgiVJ3Red4f7pjCj0fYxJmpvdcZEPgyRZCC0La2cl41DXmaqRh9
         lMC172AsKtF0Y6HY40oVzE/l8GxctEkUfBLAiueyr5zoeO7ZGywDUAveyHHmaN4biSP/
         VHGm9WW5cCOHNxlFrZ4aAxZPyYabMYyrE3fLTHwbNPaU3wM26KtWG0UE9g1SuyaV79e5
         G/ym8MsA2pCmOJKEmwvBjAvt6oEj/2xCKv+I5LUx82sukB7/YszdsvyJGzLyo/ZTIGAq
         LTai3I28+G8WU040CsZQm+6kIM+h2wln+/HcT7/Bj/P/whlZGBxCMdFEuQzGF2FiID9u
         OOOQ==
X-Gm-Message-State: AOAM532xZkGQG2wsj0Jei5ea3eQBKi1y1yoRPx3y7aGGPRW/4p1q4l7q
        4VUYgoUeEZcSE+uWratS/PAz/m0+4QiZv9sCZQ8+9rDkKjLD
X-Google-Smtp-Source: ABdhPJz1FMid2HBzS6OeC8X8s51lXhWDo/4NiVC0UQXz/KcfgeapJlPG+XCp1SR4JS6Dx+SAezbEtWn4NTX3HiGc7Kjpjzv7X1zA
MIME-Version: 1.0
X-Received: by 2002:a92:40ca:: with SMTP id d71mr10291945ill.200.1590089883386;
 Thu, 21 May 2020 12:38:03 -0700 (PDT)
Date:   Thu, 21 May 2020 12:38:03 -0700
In-Reply-To: <0000000000004a72f505a5a16525@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a9080105a62da6e4@google.com>
Subject: Re: WARNING in media_create_pad_link
From:   syzbot <syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has bisected this bug to:

commit f2c2e717642c66f7fe7e5dd69b2e8ff5849f4d10
Author: Andrey Konovalov <andreyknvl@google.com>
Date:   Mon Feb 24 16:13:03 2020 +0000

    usb: gadget: add raw-gadget interface

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=126d2b81100000
start commit:   b85051e7 Merge tag 'fixes-for-5.7-rc6' of git://git.kernel..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=116d2b81100000
console output: https://syzkaller.appspot.com/x/log.txt?x=166d2b81100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c33c7f7c5471fd39
dashboard link: https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16accd06100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1680ce5e100000

Reported-by: syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
