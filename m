Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E10F361A6F
	for <lists+linux-usb@lfdr.de>; Fri, 16 Apr 2021 09:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239121AbhDPHVu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Apr 2021 03:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238736AbhDPHVt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Apr 2021 03:21:49 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F78C061756
        for <linux-usb@vger.kernel.org>; Fri, 16 Apr 2021 00:21:25 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id i9so12806775qvo.3
        for <linux-usb@vger.kernel.org>; Fri, 16 Apr 2021 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wjmD73GPpy2QbsTxbpbJAucxJYCt7dBmfHIx/C3Hj5U=;
        b=nu9OwTXrpMDNPvqq2iAKRq4pBy+2naRJYAi61Oux7KKTpTV2uDlMOELJRZe/KW0Z/l
         Z+6XaCmV9b2o9Jc3tpiK+RPxHLVZMYnun6G1e84agmCOQYYhmaNqZI6pX4+WR5MC3sCV
         7/OEra7nrNmsZGborSeXxxr+uGqVI3QrQFpRmoHfhwvD/Xxi7ZsxP2TnIudtTvWCB7Q5
         axzqI1g1A7zuQgAhk3ENd88sCzhnWukzNCc7ROW9RTQwJ3H4mcmCsNBDicoBaDvwAyNy
         wXiszwJWU9UvkztZu7mB8gu7CVYnQWOOr7p5cdgvgYmZ7ERtxtr6tXD7BJDyg6Amo9/E
         nifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wjmD73GPpy2QbsTxbpbJAucxJYCt7dBmfHIx/C3Hj5U=;
        b=VmTqLmx+irbLaEAs4EYR9AxJyayW+kXMBTHStClZIBWqVOgsfCx+vDOQA9J2tzjFB7
         AObs5JSZ9G6msDvwGF40Iu6TzNs+LeglF4g2SjKidj1xjFKirmRRvbRWb2VuKKvQwawU
         96DHz8N5SazbjS7O4ngmAL3Du9685HCgojel+Zzas3NdqApxh616ontrc6C2/7dLlkUK
         4Bzo67Mdg6VxdEL50DBfAIujBF+DPakiedl36zqBFpoCOPGoT67P4OL/W/Ye4D/lv+Dv
         qTKtO978rdsVdOtC0hJ3CLTOqVittLpcx5A3CF3LpGqaeqGdXcRFz20QnYRHf6Tq7EFE
         b2Wg==
X-Gm-Message-State: AOAM532g9/FHoegcUBYlAttEt6BdgCiBBfoiCNciPbwlmRJS46NX7ucx
        UCW0m7TYdcU1/ei4B3axZ8qdOLycwf8ZAswDbgfOeA==
X-Google-Smtp-Source: ABdhPJw3kEHh/UQ6eNJ/oZf4yxIHMjsXukXccmBLxb3LC8DY+slR11/4BD4jxSF26gGaypErVDi6pHqHlV2Y+52cwo4=
X-Received: by 2002:a0c:d786:: with SMTP id z6mr6484078qvi.18.1618557684261;
 Fri, 16 Apr 2021 00:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000075c58405bfd6228c@google.com> <CACT4Y+bTjQz=RBXVNrVMQ9xPz5CzGNBE854fsb0ukS-2_wdi3Q@mail.gmail.com>
 <20210413161311.GC1454681@rowland.harvard.edu> <CACT4Y+YEw4iJPxY4b6LPXrU91TODfu09dG=53exvQkwjPBg23w@mail.gmail.com>
 <20210413165724.GD1454681@rowland.harvard.edu> <CACT4Y+aX-cMJxMYmWms3MG-4=Rb9eG_N+pOjorRHoV1MGQXtkA@mail.gmail.com>
 <20210415205957.GA19917@rowland.harvard.edu>
In-Reply-To: <20210415205957.GA19917@rowland.harvard.edu>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 16 Apr 2021 09:21:12 +0200
Message-ID: <CACT4Y+aYfVxcXYOHwheW7Wp2oYcKm_zumeASo57Dy7deDfZJKA@mail.gmail.com>
Subject: Re: [syzbot] general protection fault in gadget_setup
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+eb4674092e6cc8d9e0bd@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 15, 2021 at 10:59 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, Apr 13, 2021 at 07:11:11PM +0200, Dmitry Vyukov wrote:
> > On Tue, Apr 13, 2021 at 6:57 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Tue, Apr 13, 2021 at 06:47:47PM +0200, Dmitry Vyukov wrote:
> > > > On Tue, Apr 13, 2021 at 6:13 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > > Hopefully this patch will make the race a lot more likely to occur.  Is
> > > > > there any way to tell syzkaller to test it, despite the fact that
> > > > > syzkaller doesn't think it has a reproducer for this issue?
> > > >
> > > > If there is no reproducer the only way syzbot can test it is if it's
> > > > in linux-next under CONFIG_DEBUG_AID_FOR_SYZBOT:
> > > > http://bit.do/syzbot#no-custom-patches
> > >
> > > There _is_ a theoretical reproducer: the test that provoked syzkaller's
> > > original bug report.  But syzkaller doesn't realize that it is (or may
> > > be) a reproducer.
> > >
> > > It ought to be possible to ask syzkaller to run a particular test that
> > > it has done before, with a patch applied -- and without having to add
> > > anything to linux-next.
> >
> > Yes, this is possible:
> > http://bit.do/syzbot#syzkaller-reproducers
>
> That's not really what I had in mind.  I don't want to spend the time
> and effort installing syskaller on my own system; I want to tell syzbot
> to run a particular syzkaller program (the one that originally led to
> this bug report) on a patched kernel.
>
> The syzbot instructions say that it can test bugs with reproducers.  The
> problem here is that there doesn't seem to be any way to tell it to use
> a particular syzkaller program as a reproducer.

Hi Alan,

This makes sense and I've found an existing feature request:
https://github.com/google/syzkaller/issues/1611
I've added a reference to this thread there.
