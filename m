Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886F348CD49
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 21:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357782AbiALUvr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 15:51:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357760AbiALUvo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 15:51:44 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B77C061751
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 12:51:44 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id a7so3226056plh.1
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 12:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oP2xECK3jqBdvkGX0hGsK3lqWf4wO8IHTIIQlzl9xV0=;
        b=go0VIqj3WoGgVNblUj4B4WLTzg0PxEjFmQwtbzqnMOJC/F9Bo/wFDWoyLE0dbsjdHB
         coldoa/fGsktjsQjiCKnHHJE+EiXAfz3OCArE7wRQTF8YQfx0bvJzyr1K7D/yk8KjGXe
         rya2Zi8dKNG+opPse71wY+dyqIsh7bczGHRPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oP2xECK3jqBdvkGX0hGsK3lqWf4wO8IHTIIQlzl9xV0=;
        b=iaqJfax0V4Sxsuei0mk0p/kobs/6lMCBJcu26O0aw0A4YopwUCg4ohFOVogtQOmGvV
         F3oWHA3vAaQ/zljbIIH8v+j/6Dn+w6euYSqjGlkAGUpowy+CwlzSGvNKC7DiDYc+kgdU
         m+ZPbrb4xZIwTMowv/KG2yjuqiOuNzAuQxAitM8R7Vi7pFP+6rindbFKm4nqDpWKql34
         KpdX7WYPIeb0dlPVVzuwDqM9neMwkagCioXLeWJ+2MNp7zlI1inqx4h66ijZ4LEW2Gku
         sH3+2S+Ah6fecZ8TBDOmRu50zINThuckCb85cC0HgIdcvL9AEryqk1OItcKzBFHaah+b
         q0xQ==
X-Gm-Message-State: AOAM533BmmBMNcAwLdlABZlm+d/mPPsi3IzP4OQP3nNAkEMYtBye494c
        tcURxP7KIBnFsfXM7lW9iV4BSg==
X-Google-Smtp-Source: ABdhPJxnNSOW9L3MOKWhvTl5dDqgf06igl93+P7KOL/G2UMdszRHDjsCTcZlPgKLzKrTN0wPIapNjQ==
X-Received: by 2002:a65:6114:: with SMTP id z20mr1259114pgu.438.1642020703986;
        Wed, 12 Jan 2022 12:51:43 -0800 (PST)
Received: from localhost ([2620:15c:202:201:f6eb:5b26:28c:1ca5])
        by smtp.gmail.com with UTF8SMTPSA id gt22sm490651pjb.35.2022.01.12.12.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 12:51:43 -0800 (PST)
Date:   Wed, 12 Jan 2022 12:51:41 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
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
Subject: Re: [PATCH v19 5/5] arm64: dts: qcom: sc7180-trogdor: Add nodes for
 onboard USB hub
Message-ID: <Yd8/XdMuAVW0fM6e@google.com>
References: <20220112191048.837236-1-mka@chromium.org>
 <20220112111028.v19.5.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
 <CAE-0n51VZobLjRGZFYquEMgDutfmsAC0j8mj6cM7fvK7Myeczw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAE-0n51VZobLjRGZFYquEMgDutfmsAC0j8mj6cM7fvK7Myeczw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 12, 2022 at 12:47:15PM -0800, Stephen Boyd wrote:
> Quoting Matthias Kaehlcke (2022-01-12 11:10:48)
> > Add nodes for the onboard USB hub on trogdor devices. Remove the
> > 'always-on' property from the hub regulator, since the regulator
> > is now managed by the onboard_usb_hub driver.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> 
> One question below
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks!

> >  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 19 ++++++++-----------
> >  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 12 +++++-------
> >  .../dts/qcom/sc7180-trogdor-pompom-r1.dts     | 11 ++++-------
> >  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 19 ++++++++-----------
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 19 ++++++++++++++++++-
> >  5 files changed, 43 insertions(+), 37 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > index d4f4441179fc..cd31460b3bd6 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -202,7 +202,6 @@ pp3300_hub: pp3300-hub {
> >                 pinctrl-names = "default";
> >                 pinctrl-0 = <&en_pp3300_hub>;
> >
> > -               regulator-always-on;
> >                 regulator-boot-on;
> 
> Is regulator-boot-on necessary?

It tells the kernel that the regulator is already on at boot, and avoids an
off-on cycle that would happen otherwise (internal reference: b/185972336).
