Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E162162ED6E
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 07:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235263AbiKRGGY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 01:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbiKRGGT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 01:06:19 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CC49A26B
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 22:06:17 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AI50TT3010226;
        Fri, 18 Nov 2022 06:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZoUIrOyg9K1FLOIMmVsvGd+qfDInR9Oup2c3UEGqleI=;
 b=UCwiKlIZ4Nrh4ukX1AsaRj2GBMpQExZiJqZvDaC4k+vU6fdfTonIx/bidy4IVyLmbCU7
 YDl2k1drvcK/dPUf1TdrFMA3YKt2NryVoTU4XuMP5FiYVVhIdg+3W3ntwElcY1wmLbcC
 q/CWUHc3d0EmKIRjcXnORnt+2fCy/nGP9Di8nNOO3RKQm3WXML38MG+P+meiKOt1Pj1e
 4OPvvO+pULpH9ZWCAP9e1AtqiJ3hHYOyDtE2JXkf9z/fO2JYwFEZO5aedxKb//T0Gran
 954W6u28tlVoiZzhN36dJi9pBIjQT54+jp3yxRX6kvJtmArjp6bnQlyaExPDXOifLDHR sw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0se8nka-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Nov 2022 06:06:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AI66Dq2011458
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Nov 2022 06:06:13 GMT
Received: from [10.206.25.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 17 Nov
 2022 22:06:11 -0800
Message-ID: <93e1a840-6d9f-9a6a-d848-d006f1333d18@quicinc.com>
Date:   Fri, 18 Nov 2022 11:36:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] usb: dwc3: ep0: Add implementation of ep0_dequeue
 separately
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>
References: <20221117054917.30104-1-quic_ugoswami@quicinc.com>
 <20221118020141.fjngcaovttbzkbvv@synopsys.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <20221118020141.fjngcaovttbzkbvv@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AsfvoKFvlgB93YdqOoyPjP1kElcpdB93
X-Proofpoint-ORIG-GUID: AsfvoKFvlgB93YdqOoyPjP1kElcpdB93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 mlxlogscore=904 lowpriorityscore=0 adultscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211180041
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh

On 11/18/22 7:31 AM, Thinh Nguyen wrote:
> On Thu, Nov 17, 2022, Udipto Goswami wrote:
>> A dequeue for ep0 need to adjust the handling based on the
>> data stage and status stage. Currently if ep0 is in data/status
>> stage the handling isn't that different, driver will try giveback
>> as part of dequeue process which might potentially lead to the
>> controller accessing invalid trbs.
>>
>> Also for ep0 the requests aren't moved into the started_list,
>> which might potentially lead to the un-mapping of the request
>> buffers without sending endxfer.
> 
> Maybe we need to track started_list for control endpoint? If the request
> isn't prepared yet or that the transfer had completed, then there's no
> need to issue End Tranfer command.
> 
> But I believe sending End Transfer for inactive endpoint should be fine
> also. Then we maybe able to get away without checking the started list.
> If you're planning to do that, please test and note it somewhere.
> 
>>
thanks for the suggestion, sure i'll do some more experiments and 
confirm it.

>> Fix this by implementing a separate ep0 dequeue function where
>> if ep0 is still in data phase, driver will perform stall and
>> restart.
>>
>> Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>>   drivers/usb/dwc3/ep0.c    | 27 +++++++++++++++++++++++++++
>>   drivers/usb/dwc3/gadget.c |  3 +--
>>   drivers/usb/dwc3/gadget.h |  1 +
>>   3 files changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>> index 61de693461da..70b6df83d76e 100644
>> --- a/drivers/usb/dwc3/ep0.c
>> +++ b/drivers/usb/dwc3/ep0.c
>> @@ -1206,3 +1206,30 @@ void dwc3_ep0_interrupt(struct dwc3 *dwc,
>>   		break;
>>   	}
>>   }
>> +
>> +int dwc3_gadget_ep0_dequeue(struct usb_ep *ep, struct usb_request *request)
>> +{
>> +	struct dwc3_request		*req = to_dwc3_request(request);
>> +	struct dwc3_ep			*dep = to_dwc3_ep(ep);
>> +	struct dwc3			*dwc = dep->dwc;
>> +	unsigned long			flags;
>> +
> 
> Need to check if the control transfer is active and the input request is
> the valid request to dequeue. Return error code if it's not.
> 
sure will do that in v2.

>> +	trace_dwc3_ep_dequeue(req);
>> +	spin_lock_irqsave(&dwc->lock, flags);
>> +
>> +	if (dwc->ep0state != EP0_SETUP_PHASE) {
>> +		unsigned int dir;
>> +
>> +		dir = !!dwc->ep0_expect_in;
>> +		if (dwc->ep0state == EP0_DATA_PHASE)
>> +			dwc3_ep0_end_control_data(dwc, dwc->eps[dir]);
>> +		else
>> +			dwc3_ep0_end_control_data(dwc, dwc->eps[!dir]);
> 
> What if the status stage is active? May need to check for active status
> stage in other places to issue End Transfer too.
> 
okay will check this.
>> +
>> +		dwc3_ep0_stall_and_restart(dwc);
>> +	}
>> +
>> +	spin_unlock_irqrestore(&dwc->lock, flags);
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 5fe2d136dff5..3a8ca27eb5ee 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -2058,7 +2058,6 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
>>   	int				ret = 0;
>>   
>>   	trace_dwc3_ep_dequeue(req);
>> -
> 
> Can we keep this new line?
got it.
> 
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   
>>   	list_for_each_entry(r, &dep->cancelled_list, list) {
>> @@ -2239,7 +2238,7 @@ static const struct usb_ep_ops dwc3_gadget_ep0_ops = {
>>   	.alloc_request	= dwc3_gadget_ep_alloc_request,
>>   	.free_request	= dwc3_gadget_ep_free_request,
>>   	.queue		= dwc3_gadget_ep0_queue,
>> -	.dequeue	= dwc3_gadget_ep_dequeue,
>> +	.dequeue	= dwc3_gadget_ep0_dequeue,
>>   	.set_halt	= dwc3_gadget_ep0_set_halt,
>>   	.set_wedge	= dwc3_gadget_ep_set_wedge,
>>   };
>> diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
>> index 55a56cf67d73..115321cb34b3 100644
>> --- a/drivers/usb/dwc3/gadget.h
>> +++ b/drivers/usb/dwc3/gadget.h
>> @@ -116,6 +116,7 @@ int __dwc3_gadget_ep0_set_halt(struct usb_ep *ep, int value);
>>   int dwc3_gadget_ep0_set_halt(struct usb_ep *ep, int value);
>>   int dwc3_gadget_ep0_queue(struct usb_ep *ep, struct usb_request *request,
>>   		gfp_t gfp_flags);
>> +int dwc3_gadget_ep0_dequeue(struct usb_ep *ep, struct usb_request *request);
>>   int __dwc3_gadget_ep_set_halt(struct dwc3_ep *dep, int value, int protocol);
>>   void dwc3_ep0_send_delayed_status(struct dwc3 *dwc);
>>   void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force, bool interrupt);
>> -- 
>> 2.17.1
>>
> 
> Thanks,
> Thinh

Thanks,
-Udipto
