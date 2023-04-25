Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F816EE8B2
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 21:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235080AbjDYTyw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 15:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234754AbjDYTys (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 15:54:48 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247E97687
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 12:54:47 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33PJbIqj009891;
        Tue, 25 Apr 2023 19:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qi/sk4z8v1wHCgaBi9Dc4O2gtLmKkcVaNWvb1veFq8Y=;
 b=KxrXncWkWuL3i5/Su6N5PoKXB5Yzl7SaxScIE0ONDx+DH63ia13J7RCV9g5kJ54+ovVH
 U+cDGUnh/PvND2HUHw2dnOXe/XBGhOIU3JNpQXv8FwxycuIp2zc6wpFT9GHatyY7czKI
 KtTuWPsLMKyhDFKIXgfuJ/3SuTQzooHXpg6MlYhyQyeuxFvKN3ggTVYK03pP4WGWatHy
 YJUak6BdTvzXAsd5p5dfFfYaNW6HLGIcoBHq6TS+FQZE6MXgxWOXCvVwMJVpxslrp1Nc
 5NyQsh+feD0sfaY9eQ+DhCZvPcSyNwZdhiM8BMx40Hvt4lLzl4CJv1kswi3QqjEhfL14 VA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6gak0uue-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 19:54:32 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33PJs9fW023961
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 19:54:09 GMT
Received: from [10.110.17.95] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 25 Apr
 2023 12:54:09 -0700
Message-ID: <0f5c5e14-a1fb-1807-1a69-9ba51776ce6b@quicinc.com>
Date:   Tue, 25 Apr 2023 12:54:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] xhci: Improve the XHCI resume time
Content-Language: en-US
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Basavaraj Natikar <bnatikar@amd.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        <basavaraj.natikar@amd.com>
CC:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <mathias.nyman@intel.com>, <stern@rowland.harvard.edu>
References: <20230418140817.3651909-3-Basavaraj.Natikar@amd.com>
 <20230420170337.14110-1-markhas@chromium.org>
 <346ea37a-9ec6-af36-b6ed-026aefb2cf4b@amd.com>
 <5a4b3d95-c783-b4b2-93d7-57b69b679f7a@linux.intel.com>
 <5157f331-0e0d-c6c2-1896-bb09c13ee3c0@quicinc.com>
 <a81a39ed-bc05-19e7-ec05-25632535ea5c@linux.intel.com>
From:   Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <a81a39ed-bc05-19e7-ec05-25632535ea5c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GbZzdGP3vd0DRroyws4U-vhhgjiu5E_c
X-Proofpoint-GUID: GbZzdGP3vd0DRroyws4U-vhhgjiu5E_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_08,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=843 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250179
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

On 4/25/2023 2:04 AM, Mathias Nyman wrote:
> On 25.4.2023 3.09, Wesley Cheng wrote:
>> Hi Mathias,
>>
>> On 4/24/2023 8:05 AM, Mathias Nyman wrote:
>>> On 21.4.2023 7.58, Basavaraj Natikar wrote:
>>>>
>>>> On 4/20/2023 10:33 PM, Mark Hasemeyer wrote:
>>>>>> It may be necessary to wait only for auto-resume cases.
>>>>> I find this comment misleading as the patch assumes that it's only 
>>>>> necessary to
>>>>> wait for auto-resume cases. Are there any cases where the driver 
>>>>> should wait
>>>>> during system-resume?
>>>>
>>>> Only in case of auto-resume (runtime resume).
>>>>
>>>> Rewording the commit message as follows.
>>>
>>> Thanks for fixing this extra system resume delay
>>>
>>> Maybe some kind of big picture explanation could be added to the 
>>> commit message,
>>> such as:
>>>
>>> Avoid extra 120ms delay during system resume.
>>>
>>> xHC controller may signal wake up to 120ms before it shows which USB 
>>> device
>>> caused the wake on the xHC port registers.
>>>
>>> The xhci driver therefore checks for port activity up to 120ms during 
>>> resume,
>>> making sure that the hub driver can see the port change, and won't 
>>> immediately
>>> runtime suspend back due to no port activity.
>>>
>>> This is however only needed for runtime resume as system resume will 
>>> resume
>>> all child hubs and other child usb devices anyway.
>>>
>>>>
>>>> Each XHCI controller while xhci_resumes by default takes 120 ms more if
>>>> there is no activity on the ports or no ports connected. Therefore, if
>>>> there are more USB controllers on the system, 120 ms more per 
>>>> controller
>>>> will add delay to system resume from suspended states like s2idle, 
>>>> S3 or
>>>> S4 states.
>>>>
>>>> Once the XHCI controller is in runtime suspended state (D3 state), 
>>>> on USB
>>>> device hotplug controller will runtime resume (D0 state) and check for
>>>> pending port events if no events, wait for 120 ms to re-check for port
>>>> activity to handle missed wake signal.
>>>>
>>>> A delay of 120 ms more to re-check for port activity is needed only in
>>>> auto-resume (runtime resume) cases. Hence, add a check only for runtime
>>>> resume from runtime suspend (D3->D0) to avoid the 120ms more delay for
>>>> other PM events (system resume from suspend states like s2idle, S3 
>>>> or S4
>>>> states) so that the system resume time can be improved.
>>>>
>>>> Please let me know if any inputs.
>>>
>>> I can only think of one minor side-effect that would be runtime 
>>> suspending back
>>> too early after system resume. This could happen when connecting the 
>>> first
>>> usb device to a roothub on a (system) suspended setup?
>>>
>>> steps:
>>> 1. in system suspend, no usb devices connected, xhci in D3, can 
>>> signal wake with PME#
>>> 2. connect first usb device, xHC signals PME# wake
>>> 3. system resumes, xhci resumes to D0, but no actity visible on xHC 
>>> port registers
>>
>> Thanks for bringing up this topic Basavaraj.
>>
>> Sorry for jumping into this thread, but was looking to optimize this 
>> resume timing as well, since it is affecting some of the host driven 
>> bus resume situations.  Just had a quick question about where the 
>> 120ms delay is required...
>>
>>  From what I'm gathering from the USB3 spec, the 120ms timeout is the 
>> recommended time for tU3WakeupRetryDelay ("Table 7-12. LTSSM State 
>> Transition Timeouts").  This is the retry time that the device will 
>> wait before re-issuing another (potential) LFPS U3 wake.
>>
>> My idea was to see if we could limit this delay only for when a SSUSB 
>> device is already connected to the root hub.  (ignore if HSUSB device 
>> connected)  We would be able to eliminate the delay for:
>> 1.  No device connected to root hub
>> 2.  Only HSUSB device connected
>>
>> Is that a possibility we can add on top of what Basavaraj is adding?
>>
> 
> Sounds reasonable,
> Yes the 120ms was intended for the U3 wake delay for SuperSpeed devices.
> 
> We should probably also check for CAS bit in xhci_pending_portevent()
> (I'll add that CAS check)
> 

Thanks for the info.  I'll make a change to add the checks I mentioned 
above and submit it as a separate patch for review.

Thanks
Wesley Cheng
