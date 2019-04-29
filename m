Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F88CE965
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 19:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728839AbfD2Rm4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 13:42:56 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38718 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2Rm4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 13:42:56 -0400
Received: by mail-vs1-f65.google.com with SMTP id s2so6414054vsi.5
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aeYRo4DWnU986cYWhjGEnN+h3JgjXMfOdPXnL4w08GQ=;
        b=fvpH0+z9/mV5i6pYl9OAUXis10RjTQeAAdDiUQEH151BarKXyLHHjd9WpMKjUS6b9q
         zaYidDBw6ItEDgm6YOuQHikDFaAKU+M7Oe+xQ1UDLCLh29BcIAEN9H+sLdGT1ejTdIZS
         +ibcNa/SUoFJSE0cXLU9UXzh1VJfchQ1ZEm9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aeYRo4DWnU986cYWhjGEnN+h3JgjXMfOdPXnL4w08GQ=;
        b=GYJ1rPmVShEcvevgl3xYpQPfDQcIowGvoyK82qlO5ycPf5/4e8urfZiGmAJo1xLgJR
         hCARnpZiQD3dDNIgHNx5HMTDrLqwXY3QEK1LR0P0KZ6kS57UB/CyEGFJj4yl9owkw6sN
         FVsOwCxMgdKvCNdfWcvfDFhSDNcx4YPGHM4n7uemsedoIS60jrwR6JY6cjrkpP0vMCks
         peRIE7ltxQanPdJuNr9vdDxJUZerjSjS5U0nS3ke+K5yowIo+NL1Du3RpKlkzFz1BiUk
         Ezx8Ujmcor97vHgUzgXVcdub+dTd00le7CIyBB7pvOqCeUgASDMhonqZ2VQv1RhA0Rdv
         PtsA==
X-Gm-Message-State: APjAAAUF4dJ03pI0Hyao8AnKXzc52AGQsVO0ZqovDt8/fHzQobPrf9Bq
        FolECJWmWijc9Yrz6KQGT1DARe0ACtE=
X-Google-Smtp-Source: APXvYqyT4kOuoGbYI1rlAC3xOunshbP76XB1qpCYFGNWOpTSvzyGHv18NfNMg7YLS7ZeN30PiAWOPA==
X-Received: by 2002:a67:82c8:: with SMTP id e191mr34030607vsd.24.1556559774038;
        Mon, 29 Apr 2019 10:42:54 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id h78sm15955543vka.48.2019.04.29.10.42.53
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 10:42:53 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id s2so6413985vsi.5
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 10:42:53 -0700 (PDT)
X-Received: by 2002:a67:ffce:: with SMTP id w14mr11643582vsq.111.1556559772553;
 Mon, 29 Apr 2019 10:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <c62b99a6e4ad6de2982de988e9f9bcd0c6ec4daa.1555672441.git.arturp@synopsys.com>
 <CAD=FV=VDVhA0qzBN13=3C44mAzhDaQBUia_QADqyggSSFwKXqQ@mail.gmail.com> <SN1PR12MB24313212A9F1574A4D00C3B3A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB24313212A9F1574A4D00C3B3A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Apr 2019 10:42:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmXZFf8dutJn22xJ2NRSpiUyjmkJVAy6h0ykqmUG4tkw@mail.gmail.com>
Message-ID: <CAD=FV=WmXZFf8dutJn22xJ2NRSpiUyjmkJVAy6h0ykqmUG4tkw@mail.gmail.com>
Subject: Re: [PATCH v1 14/14] usb: dwc2: Add enter/exit hibernation from
 system issued suspend/resume
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Apr 29, 2019 at 5:01 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> Hi,
>
> On 4/27/2019 01:01, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan
> > <Arthur.Petrosyan@synopsys.com> wrote:
> >>
> >> Added a new flow of entering and exiting hibernation when PC is
> >> hibernated or suspended.
> >>
> >> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> >> ---
> >>   drivers/usb/dwc2/hcd.c | 128 +++++++++++++++++++++++++++++++------------------
> >>   1 file changed, 81 insertions(+), 47 deletions(-)
> >>
> >> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> >> index 45d4a3e1ebd2..f1e92a287cb1 100644
> >> --- a/drivers/usb/dwc2/hcd.c
> >> +++ b/drivers/usb/dwc2/hcd.c
> >> @@ -4510,35 +4510,54 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
> >>          if (hsotg->op_state == OTG_STATE_B_PERIPHERAL)
> >>                  goto unlock;
> >>
> >> -       if (hsotg->params.power_down != DWC2_POWER_DOWN_PARAM_PARTIAL ||
> >> +       if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_NONE ||
> >>              hsotg->flags.b.port_connect_status == 0)
> >>                  goto skip_power_saving;
> >>
> >> -       /*
> >> -        * Drive USB suspend and disable port Power
> >> -        * if usb bus is not suspended.
> >> -        */
> >> -       if (!hsotg->bus_suspended) {
> >> -               hprt0 = dwc2_read_hprt0(hsotg);
> >> -               hprt0 |= HPRT0_SUSP;
> >> -               hprt0 &= ~HPRT0_PWR;
> >> -               dwc2_writel(hsotg, hprt0, HPRT0);
> >> -               spin_unlock_irqrestore(&hsotg->lock, flags);
> >> -               dwc2_vbus_supply_exit(hsotg);
> >> -               spin_lock_irqsave(&hsotg->lock, flags);
> >> -       }
> >> +       switch (hsotg->params.power_down) {
> >> +       case DWC2_POWER_DOWN_PARAM_PARTIAL:
> >> +               /*
> >> +                * Drive USB suspend and disable port Power
> >> +                * if usb bus is not suspended.
> >> +                */
> >> +               if (!hsotg->bus_suspended) {
> >> +                       hprt0 = dwc2_read_hprt0(hsotg);
> >> +                       hprt0 |= HPRT0_SUSP;
> >> +                       hprt0 &= ~HPRT0_PWR;
> >> +                       dwc2_writel(hsotg, hprt0, HPRT0);
> >> +                       spin_unlock_irqrestore(&hsotg->lock, flags);
> >> +                       dwc2_vbus_supply_exit(hsotg);
> >> +                       spin_lock_irqsave(&hsotg->lock, flags);
> >> +               }
> >>
> >> -       /* Enter partial_power_down */
> >> -       ret = dwc2_enter_partial_power_down(hsotg);
> >> -       if (ret) {
> >> -               if (ret != -ENOTSUPP)
> >> -                       dev_err(hsotg->dev,
> >> -                               "enter partial_power_down failed\n");
> >> +               /* Enter partial_power_down */
> >> +               ret = dwc2_enter_partial_power_down(hsotg);
> >> +               if (ret) {
> >> +                       if (ret != -ENOTSUPP)
> >> +                               dev_err(hsotg->dev,
> >> +                                       "enter partial_power_down failed\n");
> >> +                       goto skip_power_saving;
> >> +               }
> >> +               hsotg->bus_suspended = true;
> >> +               break;
> >> +       case DWC2_POWER_DOWN_PARAM_HIBERNATION:
> >> +               if (!hsotg->bus_suspended) {
> >
> > Do you have any idea why for DWC2_POWER_DOWN_PARAM_PARTIAL we still
> > call dwc2_enter_partial_power_down() even if bus_suspended is true,
> > but for hibernate you don't call dwc2_enter_hibernation()?
> For Hibernation I do call dwc2_enter_hibernation().

Maybe you didn't understand the question.  I'll be clearer.

Imagine _dwc2_hcd_suspend() is called but "bus_suspended" is already
true at the start of the function.

If we're in DWC2_POWER_DOWN_PARAM_PARTIAL, _dwc2_hcd_suspend() _will_
call dwc2_enter_partial_power_down()

If we're in DWC2_POWER_DOWN_PARAM_HIBERNATION, _dwc2_hcd_suspend()
_will NOT_ call dwc2_enter_partial_power_down()


This is all part of the whole asymmetry between PARTIAL and
HIBERNATION that makes it hard to understand.


> >> +                       /* Enter hibernation */
> >> +                       spin_unlock_irqrestore(&hsotg->lock, flags);
> >> +                       ret = dwc2_enter_hibernation(hsotg, 1);
> >> +                       spin_lock_irqsave(&hsotg->lock, flags);
> >> +                       if (ret && ret != -ENOTSUPP)
> >> +                               dev_err(hsotg->dev,
> >> +                                       "%s: enter hibernation failed\n",
> >> +                                       __func__);
> >
> > nit: no __func__ in dev_xxx() error messages.  The device plus the
> > message should be enough.  Only resort to __func__ if you're forced to
> > do an error message without a "struct device *".
> This code comes form previous implementations I have not touched it not
> to back anything.

Please fix.  Even if you had internal code that did this it still
needs to be fixed when going upstream.  It is highly unlikely you'll
break something when removing something like this.



> > nit: as per my comments in an earlier patch, remove special case for -ENOTSUPP
> >
> > Also, presumably you want to match the error handling in
> > DWC2_POWER_DOWN_PARAM_PARTIAL and do a "goto skip_power_saving" when
> > you see an error?
> When there is an error power_saving should be skipped.

OK, so you agree?


> >> +               } else {
> >> +                       goto skip_power_saving;
> >> +               }
> >> +               break;
> >> +       default:
> >>                  goto skip_power_saving;
> >>          }
> >>
> >> -       hsotg->bus_suspended = true;
> >> -
> >
> > It's a bit weird to remove this, but I guess it just got moved to the
> > partial power down case?  ...and in the hibernate case you're relying
> > on the hibernate function to set this?  Yet another frustratingly
> > asymmetric code structure...
> Enter hibernation implements setting bus_suspend so I don't touch this.
> Actually this patch set fixes issues it doesn't clean up everything
> related to hibernation or partial power down.

Yet more asymmetry.


> >>          /* Ask phy to be suspended */
> >>          if (!IS_ERR_OR_NULL(hsotg->uphy)) {
> >>                  spin_unlock_irqrestore(&hsotg->lock, flags);
> >> @@ -4564,17 +4583,17 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
> >>          int ret = 0;
> >>          u32 hprt0;
> >>
> >> -       hprt0 = dwc2_read_hprt0(hsotg);
> >> -
> >>          spin_lock_irqsave(&hsotg->lock, flags);
> >>
> >> -       if (dwc2_is_device_mode(hsotg))
> >> +       if (!hsotg->bus_suspended)
> >
> > As per my comments above I don't have a good grasp on what
> > "bus_suspended" is for.  ...that being said, if your change here is
> > actually correct then you probably (?) want to remove the "if
> > (hsotg->bus_suspended)" check later in this same function.
> >
> > Said another way, you've now got code that looks like:
> >
> > if (!hsotg->bus_suspended)
> >    goto exit;
> >
> > /* code that I think doesn't touch bus_suspended */
> >
> > if (hsotg->bus_suspended) {
> >    /* do something */
> > } else {
> >    /* do something else */
> > }
> >
> > Presumably the "do something" is now dead code?
> >
> That part is not dad because if hsotg->bus_suspended is true
> resuming/exiting from suspend/partial power down/hibernation should be
> performed.
> On the other hand if hsotg->bus_suspended is false there is no need to
> resume.
>
> So of course if core is not suspended the code responsible for resuming
> should not be called. In that sense the code can be called dead.

I think I didn't explain it well.  Does this patch help you?

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/4e84efdbeb74bcb8b24e2b1fea24153981acc185%5E%21/


> >> +       spin_unlock_irqrestore(&hsotg->lock, flags);
> >> +
> >
> > I'm pretty curious if you tested DWC2_POWER_DOWN_PARAM_PARTIAL after
> > applying your patch series.  As far as I can tell your switch
> > statement for DWC2_POWER_DOWN_PARAM_PARTIAL will "break" with the
> > spinlock already unlocked.  ...so you'll run spin_unlock_irqrestore
> > twice.  Is that really legit?
> I have tested the patches on HAPS-DX and Linaro HiKey 960 boards.

How is it possible that you don't end up spin unlocking more than
once?  This seems like a pretty serious problem.

My guess is that whatever tests you ran didn't actually exercise this
function.  Personally I could only get it to exercise by doing
suspend/resume.

...and when I did, sure enough I saw:

BUG: spinlock already unlocked on CPU#2, kworker/u8:32/5812


> > ...with that a quick test seems to show that partial power down is
> > sorta working on rk3288 now.  I _think_ I saw one case where hotplug
> > failed but I've seen several where it works.  ...unfortunately it
> > seems to break when I do hotplug on the port where I have
> > "snps,reset-phy-on-wake" set.
> You can provide debug logs for that scenario I will try to help you fix
> issues with that.

All you need to do is make sure you run the function
_dwc2_hcd_suspend() with power down mode set to
"DWC2_POWER_DOWN_PARAM_PARTIAL".  ...or walk through the code and see
that spin_unlock_irqrestore() will certainly be called twice.



-Doug
