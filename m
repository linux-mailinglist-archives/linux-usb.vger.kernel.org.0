Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7849578EAD
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2019 17:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387882AbfG2PFB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jul 2019 11:05:01 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:44713 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387858AbfG2PFB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jul 2019 11:05:01 -0400
Received: by mail-io1-f72.google.com with SMTP id s9so67857650iob.11
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2019 08:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=83ogxiWJAcfPlpqDFHyk9MJiHXTGHElwcaQ+ZeWPJvY=;
        b=B+ERahfiB1r3JAUOoikniJfENheYVhrXsIepk6mniD1vAwa5WWNib7l7tKn2pLCO/Y
         hYQ5kKlUOw47pxJQ4Lj0MzdrdJLql3/qsK2/fN1q3Ukbv231pK+jYkrVWB7Pq9B31jVz
         ypOfe9/KciBkwnb7yw5h5tPWPCb9hMYXg9mOTRucQMt0xyeX3mSC2SV+GqY/aV2FjaBH
         Xdiuf5zucGLGSOxEuIa7sX57KjOsFywayBJY8cdiuD0ud/B7ENpz4JBd2uywhRb1KKbJ
         wtgathFsaomVIHfZOEupFLvYavAVgbya0YRB3rRDWfT9bKjaxKTNJAElSDKOLE7B3iJY
         zfWw==
X-Gm-Message-State: APjAAAWh+JZu8Bj0FiQsCeHProfk+GuiZTnmpTZ7f2NGLifIpiG/sgYL
        fdSDRZNIuSeoGWsXqS9uSFJoDuQD/w9h+PU7rUX7GijVqyBx
X-Google-Smtp-Source: APXvYqzuprNbhcYXnWDZznVvJM8hy7civm1NgXptFAKw1t1/zdh4LNbL91ZtdbTJiYOgfkptxXs1BQq48/Fe4yaKBgO+y9MnqiVg
MIME-Version: 1.0
X-Received: by 2002:a6b:b3c1:: with SMTP id c184mr51761619iof.222.1564412700296;
 Mon, 29 Jul 2019 08:05:00 -0700 (PDT)
Date:   Mon, 29 Jul 2019 08:05:00 -0700
In-Reply-To: <1564410374.25582.15.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000488c6d058ed337b2@google.com>
Subject: Re: general protection fault in flexcop_usb_probe
From:   syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git  
usb-fuzzer-usb-testing-2019.07.11
kernel config:  https://syzkaller.appspot.com/x/.config?x=662450485a75f217
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1036e80c600000

Note: testing is done by a robot and is best-effort only.
