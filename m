Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E2EB938C
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 16:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387402AbfITO6B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 10:58:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:52004 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729077AbfITO6B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 10:58:01 -0400
Received: by mail-io1-f70.google.com with SMTP id a13so10871154ioh.18
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 07:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=yjRqz71us8hz9WiqACTPbhtvsfG2tGUS+wX95+jnwbg=;
        b=HY6RGfKylyFrtEXnlBpAGgD1evv1cNvXqqLZji4O6m009m06OhzNZB70WA68LRCJ+t
         iolSwTBljUNlcSFm35isU3ffITBdefYLFpTXEUA4K1qFF2nUGOMYLBvO2EJkoBO6VMg2
         RjVjsdD0/fjTqUA6xeBEGTXia39NRP7pb2pw439pNmYmwdKQjcKRtK15Jnp8TtQEmddB
         ZprFrAnrXZRbVUkyzDKUXCpH3dbH2DGo1CgRjfDLGgGKt7W7endnvFS/g+8vPoLcorMd
         1TXkWe4yb3cWUFG79YTtjrX103P0mZWB5DtZB25tZ8KYlewltKElG1toP7AOhsEC+GVL
         5Slw==
X-Gm-Message-State: APjAAAXtBnvD7cbEHkzoeQJQBTvpQNiaLnH1GcKQBdH7ugJmldJcIAav
        3CIze2IEnRmxfJL6l7+DNGwqa4Ic4yrA5GyWPvDkhDgzGuw0
X-Google-Smtp-Source: APXvYqzfwcNZtYmCVtloYB8YtbW6d+MeP7R2Kbo+2m4jSTJ7GOJRdqcI1uh2oQeWisD/IH5gPA9eP5GjYPKvyRQVPwTbin2IHxMC
MIME-Version: 1.0
X-Received: by 2002:a6b:bec6:: with SMTP id o189mr18547944iof.62.1568991480428;
 Fri, 20 Sep 2019 07:58:00 -0700 (PDT)
Date:   Fri, 20 Sep 2019 07:58:00 -0700
In-Reply-To: <20190920143855.GS30545@localhost>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d8c1ef0592fd4ba3@google.com>
Subject: Re: KASAN: use-after-free Read in adu_disconnect
From:   syzbot <syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, dmg@turingmachine.org,
        gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
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
syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com

Tested on:

commit:         e0bd8d79 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=8847e5384a16f66a
dashboard link: https://syzkaller.appspot.com/bug?extid=0243cb250a51eeefb8cc
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=122eb075600000

Note: testing is done by a robot and is best-effort only.
