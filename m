Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4C80BEB18
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 06:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfIZEGu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 00:06:50 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35179 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbfIZEGu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 00:06:50 -0400
Received: by mail-wr1-f67.google.com with SMTP id v8so982978wrt.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2019 21:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6O3te8B9v8EP6DXpJUILeaiDwfu4hKzbhFKk3O+2hIc=;
        b=v3tngBRzkkXSqdYaxFo8J7luIFDI39Ap3QuDsvssko/+ZHYvZuvrad7LKYrqWn91h+
         7PGLiYa+aajdMpuogbeUQG3uwqfjFeU0Uy2i/HscJCvA0DDmSPgZXvUedBp+XsButXN1
         popFqiRWQbu3GOuijlgg9In8sebmnJQlTBTfHZc73ic4kkFFJd73rxDM2TWM4a+ZWa0t
         pJ4BEH7j4LlPSfEru9bRZGRXRme/NKEG1OTinK8bg0lq9vfj3ejSGkacxvmU7QpQfYnr
         rEo4EewiFnPDtCfjV1o5V6SmGG4k7zRPL932ypV1FIv3YZpiFhK/hV1f9FuZtEDIC0fp
         0j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6O3te8B9v8EP6DXpJUILeaiDwfu4hKzbhFKk3O+2hIc=;
        b=i+n/XJTm8b/dCnKWZSAaeE41Vp4CU4QMPks3hZDva44wDfMIDnxCQzjp+/OwSA1Qi7
         ZW6Psk9TfJN2I/q9PVt9pbat+ulL0saPlKq3chsgtJv7IsRvCah2WJoJ56gqkE7HmrvQ
         CF2WtgNjwFg5+ndH7Ge96DYni5bh0hDJOTHRDJ2/qDbMESi66hqu3b6daoKW1NCfVTRJ
         tgQN6A8aZfSmEfwQRsA5K6MjaqkaOYQMbZYEVtGTwM7FvD/J+ic776DJcKlE3O5EQSwg
         wZlkayRreS9T5i12Hg3MfP0OeqgpFPHON6tL8ZBW763N1MMVSk3ys5w+oZtp3JIRlOAm
         HHKw==
X-Gm-Message-State: APjAAAXBqXk5DQozbNsluRcMYChyvZOWiVimolafvK2etic0iLL+8F/s
        DTtlZgHAZcr5B5QUvt62PtG4lvu+oXprN3VUNH+IBA==
X-Google-Smtp-Source: APXvYqxi/aX/Sa4He/GsphASBb2GpvqD6GZsxYhQ8cRbVT/ddgFXaL5HlvJdKn0pRwCVZ5q5FZsT6iLR5jdo5KkMGYs=
X-Received: by 2002:adf:d08b:: with SMTP id y11mr1171535wrh.50.1569470807953;
 Wed, 25 Sep 2019 21:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190925234224.95216-1-john.stultz@linaro.org>
 <20190925234224.95216-5-john.stultz@linaro.org> <1569461658.32135.12.camel@mhfsdcap03>
In-Reply-To: <1569461658.32135.12.camel@mhfsdcap03>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 25 Sep 2019 21:06:34 -0700
Message-ID: <CALAqxLX=csTtnqr2Hc9v_R8ex8zPj_P1JvSyjZXUKEqSaF=gPA@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: usb: dwc3: of-simple: add compatible for HiSi
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yu Chen <chenyu56@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 25, 2019 at 6:34 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> On Wed, 2019-09-25 at 23:42 +0000, John Stultz wrote:
> > +++ b/Documentation/devicetree/bindings/usb/hisi,dwc3.txt
> > @@ -0,0 +1,52 @@
> > +HiSi SuperSpeed DWC3 USB SoC controller
> > +
> > +Required properties:
> > +- compatible:                should contain "hisilicon,hi3660-dwc3" for HiSi SoC
> > +- clocks:            A list of phandle + clock-specifier pairs for the
> > +                     clocks listed in clock-names
> > +- clock-names:               Should contain the following:
> > +  "clk_usb3phy_ref"  Phy reference clk
> It's not good idea to apply phy's clock in dwc3's node

Hey! Thanks for taking a look at this!

So first, my apologies, I'm not the driver author and I don't have any
real specs on the hardware other then what's in the source tree I'm
working on.  Not the ideal person to be documenting the binding, but I
realized we still needed some binding documentation (although a few
other dwc-of-simple compat entries are undocumented), so this is my
rough stab at it. :/

Given the name clk_usb3phy_ref I'm assuming its a phy reference clock,
but I honestly don't know if I'm getting that wrong.  It all seems to
be leveraging the fact that the dwc-of-simple driver batch enables and
disables all the clocks w/o really looking at the names.

Do you have a recommendation for what would be best here? I suspect
it's necessary to enable/disable the clk in a similar path(though I'm
unfortunately traveling this week so I can't validate that). Do I try
to move the clk_usb3phy_ref clock enable/disable handling to somewhere
else?

thanks
-john
