Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22FD5228C48
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 00:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731219AbgGUW4A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 18:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730872AbgGUW4A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 18:56:00 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4ADCC0619DD
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 15:55:59 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x9so22307plr.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J82NzWlUX3fpB1BpFP7R77MeVZrYWqkjjAO7NECdlrY=;
        b=JU9N1RcOu3kcP49Q05uh7HoTXcA9kH4g53m3Nvh7PyKn9OeLl9dwuDYKl17smPIayq
         BJUgjZnySjsbJ5K53SK1kffozbK7q5fGJvO5wNqPy0VIePoXQ+x97wS4OQmqQEDtEs3f
         1VwXt+mYryfN0m3jaT92OFvfCsor4MWgXedX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J82NzWlUX3fpB1BpFP7R77MeVZrYWqkjjAO7NECdlrY=;
        b=jWCbQXaGn6aG5apAyo9550io7pMpt0IHC6Bs5k9p41VG7EIodHe30Y1SqXgcPXjcPt
         qP7aWtGGsUCYETt9Zk26IRo3KXsX3mFAjBJWX2DTWEVL/pUJTQZlwQ7oS5d27UhVnPM+
         lM/44wMQV5q+JL01mlDo1o/IZR9bgtt1M8bidbCDxb6pEMHCjlavF9op7d6Uqz46pSax
         kfWaew0RrU1wpSeRaxfZFw4wEa3AIpsoV5zGGmTHsDIYG9KABMEHh5cUsZ6t/cYK6Pxk
         Ez8uvw9/Pg5fJJVkGqfV+p9qA+pvDqrkVTf5u1puw3U5eK3X6twQv6FIeK6DPFlOBoot
         P1AA==
X-Gm-Message-State: AOAM530hfmO3mCiajR72+tVwlE9nq5lLBMyIDC3JhoLeoEgRMmpZN661
        Pzg7g2NogtxjgJjiIiuhutw9tQ==
X-Google-Smtp-Source: ABdhPJxsVDU3GYw5OrlGWmVnESwe7C5Qm+Xjt5tGMd8BDbFagsYYeNQCmDx+cpXhJ2UqwTDqAfDOtw==
X-Received: by 2002:a17:90a:21ef:: with SMTP id q102mr7298903pjc.101.1595372159197;
        Tue, 21 Jul 2020 15:55:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id g30sm22072092pfq.189.2020.07.21.15.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 15:55:58 -0700 (PDT)
Date:   Tue, 21 Jul 2020 15:55:57 -0700
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
Subject: Re: [PATCH v2 2/3] usb: dwc3: qcom: Configure wakeup interrupts and
 set genpd active wakeup flag
Message-ID: <20200721225557.GX3191083@google.com>
References: <1594235417-23066-1-git-send-email-sanm@codeaurora.org>
 <1594235417-23066-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1594235417-23066-3-git-send-email-sanm@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sandeep,

On Thu, Jul 09, 2020 at 12:40:16AM +0530, Sandeep Maheswaram wrote:
> configure interrupts based on hs_phy_flag. Set genpd active wakeup flag
> for usb gdsc if wakeup capable devices are connected.

as Stephen remarked, please describe why this patch is doing what
it is doing.

> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 73 ++++++++++++++++++++++++++++++++++----------
>  1 file changed, 57 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 1dfd024..8902670 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -16,9 +16,11 @@
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
> @@ -192,21 +194,34 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
>  
>  static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> +
>  	if (qcom->hs_phy_irq) {
>  		disable_irq_wake(qcom->hs_phy_irq);
>  		disable_irq_nosync(qcom->hs_phy_irq);
>  	}

nit: add empty line

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
>

delete empty line

> -	if (qcom->dp_hs_phy_irq) {
> -		disable_irq_wake(qcom->dp_hs_phy_irq);
> -		disable_irq_nosync(qcom->dp_hs_phy_irq);
> -	}
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
>  	}
> -
>  	if (qcom->ss_phy_irq) {
>  		disable_irq_wake(qcom->ss_phy_irq);
>  		disable_irq_nosync(qcom->ss_phy_irq);
> @@ -215,21 +230,34 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> +
>  	if (qcom->hs_phy_irq) {
>  		enable_irq(qcom->hs_phy_irq);
>  		enable_irq_wake(qcom->hs_phy_irq);
>  	}

nit: add empty line

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
>

delete empty line

> -	if (qcom->dp_hs_phy_irq) {
> -		enable_irq(qcom->dp_hs_phy_irq);
> -		enable_irq_wake(qcom->dp_hs_phy_irq);
> -	}
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
> -
>  	if (qcom->ss_phy_irq) {
>  		enable_irq(qcom->ss_phy_irq);
>  		enable_irq_wake(qcom->ss_phy_irq);
> @@ -240,6 +268,14 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>  	u32 val;
>  	int i;
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> +	struct usb_hcd  *hcd = platform_get_drvdata(dwc->xhci);
> +	struct generic_pm_domain *genpd; 
> +
> +	genpd = pd_to_genpd(qcom->dev->pm_domain);

nit: assign in declaration?

> +
> +	if (genpd && usb_wakeup_enabled_descendants(hcd->self.root_hub))
> +		genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
>  
>  	if (qcom->is_suspended)
>  		return 0;
> @@ -261,6 +297,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  {
>  	int ret;
>  	int i;
> +	struct generic_pm_domain *genpd;
> +
> +	genpd = pd_to_genpd(qcom->dev->pm_domain);
> +	if (genpd)
> +		genpd->flags &= !GENPD_FLAG_ACTIVE_WAKEUP;

  			     	~GENPD_FLAG_ACTIVE_WAKEUP; ?
