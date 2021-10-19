Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E222433111
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 10:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbhJSIdN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 04:33:13 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:33580 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234567AbhJSIdM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 04:33:12 -0400
Received: by mail-il1-f199.google.com with SMTP id r18-20020a056e02109200b0025920bc2e5eso9721274ilj.0
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 01:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=g5ucrH3D4aJ8v2V4UuUZZDEXNE8re1s/NaWn5r42864=;
        b=DVD/znSWJF11fjqXeZRfsDpDeui0IRyFMyAO/zUnwLmVmSv/9KFab5NC6tkmuZtF3m
         qNLojKidUYDg7VRY1DHbqwabs8139CGx4IP2k3Ysf8RxtHFZ1k9IBGfhsicSDi+mSpeE
         8YvVA1t5PLWrTLIJK/0B0Jg4T9+Zj7KTY7QnJojFYZZwOZpSA/7FZL4T4tXjkLblTTMq
         L0T+OwMtYegKsHo/KWuX6Ts2GeNXJy33Q8llFpWpnEKcaWaAGPX5C2N1F5zULQ+AOddK
         8Xgu3TMcb0TxOR5rdS7b2C+gL5ncCaccjRYZrrE2wcUBqovLN4vlcvJr70mOBoB3lpt9
         2dow==
X-Gm-Message-State: AOAM531pNLh4ubwUFob0PxUp00QfK2wN4DqI3Hb81D6kHfoDw59EghN1
        ngxgIHnW6KfmV7KQK4WzzQ10SGJT/sv4aqMUpStioWO7akkI
X-Google-Smtp-Source: ABdhPJzBmbgKRZyZ9iff3KS0pyPveoENcLIRI0M6r2myijAkt2hpFt/jh99jDKOa+mGvekHo7ZuA1ecxCKJdoRLewL2TVQd/tbFq
MIME-Version: 1.0
X-Received: by 2002:a5e:dd46:: with SMTP id u6mr18075445iop.217.1634632259876;
 Tue, 19 Oct 2021 01:30:59 -0700 (PDT)
Date:   Tue, 19 Oct 2021 01:30:59 -0700
In-Reply-To: <535d2ad0-1667-403a-9771-ad9c7b9748a8@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000030395e05ceb07bce@google.com>
Subject: Re: [syzbot] divide error in genelink_tx_fixup
From:   syzbot <syzbot+a6ec4dd9d38cb9261a77@syzkaller.appspotmail.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     davem@davemloft.net, kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
> On 18.10.21 20:55, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    660a92a59b9e usb: xhci: Enable runtime-pm by default on AM..
>> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1506ccf0b00000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=5016916cdc0a4a84
>> dashboard link: https://syzkaller.appspot.com/bug?extid=a6ec4dd9d38cb9261a77
>> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11308734b00000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f56f68b00000
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+a6ec4dd9d38cb9261a77@syzkaller.appspotmail.com
>
> #syz test:https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git c03fb16bafdf

unknown command "test:https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git"

>
>
