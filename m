Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E36380436
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 09:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233095AbhENH2j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 May 2021 03:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbhENH2c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 May 2021 03:28:32 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF432C06175F
        for <linux-usb@vger.kernel.org>; Fri, 14 May 2021 00:27:19 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id b11-20020a7bc24b0000b0290148da0694ffso937716wmj.2
        for <linux-usb@vger.kernel.org>; Fri, 14 May 2021 00:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E9tnZ9evfnbV2gxFSdDXTY64rXupCRZyW/vv9n4TlN8=;
        b=MIurMscQNGv4VZ6tzwhpDr7DzPbE1lxnX7hhE2XtuM82IE4cR8QJXBCMMNNDnVDg8X
         XCS/Gx3si6HBXuRHCaCL9DThQ3tLSYbQIoDtBdkHtYmCbZyQvr27pkzhdTLOYJHHWkj6
         sqChVKqmNRVjlg/aRd/mMpdqIhS/Ar4iBRJ7ttcdBl0S5tBPC1cmJD4+tgoeWJ0k8B0g
         xAV6We96t22fmldVwUewaB70BvG5j6kUV0SeRgmail60uzMXgK1e6EaSkNJo1OMKX209
         jufk+n4zf2jGz9a4wr9qhPc4WBjVGCLeGppkVo633TCrxHwu5FmBFqjoLMGDzkcDowSl
         rFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E9tnZ9evfnbV2gxFSdDXTY64rXupCRZyW/vv9n4TlN8=;
        b=IEiF3uysOe8HPWIS3jyRFsNyoKi/no2iHKC8GcXzdKHr3Tp1J/yomFMfvKiAwZS8zJ
         HyF5WcmzyEdQ6swoUGq8o0bj+Rchhxl1iq9XAZZLhJ1WGob54RUQGfrY50XBOwtZ8rtc
         sihR74H64NlwH6WFSnuPmv67tQ34CE4Y4viyOxLXIimV0caFz74Lq9PsYmK0YQDX5dwp
         +lpx+EPtzm+CRBqjteXngaWSTuKAaVWwqzTkravX9Zj/dhvpLfVmg1WoSAqi2I+da4SS
         mMr9r0Y78hpMavcGk9g8ivmeUvCWC5klANaVacA4+sPXSzZt1DCjCuT2AP3LF9hxNuZG
         X8pw==
X-Gm-Message-State: AOAM531JM9p7WHOFoZo/J13Qe+B8WS58EZoIj4z1MxFtMNpwOmLUHb8p
        +QFcDYqEDdwdwCtgPJXlrPg7HW7w/FzpUOfE9n1ZNg==
X-Google-Smtp-Source: ABdhPJwHjh48zkpYoAZ/2nORJLb3FRq5J0iYy27VTbDg3XN6mubKDH/X9sIK+VlaB4FVW8C1KS+Fwp0PX8EDvKtjQtA=
X-Received: by 2002:a05:600c:2315:: with SMTP id 21mr47477543wmo.39.1620977238261;
 Fri, 14 May 2021 00:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210513193204.816681-1-davidgow@google.com> <20210513193204.816681-7-davidgow@google.com>
 <20210514060618.GA3511397@lahna.fi.intel.com>
In-Reply-To: <20210514060618.GA3511397@lahna.fi.intel.com>
From:   David Gow <davidgow@google.com>
Date:   Fri, 14 May 2021 15:27:07 +0800
Message-ID: <CABVgOS=Zt8-dHPKTjjQ_C+jZ8ySZejjXyQYSN-hRF95cqCLYmw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] thunderbolt: test: Remove sone casts which are
 no longer required
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Daniel Latypov <dlatypov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 14, 2021 at 2:08 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Thu, May 13, 2021 at 12:32:01PM -0700, David Gow wrote:
> > With some of the stricter type checking in KUnit's EXPECT macros
> > removed, several casts in the thunderbolt KUnit tests are no longer
> > required.
> >
> > Remove the unnecessary casts, making the conditions clearer.
> >
> > Signed-off-by: David Gow <davidgow@google.com>
>
> Looks good.
>
> Does this go through KUnit tree or you want me to take it? In case of
> the former feel free to add:
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>

Thanks. I think it's probably easier for this to go in via the KUnit
tree, unless Brendan or Shuah have any objections.

Cheers,
-- David
