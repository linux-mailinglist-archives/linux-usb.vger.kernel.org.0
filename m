Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8908275F71
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 20:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgIWSGx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 14:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgIWSGx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 14:06:53 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7BCC0613CE
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2020 11:06:53 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q12so103005plr.12
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2020 11:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0U50uAgCfIsIyGgZiRRqBYXoW2GhAllBZruo/aY5WFM=;
        b=hqmmIkNVwzeJ/d9WhoMypb12fNMPgW0HnOuOfQe/5KRwGxIk4qlhrEn4atriUL9nbP
         UPyPSm2kQWY0WaoTCqCnkBaOLPuYDpTldqMRtdGdYfAfIe7iM/w14Cv5AebxYgHNEjPw
         WsRT5GU0Cbm5EFqsh1w6XC0rmQg1nvrvzQyVJW8e1rcVEC5E9zHf9dxb+1G1uZW+Chki
         W38N6xG2yZsboLJdOjHPrk8h0Vhnow+mzyYgTE0DL39M9wRs7DWZ/Pm9ozAD5Qr9PLJY
         dWKacUGPBFxq8lgsbV3ORcKBS5/YNpUM7PcQRmOtyqeaa0kurTEhpOGealB78KXZsPvi
         S0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0U50uAgCfIsIyGgZiRRqBYXoW2GhAllBZruo/aY5WFM=;
        b=fqENXSkULrtSz4uU8MP95EyHVwzENdrT3pENpxY/n2pKlaGFybhtC7ic6R0JlQ+BJP
         v7e8z5K+9TuxySAaiwJTlCih/YuSAphCHNMGeRDyLCRK6icQonAETYDLlPBvQxYNX7dE
         SuJr1GsW03uby2BnvCRm2Pa05wGEa0JFm0jALURDECojeUxSj1Nes8BPExkTmjQ47F45
         iZG7+OQ05c/GIZTNgmDj4dL9K1YBItwFfOsDg20zX+6djxYxGue3KJZ911JQjMDQvKgm
         OiGxu/yNjB1HyIa71uiodxCWQ+Ww6XsEvTNvj212fklbfFpn94QsTUnRfdstSTII7JN4
         OI6w==
X-Gm-Message-State: AOAM530mTfRFDC2h+qCHhKaWetOtIkOElLV56G7E6rwcTAbJ4CIgpg4C
        xcdvfhUVrHCdkABtZuA82NtvM54+84dQeZ1uvU6DeQ==
X-Google-Smtp-Source: ABdhPJxoFMfB/2usXfwbgow+XwDTUe4WpAloYRoeP+XKqeQifqZivKdGFdcuS/Tb2DS+Jyy/FdZGNcLMrtka+6yBEko=
X-Received: by 2002:a17:90a:81:: with SMTP id a1mr533519pja.136.1600884412563;
 Wed, 23 Sep 2020 11:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com> <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
 <20200922072639.GA1578565@kroah.com> <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
 <f66a9255-80d9-fbed-f99c-3c64ee060146@gmail.com>
In-Reply-To: <f66a9255-80d9-fbed-f99c-3c64ee060146@gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 23 Sep 2020 20:06:41 +0200
Message-ID: <CAAeHK+zwehY9a4ku56wzBUv2sArV5bfZGtKh6FPNz8a-AtQvyg@mail.gmail.com>
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

On Wed, Sep 23, 2020 at 7:42 PM Brooke Basile <brookebasile@gmail.com> wrote:
>
> On 9/22/20 3:38 AM, Dmitry Vyukov wrote:
> > On Tue, Sep 22, 2020 at 9:26 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >>
> >> On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
> >>> On Tue, Sep 22, 2020 at 8:21 AM syzbot
> >>> <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >>>>
> >>>> Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
> >>>>
> >>>> Tested on:
> >>>>
> >>>> commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
> >>>> git tree:       upstream
> >>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
> >>>> dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
> >>>> compiler:       gcc (GCC) 10.1.0-syz 20200507
> >>>>
> >>>> Note: testing is done by a robot and is best-effort only.
> >>>
> >>> Hi Brooke,
> >>>
> >>> As far as I understand, UBS is currently completely broken on upstream
> >>> HEAD, so testing any USB bugs on upstream HEAD will lead to false
> >>> positive results only.
> >>
> >> Broken in what way?  I don't see any bug reports here...
> >
> > I mean this "USB driver ID matching broke":
> > https://groups.google.com/g/syzkaller/c/VKfxh__m05w/m/ArzTtar-AgAJ
> > syzkaller can't test usb, nor reproduce any existing bugs on the upstream tree.
> >
>
> Hi Dmitry,
>
> Thanks for the heads up and for the link to the thread with the information.
>
> I recently fixed the following bug:
> https://syzkaller.appspot.com/bug?id=cabffad18eb74197f84871802fd2c5117b61febf
>
> I tested this on my local syzkaller instance before sending it in to
> syzbot and the kernel panic was resolved, however I did get "-busid- is
> not in match_busid table... skip!" in dmesg-- should this be taken as a
> false positive as well?

Hi Brooke,

Yes, this line means that the kernel is broken and testing USB
programs with syzkaller is impossible.

Thanks!
