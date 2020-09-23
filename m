Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8B5275FE0
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 20:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgIWSc1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 14:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgIWSc1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 14:32:27 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82ADCC0613CE
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2020 11:32:27 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u24so246692pgi.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2020 11:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3dW5iJGyenAT8LbifkLRxPjPziRf60aygTMYbhkN1qo=;
        b=lN7k072L7PwhaHtz3pivg61aa0aNlzxh89ezq6Jn7hwXbMLDydbfYGjXLBCehMo+ni
         JRd1gJUQgKvCrBQEHTLl7UGCRL8J+9AVzqaazZciuQLUxtZNdJWN8wNcRtkikjaqQOAk
         bqz4CTEq1mcF0uDS7LL63uYyaMkl8HGSWZGqwezVLy7CS0teeLbgW58GvqtpA0StkUFV
         7fzO7VARQFI9grM5aY3hBsNBZkxxyvCaqDUTTUSxXTgeZc8nVCsy8G5yO27zx7pKKnB+
         239oPW2yHeq1cFs4+H6YwHSAaYTuXx9uYBm4QP8Mpzghd/XOdSSScPRRZQXeBnoONWbe
         EeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3dW5iJGyenAT8LbifkLRxPjPziRf60aygTMYbhkN1qo=;
        b=HeWNsy3MZjsl4wv2OZCam022nUbXPzw2yq76gpxZhmNPjVzwP/hfNbkhUjwUjZ5FQN
         Ke3OgQPJJ8M0kW5cTgezewjWrX9xdE/zCvBbm351nozZAnO48q9KJlHEQ0hwx8BStVDo
         aK/bvpMPooO95TP1GBsDkMU2hjKq1ssRf7/Ib8H5YZVGIaLPhm6ghmlnSQeIMh8LSQDM
         K/HaEn1T9YUjMV3pFlR/Tq0SyA+ENG/jHF/934hL1VKrj0AFxXKqzexm+HZuntjc/OEz
         gJK3g07G0FM39jDvw9AdLj2ayQALP3uDk3Mo857ycP60gWQ18l49LDK4k4Uow7/9LXFq
         CIHw==
X-Gm-Message-State: AOAM531W+ghpSrb6844qS5mC6E4BcKi3ztrVysuEkQb5l8qvjOVsizC8
        IRTolFTJf+ojg3Y/GU/Galtx0Fwu9Jjk8RsQovLgOw==
X-Google-Smtp-Source: ABdhPJzmFUliet4TASFFX0KaY/ohZQwTR/4/oMyKhnW5tzJlUCEbPAj9aXkJxCmTrqlS5FD1U/6ZHBMKNsqhE09rGbc=
X-Received: by 2002:a63:2209:: with SMTP id i9mr909164pgi.130.1600885946905;
 Wed, 23 Sep 2020 11:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com> <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
 <20200922072639.GA1578565@kroah.com> <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
 <f66a9255-80d9-fbed-f99c-3c64ee060146@gmail.com> <CAAeHK+zwehY9a4ku56wzBUv2sArV5bfZGtKh6FPNz8a-AtQvyg@mail.gmail.com>
 <8f8706c4-090d-20fe-a4c9-40d99d3a0e1c@gmail.com>
In-Reply-To: <8f8706c4-090d-20fe-a4c9-40d99d3a0e1c@gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 23 Sep 2020 20:32:15 +0200
Message-ID: <CAAeHK+zboT311GNtX0N=Yp_Qph1Gn0XRTJb35HK540GKnOe8LA@mail.gmail.com>
Subject: Re: INFO: trying to register non-static key in ath9k_htc_rxep
To:     Brooke Basile <brookebasile@gmail.com>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzbot <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 23, 2020 at 8:28 PM Brooke Basile <brookebasile@gmail.com> wrote:
>
> On 9/23/20 2:06 PM, Andrey Konovalov wrote:
> > On Wed, Sep 23, 2020 at 7:42 PM Brooke Basile <brookebasile@gmail.com> wrote:
> >>
> >> On 9/22/20 3:38 AM, Dmitry Vyukov wrote:
> >>> On Tue, Sep 22, 2020 at 9:26 AM Greg Kroah-Hartman
> >>> <gregkh@linuxfoundation.org> wrote:
> >>>>
> >>>> On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
> >>>>> On Tue, Sep 22, 2020 at 8:21 AM syzbot
> >>>>> <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
> >>>>>>
> >>>>>> Hello,
> >>>>>>
> >>>>>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >>>>>>
> >>>>>> Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
> >>>>>>
> >>>>>> Tested on:
> >>>>>>
> >>>>>> commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
> >>>>>> git tree:       upstream
> >>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
> >>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
> >>>>>> compiler:       gcc (GCC) 10.1.0-syz 20200507
> >>>>>>
> >>>>>> Note: testing is done by a robot and is best-effort only.
> >>>>>
> >>>>> Hi Brooke,
> >>>>>
> >>>>> As far as I understand, UBS is currently completely broken on upstream
> >>>>> HEAD, so testing any USB bugs on upstream HEAD will lead to false
> >>>>> positive results only.
> >>>>
> >>>> Broken in what way?  I don't see any bug reports here...
> >>>
> >>> I mean this "USB driver ID matching broke":
> >>> https://groups.google.com/g/syzkaller/c/VKfxh__m05w/m/ArzTtar-AgAJ
> >>> syzkaller can't test usb, nor reproduce any existing bugs on the upstream tree.
> >>>
> >>
> >> Hi Dmitry,
> >>
> >> Thanks for the heads up and for the link to the thread with the information.
> >>
> >> I recently fixed the following bug:
> >> https://syzkaller.appspot.com/bug?id=cabffad18eb74197f84871802fd2c5117b61febf
> >>
> >> I tested this on my local syzkaller instance before sending it in to
> >> syzbot and the kernel panic was resolved, however I did get "-busid- is
> >> not in match_busid table... skip!" in dmesg-- should this be taken as a
> >> false positive as well?
> >
> > Hi Brooke,
> >
> > Yes, this line means that the kernel is broken and testing USB
> > programs with syzkaller is impossible.
> >
> > Thanks!
> >
> Gotcha, I'll hold off on working on USB bugs for now then.
>
> The above patch has already been applied to the ath-next tree:
>         https://patchwork.kernel.org/patch/11769845/
>
> Should I have the patch reverted or is it safe to assume that any
> regressions will be caught in the -next tree?

If you believe the patch fixes the issue, then it makes sense to keep
it. If it actually doesn't, syzbot will report the bug again once the
patch is in the mainline.

Thanks!
