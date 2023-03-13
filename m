Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2522E6B7713
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 13:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbjCMMAt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 08:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbjCMMAg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 08:00:36 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF82136441
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 05:00:20 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32DBAWOa029042;
        Mon, 13 Mar 2023 12:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=881pItANG6LGvegWmlaBRaaP7wSbVg5889/4bywBpnA=;
 b=hkFTt72+wiZh7+dbZ4HJFu8Xu6OZItYSZJiW9L9Jp2mSHsnexAFm7Iy3gm+pFwhr8l2J
 O2Y0JcTNnkTWYw4R5vGv8KRPgi+KEiTqWb/smE9/LECpel8OpxAqN+3KLmFuC+P6z2Qb
 DiFdyRHi55ascjIhxFxsGigZcC/YCo8qNI16zWH4MhTAw3qbWEStQt917nNsr8ZGh7r2
 aetU0Xg422JFft7a8qaXS4d5vzF4PbOdvDRNAhtV6QtxPDvG/zn70RMiik61LIlBoabR
 mmpjLX0vQ4+HbtEtDcbP4Znn/wCbtyiUfeiW24zkEipm6BtvVThMEI3Xip8QV8UKoRwj dg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p8hvbmt2w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Mar 2023 12:00:14 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32DC0DEG008363
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Mar 2023 12:00:13 GMT
Received: from [10.206.24.224] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 05:00:11 -0700
Message-ID: <00811915-6e29-ee25-1475-498209565d2e@quicinc.com>
Date:   Mon, 13 Mar 2023 17:29:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, <linux-usb@vger.kernel.org>
References: <20230313091837.19806-1-quic_ugoswami@quicinc.com>
 <ZA7xkLTJ0dE4DQFE@kroah.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <ZA7xkLTJ0dE4DQFE@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BX0BmJTNpTokobS4sYuDyntYytlzR1pB
X-Proofpoint-GUID: BX0BmJTNpTokobS4sYuDyntYytlzR1pB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_05,2023-03-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=748 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303130099
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

On 3/13/23 3:19 PM, Greg Kroah-Hartman wrote:
> On Mon, Mar 13, 2023 at 02:48:37PM +0530, Udipto Goswami wrote:
>> When the dwc3 device is runtime suspended, various required clocks would
>> get disabled and it is not guaranteed that access to any registers would
>> work. Depending on the SoC glue, a register read could be as benign as
>> returning 0 or be fatal enough to hang the system.
>>
>> In order to prevent such scenarios of fatal errors, bail out of debugfs
>> function is dwc3 is suspended.
>>
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>>   drivers/usb/dwc3/debugfs.c | 50 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
>> index 850df0e6bcab..f921d4911ffc 100644
>> --- a/drivers/usb/dwc3/debugfs.c
>> +++ b/drivers/usb/dwc3/debugfs.c
>> @@ -544,6 +544,11 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
>>   	u32			reg;
>>   	u8			speed;
>>   
>> +	if (pm_runtime_suspended(dwc->dev)) {
>> +		seq_puts(s, "Invalid operation, DWC3 suspended!");
>> +		return 0;
> 
> Why are you returning success if an error happened?
> 
> Same thing for all other responses.

Thanks for pointing out, will take care of it in next version.

> 
> thanks,
> 
> greg k-h
