Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4E43D2D2E
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jul 2021 22:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhGVT2q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 15:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbhGVT2q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jul 2021 15:28:46 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3CDC06175F
        for <linux-usb@vger.kernel.org>; Thu, 22 Jul 2021 13:09:19 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id a12so10338061lfb.7
        for <linux-usb@vger.kernel.org>; Thu, 22 Jul 2021 13:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2N0Vh8zfm8OFgF7fX9h4wweWlSshRiJnnbrmkg/bTGo=;
        b=spfOXrAO3yPOl1SfcSxOSufKzLyBB/nbchfZXMZ1GO33uesBhvpV0CQWlz/KJ0z77S
         hE+M4WmjyCuHYzu1/U4M3tLtF4oVUUi1PnnTPo6Ql1TvdZuILFYnW2H0toCRGSRzBnW/
         GbnSboReCVeo1/Hj7TBKRN0BtDj8cn+ybDC/DODa4Pij4v9nb3ssAlUg7zEmWoO4QTn6
         tQYFlouBoeIu9/X7X4ybiQHIhXy0tYFe9jfGHbAewxUjTtUlIkp22a4osiq1AMnxIp8V
         sc+WaI/WHkgwDxDcSlYR0GwDPtQhJilhv9OhGd2lqxUwiSvYLGfVezGVz6pZnPk0C2IG
         sPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2N0Vh8zfm8OFgF7fX9h4wweWlSshRiJnnbrmkg/bTGo=;
        b=hLm7I2b+TcdDAKouYMY6ght69TChR6TPYvOKQl0W3bpIOyOYFbRCgVBhdYkU3DV4F7
         gSm5cwm2TGvmjU5NxVvOHHEfro5abI7eg6fhY5Y2jbBa2ZLPbq+N1eCtm0Pnpv8I0wtF
         GqLnF2/uOycgtIXu8rP7UWNcM32+XiKcM5y2CXuBn3TXjXvvh016T1TofzMe4jMKHRsK
         EGBRaH/jiD4Jz8TosZDWszIrSk8kOsYFoRhz/mxy2JfWa7R0emdoS7qHu/OFAHTrwb2/
         qxnHkpIGefVJAB1E4zlGpwqRV/4CndoPLs1bxIcciOGN6QYGF+CgiKmprWJvlK8xohL4
         4NWA==
X-Gm-Message-State: AOAM5302dR6qkg/+SjJas4ztzzsqbNBInulj/4lFYtUTLqz60WyGI7cV
        RkNWuO8JH9J8RvZTNd9MJdvVFkpC7i2YOo1CLalWmQ==
X-Google-Smtp-Source: ABdhPJyubHz666e94LPXPTqdQoqG+S7azHs313MTNWPbWKss8FLGCrVmPBocrKxyRUd8xjNGMizAMWugGNXjAbZtRBo=
X-Received: by 2002:ac2:4a66:: with SMTP id q6mr713798lfp.204.1626984557883;
 Thu, 22 Jul 2021 13:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210714124807.o22mottsrg3tv6nt@mobilestation>
 <YPfPDqJhfzbvDLvB@kroah.com> <20210721100220.ddfxwugivsndsedv@mobilestation>
 <YPf29+ewbrYgHxRP@kroah.com> <0064cb2c-5ca6-e693-2e89-8f045c8f7502@kernel.org>
 <YPf+shNM6cXb3mfe@kroah.com> <d853df77-8d36-30b0-dd26-da1bfcb068e0@kernel.org>
 <20210721112531.xvu6ni5ksaehsrjh@mobilestation> <CALAqxLViEqSO17P3JGRGYJh-wDoHaJiQQV48zeoRgnar4Xd5Bg@mail.gmail.com>
 <20210722181221.xh3r5kyu7zlcojjx@mobilestation> <YPnEO6NVFZDS1s//@yoga>
In-Reply-To: <YPnEO6NVFZDS1s//@yoga>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 22 Jul 2021 13:09:05 -0700
Message-ID: <CALAqxLUT0e+mHMVo685oVTxR8y76733cN0yciQ7ePS6GRE+_dg@mail.gmail.com>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 22, 2021 at 12:17 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> > On Jul 21, 2021, 1:45 PM +0200, Krzysztof Kozlowski wrote:
> > > I had impression that kernel defines interfaces which should be used and
> > > are stable (e.g. syscalls, sysfs and so on). This case is example of
> > > user-space relying on something not being marked as part of ABI. Instead
> > > they found something working for them and now it is being used in "we
> > > cannot break existing systems". Basically, AOSP unilaterally created a
> > > stable ABI and now kernel has to stick to it.
> > >
> > > Really, all normal systems depend on aliases or names and here we have
> > > dependency on device address. I proposed way how AOSP should be fixed.
> > > Anything happened? Nope.
> >
> > First time he sent a possible solution for the problem:
> > https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/
> >
> > To sum up you could have used one of the more portable approaches
> > 1. add an udc alias to the controller and use it then to refer to the
> > corresponding USB controller
>
> Is there such a thing as "UDC alias"? Or are you suggesting that we
> should add such feature?
>
> I think it would be wonderful if we could identify the UDCs on our
> boards as "USB1" and "USB2", or "the one and only USB-C connector". But
> unless that will fall back to the existing naming it would break John's
> _existing_ userspace.

Well, I'd not hold up the existing userspace I'm using as sacrosanct
(AOSP devices still usually don't have to work cross-kernel versions -
devboards being the main exception). I'm fine if we can rework
userland as proposed, so that the issues can be avoided, but I
honestly don't have enough context to really understand what that
looks like (no idea what udc aliases are).

And whatever we do, the main constraint is that userland has to be
able to work with existing LTS kernels and newer kernels.

> > 2. search through DT-nodes looking for a specific compatible/reg
> > DT-properties.
> >
>
> We could define that this is the way, but again we didn't yesterday so
> your proposal is not backwards compatible.

It may be backwards compatible, but I'm still not clear exactly how it
would work.

I guess if we look through all
sys/bus/platform/devices/*/of_node/compatbile strings for the desired
"snps,dwc3", then find which of the directories have the desired
address in the string? (The suggestion for looking at reg seems
better, but I don't get a char value out of the dwc3 of_node/reg
file).

It seems much more straightforward to do an `ls /sys/class/udc/$GADGET_ADDR.*`

But again, if folks decide the names can be rearranged to usb.<addr>
in the future, that would break too.

thanks
-john
