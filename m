Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE494D7768
	for <lists+linux-usb@lfdr.de>; Sun, 13 Mar 2022 18:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbiCMR6V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Mar 2022 13:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235230AbiCMR6U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Mar 2022 13:58:20 -0400
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAED6D4CF
        for <linux-usb@vger.kernel.org>; Sun, 13 Mar 2022 10:57:12 -0700 (PDT)
Received: by mail-il1-f199.google.com with SMTP id f19-20020a056e0212b300b002c67321e5b4so7279203ilr.16
        for <linux-usb@vger.kernel.org>; Sun, 13 Mar 2022 10:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=MCQNOfY/gxkhxi2t8ROUAJ70EhHl39LgNGwrKEEHnCo=;
        b=rqk2RAtHOLYI4mAaZyFiWHZQ8KHssMgCVTl729lr7hG6Iq4+4YnX20fxNt+YMTqYEK
         dPTYBH6xwnRnFlzCWUn6dgl69LSIuAcW7oogflBX0EnfL54rAFOKcX5KWdtKVFf/t/ON
         rDqMaBuC1mOCHkrKbFZxywWKTY+hR6vuYOQGtvns/i8xFEL6Ihx/7JY62EuHCxaixuGk
         UvArKzA+xaWgKTVQXfL9KHy2G1uUnuUv4J9wkLwFoE58oCKufhjFreXzYnk6cHrTPQew
         SMPc9n465bIcH61b4nDNNsa9vDT2clPdqCNQMNMTPuxPF8/4vZcvJ06aob0KXZfQDKF4
         n5dw==
X-Gm-Message-State: AOAM530yBc8AHRFqJwHwxHcsqLYBN1JiXy8a4AT6McVjcOcSqvdYQxbI
        4aNvQeQBBt/W158uQ0lRsDAeO7ofiF8xbspjqlFRajTt27Qf
X-Google-Smtp-Source: ABdhPJzVh/IEYQqSipblD9WffKkRzlkJ290bx/e9C11owIMKBBEf4sE9mOJ8YN7+Oj13u4zBXkI/r47MZiBVdD2VhU8ai24Q/kC8
MIME-Version: 1.0
X-Received: by 2002:a05:6638:388e:b0:317:7979:f5bf with SMTP id
 b14-20020a056638388e00b003177979f5bfmr16801118jav.53.1647194232285; Sun, 13
 Mar 2022 10:57:12 -0700 (PDT)
Date:   Sun, 13 Mar 2022 10:57:12 -0700
In-Reply-To: <06e26e67-8ba0-8de7-df66-67c0b57a7dbc@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000176d6705da1d4bd3@google.com>
Subject: Re: [syzbot] KMSAN: uninit-value in asix_mdio_read (3)
From:   syzbot <syzbot+9ed16c369e0f40e366b2@syzkaller.appspotmail.com>
To:     andrew@lunn.ch, davem@davemloft.net, glider@google.com,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux@rempel-privat.de,
        netdev@vger.kernel.org, paskripkin@gmail.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+9ed16c369e0f40e366b2@syzkaller.appspotmail.com

Tested on:

commit:         72494641 x86: kmsan: enable KMSAN builds for x86
git tree:       https://github.com/google/kmsan.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=28718f555f258365
dashboard link: https://syzkaller.appspot.com/bug?extid=9ed16c369e0f40e366b2
compiler:       clang version 14.0.0 (/usr/local/google/src/llvm-git-monorepo 2b554920f11c8b763cd9ed9003f4e19b919b8e1f), GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11ccaa41700000

Note: testing is done by a robot and is best-effort only.
