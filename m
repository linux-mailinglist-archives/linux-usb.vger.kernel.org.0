Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF4B41CDBC
	for <lists+linux-usb@lfdr.de>; Wed, 29 Sep 2021 23:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344914AbhI2VG1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Sep 2021 17:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237372AbhI2VGY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Sep 2021 17:06:24 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEDBC06161C
        for <linux-usb@vger.kernel.org>; Wed, 29 Sep 2021 14:04:41 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id me3-20020a17090b17c300b0019f44d2e401so936683pjb.5
        for <linux-usb@vger.kernel.org>; Wed, 29 Sep 2021 14:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FurABvQrnW7SVwUVRUJVf5Azv+RVGAv+gR3wBDsauaI=;
        b=rpuh4Cn9psRPurHAZOwfwzZdIMhLn3EI2hZI6OkxWUQ9wr7PoYy17LA/S2hdC0molh
         x7naFVL8ORxyHvk6XU8Urpy4rEKfbkzmh/bHAXpJKlxN4aNQc9RA3Qz8rhTFdCkXHK11
         6nHk0J9aEvF0lxamc/+wIh6SCR984r4cRANMeCx8ff/uH+27rSh6w7khjk1zI0WTGwvG
         eGJMmselLZ/VfaB1jkfuvALphegy0dJH9YWLozgw9tnU+rXQwegYkIkgiBnPsyPIYdbf
         Qyw7am/MQOgdU7U/vre/ki6YRt0cJ8Lp5QBk+d21tZ0+8atwOc3EPdtZNcc3cJBo1pkr
         m1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FurABvQrnW7SVwUVRUJVf5Azv+RVGAv+gR3wBDsauaI=;
        b=uG9z8WT5F/lnVAxWkntcMqdlTKukOzOSr3Gl+N2IrxYPy3darIzarZoyCrEPT+fo/x
         ob37QW7U43vWk5tDRZLxCijeEIZj7mXPXkTnKANHzzTeiXHFpgmGUKI5eY2d7NC90x0V
         zzg5pfwgPhEiQuXCmCQdLRGXG3snkc9K98DIVr9zRhUE/eRxHZJw2+TCkjwmH4nMn+sI
         DmY0QtjfpoSKvX/+orRp2AbE2uLVZ3biiyTi4g8Hg1DrjgT/01E42Pm3FpaaUaQ1OrbO
         wPmrvZLXq2RQtU1D8gOQA27Ztj0aZzhC1DpY0vyNqDAApAeDU6KNvmi1uuK/dg2JhSlm
         TcQg==
X-Gm-Message-State: AOAM533WW+IpX4aj97j6Y+154kE/9KZhJnTnDRhwi+v2Ysvaaf3NmoQw
        hxC/g0xwFzZoyUEHDwgWuzuzucqwrBKD3uFKKdwdeQ==
X-Google-Smtp-Source: ABdhPJzOhQy/gGu8lMtKb8M0sjvDqwDEJ/je0DS9bogbfQiprbFdAgdaZ7mgV7duq5hHM60hS4aDncf0veJTFvsVTxc=
X-Received: by 2002:a17:90b:3108:: with SMTP id gc8mr8437024pjb.63.1632949481073;
 Wed, 29 Sep 2021 14:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061104.2680133-1-brendanhiggins@google.com>
 <20210917061104.2680133-7-brendanhiggins@google.com> <CAK8P3a21j9yJe_X=kU6v2YgOnrhunRbPv+O6STSH71qTb7xnfg@mail.gmail.com>
In-Reply-To: <CAK8P3a21j9yJe_X=kU6v2YgOnrhunRbPv+O6STSH71qTb7xnfg@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 29 Sep 2021 14:04:30 -0700
Message-ID: <CAFd5g46KzHbm_mneJPJ00Dk2mi-rrs2bX1tWix8pX7uL0=TibA@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] bitfield: build kunit tests without structleak plugin
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Shuah Khan <shuah@kernel.org>, David Gow <davidgow@google.com>,
        Kees Cook <keescook@chromium.org>,
        Rafael Wysocki <rafael@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Ulf Hansson <ulf.hansson@linaro.org>, andreas.noever@gmail.com,
        michael.jamet@intel.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        yehezkelshb@gmail.com, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        gregkh <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 17, 2021 at 12:22 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Sep 17, 2021 at 8:11 AM Brendan Higgins
> <brendanhiggins@google.com> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The structleak plugin causes the stack frame size to grow immensely:
> >
> > lib/bitfield_kunit.c: In function 'test_bitfields_constants':
> > lib/bitfield_kunit.c:93:1: error: the frame size of 7440 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
> >
> > Turn it off in this file.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> >  lib/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/Makefile b/lib/Makefile
> > index 5efd1b435a37c..c93c4b59af969 100644
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@ -351,7 +351,7 @@ obj-$(CONFIG_OBJAGG) += objagg.o
> >  obj-$(CONFIG_PLDMFW) += pldmfw/
> >
> >  # KUnit tests
> > -CFLAGS_bitfield_kunit.o := $(call cc-option,-Wframe-larger-than=10240)
> > +CFLAGS_bitfield_kunit.o := $(call cc-option,-Wframe-larger-than=10240) $(DISABLE_STRUCTLEAK_PLUGIN)
>
> I think the  $(call cc-option,-Wframe-larger-than=10240) needs to be dropped
> here. This was not in my original patch and it is definitely broken on

Ah, someone else put that there, so I just left it, but I can drop it.

> all architectures
> with 8KB stack size or less if the function needs that much. What is the amount
> of actual stack usage you observe without this?

Well STRUCTLEAK claims 7440 bytes, but I don't entirely believe that.
Regardless, it is definitely less than 8KB.

> If we still get a warning, then
> I think this needs to be fixed in the code.
>
>        Arnd

Cheers
