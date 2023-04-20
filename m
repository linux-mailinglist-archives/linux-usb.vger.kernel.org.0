Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D766E9426
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 14:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234867AbjDTMVt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Apr 2023 08:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234571AbjDTMVr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Apr 2023 08:21:47 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CA05260
        for <linux-usb@vger.kernel.org>; Thu, 20 Apr 2023 05:21:45 -0700 (PDT)
X-ASG-Debug-ID: 1681993302-1eb14e63872ee80001-YVMibp
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id D4fzVGZ12vQXLpQS (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 20 Apr 2023 20:21:42 +0800 (CST)
X-Barracuda-Envelope-From: WeitaoWang-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 20 Apr
 2023 20:21:42 +0800
Received: from [10.29.8.21] (10.29.8.21) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 20 Apr
 2023 20:21:41 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Message-ID: <f0f0d62d-edde-547d-5d6e-a02e2f8e8648@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.8.21
Date:   Fri, 21 Apr 2023 04:21:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] xhci: Add zhaoxin xHCI U1/U2 feature support
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH 2/3] xhci: Add zhaoxin xHCI U1/U2 feature support
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <tonywwang@zhaoxin.com>, <weitaowang@zhaoxin.com>
References: <20230420172130.375819-1-WeitaoWang-oc@zhaoxin.com>
 <20230420172130.375819-3-WeitaoWang-oc@zhaoxin.com>
 <c853436a-85c7-d0f8-0990-bc64977cbd47@gmail.com>
From:   "WeitaoWang-oc@zhaoxin.com" <WeitaoWang-oc@zhaoxin.com>
In-Reply-To: <c853436a-85c7-d0f8-0990-bc64977cbd47@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.29.8.21]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1681993302
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1867
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: 1.09
X-Barracuda-Spam-Status: No, SCORE=1.09 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=DATE_IN_FUTURE_06_12, DATE_IN_FUTURE_06_12_2
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.107677
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
        0.01 DATE_IN_FUTURE_06_12   Date: is 6 to 12 hours after Received: date
        3.10 DATE_IN_FUTURE_06_12_2 DATE_IN_FUTURE_06_12_2
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2023/4/20 17:39, Sergei Shtylyov wrote:
> On 4/20/23 8:21 PM, Weitao Wang wrote:
> 
>> Add U1/U2 feature support of xHCI for zhaoxin.
>>
>> Signed-off-by: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
> [...]
> 
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index 6307bae9cddf..730c0f68518d 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
> [...]
>> @@ -4938,6 +4938,27 @@ static int xhci_update_timeout_for_interface(struct xhci_hcd *xhci,
>>   	return 0;
>>   }
>>   
>> +static int xhci_check_zhaoxin_tier_policy(struct usb_device *udev,
>> +		enum usb3_link_state state)
>> +{
>> +	struct usb_device *parent;
>> +	unsigned int num_hubs;
>> +
>> +	/* Don't enable U1/U2 if the device is on an external hub. */
>> +	for (parent = udev->parent, num_hubs = 0; parent->parent;
>> +			parent = parent->parent)
>> +		num_hubs++;
>> +
>> +	if (num_hubs < 1)
>> +		return 0;
>> +
>> +	dev_dbg(&udev->dev, "Disabling U1/U2 link state for device"
>> +			" below external hub.\n");
>> +	dev_dbg(&udev->dev, "Plug device into root hub "
>> +			"to decrease power consumption.\n");
> 
>     Please don't break up the message strings.

Thanks for your advice, and I will merge this message in next patch version.
> [...]
>> @@ -4965,6 +4986,8 @@ static int xhci_check_tier_policy(struct xhci_hcd *xhci,
>>   {
>>   	if (xhci->quirks & XHCI_INTEL_HOST)
>>   		return xhci_check_intel_tier_policy(udev, state);
>> +	else if (xhci->quirks & XHCI_ZHAOXIN_HOST)
> 
>     *else* not needed after *return*.
This function need a "int" type return value. If remove "else" branch,
vendor other than intel and zhaoxin will not get a return value.

Best Regards,
Weitao

>> +		return xhci_check_zhaoxin_tier_policy(udev, state);
>>   	else
>>   		return 0;
>>   }
> 
> MBR, Sergey
> .
