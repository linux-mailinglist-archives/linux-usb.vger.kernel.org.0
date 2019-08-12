Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B53EF89D7F
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 14:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbfHLMEK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 08:04:10 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37722 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfHLMEJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 08:04:09 -0400
Received: by mail-pl1-f195.google.com with SMTP id bj8so765182plb.4
        for <linux-usb@vger.kernel.org>; Mon, 12 Aug 2019 05:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FIFevxOQtejENIKXPw7Is4Q/QJpdaof9XvfR5if/hlM=;
        b=ZbQ2S5ywhnWZ9VGkBs5RSNIxxulgtRILYMiJXBeaSZSdFMfiq2nW9MFU0nAfRgYk3l
         x4UwOBmE/VoMnZr+z4Rwj1uIbLi+Akbcv/GnJdOoxvofvG8oWIJq2pOzfHViIP7txhud
         6oKvWyqoeT6u+Ig3IXYnAG0zER9ge5R96HRrswYJyltCh8VWPCdGNvFtcYmoNfj7p3/G
         Sot3TFKWLL1lbbjCvojO1527uzVTbRQjhtaH4JGlU8/BSMVQAaPzlNmdawHBerPgczyF
         si5qYNwMRgWdbME3mEtR4EEkXbbMGGhEBLY7FLP/PU8C432j2ykiB6LkIZgeC3aooQG+
         XFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FIFevxOQtejENIKXPw7Is4Q/QJpdaof9XvfR5if/hlM=;
        b=X9z8KCXH+ykAs/WGov0eUV+hXodIzbnQJXjPwJtb5RDtcLlvc02x/bGC8GxOx0CSsO
         Dr3viIGrRg6/y9q6BW89/2Su1A4aSK9YTrJ9p4xxsiQwliERdhCmYSkmPj8/idoIlYVo
         +NabtV659SFmNno5cyL4FYeZmxJxIj9ld6Pj34hFFqMA3DmCbMDHA5B76IaNQL5YTvPq
         kM75y+aGBQaMR1c4+anDM4gbsSP0SJ88lmTEirbRquJh3g0Okx8JG/0BJSqUSlmDyxgB
         3qLVWwOWQQoIewKHTO93Qicp0lYb7OfHp7aNuZmh7pVB7/E2D08HrlXOemEqWXW+ZVT/
         ogwQ==
X-Gm-Message-State: APjAAAXZlr4BTFBEgjewkVkeVaRP70Q/s3S2PsmEghCEQmf5SCjjmou4
        WLKH5jmJMwYgBBYFQDd0luAU173FJ4Q2QazTQwxEVg==
X-Google-Smtp-Source: APXvYqwbQ5EK3raAtGV2QgalD22x83zsfNv7FwCakquHaWGun3+qLY7nAY6Govoxf/EQzc3zZik3ZAzgehe7BEW0Pfw=
X-Received: by 2002:a17:902:8649:: with SMTP id y9mr5338163plt.252.1565611448967;
 Mon, 12 Aug 2019 05:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000007e2e84058fb46c49@google.com> <Pine.LNX.4.44L0.1908091646230.1630-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908091646230.1630-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 12 Aug 2019 14:03:57 +0200
Message-ID: <CAAeHK+ztV==ojaqueEzM4O5Bq_qdxVKhg8stvgT-VdMEs8GBtw@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usb_kill_urb
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+22ae4e3b9fcc8a5c153a@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 9, 2019 at 10:52 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 9 Aug 2019, syzbot wrote:
>
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger
> > crash:
> >
> > Reported-and-tested-by:
> > syzbot+22ae4e3b9fcc8a5c153a@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=173f2d2c600000
> >
> > Note: testing is done by a robot and is best-effort only.
>
> This shows that this bug is a duplicate of extid=30cf45ebfe0b0c4847a1.

Let's mark it as one:

#syz dup: KASAN: use-after-free Read in ld_usb_release

I'll also mark all bugs that involve ldusb as duplicates, as they all
likely are.

> This fact is also visible in the console logs; both have lines saying
> something like:
>
> [  549.416341][   T22] sysfs: cannot create duplicate filename '/class/usbmisc/ldusb0'
>
> and
>
> [  549.958755][   T22] ldusb 1-1:0.28: Not able to get a minor for this device.
>
> preceding the invalid access.
>
> Alan Stern
>
