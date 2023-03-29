Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F04906CD38E
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 09:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbjC2HrA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 03:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbjC2Hq4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 03:46:56 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558C52723
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 00:46:51 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T2hEJT004145;
        Wed, 29 Mar 2023 07:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9ieE5wDpAonw35NgLK6N6SBCIDMLu08NINCYlNI2T6g=;
 b=EVUWwW8GX/pgAbIUcyF7Oyw1ps2B0O21Wsl6xr5uBMYI2HJNN8vBrtYiCSq8ygtKm/Ih
 mol/GPswfbLRtWVOPXWPYlCyEbN+EHABVTx7yH/75x0A63tkWcXKXHHo+UEHpeXBXu8E
 r8NHbVl+GibfpUNI+OsxXaSkePK8SBm1ZgppaJYmr3HwfObNAPL7Xg2McV3I/s8t/enH
 rQI+h8ajT4rYC6spc4xalSWNBO4s44ysOp45S7DBU0TAJLoUTKLqxA9dOQeebscj1XEE
 vCOfKuNdrHVJsuvpH77uVEv2JFMSVw1LsWoCgJgnQ8BRJPh8sTnKXiV4wlcDr0nyqXsb Cg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmbs88naj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 07:46:50 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32T7knG4012370
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 07:46:49 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 29 Mar
 2023 00:46:48 -0700
Message-ID: <f43f684c-8872-51c3-d72d-2d41b4a4e3e2@quicinc.com>
Date:   Wed, 29 Mar 2023 15:46:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/6] usb: gadget: f_fs: add a device reference of
 usb_gadget->dev
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679911940-4727-4-git-send-email-quic_linyyuan@quicinc.com>
 <ZCPgbqSLG4s9lSxv@kroah.com>
 <d82172a1-7f09-bb0f-fa04-d6151eb72f4f@quicinc.com>
 <ZCPpbtcpo8TE23L5@kroah.com>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <ZCPpbtcpo8TE23L5@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6ZdJ58jdIxFiMm_msro8Q71IV761hnvr
X-Proofpoint-GUID: 6ZdJ58jdIxFiMm_msro8Q71IV761hnvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_02,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=844 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290063
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 3/29/2023 3:31 PM, Greg Kroah-Hartman wrote:
> On Wed, Mar 29, 2023 at 03:00:54PM +0800, Linyu Yuan wrote:
>> On 3/29/2023 2:53 PM, Greg Kroah-Hartman wrote:
>>> On Mon, Mar 27, 2023 at 06:12:18PM +0800, Linyu Yuan wrote:
>>>> It is known that dev_vdbg() macro can accept NULL or non-NULL dev pointer.
>>>>
>>>> Add a struct device *dev member in struct ffs_data, set it to NULL before
>>>> binding or after unbinding to a usb_gadget, set it reference of usb_gadget
>>>> ->dev when bind success.
>>>>
>>>> Then it can help replace private pr_vdebug() to dev_vdbg() consistently.
>>>>
>>>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>>>> ---
>>>> v3: new patch in this version
>>>>
>>>>    drivers/usb/gadget/function/f_fs.c | 3 +++
>>>>    drivers/usb/gadget/function/u_fs.h | 1 +
>>>>    2 files changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>>>> index a4051c8..25461f1 100644
>>>> --- a/drivers/usb/gadget/function/f_fs.c
>>>> +++ b/drivers/usb/gadget/function/f_fs.c
>>>> @@ -1722,6 +1722,7 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
>>>>    		return NULL;
>>>>    	}
>>>> +	ffs->dev = NULL;
>>>>    	refcount_set(&ffs->ref, 1);
>>>>    	atomic_set(&ffs->opened, 0);
>>>>    	ffs->state = FFS_READ_DESCRIPTORS;
>>>> @@ -1831,6 +1832,7 @@ static int functionfs_bind(struct ffs_data *ffs, struct usb_composite_dev *cdev)
>>>>    	}
>>>>    	ffs->gadget = cdev->gadget;
>>>> +	ffs->dev = &cdev->gadget->dev;
>>>>    	ffs_data_get(ffs);
>>>>    	return 0;
>>>>    }
>>>> @@ -1843,6 +1845,7 @@ static void functionfs_unbind(struct ffs_data *ffs)
>>>>    		mutex_lock(&ffs->mutex);
>>>>    		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
>>>>    		ffs->ep0req = NULL;
>>>> +		ffs->dev = NULL;
>>>>    		ffs->gadget = NULL;
>>>>    		clear_bit(FFS_FL_BOUND, &ffs->flags);
>>>>    		mutex_unlock(&ffs->mutex);
>>>> diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/function/u_fs.h
>>>> index 4b3365f..c5f6167 100644
>>>> --- a/drivers/usb/gadget/function/u_fs.h
>>>> +++ b/drivers/usb/gadget/function/u_fs.h
>>>> @@ -146,6 +146,7 @@ enum ffs_setup_state {
>>>>    struct ffs_data {
>>>>    	struct usb_gadget		*gadget;
>>>> +	struct device			*dev;
>>> No, sorry, this is not correct.
>>>
>>> You already have a struct device right there in the struct usb_gadget.
>>> Use that one instead, as you are just setting this pointer to the same
>>> value (see above where you set it.)
>>
>> just want to use consistent dev_(v)dbg() related macro, to avoid reference
>> usb_gadget->dev
>>
>> when usb_gadget is NULL.
> When will usb_gadget be NULL when you want to print out logging
> messages?  You shouldn't be printing out anything during that time
> anyway, right?


when usb_gadget is NULL, there could be debug message because user space 
application

can start configure the ffs instance (like adb ...) for USB 
interface/endpoint/string descriptor.


as dev_dbg related macro is safe to accept NULL, there is no need find 
out when will

usb_gadget is NULL and when will it a valid pointer.


>
> thanks,
>
> greg k-h
