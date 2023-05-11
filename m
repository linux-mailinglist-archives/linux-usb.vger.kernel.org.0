Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21BF16FE975
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 03:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjEKB32 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 21:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjEKB31 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 21:29:27 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346474EDD
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 18:29:26 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34B1AiIL025961;
        Thu, 11 May 2023 01:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PMIY8yogcDrHZbfKowGmFG9LTsGQBuf3NyxneKXNfpA=;
 b=MgdsCDtN1kQUfHgh0+8PrUjbhZQQI2ZOe8VHnRaAJ2Kw2FepgT+IeFXhf2ArYhlB9tty
 5Uiihge0tKGek+8eZVE/TUS7Sd40vW327g5IwDy752bnZT+WP22tnPeCjH3XFz0w5d+W
 IUU6oc3QcnpKYyRR3ecQgO3v8oCVfGHA3J8FD+Cg4UYZZf/JcebVuIcvW43NbD30sLhQ
 fTym3qFIgICF2+dYyzW034iq09mcNCKjxGXeh7zWc5LO8OYJS9Po6AbgUAFXKdWNnH4u
 AJLY1E3M9SQ2UBPKA9uW+K2/Vx+6oW7Y+1Ef2aLuUhSnLDd35zLnPFe+j8hY54g/KPq4 Gw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgpfk00rk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 May 2023 01:29:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34B1T585029951
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 May 2023 01:29:05 GMT
Received: from [10.216.32.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 18:29:03 -0700
Message-ID: <55aeb1ac-a90a-8b2e-7de2-114bfcf7dcb9@quicinc.com>
Date:   Thu, 11 May 2023 06:59:00 +0530
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
Content-Language: en-US
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <20230510212845.ymxudl4r3f54erkq@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DkArNSjUi1C9WPqYKA82fWLqYaTMYeYw
X-Proofpoint-GUID: DkArNSjUi1C9WPqYKA82fWLqYaTMYeYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110012
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 5/11/2023 2:59 AM, Thinh Nguyen wrote:
> Hi,
> 
> On Wed, May 10, 2023, Krishna Kurapati PSSNV wrote:
>> Hi Team,
>>
>>   If we set maximum speed to "super-speed" for a SSP capable controller, I
>> see device mode working in SS but host mode still works in SSP. From the
>> yaml documentation of max-speed, I see the following:
>>
>>   maximum-speed:
>>     description:
>>       Tells USB controllers we want to work up to a certain speed. Incase
>> this isn't passed via DT, USB controllers should default to their maximum HW
>> capability.
>>
>> Shouldn't this maximum speed get limited to gen1 even for host mode ?
> 
> The description is ambiguous here. However, we only ever use this
> property to limit the speed for device mode (from what I see in the
> other drivers of the kernel). Should we ever need to limit this for host
> mode, IMHO, we should introduce a new property for that and clarify this
> property.
>
Hi Thinh,

   Sorry for not being clear. The following is the version and ID of 
SM8550 controller: (usb31 controller)

VER_NUM: 0x3139302A
VER_TYPE: 0x67612A2A
USB3_PRI_USB31_IP_NAME (0xA60C120) = 0x33313130

We need to force this to gen-1 to fallback to SS even for host mode too 
as customers are facing compliance issues on SSP.

>>
>> If so, can we set LLUCTL Force_Gen1 bit if (Controller is Gen2  && max_speed
>> = SuperSpeed) somewhere after GCTL core soft reset is done in set_mode ?
> 
> BTW, that's for dwc_usb31. For dwc_usb32, we use a different register to
> limit different eSS speeds and lanecount.
> 
> To limit to highspeed for xhci, we can disable usb3 ports (clear the
> PORTSC.PP). I don't think we can force limit to full or low speed for
> dwc3 host mode.
> 

 From your explanation, can I send a patch for with the following:

1. Update description for max speed
2. Add force_gen1 property and if it is set, check the version (usb31) 
and set LLUCTL.Force_Gen1 bit.

Later if someone wants to add code for usb32 as well, they can reuse the 
same property and extend the code for the same.

Let me know if this would be acceptable.

Regards,
Krishna,


> BR,
> Thinh
> 
>>
>> The reason being, there were some compliance issues seen with SSP on some of
>> our targets and we wanted to drop down to Gen-1 in our targets, but limiting
>> maximum-speed is affecting only device mode.
>>
>> Regards,
>> Krishna,
