Return-Path: <linux-usb+bounces-149-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E05307A1FEC
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 15:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E753D1C2140F
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 13:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935F810A05;
	Fri, 15 Sep 2023 13:38:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91E910947
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 13:38:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327CD10D
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 06:38:55 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38FDKhEf015386;
	Fri, 15 Sep 2023 13:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eb4rqdLDe6lXXE0XeujSdw84h/BadL68woLFfZ0IByA=;
 b=jRzDbmahaF6/ycH87FJq0zRrKELTaZx514irqkC8E7/pCtethjfYxj0ZNOoKoBp9VyEl
 xYQIqLWV/fVEh7qysPKLv36m/YzoVBrF+donD77sYC76jIZyWAipQB3alnGQfTe7Z/Pe
 38Pcpwcj/KOHxaHEODX0CKgUQikWEf7uiX6Ktc69Ffx2vE3IwaG+rLACQUDuRaQJQhVQ
 +zCA3bem4TACzpSd91TXcJi/Gz8xD0aboP5c/IznZx6aQu+3OxVvY6BLXJQD+7LX40jb
 KBd0vbxkD++SS8gqI/lKLLnKVctV0cm7BPmhVanibjlMwBumznoysDMayx1pOMhm8mjC ww== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4f6v1a66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 13:38:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FDcfwY014751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 13:38:41 GMT
Received: from [10.217.219.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 06:38:39 -0700
Message-ID: <4e05a4fb-ff8e-4440-9ee2-9da07a686404@quicinc.com>
Date: Fri, 15 Sep 2023 19:08:28 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: Re: [RFC] usb: XHCI: Implement xhci_handshake_check_state() API
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
References: <20230915091737.31721-1-quic_ugoswami@quicinc.com>
 <a4e54c3c-6a8e-97fd-b954-eb5c7d42b7e6@intel.com>
Content-Language: en-US
In-Reply-To: <a4e54c3c-6a8e-97fd-b954-eb5c7d42b7e6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bpG9GrUZjWFYc3CXkOFQ9ZhhyXs0Out0
X-Proofpoint-ORIG-GUID: bpG9GrUZjWFYc3CXkOFQ9ZhhyXs0Out0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_10,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=397 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150122
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Mathias,

On 9/15/2023 4:30 PM, Mathias Nyman wrote:
> On 15.9.2023 12.17, Udipto Goswami wrote:
>> In some situations where xhci removal happens parallel to
>> xhci_handshake, we enoughter a scenario where the
>> xhci_handshake will fails because the status does not change
>> the entire duration of polling. This causes the xhci_handshake
>> to timeout resulting in long wait which might lead to watchdog
>> timeout.
>>
>> The API  handles command timeout which may happen upon XHCI
>> stack removal. Check for xhci state and exit the handshake if
>> xhci is removed.
>>
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>>   drivers/usb/host/xhci-ring.c |  2 +-
>>   drivers/usb/host/xhci.c      | 27 ++++++++++++++++++++++++++-
>>   drivers/usb/host/xhci.h      |  2 ++
>>   3 files changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 1dde53f6eb31..af9e27d3d303 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -450,7 +450,7 @@ static int xhci_abort_cmd_ring(struct xhci_hcd 
>> *xhci, unsigned long flags)
>>        * In the future we should distinguish between -ENODEV and 
>> -ETIMEDOUT
>>        * and try to recover a -ETIMEDOUT with a host controller reset.
>>        */
>> -    ret = xhci_handshake(&xhci->op_regs->cmd_ring,
>> +    ret = xhci_handshake_check_state(xhci, &xhci->op_regs->cmd_ring,
>>               CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
>>       if (ret < 0) {
>>           xhci_err(xhci, "Abort failed to stop command ring: %d\n", 
>> ret);
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index e1b1b64a0723..7bfcb09bcad0 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -84,6 +84,30 @@ int xhci_handshake(void __iomem *ptr, u32 mask, 
>> u32 done, u64 timeout_us)
>>   /*
>>    * Disable interrupts and begin the xHCI halting process.
>>    */
>> +int xhci_handshake_check_state(struct xhci_hcd *xhci,
>> +    void __iomem *ptr, u32 mask, u32 done, int usec)
>> +{
>> +    u32    result;
>> +
>> +    do {
>> +        result = readl_relaxed(ptr);
>> +        if (result == ~(u32)0)
>> +            return -ENODEV;
>> +
>> +        if (xhci->xhc_state & XHCI_STATE_REMOVING)
>> +            return -ENODEV;
>> +
>> +        result &= mask;
>> +        if (result == done)
>> +            return 0;
>> +
>> +        udelay(1);
>> +        usec--;
>> +    } while (usec > 0);
>> +
>> +    return -ETIMEDOUT;
>> +}
>> +
>
> Could we use the same readl_poll_timeout_atomic() macro that 
> xhci_handshake() does?
>
> Something like:
>
> int xhci_handshake_check_state(struct xhci_hcd *xhci, void __iomem *ptr,
>                 u32 mask, u32 done, int usec, unsigned int exit_state)
> {
>     ...
>
>     ret = readl_poll_timeout_atomic(ptr, result,
>                                         (result & mask) == done ||
>                                         result == U32_MAX ||
>                     xhci->xhc_state & exit_state,
>                                         1, timeout_us);
>
>         if (result == U32_MAX || xhci->xch_state & exit_state)
>                 return -ENODEV;
>
>     return ret;
> }
Thanks for the suggestions.
I think will be able to get the same thing with 
readl_poll_timeout_atomic as well.
I'll try this out and send an official patch.

Thanks,
-Udipto

