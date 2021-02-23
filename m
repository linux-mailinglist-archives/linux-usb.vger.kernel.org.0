Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90786322F88
	for <lists+linux-usb@lfdr.de>; Tue, 23 Feb 2021 18:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233729AbhBWRWv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Feb 2021 12:22:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbhBWRWp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Feb 2021 12:22:45 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FB9C061574
        for <linux-usb@vger.kernel.org>; Tue, 23 Feb 2021 09:22:05 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id h4so898518pgf.13
        for <linux-usb@vger.kernel.org>; Tue, 23 Feb 2021 09:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G0uZIqR5NGZgy6mztTeasD6R/M3MBQU4WSQP49fh9cc=;
        b=bkb40P8sgoygxrGGg9tebgaL9oo+HIBwbbnI7Of6Wfnj7rUV+nmk8L/zc54MLwt5+i
         0T+PjEhGfETVl+1pO6KZ1XlB4ZGApvLn2yjjs6EeE3Xb7S0mimAkOtWVSGpO5W2yl5Sn
         Hdw6s7akkiX4CXWg6KNy04sI+Sm2/Q/2Vx/S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G0uZIqR5NGZgy6mztTeasD6R/M3MBQU4WSQP49fh9cc=;
        b=JLnXxf3r2EM1F0bMsVdYke0otQ+ENbdFBvXmpcB0I4kHpkiNKoo7keQwzv6arRCTDM
         b8EWDno1RdnahkNhhR5fXYqX0fSWksgVFXNgA6I4i+NNk2guG+6PbxqL3HvCo7RVSNLG
         ZIPlnEz88dQbqwqF+Mp1ysZoA+u2YZZ8y0uePY9sdUPXIL7C5xUYlyIFvCTORDknR18F
         iUxMhC+Zyb4xnwPMx3syWtg1M64DbH6hpo4jGkhGvOreMwCsZQCQkbK/xorHNadB/yVE
         L+HBm32/UklvfGr5VXnM7jVJgA5y22/WWPNpj0bakq5PMJx/tl4nWsmGl1mMOFumW5FO
         WHDw==
X-Gm-Message-State: AOAM530qdz9fASkQFgQ6aGt3MzdEeV50irYEYCCcglqiMIVoEhj+04gy
        R9/d2MPOrQTgIMxmgvsNa1o9Ng==
X-Google-Smtp-Source: ABdhPJzjltN/OKyOgnlOMTimbH+m4++KgOpZ1e81/M8rnFu308uzCuKyPIwHsPxBtIn65Zm5vZ8B4A==
X-Received: by 2002:a63:1843:: with SMTP id 3mr25223809pgy.253.1614100925076;
        Tue, 23 Feb 2021 09:22:05 -0800 (PST)
Received: from localhost ([2620:15c:202:1:212d:9fc9:b1d0:a24])
        by smtp.gmail.com with UTF8SMTPSA id s1sm22393280pfe.151.2021.02.23.09.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 09:22:04 -0800 (PST)
Date:   Tue, 23 Feb 2021 09:22:02 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Honor wakeup enabled/disabled state
Message-ID: <YDU5ujJy5xiDXAJ3@google.com>
References: <20200915123123.1.I44954d9e1169f2cf5c44e6454d357c75ddfa99a2@changeid>
 <20200915235032.GB1893@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200915235032.GB1893@yoga>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ping

I noticed this was never picked up, can it be landed or are there any
concerns with this patch?

On Tue, Sep 15, 2020 at 06:50:32PM -0500, Bjorn Andersson wrote:
> On Tue 15 Sep 14:31 CDT 2020, Matthias Kaehlcke wrote:
> 
> > The dwc3-qcom currently enables wakeup interrupts unconditionally
> > when suspending, however this should not be done when wakeup is
> > disabled (e.g. through the sysfs attribute power/wakeup). Only
> > enable wakeup interrupts when device_may_wakeup() returns true.
> > 
> > Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 
> > ---
> > 
> >  drivers/usb/dwc3/dwc3-qcom.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index e1e78e9824b1..56d14c09506d 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -251,8 +251,10 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
> >  	for (i = qcom->num_clocks - 1; i >= 0; i--)
> >  		clk_disable_unprepare(qcom->clks[i]);
> >  
> > +	if (device_may_wakeup(qcom->dev))
> > +		dwc3_qcom_enable_interrupts(qcom);
> > +
> >  	qcom->is_suspended = true;
> > -	dwc3_qcom_enable_interrupts(qcom);
> >  
> >  	return 0;
> >  }
> > @@ -265,7 +267,8 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
> >  	if (!qcom->is_suspended)
> >  		return 0;
> >  
> > -	dwc3_qcom_disable_interrupts(qcom);
> > +	if (device_may_wakeup(qcom->dev))
> > +		dwc3_qcom_disable_interrupts(qcom);
> >  
> >  	for (i = 0; i < qcom->num_clocks; i++) {
> >  		ret = clk_prepare_enable(qcom->clks[i]);
> > -- 
> > 2.28.0.618.gf4bc123cb7-goog
> > 
