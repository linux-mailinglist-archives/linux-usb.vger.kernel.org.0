Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6B041CD9A
	for <lists+linux-usb@lfdr.de>; Wed, 29 Sep 2021 22:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346804AbhI2Uwg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Sep 2021 16:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346776AbhI2Uwf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Sep 2021 16:52:35 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E649CC061769
        for <linux-usb@vger.kernel.org>; Wed, 29 Sep 2021 13:50:52 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id k17so2997202pff.8
        for <linux-usb@vger.kernel.org>; Wed, 29 Sep 2021 13:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3s5ovlVf4p4ZoSDKjFsCbe0uelei21AOA6TMHZbgO2s=;
        b=lS0ih59O2TtZaNEndFNiI0shEbyoO+KtDD/SlYcYm+EhPqLq1q/SZWW1x8II9lWLd6
         JizxO5pBnSyg6jQLPCdSjiwVK7M5xMA2EVNhgBJXqQEtLi1t+UYXU3IKoBNDch3D3fMu
         H6wiQqWZq11b3npn0KgBnkpmAe2WtYw3qDws6zoVnizoayWiucKz3xml74ccPN/0BARt
         hUPPpZDRUwAuxwa382PMl4d83L7fCJc9W8456+mEamrafJTiUxvpHEoutnzPl70xXOr4
         g1usvoe08E1ztXDfSKzYkqvbGSGQnanR6GxxdE9t/CuruhkY1mmlZKPIYT6fE3IW8H6m
         uPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3s5ovlVf4p4ZoSDKjFsCbe0uelei21AOA6TMHZbgO2s=;
        b=3dIQlsmLK5vGBmrhaXff3mRTeTfydKynH9+D8MRf1Lenz4dPodUVGU4RTN5K5MWjF0
         Oa6jo1eg7qI1YOWYbLHNSnzUyM15gxp4a526Uexn01HNXBGRcw3JanyOW/Ae2Gi5eDZu
         knZarOBimK+vQsXP3vyE3JDaLpQmT/WByrQGiEUMgAgWjDjaF8JSCvjLiLEic1WbhXcQ
         jUySpdzmx8Ak8pxhNKaIizo52pMl6oCxLklyajrvxnCsGpge2VUWVJ8xeQgsh/lkAD6M
         Gox7dUl2mvGqPuhg5fFiC3Wn//+vMFPgpkBV8s6ys/jQ3A9LjdtS8G61xzipRFNNsclC
         RDzA==
X-Gm-Message-State: AOAM531nJAjEGSZWMdN592lkIfYD8ZL+KROiymy9/EitIzkPwzI8cRDE
        BrhHlB5W7kyK5JgsqnEl37SA8MNvuDOV9CF9x2+7jg==
X-Google-Smtp-Source: ABdhPJxR6uT7IzQuzwnXtUAlSkE9J/VzTqobJZisrAWrCsusYCxFaYU1sNTuoFRO/b3lUE/PvL4lrnwqZx/rz8i2gsg=
X-Received: by 2002:a63:790b:: with SMTP id u11mr1626604pgc.71.1632948652015;
 Wed, 29 Sep 2021 13:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061104.2680133-1-brendanhiggins@google.com>
 <20210917061104.2680133-3-brendanhiggins@google.com> <202109170851.4485B94148@keescook>
In-Reply-To: <202109170851.4485B94148@keescook>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 29 Sep 2021 13:50:41 -0700
Message-ID: <CAFd5g442faOu8OeydVr4qZ4YGAY9NrO6uo16ecfm=2=GQY7YBA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] iio/test-format: build kunit tests without
 structleak plugin
To:     Kees Cook <keescook@chromium.org>
Cc:     shuah@kernel.org, davidgow@google.com, arnd@arndb.de,
        rafael@kernel.org, jic23@kernel.org, lars@metafoo.de,
        ulf.hansson@linaro.org, andreas.noever@gmail.com,
        michael.jamet@intel.com, mika.westerberg@linux.intel.com,
        yehezkelshb@gmail.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, ndesaulniers@google.com,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
        gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 17, 2021 at 8:54 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Sep 16, 2021 at 11:11:00PM -0700, Brendan Higgins wrote:
> > The structleak plugin causes the stack frame size to grow immensely whe=
n
> > used with KUnit:
> >
> > ../drivers/iio/test/iio-test-format.c: In function =E2=80=98iio_test_ii=
o_format_value_fixedpoint=E2=80=99:
> > ../drivers/iio/test/iio-test-format.c:98:1: warning: the frame size of =
2336 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
> >
> > Turn it off in this file.
>
> Given that these are all for KUnit tests, is it possible there are going
> to be other CONFIGs that will interact poorly (e.g. KASAN)? Maybe there
> needs to be a small level of indirection with something like:

I don't think so. KASAN actually uses KUnit to test it, and we have
experimented running KASAN alongside other KUnit tests for added
protection and results have looked good.

I would be surprised if there are other CONFIGs other than things
dealing with stack size that don't like KUnit.

> DISABLE_UNDER_KUNIT :=3D $(DISABLE_STRUCTLEAK_PLUGIN)
> export DISABLE_UNDER_KUNIT
>
> then all of these become:
>
> +CFLAGS_iio-test-format.o +=3D $(DISABLE_UNDER_KUNIT)
>
> Either way, I think these are fine to add.

I like your suggestion if we find other configs that don't like KUnit,
but I don't think we have seen any others so far, so I think I will
keep it as it is for now.

> Reviewed-by: Kees Cook <keescook@chromium.org>
>
>
> >
> > Co-developed-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> >  drivers/iio/test/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/iio/test/Makefile b/drivers/iio/test/Makefile
> > index f1099b4953014..467519a2027e5 100644
> > --- a/drivers/iio/test/Makefile
> > +++ b/drivers/iio/test/Makefile
> > @@ -5,3 +5,4 @@
> >
> >  # Keep in alphabetical order
> >  obj-$(CONFIG_IIO_TEST_FORMAT) +=3D iio-test-format.o
> > +CFLAGS_iio-test-format.o +=3D $(DISABLE_STRUCTLEAK_PLUGIN)
> > --
> > 2.33.0.464.g1972c5931b-goog
> >
>
> --
> Kees Cook
