Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F57A1CA85F
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2020 12:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgEHKbv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 06:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgEHKbu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 May 2020 06:31:50 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8155CC05BD43
        for <linux-usb@vger.kernel.org>; Fri,  8 May 2020 03:31:49 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id ck5so472359qvb.11
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2020 03:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6dP2jMNPQsZdSAJhJ6MDPMx67KqvxJzY9GhFnqIx2nk=;
        b=WuRIha2t1hu4+kgAAoqf3PUAcQc3HLs+6zHxn/yQx9XfnH3LnCFYcXQrrEtCr4feW0
         kM4RNwVd4nUM9EN+JrXXt1fvKwvYvwEsKIgwl03fnCRCSs2xvipL+4l66S8Ar3keanbD
         wxZ9j+G3ne5lMz7OoYKtrKo/G3TkWGS6VjTaEFD5hrSAz5/A4iEZl35sevFCejUZXLsC
         6LjHv42X6ecIWCtNPbHYvFMaa+k1Gsks+Zvxxg/H1UvtJff+Lf42vzJ41k4vpenhqZvb
         Rh8xKckgbcJ42LYaQQkrBpQR5ZJ+i7+GXauVc0karlxHJ97oADlWVYaAHt/1bSf0eufi
         umtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6dP2jMNPQsZdSAJhJ6MDPMx67KqvxJzY9GhFnqIx2nk=;
        b=b/q3DUGdQM5kWV54ZyV+hqKUXBHAQujvXBo8JbJWbHJNHUD1AtJsRsDEelHMnGWwhp
         wubGlKIxxVcmVPhWMQAqNYQnD0i8PsIprHxNS02uBiDc7I5LK3Z8uOH4HX2Q8N90IoFO
         dNAm9iPrtC55smAX33NsEHLfPYSq1jqnfugBgoLFyiGeqMhPZTttyqO29y3TFEZaLO1+
         OMmvlqi2fAwbUAaZT0U3jyIqMkY9+DGbCRgQ4t+79fb3scnIuFDktOvoC9NO3tXzOV74
         DF0gz4dZqGTJjYSJIOnV84vJjsoWGGcCwvXB+5dXJbYex5ykARqA81aSykyv2IMLGBqR
         uzpA==
X-Gm-Message-State: AGi0PubKFTiJ4C1SE0uRIHLbtLqzIipD5BGlNGphkGF+6Kk+PMh9jYPs
        9NX5shi15s77KHyPKPz/zFYRFR4dJRQKtdWXcv/bOw==
X-Google-Smtp-Source: APiQypKOgDuOO4vCj2tNv2s9EWuO43oANYIdLrScZ0FTT+tx9u4QGE8t7AZV8n18iyH3LONxHESCfTe4GoJhvgiwheM=
X-Received: by 2002:ad4:53a2:: with SMTP id j2mr2124620qvv.159.1588933908444;
 Fri, 08 May 2020 03:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000039420505a14e4951@google.com> <1588755226.13662.17.camel@suse.com>
 <CAAeHK+zOdghTAu647iKBEU+0LqkYYOk0f7gPk_4T6BjNi=2sAQ@mail.gmail.com>
 <CAAeHK+xu_0BrnM5SKo5zNFvwunMDQWa+foD-y7MpnqjkP8tcbg@mail.gmail.com> <CACT4Y+b3q4C-1+L6Sa3fgOYEa3+XGuzfrfauaH_v9KXS7xH9Yw@mail.gmail.com>
In-Reply-To: <CACT4Y+b3q4C-1+L6Sa3fgOYEa3+XGuzfrfauaH_v9KXS7xH9Yw@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 8 May 2020 12:31:37 +0200
Message-ID: <CACT4Y+YBz0uAqYw0_-1eRsuUgHvPgpwrf2RGyHJwsyAUGbBd5g@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hfa384x_usbin_callback
To:     Andrey Konovalov <andreyknvl@google.com>,
        syzkaller <syzkaller@googlegroups.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        syzbot <syzbot+7d42d68643a35f71ac8a@syzkaller.appspotmail.com>,
        "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, nishkadg.linux@gmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 8, 2020 at 11:33 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Thu, May 7, 2020 at 5:56 PM 'Andrey Konovalov' via syzkaller-bugs
> <syzkaller-bugs@googlegroups.com> wrote:
> >
> > On Wed, May 6, 2020 at 1:50 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > >
> > > On Wed, May 6, 2020 at 10:54 AM Oliver Neukum <oneukum@suse.com> wrote:
> > > >
> > > > Am Freitag, den 20.03.2020, 12:28 -0700 schrieb syzbot:
> > > > > Hello,
> > > > >
> > > > > syzbot found the following crash on:
> > > > >
> > > > > HEAD commit:    e17994d1 usb: core: kcov: collect coverage from usb comple..
> > > > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=11d74573e00000
> > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=5d64370c438bc60
> > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=7d42d68643a35f71ac8a
> > > > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15fa561de00000
> > > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15d74573e00000
> > > > >
> > > > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > > > Reported-by: syzbot+7d42d68643a35f71ac8a@syzkaller.appspotmail.com
> > > > >
> > > >
> > > > Hi,
> > > >
> > > > is this bug still active and can a test be run on it? I requested one
> > > > yesterday. If my analysis is correct this bug has security
> > > > implications, so it is kind of important.
> > >
> > > I see your request in the queue and it's been registered and
> > > completed, but for some reason syzbot didn't send an email with a
> > > response.
> > >
> > > Let me try this once again:
> > >
> > > #syz test: https://github.com/google/kasan.git e17994d1
> >
> > Still no response. Dmitry, any idea what could be wrong here?
>
> I suspect it has something to do with the fact that the bug is already
> fixed (has a fixing commit).
>
> ...right, it was broken by:
> https://github.com/google/syzkaller/commit/f8368f999a1964df6d39a225cd3f5ab3942dd755
> and we lack a test for this scenario. It was supposed to only disable
> mailing of bisection jobs.

Fixed in https://github.com/google/syzkaller/commit/2b98fdbcbcac6e99d12c88857406ef446bcac872
and added a test to fix this behavior for future.
Thanks for the report.
