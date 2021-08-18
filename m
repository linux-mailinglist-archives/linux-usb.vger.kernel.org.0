Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47603F0006
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 11:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhHRJK1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 05:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbhHRJKX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Aug 2021 05:10:23 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F757C061764
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 02:09:48 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id b7so1822364iob.4
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 02:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9iBoqm9fBh4AJfs3dtcx4dh6uIthdPLBk+9KXpRrXs4=;
        b=RcwCHI+b2em2ix/eN5zrKixd7er39kiR2useUYrMNYxkI83ZobAuX4Bg8A4NoKWYHC
         GFns1VrvRBB0UXKx0h37YTXeDc9p54IalL8s0rGjd0mr+1E/Pd4ZHAySjkH5djbTdSFR
         CMrV4gohyJqs140WDjMXRQ6jmQSRQLcyY8FRDsjtPfIq6PSeap0bVrVsldekOGWOofWa
         wFvFPorNQ/eicTcL2OwwMCzD30i////6NJXK3uFi23TZxNn3T55hqCf0xdBQ1Dqprayj
         cdKpiTfJlAEvZYs/ZprEk6pJ3cHR8ANmqv+EQDBd0odGBs+adpZZaa9Rjn32B2ZHGXSU
         sP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9iBoqm9fBh4AJfs3dtcx4dh6uIthdPLBk+9KXpRrXs4=;
        b=lHVaNXzyGEYw/lI5Z3tl1zDNTLEiaAALbfdEdtNdOPDjD9HNlmx7KZ8vGx1DZ1D2jJ
         LaOKY4fx77WF1+nA8aMwS+qf3MlWR+sn7AtPEAcUlfJY/02EptE/vQKfULda4LGTkdyi
         SU5u05zNo+887i93i1ICJ4Ebvja06muzWa+2Rq0a3s5dNdOVPIBL2uDpJ/rTwCgHX4QX
         DxDyb/bU3P0y3NA0r3ds6q87VMlTbZ0tmsjrtmSYTMVKMDL6XNhcwnv8tUQz7Uma/3YT
         RdcNxht5vX821kaIojYFZlzmyD3wcQ1Gxu0bvkFzTC+dgTgX6GQutT8/LNzAelI/diGG
         d/ew==
X-Gm-Message-State: AOAM531KYVFjeYkOI10JZiyzhZKuwRZzlLaQW1u0PniuT/0H9dJstTCs
        ELwn7RGX72RhHIbUaEMv7/s+Rl1TM0ee3Ysigaf/Qg==
X-Google-Smtp-Source: ABdhPJzK3A6B9uJ+CwTiMZiJbCUxRz4+h73wx6aI8l0b1E7Sow7OqsoI5pI/DOymhnQb23JuQCPI70UD/b9Yz9yCxAw=
X-Received: by 2002:a02:b697:: with SMTP id i23mr7111999jam.78.1629277787881;
 Wed, 18 Aug 2021 02:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210812082635.12924-1-jackp@codeaurora.org> <20210818012859.GB30805@jackp-linux.qualcomm.com>
In-Reply-To: <20210818012859.GB30805@jackp-linux.qualcomm.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Wed, 18 Aug 2021 14:39:11 +0530
Message-ID: <CAMi1Hd2PwtLmxXS8_bRjtq1QsEoN_PZzFC8E-R+LRV7=tv2U-w@mail.gmail.com>
Subject: Re: [RFT][PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>,
        Ray Chi <raychi@google.com>, Ferry Toth <ftoth@exalondelft.nl>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Li Jun <jun.li@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 18 Aug 2021 at 06:59, Jack Pham <jackp@codeaurora.org> wrote:
>
> On Thu, Aug 12, 2021 at 01:26:35AM -0700, Jack Pham wrote:
> > On DWC_usb3 revisions 3.00a and newer (including DWC_usb31 and
> > DWC_usb32) the GUCTL1 register gained the DEV_DECOUPLE_L1L2_EVT
> > field (bit 31) which when enabled allows the controller in device
> > mode to treat USB 2.0 L1 LPM & L2 events separately.
> >
> > After commit d1d90dd27254 ("usb: dwc3: gadget: Enable suspend
> > events") the controller will now receive events (and therefore
> > interrupts) for every state change when entering/exiting either
> > L1 or L2 states.  Since L1 is handled entirely by the hardware
> > and requires no software intervention, there is no need to even
> > enable these events and unnecessarily notify the gadget driver.
> > Enable the aforementioned bit to help reduce the overall interrupt
> > count for these L1 events that don't need to be handled while
> > retaining the events for full L2 suspend/wakeup.
>
> Hi folks in To:
>
> I'd like to request if any of you could help test this patch on your
> boards to help make sure it doesn't cause any regressions since I know
> some of the recent dwc3 patches from Qualcomm have been found to break
> other devices :(. So I'm hoping to avoid that even for a patch as
> small as this.
>
> Hoping this could be tried out on boards/SoCs such as db845c, hikey960,
> Exynos, the Intel "lakes", etc.  Ideally this needs validation with a
> high-speed connection to a USB 3.x host, which increases the chances
> that USB 2.0 Link Power Management is supported.
>
> The overall goal of this patch is to eliminate events generated for
> L1 entry/exit, so we should see a slight reduction in interrupt counts
> when checking `grep dwc3 /proc/interrupts` for comparable traffic.
>
> Appreciate any feedback and help in testing!

Smoke tested this patch on RB5, running android-mainline (v5.14-rc6)
kernel, with a USB 3.x host.
Pushed/Pulled couple of large files over ADB, hotplugged the cable a
few times and found no obvious regressions.

Tested-by: Amit Pundir <amit.pundir@linaro.org> # for RB5 (sm8250)

Regards,
Amit Pundir

> Thanks,
> Jack
>
> > Signed-off-by: Jack Pham <jackp@codeaurora.org>
> > ---
> >  drivers/usb/dwc3/core.c | 9 +++++++++
> >  drivers/usb/dwc3/core.h | 5 +++--
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index ba74ad7f6995..719dac228703 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1050,6 +1050,15 @@ static int dwc3_core_init(struct dwc3 *dwc)
> >               if (!DWC3_VER_IS_PRIOR(DWC3, 290A))
> >                       reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
> >
> > +             /*
> > +              * Decouple USB 2.0 L1 & L2 events which will allow for
> > +              * gadget driver to only receive U3/L2 suspend & wakeup
> > +              * events and prevent the more frequent L1 LPM transitions
> > +              * from interrupting the driver.
> > +              */
> > +             if (!DWC3_VER_IS_PRIOR(DWC3, 300A))
> > +                     reg |= DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT;
> > +
> >               if (dwc->dis_tx_ipgap_linecheck_quirk)
> >                       reg |= DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
> >
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > index 5991766239ba..356b94a7ec70 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -256,9 +256,10 @@
> >  #define DWC3_GUCTL_HSTINAUTORETRY    BIT(14)
> >
> >  /* Global User Control 1 Register */
> > -#define DWC3_GUCTL1_PARKMODE_DISABLE_SS      BIT(17)
> > +#define DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT    BIT(31)
> >  #define DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS   BIT(28)
> > -#define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW        BIT(24)
> > +#define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW                BIT(24)
> > +#define DWC3_GUCTL1_PARKMODE_DISABLE_SS              BIT(17)
> >
> >  /* Global Status Register */
> >  #define DWC3_GSTS_OTG_IP     BIT(10)
> > --
> > 2.24.0
> >
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
