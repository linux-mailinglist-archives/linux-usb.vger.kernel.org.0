Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7541498048
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 18:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729065AbfHUQiB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 12:38:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:45322 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbfHUQiB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 12:38:01 -0400
Received: by mail-io1-f70.google.com with SMTP id e20so3152814ioe.12
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 09:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=hpnPsiFxnX4XDyKKrij/XCBcvslRJvlSawvX44PAZjY=;
        b=levyYCMzrNhPzcXa6lNUHg+glFEgE6ig494ShrK/QVqyiNIAusP9vTtW9iLb8LFrlU
         KG4EonwBGqhEVyj8Sp7SG0pTu6jcoh0t/w/5W6xlttF0y/kWZoHVZTzomJcJNtEJcn8u
         g5tZP43u6RFjOW/AXCr1CxFqpVfFk9Uv3XrkDPMVxsPk8+jWGBBPbnYHBNaOrDuNHSdb
         U94+yewvlw/0GFxnrfWwj4hojr/Lm/ySe9MIh7iAiamUWTNYfNDMBq3ykmDZVmZTrjjs
         6DP0eqNV52LL8QRCyOG1PaC5Ndd6TIrnbAjmvW43pmmRy5vyx1JKrMWzVKGWvSTR0r50
         kZmQ==
X-Gm-Message-State: APjAAAWaZZ/Ifob+fnVS+KMDMaANwRiUAdhkHW41I7o5/B64ZtK5tveT
        fjHugdt9NrT3EDLVAQZLRAEh/suSuuJegZnwRfyXT6HwT9Mb
X-Google-Smtp-Source: APXvYqx76j7sCJ+5CJnRmQmxnncU7QrnrzyIHW9UZT25BmB9EFhFr67Nf77WFBvMwT2ZLgcFjF7Y00vDWQM4n7IxPoUjPsKnIg/l
MIME-Version: 1.0
X-Received: by 2002:a5e:9515:: with SMTP id r21mr14546609ioj.257.1566405480740;
 Wed, 21 Aug 2019 09:38:00 -0700 (PDT)
Date:   Wed, 21 Aug 2019 09:38:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1908211218550.1816-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000040fec90590a33230@google.com>
Subject: Re: KASAN: use-after-free Read in hidraw_ioctl
From:   syzbot <syzbot+ded1794a717e3b235226@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
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
syzbot+ded1794a717e3b235226@syzkaller.appspotmail.com

Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=126b9da6600000

Note: testing is done by a robot and is best-effort only.
