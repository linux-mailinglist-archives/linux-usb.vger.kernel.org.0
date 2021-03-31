Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC6B348CB5
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 10:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhCYJXj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Mar 2021 05:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbhCYJXZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Mar 2021 05:23:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3F4C06175F
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 02:23:21 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g8so1448355lfv.12
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 02:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5tvrHzTq0gWQPCywVaxzy6v7kow1O87LeytCB1bodgo=;
        b=MhuB3SGDVQsjhET84L/1KRiomBF9a3KFIb9j4QcSXe84rt6vYQxQM2JztojeCFrrZb
         UbRU5kqkkkm+M2wKA2l6ha4Su6XNphRWO15O8wdYL1B5OugaXK71kTkTO45qIjS4CZ5F
         vrAIecz7SBCbLrInmd8qex7TU2WdOqcYo2UCPV9Ti56O0gzSiN4TvKNywMThXCW8m7lc
         58zXYjS3v5MjF8Iwi0CP9ZlJDYxCxPOk8u37pslrBPpCfbA/AC2gkIuojPJhdvdmuoRX
         kBuKPr8T6zCs9195GUMZ1iYBj7x9ZTf7Z/q7tJQkFlMsbfAubCnJ5e8n65t6Z+4Dr320
         j9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5tvrHzTq0gWQPCywVaxzy6v7kow1O87LeytCB1bodgo=;
        b=d3fR98QyI0mo6SHfuq8cAgW5D00Ch3mqg+pyYeLJlBhsjRgdGa2/XwfKeim4XgX8Tg
         SBeG82lxo7ruQ/jKXzAIugT+8amgem8NrqCDQWNQTGJa+zg+rD7uKbUEgc0qmYm7+SRQ
         9OqCwGT772v9PGovvHIzZP9y83eOCtgY6y8dVxA9sxWk0fDJ0n6Gyeoq0fovkyfPxn49
         bg/9IEdch9+0UV+PuSYEpaGQGxDhEhhgC/j6TqZq3WSsrC0IqQ42+FhYWPMzG0m8/U0h
         vT/ncVwjakuCO2FjoA6eG/NFg3X57Ri5mLOiYCcD9gB19sbpdOAbMT5nxGeVvvfanpso
         jsWg==
X-Gm-Message-State: AOAM5312kAVejF8lexw/P+kNR/skjK3EcmTn1jwev9xcoeO1DNcWykJ2
        ZjDebFjtLHy7jODzgVq5TxCaTw9rEtvhoVzJLtRpgA==
X-Google-Smtp-Source: ABdhPJxZ9tJzr5Ma99P00E4TPr2rgQatQ4a9hwr5E8JzXVY8NxG2acO+Rt8Upz77y2AfiiaXQ3/mGz5FXGWZKXowQ2o=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr4569222lfo.529.1616664199644;
 Thu, 25 Mar 2021 02:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210323153626.54908-1-andriy.shevchenko@linux.intel.com> <20210323153626.54908-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210323153626.54908-6-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:23:08 +0100
Message-ID: <CACRpkdYVOgurDD3pQCAYzNoHgSAibVcoEWphJu9T152eLo=uiQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] usb: gadget: pch_udc: Initialize device pointer
 before use
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 23, 2021 at 4:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> During conversion to use GPIO descriptors the device pointer,
> which is applied to devm_gpiod_get(), is not yet initialized.
>
> Move initialization in the ->probe() in order to have it set before use.
>
> Fixes: e20849a8c883 ("usb: gadget: pch_udc: Convert to use GPIO descriptors")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Ooops sorry.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
