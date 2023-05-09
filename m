Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F65F6FBE82
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 07:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbjEIFLJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 01:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjEIFLI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 01:11:08 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C2783C0
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 22:11:07 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3491qZfo008509;
        Tue, 9 May 2023 05:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=giqzQ0ey9MSis2yWLwT8AhnAmR7PP2kG3zHNk06TiiI=;
 b=liG+4LPl6XcH4NQwwW0RU+R7eyU4udBwFcW1kGn+pnmG3dkgNrmFwrqCn4W0TctE2d1c
 TAlD6r0F84TBAgOQaPcT/JiITEj9nGrsNcRAPWd77azHQgLn0K7KbhyVIopc4khZAGE3
 J1Y+sUh779S5DKlHopYtZYnPLng7IHqZVn7tYDyc+Wt0eCa7+07v2qMre7b0kAMtNP1F
 BANUj1qVqOKWs/ZsP7RcRExZuzZNO3PnAv9uWTQsQmxX4VoVBaTRC7uBowv3kwpXTXnR
 6Tms26uHaAaPumJwiJ2GhLI76pp5WMydAZR701+UhoPG5KmTqAW2g1iOlHK7IhHAkLQC +Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77j0u9u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 05:11:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3495B3fb007621
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 9 May 2023 05:11:03 GMT
Received: from [10.217.217.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 22:11:01 -0700
Message-ID: <0ef1bd2c-6946-1fdd-4a9f-1c94790e81dc@quicinc.com>
Date:   Tue, 9 May 2023 10:40:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] usb: xhci: Remove unused udev from xhci_log_ctx trace
 event
Content-Language: en-US
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, <linux-usb@vger.kernel.org>
References: <20230323131315.21764-1-quic_ugoswami@quicinc.com>
 <6edd8939-062a-9548-893b-8f02598c2fec@linux.intel.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <6edd8939-062a-9548-893b-8f02598c2fec@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0Y8Y5Q_dwsh0asfikB8vV9u_ZsRXOSuF
X-Proofpoint-GUID: 0Y8Y5Q_dwsh0asfikB8vV9u_ZsRXOSuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=516 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305090039
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 3/23/23 7:45 PM, Mathias Nyman wrote:
> On 23.3.2023 15.13, Udipto Goswami wrote:
>> xhci_log_ctx event is not utilizing the extracted udev to
>> print out anything, hence removing it.
>>
>> Fixes: 1d27fabec068 ("xhci: add xhci_address_ctx trace event")
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>>   drivers/usb/host/xhci-trace.h | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-trace.h 
>> b/drivers/usb/host/xhci-trace.h
>> index 4286dba5b157..7555c4ea7c4b 100644
>> --- a/drivers/usb/host/xhci-trace.h
>> +++ b/drivers/usb/host/xhci-trace.h
>> @@ -80,20 +80,16 @@ DECLARE_EVENT_CLASS(xhci_log_ctx,
>>           __field(dma_addr_t, ctx_dma)
>>           __field(u8 *, ctx_va)
>>           __field(unsigned, ctx_ep_num)
>> -        __field(int, slot_id)
>>           __dynamic_array(u32, ctx_data,
>>               ((HCC_64BYTE_CONTEXT(xhci->hcc_params) + 1) * 8) *
>>               ((ctx->type == XHCI_CTX_TYPE_INPUT) + ep_num + 1))
>>       ),
>>       TP_fast_assign(
>> -        struct usb_device *udev;
>> -        udev = to_usb_device(xhci_to_hcd(xhci)->self.controller);
> 
> Looks like this was flawed from the beginning, forcing a device struct 
> for a host controller into
> a struct usb_device

Hi Mathias, Greg,

Seems like this patch isn't included in upstream.
Please let me know what need to be done ? If a v2 is needed to push?

Thanks,
-Udipto


