Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F77116454
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 01:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfLIAZS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Dec 2019 19:25:18 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33955 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfLIAZS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Dec 2019 19:25:18 -0500
Received: by mail-lj1-f196.google.com with SMTP id m6so13621588ljc.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Dec 2019 16:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=KF5aTv6n3DfUqCuMnzLXrdfOWA6J0PeAoUE3gVOIfho=;
        b=eazPkT9OY2g279/0q9bTe4jPHcwjQ4NGY5UhzkTncLoyS0QY9I7hLcPhLinitxKGT6
         2vwlRBkRA6vNxVNQlNJxAI9eL7tVZlnsq9F3cPox34bjJI7My8gdVF9JwgSmMpr/1KmF
         nKIuCcIvE5M064ayt1KoOyQa7Uu5I6gEchCT403WP03JNGv5x5ZXXNqC84dq7grBf2/e
         ptM3uOA0OZQ28dw4vcJ41sQvKRJBSF/r6j+zakDW+2ITZI3sFO0PYkmM8Zrx+Q4AAHYy
         j9k6RmBLJwduznVwPo/7hxqdfO+Gx7MBTeuon+CPTxnVil+y/JL9PHclTfiOoMFHlUiT
         Q+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=KF5aTv6n3DfUqCuMnzLXrdfOWA6J0PeAoUE3gVOIfho=;
        b=ScmAwaf5Sj6FIdLeVczAnkmAIawibDnf9/r7GaR8koLq6kcz7aGmlh/VC68EUSPEUB
         Xje1a6B3EeSh31SpnqcnnelBvX7f5ao7KYbmPx6ysW+mepMbgSmlSn2iZozwzsAVO5hO
         x9wzyPIZvtukECXHp+CuIuglKDj/FH/oQfGzsoHdkTcohTVG7jvwuB+ErGp8j8rCRpBW
         T5qQ3qCofXXokqjEZI7JLU609qRHrHKOjQIfFN4NYkcFjBrZ+jhaYfo2h+SCreJdopzr
         MvWdQ8PdR6tfmr2zL9hV879FHYBnWUMWz63vrKsFsamzQWbouwdwkhPPoBOpMfN5P5pE
         6zsA==
X-Gm-Message-State: APjAAAXLRh/MU29hxjaG82QviVX1I/XV2Xf8EEZNiJKNz/r5emOG+Dns
        9ubPFiQjqu8pgDfpKJXehnhgLfeV8mxKMFN8jTxJYw==
X-Google-Smtp-Source: APXvYqwA4f0EBjRe0txq2g8UUi2gwyPzDi1AwLLBW1NyB9fdBSfdKji4BbOoYaWmQDSAbN40LFGN6UMMnsJL2sk1Y2o=
X-Received: by 2002:a2e:8544:: with SMTP id u4mr2212275ljj.191.1575851115853;
 Sun, 08 Dec 2019 16:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20191205142200.145252-1-linus.walleij@linaro.org> <20191205201936.GA19754@uda0271908>
In-Reply-To: <20191205201936.GA19754@uda0271908>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Dec 2019 01:25:04 +0100
Message-ID: <CACRpkdb1dY-fnH8Muse7gFoxzA2PhpLFskWJ+dz6DHbvm7H7zQ@mail.gmail.com>
Subject: Re: [PATCH] musb: davinci: Convert to use GPIO descriptor
To:     Bin Liu <b-liu@ti.com>, Linus Walleij <linus.walleij@linaro.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 5, 2019 at 9:20 PM Bin Liu <b-liu@ti.com> wrote:
> On Thu, Dec 05, 2019 at 03:22:00PM +0100, Linus Walleij wrote:
> > The DaVinci MUSB glue contains an optional GPIO line to
> > control VBUS power, convert this to use a GPIO descriptor
> > and augment the EVM board file to provide this descriptor.
> >
> > I can't get this driver to compile properly and it depends
> > on broken but when I didn get it to compile brokenly, it
> > did at least not complain about THIS code being broken so
> > I don't think I broke the driver any more than what it
> > already is.
> >
> > I did away with the ifdefs that do not work with
> > multiplatform anyway so the day someone decides to
> > resurrect the code, the path to get it working should be
> > easier as well since DaVinci is now multiplatform.
>
> Generally I don't take such patches unless they are part of the effort
> to un-broken the driver. But is this patch a prerequisite of any cleanup
> in DaVinci family or ARM architecture? What is the motivation of this
> patch?

The motivation is the clean-up of the internal GPIO API for the
kernel. It is described in drivers/gpio/TODO

I can propose a patch simply deleting the code if you prefer that,
then whoever want to resurrect it can still get it out of git if
they need. As long as nothing includes <linux/gpio.h> anymore,
I am happy.

Yours,
Linus Walleij
