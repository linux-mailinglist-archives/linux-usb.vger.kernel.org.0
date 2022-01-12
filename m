Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48BA48CE28
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 23:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234026AbiALWAM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 17:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbiALWAK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 17:00:10 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA5AC06173F
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 14:00:09 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id w188so5139577oiw.13
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 14:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6NeOmXl9hUhNaWIitkpsIX1HglQL4/Owj/MEcqRWAcE=;
        b=LgJJxLL/G4XhpqPx4yhpZb1v+2Jgfc+QEgud+DaKHh/zc3NgMgFeXIhX9quxbToXT1
         Q0Do1sUyBhfJPGvZBSZUW6U53IoFBu7nHNG/Tj5jyqKFIqpYLpsl+esQYjUnQCo/sjY6
         kD6Dqg4E6B+u7XAx4hO2g/yrrGFjaxw2ZBfrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6NeOmXl9hUhNaWIitkpsIX1HglQL4/Owj/MEcqRWAcE=;
        b=grvJ6lq8auL8lt6iYQcQVvJ/pRQCEFDjyaGZrSajAQr7DGPLLNXjf454R8pSqQHOT1
         5gXCMiMKNcJAb6VMNOdJ4RYrvHj4pD2wkWP03XFl8cDeoy2UIpRkrVqVrqy0VbLrH8On
         HJ67w2PhrTHrde36ISIRJtyoJ+zLK9njUb+I2T1YzME0Z0LHQ6ivzxo9o2aFgixJsQzq
         RgVPnF9IbQtUBvVOnH7tWnyfXl2eKJEFK7OpwHUNe5fERvMkMdTnjnCnMpYMu98BeQDS
         qeCANwS6IJo2IAccFB0kbweRA3Ev5K3tlANaRiNMe04lKeELBpg2arlcOSBtJWOfT4xh
         ln1A==
X-Gm-Message-State: AOAM533Jcg2/jcO2LRjMnsrHvRJCbnGO9QPmVQ1VIetywqCDKxYw6+Mu
        J9/QzVmtJMvuBjv9vKD/HOwiqd/6458jfY+Ty59qXAd+swM=
X-Google-Smtp-Source: ABdhPJz+AWx6cmp8t/uUG2/GxehI8dLVJNeNKxV7HZRn6BYbAiO0lPgYs3R5xzVOtFYk5Ukl6Ky7xavpxW0f/9c+TTk=
X-Received: by 2002:a05:6808:cc:: with SMTP id t12mr149580oic.32.1642024809142;
 Wed, 12 Jan 2022 14:00:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Jan 2022 14:00:08 -0800
MIME-Version: 1.0
In-Reply-To: <Yd8/XdMuAVW0fM6e@google.com>
References: <20220112191048.837236-1-mka@chromium.org> <20220112111028.v19.5.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
 <CAE-0n51VZobLjRGZFYquEMgDutfmsAC0j8mj6cM7fvK7Myeczw@mail.gmail.com> <Yd8/XdMuAVW0fM6e@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 12 Jan 2022 14:00:08 -0800
Message-ID: <CAE-0n50TzwqM--3v7wOEP07f5x7Dk9zDayF8Q+O2MvXYWMaCBg@mail.gmail.com>
Subject: Re: [PATCH v19 5/5] arm64: dts: qcom: sc7180-trogdor: Add nodes for
 onboard USB hub
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        linux-usb@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Matthias Kaehlcke (2022-01-12 12:51:41)
> On Wed, Jan 12, 2022 at 12:47:15PM -0800, Stephen Boyd wrote:
> > Quoting Matthias Kaehlcke (2022-01-12 11:10:48)
>
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > index d4f4441179fc..cd31460b3bd6 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > @@ -202,7 +202,6 @@ pp3300_hub: pp3300-hub {
> > >                 pinctrl-names = "default";
> > >                 pinctrl-0 = <&en_pp3300_hub>;
> > >
> > > -               regulator-always-on;
> > >                 regulator-boot-on;
> >
> > Is regulator-boot-on necessary?
>
> It tells the kernel that the regulator is already on at boot, and avoids an
> off-on cycle that would happen otherwise (internal reference: b/185972336).

Got it! A comment here would be helpful so we know the BIOS leaves the
regulator on.
