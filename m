Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A851B630A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 20:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730186AbgDWSKk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 14:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730169AbgDWSKj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 14:10:39 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5746C09B043
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 11:10:37 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k18so2668257pll.6
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 11:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QrjNM8BIB5l9RDDyP/w9uL8SShDah7FJKmQ5DvjnKE8=;
        b=AsXfCxXazLdQ4m4tFsITnoDFMxqGenJRkSF+hQa764+Ie951E0z1+86ZtMDbqQeqN9
         EoMfgJun6N/RY0LSGQ4n6KcyLtyLxeE6qI0AYgv5QA60oCmP8THtiezL2RHowJtIe/7X
         ibS7aUydBcFHYotXKrT/7B5h0McBa7t+WrF0Kod6rl8RAR3VRpE2rebAt0ODkRKw89rM
         h2swOx8HZH8pTN3Epi4K0wNbez+NDF2bsW3xtSPJjsFeLdq7yB50zmj/WTJb0qBWc6sq
         zELPZtUFYAhh1kh05HOxNhOi2RPJGDPjiDAXuUVBTAZRVjZr8kCBRFN0xdbZ/Wq5/FTF
         rGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QrjNM8BIB5l9RDDyP/w9uL8SShDah7FJKmQ5DvjnKE8=;
        b=Y4fDMXNkhOuIFzmsAU7D7PYswzYbftKHdOVhYcK+gp2n1n6555oKp8ll7TXxyBMRac
         YwZ0EFz9mMiadD8eK/yEMBfGLwKIahpqTyGBuE+StWhmZqU/S1/cC9bwzJgSRBsIpIUB
         tbh9lkWNQXW8XfNS0TfLNlOzI0Wwj1DNO9c7dBTr+3tGFaZofPFtmxuyPcX5yZRhe+YX
         FqprRIdWRTsz4Zvu4r23qpg2ud1eI/TaJZeUAzkZnF/Qce9j5d4TPR7Mrid8jV6W+5wN
         fM6M18DKo++aEgS2Df0q5TfeQhraqtUpGCMJfw39ny/Q+1T1U/z0nycg4uMGIlAJJf7/
         IPdQ==
X-Gm-Message-State: AGi0PuYpDHXz3fAogu/WuHtBqLBuIRFjMyV3XtLwNkEPj7PJ5Lc7mShu
        30Hfe87iYMh5OJ6+BO+BzD9e5NAcISEAPVaOINvCwA==
X-Google-Smtp-Source: APiQypJxSAw4KraboivCNfbdVu5dxs22Lp01yJChZEKk7LuJohXkK/zLo28qdyZgNXxQMSdqcAn9Gjof2vvDu8FLAOQ=
X-Received: by 2002:a17:902:ac87:: with SMTP id h7mr4756081plr.119.1587665437124;
 Thu, 23 Apr 2020 11:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200423162923.10886-1-natechancellor@gmail.com>
In-Reply-To: <20200423162923.10886-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 23 Apr 2020 11:10:25 -0700
Message-ID: <CAKwvOdnP247LJpqo5ZZfGXUktjtXKzhDwQU=aTOrFi-y_px9mA@mail.gmail.com>
Subject: Re: [PATCH] USB: gadget: udc: s3c2410_udc: Remove pointless NULL
 check in s3c2410_udc_nuke
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 23, 2020 at 9:30 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> drivers/usb/gadget/udc/s3c2410_udc.c:255:11: warning: comparison of
> address of 'ep->queue' equal to a null pointer is always false
> [-Wtautological-pointer-compare]
>         if (&ep->queue == NULL)
>              ~~~~^~~~~    ~~~~
> 1 warning generated.
>
> It is not wrong, queue is not a pointer so if ep is not NULL, the
> address of queue cannot be NULL. No other driver does a check like this
> and this check has been around since the driver was first introduced,
> presumably with no issues so it does not seem like this check should be
> something else. Just remove it.
>
> Commit afe956c577b2d ("kbuild: Enable -Wtautological-compare") exposed
> this but it is not the root cause of the warning.
>
> Fixes: 3fc154b6b8134 ("USB Gadget driver for Samsung s3c2410 ARM SoC")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1004
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the patch!  If anything, I'd be happy to see some more NULL
checks against `ep`, though the callers of s3c2410_udc_nuke() also
seem quite confident that the pointer is not NULL.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/usb/gadget/udc/s3c2410_udc.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
> index 0507a2ca0f552..80002d97b59d8 100644
> --- a/drivers/usb/gadget/udc/s3c2410_udc.c
> +++ b/drivers/usb/gadget/udc/s3c2410_udc.c
> @@ -251,10 +251,6 @@ static void s3c2410_udc_done(struct s3c2410_ep *ep,
>  static void s3c2410_udc_nuke(struct s3c2410_udc *udc,
>                 struct s3c2410_ep *ep, int status)
>  {
> -       /* Sanity check */
> -       if (&ep->queue == NULL)
> -               return;
> -
>         while (!list_empty(&ep->queue)) {
>                 struct s3c2410_request *req;
>                 req = list_entry(ep->queue.next, struct s3c2410_request,
>
> base-commit: ae83d0b416db002fe95601e7f97f64b59514d936
> --
> 2.26.2
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200423162923.10886-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
