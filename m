Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF0135948F
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 07:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbhDIFc2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 01:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhDIFc2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 01:32:28 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0A0C061761
        for <linux-usb@vger.kernel.org>; Thu,  8 Apr 2021 22:32:15 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id ay2so2195815plb.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Apr 2021 22:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F9hM9nVGMcr2Nn1IqoOQ93AahNtfT8Yn/VYqHGfn/7I=;
        b=MlT+CXpVe+YEXKYqQu+W958NQrZdgi88YdwzAZb96qmte++WWwYbcPdfBo8w4W3bF5
         JIaOtfDEIqS8acjBkZCExhGijH3MWedQIyH4PXz3ifDaeWUiS1qCyBAowfUb27mx9Rpu
         3f9lWtKfDlW4KBt36XMD4DabDKOX6pOSbHuKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F9hM9nVGMcr2Nn1IqoOQ93AahNtfT8Yn/VYqHGfn/7I=;
        b=ZkAeLzROXj/Af8OJJezwRsK0/SZL6cczrtAbt3OnB61fKyswLqZkmCDoRx1r2I57SF
         pJBx0t9uqk6vBBCilVWl6IHgvJHBwbQWB2MtNiVKBxxjXQkSZLEvhANJdIEuhQaaU13f
         OEkYm1s85IW0ilgPy9tIT4xwbyG38VQcqpDESkTMjUuEOPlxWo/fnvKdz9MYW6PLcVre
         5TJG9vboKOcS4JxoBELdEuPn6rxiCeoNg+06tI6tBAUVc2c/f4k+6j4Qt7imE+XDaor/
         sTXekR95GZ1kbOgCvaO5InpwY24SoAcrVSMrdvgOLXr3RNvTilG2I1J4LHTEInl0tD0t
         Wn8g==
X-Gm-Message-State: AOAM530n+k6sVHGwS1pYuxWc6xGNmfPQVMEOTL/KBs05YAL2+B3AflWE
        14Rj3yyxhUHmuEtLMc64Tgm7x5Ek9RFi0tmRrZ7qIA==
X-Google-Smtp-Source: ABdhPJw4untB2Yt+WuL7MDli++gq98wN7FFwz1Ypr7nEtpVbX1vrn8JldU8HxzojRAQ4i24YV68DXHWAvSagpB3Hq60=
X-Received: by 2002:a17:90a:d3c8:: with SMTP id d8mr11825381pjw.144.1617946335435;
 Thu, 08 Apr 2021 22:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Fri, 9 Apr 2021 13:32:04 +0800
Message-ID: <CAATdQgCQ5Gm1CNEbVgLFiFcgDX0yP5G=48Fa29WYbpSuz25WXg@mail.gmail.com>
Subject: Re: [PATCH 1/6] PM: runtime: enable wake irq after runtime_suspend
 hook called
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        linux-usb@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-pm@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Eddie Hung <eddie.hung@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Chunfeng,

On Thu, Apr 8, 2021 at 5:35 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> When the dedicated wake irq is level trigger, enable it before
> calling runtime_suspend, will trigger an interrupt.
>
> e.g.
> for a low level trigger type, it's low level at running time (0),
> and becomes high level when enters suspend (runtime_suspend (1) is
> called), a wakeup signal at (2) make it become low level, wake irq
> will be triggered.
>
>                 ------------------
>                |           ^     ^|
> ----------------           |     | --------------
>  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
>

Can't we just use a falling edge type for this irq line?

> if we enable the wake irq before calling runtime_suspend during (0),
> an interrupt will arise, it causes resume immediately;
> enable wake irq after calling runtime_suspend, e.g. at (3) or (4),
> will works.
>
> This patch seems no side effect on edge trigger wake irq.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/base/power/runtime.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index a46a7e30881b..796739a015a5 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -619,12 +619,12 @@ static int rpm_suspend(struct device *dev, int rpmflags)
>         __update_runtime_status(dev, RPM_SUSPENDING);
>
>         callback = RPM_GET_CALLBACK(dev, runtime_suspend);
> -
> -       dev_pm_enable_wake_irq_check(dev, true);
>         retval = rpm_callback(callback, dev);
>         if (retval)
>                 goto fail;
>
> +       dev_pm_enable_wake_irq_check(dev, true);
> +
>   no_callback:
>         __update_runtime_status(dev, RPM_SUSPENDED);
>         pm_runtime_deactivate_timer(dev);
> @@ -659,7 +659,6 @@ static int rpm_suspend(struct device *dev, int rpmflags)
>         return retval;
>
>   fail:
> -       dev_pm_disable_wake_irq_check(dev);
>         __update_runtime_status(dev, RPM_ACTIVE);
>         dev->power.deferred_resume = false;
>         wake_up_all(&dev->power.wait_queue);
> --
> 2.18.0
>
