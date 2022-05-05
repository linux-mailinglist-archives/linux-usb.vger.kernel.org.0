Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00C2F51CC4F
	for <lists+linux-usb@lfdr.de>; Fri,  6 May 2022 00:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386475AbiEEWwP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 18:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349254AbiEEWwO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 18:52:14 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E515DD1C
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 15:48:33 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id cx11-20020a17090afd8b00b001d9fe5965b3so9249700pjb.3
        for <linux-usb@vger.kernel.org>; Thu, 05 May 2022 15:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dOvtahK956Ivo+8wYfwH4F2X00Zrm/MhoFWEgCAUD/s=;
        b=B7YNLeILdO7JIZFMjaI+Xd8odazymDoK4JVXXm9WjQBUXwPcVdvv181pdkz8Rfur+F
         FUzUwcFS19U1qZci1rlkeuziHXEPZn8EAndNdzobYO4AIDtnHzXFv13BJUBdHRo3Xh7Z
         NmBdNrIz0woYjhvJcS49lKoQ6idyX5XwFdNjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dOvtahK956Ivo+8wYfwH4F2X00Zrm/MhoFWEgCAUD/s=;
        b=ULWA/6NNg8UHhyZ1Q2z5Kv2bRZeItWBjrWVGNw2E63EEGa5kGnURaIiCmdDU8VA/+t
         L1f6c0Sd7+sIT9237Y8sQIZeR6j3zHqvcaihGqPv3N/EPcFlCRYO23WKFzlo3d19coBu
         MlqHlFppFWe6fuXuNTDH0TsmDo4iqv5Csm6etpHzMvvj3GBhusBDCmpCESkWKs37q8i/
         ya3cX3fbGVLBjM1ZhVoYDaRMsdbMQ5OKG9mIcIMBw8rPyNP3ju5DzAw0KIfRG+84rXiJ
         mFwKZ3FSC2+sa3lVe9A9YrwGL3Kehtr8945KOlgrDONn+4w03sMFhwuL3iC8AZNMIdHZ
         uzxw==
X-Gm-Message-State: AOAM530fKnsPvjlzntWNjostds8Wn/N2n/7IOPCw7otowBKh4dCeXgKj
        HC8UzrRKC+4KjlvXsfrH3R8X+Q==
X-Google-Smtp-Source: ABdhPJwji52geo2qkgFpp9fgSwaUVZ9VbcOfLrtQ81fQp2II80rTvMrsuXG7lN58lVPelZ2IgJ9q+g==
X-Received: by 2002:a17:902:f64e:b0:14d:20db:8478 with SMTP id m14-20020a170902f64e00b0014d20db8478mr485373plg.158.1651790913052;
        Thu, 05 May 2022 15:48:33 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:5605:d5cd:699b:1b26])
        by smtp.gmail.com with UTF8SMTPSA id 2-20020a621702000000b0050dc76281f6sm1876448pfx.208.2022.05.05.15.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 15:48:32 -0700 (PDT)
Date:   Thu, 5 May 2022 15:48:31 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: Re: [v15 3/6] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YnRUPxBZB55TPmf2@google.com>
References: <1651740973-7944-1-git-send-email-quic_kriskura@quicinc.com>
 <1651740973-7944-4-git-send-email-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1651740973-7944-4-git-send-email-quic_kriskura@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 05, 2022 at 02:26:10PM +0530, Krishna Kurapati wrote:
> From: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> 
> During suspend read the status of all port and set hs phy mode
> based on current speed. Use this hs phy mode to configure wakeup
> interrupts in qcom glue driver.
> 
> Check wakeup-source property for dwc3 core node to set the
> wakeup capability. Drop the device_init_wakeup call from
> runtime suspend and resume.
> 
> Also check during suspend if any wakeup capable devices are
> connected to the controller (directly or through hubs), if there
> are none set a flag to indicate that the PHY is powered
> down during suspend.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c | 33 ++++++++++++++++++++-------------
>  drivers/usb/dwc3/core.h |  4 ++++
>  drivers/usb/dwc3/host.c | 24 ++++++++++++++++++++++++
>  3 files changed, 48 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 950e238..cf377f5 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -33,6 +33,7 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/of.h>
>  #include <linux/usb/otg.h>
> +#include <linux/usb/hcd.h>

This is not needed anymore

>  
>  #include "core.h"
>  #include "gadget.h"
> @@ -1787,6 +1788,7 @@ static int dwc3_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, dwc);
>  	dwc3_cache_hwparams(dwc);
> +	device_init_wakeup(&pdev->dev, of_property_read_bool(dev->of_node, "wakeup-source"));
>  
>  	spin_lock_init(&dwc->lock);
>  	mutex_init(&dwc->mutex);
> @@ -1936,6 +1938,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  {
>  	unsigned long	flags;
>  	u32 reg;
> +	struct usb_hcd  *hcd = platform_get_drvdata(dwc->xhci);

This isn't used anymore, delete it

>  
>  	switch (dwc->current_dr_role) {
>  	case DWC3_GCTL_PRTCAP_DEVICE:
> @@ -1948,10 +1951,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg)) {
> -			dwc3_core_exit(dwc);
> -			break;
> -		}
> +		dwc3_check_phy_speed_mode(dwc);
>  
>  		/* Let controller to suspend HSPHY before PHY driver suspends */
>  		if (dwc->dis_u2_susphy_quirk ||
> @@ -1967,6 +1967,16 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  
>  		phy_pm_runtime_put_sync(dwc->usb2_generic_phy);
>  		phy_pm_runtime_put_sync(dwc->usb3_generic_phy);
> +
> +		if (!PMSG_IS_AUTO(msg)) {
> +			if (device_may_wakeup(dwc->dev) &&
> +					device_wakeup_path(dwc->dev)) {

nit: the indentation is odd, align it with device_may_wakeup()?

> +				dwc->phy_power_off = false;
> +			} else {
> +				dwc->phy_power_off = true;
> +				dwc3_core_exit(dwc);

As commented earlier, taking the controller and PHYs completely down causes a
significant power draw in some USB clients. Let's clarify what the specific
benefits are of doing dwc3_core_exit() vs. entering a low power mode.

