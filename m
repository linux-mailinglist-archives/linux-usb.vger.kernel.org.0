Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D42F69805E
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 18:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbfHUQkD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 12:40:03 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40925 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbfHUQkD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 12:40:03 -0400
Received: by mail-pf1-f195.google.com with SMTP id w16so1777917pfn.7
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VUVIcvKRAxchzzIboABzY4R0ISYxco2N8kvTRtaX2No=;
        b=qNUYZ3ayTlf/+efR18tsC2cdgYlaL+V64+bHpwBKeAOvUI02sHoSgR9WQ8Ndc6QwuZ
         qX7mv+wHlSrKxF8S48uzMfYMzp+1x5EtPKNuSZFj2GaEwfDZ9ILYpf8PaUwlxinG6vEC
         n+TEXB6jCJPemwoDI+JzRsitP8jtHNO0JACKuMZ9gyHRadCl4kqtPhau02Jx96LDLsW0
         aT6gDNIPoQ4asedEhowXd03uvdJVk9ycdLTekzxhbRamYUgSH27n8D6psoMw/96X8toL
         VgUWELVs8RBmBu0SlA7rqY0ZOdljucwYL0q2/E838xRQ1UvdR1JpgcMIas1wDj3AmoD6
         0UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VUVIcvKRAxchzzIboABzY4R0ISYxco2N8kvTRtaX2No=;
        b=TLMVn3H9kEA8xK2h605yCRbw//4aLwgcGVh7rDLpIOmqcNnhQ0S+IBlqQrqcgsR8lg
         Ng7A7X/vCMPCbFvgGA6Ixi4SvcUMuw+mxyEZqh+3wQiCL7o8LinBOk5AmOwdiUOLb7bn
         zTCFALFNH5Y3ENMenGrysoy9Q8dPQZqFZsJFkHmjww35tb9Umln4wHLtn0+cR3h+eit8
         gInRFzX046wTd+uXY+SyffplK4n+SqNlWeodMg15X6H9c5ICezZUXOVNfQ319G7LfjaQ
         tYnXGBVyVSYDr+ZVru0g8AdRTQ+WzuDZLJME1FS+0yLYILk2ZBt8LneBbBRBJugmgKC+
         LWKg==
X-Gm-Message-State: APjAAAV6s8uajvuU2R7zK1widCpFY2aQzbVAkGOXKF4IIjM70P7hY9i0
        zpCeOyob6V9rhhAHMLBJ6d0ZzclcwS6kHcgssaPw9A==
X-Google-Smtp-Source: APXvYqxObByY71HuxPnyU08sUAGGvZX2iThJJB5iiD03WIZb1eORrogkr5nLL2kPV/CD4qzWueFyCPez88tPXcYIJ6E=
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr29817121pgq.130.1566405602118;
 Wed, 21 Aug 2019 09:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.1908211218550.1816-100000@iolanthe.rowland.org> <00000000000040fec90590a33230@google.com>
In-Reply-To: <00000000000040fec90590a33230@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 21 Aug 2019 18:39:50 +0200
Message-ID: <CAAeHK+xhxhdJecq=HMLbZySTxzT_JTvMWdXojTnCdJ+OU2w4Ew@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in hidraw_ioctl
To:     syzbot <syzbot+ded1794a717e3b235226@syzkaller.appspotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 21, 2019 at 6:38 PM syzbot
<syzbot+ded1794a717e3b235226@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+ded1794a717e3b235226@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=126b9da6600000
>
> Note: testing is done by a robot and is best-effort only.

Let's dup this bug into the other one:

#syz dup: KASAN: slab-out-of-bounds Read in hidraw_ioctl
