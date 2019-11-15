Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E39FE458
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 18:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbfKORvZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 12:51:25 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:52256 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfKORvY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 12:51:24 -0500
Received: by mail-il1-f197.google.com with SMTP id t23so9507986ila.19
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 09:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=pGJy5bV/ClMY0bQDidFNUwMMkISrO4lRL5Ugf+Rz2YY=;
        b=mJLdmPSm6KW85U6ZljGJRQI0fZne+rHPe+AtOurI4UKtBpctCNb5K0iJkpzs5b2w/9
         5EGpZuhJa3P+MFXVak75h2kXj3lV67T00EnrihtH5xrErL5NtCiQ3oWOmcXNQn0VpROp
         zuqf0i6QMFBzWQTtW4suQTVtkkPj5P4b84X22qm7OswAiQkg5cD8XZguzlK2G1mkstRZ
         hLyZXf+FlbpcIz1Ucg5OES29qwJS27fr9cRP5KBfayuz8EGG132N0MKOrW5k2QT9PvOb
         CKWFO9a5MsCwjun3dXmDn/NZ7oWXyoBRwAg1UgDUGWO/fAoljvkOPNTeGnF62XK4Arfb
         h1Og==
X-Gm-Message-State: APjAAAXOxjp4EpZy/ihZ9dRTSVLLc7nFXMdGWsxWk20WsA6nCB5CaLbm
        GYUxiwK2dcZwdZRtk+LyipdwYwIlMExnQGDEsnYTrTz3Xxs6
X-Google-Smtp-Source: APXvYqxIKKi0/wnIl2ukMipzPOcGhT1Mj43uGPGEnX0b3CFttSEg5G8lFDDVS8HLZr0z0KhEQPp+P5k74GJmu4km2VyfzOyuGwXP
MIME-Version: 1.0
X-Received: by 2002:a5d:8555:: with SMTP id b21mr1949271ios.22.1573840284098;
 Fri, 15 Nov 2019 09:51:24 -0800 (PST)
Date:   Fri, 15 Nov 2019 09:51:24 -0800
In-Reply-To: <5dcee59a.1c69fb81.188d.e4b9@mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001129840597663fa0@google.com>
Subject: Re: Re: INFO: task hung in chaoskey_disconnect
From:   syzbot <syzbot+f41c4f7c6d8b0b778780@syzkaller.appspotmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     alexandre.belloni@bootlin.com, andreyknvl@google.com,
        arnd@arndb.de, b.zolnierkie@samsung.com,
        gregkh@linuxfoundation.org, herbert@gondor.apana.org.au,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, lvivier@redhat.com, mchehab@kernel.org,
        mpm@selenic.com, swboyd@chromium.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Quoting syzbot (2019-11-06 04:32:09)
>> Hello,

>> syzbot found the following crash on:

>> HEAD commit:    b1aa9d83 usb: raw: add raw-gadget interface
>> git tree:       https://github.com/google/kasan.git usb-fuzzer
>> console output: https://syzkaller.appspot.com/x/log.txt?x=16ae2adce00000
>> kernel config:   
>> https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
>> dashboard link:  
>> https://syzkaller.appspot.com/bug?extid=f41c4f7c6d8b0b778780
>> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>> syz repro:       
>> https://syzkaller.appspot.com/x/repro.syz?x=10248158e00000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16afbf7ce00000

>> IMPORTANT: if you fix the bug, please add the following tag to the  
>> commit:
>> Reported-by: syzbot+f41c4f7c6d8b0b778780@syzkaller.appspotmail.com

> I suspect this is because of the kthread getting stuck problem reported
> by Maciej. Maybe try the commit that Herbert picked up.

> #syz test:  
> git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6.git linus

Bugs found by USB fuzzer can only be tested on  
https://github.com/google/kasan.git tree,
usb-fuzzer branch because USB fuzzer is not upstreamed yet.
See https://goo.gl/tpsmEJ#usb-fuzzer for details.


