Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE01F325553
	for <lists+linux-usb@lfdr.de>; Thu, 25 Feb 2021 19:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbhBYSQh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Feb 2021 13:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbhBYSQ3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Feb 2021 13:16:29 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D4BC061788
        for <linux-usb@vger.kernel.org>; Thu, 25 Feb 2021 10:15:49 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id b3so4766479qtj.10
        for <linux-usb@vger.kernel.org>; Thu, 25 Feb 2021 10:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h3fwbXygeyIRtetl3DiiCp4YUNibdxC6uA+4PbTm8ew=;
        b=iFa/j1SpISBk8SXub5LbKDZPN1y0LW0+uOxFmZ6XWwz/fGZFn//8rKYRpWk2HOdpw9
         CUGvDRRDG+IRLZNpCBqP2Lzn4dv3Mgzx+3EvFFodEb9qD8B64OOpQ2taYkxeSueXJ2BE
         aBHZkEiP6O471okysrdPd1mwM/fmzy2oGdons=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h3fwbXygeyIRtetl3DiiCp4YUNibdxC6uA+4PbTm8ew=;
        b=kAhWfZxZcyV7h2sXLUYh63qUMsmS21KvvNyYgida6y42A8IKWuRnOWHPvczGAbrJk+
         XlEa5XM3wDqIIdYL7NfDUWrFWalqK4xz6n2cat3KHzE6KV7yeE4dzpRoEjxDwPbfK9lz
         nUpX4DGMCUTRLPzrWJ+94yTSvFpN0R19uEBY+sQX+02NlDhwZSpoPcTzLyGkOTtYLxme
         xNjQ/Qz3bDzug8r6qQTB974iTnpjPC5nGXI/0o9w4c+OumNJgJsJONnUwt4XTEoJOM1R
         iqFFi30SiwpqD1hSEaU1o5Atspr0C5XaNcf7uCL0kKh54Tb+2qkvvdINpn8vdA42bUbX
         ClYw==
X-Gm-Message-State: AOAM5330g7yfiXE4GwMJzplPd3QKv9impNksMts4rgHm8WSVXp7xdRVm
        5lRcxhIEkWBqKullQCTeruyPL0jEDLL/Dg==
X-Google-Smtp-Source: ABdhPJwC2ZaG74+qofZmozprBrSYxXI1QbZcgxrkCZWPJ/JT0z9o6WOjqiuPW2ELw8sIrvJqRtDGpw==
X-Received: by 2002:ac8:37c1:: with SMTP id e1mr3582117qtc.280.1614276948476;
        Thu, 25 Feb 2021 10:15:48 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id a34sm4095153qtc.97.2021.02.25.10.15.45
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 10:15:47 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id d9so6353204ybq.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Feb 2021 10:15:45 -0800 (PST)
X-Received: by 2002:a25:d3c5:: with SMTP id e188mr5897553ybf.345.1614276945234;
 Thu, 25 Feb 2021 10:15:45 -0800 (PST)
MIME-Version: 1.0
References: <1603831083-2025-1-git-send-email-sanm@codeaurora.org> <1603831083-2025-5-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1603831083-2025-5-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Feb 2021 10:15:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VFtWkfP30bPZB9SO5KLX_OLVNw0Fv3efZMHEzRg7PtVQ@mail.gmail.com>
Message-ID: <CAD=FV=VFtWkfP30bPZB9SO5KLX_OLVNw0Fv3efZMHEzRg7PtVQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sc7180: Use pdc interrupts for
 USB instead of GIC interrupts
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Oct 27, 2020 at 1:38 PM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Using pdc interrupts for USB instead of GIC interrupts to
> support wake up in case of XO shutdown.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index a02776c..a2c56528 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2687,10 +2687,10 @@
>                                           <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>                         assigned-clock-rates = <19200000>, <150000000>;
>
> -                       interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts-extended = <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&pdc 8 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&pdc 9 IRQ_TYPE_LEVEL_HIGH>;

Is there any reason that this patch can't land?  I'm not sure what the
current status of everything is, but it should be fine to go through
the PDC anyway, right?

-Doug
