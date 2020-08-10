Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983702403BE
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 11:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgHJJAW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 05:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgHJJAV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Aug 2020 05:00:21 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EEB6C061756
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2020 02:00:21 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id p4so7678385qkf.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2020 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6eOotJvmDLOifn2DDyxVeyW1zenshrM0YRGd8c7mhjM=;
        b=KjDQVmGUKve/oHS+rOhC0YO7f/PMHyLYy0tXIzrr8U7OjOD+15SNje7iTvoQXpOEPO
         W04KKExVyu1ifZOx8/ODDfMbghGnbgWLc6+pVAdkqo6MfzAnqzBas4sMjvltuOW2PVhT
         DfTuepPf4KiMlCGdY3KQPh55jPngjxrgvwyaw+3+ChMHDdrvgiyq0iodQEGpKlUr61T+
         ECY4XlIXb65A74zszKi6eo1pIOyNnzOCCkwYX+MOrCKycs98GgvI79f8FAjtOqunSQhC
         uHClLZuCoVQs2Ac7IhaZeUNmIPIoCojTzLvYdNVj6pA7O8lU+jFPwEC9ULTWV56V8WPV
         Gikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6eOotJvmDLOifn2DDyxVeyW1zenshrM0YRGd8c7mhjM=;
        b=gbyWW0ZpmaIFmUvdR/3o4IfknHo1F4mAVdyc7OaU1+BTnZEUScLy0LPa9dSUoz9RpY
         uk/XfdkMRD6Z9gmL9eyFUZhz/aksC5ztGqa81if/a4Gnm4TlJu1TYWa+wdFjiDQOoOn9
         hktibPxK8XiK5o6tbYC0EuKnQiaHrkQe+X+XGOhfBTGwny/gie06G6FL/K9+0dAHuXSR
         SqDP4jZ77hxwLIcADU27eBEOIQPLa62kesPELUOcoTefniqdM+V+CRVjpyAH/ODbN40+
         7CiOB+zEg0KEmQVedFGGmqxd+4cbbjnL5OFiOnq15H3jXZdAnPZ/wo0c7NzLwOxAvrjz
         M12g==
X-Gm-Message-State: AOAM5334ZLpYPa3GvQOUOcuxKeLbTSl4mIJpoLkfjWmY4jOiPNb67UcU
        ovdAeSZWdXp0eZIIPRSN3XXVz7k1LTou9QvCFZSQFQ==
X-Google-Smtp-Source: ABdhPJyNpi5It7yWfCpfuLLSJW/E5rXMg7Zqs9Sc5SDQ6LIUs6wdqTZbVPiTzVJpMhFAlN6EvGsmXNBpy6s/DP30yOc=
X-Received: by 2002:a05:620a:676:: with SMTP id a22mr25584784qkh.8.1597050019275;
 Mon, 10 Aug 2020 02:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ce85c405ac744ff6@google.com> <20200810074706.GD1529187@kroah.com>
In-Reply-To: <20200810074706.GD1529187@kroah.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 10 Aug 2020 11:00:07 +0200
Message-ID: <CACT4Y+aS6oangE4BzhCfx3gs9guAW=zQpwN1LP+yB3kza68xFw@mail.gmail.com>
Subject: Re: KMSAN: kernel-infoleak in raw_ioctl
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     syzbot <syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>, balbi@kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Alexander Potapenko <glider@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 10, 2020 at 9:46 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Aug 09, 2020 at 09:27:18AM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    ce8056d1 wip: changed copy_from_user where instrumented
> > git tree:       https://github.com/google/kmsan.git master
> > console output: https://syzkaller.appspot.com/x/log.txt?x=141eb8b2900000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3afe005fb99591f
> > dashboard link: https://syzkaller.appspot.com/bug?extid=a7e220df5a81d1ab400e
> > compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> > userspace arch: i386
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
>
> The irony of a kernel module written for syzbot testing, causing syzbot
> reports....

The raw gadget and KCOV are also kernel code and subject to all the
same rules as any other kernel code from syzkaller point of view.

But I think the root cause of this bug is the origin of the uninitialized-ness:

Local variable ----buf.i@asix_get_phy_addr created at:
 asix_read_cmd drivers/net/usb/asix_common.c:312 [inline]
 asix_read_phy_addr drivers/net/usb/asix_common.c:295 [inline]
 asix_get_phy_addr+0x4d/0x290 drivers/net/usb/asix_common.c:314
 asix_read_cmd drivers/net/usb/asix_common.c:312 [inline]
 asix_read_phy_addr drivers/net/usb/asix_common.c:295 [inline]
 asix_get_phy_addr+0x4d/0x290 drivers/net/usb/asix_common.c:314
