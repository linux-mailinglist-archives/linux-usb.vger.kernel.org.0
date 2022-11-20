Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5426312CB
	for <lists+linux-usb@lfdr.de>; Sun, 20 Nov 2022 08:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiKTHLU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Nov 2022 02:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiKTHLT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Nov 2022 02:11:19 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3760A3173
        for <linux-usb@vger.kernel.org>; Sat, 19 Nov 2022 23:11:17 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AK7B1OL030305;
        Sun, 20 Nov 2022 07:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uZ7vBaJ7t4NbcsMZ8Ss8MTmDKT4iU6iECoaeXL9of0w=;
 b=ezSbK82wi3askPCv7yNl3cQfNcXNRZYfw4PF2SJ3I+koRJpHLx1MNYnFMNv797Y0jYl/
 c24C32rFqSM2JZ/loNLvN0fMjEnuey2GWz8vZ3/w3yZ9NPuC2MDCfEqk2+hJffhj+sns
 YDbmhnXLRE+XG5Z1idBLrMJFs9asbN/dgpc7sd3pw5V2lajpSDW6CBDXu3fiDn/aWbPM
 ykEF46zeTKxYkOBJE6djJiNBReT8OiX95oOUvRLHtw6qEfrWj9Rhc+qpW0BkSqPE2OlY
 HiYXZ7KR9Su7X9HSvGZ5L0WGW1+0GjjZJ9Ai8RyPhJ1pvGtJsnbD31TFXXjMtUX5q6+i zQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kxreahwx9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 20 Nov 2022 07:11:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AK7B0ip024704
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 20 Nov 2022 07:11:00 GMT
Received: from [10.216.51.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sat, 19 Nov
 2022 23:10:57 -0800
Message-ID: <cea921b8-a0d1-fb71-0a6c-fc93ff369f0d@quicinc.com>
Date:   Sun, 20 Nov 2022 12:40:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] usb: gadget: configfs: Prevent double delete from
 purge_configs_funcs
Content-Language: en-US
To:     John Keeping <john@metanate.com>
CC:     Jack Pham <quic_jackp@quicinc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
References: <20221117053548.28158-1-quic_ugoswami@quicinc.com>
 <Y3e0ANWtax4SVONK@donbot>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <Y3e0ANWtax4SVONK@donbot>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: InkMHO_6_1q2qqh6v1uafekeggVyLnOT
X-Proofpoint-ORIG-GUID: InkMHO_6_1q2qqh6v1uafekeggVyLnOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_03,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211200060
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,

On 11/18/22 10:04 PM, John Keeping wrote:
> On Thu, Nov 17, 2022 at 11:05:48AM +0530, Udipto Goswami wrote:
>> Currently the function purge_configs_funcs isn't protected by any lock
>> So there is a potential race possible there id udc called composite_unbind
>> and say at the same time the configfs_composite_bind also got executed.
>> If bind fails and follows the error path, driver will end up calling the
>> purge_configfs_funcs again, resulting in double free from func_list.
>>
>> Fix this by introducing mutex gi->lock to make sure serial execution
>> can be maintained. Also, usage of list_for_each_entry_safe is risky
>> here since the tmp variable is still valid for the next iteration, in
>> order to ensure list traversal is clean, use list_last_entry.
> 
> I don't understand how this can happen.
> 
> purge_configs_funcs() is called from the .bind and .unbind
> usb_gadget_driver hooks, and those should not be able to run at the same
> time - if bind has not succeeded, how does unbinding make sense?

Consider this,
we are going out of the composition i.e unbinding it,
lets say we have 7 functions and we were only at removing the 2 one 
where in the meantime the bind process got called, the udc driver 
doesn't make sure of this, depends on the controller when they call the 
usb_add_gadget probably.

For dwc3 controller specifically, the mode will still be device  so from 
core.c will end up calling gadget_init() which in turn will call 
usb_add_gadget which further does to check_pending_gadget_drivers, 
eventually calling bind.

So, i don't see any serializing mechanism here which would stop the 
execution of make the controller wait until the unbind is completed 
right. Please correct me if i'm wrong.
> 
>> Fixes: 6cd0fe913879 ("usb: gadget: configfs: Preserve function ordering after bind failure")
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>>   drivers/usb/gadget/configfs.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
>> index 3a6b4926193e..f1ac87906897 100644
>> --- a/drivers/usb/gadget/configfs.c
>> +++ b/drivers/usb/gadget/configfs.c
>> @@ -1246,14 +1246,14 @@ static void purge_configs_funcs(struct gadget_info *gi)
>>   {
>>   	struct usb_configuration	*c;
>>   
>> +	mutex_lock(&gi->lock);
>>   	list_for_each_entry(c, &gi->cdev.configs, list) {
>> -		struct usb_function *f, *tmp;
>> +		struct usb_function *f;
>>   		struct config_usb_cfg *cfg;
>>   
>>   		cfg = container_of(c, struct config_usb_cfg, c);
>> -
>> -		list_for_each_entry_safe_reverse(f, tmp, &c->functions, list) {
>> -
>> +		while (!list_empty(&c->functions)) {
>> +			f = list_last_entry(&c->functions, struct usb_function, list);
>>   			list_move(&f->list, &cfg->func_list);
>>   			if (f->unbind) {
>>   				dev_dbg(&gi->cdev.gadget->dev,
>> @@ -1269,6 +1269,7 @@ static void purge_configs_funcs(struct gadget_info *gi)
>>   		c->highspeed = 0;
>>   		c->fullspeed = 0;
>>   	}
>> +	mutex_unlock(&gi->lock);
>>   }
>>   
>>   static int configfs_composite_bind(struct usb_gadget *gadget,
>> -- 
>> 2.17.1
>>

Thanks,
-Udipto
