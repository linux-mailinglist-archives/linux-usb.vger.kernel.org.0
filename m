Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097A82E727C
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 18:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgL2RAs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 12:00:48 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:49229 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgL2RAs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Dec 2020 12:00:48 -0500
Received: by mail-io1-f71.google.com with SMTP id m19so5953286iow.16
        for <linux-usb@vger.kernel.org>; Tue, 29 Dec 2020 09:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=gwu8pvrcZ4jMJ2+bY0U4Ug2vWoWnObRnoe2v75tlHHI=;
        b=HAlwa15YeDkuP7vck0eOnoY2v44erOp8/TOLvGpEfofxgHwM5zpfu273RB8sFyDWt2
         H9s1ULbIkGGWPLeDgnyfm1fwkxCSzkDYzsc2/wZjdcOU6QuR+dxvuvGQ4aQPrElxklWa
         hwql/1NjaTGxR38eUkpvDKQDcrS5tWDT96QOhvpfEJeeIwrEx5v77Ugts07fFb6D7lHv
         Lm7AmJUHlUoP0CtaGM6KuFI+LMTbzAZZa5NH1hdQNwXMeXlyGiWs+uS7YOZ5fTkmRzS1
         4WVD5oMR5W0Q84ZPzJn89UQ3MO+CyX7c0VlXGm54Y9mO8bVZfduyg65i/dE6SzHSydo3
         JYzw==
X-Gm-Message-State: AOAM532KILPPoug7+Gg5nK00Ocbl+Lhb6rLzKaRUAZSox/wSosmyug4r
        PX1SPTU+ytZ83T2yKHBGeUQwafWIeifYdRs4c1ahSHL6D2rg
X-Google-Smtp-Source: ABdhPJwEXTBtDlLd4WgdRGaMv6E4WLhVB8Me7nDoTnJSNERh+LsAoTJcXjz97hj8krknWHideC4xQKNmeCaevjYEktzqUq1+YH0v
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:152f:: with SMTP id i15mr47744669ilu.104.1609261207467;
 Tue, 29 Dec 2020 09:00:07 -0800 (PST)
Date:   Tue, 29 Dec 2020 09:00:07 -0800
In-Reply-To: <20201229164314.GB694118@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009f3cf405b79d5267@google.com>
Subject: Re: UBSAN: shift-out-of-bounds in dummy_hub_control
From:   syzbot <syzbot+5925509f78293baa7331@syzkaller.appspotmail.com>
To:     andreyknvl@gmail.com, andreyknvl@google.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, gustavoars@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+5925509f78293baa7331@syzkaller.appspotmail.com

Tested on:

commit:         e37b12e4 Merge tag 'for-linus-5.11-ofs1' of git://git.kern..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=98408202fed1f636
dashboard link: https://syzkaller.appspot.com/bug?extid=5925509f78293baa7331
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16f0bc70d00000

Note: testing is done by a robot and is best-effort only.
