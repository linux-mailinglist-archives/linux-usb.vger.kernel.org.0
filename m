Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47B841CDAE
	for <lists+linux-usb@lfdr.de>; Wed, 29 Sep 2021 22:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344178AbhI2VBG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Sep 2021 17:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346146AbhI2VBD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Sep 2021 17:01:03 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EE3C06176C
        for <linux-usb@vger.kernel.org>; Wed, 29 Sep 2021 13:59:21 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id k24so3979023pgh.8
        for <linux-usb@vger.kernel.org>; Wed, 29 Sep 2021 13:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NDTUGfYj9oi0gUXH9XqZgjp5PU9RCsTIj0stetjLRiw=;
        b=OK0JjRy2JCSehREjoq9JQ+sAEQDjEmiCNclsNGEfzKeacJDQfaDp2JmKrUgSGjO2d9
         ns1lg77daDtxbYsaKQkX3+M1HOM4Nc46FNBRzHRGFxRCmbRlyXZo0pRIuNH5bhCIF/pM
         0SWUD2Jo+DrQpARjUMUrZ3fmgBTbcnX3VCWXrpxL2y4gbasZEVzuBvAdc9/8mdNaq6eH
         gJuLNNf6dKm++kI0RDdVLxVTvgvStc0ye6xzGRbEs3CkaJ3mh8A+mB3piVyCWRvJPipk
         yf6yhO+/m4JLbuy1OZmq/yvMXVbwnzjuqseB+4uVsZ20lDxZXIqWcN9JBsEHowLH/KDN
         cRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDTUGfYj9oi0gUXH9XqZgjp5PU9RCsTIj0stetjLRiw=;
        b=fLSp3+z0rn5ywQvNn6QmF/A0YrMhSGz7fGCrd6603CPbE88OgF2GJAUwm+aTac7VUx
         6NZo56jx9mXvye3hgufr1rM9vfCQHXKXPKwdFYMCdLByg3j+2d7oS62G83KzgplEn26O
         O2QMk8BA1xXd4VFFxtnmVdht+AMSwy2R+EdDHPblSKtpLBpnJUdnC7cYIKOo6Sla5l2i
         GefpecD52JM3kS67u3/+Gnkt/aYg9N4gBAO0baq1qJnsx9dhm85Aj6X80D/L4OqvIUNJ
         k0hVmcLp1MWeso6DpOGiPbAKSCYwqXHA2/Qh2e1Rx4zJFWq+ZeoPIAaMgQrubTd5SZUj
         FCJw==
X-Gm-Message-State: AOAM531bJDdF9bC/I2wqAk/RMUsEYSKIxrsUEjWAX8GdThHtwNshTuSI
        ZL8sM3kCeDOdKc+GitP/tf3a/7O7KClCR3tEGca4OA==
X-Google-Smtp-Source: ABdhPJwl2RK2Jn+5k+99JJpFvjDAl4+N1WDibTWsaaDTXV5XVD2P6HI4SLPTLrWY6ZrdxfKHD+AtTNdO0nf0abSvz+g=
X-Received: by 2002:a63:1550:: with SMTP id 16mr1691275pgv.442.1632949160817;
 Wed, 29 Sep 2021 13:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061104.2680133-1-brendanhiggins@google.com>
 <20210917061104.2680133-6-brendanhiggins@google.com> <202109170856.8DDB49112D@keescook>
 <CAHk-=whck4RtO7yp-jKK8QQc0bCDZBkdHc=3pGiFsFjwnQ+-mw@mail.gmail.com>
In-Reply-To: <CAHk-=whck4RtO7yp-jKK8QQc0bCDZBkdHc=3pGiFsFjwnQ+-mw@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 29 Sep 2021 13:59:09 -0700
Message-ID: <CAFd5g44g+N0w+Pu3HS+839fZMo-BNutiJ-JxAmRmdvvS14hYxg@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] mmc: sdhci-of-aspeed: build kunit tests without
 structleak plugin
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
        David Gow <davidgow@google.com>, Arnd Bergmann <arnd@arndb.de>,
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 17, 2021 at 11:40 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Sep 17, 2021 at 8:57 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > This isn't a stand-alone test object, so I'm less excited about
> > disabling STRUCTLEAK here.
>
> Yeah, please don't do this for things that aren't pure tests. You're
> now disabling security measures (even if I hate the gcc plugins and
> hope they will go away).

Oh, whoops, yeah, I shouldn't do that. I am just going to drop this
patch entirely, as I wasn't able to reproduce the stack frame size
issue on qemu anyway (as I mentioned on the cover letter).

Thanks for catching this.

Sorry!
