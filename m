Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C35C27D658
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 21:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgI2TBv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 15:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728215AbgI2TBs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 15:01:48 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D3AC0613D1
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 12:01:47 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id j19so2012531pjl.4
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 12:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7nARKy1YRpyTgSZxIUwrkU74pSG7aRsz7ayBIvLyxxw=;
        b=K5Jq8aHp/pcgYY6/QdkXX9JB1LeqtGy1prh//v+zPwiUaXTQzBa2VCuXLyIaZ3nJeL
         wW0cDksddcnfBWLBRQ5prkhoNZxxd0/Oy4PE35SdlJb/aqqbs454AE8WfY4X9NU1lMP2
         c/fOAFbu8A+hI7P88st8YAXAvJ1cbSXMt5R9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7nARKy1YRpyTgSZxIUwrkU74pSG7aRsz7ayBIvLyxxw=;
        b=KqYxDucGTC+HCJMl5xstfDPXH45YA5IzosfQeMKIS2jxnNdEGKY5KLNVBv37RqIKoo
         +e3+M0AFz3L12XW4uxUkqaaKeyuljV7TYo64Fnt5L0WldgCeZlI3iS8oer7SaQ2F/mnz
         Myd4PoQDamcEhaaxO5ZM9qtnPJTMMCg7gm5eXXDz54ujIVQaLkES5RamSKvoELbYXDtR
         K461zPyDHFm1MhGDQGFAsTozFc8WOXFX95JT2uPNlTjC6urR7vrfE8FKAgA9nx0QBsjS
         cUfsRHBS/nbf8ph+KWszUXltiFO8C6+ByK5eJHrd0EKxQjtVrPDBy6WMrqaQepTinJQz
         eJFA==
X-Gm-Message-State: AOAM532QRY+p1Hkgu/MSfh+sxcVgBNyncz2GOwkPfWicw6ngVxg2Rdqs
        M2rRrC7QImQoqy3OtQILjLTqEodcCy4oRQ==
X-Google-Smtp-Source: ABdhPJwB7K7TSZqFAymAj9u1ww16GuQvJSGxJcrJYqk3iQ+Nbhr/JctY+HTfM4yaTcGjCSTMeNnoqA==
X-Received: by 2002:a17:90a:7bcf:: with SMTP id d15mr5083857pjl.230.1601406106614;
        Tue, 29 Sep 2020 12:01:46 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id 64sm6245442pfz.204.2020.09.29.12.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 12:01:46 -0700 (PDT)
Date:   Tue, 29 Sep 2020 12:01:44 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 3/5] usb: dwc3: qcom: Configure wakeup interrupts and
 set genpd active wakeup flag
Message-ID: <20200929190144.GD1621304@google.com>
References: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
 <1601376452-31839-4-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1601376452-31839-4-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 29, 2020 at 04:17:30PM +0530, Sandeep Maheswaram wrote:
> Configure interrupts based on hs_phy_flag to avoid triggering of
> interrupts during system suspend and suspends successfully.
> Set genpd active wakeup flag for usb gdsc if wakeup capable devices
> are connected so that wake up happens without reenumeration.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 74 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 59 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index c703d55..b6f36bd 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -17,9 +17,11 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> +#include <linux/pm_domain.h>
>  #include <linux/usb/of.h>
>  #include <linux/reset.h>
>  #include <linux/iopoll.h>
> +#include <linux/usb/hcd.h>
>  
>  #include "core.h"
>  
> @@ -293,19 +295,33 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
>  
>  static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> +
>  	if (qcom->hs_phy_irq) {
>  		disable_irq_wake(qcom->hs_phy_irq);
>  		disable_irq_nosync(qcom->hs_phy_irq);
>  	}
>  
> -	if (qcom->dp_hs_phy_irq) {
> -		disable_irq_wake(qcom->dp_hs_phy_irq);
> -		disable_irq_nosync(qcom->dp_hs_phy_irq);
> -	}
> +	if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_LS) {
> +		if (qcom->dp_hs_phy_irq) {
> +			disable_irq_wake(qcom->dp_hs_phy_irq);
> +			disable_irq_nosync(qcom->dp_hs_phy_irq);
> +		}
> +	} else if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_HS) {
> +		if (qcom->dm_hs_phy_irq) {
> +			disable_irq_wake(qcom->dm_hs_phy_irq);
> +			disable_irq_nosync(qcom->dm_hs_phy_irq);
> +		}
> +	} else {
> +		if (qcom->dp_hs_phy_irq) {
> +			disable_irq_wake(qcom->dp_hs_phy_irq);
> +			disable_irq_nosync(qcom->dp_hs_phy_irq);
> +		}
>  
> -	if (qcom->dm_hs_phy_irq) {
> -		disable_irq_wake(qcom->dm_hs_phy_irq);
> -		disable_irq_nosync(qcom->dm_hs_phy_irq);
> +		if (qcom->dm_hs_phy_irq) {
> +			disable_irq_wake(qcom->dm_hs_phy_irq);
> +			disable_irq_nosync(qcom->dm_hs_phy_irq);
> +		}

This function would benefit from a helper like this:

static void dwc3_qcon_enable_wakeup_irq(int wake_irq)
{
	if (wake_irq) {
		disable_irq_wake(wake_irq);
		disable_irq_nosync(wake_irq);
	}
}

>  	}
>  
>  	if (qcom->ss_phy_irq) {
> @@ -316,19 +332,33 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> +
>  	if (qcom->hs_phy_irq) {
>  		enable_irq(qcom->hs_phy_irq);
>  		enable_irq_wake(qcom->hs_phy_irq);
>  	}
>  
> -	if (qcom->dp_hs_phy_irq) {
> -		enable_irq(qcom->dp_hs_phy_irq);
> -		enable_irq_wake(qcom->dp_hs_phy_irq);
> -	}
> +	if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_LS) {
> +		if (qcom->dp_hs_phy_irq) {
> +			enable_irq(qcom->dp_hs_phy_irq);
> +			enable_irq_wake(qcom->dp_hs_phy_irq);
> +		}
> +	} else if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_HS) {
> +		if (qcom->dm_hs_phy_irq) {
> +			enable_irq(qcom->dm_hs_phy_irq);
> +			enable_irq_wake(qcom->dm_hs_phy_irq);
> +		}
> +	} else {
> +		if (qcom->dp_hs_phy_irq) {
> +			enable_irq(qcom->dp_hs_phy_irq);
> +			enable_irq_wake(qcom->dp_hs_phy_irq);
> +		}
>  
> -	if (qcom->dm_hs_phy_irq) {
> -		enable_irq(qcom->dm_hs_phy_irq);
> -		enable_irq_wake(qcom->dm_hs_phy_irq);
> +		if (qcom->dm_hs_phy_irq) {
> +			enable_irq(qcom->dm_hs_phy_irq);
> +			enable_irq_wake(qcom->dm_hs_phy_irq);
> +		}
>  	}

Same as for _disable(), a helper would make this function more
digestable.

>  	if (qcom->ss_phy_irq) {
> @@ -341,6 +371,15 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>  	u32 val;
>  	int i, ret;
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> +	struct usb_hcd  *hcd;

nit: remove extra blank

> +	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
> +
> +	if (dwc->xhci) {
> +		hcd = platform_get_drvdata(dwc->xhci);
> +		if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> +			genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
> +	}

Do this after the check for 'qcom->is_suspended' below

>  
>  	if (qcom->is_suspended)
>  		return 0;
> @@ -366,6 +405,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  {
>  	int ret;
>  	int i;
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> +	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
> +
> +	if (dwc->xhci)
> +		genpd->flags &= ~GENPD_FLAG_ACTIVE_WAKEUP;

ditto

>  
>  	if (!qcom->is_suspended)
>  		return 0;
> @@ -764,7 +808,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto interconnect_exit;
>  
> -	device_init_wakeup(&pdev->dev, 1);
> +	device_init_wakeup(&pdev->dev, of_property_read_bool(np, "wakeup-source"));
>  	qcom->is_suspended = false;
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
> 
