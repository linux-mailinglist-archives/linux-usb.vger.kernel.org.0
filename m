Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E086589EC2
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 17:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239954AbiHDPfU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 11:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbiHDPfQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 11:35:16 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0193BE
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 08:35:14 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so81704pjf.5
        for <linux-usb@vger.kernel.org>; Thu, 04 Aug 2022 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YMwmJ3SYguFGWEp4hAm2rBYWGtLtJTCvpovU/AIVn0A=;
        b=Qtnq39uHyzvlwnd38DbC3LwcEUpjMXF+hgHHimscG103l15xTzdeAhdQsEhHrCXXc6
         jZmcYvbCNSHRH02uVnFirKaBpXJB1Nt7yHmZSmHLABRrEcxUe/GNWK5CbueaHG9IMAfR
         6mm9ZApgk6ZbXDRVcrk6xsfiBn9g5yH+QxTSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YMwmJ3SYguFGWEp4hAm2rBYWGtLtJTCvpovU/AIVn0A=;
        b=klm2udZNrPWgqpz3bid1rXAVN8NqD8TguiqKMuf0xPC6VFBiBDnrwQInZ3jHWJGhyB
         lL/V4L+LLNwVjeckaE/Fw1GccKVvYM/9Wkj2i8XPToCEuvrgNw8+Fh6ZbAM1UOpvMlu0
         ogU4iTJLkzVVIsiB/53I+5o2wRvyAskqUwnIyapB9R2O284z9Y1DdTxA130gy/68PkYM
         5yZsAf1Bl3M82/GFiWe93pvtHli0YK7IZ2eFcP2KH2aP6Re5CMLTRuZAo39uszAF2HmG
         z7QESRR0CXU1tuMEaBV3zfr+Gw6/+Kte2FrY1DwwMsJr9Q3WyZdYvOU2XXf3yYDKRD8U
         aoog==
X-Gm-Message-State: ACgBeo1ZTwh4xYFx09Ji62o/nyH7/sOigp3+N4eZtkDFhHF+Wi8R8HYI
        qm5Sl6B6NGNiMJQJPUsqwC2r7Q==
X-Google-Smtp-Source: AA6agR5eBcmtuswpC9ZyuRauPZ9fC4Eka3LZy92marD/sOH7rjs76EIMqw+kflXgFAwfE3jtieqwBA==
X-Received: by 2002:a17:902:a418:b0:16c:9ee2:8a02 with SMTP id p24-20020a170902a41800b0016c9ee28a02mr2453212plq.46.1659627313991;
        Thu, 04 Aug 2022 08:35:13 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:87c4:32ca:84b6:e942])
        by smtp.gmail.com with UTF8SMTPSA id j9-20020a17090a31c900b001ef7c7564fdsm3870037pjf.21.2022.08.04.08.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 08:35:13 -0700 (PDT)
Date:   Thu, 4 Aug 2022 08:35:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] usb: dwc3: qcom: fix runtime PM wakeup
Message-ID: <YuvnLliIKLK71wx0@google.com>
References: <20220802151404.1797-1-johan+linaro@kernel.org>
 <20220802151404.1797-5-johan+linaro@kernel.org>
 <YurviWfzut9sursr@google.com>
 <Yut2tLqGfu82xcDs@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yut2tLqGfu82xcDs@hovoldconsulting.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 04, 2022 at 09:35:16AM +0200, Johan Hovold wrote:
> On Wed, Aug 03, 2022 at 02:58:33PM -0700, Matthias Kaehlcke wrote:
> > On Tue, Aug 02, 2022 at 05:14:00PM +0200, Johan Hovold wrote:
> > > A device must enable wakeups during runtime suspend regardless of
> > > whether it is capable and allowed to wake the system up from system
> > > suspend.
> > > 
> > > Fixes: 2664deb09306 ("usb: dwc3: qcom: Honor wakeup enabled/disabled state")
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > 
> > Ah, I wasn't aware that the same wakeup mechanism is used in runtime suspend.
> > 
> > In how far is runtime PM actually supported/used by this driver? The device is
> > set 'active' in _probe(), and there are no other pm_runtime_* calls, except
> > in dwc3_qcom_remove() and qcom_dwc3_resume_irq(). How does the device get from
> > 'active' into 'suspended'?
> 
> It will be runtime suspended when the child (core) device suspends, but
> you need to enable runtime PM through sysfs first.

Thanks for the clarification.

After enabling runtime suspend for the dwc3 core, dwc3 glue and the xHCI
the dwc3-qcom enters autosuspend when the delay expires.

> And the controller is resumed in the wakeup-interrupt handler for the
> runtime PM case.
>
> It seems to work ok, and it looks like the driver has supported this
> since it was first merged.

With and without your patch dwc3-qcom enters autosuspend and stays there.
USB devices like a mouse or a USB to Ethernet adapter keep working while
the glue is suspended.

How is the runtime resume triggered for the dwc3 glue?

Sorry if my questions are very basic, so far I haven't dealt much with
autosuspend and I'm trying to get a better understanding in the context
of the dwc3 and why it is currently broken.
