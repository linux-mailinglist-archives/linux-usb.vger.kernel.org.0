Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49B42A5083
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 20:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729292AbgKCTyL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Nov 2020 14:54:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgKCTyK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Nov 2020 14:54:10 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8977FC0613D1;
        Tue,  3 Nov 2020 11:54:10 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id n129so447661iod.5;
        Tue, 03 Nov 2020 11:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4WG8tmd1HMqcTZk+4IU/8TLuwdK1RWEkdVQemnyiNgU=;
        b=oHKVRlSSGCSBson9pZ7r8z8xNib7GSpOYnL0qUzOThF8lE29Ys3NYm6AwhptsEDRB/
         7dtmo6wIrlF/knKOa7qfpgGX0H+YmUCPLDufVvREKrYQ26d4G/DYTTqc9NKnVDJQhplI
         ISGeuw/V7pzxAz7bnBjLsRRwfDFLEEiZOHQWf5bI0oGCY1Fs9m7afhbV4VePVgm9rMlA
         QikObKtBwApmSAaIozeyXzglSQDhh8vczlIS5SZZfecEcztrNjhaUtl8tdjOiewlY8Ce
         LuduNCFBSBAztN2rYHHbifeEOH/Un96rQPCwdF8SfzyHlDCFNWbVzXZIEuAAvXMjRoLR
         WunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4WG8tmd1HMqcTZk+4IU/8TLuwdK1RWEkdVQemnyiNgU=;
        b=Hz/yYT8qP74q0jK7wYQA/xhCm34cbCXMBNl7MIJOLYg3alSo9Rp70DYlbOVV9uBYPA
         /zWipW0lWAfheAXLmf7DstPSrr+J4AdJx8SGnCcwv/4BTGe+6mX/BoBtU0qw5/bV8yAf
         r3GtxkrD8ygsKnLhpNa8KkhJYxDrmPvjKGpLmZko9wsJFaE6pvyZwfD9ASecbyKg7lL0
         YUu/dyp9mRp5HZYHRm8ujotoqDWlts8gzEZC/EYZ7MwfKqC8Nj6j0PqA2LtZ9gjqarmt
         /dF9cJY2n+y+Tc5x38C0hjBWeQLJCvonom4vJBv9eGAhPdgAIacyuLBhv7w9ynGpB6wN
         ebkg==
X-Gm-Message-State: AOAM5305yLKSM0FQ1aE0wk5T2p1Cnonj/hR1aPaE45zEsOdn8K+Q5Wc3
        m0eo/4qBreCdpELXJ749p41v471r0t5M3C5gGJ54Sggk
X-Google-Smtp-Source: ABdhPJw4DgBcNSUg1Wz7uO52LY5Y8eiTwfK0z2kRNDZlIYDgfyuT9h1hdj1nnIHP6UiP1HeudXzSCxhx/HixH1p5n0k=
X-Received: by 2002:a02:d85:: with SMTP id 127mr17143273jax.13.1604433249817;
 Tue, 03 Nov 2020 11:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20201102075655.GA4163205@mwanda>
In-Reply-To: <20201102075655.GA4163205@mwanda>
From:   Alan Cooper <alcooperx@gmail.com>
Date:   Tue, 3 Nov 2020 14:53:58 -0500
Message-ID: <CAOGqxeXtpet0AxmKwkwdjWs4j8_-Lc0jkpahDsAvAcbD0dc1TQ@mail.gmail.com>
Subject: Re: [PATCH] usb: misc: brcmstb-usb-pinmap: Fix an IS_ERR() vs NULL check
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        USB list <linux-usb@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 2, 2020 at 2:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The devm_ioremap() function doesn't return error pointers, it returns
> NULL on error.
>
> Fixes: 517c4c44b323 ("usb: Add driver to allow any GPIO to be used for 7211 USB signals")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The commit original commit "usb: Add driver to allow any GPIO to ..."
> has a bad subsystem prefix.  This is a common anti-pattern for new
> drivers.  (Although less common after I started whinging to everyone
> about it).  It means that the first person to fix a bug in the driver
> has to imagine what the original author wanted.  Sometimes people get
> annoyed which prefix we pick for them.
>
>  drivers/usb/misc/brcmstb-usb-pinmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/misc/brcmstb-usb-pinmap.c b/drivers/usb/misc/brcmstb-usb-pinmap.c
> index 02144c39aaba..2326e60545f7 100644
> --- a/drivers/usb/misc/brcmstb-usb-pinmap.c
> +++ b/drivers/usb/misc/brcmstb-usb-pinmap.c
> @@ -277,8 +277,8 @@ static int __init brcmstb_usb_pinmap_probe(struct platform_device *pdev)
>         pdata->out_pins = (struct out_pin *)(pdata->in_pins + in_count);
>
>         pdata->regs = devm_ioremap(&pdev->dev, r->start, resource_size(r));
> -       if (IS_ERR(pdata->regs))
> -               return PTR_ERR(pdata->regs);
> +       if (!pdata->regs)
> +               return -ENOMEM;
>         platform_set_drvdata(pdev, pdata);
>
>         err = parse_pins(&pdev->dev, dn, pdata);
> --
> 2.28.0
>

Acked-by: Al Cooper <alcooperx@gmail.com> # prefix change noted
