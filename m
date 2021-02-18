Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306D331E38E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Feb 2021 01:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhBRAuq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Feb 2021 19:50:46 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:57239 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229803AbhBRAuo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Feb 2021 19:50:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613609421; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FnKVk3kaZBaRiyYEVXIKZGXX4o/DMyHVFd+yjupU7+g=; b=u89B55/yhX9sbaXTa4rBUbQX337w/u/+7YT9DcRznQp/xI4mdYQRGqN07R4qR8mzdrcwX9uK
 wH/aODQq5+S0FnstbrsvgVDsCBz27Zt29ssPreS8ag8cp4wGW9bgfqWUhmT0JHEhCgkN95GH
 pInEPDZ6JnvREhvGbIpVZ9PaFAQ=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 602db9ab666e232b38d48496 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Feb 2021 00:49:47
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 96A70C43462; Thu, 18 Feb 2021 00:49:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.74.71] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 126B3C433CA;
        Thu, 18 Feb 2021 00:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 126B3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v7 4/5] usb: dwc3: dwc3-qcom: Enable tx-fifo-resize
 property by default
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, balbi@kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <1611895604-4496-1-git-send-email-wcheng@codeaurora.org>
 <1611895604-4496-5-git-send-email-wcheng@codeaurora.org>
 <YBl8aszdk1xgbg1i@builder.lan>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <cd0b5e53-af48-3fd6-bad6-1e165a4f8fb8@codeaurora.org>
Date:   Wed, 17 Feb 2021 16:49:44 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YBl8aszdk1xgbg1i@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2/2/2021 8:23 AM, Bjorn Andersson wrote:
> On Thu 28 Jan 22:46 CST 2021, Wesley Cheng wrote:
> 
>> In order to take advantage of the TX fifo resizing logic, manually add
>> these properties to the DWC3 child node by default.  This will allow
>> the DWC3 gadget to resize the TX fifos for the IN endpoints, which
>> help with performance.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index d803ee9..4ea6be3 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -564,6 +564,7 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
>>  
>>  static const struct property_entry dwc3_qcom_acpi_properties[] = {
>>  	PROPERTY_ENTRY_STRING("dr_mode", "host"),
>> +	PROPERTY_ENTRY_BOOL("tx-fifo-resize"),
> 
> I checked the ACPI tables for Lenovo Miix 630, Yoga C630 and Flex 5G and
> neither one has this property specified. So while we could just add this
> here, it would have to be done in collaboration with the people who
> actually define these. And as said before, I believe we want this to
> always be enabled.
> 
>>  	{}
>>  };
>>  
>> @@ -634,6 +635,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>>  	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
>>  	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
>>  	struct device		*dev = &pdev->dev;
>> +	struct property		*prop;
>>  	int			ret;
>>  
>>  	dwc3_np = of_get_child_by_name(np, "dwc3");
>> @@ -642,6 +644,14 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>>  		return -ENODEV;
>>  	}
>>  
>> +	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
>> +	if (prop) {
>> +		prop->name = "tx-fifo-resize";
>> +		ret = of_add_property(dwc3_np, prop);
> 
> Can't we come up with a way where the platform driver enables this on
> the core driver without modifying DT?
> 
> Regards,
> Bjorn

Hi Bjorn,

Sorry for the late response.  As you know, its a little difficult to
access the DWC3 core device during DWC3 qcom probe time, as the DWC3
core will likely return deferred probe due to the PHY devices not being
ready.

This is why I went with the approach to modify the DWC3 node here, so
that when the DWC3 core is eventually probed, it wouldn't miss this
property setting.  If I tried to set this dynamically, say in
dwc3_qcom_vbus_override() (with proper NULL checks), then I'd miss this
setting for the first enumeration, but if cable plug out/in logic is
present, the setting would kick in on subsequent cable events.

Thanks
Wesley Cheng

> 
>> +		if (ret < 0)
>> +			dev_info(dev, "unable to add tx-fifo-resize prop\n");
>> +	}
>> +
>>  	ret = of_platform_populate(np, NULL, NULL, dev);
>>  	if (ret) {
>>  		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
