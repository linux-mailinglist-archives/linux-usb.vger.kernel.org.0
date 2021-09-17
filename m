Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33BEA40FD6C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 17:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243134AbhIQP7O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 11:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243139AbhIQP7N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Sep 2021 11:59:13 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830C1C061764
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 08:57:51 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id k23so7287725pji.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r6MdFPfPUAZH3+HZlPktkkcgyhh/J6s1d9EKnLc8sLI=;
        b=cVRmNTsiGusduzzBZ0I0VDwRsgxPiX0DIHlnWw6Se7sfNbDpGRiSTLvTlZtIThSTQO
         8Iq2NwZoaHIDpechq2RhvvyJvdrbKPHw1+n+7wPIlBMrVoDW3PXN++ki6UAMxgRCzQMe
         1l//5Z7Px9GtWSlr/+iGzFDVVYKKNPnCzniEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r6MdFPfPUAZH3+HZlPktkkcgyhh/J6s1d9EKnLc8sLI=;
        b=CS9pmrSI7IF6gU4sahTMFNgiIjB5PhxjiVS3PFaWQGDpScSv/UutivnwDp/YJcjy+4
         CwthSmsUojsqnmV9LJYWGhyFm/WwI0Wgx1BXKxqGh/nvcY/alVCKIdHt5nU2WyN8A7+I
         /rmB9Yj3N73hDRdClFXe3rLJaV7dNvMUACKIipzM/ARy/OpV4eZCi4vKpaas5vwxz9rT
         LitbiMV92xLw0bCwmgAiXBsyDvCE+b7z5QHcVvScBivyzs1pMDAaCXLctLQwzQtQu9Xi
         2BbnurztNcocl3A2Y7dPyN6fnMknNMW9eJRN/79EVnP9U4kAYRbJsQY9WNFls5eHROLf
         TdJg==
X-Gm-Message-State: AOAM533vpilUdbzzXR4OY5McHM74wnJyEQMZ5VA74HbxN2KUX1apsL+p
        QiGytbF6YS7aPcBx9NvUU6bbzw==
X-Google-Smtp-Source: ABdhPJz9vij1VDEQP6wMABN1KinAsDThb7qqcjn08XngLn0itqVa2eHpdQK0v808VVyWyogNtOKZyw==
X-Received: by 2002:a17:902:c411:b0:13c:9748:badf with SMTP id k17-20020a170902c41100b0013c9748badfmr10322686plk.18.1631894271017;
        Fri, 17 Sep 2021 08:57:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k3sm10981540pjg.43.2021.09.17.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 08:57:50 -0700 (PDT)
Date:   Fri, 17 Sep 2021 08:57:49 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <shuah@kernel.org>, David Gow <davidgow@google.com>,
        Rafael Wysocki <rafael@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Ulf Hansson <ulf.hansson@linaro.org>, andreas.noever@gmail.com,
        michael.jamet@intel.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        YehezkelShB@gmail.com, Masahiro Yamada <masahiroy@kernel.org>,
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
Subject: Re: [PATCH v1 6/6] bitfield: build kunit tests without structleak
 plugin
Message-ID: <202109170857.80F9B319@keescook>
References: <20210917061104.2680133-1-brendanhiggins@google.com>
 <20210917061104.2680133-7-brendanhiggins@google.com>
 <CAK8P3a21j9yJe_X=kU6v2YgOnrhunRbPv+O6STSH71qTb7xnfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a21j9yJe_X=kU6v2YgOnrhunRbPv+O6STSH71qTb7xnfg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 17, 2021 at 09:22:08AM +0200, Arnd Bergmann wrote:
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
> all architectures
> with 8KB stack size or less if the function needs that much. What is the amount
> of actual stack usage you observe without this? If we still get a warning, then
> I think this needs to be fixed in the code.

With the frame-larger-than dropped:

Reviewed-by: Kees Cook <keescook@chromium.org>


-- 
Kees Cook
