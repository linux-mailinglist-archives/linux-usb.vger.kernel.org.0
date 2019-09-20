Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0EF5B94CD
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 18:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729304AbfITQCD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 12:02:03 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34869 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbfITQCD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 12:02:03 -0400
Received: by mail-pf1-f195.google.com with SMTP id 205so4827396pfw.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 09:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6+YyKQua4fqTZkpIWd0bVw1nHXY16Gz7L9AacObwXjo=;
        b=qGfBcWvy5grf3UCx1/w/1xnq2HANUqfq7X+egW6ZmCkH4RXEShVW46xF0xNcgrs1g0
         dAZQBOzV3gHSQS3l63ku98vKJNDL8r6kIIQJGOnxhJnR/OGD+HZcMaWHS/mCBrgfv2oq
         mWUnw5bJoBuDOS0YvyvbR6tccOb2NeXoYPbDcdgqMhAXiBa03JAKanulHWbNLbryj5es
         VGAQ0/VBb/3lJGT/FFp61t5tCPz9EHG7TFLcBW0RhQKpzoqyuhtUSrJd3OJmt4lD7OEj
         PFQYW2z/Eifz1sHByaXGckDsG5JIzF8gEMMq+zwj9odqDoIzI3Z+epfsXXToAC3bAqu+
         ljcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6+YyKQua4fqTZkpIWd0bVw1nHXY16Gz7L9AacObwXjo=;
        b=sx/imfrmVT2DjKoM69bCBn8Y+mU9ErrFbBcAnCJh8BNAN/k32Tz4IMWSVqCxFT6Avu
         +hE2aLyuUBEKT0wfcq6jHt0KD5fM6DGc/RZCeJcniB68vwngmCaaaboPqh3Slj898rGc
         dL0Kje/s0/TYiNNIITh2t/bEyP1m1Ut4KD7cUxkAOyQqETYfxTyniQm5hFlhLhvdAeOO
         rtzQjZrzk4kU2LQ3EbDzhkvx96Mnc8wYq+pxuegLL+9IcF0tp4kD/AArCGQdBo81W0o6
         AG6ruJhLiCszGdFdABcAC/hLcv42NI00tTqMxkYzliNcePVovNyPMOQtmxIyXZtFvjMG
         FynA==
X-Gm-Message-State: APjAAAXWbFHpalIWm8NFNCnwhcVei3AIEOUCRV55CvFgCK3jeziwonmc
        8j6NLbkyusN47KUXhhvlKUipasHxfDD7astumx4TYsI8sytcig==
X-Google-Smtp-Source: APXvYqw0gFXtTXiIb5CkyEPb4SrzK51XIoT8YPylm3xd0XxlxUWWLE4VSzU8DqxYNdMw6+E36mtwh/hMwDdAesuUZFI=
X-Received: by 2002:a17:90a:ff18:: with SMTP id ce24mr5446973pjb.123.1568995322671;
 Fri, 20 Sep 2019 09:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <1564472907.25582.16.camel@suse.com> <00000000000081a9c1058ee1d06a@google.com>
In-Reply-To: <00000000000081a9c1058ee1d06a@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 20 Sep 2019 18:01:51 +0200
Message-ID: <CAAeHK+w0vKt94g-h+NOqW-GJKyqikbAfU4sTBeKeJS-sUkZ69g@mail.gmail.com>
Subject: Re: general protection fault in flexcop_usb_probe
To:     syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>
Cc:     linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 30, 2019 at 10:30 AM syzbot
<syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         9a33b369 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=1226c2d8600000
>
> Note: testing is done by a robot and is best-effort only.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/00000000000081a9c1058ee1d06a%40google.com.

Hi Oliver,

I was wondering if you've submitted this patch anywhere? The bug is
still happening.

https://syzkaller.appspot.com/bug?id=c0203bd72037d07493f4b7562411e4f5f4553a8f

Thanks!
