Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C050B3EF7ED
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 04:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236456AbhHRCIl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 22:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbhHRCId (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Aug 2021 22:08:33 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21E6C061764
        for <linux-usb@vger.kernel.org>; Tue, 17 Aug 2021 19:07:59 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id x7so2100037ljn.10
        for <linux-usb@vger.kernel.org>; Tue, 17 Aug 2021 19:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=frsonC/Eett9csYV4NWcg000UCHWgHysbHKKbFRcAPM=;
        b=r6QK5pDwDxCALDuBC5OmNKFOoQLgfM28pO4A9zLleI4HWI87x6TQlJVMwLwB81IZIk
         wxghMeJMnHbQL2BiZU1+knJpeRMjYg25mBp08MBiZWtvinVZ4WpJZ+rPMRTsur1g/O5L
         0BVdNrOLh0izDsukGVY3eIdzO2IBz8kzVEhmOxBKkp/pTzfgai0Du/dWerNVR6KrhhCX
         xoPBMVXk3O2pgUtg9g00ox4QGBGhC5BnmsgLwVmxFfZFbO1XatJ1yuCjP0pPOb325RzE
         5UDo6bDa5CeyRqTh7hpPPwEGZML2NUUyNqLdtbte5y2isrOTbytPAiN2uj2siVFjVuCm
         MaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=frsonC/Eett9csYV4NWcg000UCHWgHysbHKKbFRcAPM=;
        b=jVl7BD/WDKDQGJSKIv5Ls7GJrL+55ZVA1f1ujvmppt7WZIRsEeFRaLqrneJOKGhA4T
         SMVnxEU13z/de6ZmFpHi2KRaU/9qlFdo/iy2m3CDNbTpYD6BXsGofrPaQ2Lv7g9oeC5r
         T92XOwUoSkXOc7uX20leGeUF/ZWjhdCUh7soYINUA6WYGUOIzCMhKhLU6fSJZyXlP/1n
         eidf8hXmt1FZSiUnG1tEqXO1tD91m0i58zBOlP4062a+2SoUpDg45cuP2nCqidfEm2zp
         rl02QdVI+R6XjMISPyINkps+yR5HGRw4dsSFUfyzfXq51Ryk7nFwV2HBOZB5A9jSc9xX
         TXKw==
X-Gm-Message-State: AOAM533rmrDv8FgxXMTvhvuUYdTlCK5S3Cc2zHZo/atzn6YOyUeAfH/N
        FfUl0Ot1FFLeZgzKZk127+2nwPInpPdHpR1oZOqKpQ==
X-Google-Smtp-Source: ABdhPJwy0mkKD+Va1uUzL5UfbLvKL4cSsu4kTJB8GdDZeuIfSF4qBxC2K0FtRr1/AHPhK5v5wo+Aem1CJLtFD8RLs4w=
X-Received: by 2002:a2e:b5ae:: with SMTP id f14mr5861806ljn.170.1629252477985;
 Tue, 17 Aug 2021 19:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210812082635.12924-1-jackp@codeaurora.org> <20210818012859.GB30805@jackp-linux.qualcomm.com>
In-Reply-To: <20210818012859.GB30805@jackp-linux.qualcomm.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 17 Aug 2021 19:07:46 -0700
Message-ID: <CALAqxLUzyUzvT1x6K0w+Cdem5L00Mb90uvcvJT_CS+E8VxxV8A@mail.gmail.com>
Subject: Re: [RFT][PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        Ray Chi <raychi@google.com>, Ferry Toth <ftoth@exalondelft.nl>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Li Jun <jun.li@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 17, 2021 at 6:29 PM Jack Pham <jackp@codeaurora.org> wrote:
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

I don't have a ton of before/after interrupts data, but I applied this
and booted on both db845c and HiKey960 and haven't seen any negative
effects so far.

HiKey960 only connects USB2 to the usb-c gadget port so I can't really
test with a USB3 host.

On db845c, I'm also only seeing high-speed connections but I'm not
sure if that's because the usb3 labeled port on my build server isn't
really usb3, or if its due to something else being off (I did double
check I've got a proper usb3 A/C cable, as a number of my cables are
usb2 A/C).

But I've pushed and pulled a few files, run logcat for awhile and
unplugged and re-pluggeded the cable a few times on both devices and
it seems ok to me.

So for what it's worth:
Tested-by: John Stultz <john.stultz@linaro.org> # for HiKey960 & db845c

thanks
-john
