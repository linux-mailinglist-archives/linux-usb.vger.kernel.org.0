Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD8348532F
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jan 2022 14:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236769AbiAENFJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jan 2022 08:05:09 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:56869 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236736AbiAENFH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jan 2022 08:05:07 -0500
Received: by mail-il1-f198.google.com with SMTP id a15-20020a92d58f000000b002b452d7b5ffso21381156iln.23
        for <linux-usb@vger.kernel.org>; Wed, 05 Jan 2022 05:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=HSRdWTMwZ0NVGbhn82fv0ZdfTEVZeKB9Mpbh30gZMkU=;
        b=beEwRx86xuJIhDkF4HgaQsbu8tZ3iTi8SXp2OqxTQI1lm75wUm1HZcXwsuiR7N0jlr
         QkAWE6fjG1Ro2coAwboWPYY0k+vTk4HCicMO0OL0SKC2jlfsbGNdI3VHXUYfLkWQI0nP
         YQOM/UMi1zxyy0TAl2zkLjXjL8t3w3PYobVBD8LRXtKFljoVvo/JGPcpY21YUfM4jCbd
         0/2D69avgqMfG0PBH9E7WgJo/eYgd1FpFt0kl0DJM1qmHDjHzjMBYnDy8n8k5+pN7fgA
         N8eGnDHy8RIp2zF64/G2tjGrmMrc/ijgSliA2ggr/E27rN3KuoxlMEAvHXGbMLKAMX1U
         HQjA==
X-Gm-Message-State: AOAM530c+qluEFvcYGR+h1GYO7vdJY+JQdViWdtYT9Rfu/mPyoIt5k21
        /pRVnFj8geLHDaF7CYGdQuvd6mhTEPj6SZ857eNXmil63Z7z
X-Google-Smtp-Source: ABdhPJy5x96xjIKmmkdWPCYacNAFMeYNDaWDDSM8GrSzjPCLFjWw7wZ0/pJUL3qkYuuidqhU5Y+GAzF7q6+5X9nh6352KMTjpd7z
MIME-Version: 1.0
X-Received: by 2002:a02:cf82:: with SMTP id w2mr24004765jar.314.1641387906942;
 Wed, 05 Jan 2022 05:05:06 -0800 (PST)
Date:   Wed, 05 Jan 2022 05:05:06 -0800
In-Reply-To: <66341bb1-a479-cdc8-0928-3c882ac77712@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000021c8c305d4d56799@google.com>
Subject: Re: [syzbot] KMSAN: uninit-value in ax88178_reset
From:   syzbot <syzbot+6ca9f7867b77c2d316ac@syzkaller.appspotmail.com>
To:     andrew@lunn.ch, davem@davemloft.net, glider@google.com,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux@rempel-privat.de,
        netdev@vger.kernel.org, paskripkin@gmail.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+6ca9f7867b77c2d316ac@syzkaller.appspotmail.com

Tested on:

commit:         81c325bb kmsan: hooks: do not check memory in kmsan_in..
git tree:       https://github.com/google/kmsan.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=46a956fc7a887c60
dashboard link: https://syzkaller.appspot.com/bug?extid=6ca9f7867b77c2d316ac
compiler:       clang version 14.0.0 (/usr/local/google/src/llvm-git-monorepo 2b554920f11c8b763cd9ed9003f4e19b919b8e1f), GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10d0da73b00000

Note: testing is done by a robot and is best-effort only.
