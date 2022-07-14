Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB88B575238
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jul 2022 17:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239855AbiGNPxa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jul 2022 11:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239565AbiGNPx2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jul 2022 11:53:28 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC8DF3336B
        for <linux-usb@vger.kernel.org>; Thu, 14 Jul 2022 08:53:23 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id 70so2245300pfx.1
        for <linux-usb@vger.kernel.org>; Thu, 14 Jul 2022 08:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZBd4r22P3S5NaKuR6XVziR9vG211MsAXtwsMdTQStQQ=;
        b=ng67+ylnXyvJiBefJVHCVzTsciO8XTwCC3ISDHKOwW3gL60Ur3uVSDF6JHP0MPqaqH
         bkqoJl1MLEQDIXsubX203LlQG8Qbf+3FYyxD12mqGyN5Dhlstl26p08WyuKOLJcFCFBQ
         lEbFR9x9ZL4rZ1o5/GadMY4gIOdV11rAkDPHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZBd4r22P3S5NaKuR6XVziR9vG211MsAXtwsMdTQStQQ=;
        b=sp7b94zkq/kqC+C0zde6PHRm2Me5hpUBrDl+GJNHVrej2TimJV0VuMBZrsV6iMFLuG
         QGzel08MetNjckY5J7noDZTzCqeyA9ZHilXviX4jDgGvvz1bjySF14DThR78BgpWeAo9
         qRxinN0yMDI9w5V3h0MLRRQD8YzpRkbqDmh3FUcZ4iOapCgRTzoOWNMC8nhqvHm1mnfj
         U5RkUL4NydeUzorZE3ySUrwNfYnzoQBfJkpd5zNfHemvcm5C64aD33GatHbS+aGtOIhQ
         aYF4Fn3xeKLTa4rBvHPNbJq+vJ8APrggn5RM4VJK/DTT583WAg+kOALaqfPr5Xl1yNVF
         vuiQ==
X-Gm-Message-State: AJIora87JyT3CZzO5OSe8MfPQtpHiVVST7N6RnawNOnHMBxCIHfEB66I
        M5MDLGBEtTSKu67zKUbmQoQ+eA==
X-Google-Smtp-Source: AGRyM1sO+tIvHLOuAapcBRa/ZpvT494amA9pDJnX4REOEo+ftI5iF1dbwqkUM1KpL5Y3GFQgTvBgZg==
X-Received: by 2002:a63:293:0:b0:412:4f02:950f with SMTP id 141-20020a630293000000b004124f02950fmr8001392pgc.187.1657814003468;
        Thu, 14 Jul 2022 08:53:23 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:f9cb:38e0:c8f1:abe1])
        by smtp.gmail.com with UTF8SMTPSA id w75-20020a627b4e000000b005251f4596f0sm1860488pfc.107.2022.07.14.08.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 08:53:22 -0700 (PDT)
Date:   Thu, 14 Jul 2022 08:53:21 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Defer dwc3-qcom probe if dwc3 isn't
 probed properly
Message-ID: <YtA78UfeibaQW4pf@google.com>
References: <1657810516-31143-1-git-send-email-quic_kriskura@quicinc.com>
 <YtAv8R7QlTZCjvRO@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YtAv8R7QlTZCjvRO@kroah.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 14, 2022 at 05:02:09PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jul 14, 2022 at 08:25:16PM +0530, Krishna Kurapati wrote:
> > On SC7180 devices, it is observed that dwc3 probing is deferred
> > because device_links_check_suppliers() finds that '88e3000.phy'
> > isn't ready yet.
> > 
> > As a part of its probe call, dwc3-qcom driver checks if dwc3 core
> > is wakeup capable or not. If the dwc3 core is wakeup capable, driver
> > configures dwc-qcom's power domain to be always ON. Also it configures
> > dp/dm interrupts accordingly to support wakeup from system suspend.
> > 
> > More info regarding the same can be found at:
> > commit d9be8d5c5b03 ("usb: dwc3: qcom: Keep power domain on to retain controller status"
> > commit 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
> > 
> > In the event, dwc3 probe gets deferred and is processed after dwc3-qcom
> > probe, driver ends up reading the wakeup capability of dwc3 core as false
> > leading to instability in suspend/resume path.
> > 
> > To avoid this scenario, ensure dwc3_probe is successful by checking
> > if appropriate driver is assigned to it or not after the of_platform_populate
> > call. If it isn't then defer dwc3-qcom probe as well.
> > 
> > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > ---
> >  drivers/usb/dwc3/dwc3-qcom.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index 7703655..096d1414 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -722,6 +722,9 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
> >  		dev_err(dev, "failed to get dwc3 platform device\n");
> >  	}
> >  
> > +	if (!qcom->dwc3->dev.driver)
> > +		return -EPROBE_DEFER;
> > +
> 
> Why not limit this check to a device type like your changelog mentions?

It is not an sc7180 specific issue. It can occur on any platform where the
dwc3 core has supplies that aren't ready when the dwc3-qcom driver probes.

It won't blow up right away since it requires 'wakeup-source' to be set for
the dwc3 core, which currently is only the case for 'usb@a600000' of the
sc7280 AFAIK (I set it for sc7180 in my tree for testing, which is when I
found the issue this patch intends to address).
