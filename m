Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623F36ED924
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 02:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjDYAJo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Apr 2023 20:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjDYAJn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Apr 2023 20:09:43 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E978B4C16
        for <linux-usb@vger.kernel.org>; Mon, 24 Apr 2023 17:09:42 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33ONc8xs019079;
        Tue, 25 Apr 2023 00:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SOkQAxKrRkn+k9d4+LGwaVi4LIeDVCj+o2swae+XKdY=;
 b=dv3DzNGCLsJ3a+5GSbJoz5q7MB2q9z+ano6KefaBnGKsUovV5Mnatj6i64c9e8dRl/js
 WQRTRiakdYFhWdnYautK51dKT4cFWXy7m6JJhCLixfmvb2tiC/0n1S2SWuadvhGqCBzd
 x3UyrzU4vK+hPeapCyuVwdrPLB3/mr74y6fVp1eP4IbvgUZ4fEktvtYvGscx/FLmIJOl
 HDHhydK6YBVh755MpVW0H/wEA4VsrdxodNkdADFBPafWg7MwqflmFGe/6dropxDD8X4x
 mglkPYt+uvvbmBqTVASPH3h20ykCx7O3tbJ9mHLVTQ2ipipdsLfL3vh5ntuyMny8Yq8U iQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5kbut656-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 00:09:32 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33P099ZI001624
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 00:09:09 GMT
Received: from [10.110.17.95] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 24 Apr
 2023 17:09:08 -0700
Message-ID: <5157f331-0e0d-c6c2-1896-bb09c13ee3c0@quicinc.com>
Date:   Mon, 24 Apr 2023 17:09:02 -0700
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
From:   Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <5a4b3d95-c783-b4b2-93d7-57b69b679f7a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 80nVcT4r0ytD_Y3WW7pguGuBVXPLV1Kd
X-Proofpoint-GUID: 80nVcT4r0ytD_Y3WW7pguGuBVXPLV1Kd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=756
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250000
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

On 4/24/2023 8:05 AM, Mathias Nyman wrote:
> On 21.4.2023 7.58, Basavaraj Natikar wrote:
>>
>> On 4/20/2023 10:33 PM, Mark Hasemeyer wrote:
>>>> It may be necessary to wait only for auto-resume cases.
>>> I find this comment misleading as the patch assumes that it's only 
>>> necessary to
>>> wait for auto-resume cases. Are there any cases where the driver 
>>> should wait
>>> during system-resume?
>>
>> Only in case of auto-resume (runtime resume).
>>
>> Rewording the commit message as follows.
> 
> Thanks for fixing this extra system resume delay
> 
> Maybe some kind of big picture explanation could be added to the commit 
> message,
> such as:
> 
> Avoid extra 120ms delay during system resume.
> 
> xHC controller may signal wake up to 120ms before it shows which USB device
> caused the wake on the xHC port registers.
> 
> The xhci driver therefore checks for port activity up to 120ms during 
> resume,
> making sure that the hub driver can see the port change, and won't 
> immediately
> runtime suspend back due to no port activity.
> 
> This is however only needed for runtime resume as system resume will resume
> all child hubs and other child usb devices anyway.
> 
>>
>> Each XHCI controller while xhci_resumes by default takes 120 ms more if
>> there is no activity on the ports or no ports connected. Therefore, if
>> there are more USB controllers on the system, 120 ms more per controller
>> will add delay to system resume from suspended states like s2idle, S3 or
>> S4 states.
>>
>> Once the XHCI controller is in runtime suspended state (D3 state), on USB
>> device hotplug controller will runtime resume (D0 state) and check for
>> pending port events if no events, wait for 120 ms to re-check for port
>> activity to handle missed wake signal.
>>
>> A delay of 120 ms more to re-check for port activity is needed only in
>> auto-resume (runtime resume) cases. Hence, add a check only for runtime
>> resume from runtime suspend (D3->D0) to avoid the 120ms more delay for
>> other PM events (system resume from suspend states like s2idle, S3 or S4
>> states) so that the system resume time can be improved.
>>
>> Please let me know if any inputs.
> 
> I can only think of one minor side-effect that would be runtime 
> suspending back
> too early after system resume. This could happen when connecting the first
> usb device to a roothub on a (system) suspended setup?
> 
> steps:
> 1. in system suspend, no usb devices connected, xhci in D3, can signal 
> wake with PME#
> 2. connect first usb device, xHC signals PME# wake
> 3. system resumes, xhci resumes to D0, but no actity visible on xHC port 
> registers

Thanks for bringing up this topic Basavaraj.

Sorry for jumping into this thread, but was looking to optimize this 
resume timing as well, since it is affecting some of the host driven bus 
resume situations.  Just had a quick question about where the 120ms 
delay is required...

 From what I'm gathering from the USB3 spec, the 120ms timeout is the 
recommended time for tU3WakeupRetryDelay ("Table 7-12. LTSSM State 
Transition Timeouts").  This is the retry time that the device will wait 
before re-issuing another (potential) LFPS U3 wake.

My idea was to see if we could limit this delay only for when a SSUSB 
device is already connected to the root hub.  (ignore if HSUSB device 
connected)  We would be able to eliminate the delay for:
1.  No device connected to root hub
2.  Only HSUSB device connected

Is that a possibility we can add on top of what Basavaraj is adding?

Thanks
Wesley Cheng
