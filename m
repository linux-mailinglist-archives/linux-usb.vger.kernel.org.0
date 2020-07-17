Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F816223D48
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 15:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgGQNtc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 09:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgGQNtb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 09:49:31 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B20C061755
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2020 06:49:31 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e4so12738637ljn.4
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2020 06:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ejBTfKvW8mIkF5uCjs0FIvN1pvfRdzhpCHJMzpb0i/o=;
        b=A4SjKZw5/p9GSTQKt+VBcUBFXVEY4yFZek2iOavlzNVHc7s10fPhBs0Lg12wjmU1UP
         dT0eAawAJr1GprCGXw0huTgIW5CLvNDgzj/6p0qkmmaiu5Ckl24iVXh/kTzbI9zLOAKn
         YEaivOW7Jo9sPjvp6U2YTC7EqEIaawqlS8OO1IUip01DAGp9bM5A24EGxgP+uAbPGrUY
         YEn4cepQt/LeoF4WBU31XSqLuzlxOg19DDMhET9wOT5FwGUMIHSbYOUeGPxyd6VsR6eV
         OOcKsebfzYzV6q+WEfFlz04oozFXHiqCeSvdGOq+a+eVMMUaXnRzdku4ua/0Z3qobk8m
         rKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ejBTfKvW8mIkF5uCjs0FIvN1pvfRdzhpCHJMzpb0i/o=;
        b=Zg5bX9UzniHZ5PoYBgSFs2afpiO9zzhCyDiwLWFLQXcN9dj6o7x1neCN+hrs95FwOM
         pmlBmZSqKriDVWZ47ybZ6M6z19GkC1SzRGS3/ZWxbdG70WYSI7NaTDSlw+7E0CA40lS9
         hF1A55vemnKF/8rv4XY+uiXEL5I9mJE//OoMhwM4CMFunT+XRIjxIZNdDTI5pIkJipuL
         5PsCw+t44DNT2fQGWL8kUbhA3tCdg+4TysgxSwFtOqzeMIvvHYRCUy+8BiyxcWwRzweo
         TZ2kuSkdky/XnLpoP8IG/Pz6UkIhU5vm7dgX3AJ/Q1WnyIaGQde/vsTcZzfK2/smAWPo
         D/3w==
X-Gm-Message-State: AOAM533tOcE4PbLkUzhqRMWMHf9mMV+AWpZAfaWNI4hZXdqJdclAFmSS
        B8oAZyfINIrFPOCwm0R3XG+dckp7G14UWVI8m01BIaCAK40=
X-Google-Smtp-Source: ABdhPJykGP0QdTkLD1j4xyTo80H8W0pwQtN0agOJ+REH/HZCa0O+pgMINT7ijRdkmg0NIY/AJTnj3WRmG8udRDl4pzw=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr4854534ljj.283.1594993769896;
 Fri, 17 Jul 2020 06:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200716123433.155854-1-linus.walleij@linaro.org>
 <20200716123433.155854-2-linus.walleij@linaro.org> <20200716154113.GD1112537@rowland.harvard.edu>
In-Reply-To: <20200716154113.GD1112537@rowland.harvard.edu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jul 2020 15:49:19 +0200
Message-ID: <CACRpkdZmDUH6QEoykD2mnf6689BVf4VMA4tzpb_xzS3zU6BLuw@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] usb: ohci-omap: Convert to use GPIO descriptors
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 16, 2020 at 5:41 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> On Thu, Jul 16, 2020 at 02:34:33PM +0200, Linus Walleij wrote:
> > The OMAP1 OHCI driver is using the legacy GPIO API to grab some
> > random GPIO lines. One is from the TPS65010 chip and used for
> > power, another one is for overcurrent and while the driver picks
> > this line it doesn't watch it at all.
>
> If the driver doesn't use this GPIO, why keep the code to grab it?

I think it gives a hint to someone who later tries to debug
problems with the hardware that they should maybe go and
complete this overcurrent feature.

Keeping with the paradigm that a patch should be one technological
step (converting to GPIO descriptors) that should be a
third patch (retireing dead code). But I can certainly add a
patch like that if required.

> > Convert the driver and the OMAP1 OSK board file to pass these
> > two GPIOs as machine descrived GPIO descriptors.
> -----------------------------^

Oooups.

> > Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > Cc: Tony Lindgren <tony@atomide.com>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
>
> Aside from this I don't have any objections.

Does that qualify as an ACK or do you still want me to remove
the overcurrent template code?

Yours,
Linus Walleij
