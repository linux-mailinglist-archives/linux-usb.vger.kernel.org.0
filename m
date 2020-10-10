Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872AC289D25
	for <lists+linux-usb@lfdr.de>; Sat, 10 Oct 2020 03:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbgJJBlB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Oct 2020 21:41:01 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:52280 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729315AbgJJB1S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Oct 2020 21:27:18 -0400
Received: by mail-il1-f199.google.com with SMTP id m1so8336523iln.19
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2020 18:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=8OsC1Z46bkpCXK7zlGKfNBeg/b4R5n/K4/+udpZ91nQ=;
        b=jFf5LumLiiZzazP7svIX7GQcjI5zrHgMoULDciQ5Yi2YvnCbYWqbwex4DaEXZ12mMC
         73lPmb5qif0CofIUAxz8mY+gPcaRPDpGQU2tRpjqT8jttIUmCjfq4KJEP+tlbKczOA1q
         OQzEINBzrCPn+u9KeO91S+IbUViCDBxbqVj+gb689k07C1BftJap7XqxlnFf1v2SVGbv
         naACgHp/7oo0tsrruVkRUhw8kQWQJQ3bsn+akEZELyzKQ2x0/sBo5uj/LZm72dyStovW
         5LE0/ci3jELP6adqLT6+3DKClJi58/73MM3m3VsnGMbmZgqdMCIO/4LNMOe9kPRF0aj/
         iR1A==
X-Gm-Message-State: AOAM531aKwrbFTbqveknLclt2vih9Po9e2QK8RfwqPIzQywtSgah1x1m
        93YjEBmxeUH4zzwhcPargSr0uF8GNhK4ej5uhw1g/XKuA7MK
X-Google-Smtp-Source: ABdhPJxj4LVaMnRw3LHLpSZCvAk/5cbtNzA0dxEA5sAb2ppy8Cj0rGxAn+NqXSqtHvfGxuic8f6cM1YKfMfdgw9yvLbHdmZ+w0sC
MIME-Version: 1.0
X-Received: by 2002:a92:4101:: with SMTP id o1mr12200876ila.296.1602293233687;
 Fri, 09 Oct 2020 18:27:13 -0700 (PDT)
Date:   Fri, 09 Oct 2020 18:27:13 -0700
In-Reply-To: <20201010010817.GA557391@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000005234105b146f7bd@google.com>
Subject: Re: WARNING in hif_usb_send/usb_submit_urb
From:   syzbot <syzbot+f5378bcf0f0cab45c1c6@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, ath9k-devel@qca.qualcomm.com,
        eli.billauer@gmail.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, oneukum@suse.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+f5378bcf0f0cab45c1c6@syzkaller.appspotmail.com

Tested on:

commit:         549738f1 Linux 5.9-rc8
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git v5.9-rc8
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b79158db7761422
dashboard link: https://syzkaller.appspot.com/bug?extid=f5378bcf0f0cab45c1c6
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16da8ffb900000

Note: testing is done by a robot and is best-effort only.
