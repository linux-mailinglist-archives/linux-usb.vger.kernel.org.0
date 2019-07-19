Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2636E1F9
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2019 09:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfGSHwB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jul 2019 03:52:01 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:33931 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbfGSHwA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jul 2019 03:52:00 -0400
Received: by mail-io1-f72.google.com with SMTP id u84so33861491iod.1
        for <linux-usb@vger.kernel.org>; Fri, 19 Jul 2019 00:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=K7+ltczxOF5ec7xwUwwm0mcqoPFbc+qj4S9WQ778w3E=;
        b=Tx0UyQaN/OjL6iTcDiwHt+oI0fMftWXqcXvJMAVWKTiWxrfc/XvifBbEnqdHWqi6PS
         XDHc7Xfhv+tzsxCpNaFTIAa9QP0wQpo24fMAMJl3lNICtBE1CPTePL2A9CO1Cy/oelQZ
         hqYXf8WnjhYvC7v5kf152dZvqjnghghbtFhOoEIEj+yGpiOhcWMtiHJRSdwCXSMOhUCT
         RUxuebFU/W+Vj0wUafwOE5vSnpep4VQWW9IIu6gNbtgZyEfy9SHZgRCGHrCFHdRyOzRs
         YNBD2GSChSKzbXH3lPkemkEVp2MOw/lUwZ11RID0/Cy5mJ6q/KFdJRNoRU4FkaF+bG8S
         JE0w==
X-Gm-Message-State: APjAAAUAtrEKJ1lHVgx1lE+rj39O1IkA2dphPN9sW+S3UqeK2QcYwYK3
        CktIYyFGMk4iOWB5nflER83zwco/3ULMjrtZlaIz3rmUjMy8
X-Google-Smtp-Source: APXvYqyupNDa+g+KEVhidPqN8odS/OREcVICYfkEh4Ipoej6+q4U3LM4sycHC9cn5h2fkqwp21trDBAioJv8oM9mfIt9XbnNd2ch
MIME-Version: 1.0
X-Received: by 2002:a5e:9701:: with SMTP id w1mr49010959ioj.294.1563522720182;
 Fri, 19 Jul 2019 00:52:00 -0700 (PDT)
Date:   Fri, 19 Jul 2019 00:52:00 -0700
In-Reply-To: <dd743f2b-4f86-196b-bdae-16c3286c8904@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000055da8c058e04001c@google.com>
Subject: Re: KASAN: global-out-of-bounds Read in dvb_pll_attach
From:   syzbot <syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com>
To:     allison@lohutok.net, bnvandana@gmail.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, rfontana@redhat.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        tskd08@gmail.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=d90745bdf884fc0a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=145eaa34600000

Note: testing is done by a robot and is best-effort only.
