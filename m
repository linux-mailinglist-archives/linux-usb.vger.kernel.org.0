Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946AEB4C8C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 13:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfIQLJY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 07:09:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41284 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfIQLJY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 07:09:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 721F96141D; Tue, 17 Sep 2019 11:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568718562;
        bh=e9rPW0n0zcrzRpT2Js3LT+kulboiSbYINiQyiwJQanU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VuUZeMzlvaLdcWRQqNA+aUsr8yRQlhSDBt8yyvSfelFKzx6KKFaiuBNiGPpKnJmON
         LqtzN0ec5Bj+wZiC05ZSOjf8ZHJp4IfyvVKq/WwHBpHy9HHnGTojql9/ZPEBVv0ZXo
         qI79PKCGpmyx0K+XoD1IweHN5d3Epf4HDgsoWVW8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id F29626034D;
        Tue, 17 Sep 2019 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568718561;
        bh=e9rPW0n0zcrzRpT2Js3LT+kulboiSbYINiQyiwJQanU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nFVcQFOQkf8KxY+oJ5hMp/K7US5P+H3JBBCVDJuRy41/7fVJ9WU6CCR33gxgdb7oq
         WRuIRhdfhiasunFC+05njdpXCLjU3gXBqCg114+aPv6z5XtYTYaKn9f0gHkpVzclRb
         TxfMYcbtEsGKJn28p91cCaqPE1obaEYXx6iprt/o=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Sep 2019 16:39:20 +0530
From:   cchiluve@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 2/3] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
In-Reply-To: <20190916222446.GG133864@google.com>
References: <1568634061-14455-1-git-send-email-cchiluve@codeaurora.org>
 <1568634061-14455-3-git-send-email-cchiluve@codeaurora.org>
 <20190916222446.GG133864@google.com>
Message-ID: <7762a32f08a297e47a45dc9840b62d02@codeaurora.org>
X-Sender: cchiluve@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Matthias,

Thanks for the review. I Will address below comments and post changes in 
new version.

On 2019-09-17 03:54, Matthias Kaehlcke wrote:
> Hi Chandana,
> 
> On Mon, Sep 16, 2019 at 05:11:00PM +0530, Chandana Kishori Chiluveru 
> wrote:
>> Add interconnect support in dwc3-qcom driver to vote for bus
>> bandwidth.
>> 
>> This requires for two different paths - from USB master to
>> DDR slave. The other is from APPS master to USB slave.
>> 
>> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
>> ---
>>  drivers/usb/dwc3/dwc3-qcom.c | 145 
>> ++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 143 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c 
>> b/drivers/usb/dwc3/dwc3-qcom.c
>> index 184df4d..4f6c9736 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -14,6 +14,7 @@
>>  #include <linux/extcon.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/interconnect.h>
> 
> please use alphabetical order, i.e. this should be after 
> 'linux/extcon.h'.
> 
>>  #include <linux/phy/phy.h>
>>  #include <linux/usb/of.h>
>>  #include <linux/reset.h>
>> @@ -59,8 +60,13 @@ struct dwc3_qcom {
>>  	enum usb_dr_mode	mode;
>>  	bool			is_suspended;
>>  	bool			pm_suspended;
>> +	struct icc_path		*usb_ddr_icc_path;
>> +	struct icc_path		*apps_usb_icc_path;
>>  };
>> 
>> +static int usb_interconnect_enable(struct dwc3_qcom *qcom);
>> +static int usb_interconnect_disable(struct dwc3_qcom *qcom);
>> +
>>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, 
>> u32 val)
>>  {
>>  	u32 reg;
>> @@ -222,7 +228,7 @@ static void dwc3_qcom_enable_interrupts(struct 
>> dwc3_qcom *qcom)
>>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>>  {
>>  	u32 val;
>> -	int i;
>> +	int i, ret;
>> 
>>  	if (qcom->is_suspended)
>>  		return 0;
>> @@ -234,6 +240,11 @@ static int dwc3_qcom_suspend(struct dwc3_qcom 
>> *qcom)
>>  	for (i = qcom->num_clocks - 1; i >= 0; i--)
>>  		clk_disable_unprepare(qcom->clks[i]);
>> 
>> +	/* Remove bus voting */
> 
> IMO the comment doesn't add much, especially since there is a log in
> case of failure.
> 
>> +	ret = usb_interconnect_disable(qcom);
>> +	if (ret)
>> +		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
> 
> This should probably be a warning, since the function continues with
> normal execution.
> 
> nit: the function is called usb_interconnect_disable(), but the
> message says "bus bw voting failed". The function name encapsulates
> what the function does, but the message talks about implementation
> details. To be consistent either the function should have something
> about 'voting' in it's name, or the message should be "failed to
> disable interconnect" or similar.
> 
>> +
>>  	qcom->is_suspended = true;
>>  	dwc3_qcom_enable_interrupts(qcom);
>> 
>> @@ -259,6 +270,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom 
>> *qcom)
>>  		}
>>  	}
>> 
>> +	/* Add bus voting */
>> +	ret = usb_interconnect_enable(qcom);
>> +	if (ret)
>> +		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
>> +
> 
> same comments as for suspend()
> 
>>  	/* Clear existing events from PHY related to L2 in/out */
>>  	dwc3_qcom_setbits(qcom->qscratch_base, PWR_EVNT_IRQ_STAT_REG,
>>  			  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
>> @@ -268,6 +284,117 @@ static int dwc3_qcom_resume(struct dwc3_qcom 
>> *qcom)
>>  	return 0;
>>  }
>> 
>> +/* Interconnect path bandwidths in MBps */
>> +#define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
>> +#define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
>> +#define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
>> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
>> +#define APPS_USB_AVG_BW 0
>> +#define APPS_USB_PEAK_BW MBps_to_icc(40)
>> +
>> +/**
>> + * usb_interconnect_init() -
> 
> A function named 'usb_*' is typically associated to be a USB core
> function. I would suggest to use the 'dwc3_qcom_' prefix like all
> other functions in this file. Applicable to all new functions.
> 
>> Request to get interconnect path handle
> 
> nit: handles
> 
> Get rid of "Request to"?
> 
>> + * @qcom:			Pointer to the concerned usb core.
>> + *
>> + */
>> +static int usb_interconnect_init(struct dwc3_qcom *qcom)
>> +{
>> +	struct device *dev = qcom->dev;
>> +
>> +	qcom->usb_ddr_icc_path = of_icc_get(dev, "usb-ddr");
>> +	if (IS_ERR(qcom->usb_ddr_icc_path)) {
>> +		dev_err(dev, "Error: (%ld) failed getting %s path\n",
>> +			PTR_ERR(qcom->usb_ddr_icc_path), "usb-ddr");
> 
> Why not put 'usb-ddr' in the format string, instead of using '%s'?
> 
>> +		return PTR_ERR(qcom->usb_ddr_icc_path);
>> +	}
>> +
>> +	qcom->apps_usb_icc_path = of_icc_get(dev, "apps-usb");
>> +	if (IS_ERR(qcom->apps_usb_icc_path)) {
>> +		dev_err(dev, "Error: (%ld) failed getting %s path\n",
>> +				PTR_ERR(qcom->apps_usb_icc_path), "apps-usb");
> 
> same comment as above.
> 
>      	     	icc_put(qcom->usb_ddr_icc_path);
> 
>> +		return PTR_ERR(qcom->usb_ddr_icc_path);
> 
> should be 'qcom->apps_usb_icc_path'
> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * geni_interconnect_exit() -
> 
> wrong prefix
> 
>> Request to release interconnect path handle
> 
> nit: handles
> 
> Get rid of "Request to"?
> 
>> + * @qcom:			Pointer to the concerned usb core.
>> + *
>> + * This function is used to release interconnect path handle.
>> + */
>> +static void usb_interconnect_exit(struct dwc3_qcom *qcom)
>> +{
>> +	icc_put(qcom->usb_ddr_icc_path);
>> +	icc_put(qcom->apps_usb_icc_path);
>> +}
>> +
>> +/* Currently we only use bandwidth level, so just "enable" 
>> interconnects */
>> +static int usb_interconnect_enable(struct dwc3_qcom *qcom)
>> +{
>> +	struct dwc3 *dwc;
>> +	int ret;
>> +
>> +	dwc = platform_get_drvdata(qcom->dwc3);
>> +	if (!dwc) {
>> +		dev_err(qcom->dev, "Failed to get dwc3 device\n");
>> +		return -EPROBE_DEFER;
>> +	}
> 
> This should never happen, drvdata is set in _probe(). If it happens
> -EPROBE_DEFER doesn't seem to be an appropriate error code. I suggest
> to remove the condition entirely.
> 
In my testing i have seen a null pointer crash with 
"dwc->maximum_speed". To prevent the crash i have added this logic.
Agree that drvdata is set in dwc3_probe(). Sometimes i can see that 
dwc3_probe never getting completed before it can go and access 
dwc->maximum_speed pointer here.
This is leading to null pointer access crash. if i defer the probe and 
try again i can see that drvdata getting updated successfully in 
dwc3_probe.

>> +
>> +	if (dwc->maximum_speed == USB_SPEED_SUPER) {
>> +		ret = icc_set_bw(qcom->usb_ddr_icc_path,
>> +			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		ret = icc_set_bw(qcom->usb_ddr_icc_path,
>> +			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	ret = icc_set_bw(qcom->apps_usb_icc_path,
>> +		APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
>> +	if (ret)
>> +		goto err_disable_mem_path;
>> +
>> +	return 0;
>> +
>> +err_disable_mem_path:
>> +	icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
>> +
>> +	return ret;
>> +}
>> +
>> +/* To disable an interconnect, we just set its bandwidth to 0 */
>> +static int usb_interconnect_disable(struct dwc3_qcom *qcom)
>> +{
>> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>> +	int ret;
>> +
>> +	ret = icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
>> +	if (ret)
>> +		goto err_reenable_memory_path;
>> +
>> +	return 0;
>> +
>> +	/* Re-enable things in the event of an error */
>> +err_reenable_memory_path:
>> +	if (dwc->maximum_speed == USB_SPEED_SUPER)
>> +		icc_set_bw(qcom->usb_ddr_icc_path,
>> +			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
>> +	else
>> +		icc_set_bw(qcom->usb_ddr_icc_path,
>> +			USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
>> +
>> +	return ret;
>> +}
>> +
>>  static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
>>  {
>>  	struct dwc3_qcom *qcom = data;
>> @@ -494,6 +621,17 @@ static int dwc3_qcom_probe(struct platform_device 
>> *pdev)
>>  		goto depopulate;
>>  	}
>> 
>> +	ret = usb_interconnect_init(qcom);
>> +	if (ret) {
>> +		dev_err(dev, "failed to get interconnect handle ret:%d\n", ret);
> 
> similar to my comment above, the function name adds an abstraction,
> but the comment talks about implementation details. I'd suggest
> something like 'failed to init interconnect'.
> 
>> +		goto depopulate;
>> +	}
>> +	ret = usb_interconnect_enable(qcom);
>> +	if (ret) {
>> +		dev_err(qcom->dev, "bus bw voting failed %d\n", ret);
> 
> same comment as for 'dwc3_qcom_suspend' above.
> 
> I think the _interconnect_enable() call should be part of
> _interconnect_init(). I was earlier considering to suggest to
> change the name of _interconnect_init() to something else, since
> it doesn't really do any interconnect initialization, but didn't have
> a good suggestion for an alternative name. Moving the _enable() call
> into _init() would make _init() and actual init routine, besides
> removing clutter from _probe().
> 
>> +		goto interconnect_exit;
>> +	}
>> +
>>  	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
>> 
>>  	/* enable vbus override for device mode */
>> @@ -503,7 +641,7 @@ static int dwc3_qcom_probe(struct platform_device 
>> *pdev)
>>  	/* register extcon to override sw_vbus on Vbus change later */
>>  	ret = dwc3_qcom_register_extcon(qcom);
>>  	if (ret)
>> -		goto depopulate;
>> +		goto interconnect_exit;
>> 
>>  	device_init_wakeup(&pdev->dev, 1);
>>  	qcom->is_suspended = false;
>> @@ -513,6 +651,8 @@ static int dwc3_qcom_probe(struct platform_device 
>> *pdev)
>> 
>>  	return 0;
>> 
>> +interconnect_exit:
>> +	usb_interconnect_exit(qcom);
>>  depopulate:
>>  	of_platform_depopulate(&pdev->dev);
>>  clk_disable:
>> @@ -540,6 +680,7 @@ static int dwc3_qcom_remove(struct platform_device 
>> *pdev)
>>  	}
>>  	qcom->num_clocks = 0;
>> 
>> +	usb_interconnect_exit(qcom);
>>  	reset_control_assert(qcom->resets);
>> 
>>  	pm_runtime_allow(dev);
> 
> Cheers
> 
> Matthias
