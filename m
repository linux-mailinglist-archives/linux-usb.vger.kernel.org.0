Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2CE1C95A2
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 17:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgEGP4t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 11:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727833AbgEGP4s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 11:56:48 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C70C05BD43
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 08:56:48 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 145so3172838pfw.13
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U4KdTZSSvGXdLyAkfFlYS4xTwZLtxpXNVHHZanbHyrY=;
        b=VXiRhE0ZcVgChEV9YLMBI5LqSPSuLL1x2VWIR2XrBzhuIXs92GT6nF89oGnDidQr2k
         ZZuX1iQoEvkyz8/0EwEHoFC6huy7liXpn8lH6FVcwOJH+X3FaMgkBxnagukyHQk/Jrhm
         tC5XSiiOJkEfRZj8S4Yl0Jei0QJD9BdJi4MLs+glW54pKxJcXmGm/v6iIZqCZlgcg3jZ
         eRsbXx0FTK3WbXtdM1CRzjFIhuZRh/FvWcHOFrOcc53X2yNkgBhymOCEch9hqjv0ilB8
         xs654zg70AZwXpe/Soo05ZZpRejd2WtXcs4DT9KbyFVKHpOyLUJaS6I13roBZAKLaWYm
         Y57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U4KdTZSSvGXdLyAkfFlYS4xTwZLtxpXNVHHZanbHyrY=;
        b=eaIhcQqGDithFxO5Mbj8UcZbikIRH5dhvUFnnxGAgMrotWQ4tGm9M0s8Fb3YwUgp5i
         PAKq+d/554qBmuvt9xnFu7sqIkIRLa855sx9ZQTALBgFe8SJSVmG7+wDH3p0lP+WMPd2
         1YNHHbjabhaYBAspihay11megBub89dncvHLop8GcJgF1r614rqZ2o5wBQqCeKJN4ofG
         VAPkQmD58qxU17JjhpZI2uzuxLBVIzl1jBYiiVHqy6OY1T5APXrTudAQaK/6ZhNI3lxi
         E4lj4vJp6ki9NKfRObcYOFMdfafHzSJ9i/NJCHY55drZLQn+yNdA3p5s9tJwq9reYFIZ
         Pxmg==
X-Gm-Message-State: AGi0PuaXUQUzTZiNjfip/2sQKY2E6tvyPKigJUXt+zOSU4WkYrtUnbjc
        u855N4FK7kHjTr1+cQ3dU8yYRoW7FH/yUc7Wb37M7A==
X-Google-Smtp-Source: APiQypJXfH5bI+tvmiffFZMkHf3nRrhvoPtzJlA9tQAqPW3jf4NFtRe9tJWNZy67Juc6WFnNJzGovoEzqIT6DJNcl7M=
X-Received: by 2002:a62:4e87:: with SMTP id c129mr14304792pfb.178.1588867007770;
 Thu, 07 May 2020 08:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000039420505a14e4951@google.com> <1588755226.13662.17.camel@suse.com>
 <CAAeHK+zOdghTAu647iKBEU+0LqkYYOk0f7gPk_4T6BjNi=2sAQ@mail.gmail.com>
In-Reply-To: <CAAeHK+zOdghTAu647iKBEU+0LqkYYOk0f7gPk_4T6BjNi=2sAQ@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 7 May 2020 17:56:36 +0200
Message-ID: <CAAeHK+xu_0BrnM5SKo5zNFvwunMDQWa+foD-y7MpnqjkP8tcbg@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hfa384x_usbin_callback
To:     Oliver Neukum <oneukum@suse.com>,
        Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+7d42d68643a35f71ac8a@syzkaller.appspotmail.com>,
        devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, nishkadg.linux@gmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 6, 2020 at 1:50 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Wed, May 6, 2020 at 10:54 AM Oliver Neukum <oneukum@suse.com> wrote:
> >
> > Am Freitag, den 20.03.2020, 12:28 -0700 schrieb syzbot:
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    e17994d1 usb: core: kcov: collect coverage from usb comple..
> > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=11d74573e00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=5d64370c438bc60
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=7d42d68643a35f71ac8a
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15fa561de00000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15d74573e00000
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+7d42d68643a35f71ac8a@syzkaller.appspotmail.com
> > >
> >
> > Hi,
> >
> > is this bug still active and can a test be run on it? I requested one
> > yesterday. If my analysis is correct this bug has security
> > implications, so it is kind of important.
>
> I see your request in the queue and it's been registered and
> completed, but for some reason syzbot didn't send an email with a
> response.
>
> Let me try this once again:
>
> #syz test: https://github.com/google/kasan.git e17994d1

Still no response. Dmitry, any idea what could be wrong here?
