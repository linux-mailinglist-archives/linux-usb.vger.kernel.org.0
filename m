Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAECD596678
	for <lists+linux-usb@lfdr.de>; Wed, 17 Aug 2022 02:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238088AbiHQA5B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Aug 2022 20:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237942AbiHQA5B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 20:57:01 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA2B82D05;
        Tue, 16 Aug 2022 17:57:00 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GNMF1a003307;
        Wed, 17 Aug 2022 00:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0D6CYsbmpNyu12MeLgwlNIb+Mu9viJL7xqMJPYimhWU=;
 b=Tpmqt2cdfFaZSvIzdhqg3IRCwnYMjx8VPKQs1SJSWUWY3Z6fMjFuiMlql8p9XuQmg/og
 czgc/LrVom94Uhq+JvopgvqFTDobvuurbEgEw7iXElCqxt5B23AcYLqqHOqKEB+9fBEe
 B9/SUy6pfYaV7e2ISyJ/x97cu9ibM+JbEurs6aKzKMEgN85Ij95YVX8LM4l26QMch8C4
 A7vYDKjHcGWR23DGfAbp7+3/+vNVTfiHVV89ViweolqvRYTqdNhPrNvDVnhlhUFWALXb
 qkDCUFDbSK52qIdJoTjFNJ6lIP6+f6b/mOT4xmPv4Hmc66CAxoNZs6uuBb5UPynsVCXu mw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j08un31rn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Aug 2022 00:56:55 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.47.97.222])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27H0prNQ029110
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Aug 2022 00:51:54 GMT
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 17:51:53 -0700
Received: from [10.110.38.192] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 16 Aug
 2022 17:51:53 -0700
Message-ID: <5b82de52-3d6d-214b-ba3b-c57315fd18cb@quicinc.com>
Date:   Tue, 16 Aug 2022 17:51:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 6/8] usb: dwc3: Increase DWC3 controller halt timeout
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "quic_jackp@quicinc.com" <quic_jackp@quicinc.com>
References: <20220815213134.23783-1-quic_wcheng@quicinc.com>
 <20220815213134.23783-7-quic_wcheng@quicinc.com>
 <a6db7080-0c2f-a0fc-fd89-b919d12a8253@synopsys.com>
From:   Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <a6db7080-0c2f-a0fc-fd89-b919d12a8253@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RGD10BhmTPvkLOIKEidZ38nxrjipgxkA
X-Proofpoint-GUID: RGD10BhmTPvkLOIKEidZ38nxrjipgxkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=913 mlxscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170002
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

On 8/16/2022 5:34 PM, Thinh Nguyen wrote:
> On 8/15/2022, Wesley Cheng wrote:
>> Since EP0 transactions need to be completed before the controller halt
>> sequence is finished, this may take some time depending on the host and the
>> enabled functions.  Increase the controller halt timeout, so that we give
>> the controller sufficient time to handle EP0 transfers.  Remove the need
>> for making dwc3_gadget_suspend() and dwc3_gadget_resume() to be called in
>> a spinlock.
> 
> Sounds like the removal of the spin_lock and the increase of halt
> timeout are 2 separate change. It would be nice to separate this patch
> since the $subject only indicates 1 of them.
> 

Sure, I'll split these up.

>>
>> Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   drivers/usb/dwc3/core.c   | 4 ----
>>   drivers/usb/dwc3/gadget.c | 8 +++++++-
>>   2 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index c5c238ab3083..23e123a1ab5f 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -1976,9 +1976,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>>   	case DWC3_GCTL_PRTCAP_DEVICE:
>>   		if (pm_runtime_suspended(dwc->dev))
>>   			break;
>> -		spin_lock_irqsave(&dwc->lock, flags);
>>   		dwc3_gadget_suspend(dwc);
>> -		spin_unlock_irqrestore(&dwc->lock, flags);
>>   		synchronize_irq(dwc->irq_gadget);
>>   		dwc3_core_exit(dwc);
>>   		break;
>> @@ -2039,9 +2037,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>>   			return ret;
>>   
>>   		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
>> -		spin_lock_irqsave(&dwc->lock, flags);
>>   		dwc3_gadget_resume(dwc);
>> -		spin_unlock_irqrestore(&dwc->lock, flags);
>>   		break;
>>   	case DWC3_GCTL_PRTCAP_HOST:
>>   		if (!PMSG_IS_AUTO(msg) && !device_can_wakeup(dwc->dev)) {
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 7b66a54250a0..b2668a83cc29 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -2444,7 +2444,7 @@ static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
>>   static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
>>   {
>>   	u32			reg;
>> -	u32			timeout = 500;
>> +	u32			timeout = 100;
>>   
>>   	if (pm_runtime_suspended(dwc->dev))
>>   		return 0;
>> @@ -2477,6 +2477,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
>>   	dwc3_gadget_dctl_write_safe(dwc, reg);
>>   
>>   	do {
>> +		msleep(20);
> 
> Polling interval of 20ms seems a bit much. Can we use usleep_range()
> between 1-2ms?
> 
> Thanks,
> Thinh

Sounds good. Let me reduce the interval gap and resubmit.

Thanks
Wesley Cheng

> 
>>   		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
>>   		reg &= DWC3_DSTS_DEVCTRLHLT;
>>   	} while (--timeout && !(!is_on ^ !reg));
>> @@ -4520,12 +4521,17 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
>>   
>>   int dwc3_gadget_suspend(struct dwc3 *dwc)
>>   {
>> +	unsigned long flags;
>> +
>>   	if (!dwc->gadget_driver)
>>   		return 0;
>>   
>>   	dwc3_gadget_run_stop(dwc, false, false);
>> +
>> +	spin_lock_irqsave(&dwc->lock, flags);
>>   	dwc3_disconnect_gadget(dwc);
>>   	__dwc3_gadget_stop(dwc);
>> +	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>>   	return 0;
>>   }
> 
