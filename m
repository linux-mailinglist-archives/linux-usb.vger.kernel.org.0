Return-Path: <linux-usb+bounces-1554-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D75C77C7C67
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 05:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AE08282D80
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 03:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A34F1C30;
	Fri, 13 Oct 2023 03:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GCxIbCe8"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3067F3
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 03:58:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A974B7;
	Thu, 12 Oct 2023 20:58:27 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39D3FcXV024384;
	Fri, 13 Oct 2023 03:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0EyAAJkb1bhif+d/Coj4y+ceG2QboEER0TLfw86FZy8=;
 b=GCxIbCe899MKfAXUiFTE90efbtYMIodNuBXdCGgw+Ddg+cwo/pqyBOGVznll3v8Amk9X
 hLmhtAx7KBh4f67t7Dr1g+qfT3fAKFS0QhVmYonph54CyY+PpJaGHeyJPRhxVZ1I/eJm
 HRdkbfFX/St37s4+7AzLFjy6ji7TtZmOXBLvyHzKO0BKNcwuSxo9ZTWAVnu8XgrJ/EtM
 FX3FVFhgXNL6pTdjvJmQc/p44FNILQm+LFOorhdLbNWErjxSN88MJia0OceAQm2TScYy
 yDqgFRtBN1+R2xnvnbN81KUmowCA9Ln0psE3RfPeV0mthfOHRY0q8oAUEWIvgrZ5mMUe 3Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tpt118dwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 03:58:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39D3wL2E030542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 03:58:21 GMT
Received: from [10.216.41.155] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 12 Oct
 2023 20:58:18 -0700
Message-ID: <cabf2de7-bde2-4cec-9f99-2cb8c92875a5@quicinc.com>
Date: Fri, 13 Oct 2023 09:28:18 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] usb: dwc3: core: Fix RAM interface getting stuck during
 enumeration
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "quic_ppratap@quicinc.com" <quic_ppratap@quicinc.com>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "quic_jackp@quicinc.com"
	<quic_jackp@quicinc.com>,
        "quic_ugoswami@quicinc.com"
	<quic_ugoswami@quicinc.com>
References: <20231011100214.25720-1-quic_kriskura@quicinc.com>
 <20231012175912.umc3ugzk4iqwtcp3@synopsys.com>
 <bac414a7-aa2a-4b93-82e0-998002c455e0@quicinc.com>
 <20231012221744.ww2w6febhurvlqi6@synopsys.com>
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <20231012221744.ww2w6febhurvlqi6@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z43f9xgMUSS5YbcL6Uy-4MGpdhxW-C3u
X-Proofpoint-GUID: z43f9xgMUSS5YbcL6Uy-4MGpdhxW-C3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310130034
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/13/2023 3:47 AM, Thinh Nguyen wrote:
> On Fri, Oct 13, 2023, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 10/12/2023 11:29 PM, Thinh Nguyen wrote:
>>
>>>> -static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
>>>> +int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
>>>>    {
>>>>    	unsigned long flags;
>>>>    	int ret;
>>>> @@ -2701,7 +2701,7 @@ static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
>>>>    	return ret;
>>>>    }
>>>> -static int dwc3_gadget_soft_connect(struct dwc3 *dwc)
>>>> +int dwc3_gadget_soft_connect(struct dwc3 *dwc)
>>>>    {
>>>>    	int ret;
>>>> @@ -3963,6 +3963,7 @@ static void dwc3_gadget_disconnect_interrupt(struct dwc3 *dwc)
>>>>    	dwc3_gadget_dctl_write_safe(dwc, reg);
>>>>    	dwc->connected = false;
>>>> +	dwc->cable_disconnected = true;
>>>>    	dwc3_disconnect_gadget(dwc);
>>>> @@ -4038,6 +4039,7 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
>>>>    	 */
>>>>    	dwc3_stop_active_transfers(dwc);
>>>>    	dwc->connected = true;
>>>> +	dwc->cable_disconnected = false;
>>>>    	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
>>>>    	reg &= ~DWC3_DCTL_TSTCTRL_MASK;
>>>> -- 
>>>> 2.42.0
>>>>
>>>
>>> We can just reset the controller when there's End Transfer command
>>> timeout as a failure recovery. No need to do what you're doing here.
>>>
>> Hi Thinh,
>>
>>   That was what I initially wanted to do, but there were couple of reasons I
>> wanted to take this approach:
>>
>> 1. We can't just reset the controller in midst of gadget_interrupt. We need
>> to process it completely and then take action.
> 
> You can flag the driver so you can do the teardown/soft-reset at the
> appropriate time.
> 
>>
>> 2. The above log was seen on QRD variant of SM8550/SM8650 easily. But on
>> other platforms of same targets, the issue comes up at some other instances
>> of code, at a point where no IRQ is running. In such cases its not possible
>> to accurately find out code portions and reset the controller. The way I
>> confirmed that both platforms are having the same issue is:
>>
>> a. During cable disconnect, I am not receiving disconnect interrupt
>> b. The reg dump is exactly same in both cases (BMU as well)
>>
>> So I felt it was better to fix it during cable disconnect because even if we
>> remove cable, we are still in device mode only and in this case we can
>> unblock suspend and also bring back controller to a known state.
>>
>> Let me know your thoughts on the above.
>>
> 
> This issue happens outside of disconnect right? Did you account for port
> reset?
> 
> The symptom should be the same. At some point, a command will be issued.
> If a command timed out, then something is really wrong (especially End
> Transfer command). We can attempt to recover base on this symptom then.
> 
> And you don't need to poll for timeout for this specific type of error.
> Just read some known register like GSNPSID to see if it's invalid.

Hi Thinh,

  Yes. It actually happens before disconnect, but I was trying to handle 
it during disconnect. How about I add a check in gadget_ep_cmd saying 
that if cmd timeout happens, then read the snpsid and if it reads an 
invalid value, then I will call soft_disconnect followed by 
soft_connect. That must cover all cases ?

Regards,
Krishna,

