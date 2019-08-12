Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3B758A1F0
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 17:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbfHLPGB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 11:06:01 -0400
Received: from mail-ot1-f69.google.com ([209.85.210.69]:41872 "EHLO
        mail-ot1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbfHLPGB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 11:06:01 -0400
Received: by mail-ot1-f69.google.com with SMTP id a8so84759437oti.8
        for <linux-usb@vger.kernel.org>; Mon, 12 Aug 2019 08:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=UdT6wUZ/D8ky7HtPCj9VpMdye4p6v52eVLFOfN7WQts=;
        b=VusUe4KkeN7iMGxvtdEC8ttm1loj6KbwgNc99IekaXebGemKCYiOWhoR3xRUB0QZoz
         aikOt/qnayMQpGlwb0hFCEdjl7gmE/p1vgMYzuBbZf6TWHkW8LHDnZwxVPY3M3Wih6hl
         +ydZEerGBGuc9sN+D5m50fSIAD7LKczvkzWZ8B3aTbPiV+mwJMzuN98UsnS4HaA4E5n9
         NDbMF1uyyx/nUwu0gvP5Ykb0e88Hgo/GA5PAZVxNqJqV2kqSY8KJV3EKqezCkZ+k1Ukn
         UnlnpK2RgVlk4oSxGhQfpvCn3C2QSMqVrllhbDvCyS5fI9f5aBU8ZRzotmpBKgrTpexX
         K6Lw==
X-Gm-Message-State: APjAAAU5ZUpDJTx1CrTVNGvJf/c9pcg9mu6QS7v7Bjz9ZhD8H2w+w6WL
        w2IneMRvKJLIwg8LWXznTLiqnRqMQm77xgelTQYtn39vo+9O
X-Google-Smtp-Source: APXvYqwxLBlryY9AUKUQMeg0vCZyhR/BAXzcWCPEWAR/D5r2dVoCbvnxs4b2xafrrXxYy2E7KpBMgX++6+Ns9fTe7IJHLPoTqUBj
MIME-Version: 1.0
X-Received: by 2002:a6b:bcc7:: with SMTP id m190mr24368313iof.107.1565622361221;
 Mon, 12 Aug 2019 08:06:01 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:06:01 -0700
In-Reply-To: <20190812144720.1980-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b1729e058fecdcee@google.com>
Subject: Re: general protection fault in __pm_runtime_resume
From:   syzbot <syzbot+3cbe5cd105d2ad56a1df@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, hdanton@sina.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        oneukum@suse.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+3cbe5cd105d2ad56a1df@syzkaller.appspotmail.com

Tested on:

commit:         7f7867ff usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=177252d2600000

Note: testing is done by a robot and is best-effort only.
