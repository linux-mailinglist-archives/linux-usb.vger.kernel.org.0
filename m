Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCADE933
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 19:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbfD2Re1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 13:34:27 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:38765 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728798AbfD2ReX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 13:34:23 -0400
Received: by mail-ua1-f65.google.com with SMTP id t15so3784611uao.5
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OxWXMuOgGwPkufba0enFIvrOumzCG6nakeorSSUZITE=;
        b=oN7bJtuVChJsMZ/9210hby91zLgHRrKtpPjxNLyffJfOD0tZ58sGG38HX4nF7JiUFl
         ODXNNwRPlIOlydEA/kDYcbXt42ImC5SJpMzy6rVhVzJBgrLMAoVR9/jCc9zxU0cWCky5
         XEqsMq33eg1Vlx4hvZpLnf/rPrkZFgdmcSzmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OxWXMuOgGwPkufba0enFIvrOumzCG6nakeorSSUZITE=;
        b=Jd5gUxQB0axZR5FR5sPLuJYanWPcKoI913XHf7qW1rCVGMhoVT28k+2BpM11HzQkZQ
         BDovhUIlwHlVMKPSqePLlsGsd/KzfW9rxXNOEOVpShGgnMN/+19f7r8SPuoiAdNLii+E
         KHGmvscZiCnySMskvsc7xOhqvSW2I0k2jFj/zWFVj6j7H1Yqu/+lUkc4gJOdQCzyWc7t
         gci8QL600Tqy/LsLNrz1J1U1gVUnjlFDN7HalWbLOiHRcASmn/p98kiYBZYFah7qTd1a
         UTDFqT1p6yEHZT0tkP+G9hSP93qAt9/Wi1R/+vQGlofAAvt9tA6npj/Lf/ZUnyfofKnp
         gN0A==
X-Gm-Message-State: APjAAAVPg0fBQ6wbBiyobaAnHSmBvOHGcfkSATz4PL40XwVwCoiYT3Op
        AWE5VLhq+OMmuEnsxpeG567MYJlwAaM=
X-Google-Smtp-Source: APXvYqyEnTiRVMeww4R11nuKnE0BhvUnaWcaz2Y9XYnODSCIpDYIViNhukZJAU50BXFED6tOo2Yn4w==
X-Received: by 2002:ab0:2b13:: with SMTP id e19mr6758563uar.15.1556559261179;
        Mon, 29 Apr 2019 10:34:21 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id w184sm25674363vkd.0.2019.04.29.10.34.20
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 10:34:20 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id d8so6418630vsp.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 10:34:20 -0700 (PDT)
X-Received: by 2002:a67:ffce:: with SMTP id w14mr11616335vsq.111.1556559259937;
 Mon, 29 Apr 2019 10:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555075927.git.arturp@synopsys.com> <b4129291df7b2d061e93c03862c081b6a35b2e7f.1555075927.git.arturp@synopsys.com>
 <CAD=FV=U4muZuc-Wh-1xf5eFDSnyDVXK4BQHeJihWJpaU1ooB0g@mail.gmail.com> <SN1PR12MB2431BD7144CBA0C34C58CE8CA7390@SN1PR12MB2431.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB2431BD7144CBA0C34C58CE8CA7390@SN1PR12MB2431.namprd12.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Apr 2019 10:34:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XhXc8dD8n-XEBG=tSC4Av+JW9hN-U=d3JP8vCiX5DopQ@mail.gmail.com>
Message-ID: <CAD=FV=XhXc8dD8n-XEBG=tSC4Av+JW9hN-U=d3JP8vCiX5DopQ@mail.gmail.com>
Subject: Re: [PATCH 01/14] usb: dwc2: Fix dwc2_restore_device_registers() function.
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

On Mon, Apr 29, 2019 at 3:51 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> On 4/27/2019 00:43, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Apr 12, 2019 at 6:38 AM Artur Petrosyan
> > <arthur.petrosyan@synopsys.com> wrote:
> >>
> >> - Added backup of DCFG register.
> >> - Added Set the Power-On Programming done bit.
> >>
> >> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> >> ---
> >>   drivers/usb/dwc2/gadget.c | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> >> index 6812a8a3a98b..dcb0fbb8bc42 100644
> >> --- a/drivers/usb/dwc2/gadget.c
> >> +++ b/drivers/usb/dwc2/gadget.c
> >> @@ -5004,6 +5004,7 @@ int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, int remote_wakeup)
> >>   {
> >>          struct dwc2_dregs_backup *dr;
> >>          int i;
> >> +       u32 dctl;
> >>
> >>          dev_dbg(hsotg->dev, "%s\n", __func__);
> >>
> >> @@ -5019,6 +5020,15 @@ int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, int remote_wakeup)
> >>          if (!remote_wakeup)
> >>                  dwc2_writel(hsotg, dr->dctl, DCTL);
> >>
> >> +       if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_PARTIAL) {
> >> +               dwc2_writel(hsotg, dr->dcfg, DCFG);
> >> +
> >> +               /* Set the Power-On Programming done bit */
> >> +               dctl = dwc2_readl(hsotg, DCTL);
> >> +               dctl |= DCTL_PWRONPRGDONE;
> >> +               dwc2_writel(hsotg, dctl, DCTL);
> >> +       }
> >
> > I can't vouch one way or the other for the correctness of this change,
> > but I will say that it's frustrating how asymmetric hibernate and
> > partial power down are.  It makes things really hard to reason about.
> > Is there any way you could restructure this so it happens in the same
> > way between hibernate and partial power down?
> >
>
> > Specifically looking at the similar sequence in
> > dwc2_gadget_exit_hibernation() (which calls this function), I see:
> >
> > 1. There are some extra delays.  Are those needed for partial power down?
> Do you mean delays in dwc2_gadget_exit_hibernation() ? If yes they are
> needed for hibernation flow. What relates to delays in hibernation
> needed for partial power down. Anything that is implemented in the
> hibernation delays or other things are part of hibernation and are not
> used in partial power down because they are two different flows of power
> saving.

OK, if they aren't needed for partial power down then that's fine.
When I see two functions doing nearly the same sets of writes but one
has delays and the other doesn't it makes me wonder if that was on
purpose or not.


> > 2. For exiting hibernation the setting of "DCTL_PWRONPRGDONE" only
> > happens if "not remote wakeup".  Is it truly on purpose that you don't
> > do that?
> Currently partial power down doesn't support remote wakeup flow.

Oh.  What happens if you have partial power down enabled and try to
enable remote wakeup?  Does it give an error?


> > 3. I see that dctl gets "DCTL_PWRONPRGDONE" set as part of the
> > sequence in the "not remote wakeup" case before calling this function.
> > ...but then part of the function (that you didn't change) clobbers it,
> > I think.
> >
> Setting device programming done bit in dwc2_gadget_exit_hibernation()
> comes from older code and from debugging I noticed that if it is not
> done at that point then the flow brakes.
>
> So in partial power down flow we need to set that bit wile restoring
> device registers. That is why the implementation is such.
>
> >
> > I have no idea if any of that is a problem but the fact that the
> > hibernate and partial power down code runs through such different
> > paths makes it really hard to know / reason about.  Many of those
> > differences exist before your patch, but you're adding a new
> > difference rather than trying to unify and that worries me.
> >
> >
>
> So to make it easy to reason about I think we should debug it. Please
> point out where it fails. Have you tested this flow and did you see any
> wrong behavior of hibernation or partial power down? if yes please
> provide the debug logs so that they can be investigated.
>
> All of these patches have been tested on HAPS-DX and and Linaro HiKey
> 960 board. These patches fix Hibernation and Partial Power down issues.

I have no real way to test this code.  I'm only setup to use dwc2 as a
USB host since my target device is a laptop with type A ports on it.
Although one of the ports could be made a gadget and I could force the
mode and use an A-to-A cable, I don't have any use cases here nor do I
really have any experience using dwc2 as a gadget.

...so if you and others are happy with the code I won't stand in the
way--I was just reviewing the rest of the series so I figured I'd do a
cursory pass on this patch too.


-Doug
