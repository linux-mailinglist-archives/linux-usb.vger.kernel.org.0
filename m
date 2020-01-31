Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4166414F1A9
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 18:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgAaRxK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 12:53:10 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37201 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbgAaRxK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 12:53:10 -0500
Received: by mail-pf1-f194.google.com with SMTP id p14so3707732pfn.4
        for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2020 09:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FAiYzpEmCbBIYRaSNlFvhLL8FbmSXP+g6gLbCB4sdYM=;
        b=Xu1Xw08AVCOurgkKd5nwyR3pYe2HixybxoAO5lJ4z3RcivvQObeU/u6uacwiL8PXCu
         VZgJciAkcyX9ZzVE2AmERemWiuf+dm+JnXAAU6flg0aD/SmbP1WEiH99oM9fAIZXi+EA
         eCRSG7CazZFXC/ubs5XDK5e4/Ntug/426Spow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FAiYzpEmCbBIYRaSNlFvhLL8FbmSXP+g6gLbCB4sdYM=;
        b=tu4BPXvmnV6KGPMQvcjyUPjFpQXjMylYexczMm1gHWT5DfdAiZXOzCWhZXdWx7Hw4A
         37TiOksLsYBdc8VHAn9kCsWbdna1q32I/CQEN1dzvuGfDiC7X2CvTXPpkDaUt7l2rQxW
         6DusvgVHN/jHosdDWMlzAJ5IUvSevx+nSGJE+PC5fzaZ6lp7zTOFdyKntNDYOB/PaeHZ
         kPNtJUQOZ+Rzg71JbWS3KM1DHuoHvtPKV26p26TZ16RrhzeBWocIVlN9jYxsKfq7c+Tn
         r6Suqa/UzrHxM8byj4bAL+Ky90kW5TNwwbD2Uh/+VejPSAAGgfjQajj55lLKJ4Be9yen
         Y6jQ==
X-Gm-Message-State: APjAAAXW4HvlehtP6smWcq5XJjIIkugiG/kFVpS7QwpQsMyUk8wD4K0L
        eRLKehu+OugZ1dKkp6sH2tX9+w==
X-Google-Smtp-Source: APXvYqys0fFJVy7auFSqjvXgRYNtZxyFWRiiPWY9HxCM088KXgw6RY9uhsHPd1u8cfjDlcP/G69uHQ==
X-Received: by 2002:aa7:800e:: with SMTP id j14mr12038151pfi.174.1580493189460;
        Fri, 31 Jan 2020 09:53:09 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id k10sm10263053pjq.14.2020.01.31.09.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 09:53:08 -0800 (PST)
Date:   Fri, 31 Jan 2020 09:53:07 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     cchiluve <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH V4 2/3] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200131175307.GM71044@google.com>
References: <1568983997-20004-1-git-send-email-cchiluve@codeaurora.org>
 <1568983997-20004-3-git-send-email-cchiluve@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1568983997-20004-3-git-send-email-cchiluve@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Chandana,

On Fri, Sep 20, 2019 at 06:23:16PM +0530, cchiluve wrote:
> From: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> 
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB master to
> DDR slave. The other is from APPS master to USB slave.
> 
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 145 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 143 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 184df4d..3a540f7 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/extcon.h>
> +#include <linux/interconnect.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> @@ -59,8 +60,13 @@ struct dwc3_qcom {
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> +	struct icc_path		*usb_ddr_icc_path;
> +	struct icc_path		*apps_usb_icc_path;
>  };
>  
> +static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom);
> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom);
> +
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>  {
>  	u32 reg;
> @@ -222,7 +228,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>  	u32 val;
> -	int i;
> +	int i, ret;
>  
>  	if (qcom->is_suspended)
>  		return 0;
> @@ -234,6 +240,10 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  	for (i = qcom->num_clocks - 1; i >= 0; i--)
>  		clk_disable_unprepare(qcom->clks[i]);
>  
> +	ret = dwc3_qcom_interconnect_disable(qcom);
> +	if (ret)
> +		dev_warn(qcom->dev, "failed to disable interconnect %d\n", ret);
> +
>  	qcom->is_suspended = true;
>  	dwc3_qcom_enable_interrupts(qcom);
>  
> @@ -259,6 +269,10 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  		}
>  	}
>  
> +	ret = dwc3_qcom_interconnect_enable(qcom);
> +	if (ret)
> +		dev_warn(qcom->dev, "failed to enable interconnect %d\n", ret);
> +
>  	/* Clear existing events from PHY related to L2 in/out */
>  	dwc3_qcom_setbits(qcom->qscratch_base, PWR_EVNT_IRQ_STAT_REG,
>  			  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
> @@ -268,6 +282,124 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  	return 0;
>  }
>  
> +/* Interconnect path bandwidths in MBps */
> +#define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
> +#define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
> +#define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> +#define APPS_USB_AVG_BW 0
> +#define APPS_USB_PEAK_BW MBps_to_icc(40)

typically constants are defined before the function and struct
definitions, I'd suggest to move this up, after the other
constant definitions.

> +/**
> + * dwc3_qcom_interconnect_init() - Initialize the interconnect
> + * @qcom:			Pointer to the concerned usb core.
> + *
> + */
> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> +{
> +	struct device *dev = qcom->dev;
> +	struct dwc3 *dwc;

The variable is not used, remove it.

> +	int ret;
> +
> +	if (!device_is_bound(&qcom->dwc3->dev)) {
> +		dev_err(qcom->dev, "device is not bound\n");

An error message seems very harsh for a deferred probe. I'd say remove
the logging altogether ("git grep -B3 'return -EPROBE_DEFER'" shows that
there's rarely a specific message logged when the probe is deferred), if
you really really want it downgrade it to dev_dbg() or dev_info().

> +		return -EPROBE_DEFER;
> +	}
> +
> +	qcom->usb_ddr_icc_path = of_icc_get(dev, "usb-ddr");
> +	if (IS_ERR(qcom->usb_ddr_icc_path)) {
> +		dev_err(dev, "Error: (%ld) failed getting usb-ddr path\n",
> +			PTR_ERR(qcom->usb_ddr_icc_path));
> +		return PTR_ERR(qcom->usb_ddr_icc_path);
> +	}
> +
> +	qcom->apps_usb_icc_path = of_icc_get(dev, "apps-usb");
> +	if (IS_ERR(qcom->apps_usb_icc_path)) {
> +		dev_err(dev, "Error: (%ld) failed getting apps-usb path\n",
> +				PTR_ERR(qcom->apps_usb_icc_path));
> +		return PTR_ERR(qcom->apps_usb_icc_path);
> +	}
> +
> +	ret = dwc3_qcom_interconnect_enable(qcom);
> +	if (ret) {
> +		dev_err(dev, "failed to enable interconnect: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * dwc3_qcom_interconnect_exit() - Release interconnect path handles
> + * @qcom:			Pointer to the concerned usb core.
> + *
> + * This function is used to release interconnect path handle.
> + */
> +static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
> +{
> +	icc_put(qcom->usb_ddr_icc_path);
> +	icc_put(qcom->apps_usb_icc_path);
> +}
> +
> +/* Currently we only use bandwidth level, so just "enable" interconnects */
> +static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
> +{
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> +	int ret;
> +
> +	if (dwc->maximum_speed == USB_SPEED_SUPER) {
> +		ret = icc_set_bw(qcom->usb_ddr_icc_path,
> +			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = icc_set_bw(qcom->usb_ddr_icc_path,
> +			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
> +		if (ret)
> +			return ret;

Since the error check is the same for high speed and super speed
it can be moved outside of the branch.

> +	}
> +
> +	ret = icc_set_bw(qcom->apps_usb_icc_path,
> +		APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
> +	if (ret)
> +		goto err_disable_mem_path;
> +
> +	return 0;
> +
> +err_disable_mem_path:
> +	icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
> +
> +	return ret;

I'm not convinced the use of goto simplifies the code in this case. It
could just be:

	if (ret)
		icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);

	return ret;

> +}
> +
> +/* To disable an interconnect, we just set its bandwidth to 0 */
> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
> +{
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> +	int ret;
> +
> +	ret = icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
> +	if (ret)
> +		goto err_reenable_memory_path;
> +
> +	return 0;
> +
> +	/* Re-enable things in the event of an error */
> +err_reenable_memory_path:
> +	if (dwc->maximum_speed == USB_SPEED_SUPER)
> +		icc_set_bw(qcom->usb_ddr_icc_path,
> +			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> +	else
> +		icc_set_bw(qcom->usb_ddr_icc_path,
> +			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
> +
> +	return ret;
> +}
> +
>  static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
>  {
>  	struct dwc3_qcom *qcom = data;
> @@ -494,6 +626,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		goto depopulate;
>  	}
>  
> +	ret = dwc3_qcom_interconnect_init(qcom);
> +	if (ret) {
> +		dev_err(dev, "failed to init interconnect: %d\n", ret);

Not sure if this message is really needed, dwc3_qcom_interconnect_init()
logs a message in all error paths (except maybe for -EPROBE_DEFER in the
future). At the very least this message should be omitted for -EPROBE_DEFER.
