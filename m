Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13D766E71C9
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 05:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbjDSDpT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 23:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbjDSDpL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 23:45:11 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E5C975D
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 20:45:05 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33J2c44t005297;
        Wed, 19 Apr 2023 03:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7J5ZelWkH3bE2xRa/Bw4WIqZzggkZbW9uDVyU3RVebY=;
 b=KtMxZ5BfoXzAXG6/K82rKN96OVYEMmEDyCxVJSHXRvRcYPH3SaoVgcR+1o5xCAKXxfJo
 U+MT11ePbOES3kHtOZ33Qd6Qr3oSxSMlp6YFOIwUAOHNraI/ScEvQSKrFuSDm2GQY/K4
 eeo4skulEQya3jNUbYZrdPGA4FAkzGeWVZHQTTkGOS2+o71W9O3dA6lmtH32fLtOVjA6
 nIasg/EVk9Kd5l9WUF0RUb9Mf6ujS4PqLGEIdMDcacSGBvoK41SI2IRb6GWmMJrfYEca
 vNL6wUdNqi4NXAsgg7wtWo+r95TAa8pgfZUdALs+cOVSlUwtZ0IAC+DClp/SlBs+WKXJ lQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q1v2ahwhq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 03:44:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33J3iwxl029945
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 03:44:58 GMT
Received: from [10.217.217.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 18 Apr
 2023 20:44:55 -0700
Message-ID: <054efee7-bc49-ef83-9394-8cefae258c84@quicinc.com>
Date:   Wed, 19 Apr 2023 09:14:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5] usb: dwc3: debugfs: Prevent any register access when
 devices
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        "Jack Pham" <quic_jackp@quicinc.com>, <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20230418121835.17550-1-quic_ugoswami@quicinc.com>
 <ZD6Us2PoD4UfY27S@hovoldconsulting.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <ZD6Us2PoD4UfY27S@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kLqUidXtX-a29X3VYbkSBCHRdgNUUAuX
X-Proofpoint-ORIG-GUID: kLqUidXtX-a29X3VYbkSBCHRdgNUUAuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_17,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=644
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190032
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 4/18/23 6:31 PM, Johan Hovold wrote:
> On Tue, Apr 18, 2023 at 05:48:35PM +0530, Udipto Goswami wrote:
> 
> First, the subject of this patch looks wrong.
> 
>> When the dwc3 device is runtime suspended, various required clocks would
>> get disabled and it is not guaranteed that access to any registers would
>> work. Depending on the SoC glue, a register read could be as benign as
>> returning 0 or be fatal enough to hang the system.
>>
>> In order to prevent such scenarios of fatal errors, make sure to resume
>> dwc3 then allow the function to proceed.
>>
>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> I did not sign-off on this patch (and neither did Oliver I presume).
> 
> You must never add a SoB on behalf on someone else without their
> permission. Please read Documentation/process/submitting-patches.rst and
> make sure you understand what SoB means before sending any further
> patches.
> 
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>> v5: Reworked the patch to resume dwc3 while accessing the registers.
> 
> Please include the full changelog for v6 (and future patches).
> 
>>   drivers/usb/dwc3/debugfs.c | 123 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
>> index e4a2560b9dc0..d622b0dfeb76 100644
>> --- a/drivers/usb/dwc3/debugfs.c
>> +++ b/drivers/usb/dwc3/debugfs.c
>> @@ -332,6 +332,13 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
>>   	unsigned int		current_mode;
>>   	unsigned long		flags;
>>   	u32			reg;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (!ret || ret < 0) {
> 
> This is broken as you would not print anything on success (ret == 0).
> 
> Did you test this patch at all?
> 
>> +		pm_runtime_put(dwc->dev);
>> +		return 0;
> 
> Why do you return 'success' on errors?
Hi Johan,

I think missed this one will fix it in v6.
> 
>> +	}
> 
> Johan
