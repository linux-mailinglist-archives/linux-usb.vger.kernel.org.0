Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B86D368D143
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 09:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjBGIH3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 03:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjBGIH2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 03:07:28 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E53440FB
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 00:07:27 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3174owSw017881;
        Tue, 7 Feb 2023 08:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pObzctjs6sHh36fLH3VH50UNWqimVx6ZCeG+rI0Xtxk=;
 b=PvDhBb7EXwQMBSEdn/+JlPjGI62FJaFiLgpPZP6TBJYzEme6aA18nNvcW0px84oPUaxl
 Z53v9Z73X7eDr07CznSS+rjEmQU3+z5ON8RvSFN/KWzQxYNIkkNszWkfuwBtfd4T+2+0
 PFnpT9Nrc2/tBDRlfezrVBMlL+C2vSJhz6HiWgkrgf/LzADG57rhw5FZPVH5HOW3+jC/
 l6t41PykVcsF9As26OqRGwn0Q0Z1BHfIq8n9IaL25gm1I8EbiEQ9XzL3wkJh7SrutWcm
 aM3SKvqSKD1Qxd3I2HVokQ6/UebOeYpRXqj1QVprzhg2pbYXVFY/9XP5sVYcEzJxDJGY 9g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nheche07k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Feb 2023 08:07:23 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31787LaY014910
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 7 Feb 2023 08:07:21 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 00:07:20 -0800
Message-ID: <3aa7756b-8967-8ea9-bba1-56811846b5ca@quicinc.com>
Date:   Tue, 7 Feb 2023 16:07:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] usb: typec: disable pm for typec class devices
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
References: <1675752122-8147-1-git-send-email-quic_linyyuan@quicinc.com>
 <Y+H+8Nt/5bgTBv4Y@kuha.fi.intel.com>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <Y+H+8Nt/5bgTBv4Y@kuha.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HKPWNwz7Ar87J4mSUrYjglFMkzWhPmvf
X-Proofpoint-ORIG-GUID: HKPWNwz7Ar87J4mSUrYjglFMkzWhPmvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_01,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=629 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070073
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2/7/2023 3:34 PM, Heikki Krogerus wrote:
> On Tue, Feb 07, 2023 at 02:42:02PM +0800, Linyu Yuan wrote:
>> as there is no pm operation, call device_set_pm_not_required() to disable
>> all typec class devices.
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>>   drivers/usb/typec/class.c   | 5 +++++
>>   drivers/usb/typec/mux.c     | 2 ++
>>   drivers/usb/typec/pd.c      | 3 +++
>>   drivers/usb/typec/retimer.c | 1 +
>>   4 files changed, 11 insertions(+)
> Now this is just boilerplate.
>
> Why not propose this to be done in core for every new device that
> doesn't have a bus, and that doesn't have the pm ops assigned in the
> device type?


thanks, will try.


>
>> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
>> index ed3d070..b75ec6d 100644
>> --- a/drivers/usb/typec/class.c
>> +++ b/drivers/usb/typec/class.c
>> @@ -548,6 +548,7 @@ typec_register_altmode(struct device *parent,
>>   	alt->adev.dev.groups = alt->groups;
>>   	alt->adev.dev.type = &typec_altmode_dev_type;
>>   	dev_set_name(&alt->adev.dev, "%s.%u", dev_name(parent), id);
>> +	device_set_pm_not_required(&alt->adev.dev);
> Note that for alt modes you can't do this. They can be bind to
> drivers - there is a bus for them.


but even in the bus, there is power management,

struct bus_type typec_bus = {
     .name = "typec",
     .dev_groups = typec_groups,
     .match = typec_match,
     .uevent = typec_uevent,
     .probe = typec_probe,
     .remove = typec_remove,
};


we can disable it, right ?


>
> thanks,
>
