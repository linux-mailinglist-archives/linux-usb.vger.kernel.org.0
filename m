Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76E106FE9B2
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 04:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjEKCG3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 22:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjEKCG2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 22:06:28 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0221E7A
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 19:06:26 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34B1Ckod031886;
        Thu, 11 May 2023 02:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=te4wp0cTntE7FoZ/KOAbo07gx+xHFI/+zIIYQU7/gc0=;
 b=iyBb6mqJW6pxo/doP9l/mHOh81fJoSWTyqr/ZvaDlLG3g6i2EUc1Rb+9yjI7wJw+N8cC
 ozI5H9aZR9NB7vxwdODz2PLfbjJf0+z1/+rVvUVQfCAyJhZxrOwpIXoltrl6cxPP93xO
 V/kGXZ7OEjVwFCkSU503QUbdLpXuO0dZppGtmo7/6g7VWlpv0wfb4p7eeuA2fcQt70Xk
 cIf1lnG5+mCJYrEG1os62s89K9zD0nfxiDFsZUCPtv6UFxDGVbXJvTO4a17KZVDFrNR/
 5bJedxqo68ldvaM+EDqro5VnkxiLT05A6HfDZzr82D0GE+XGG4brB9Kj/m6kQEtuEwaS 3Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qged2h07w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 May 2023 02:06:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34B26Nx0022040
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 May 2023 02:06:23 GMT
Received: from [10.216.32.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 19:06:21 -0700
Message-ID: <c534fd19-2868-818e-9bda-2caa519b2ee1@quicinc.com>
Date:   Thu, 11 May 2023 07:36:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Setting LLUCTL force gen1 bit if max speed is SS for Gen2
 controller
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <e465c69c-3a9d-cbdb-d44e-96b99cfa1a92@quicinc.com>
 <20230510212845.ymxudl4r3f54erkq@synopsys.com>
 <55aeb1ac-a90a-8b2e-7de2-114bfcf7dcb9@quicinc.com>
 <20230511014909.s6hdfidc5vdalhga@synopsys.com>
Content-Language: en-US
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <20230511014909.s6hdfidc5vdalhga@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _oYmvNQutc6KTGUex9PNmM9BpShVum-v
X-Proofpoint-GUID: _oYmvNQutc6KTGUex9PNmM9BpShVum-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110017
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 5/11/2023 7:19 AM, Thinh Nguyen wrote:
> On Thu, May 11, 2023, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 5/11/2023 2:59 AM, Thinh Nguyen wrote:
>>> Hi,
>>>
>>> On Wed, May 10, 2023, Krishna Kurapati PSSNV wrote:
>>>> Hi Team,
>>>>
>>>>    If we set maximum speed to "super-speed" for a SSP capable controller, I
>>>> see device mode working in SS but host mode still works in SSP. From the
>>>> yaml documentation of max-speed, I see the following:
>>>>
>>>>    maximum-speed:
>>>>      description:
>>>>        Tells USB controllers we want to work up to a certain speed. Incase
>>>> this isn't passed via DT, USB controllers should default to their maximum HW
>>>> capability.
>>>>
>>>> Shouldn't this maximum speed get limited to gen1 even for host mode ?
>>>
>>> The description is ambiguous here. However, we only ever use this
>>> property to limit the speed for device mode (from what I see in the
>>> other drivers of the kernel). Should we ever need to limit this for host
>>> mode, IMHO, we should introduce a new property for that and clarify this
>>> property.
>>>
>> Hi Thinh,
>>
>>    Sorry for not being clear. The following is the version and ID of SM8550
>> controller: (usb31 controller)
>>
>> VER_NUM: 0x3139302A
>> VER_TYPE: 0x67612A2A
>> USB3_PRI_USB31_IP_NAME (0xA60C120) = 0x33313130
>>
>> We need to force this to gen-1 to fallback to SS even for host mode too as
>> customers are facing compliance issues on SSP.
>>
> 
> I meant the documentation for maximum-speed property isn't clear for
> cases such as DRD usb controller where the controller can operate in
> different modes. Your description is pretty clear.
> 
>>>>
>>>> If so, can we set LLUCTL Force_Gen1 bit if (Controller is Gen2  && max_speed
>>>> = SuperSpeed) somewhere after GCTL core soft reset is done in set_mode ?
>>>
>>> BTW, that's for dwc_usb31. For dwc_usb32, we use a different register to
>>> limit different eSS speeds and lanecount.
>>>
>>> To limit to highspeed for xhci, we can disable usb3 ports (clear the
>>> PORTSC.PP). I don't think we can force limit to full or low speed for
>>> dwc3 host mode.
>>>
>>
>>  From your explanation, can I send a patch for with the following:
>>
>> 1. Update description for max speed
>> 2. Add force_gen1 property and if it is set, check the version (usb31) and
>> set LLUCTL.Force_Gen1 bit.
>>
>> Later if someone wants to add code for usb32 as well, they can reuse the
>> same property and extend the code for the same.
>>
>> Let me know if this would be acceptable.
>>
> 
> I'm thinking to introduce a generic "host-maximum-speed" property
> instead of a "force_gen1" that's specific to dwc3 controller only.
> 
> So that we can update the documentation for "maximum-speed" as follow:
> 
> * The "maximum-speed" applies to both host and device modes. If
>    "host-maximum-speed" is specified, then the host may have a different
>    constraint.
> 
> Or
> 
> * The "maximum-speed" only applies for device mode. The
>    "host-maximum-speed" is for host mode.
> 
> Thanks,
> Thinh

Hi Thinh,

   If we do so, we need to update the code for supporting other speeds 
as well (changes in xhci would be needed I believe). Wanted to limit 
this to dwc3 only and so was suggesting to add force_gen1 property.

Regards,
Krishna,
