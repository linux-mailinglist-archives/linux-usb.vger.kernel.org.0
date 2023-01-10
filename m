Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406B8663704
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jan 2023 02:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235477AbjAJB4b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 20:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbjAJB40 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 20:56:26 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19432D2D8;
        Mon,  9 Jan 2023 17:56:26 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A1Ue7P029134;
        Tue, 10 Jan 2023 01:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=K41dXphpJl5lWuXve0H2T3lxhFZjPY5J3f2Yve3svd4=;
 b=Z0sj3QZHY/3xJxA6uVQSWDtwesbsWUbYksCGv/WArcEAIS3IvlkPR7LeavEUZLDNg78B
 5t/gRccm5HRTzNc689rwDIVWHD5GSE23f0koItDbzICQHxy2fGo32BJQMbE169t94Pxv
 VLWjRFjepF1x8be1UqNNo/paaPWFPLUDhtv0ChkL9kUTJW5VYZ05aN6f9Hw6Zxv3WJlu
 6FrHI1su8HCBSvrEd2ApwvM1D34s6HqNbsr9oigqu8ANXoRZUm8j34sYoxbbP6ycZgbh
 7gZ2C5g2OGBLugR1vG1eEU4Cj3YIZRVNzDVDI5T14V6M+HjppV0OmgC15hgt0OgocT8F nw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mxxeqvp8d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Jan 2023 01:56:19 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30A1uIQ9009594
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Jan 2023 01:56:18 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 17:56:16 -0800
Message-ID: <e7217471-5b08-eee6-fba8-06e879118d77@quicinc.com>
Date:   Tue, 10 Jan 2023 09:56:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] usb: dwc3: Clear DWC3_EVENT_PENDING when count is 0
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     =?UTF-8?B?7KCV7J6s7ZuI?= <jh0801.jung@samsung.com>,
        'Felipe Balbi' <balbi@kernel.org>,
        'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
        "'open list:USB XHCI DRIVER'" <linux-usb@vger.kernel.org>,
        'open list' <linux-kernel@vger.kernel.org>,
        'Seungchull Suh' <sc.suh@samsung.com>,
        'Daehwan Jung' <dh10.jung@samsung.com>
References: <CGME20230102050839epcas2p4b9d09d926f9a14c3b8e8df2574d334c3@epcas2p4.samsung.com>
 <20230102050831.105499-1-jh0801.jung@samsung.com>
 <af32e2f5-de45-38af-2b4f-47c1ac21ea9e@quicinc.com>
 <c4e01a0a-1c98-3103-2b91-2fe0ba8c3118@quicinc.com>
 <000201d920eb$c3715c50$4a5414f0$@samsung.com>
 <0bbd2355-2290-17c7-6860-d8b25930aed6@quicinc.com>
 <20230109182813.sle5h34wdgglnlph@synopsys.com>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <20230109182813.sle5h34wdgglnlph@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rc8PRA6hXtUV75Uc_6OjjjN0NBlKcy3z
X-Proofpoint-GUID: rc8PRA6hXtUV75Uc_6OjjjN0NBlKcy3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_16,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=290 mlxscore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301100010
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 1/10/2023 2:28 AM, Thinh Nguyen wrote:
> On Fri, Jan 06, 2023, Linyu Yuan wrote:
>> On 1/5/2023 5:54 PM, 정재훈 wrote:
>>>> -----Original Message-----
>>>> From: Linyu Yuan [mailto:quic_linyyuan@quicinc.com]
>>>> Sent: Thursday, January 5, 2023 12:35 PM
>>>> To: JaeHun Jung; Felipe Balbi; Greg Kroah-Hartman; Thinh Nguyen
>>>> Cc: open list:USB XHCI DRIVER; open list; Seungchull Suh; Daehwan Jung
>>>> Subject: Re: [PATCH] usb: dwc3: Clear DWC3_EVENT_PENDING when count is 0
>>>>
>>>>
>>>> On 1/5/2023 11:29 AM, Linyu Yuan wrote:
>>>>> On 1/2/2023 1:08 PM, JaeHun Jung wrote:
>>>>>> Sometimes very rarely, The count is 0 and the DWC3 flag is set has
>>>>>> status.
>>>>>> It must not have these status. Because, It can make happen interrupt
>>>>>> storming status.
>>>>> could you help explain without clear the flag, how interrupt storming
>>>>> happen ?
>>>>>
>>>>> as your change didn't touch any hardware register, i don't know how it
>>>>> fix storming.
>>>>>
>>> H/W interrupts are still occur on IP.
>> I guess we should fix it from IP layer.
>>
> How are you certain the problem is from IP layer?

I think all IRQ is from DWC3 controller IP. if it is not IP layer, could 
you share how to prevent from SW layer ?

seem IRQ can happen when event count is zero ,  why this can happen ? 
does it mean event count register is not trust ?

>
>> but when checking DWC3_EVENT_PENDING flag, it will auto clear in dwc3 thread
>> irq handler.
>>
>> there is one possible root cause is it cleared only after irq enabled in
>> dwc3_process_event_buf(),
>>
>> we should move unmask irq operation at end of this function.
>>
> This interrupt storm can happen because we clear the evt->flags _after_
> we unmask the interrupt. This was done to prevent false interrupt from
> delay interrupt deassertion, which can be a problem for legacy pci
> interrupt.
thanks for explain, i didn't know that.
>
> see 7441b273388b ("usb: dwc3: gadget: Fix event pending check")
>
> The change JaeHun Jung did should be fine.
agree.
> BR,
> Thinh
