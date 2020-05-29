Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBD11E83D4
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 18:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgE2Qhx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 12:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgE2Qhw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 12:37:52 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D25BC08C5C6
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 09:37:52 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id h3so3070302ilh.13
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 09:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VVOicISwjob/jpSj7GhBdeR1eYfzffk4NhdXDDRt620=;
        b=mniyFHBszz8POGVdK0H4zlRw0AW/+Qzt9awBB1qmYHoh/wVhj7ZcME7OmouegwCSlE
         mUBQcpmP1H19Dk20aDc45vWv+yLNvxrvzJvYK2gWhm204qK53tKDqzQU2q6sIg4dbJ/V
         7zdTPr6Xjttnt1/nzTMZzlT6KaDwFbevZixtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VVOicISwjob/jpSj7GhBdeR1eYfzffk4NhdXDDRt620=;
        b=mvGIzrjHq/3Kdr4SJZ/FqJXWWYlZOREJKIMRrRwLGPnKZ0blSdH8oG+TwVPY61OeZ1
         xEVBUx77Mb8jdl+KfQIb6iQgyFuba4+gSE8/Uo+HbPOyD/A9Z2UWMF9Is42Hp+VqFqAa
         OfQQ1opvrAMJGEujbHu/tOn3JFIdBvaEgBPsYA6m5TDvu3ejEvirmcF8n6LcfGhHeFB4
         eaY7JrscxXhPJM2K6YF5Wu2nVv0frBWRM9w/G35xy7irIzJ44MbpULz0aSaq1lce4lcQ
         MMy+kT7nh1/XlXX16HslXWuZESid0JYNQi608AaGFgHkI/SOKqW4EG1H3AfiyiOGCWaW
         RwlQ==
X-Gm-Message-State: AOAM531Y2trl8EvV7xEMntGV4PHilSPOz9qYXHc/u/xyIO67ZEBMR1Jj
        Sx5lejQ1x3PDQC5yox+j/2YRNisp458=
X-Google-Smtp-Source: ABdhPJxsW9OPfW/iSRpEFmvUZhgAnpI248M4gWS4ANjzxaBH1MsHl4OLvZXdn8ElhBKZiLfM9nK0ow==
X-Received: by 2002:a05:6e02:dd3:: with SMTP id l19mr7507375ilj.154.1590770271355;
        Fri, 29 May 2020 09:37:51 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id w29sm3284608ila.26.2020.05.29.09.37.50
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 09:37:50 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id r2so3117602ila.4
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 09:37:50 -0700 (PDT)
X-Received: by 2002:a05:6e02:11b2:: with SMTP id 18mr8533637ilj.229.1590770269906;
 Fri, 29 May 2020 09:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <1d3bae1b3048f5d6e19f7ef569dd77e9e160a026.1590753016.git.hminas@synopsys.com>
 <CAD=FV=W1x_HJNCYMUb11QNA8yGs0heEiZzHZdeMPzFaRHaTOsA@mail.gmail.com> <0f6b1580-41d8-b7e7-206b-64cda87abfd5@synopsys.com>
In-Reply-To: <0f6b1580-41d8-b7e7-206b-64cda87abfd5@synopsys.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 29 May 2020 09:37:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UCMqyX92o9m7H40E3sHzAFieHSu3TUY953VqNb-vuPPg@mail.gmail.com>
Message-ID: <CAD=FV=UCMqyX92o9m7H40E3sHzAFieHSu3TUY953VqNb-vuPPg@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc2: Fix shutdown callback in platform
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@ti.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@collabora.com>,
        "# 4.0+" <stable@vger.kernel.org>,
        Frank Mori Hess <fmh6jj@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,


On Fri, May 29, 2020 at 9:30 AM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
>
> Hi Doug,
>
> On 5/29/2020 6:49 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 29, 2020 at 4:51 AM Minas Harutyunyan
> > <Minas.Harutyunyan@synopsys.com> wrote:
> >>
> >> To avoid lot of interrupts from dwc2 core, which can be asserted in
> >> specific conditions need to disable interrupts on HW level instead of
> >> disable IRQs on Kernel level, because of IRQ can be shared between
> >> drivers.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: a40a00318c7fc ("usb: dwc2: add shutdown callback to platform variant")
> >> Tested-by: Frank Mori Hess <fmh6jj@gmail.com>
> >> Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
> >> ---
> >>   drivers/usb/dwc2/platform.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> >> index e571c8ae65ec..ada5b66b948e 100644
> >> --- a/drivers/usb/dwc2/platform.c
> >> +++ b/drivers/usb/dwc2/platform.c
> >> @@ -342,7 +342,7 @@ static void dwc2_driver_shutdown(struct platform_device *dev)
> >>   {
> >>          struct dwc2_hsotg *hsotg = platform_get_drvdata(dev);
> >>
> >> -       disable_irq(hsotg->irq);
> >> +       dwc2_disable_global_interrupts(hsotg);
> >>   }
> >
> > I could be wrong, but I think it would be better to instead end up
> > with both calls, like:
> >
> > dwc2_disable_global_interrupts(hsotg);
> > disable_irq(hsotg->irq);
> >
> > To some extent it's slightly overkill, but the disable_irq() function
> > has the nice "and wait for completion" bit.  Your new call doesn't do
> > this.
> >
> If dwc2 currently handling some interrupt then below patch can allow to
> wait until interrupt will be handled:
>
> spin_lock(&hsotg->lock);
> dwc2_disable_global_interrupts(hsotg);
> spin_unlock(&hsotg->lock);

Would that really work?  If you've got a two core system and the
interrupt is just firing on a different core but hasn't acquired the
spinlock then your code might get the spinlock, disable the
interrupts, and then release the spinlock.  The interrupt handler will
still be running on the other CPU and now will get the spinlock.


> but on other hand dwc2 have 3 subsequent interrupt handlers - core,
> gadget, host and not clear which of handler completed.
>
> > That being said, though, you still won't wait for the completion of
> > the IRQ handler for the "other drivers" you reference, right.  Maybe a
> > better fix would be to add a shutdown callback for those other drivers
> > and just keep relying on disable_irq()?
> >
> I have look to other drivers where used disable_irq() - no any driver
> care about SHARED irq's. In that case your suggestion to use both
> disabling is looks Ok.

I'm not sure I understand.  Are you saying that you'll just add
shutdown callbacks to all the drivers using this IRQ and call
disable_irq() there?  That seems like the best solution to me.

-Doug
