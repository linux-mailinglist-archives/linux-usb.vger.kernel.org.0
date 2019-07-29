Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2A5A78B74
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2019 14:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfG2MOB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jul 2019 08:14:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:56663 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfG2MOB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jul 2019 08:14:01 -0400
Received: by mail-io1-f70.google.com with SMTP id u25so66898008iol.23
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2019 05:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=dBWs2Q4aSNCPrh51tllmEYz3hwDXtuHdF8c0WVtElDc=;
        b=L01ZiC7LYJfkASLvQAmPCgJI9u9/meEA8G+/miI72+qTVjf+si3ZXwKz7WBFanBlly
         X6o5Qg8MbqH6w6fFCZuN/ZZ6BeYaHAsn6fimizxVCV2FiZel47ebU7XcD9SRKolm49FS
         tC8kZKilUHHTDC7Rc51bswMiba1lNF8v6gfuumoC5o6MJ4E6KfHAjJ+Ul+6/104dqa4e
         /WildORV4tP7i7TlGfknfELUEWNS+JMvg2p7gENSHiaLR9OSRYXV9pCCmGFvzg66WhUO
         5xLVlVBzXTkXnbrLvjVnZv4NUZytgzVPdoY2TlMz1QTn6sYKii9ZFq/9ZfKvKQewpYQb
         XOVQ==
X-Gm-Message-State: APjAAAWpEsmtN0hnUhUPAk+9ULMbX2eW9WkIP62jk5g4/U8MDwK0MnpQ
        lDxM5jQmHjtpA6gHWaddFFnkFWQV+6KmN7uq7Fq7Mkqo4zKP
X-Google-Smtp-Source: APXvYqwN32rr87CmZhA9Z2le1yZRT3HxuS/046a9tIyFSz50teduzazlfLi+RyBRRfH/iP0foDm8GL56YQbdBlNAeojZunqrfIPD
MIME-Version: 1.0
X-Received: by 2002:a02:3904:: with SMTP id l4mr111985473jaa.81.1564402440899;
 Mon, 29 Jul 2019 05:14:00 -0700 (PDT)
Date:   Mon, 29 Jul 2019 05:14:00 -0700
In-Reply-To: <1564401374.25582.9.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c69758058ed0d345@google.com>
Subject: Re: WARNING in iguanair_probe/usb_submit_urb
From:   syzbot <syzbot+01a77b82edaa374068e1@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-usb@vger.kernel.org,
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
syzbot+01a77b82edaa374068e1@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git  
usb-fuzzer-usb-testing-2019.07.11
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1765b842600000

Note: testing is done by a robot and is best-effort only.
