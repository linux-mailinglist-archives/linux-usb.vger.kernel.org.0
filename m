Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E208E6637B5
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jan 2023 04:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjAJDKF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 22:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235744AbjAJDJz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 22:09:55 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFF21147A
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 19:09:43 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A14U3x022036;
        Tue, 10 Jan 2023 03:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5+r5NWm+nB9F1ANiKk6VyLzkV5NoRDQzasm4ink1mP4=;
 b=EKFLn6meUG5gHIjL0LNabT2fa65yVBDLJ+qXTqgnhfKUFIsrH+i4AsNGigWQS0DHp4I7
 6jUKOmfn34st0QO5/k0Dk6LBq0oa/Kojz+o7TBLTdqiXRsrtcKXuScoYf4QwHX8J7lCH
 RyzgDF+SZXzp6mS9xNpRWfEcGNU4J8M5pgt3/1kJeiInsT0BlzoKfCG48+CdKH0hMwBT
 iIe2W3hY9ooX+gj9K4lDntjEOt8ulcITFD3ADdKN47JGQ4kl2ZiS9berGkHqOmy3tz/z
 MRXpR2ugs8ygKn6cqHkGU125aiXe8zb0afOwEuWUszp5J1Vnd45WXwCo1peXhSGDSf0e rQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n0q2arxmr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Jan 2023 03:09:41 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30A39fAX023468
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Jan 2023 03:09:41 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 19:09:39 -0800
Message-ID: <3c25c6d7-0393-7d8f-cb94-df264fc6dabb@quicinc.com>
Date:   Tue, 10 Jan 2023 11:09:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] usb: dwc3: remove base parameter of event class
 dwc3_log_io
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
 <1672996895-22762-3-git-send-email-quic_linyyuan@quicinc.com>
 <20230109184657.kgvp7pq54hnzvaet@synopsys.com>
 <6cb3be51-b1af-89a5-dc19-b4a9d03eb8d3@quicinc.com>
 <20230110025711.ei6c3nftujf46czv@synopsys.com>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <20230110025711.ei6c3nftujf46czv@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SSH8XDAP7pFQQbKPr0Vz4s44AeLgcmOh
X-Proofpoint-ORIG-GUID: SSH8XDAP7pFQQbKPr0Vz4s44AeLgcmOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_16,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=923
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100018
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 1/10/2023 10:57 AM, Thinh Nguyen wrote:
> On Tue, Jan 10, 2023, Linyu Yuan wrote:
>> On 1/10/2023 2:47 AM, Thinh Nguyen wrote:
>>> On Fri, Jan 06, 2023, Linyu Yuan wrote:
>>>> when trace register read/write operation, it is not necessary to show
>>>> virtual address cacaulate from base and offset.
>>>>
>>>> remove the base register value, it will save trace buffer.
>>>> it is enough only save and show the offset.
>>>>
>>>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>>>> ---
>>>>    drivers/usb/dwc3/io.h    |  4 ++--
>>>>    drivers/usb/dwc3/trace.h | 17 +++++++----------
>>>>    2 files changed, 9 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h
>>>> index d24513e..fcb5726 100644
>>>> --- a/drivers/usb/dwc3/io.h
>>>> +++ b/drivers/usb/dwc3/io.h
>>>> @@ -32,7 +32,7 @@ static inline u32 dwc3_readl(void __iomem *base, u32 offset)
>>>>    	 * documentation, so we revert it back to the proper addresses, the
>>>>    	 * same way they are described on SNPS documentation
>>>>    	 */
>>>> -	trace_dwc3_readl(base, offset, value);
>>>> +	trace_dwc3_readl(offset, value);
>>>>    	return value;
>>>>    }
>>>> @@ -61,7 +61,7 @@ static inline void dwc3_writel(void __iomem *base, u32 offset, u32 value)
>>>>    	 * documentation, so we revert it back to the proper addresses, the
>>>>    	 * same way they are described on SNPS documentation
>>>>    	 */
>>>> -	trace_dwc3_writel(base, offset, value);
>>>> +	trace_dwc3_writel(offset, value);
>>>>    }
>>>>    #endif /* __DRIVERS_USB_DWC3_IO_H */
>>>> diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
>>>> index 1975aec..536b9a1 100644
>>>> --- a/drivers/usb/dwc3/trace.h
>>>> +++ b/drivers/usb/dwc3/trace.h
>>>> @@ -20,32 +20,29 @@
>>>>    #include "debug.h"
>>>>    DECLARE_EVENT_CLASS(dwc3_log_io,
>>>> -	TP_PROTO(void *base, u32 offset, u32 value),
>>>> -	TP_ARGS(base, offset, value),
>>>> +	TP_PROTO(u32 offset, u32 value),
>>>> +	TP_ARGS(offset, value),
>>>>    	TP_STRUCT__entry(
>>>> -		__field(void *, base)
>>>>    		__field(u32, offset)
>>>>    		__field(u32, value)
>>>>    	),
>>>>    	TP_fast_assign(
>>>> -		__entry->base = base;
>>>>    		__entry->offset = offset;
>>>>    		__entry->value = value;
>>>>    	),
>>>> -	TP_printk("addr %p offset %04x value %08x",
>>>> -		__entry->base + __entry->offset,
>>> Please don't remove this. Sometime we need to check the base address for
>>> different register offset. Currently some offsets need this to be able
>>> to differientiate between different registers (e.g. different endpoint
>>> registers DEPCMP and parameters)
> DEPCMP -> DEPCMD*
I can't understand your comment, I think every DEPCMD* register has it 
own offset.
>
>> thanks, will drop this patch.
>>
> If we fix it so that all the offset prints represent the correct offset
> of all the registers, then we can drop this base address print. That
> would be great.

I think only if multiple gadgets exist in real world, then base address 
is needed.

>
> Thanks,
> Thinh
