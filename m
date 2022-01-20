Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF6F494928
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 09:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358610AbiATILL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 03:11:11 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:56954 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358561AbiATILK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 03:11:10 -0500
Received: by mail-io1-f70.google.com with SMTP id d125-20020a6bb483000000b006051f7a8573so3376429iof.23
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 00:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=BJlzqqjrs17SVp97ypy2bLlCbjlSXkVkZRZti+CfRQs=;
        b=CJ3D8Yb5153OHRYBWW1M+rFGgbZIFAlBADO44j7Z0B1xxx6kOcBQqtW5+IPHbll5Qw
         T7WawoCLoSaXuswnFvAHyitRdQFJUAX08Jv9tvWE7XzpTD24DuvvqjWhO3w+gHLnJI0A
         9cKhUClPa1PbuMuiNwy/45Udk7wjX01GtEuPQQeAtvic7d0vMl7gf1Xqw0twx/u0TPqt
         lkSEfPdV/d4yLuddTY17LjdIkI6d+Y9b4Xr7275PVAGYfKSxKcEWB60HkpA11jpgUF4Z
         ecQZVpMWJr3E4hmXyfah5S/9yZDY69skxMhTFPYPiaOfNHKShW9ykLHktTabwiuO3nk2
         w4wQ==
X-Gm-Message-State: AOAM533MnFSwrniDLzfnLJH+TA2wNNwZwdZ9WvTwIXfxQIDP5E0CQhhg
        GPLT6f47bWtOtZxuEjTLFf68ofMMybRwE4m1qcCW35S4/zWK
X-Google-Smtp-Source: ABdhPJwWlG4sbAoREBXQf9F9/dCtvTwajJXGqo5aO+aMprHZaFCbq/ikMbuPBBCk9mxPfSNhZNclzSCRxhsfveOKGgaEQPUJOpu1
MIME-Version: 1.0
X-Received: by 2002:a02:29c1:: with SMTP id p184mr15858242jap.301.1642666270090;
 Thu, 20 Jan 2022 00:11:10 -0800 (PST)
Date:   Thu, 20 Jan 2022 00:11:10 -0800
In-Reply-To: <20220120080020.2619-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000836a4805d5ff0b2b@google.com>
Subject: Re: [syzbot] INFO: task hung in hub_port_init (2)
From:   syzbot <syzbot+76629376e06e2c2ad626@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, hdanton@sina.com, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        paskripkin@gmail.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+76629376e06e2c2ad626@syzkaller.appspotmail.com

Tested on:

commit:         6f59bc24 Add linux-next specific files for 20220118
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=94e8da4df9ab6319
dashboard link: https://syzkaller.appspot.com/bug?extid=76629376e06e2c2ad626
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=101ba7efb00000

Note: testing is done by a robot and is best-effort only.
