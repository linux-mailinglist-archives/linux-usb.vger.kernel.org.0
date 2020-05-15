Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3EB1D4498
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 06:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgEOE05 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 00:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726221AbgEOE05 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 00:26:57 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DD3C05BD09
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 21:26:55 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id n18so396484pfa.2
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 21:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P+pFPRWA9B/MIZUT1UfZLMRI5u90O++PiGPfW86wNGc=;
        b=Qehsqj/iSB/g6hTTGxsUEEaFmBtK0jsrsSwkElDkmAjSI3imx6JQ92Q7DvhOV6VgkJ
         lj5KMia9fQAj0gdMDNqvgubQjY6bwSw5NjFaMM+NkgmO19RUub62QKXUCemF2e4rlhUA
         7w1HuuVOuBVSaOHoCp9tTBfCowZFH+4dJX1Mj89WATIFneMUKX18Ta1f9q3olo6n7uaP
         75SGmW6mTpPwbhq8+jEjDWlEsn5RS27e6+XI2ZL9TCKMpzD7bu4Bjmio71nLgROKVELG
         HnfzbCfwZhwnb7CGRb0gGSdVOWqS1ek++NNo9T3qn4EcFbJRHvASjlXUutguDCz9TVRP
         puRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P+pFPRWA9B/MIZUT1UfZLMRI5u90O++PiGPfW86wNGc=;
        b=QNGqI3Y462ukfePXDPMTartz+uDD6K8iB6r/JPyvnMm/4tbo8hrOpLEp8BIigRbcbL
         QEG6NbYG0gVmdxX4rhZ2Ihq+pq7JoLP4RDguKySu0kFHvo924aN8+fLg5tAdOqx+8qVw
         dRU6vTdMZvm7tRX5NiNg7leb7sIQtv2IkETxChQD6Y+KlraVeT+j5q3AP1GYCL8XdytY
         P70Us5qst6kyO8e0ylOygaEd0Rf1e2eNqZfprtx0+XeLJmjilbOZ+N+6yxXpwUR7/nZe
         mYv5XG5ssKWE54HBE14Dk7RhLsvhvGP+56SjW8551Jok106t4UM47TrzuUdicRgi8dbR
         80kQ==
X-Gm-Message-State: AOAM531tDch/nfuygWN3KSL9A7XiF15gGXluMwN3RNbm39Mvk5+ijwoj
        lHXa29/4XKGfPh6XM+KyguKelQ==
X-Google-Smtp-Source: ABdhPJzGFW3Au6qy/392DkS+OHUt23t2c0amaCec/oEuHEA3pKAmr/TetWbyLeM3Xs2arUGS/yix2w==
X-Received: by 2002:a63:e242:: with SMTP id y2mr1353924pgj.205.1589516814560;
        Thu, 14 May 2020 21:26:54 -0700 (PDT)
Received: from localhost ([122.167.130.103])
        by smtp.gmail.com with ESMTPSA id g43sm444728pje.22.2020.05.14.21.26.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 21:26:53 -0700 (PDT)
Date:   Fri, 15 May 2020 09:56:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Manu Gautam <mgautam@codeaurora.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" 
        <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200515042651.3z2zfeirz3u3xxwk@vireshk-i7>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <878shu4uwk.fsf@kernel.org>
 <875zcy4uuj.fsf@kernel.org>
 <20200514171352.GP4525@google.com>
 <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org>
 <CAKohpon+JBpV3fC7j=rhc1R4gi_mVG6teBDrE8Yryd4QXfw9bw@mail.gmail.com>
 <20a2adc5-4153-1447-0542-908b7996c187@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20a2adc5-4153-1447-0542-908b7996c187@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15-05-20, 09:53, Manu Gautam wrote:
> Hi,
> 
> On 5/15/2020 9:27 AM, Viresh Kumar wrote:
> > On Fri, 15 May 2020 at 02:33, Georgi Djakov <georgi.djakov@linaro.org> wrote:
> >
> >> ---8<---
> >> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> >> index 206caa0ea1c6..6661788b1a76 100644
> >> --- a/drivers/usb/dwc3/Kconfig
> >> +++ b/drivers/usb/dwc3/Kconfig
> >> @@ -129,6 +129,7 @@ config USB_DWC3_QCOM
> >>         tristate "Qualcomm Platform"
> >>         depends on ARCH_QCOM || COMPILE_TEST
> >>         depends on EXTCON || !EXTCON
> >> +       depends on INTERCONNECT || !INTERCONNECT
> > Again, as I said yesterday. This looks incorrect and may not fix the problem..
> >
> > With this we will be able to select USB_DWC3_QCOM even when INTERCONNECT=m.
> 
> DWC3_QCOM in that case would be 'm' if INTERCONNECT =m and
> that should be fine?

Ahh, I was speaking in context of PM_OPP where it is a bool. Perhaps
this works just fine with DWC3_QCOM, sorry for the confusion.

-- 
viresh
