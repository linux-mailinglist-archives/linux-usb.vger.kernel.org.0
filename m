Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8223DB77CF
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 12:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389594AbfISKxE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 06:53:04 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:47531 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389586AbfISKxC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 06:53:02 -0400
Received: by mail-io1-f69.google.com with SMTP id q1so4558315ios.14
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 03:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=jr/hT8uygPGiBuTwaFY7igDD72bmfCnEZQ3lM50QObE=;
        b=C5bUgZbZqYnubejQ9j1j2XLyJtMG+7SA2tRHiLCPWwBwzRmXOq9sakwAx5i1cuTElq
         8y/oX+R6D/Qwx/NkTyWxhrpU/SCW1cOixYqZg7f1OY1Eo83uwvXWkIxn+xO0109KTY1N
         rMBPjiWtBa82yzlZxHhICqIFQaDXZKRd4CZK8y7bb7CdEqZBSgS4G+ngFZU/PbFax/ur
         N2sPzhT3XXISQk7F510PEnABsehjFRHkhjbd7y6jrlk6rCtLaLlhQPBuOHFnGl0q0GdC
         qLbgeIc3cTPUi0FzFnqNCFMLwV3DdHvnzyJBsJJEDJllqgZRo6NsThaWMpOCijxV7RYj
         sOag==
X-Gm-Message-State: APjAAAXiTh7mwbbYsW8gzPf2eojfk6xlsIlgov6kM4/EkrFoOgNa4pnk
        BD1x43pf3+vKPgKm+25tt87b1x5LoRpp5iXXxqDwegu7Xqrx
X-Google-Smtp-Source: APXvYqwBWekg4rlOfT8nn0tmPSwzloIFaVhEADkdzXirXXPPYKk38+p+DJLKH5A4eUO0l/GsUaCDAVmO12kKaHk5yiREht3CTXR5
MIME-Version: 1.0
X-Received: by 2002:a6b:e618:: with SMTP id g24mr10724603ioh.277.1568890380520;
 Thu, 19 Sep 2019 03:53:00 -0700 (PDT)
Date:   Thu, 19 Sep 2019 03:53:00 -0700
In-Reply-To: <20190919103504.GC30545@localhost>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d290e00592e5c17d@google.com>
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

commit:         f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=0243cb250a51eeefb8cc
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1440268d600000

Note: testing is done by a robot and is best-effort only.
