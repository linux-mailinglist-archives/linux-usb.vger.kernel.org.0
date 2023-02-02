Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0539C6888D8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 22:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbjBBVQb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 16:16:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjBBVQa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 16:16:30 -0500
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0225A373
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 13:16:29 -0800 (PST)
Received: by mail-io1-f70.google.com with SMTP id d24-20020a5d9bd8000000b006ee2ddf6d77so1877317ion.6
        for <linux-usb@vger.kernel.org>; Thu, 02 Feb 2023 13:16:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+YbYrisVg+rUMlfc+ZTbTP5txmI4PVaRYzb4aIG716E=;
        b=uuJlIDwWmuhIWfhWZXzUuZwhazr7ODOsmbP0iXv99VK5S2OVyy7nRlW4Nn2OTsTJM9
         JL/0r4bEplf3zAYPgCrUkEAP8vCFN+MNESvMRL/zRcH2JvNSq36aGE8qakzMk9MYK4NJ
         Gqbdu9CpzV5X+su8ZN0mH+T4cDiue5WXQUxaZnpYgT3wNel+p5keqMAjSaPOh+PUn8l+
         c01d9jex/AreyMaQ/2lGVJ/f9DSL8rUZuW9EWZYU1H6sLjdI/wl3FLUlZBxn6LF3UBQg
         85A0yr0A6EnYxtPe18hbzm8HbSX/qMnaj+76RjqAVS0i1xpINYtYjnixQ1Rb/elCBUzK
         bJGQ==
X-Gm-Message-State: AO0yUKVL9qz6rL0HaUKEIGs67CD4Z47j+H3JUvbUEDCYm7mpHNun3INC
        QIKiV/R2limkBC3Q5jSwvoolOMXhuYu6pNcVl8lw/SXVnBIQ
X-Google-Smtp-Source: AK7set9iDhmuB+0/B75YQ9dp6pYxfnN++6k6LDppqbGnv35zHEk/f8aqTpgfmaZNX6aL4LXxYfLT6ZrZqVONGUPX2UgNDdAVBFKx
MIME-Version: 1.0
X-Received: by 2002:a05:6638:37a6:b0:3ab:d5a:e20f with SMTP id
 w38-20020a05663837a600b003ab0d5ae20fmr1813657jal.47.1675372588686; Thu, 02
 Feb 2023 13:16:28 -0800 (PST)
Date:   Thu, 02 Feb 2023 13:16:28 -0800
In-Reply-To: <Y9wh8dGK6oHSjJQl@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000003e49a05f3be1479@google.com>
Subject: Re: [syzbot] WARNING in __usbnet_read_cmd/usb_submit_urb
From:   syzbot <syzbot+2a0e7abd24f1eb90ce25@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mailhol.vincent@wanadoo.fr, mkl@pengutronix.de, oneukum@suse.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+2a0e7abd24f1eb90ce25@syzkaller.appspotmail.com

Tested on:

commit:         9f266cca Merge tag 'for_linus' of git://git.kernel.org..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
console output: https://syzkaller.appspot.com/x/log.txt?x=157cfe31480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=94f93727847d4d81
dashboard link: https://syzkaller.appspot.com/bug?extid=2a0e7abd24f1eb90ce25
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=173ddea5480000

Note: testing is done by a robot and is best-effort only.
