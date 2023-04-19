Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8191C6E71C6
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 05:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbjDSDok (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 23:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbjDSDoi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 23:44:38 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C7246B4
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 20:44:34 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33J3JQX2032266;
        Wed, 19 Apr 2023 03:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5VZUuU1EKu3itvVoguIJaOUqeiNJdmilHIJAMWSF6Os=;
 b=GJstOlQ0uEg239go+zmH0GBL/U2f1/6Ctq5JvDAw8zD3TnIjt4VOXbenZnEgQBiqHD/Y
 4noU6UjqXfry1EHX1d2mYTwLWNAzPn+upsO42u4vCvIuOC3aJX8i1URvfQNGFHFEZT3V
 XqFF1M8exC0mN8PhQLJsS8K+FaoPudrXf5iDxaekT4xvM/6KP6cbsvqk65pbFfLYb3Sl
 /2CHiuah6sU3exl+qiV+7BCF2hKx4tZzkxpPHjBG2KEd/JtLBKNmfsCkTrU0xptGlfJQ
 oXbmfzzqUrnup4rVM/w+/9U4ltNhRz+Z0nE+4yaPqykdrLEe9f0vxDQvifv+k6LBb4Zp pw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q1nf8jtea-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 03:44:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33J3hkI5010360
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 03:43:46 GMT
Received: from [10.217.217.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 18 Apr
 2023 20:43:44 -0700
Message-ID: <149d9492-8166-24d4-d4cc-154eec4c44a7@quicinc.com>
Date:   Wed, 19 Apr 2023 09:13:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5] usb: dwc3: debugfs: Prevent any register access when
 devices
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        <linux-usb@vger.kernel.org>, Oliver Neukum <oneukum@suse.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20230418121835.17550-1-quic_ugoswami@quicinc.com>
 <ZD6Us2PoD4UfY27S@hovoldconsulting.com> <2023041813-stowing-rug-710a@gregkh>
Content-Language: en-US
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <2023041813-stowing-rug-710a@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RYFUqQeTfLG-AARvrYXMvqgqZ6v4wLk5
X-Proofpoint-ORIG-GUID: RYFUqQeTfLG-AARvrYXMvqgqZ6v4wLk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_17,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=179 adultscore=0 mlxscore=2
 spamscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190033
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 4/18/23 6:56 PM, Greg Kroah-Hartman wrote:
> On Tue, Apr 18, 2023 at 03:01:39PM +0200, Johan Hovold wrote:
>> On Tue, Apr 18, 2023 at 05:48:35PM +0530, Udipto Goswami wrote:
>>
>> First, the subject of this patch looks wrong.
>>
>>> When the dwc3 device is runtime suspended, various required clocks would
>>> get disabled and it is not guaranteed that access to any registers would
>>> work. Depending on the SoC glue, a register read could be as benign as
>>> returning 0 or be fatal enough to hang the system.
>>>
>>> In order to prevent such scenarios of fatal errors, make sure to resume
>>> dwc3 then allow the function to proceed.
>>>
>>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>
>> I did not sign-off on this patch (and neither did Oliver I presume).
>>
>> You must never add a SoB on behalf on someone else without their
>> permission. Please read Documentation/process/submitting-patches.rst and
>> make sure you understand what SoB means before sending any further
>> patches.
> 
> Ah, I thought so :(
> 
> Udipto, please go complete the developer legal training that I know your
> company provides for dealing with things like this as they take it very
> seriously, before you resubmit this, or any other kernel patches.
> 
> thanks,
> 
> greg k-h

Hi Greg, Johan, Oliver,

Apologies for this, will go through the guidelines and rework the patch
accordingly.


