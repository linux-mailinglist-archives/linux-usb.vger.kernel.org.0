Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 929776D0061
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 11:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjC3J7H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 05:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjC3J7F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 05:59:05 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F387DA7
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 02:59:03 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U8mAxV001525;
        Thu, 30 Mar 2023 09:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=e7GolO/CX1DTIMSWxtlqV6AN9UmWKxNTE1obBLSatf8=;
 b=hoPNKnzWXQxJXbT/NBsbQdD2HE+Z62DUPKG/PaMCEugU9zxiZwM0quMg31Pcdwaya/sJ
 oO5aQISSwJ28GtTtLDZh9b+qTcpHWlYGLSmNJFl5vUqAKYsAhu1bnSafzLBnclDZ+ipT
 6+n5bOihGAi76aYG1npjVMPTCXrYqxWrwFu+cP50AAyGACWWMqhycAy9vrTpjP/nAGrX
 QS03Qo8LiZFH6TDNpJWGaqD3IYTe749f2fQrDMfV/ujVXiEbODYkS+x7h2mYTvfVNCZi
 g8rNhx39z46yUSAzUPXVVy7gSZa1Vhcn9TmW14IhTHxUwNElf+II9Ouzs43mDVeQ4a28 Yg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmpbm2xv7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 30 Mar 2023 09:58:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32U9wvLC001813
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 30 Mar 2023 09:58:57 GMT
Received: from [10.206.24.224] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 30 Mar
 2023 02:58:54 -0700
Message-ID: <5d301e76-9e77-c175-05f6-c1fbe76b0280@quicinc.com>
Date:   Thu, 30 Mar 2023 15:28:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Content-Language: en-US
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, <linux-usb@vger.kernel.org>
References: <20230316065858.12687-1-quic_ugoswami@quicinc.com>
 <ZBL6vT4OzdbfW+ZR@kroah.com> <ee8164dc-8078-3ede-df5b-52aefd55d787@suse.com>
 <19296a11-6199-1cc5-a063-f65f247b960b@quicinc.com>
 <7e23f01d-a1e7-1ecb-e531-53b8384a9950@quicinc.com>
In-Reply-To: <7e23f01d-a1e7-1ecb-e531-53b8384a9950@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0Nk7Q6c5POy68pt4RvU16iK6aFKSfrQk
X-Proofpoint-ORIG-GUID: 0Nk7Q6c5POy68pt4RvU16iK6aFKSfrQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_04,2023-03-30_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300080
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 3/30/23 11:59 AM, Udipto Goswami wrote:
> Hi Oliver,
> 
> On 3/17/23 5:26 PM, Udipto Goswami wrote:
>> Hi Greg, Oliver,
>>
>> On 3/16/23 5:06 PM, Oliver Neukum wrote:
>>>
>>>
>>> On 16.03.23 12:17, Greg Kroah-Hartman wrote:
>>>> On Thu, Mar 16, 2023 at 12:28:58PM +0530, Udipto Goswami wrote:
>>>>> When the dwc3 device is runtime suspended, various required clocks 
>>>>> would
>>>>> get disabled and it is not guaranteed that access to any registers 
>>>>> would
>>>>> work. Depending on the SoC glue, a register read could be as benign as
>>>>> returning 0 or be fatal enough to hang the system.
>>>>>
>>>>> In order to prevent such scenarios of fatal errors, bail out of 
>>>>> debugfs
>>>>> function is dwc3 is suspended.
>>>>>
>>>>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>>>>> ---
>>>>> v3: Replace pr_err to dev_err.
>>>>>
>>>>>   drivers/usb/dwc3/debugfs.c | 60 
>>>>> ++++++++++++++++++++++++++++++++++++++
>>>>>   1 file changed, 60 insertions(+)
>>>>>
>>>>> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
>>>>> index 850df0e6bcab..4a9d0994f3b4 100644
>>>>> --- a/drivers/usb/dwc3/debugfs.c
>>>>> +++ b/drivers/usb/dwc3/debugfs.c
>>>>> @@ -544,6 +544,12 @@ static int dwc3_link_state_show(struct 
>>>>> seq_file *s, void *unused)
>>>>>       u32            reg;
>>>>>       u8            speed;
>>>>> +    if (pm_runtime_suspended(dwc->dev)) {
>>>>> +        dev_err(dwc->dev,
>>>>> +            "Invalid operation, DWC3 suspended!");
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>
>>>> What prevents the device from being suspened right after you check 
>>>> this?
>>
>> I agree if the debugfs is access while suspend is in progress and lets 
>> say the pm suspended status got reflected after the check. In this 
>> case we will still run into the same fatal error scenario. But this 
>> will be very tight race if in my understanding.
>>
>> Our scenario was very simple, plug out the cable and try accessing the 
>> debugfs. In this scenario at least the kernel should not crash.
>>
>>>
>>> Indeed. If you really need a semantics of not waking up the device if
>>> somebody reads through debugfs, the attached patch should do the job.
>>> But do you really need it?
>>
>> Well, the intention was just to avoid the kernel crash. I believe in 
>> any case the kernel should handle it gracefully and bail out. I 
>> understand this patch won't help in the race condition which Greg 
>> pointed out though.
>>
>> Could you please suggest any other way which we can try out ?
>>>
>>>      Regards
>>>          Oliver
> 
> Apologies for the delay,
> I checked with the patch you had attached,
> 
>   drivers/usb/dwc3/debugfs.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
> index 850df0e6bcab..6922076572cd 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -543,13 +543,19 @@ static int dwc3_link_state_show(struct seq_file 
> *s, void *unused)
>       enum dwc3_link_state    state;
>       u32            reg;
>       u8            speed;
> +    int            ret = 0;
> 
> +    if (!pm_runtime_get_if_in_use(dwc->dev)) {

Hi Oliver,

I think we need a little tweak here because as per this function's 
description [1]:

int pm_runtime_get_if_in_use(struct device *dev);

- return -EINVAL if 'power.disable_depth' is nonzero; otherwise, if the 
runtime PM status is RPM_ACTIVE and the runtime PM usage counter is 
nonzero, increment the counter and return 1; otherwise return 0 without 
changing the counter

if it returns -EINVAL i think we still will go ahead and try accessing 
the rest of the code.

How about something like this ?



-       if (!pm_runtime_get_if_in_use(dwc->dev)) {
+       ret = pm_runtime_get_if_in_use(dwc->dev);
+       /* check if pm runtime get fails, bail out early */
+       if(ret < 0)
+               goto err_nolock;
+
+       if (!ret) {
                 ret = -EINVAL;
                 dev_err(dwc->dev,
                                 "Invalid operation, DWC3 suspended!");

> +        ret = -EINVAL;
> +        dev_err(dwc->dev,
> +                "Invalid operation, DWC3 suspended!");
> +        goto err_nolock;
> +    }
>       spin_lock_irqsave(&dwc->lock, flags);
>       reg = dwc3_readl(dwc->regs, DWC3_GSTS);
>       if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
>           seq_puts(s, "Not available\n");
> -        spin_unlock_irqrestore(&dwc->lock, flags);
> -        return 0;
> +        goto err;
>       }
> 
>       reg = dwc3_readl(dwc->regs, DWC3_DSTS);
> @@ -559,9 +565,11 @@ static int dwc3_link_state_show(struct seq_file *s, 
> void *unused)
>       seq_printf(s, "%s\n", (speed >= DWC3_DSTS_SUPERSPEED) ?
>              dwc3_gadget_link_string(state) :
>              dwc3_gadget_hs_link_string(state));
> +err:
>       spin_unlock_irqrestore(&dwc->lock, flags);
> -
> -    return 0;
> +    pm_runtime_put(dwc->dev);
> +err_nolock:
> +    return ret;
>   }
> 
> 
> This works for my usecase. Tested it and I don't see any fatal errors.
> Can we consider mainlining it ? We will need to cover the other 
> functions as well in similar way. Can I proceed and make the change and 
> include your Suggested-by/Signed-off-by tag ?
> Or do you want to push this on a separate one ?
> 
> Thanks,
> -Udipto

[1]: https://www.kernel.org/doc/Documentation/power/runtime_pm.txt

Thanks,
-Udipto
