Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8069255CCB3
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343571AbiF1GoF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jun 2022 02:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244813AbiF1GoE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jun 2022 02:44:04 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CCB013CD8
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 23:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656398643; x=1687934643;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EehI4NDi5r5BKDbCumg8kdMumkncNEAVDe5zKHDp6+A=;
  b=X/6BeL/TdnH5MTzaBnsVS5Vftz+7FiWYGlgzDMGjhCNGBDl6JV9T0AWn
   XO2ngNCMpt3NPuZEKK6pZr0uYc8kQS+58rqKIm9oAIU5CLZNDQI+IQYgt
   5kZ6+LmfB+jwmdP1QAyd+h+U45nQZDVuAKOFZo3rjbCNO5I3wlJCv90le
   Q=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 27 Jun 2022 23:44:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 23:44:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 23:44:02 -0700
Received: from [10.206.25.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 23:44:00 -0700
Message-ID: <817f66cc-8971-ee48-0a4a-4d442b2e7451@quicinc.com>
Date:   Tue, 28 Jun 2022 12:13:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
References: <9df529fde6e55f5508321b6bc26e92848044ef2b.1655338967.git.Thinh.Nguyen@synopsys.com>
 <400a84d5-4d23-bf67-4a80-773bf2129da0@quicinc.com>
 <708f3063-cf2f-5d4e-6afd-ee1702b080e1@synopsys.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <708f3063-cf2f-5d4e-6afd-ee1702b080e1@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

On 6/27/22 10:26 PM, Thinh Nguyen wrote:
> On 6/27/2022 3:28 AM, Udipto Goswami wrote:
>> Hi Thinh,
>>
>> On 6/16/22 5:54 AM, Thinh Nguyen wrote:
>>> Synopsys IP DWC_usb32 and DWC_usb31 version 1.90a and above deprecated
>>> GCTL.CORESOFTRESET. The DRD mode switching flow is updated to remove the
>>> GCTL soft reset. Add version checks to prevent using deprecated setting
>>> in mode switching flow.
>>>
>>> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>> ---
>>>    Changes in v2:
>>>    - Rebase on Greg's usb-testing branch.
>>>
>>>    drivers/usb/dwc3/core.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>> index 2c12bbbcd55c..91278d2a72b8 100644
>>> --- a/drivers/usb/dwc3/core.c
>>> +++ b/drivers/usb/dwc3/core.c
>>> @@ -159,7 +159,8 @@ static void __dwc3_set_mode(struct work_struct
>>> *work)
>>>        }
>>>          /* For DRD host or device mode only */
>>> -    if (dwc->desired_dr_role != DWC3_GCTL_PRTCAP_OTG) {
>>> +    if ((DWC3_IP_IS(DWC3) || DWC3_VER_IS_PRIOR(DWC31, 190A)) &&
>> just curious, i might be wrong here but, did you meant to use
>>
>> (DWC3_IP_IS(DWC3) && DWC3_VER_IS_PRIOR(DWC31, 190A) ?
>
> No. The check above should always be false right? The controller can't
> be both DWC_usb3 and DWC_usb31 IP at the same time.

got it, i misunderstood DWC_usb3 to be same as DWC_usb31. Apologies!


>
>> because from the commit text it looks like we are trying to avoid
>> doing GCTL core soft reset for GEN1 above 190A
>> and GEN2. But the check fails for GEN1 controller with version above
>> 190A.
>>
> I'm not clear what you meant by GEN1/GEN2 here. We're not doing any
> GEN1/GEN2 check here. And what fails?

i meant DWC_usb3 & DWC_usb31 by Gen1/Gen2, sorry for the confusion.

>
> BR,
>
> Thinh
>
