Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBBA446C20E
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 18:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240204AbhLGRts (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 12:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235430AbhLGRtr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 12:49:47 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF232C061574
        for <linux-usb@vger.kernel.org>; Tue,  7 Dec 2021 09:46:16 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id x6so18013744iol.13
        for <linux-usb@vger.kernel.org>; Tue, 07 Dec 2021 09:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y/6zTAyVv/z+aWbd0b0DW3DGaL6n4I9+Vw0UanLearM=;
        b=NN2e7g6ksmtwR2dTQjJDioQvX5LXDpR3sDua1phHBIiki93TmmcNcp/94/Y+LuIZQx
         vJtvye6PQmyLHDUdck+pv5U1cOdtNdWYH1PnPBNjEmLdAp/GhrHSPpw7wtbHs3B+Gpoe
         RDy94vfzCPasH9HUtfJGXfkMVgw8b+A6WWYh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y/6zTAyVv/z+aWbd0b0DW3DGaL6n4I9+Vw0UanLearM=;
        b=SPSIZY7E7mD4vC+Kw5AZJKDYbikTFxHzVJGF4ZqSJVqI7KD8c6WiIcY4ZDx43nDS6p
         CADqcU1k/IIcyenl0PckyxdDCXUvSncrB+LIzvlySwkMNkMoX1l9VDbwM5voRAmCdkn1
         A9VGg7RNgQtQACSiMXpFS/Z35tVeL42brySSIcSP+XicvRqXzk9PBbNu8caPrmJOSfsk
         UjNBohHiKJTJJV4FfdQfXSLGh91jBalgShgTc9xtb/HQtUgxSplZQsHfAPTlAcVobKw4
         4NvR70xyxCJmF1pl/5cCCWolU7ufEE42s5oOOchDLHTqEAQp0iRJ2otJw+LcHntcq2vp
         wx6w==
X-Gm-Message-State: AOAM533IOEL5HJKRWXWjJPYuPkHNLktIr4mFBMO2A2pvdmAoHrYoD3+s
        9v+20LReLZP/K2zZf1vhkw4I5pJnl5FgeA==
X-Google-Smtp-Source: ABdhPJx2beWpV2qqiU91ELaAs9TPez71Gg8QOzV6w007Z3ktyALIEfaRjAr1f0OcIAWGLhkv9he5cw==
X-Received: by 2002:a05:6602:2c83:: with SMTP id i3mr911532iow.54.1638899175597;
        Tue, 07 Dec 2021 09:46:15 -0800 (PST)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id t6sm202456ios.13.2021.12.07.09.46.15
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 09:46:15 -0800 (PST)
Received: by mail-io1-f50.google.com with SMTP id k21so18169227ioh.4
        for <linux-usb@vger.kernel.org>; Tue, 07 Dec 2021 09:46:15 -0800 (PST)
X-Received: by 2002:a05:6638:252:: with SMTP id w18mr52054124jaq.54.1638899174649;
 Tue, 07 Dec 2021 09:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20211206152844.1.I411110cc99c1dd66b01aa9aa25651acf8ff55da1@changeid>
 <CAE-0n50n=JZEqz5aQW4FQwjO9eFN56vTmBrQ6qBWduFY5jNPJA@mail.gmail.com> <Ya7H+COf/Hbk6g5M@ripper>
In-Reply-To: <Ya7H+COf/Hbk6g5M@ripper>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Dec 2021 09:46:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vzf8H=+MAMA895Csb1aU9h6LR8afOut2WqdUvKjF7QgA@mail.gmail.com>
Message-ID: <CAD=FV=Vzf8H=+MAMA895Csb1aU9h6LR8afOut2WqdUvKjF7QgA@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: dwc3-qcom: Avoid use-after-free when USB
 defers or unbinds
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>, robdclark@chromium.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Dec 6, 2021 at 6:32 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 06 Dec 16:37 PST 2021, Stephen Boyd wrote:
> > Quoting Douglas Anderson (2021-12-06 15:28:47)
> [..]
> > > +                       goto node_put;
> > > +               }
> > >
> > > -       prop->name = "tx-fifo-resize";
> > > -       ret = of_add_property(dwc3_np, prop);
> >
> > I don't understand why we can't tell dwc3 that we want to use
> > tx-fifo-resize without adding a DT property. DT isn't the only way we
> > could probe this qcom dwc3 device, there's also ACPI. And in dwc3 core
> > where we check for this property couldn't we add a compatible check for
> > qcom,dwc3 and then force the property? I see that a lot of this was
> > already discussed when these patches got applied by gregkh directly[1].
> >
>
> When the tx-fifo-resize property was introduced I made an effort to
> convince the people involved about the prospect of passing this
> information in the code, rather than using DT as some sort of parameter
> store to pass information between the devices.
>
> And I still would like us to come up with some sort of code-level
> mechanism for passing some state between dwc3-qcom and the dwc3-core,
> because I really want to register some callback with the core so that we
> don't need to duplicate extcon and usb_role_switch in both the core and
> platform glue.
>
> See this discussion:
> https://lore.kernel.org/linux-arm-msm/YSZCmDEedJaJyI0u@ripper/
>
> > Can we revert out this bad code instead?
> >
>
> You definitely have my vote for that!

Sure. I've posted a revert up, so either the revert or ${SUBJECT}
patch will fix the problem. For the revert, see:

https://lore.kernel.org/r/20211207094327.1.Ie3cde3443039342e2963262a4c3ac36dc2c08b30@changeid

-Doug
