Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E22C589F5B
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 18:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236503AbiHDQZJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 12:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbiHDQZI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 12:25:08 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB0567145
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 09:25:07 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id h132so302703pgc.10
        for <linux-usb@vger.kernel.org>; Thu, 04 Aug 2022 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3wVsJA9REgYaA9xqxDVynsjE4mtxXkKRS8lurVV7Rd8=;
        b=j7IxrmwybnOOybGV1M8hTyPbW0g++4s3715LouwSbNkw72fTCLAP4AWnyrn13Ntcbh
         uSK3ST1fETadsvXDyfQJ0WseJ/4fqAD+0a9l8UzGMPbyPjvv1zoXylGKSxjZdad6TNyV
         7ZYo4E2gFwO7bdLcrZHlRM6BnriJJZEWtgRZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3wVsJA9REgYaA9xqxDVynsjE4mtxXkKRS8lurVV7Rd8=;
        b=3agN9366GU+gLDr4qgSx3Jc77SdK01PqK2waOhaAmWAVldLtcP9l7rmhE1HtgbsHU1
         G7A7q8E9btBBRPWOLxFUE9b+rVPwcUyZnJSF/9zuFo+zbiAybzMWCrjh4hTNstV6Cenv
         QvntoWMN4GgmnaTh5zPn0Lj2V19R9LH5NTtxRUiSSkGSStIhKQ9ZpiT6DpQq9VDj+R/+
         Mf9oSBu4S1HvkIfPmPQHCRwydh2i5NHzuVqTfaJGFBAYJD7Xicq24KkMo/yiGii3PGax
         7GEnA1FRo2BE4bETrmd4zDG6K56o0gdKVTU7Oqtz71scu3GZmvodB3C29YIhgn1p27Fa
         GevQ==
X-Gm-Message-State: ACgBeo3m9yScCHTZr32Xr4fMqJQc4AKKHubWnvBiS+CrvFB55+g2Kk3G
        IEuqHo0FvTvWi27571uhF57zSA==
X-Google-Smtp-Source: AA6agR4VqvkmGRVsnu/p8nE6quW5fqKSSYapdhXGs+labp3XwjT+la4kPogMITPJez/PHlt/EfBBEA==
X-Received: by 2002:a63:8ac3:0:b0:41b:ba48:e3f6 with SMTP id y186-20020a638ac3000000b0041bba48e3f6mr2151943pgd.567.1659630306651;
        Thu, 04 Aug 2022 09:25:06 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:87c4:32ca:84b6:e942])
        by smtp.gmail.com with UTF8SMTPSA id y1-20020a17090322c100b0016d93c84049sm1256747plg.54.2022.08.04.09.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 09:25:06 -0700 (PDT)
Date:   Thu, 4 Aug 2022 09:25:04 -0700
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
Message-ID: <Yuvy4CjCgs48nFnM@google.com>
References: <20220802151404.1797-1-johan+linaro@kernel.org>
 <20220802151404.1797-5-johan+linaro@kernel.org>
 <YurviWfzut9sursr@google.com>
 <Yut2tLqGfu82xcDs@hovoldconsulting.com>
 <YuvnLliIKLK71wx0@google.com>
 <YuvuJR0ZqSvwMSi1@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YuvuJR0ZqSvwMSi1@hovoldconsulting.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 04, 2022 at 06:04:53PM +0200, Johan Hovold wrote:
> On Thu, Aug 04, 2022 at 08:35:10AM -0700, Matthias Kaehlcke wrote:
> > On Thu, Aug 04, 2022 at 09:35:16AM +0200, Johan Hovold wrote:
> 
> > After enabling runtime suspend for the dwc3 core, dwc3 glue and the xHCI
> > the dwc3-qcom enters autosuspend when the delay expires.
> > 
> > > And the controller is resumed in the wakeup-interrupt handler for the
> > > runtime PM case.
> > >
> > > It seems to work ok, and it looks like the driver has supported this
> > > since it was first merged.
> > 
> > With and without your patch dwc3-qcom enters autosuspend and stays there.
> > USB devices like a mouse or a USB to Ethernet adapter keep working while
> > the glue is suspended.
> 
> Are you sure you're looking at the right controller? And that it is
> actually suspended?

Good point! My mind was set on a SC7180 system, which has a single dwc3
controller, but this time I was tinkering on a SC7280 board, which has
two dwc3, and obviously I was looking at the wrong one (－‸ლ)

> If you plug in a keyboard, enable autosuspend for all devices in the
> path (from glue to the keyboard device) and type away, then the
> controller must remain active. Stop typing, and all devices in the chain
> should suspend.

That's what I expected, and now that I'm looking at the right controller
I'm seeing it. I wondered whether the glue device was somehow special.

> > How is the runtime resume triggered for the dwc3 glue?
> 
> Either by the host driver when it needs to access the device, or by the
> device if it is remote-wakeup capable (e.g. a keyboard, but not
> necessarily a speaker).
> 
> Note that the latter part is what is broken currently as the wakeup
> interrupts were not enabled and those are needed to wake up sc8280xp 
> when the dwc3 glue has been runtime suspended.

Thanks for helping me to get a better understanding!
