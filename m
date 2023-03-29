Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5066CD272
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 09:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjC2HB4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 03:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjC2HBz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 03:01:55 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B442D48
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 00:01:54 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T5K2GR010654;
        Wed, 29 Mar 2023 07:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/F/v4MB8UPF+7J/d3ZiOQOrnL6y1lk0/vg+a25Uk2GU=;
 b=PgwVcW0UwEVL4xhBeE2AJTdFVtlfDiK4mFTHfa9+Vnnpq4G5q/y5dsuCDnjlreHqSOU2
 yLu8w2g9vvDwQh6DIujGw1mxRRoeJtq/8Lb2VAZG1cVZj/BiL+YuAlxR8bGbQnvUsbQd
 csyY72uxtA/SfX06lKvTaG7Q4+XZgnbkpVEJttPZBkwKXN11iEt+0db10rWWu5bYFg4C
 oambDRHTl/vgTYTppcwjjEKG7UEkg9Kz6o6+rSV5tEaCXRGVb622h6fyc4sYx4oQin+T
 /YtTJV8F4zj2YMg+dp3tLacE112+ZslcD0oVQzB2rFWmZk8Snkv53oUt3RGOzLK5pupJ mA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pm6k8169e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 07:01:53 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32T71qgP026750
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 07:01:53 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 29 Mar
 2023 00:01:51 -0700
Message-ID: <b7e7e88c-0288-a3fa-49f2-b3956ea8a021@quicinc.com>
Date:   Wed, 29 Mar 2023 15:01:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 5/6] usb: gadget: f_fs: replace private pr_vdebug()
 with dev_vdbg
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679911940-4727-5-git-send-email-quic_linyyuan@quicinc.com>
 <ZCPg4U-DwidG3xf1@kroah.com>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <ZCPg4U-DwidG3xf1@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mbez-U-384zTyUABt6eoEmSBX3_C84G3
X-Proofpoint-GUID: mbez-U-384zTyUABt6eoEmSBX3_C84G3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_01,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=723 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303290057
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 3/29/2023 2:55 PM, Greg Kroah-Hartman wrote:
> On Mon, Mar 27, 2023 at 06:12:19PM +0800, Linyu Yuan wrote:
>> Use command dev_vdbg() macro to show some debug message.
>>
>> Also replace some pr_debug/err/warn/info() to dev_dbg/err/warn/info().
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>> v3: new patch in this version
>>
>>   drivers/usb/gadget/function/f_fs.c | 98 +++++++++++++++++++-------------------
>>   drivers/usb/gadget/function/u_fs.h |  6 ---
>>   2 files changed, 49 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 25461f1..0761eaa 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>>   static int __ffs_ep0_stall(struct ffs_data *ffs)
>>   {
>>   	if (ffs->ev.can_stall) {
>> -		pr_vdebug("ep0 stall\n");
>> +		dev_vdbg(ffs->dev, "ep0 stall\n");
>>   		usb_ep_set_halt(ffs->gadget->ep0);
>>   		ffs->setup_state = FFS_NO_SETUP;
>>   		return -EL2HLT;
>>   	} else {
>> -		pr_debug("bogus ep0 stall!\n");
>> +		dev_dbg(ffs->dev, "bogus ep0 stall!\n");
>>   		return -ESRCH;
>>   	}
>>   }
>> @@ -361,7 +361,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
>>   
>>   		/* Handle data */
>>   		if (ffs->state == FFS_READ_DESCRIPTORS) {
>> -			pr_info("read descriptors\n");
>> +			dev_info(ffs->dev, "read descriptors\n");
> When a driver works properly, it should be quiet.  Why is this driver
> being noisy for normal operations?  Shouldn't these types of messages be
> moved to be debugging only?


just keep original design, if you accept, will change to dev_dbg().


>
> thanks,
>
> greg k-h
