Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94DB7A891A
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 21:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730117AbfIDO7F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 10:59:05 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:41770 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729957AbfIDO7C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 10:59:02 -0400
Received: by mail-io1-f71.google.com with SMTP id t8so27596412iom.8
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2019 07:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=OHAiKKAdXY9jCvbhzEA9HqiANItDsq2H4xiUo40Eykw=;
        b=AEeBTVrbg+zwBFe4v0NAZ+HgUOO+RzrNzz0lWywX12anLvcAVsuTvsv2qmpRNaZE3z
         21U1+xdejehjO/7M2GsPQTO/nWrpiEGfYa+wj7OnxQHvYU+EJDs0x9dqOu40Rdy20zU4
         /RHgXjtI09TzUW0TQwGW/RLt8QrUkX5dGvVCAka3ugmr5fqTIw+saNE+6zP+KntPS0v7
         nhuo/b0fQD5Jt57Eg69D/NahqbgYNKplLDrIJzAFmzFbz7ZDiy6Ql4PLm6i6pEJcDZVa
         6miDTVINxZDhvEzII1tADFg7xnRkM+6qnbPhv651fZpkScgxlgqs+bIgeYUufLcj2cFX
         C5QQ==
X-Gm-Message-State: APjAAAXFpcma9jswu2iv59nwAISY7erAIrMEIMBQT7T9jkVMEqNog+XO
        Z7R2KZSK80vcSIkyU38lMcD1vDW04HSBW3WsfPQh5uumA7Pt
X-Google-Smtp-Source: APXvYqzGwMPp56tk6BDX0OXjwrYJWZDn39d0IuhDaGmvGQ0JDxlhCVa7F6Ad6gEt28kGtkUHEiAVjKFC6SJJA5SwDkwzDWdFSQOG
MIME-Version: 1.0
X-Received: by 2002:a5d:8353:: with SMTP id q19mr1548312ior.59.1567609141323;
 Wed, 04 Sep 2019 07:59:01 -0700 (PDT)
Date:   Wed, 04 Sep 2019 07:59:01 -0700
In-Reply-To: <Pine.LNX.4.44L0.1909041038340.1722-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000003f6410591bb7223@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in usb_reset_and_verify_device
From:   syzbot <syzbot+35f4d916c623118d576e@syzkaller.appspotmail.com>
To:     Thinh.Nguyen@synopsys.com, andreyknvl@google.com,
        dianders@chromium.org, gregkh@linuxfoundation.org,
        jflat@chromium.org, kai.heng.feng@canonical.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        malat@debian.org, mathias.nyman@linux.intel.com,
        nsaenzjulienne@suse.de, stern@rowland.harvard.edu,
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
syzbot+35f4d916c623118d576e@syzkaller.appspotmail.com

Tested on:

commit:         eea39f24 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
dashboard link: https://syzkaller.appspot.com/bug?extid=35f4d916c623118d576e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11d694d6600000

Note: testing is done by a robot and is best-effort only.
