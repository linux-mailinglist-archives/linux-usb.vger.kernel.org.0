Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 556946CBB76
	for <lists+linux-usb@lfdr.de>; Tue, 28 Mar 2023 11:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbjC1JtM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Mar 2023 05:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbjC1Jsm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Mar 2023 05:48:42 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5166184
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 02:47:27 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id l14so7547595pfc.11
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 02:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679996846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=piPjHGd12WixgK61+V7YhRi9SZUMX0Vvu8dsbOsxphg=;
        b=TPQ5RRkDkFmCVceW2iPn9l9r2bi2JfVLm4AdKN5HJdKUSWtlMk+2H4KNqudr16mPHc
         QmYVhuxoxHcdbX5EHhNjK9UvLiBrw4HRZVejh4WeRYMBxMgc6EGHAC9+R9xsiM2D2EMf
         gzcdZyCOqG4NURmviUD6yJzFb92CKDhnlMUq3v0AElBR4PfQmDi2ovNK+SDh7mZuDvDo
         OBzhYAh0/7kz2/9lZ549o//OneYwCa0g6szdjxEMd1xfhUxhijENNkf+Hu1icwwzzIik
         L0LR30NR/Ot2IUbOAKQxRTOrY2Ou8ItX9TpxTyns0E2oqTYby1Rdjiw5W+5piY0OI16U
         1N6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679996846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=piPjHGd12WixgK61+V7YhRi9SZUMX0Vvu8dsbOsxphg=;
        b=5aO1C3HWKnNnrsW+hYbLvZvFSbVGzCmNKaLvtISwREHe+QhWE7K6EHDWSn/Ks1U8SP
         PTIvbakJ9+W/z9IaCAL8tWVjLXmH0R8izNxWFET76xrX4IN4nkHPti5eHHs+14agI8tZ
         1uDhahtSDXYUdiWFhQLwp+Qg/pCM6MeRbiz4AmAO6CwGM/t7y4FimAlesbfUuOEzjcDT
         iPTmGmNTBOFngUb8dyYz3fq5MqHsARMP5X6ynbTndrWsNI4FbbuE1nf5iHcCrdt0dD8D
         Mty8Ql71PY+dfhQXuzH1CpRbWxX9K1yYXR1VScJC5CadCVyIx/OgQmFkN8jgmtvZvbOM
         Yvyg==
X-Gm-Message-State: AAQBX9fmJ6sLGA8kWYOqlvjHxuNaf+lD9IAuZPGOJZ1JYATapyf7Gsvg
        9dp9nHpHQiv6jxdB+Q+FjeY3
X-Google-Smtp-Source: AKy350b9wvdQNaDBS55c43MhMlfEEZdPTtC8n+WByLMzWJOkpLfttakY49dudNJEvxjgFMZ+pd4zhQ==
X-Received: by 2002:a62:1a8a:0:b0:624:1ab3:da1a with SMTP id a132-20020a621a8a000000b006241ab3da1amr13451756pfa.29.1679996846543;
        Tue, 28 Mar 2023 02:47:26 -0700 (PDT)
Received: from thinkpad ([117.202.191.80])
        by smtp.gmail.com with ESMTPSA id c22-20020aa78c16000000b006280ae74893sm14753038pfd.48.2023.03.28.02.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:47:26 -0700 (PDT)
Date:   Tue, 28 Mar 2023 15:17:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] usb: dwc3: qcom: Fix null ptr access during
 runtime_suspend()
Message-ID: <20230328094718.GB5695@thinkpad>
References: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
 <20230325165217.31069-4-manivannan.sadhasivam@linaro.org>
 <ZCKyFEc087xoypdo@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCKyFEc087xoypdo@hovoldconsulting.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 28, 2023 at 11:23:32AM +0200, Johan Hovold wrote:
> On Sat, Mar 25, 2023 at 10:22:15PM +0530, Manivannan Sadhasivam wrote:
> > When runtime PM is enabled during probe, the PM core suspends this driver
> > before probing the dwc3 driver. Due to this, the dwc3_qcom_is_host()
> > function dereferences the driver data of the dwc platform device which
> > will only be set if the dwc driver has been probed. This causes null
> > pointer dereference during boot time.
> 
> So this does not really appear to be an issue before your later patch
> which enables runtime PM at probe.
> 

right.

> But the layering violations we have in this driver are indeed fragile
> and should be fixed properly at some point.
> 
> > So let's add a check for dwc drvdata in the callers of dwc3_qcom_is_host()
> > such as dwc3_qcom_suspend() and dwc3_qcom_resume() functions. There is no
> > need to add the same check in another caller dwc3_qcom_resume_irq() as the
> > wakeup IRQs will only be enabled at the end of dwc3_qcom_suspend().
> > 
> > Note that the check should not be added to dwc3_qcom_is_host() function
> > itself, as there is no provision to pass the context to callers.
> > 
> > Fixes: a872ab303d5d ("usb: dwc3: qcom: fix use-after-free on runtime-PM wakeup")
> 
> This is not the right fixes tag in any case as this layering violation
> was first added by:
> 
> 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
> 
> which started accessing the dwc3 platform data and xhci host data from
> the glue driver (and broke gadget mode).
> 

ah, I missed it, thanks for spotting.

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index 959fc925ca7c..bbf67f705d0d 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -411,10 +411,11 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
> >  
> >  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> >  {
> > +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> >  	u32 val;
> >  	int i, ret;
> >  
> > -	if (qcom->is_suspended)
> > +	if (qcom->is_suspended || !dwc)
> >  		return 0;
> 
> I think we should try to keep the layering violations confined to the
> helper functions. So how about amending dwc3_qcom_is_host() and check
> for NULL before dereferencing the xhci pointer?
> 
> If the dwc3 driver hasn't probed yet, we're clearly not in host mode
> either...
> 

Well, that's what I initially did but then I reverted to this approach as
returning true/false from dwc3_qcom_is_host() based on the pointer availability
doesn't sound right.

For example, if we return true then it implies that the driver is in host mode
which is logically wrong (before dwc3 probe) even though there is no impact.

- Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்
