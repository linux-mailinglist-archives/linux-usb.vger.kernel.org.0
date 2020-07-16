Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8593722207F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 12:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgGPKTu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 06:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgGPKTt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 06:19:49 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71636C061755
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 03:19:49 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t15so4427732pjq.5
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 03:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l6/D4geo0c+LxQ9h8VuK5gC3WVoUL7xny9eOALs4qSU=;
        b=GqiEWCSR9bKTv7nBZe/vu1wtoKk35iRX5Tf3C3dWGndl8gfG1eGf/0DK0QtH5F4h6U
         zRaO20d6rKq+PQVR3/f9sH+aEHsDlLajTG6+XXprTVN95gsysug/PLP4se8ok/90dAjm
         UElEYf0C2jrbuzi5P3dnSDsJ1AXsLxQimCgmPZIqUL6Dus/REI0Ag/wTGKtaaFbE6k6C
         dDpKZpztWLyZclK55PIpQhSyMG8syS1wGBAbr+fahqCvtrlxHuWJL4OKrdWILPLeMDe8
         CZXjOpNHew5yk/AbLthDePLWuTxR04fq/X8P03urPUw7vJrnPs1l5aK6f2D3xFdIJX6N
         3yQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l6/D4geo0c+LxQ9h8VuK5gC3WVoUL7xny9eOALs4qSU=;
        b=SbR1Soq3vTHaOyQVcn1A33EqBLFu9o3617JkA12V+4LV6S8JWIDXHpyax5aPDWERMw
         CM2CIQ0L/XGZKuPloZkuhrEDUuwniTbjQq4mHW7mJ+IwCzJTAE5H5dVmhFGY0pS/APLE
         JAT86d0yI3CNhn3YInC5tbS4qASMAwbEDsX+qGnOC0YECLR97qKpDd9Tcl6CkyL6s1YZ
         p+b6ND9dI6HKXpmWBqCOjVJhCs1CmKXfTxwpJHlt2rX9Nnn3j64/t8HXd7R+6ml+seLD
         oCMDRkMKBFQz6sumZxM7CBDijSD/du5GtKoGvlj2eWlesOfcnQ7rmRH5CJjd/18Uubdi
         lWMQ==
X-Gm-Message-State: AOAM532ipto37icCXn3EPeVh0kAeM0SFNEZLFu8hBewYBL+spkvftRBW
        QEH0DrnmOuoo7UzMNCbu4G7DHYjZqDFYMHIfA4k=
X-Google-Smtp-Source: ABdhPJyTB1Ptu+tnNCLwit3cG5SK60ASS6f3zacd6117rA43kFDIWr96zwbQDuDvazhNULam9xOo3Q8wcUwROToE9sA=
X-Received: by 2002:a17:902:8491:: with SMTP id c17mr2941853plo.262.1594894789008;
 Thu, 16 Jul 2020 03:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200627111029.513642-1-linus.walleij@linaro.org>
 <20200702145716.GX3703480@smile.fi.intel.com> <CACRpkdZiO2t8pkt7tFMMzCgHYAiioGc_LY2R3iz=i=wGWF-8Bw@mail.gmail.com>
In-Reply-To: <CACRpkdZiO2t8pkt7tFMMzCgHYAiioGc_LY2R3iz=i=wGWF-8Bw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 16 Jul 2020 13:19:32 +0300
Message-ID: <CAHp75VdmiZy_h4TUHVqp9o2Ghay5A9r6BqQEHxDG0Xm+tOP-gw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: pch_udc: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 16, 2020 at 11:49 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Jul 2, 2020 at 4:57 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > > Andy: your input would be appreciated, this kind of code
> > > customizing random embedded Intel systems is deep water for
> > > me, so this is just a rough guess on how it should be done.
> >
> > Linus, I have set up the device (it's actually available as Minnowboard v1) and
> > will look at this.
>
> OK whenever you have time, there is no hurry.
>
> > For time being there is a patch you need to fold into this (sorry, it's mangled):
> >
> > (Explanation: GPIO will be locked with request_irq() call)
>
> I do not understand this, sadly. gpiod_lock_as_irq() will be called
> indeed, but we are requesting it as input and keeping it as such
> so this should be fine?

When you clean up GPIO at the same time you don't need to carry this
memory and resource for the entire lifetime of the driver. When you
lock it as IRQ the resource is not available to use by others anyway
and will be requested whenever IRQ is requested. That's how I
understand it. And to me it makes sense from a flexibility point of
view and debugging perspective.


-- 
With Best Regards,
Andy Shevchenko
