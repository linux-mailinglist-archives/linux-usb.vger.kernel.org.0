Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31310445CB3
	for <lists+linux-usb@lfdr.de>; Fri,  5 Nov 2021 00:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbhKDXgf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Nov 2021 19:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhKDXge (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Nov 2021 19:36:34 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1025BC061714
        for <linux-usb@vger.kernel.org>; Thu,  4 Nov 2021 16:33:56 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id j5so12120368lja.9
        for <linux-usb@vger.kernel.org>; Thu, 04 Nov 2021 16:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5YHWjfEzEUlI15fmSiy3xzKrJn7mQJQGzSin37p/zTk=;
        b=CvtV2Tkmfqnw3iB0ti453wduQf9J815vdPuD2gn2uwxLOS+vPOA3js/Qsk5bdh6r3T
         4FESQt8eM3Z/p/zIMVQY4vaDPDzfZZAXCwJfe4X4ElNnjtzajYrL6v1IPbIVIKKMPou3
         emE9QvOJTxJY23ByN4Xl9h4PCZlOnHbLu5jel077eyXbZpjurcLz6gRfzbd0PZg0nLKl
         /saDQNPDBf3qcai7ml5v7DZvI7T3bsy4CUc8qXLA0Rtl+rIi6jUA+NbLtA5ZzHSSw4J0
         sZYoSQ8Qn3jmZLlnhYvk2akRnNC35BIxh9PNVnFI+WNc2xoXMnF3+wLNWBqwJlVHfLea
         Rmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5YHWjfEzEUlI15fmSiy3xzKrJn7mQJQGzSin37p/zTk=;
        b=iRiGGlfoGmWrSgy7TsXIiuQet9CPnzz6wR+xLD0NqT5WdjWM8rUHJSsxXzK1BkrodA
         v6owerZ1ujN7YI54leAvf+ZM2IeaCXCU038lsnruRKp73veP78JTTebS6sZUc5NZA1pG
         hZhQSizT3o2HbLFVT+/ExaBOjK9HZHq6t1EcElBNI13yMILlIOA0fQp5X38fhafWXJFH
         lmBMmKLo+3zeEPZCwXQefNTRoj6iMT9MtZJ+/MpEdi4jbNoHRmVWFPkfD7bQ4YgZN6gE
         tlMTjOchwdrdwsAj5gZVC2Kr1VrMMs53Okidu4h4vZjZUB639hOR53UprCziNT5ah82N
         ZqOw==
X-Gm-Message-State: AOAM530Od3pZ9o4ZXxP4S4JhfwyKB859q5pwcnUN4r9FwTzmGTK/umBq
        gB6nPWZUIcprX1u3fBmFcE7M1GH4EKqUfEjFKo1Y9Q==
X-Google-Smtp-Source: ABdhPJzhHzzGFHbxGiRdlTZGMQRn1x2xEteO9H/lwhLLeeOMaoer/u6Pv260j74SOmzVet+aIpbZ0TPBx0YB3u3JsDg=
X-Received: by 2002:a05:651c:1504:: with SMTP id e4mr18448176ljf.128.1636068834198;
 Thu, 04 Nov 2021 16:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211104215923.719785-1-nathan@kernel.org> <CAKwvOdnBv8LcxvVYJKacL7eUXAoGVfnQp7TAL_r+P8V0WcOq1Q@mail.gmail.com>
In-Reply-To: <CAKwvOdnBv8LcxvVYJKacL7eUXAoGVfnQp7TAL_r+P8V0WcOq1Q@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 4 Nov 2021 16:33:41 -0700
Message-ID: <CAKwvOdkp99t4ZvVgMLCzKjRq+AwM2-t+JRJeh8vs3vGq=kMoQg@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc2: hcd_queue: Fix use of floating point literal
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 4, 2021 at 4:29 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Thu, Nov 4, 2021 at 2:59 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > A new commit in LLVM causes an error on the use of 'long double' when
> > '-mno-x87' is used, which the kernel does through an alias,
> > '-mno-80387' (see the LLVM commit below for more details around why it
> > does this).
> >
> >  drivers/usb/dwc2/hcd_queue.c:1744:25: error: expression requires  'long double' type support, but target 'x86_64-unknown-linux-gnu' does not support it
> >                          delay = ktime_set(0, DWC2_RETRY_WAIT_DELAY);
> >                                              ^
> >  drivers/usb/dwc2/hcd_queue.c:62:34: note: expanded from macro 'DWC2_RETRY_WAIT_DELAY'
> >  #define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
> >                                  ^
> >  1 error generated.
> >
> > This happens due to the use of a 'long double' literal. The 'E6' part of
> > '1E6L' causes the literal to be a 'double' then the 'L' suffix promotes
> > it to 'long double'.
> >
> > There is no visible reason for a floating point value in this driver, as
> > the value is only used as a parameter to a function that expects an
> > integer type.  Use USEC_PER_SEC, which is the same integer value as
> > '1E6L', to avoid changing functionality but fix the error.
> >
> > Fixes: 6ed30a7d8ec2 ("usb: dwc2: host: use hrtimer for NAK retries")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1497
> > Link: https://github.com/llvm/llvm-project/commit/a8083d42b1c346e21623a1d36d1f0cadd7801d83
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Thanks for the patch!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

hmm...should we explicitly #include <vdso/time.h> for this
declaration?  It may work due to transitive includes, but that's
generally considered brittle should those transitive includes change
in the future.

>
> > ---
> >  drivers/usb/dwc2/hcd_queue.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
> > index 89a788326c56..bdf1927e1be1 100644
> > --- a/drivers/usb/dwc2/hcd_queue.c
> > +++ b/drivers/usb/dwc2/hcd_queue.c
> > @@ -59,7 +59,7 @@
> >  #define DWC2_UNRESERVE_DELAY (msecs_to_jiffies(5))
> >
> >  /* If we get a NAK, wait this long before retrying */
> > -#define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
> > +#define DWC2_RETRY_WAIT_DELAY (1 * USEC_PER_SEC)
> >
> >  /**
> >   * dwc2_periodic_channel_available() - Checks that a channel is available for a
> >
> > base-commit: d4439a1189f93d0ac1eaf0197db8e6b3e197d5c7
> > --
> > 2.34.0.rc0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
