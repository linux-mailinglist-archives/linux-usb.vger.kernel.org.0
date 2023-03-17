Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D66D6BE8AE
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 12:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjCQL4a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 07:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjCQL43 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 07:56:29 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48E5D306
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 04:56:28 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32H7WuJv006738;
        Fri, 17 Mar 2023 11:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3ouq021EQP7EE+wPuERlhL/AHkwd+8kGVhRIPTGsE78=;
 b=hsub2hRXr0a5at9RvPPBc6/xEFt2bODL18ZmpR3GM33bn2RoYN3zhz5YWKXPQhtGcLgq
 p9ayq6t0b8axyzLbdyWaMUqeWwKxSRXEv3/Qu7pmd670wMNBrFsqW7wOJh1heuyzAOCM
 /gKpiaHcUkiNfuS6g2PVoE/jwpHHlEefuh0HmOvtiZ7BdtwcqA+Fmt8CdC6CIl3s97+j
 VtMYyB8svrYK/9b3LU2erBJY2cYwB8uy4iw9TLg14ZfMW8Q7Oq20ICumho2BCYQSxtx3
 8jEFejZT3NBaZi7FpBj78LnugCkILuBNnxWcuQoNfG7AodS1Ch9b8mGwfFh1yvJ0PJd3 3g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pcayea4su-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Mar 2023 11:56:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32HBuM6G023922
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Mar 2023 11:56:22 GMT
Received: from [10.206.24.224] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 17 Mar
 2023 04:56:20 -0700
Message-ID: <19296a11-6199-1cc5-a063-f65f247b960b@quicinc.com>
Date:   Fri, 17 Mar 2023 17:26:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Content-Language: en-US
To:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, <linux-usb@vger.kernel.org>
References: <20230316065858.12687-1-quic_ugoswami@quicinc.com>
 <ZBL6vT4OzdbfW+ZR@kroah.com> <ee8164dc-8078-3ede-df5b-52aefd55d787@suse.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <ee8164dc-8078-3ede-df5b-52aefd55d787@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c2cBUxl9f1k0tTIl1vu0vBpZZzR1rkXS
X-Proofpoint-GUID: c2cBUxl9f1k0tTIl1vu0vBpZZzR1rkXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_07,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 bulkscore=0 mlxlogscore=677
 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170081
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg, Oliver,

On 3/16/23 5:06 PM, Oliver Neukum wrote:
> 
> 
> On 16.03.23 12:17, Greg Kroah-Hartman wrote:
>> On Thu, Mar 16, 2023 at 12:28:58PM +0530, Udipto Goswami wrote:
>>> When the dwc3 device is runtime suspended, various required clocks would
>>> get disabled and it is not guaranteed that access to any registers would
>>> work. Depending on the SoC glue, a register read could be as benign as
>>> returning 0 or be fatal enough to hang the system.
>>>
>>> In order to prevent such scenarios of fatal errors, bail out of debugfs
>>> function is dwc3 is suspended.
>>>
>>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>>> ---
>>> v3: Replace pr_err to dev_err.
>>>
>>>   drivers/usb/dwc3/debugfs.c | 60 ++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 60 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
>>> index 850df0e6bcab..4a9d0994f3b4 100644
>>> --- a/drivers/usb/dwc3/debugfs.c
>>> +++ b/drivers/usb/dwc3/debugfs.c
>>> @@ -544,6 +544,12 @@ static int dwc3_link_state_show(struct seq_file 
>>> *s, void *unused)
>>>       u32            reg;
>>>       u8            speed;
>>> +    if (pm_runtime_suspended(dwc->dev)) {
>>> +        dev_err(dwc->dev,
>>> +            "Invalid operation, DWC3 suspended!");
>>> +        return -EINVAL;
>>> +    }
>>
>> What prevents the device from being suspened right after you check this?

I agree if the debugfs is access while suspend is in progress and lets 
say the pm suspended status got reflected after the check. In this case 
we will still run into the same fatal error scenario. But this will be 
very tight race if in my understanding.

Our scenario was very simple, plug out the cable and try accessing the 
debugfs. In this scenario at least the kernel should not crash.

> 
> Indeed. If you really need a semantics of not waking up the device if
> somebody reads through debugfs, the attached patch should do the job.
> But do you really need it?

Well, the intention was just to avoid the kernel crash. I believe in any 
case the kernel should handle it gracefully and bail out. I understand 
this patch won't help in the race condition which Greg pointed out though.

Could you please suggest any other way which we can try out ?
> 
>      Regards
>          Oliver
