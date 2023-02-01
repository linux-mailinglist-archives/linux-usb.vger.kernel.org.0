Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80796864A2
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 11:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbjBAKqS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 05:46:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjBAKqM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 05:46:12 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030A34234
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 02:46:09 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3117O5Ak026362;
        Wed, 1 Feb 2023 10:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AIvIHPb6j918jU1sM8BFOsKv+qMecvaVDrbkks9ZOno=;
 b=fr4G/ACZFxmBDzXCv+o6DYxgypSc4wU6tj9sWhYfTjfXHbcYTV9fzj8r65B4nxvbNvJf
 MiQkP4//JHRhdTp1mbRMYUSsg/+27Gl/HQ3yBoyfzFR3POSNf5yICBezQxQSyUBsZQGl
 RlTT4qshneEbqqMqrm6fMH4D3iTivCBko8kxuT6MulflKt/LISPOKKW2zn9fIFTxt3n+
 JS1+6S7wKmcPpMmfW/BpzKHo06pGNkNKv25hSpDfT8dYm/P+nKPhL78TH80+IyEWbSky
 hD53A74YSr/uS0tA+hvqC83hJHKmD3oEuG/PTrneopAViAKp4yJIQW1vkFA0M3v2xZLM Mg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3netc4c2nu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Feb 2023 10:46:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 311Ak2dN032124
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 1 Feb 2023 10:46:02 GMT
Received: from [10.206.24.224] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 1 Feb 2023
 02:45:59 -0800
Message-ID: <d30cda1c-7eda-2b59-69cb-205cec303157@quicinc.com>
Date:   Wed, 1 Feb 2023 16:15:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [v2] usb: gadget: configfs: Restrict symlink creation is UDC
 already binded
Content-Language: en-US
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li <frank.li@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, <linux-usb@vger.kernel.org>
References: <20230125072138.21925-1-quic_ugoswami@quicinc.com>
 <87361f5e-f0af-6bb9-ada1-db0f2aabd400@collabora.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <87361f5e-f0af-6bb9-ada1-db0f2aabd400@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _LrRBJElwXmnty9iWRC9xNX-t-3Taatw
X-Proofpoint-ORIG-GUID: _LrRBJElwXmnty9iWRC9xNX-t-3Taatw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 impostorscore=0 phishscore=0 mlxlogscore=279 mlxscore=0 spamscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010093
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Andrzej,

On 1/25/23 6:21 PM, Andrzej Pietrasiewicz wrote:
> Hi Udipto,
> 
> W dniu 25.01.2023 o 08:21, Udipto Goswami pisze:
>> During enumeration or composition switch,a userspace process
>> agnostic of the conventions of configs can try to create function
>> symlinks even after the UDC is bound to current config which is
>> not correct. Potentially it can create duplicates within the
>> current config.
>>
>> Prevent this by adding a check if udc_name already exists then bail
>> out of cfg_link.
>>
>> Fixes: 88af8bbe4ef7 ("usb: gadget: the start of the configfs interface")
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>> v2: Fixed spelling mistakes in commit text.
>>
>>   drivers/usb/gadget/configfs.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/configfs.c 
>> b/drivers/usb/gadget/configfs.c
>> index 78e7353e397b..434e49d29c50 100644
>> --- a/drivers/usb/gadget/configfs.c
>> +++ b/drivers/usb/gadget/configfs.c
>> @@ -455,6 +455,11 @@ static int config_usb_cfg_link(
>>           }
>>       }
>> +    if (gi->composite.gadget_driver.udc_name) {
>> +        ret = -EINVAL;
>> +        goto out;
>> +    }
>> +
> 
> If we want to introduce this kind of check, I'd say it should be done
> as the very first thing in this function - in particular before
> traversing two linked lists (&gi->available_func, &cfg->func_list).
> 
> And, you probably want to keep the word "PATCH" in the title, like this:
> 
> [PATCH v2] usb: gadget: configfs: .....

sure I'll address these in v3.
> 
> Regards,
> 
> Andrzej
> 
>>       f = usb_get_function(fi);
>>       if (IS_ERR(f)) {
>>           ret = PTR_ERR(f);
> 

Thanks,
-Udipto
