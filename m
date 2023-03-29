Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C66F6CD271
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 09:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjC2HBj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 03:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjC2HB3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 03:01:29 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A523ABE
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 00:01:02 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T2oHne029637;
        Wed, 29 Mar 2023 07:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vrr/JCTOu5TKr+n0Uq+E1ogml4BfoaKtNdBuEp3ejYQ=;
 b=E03sOE//hfTlD6y54i+Cz6NtMg/uJMAk8hkPOilNDLXrq2Oj8IgIOX8HXHZgyrzoKEW2
 6imLAmv9dJRIcohWktouvujkCxVayGTcHhL57OUUpHDWiiwT0sRgAf0y6/xCZE0K8B1g
 RAod5j28ixV8o3YiIs09XmLpK77IfAbxgSFCd3uF1Tu8rhgf4tVkU2tQLnGIH2/ZxNJa
 JradIqS9P2Fiz2XFQjwqXjgwiPlm5W+bXxIIpUPVN50iJjxYa25Kbz3g6tGkU/BN485c
 Ay8wRvMQbjPtH5JSgAdxBu8iFarQ+loY6h5de2NPReZbt+BHLamef2BbpwkCoGo3BUg6 zA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmb8h0mqc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 07:00:58 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32T70vaB025363
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 07:00:57 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 29 Mar
 2023 00:00:56 -0700
Message-ID: <d82172a1-7f09-bb0f-fa04-d6151eb72f4f@quicinc.com>
Date:   Wed, 29 Mar 2023 15:00:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/6] usb: gadget: f_fs: add a device reference of
 usb_gadget->dev
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679911940-4727-4-git-send-email-quic_linyyuan@quicinc.com>
 <ZCPgbqSLG4s9lSxv@kroah.com>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <ZCPgbqSLG4s9lSxv@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bkK-p_TWHXcHCA0QODYSZb5ifuSgyCfH
X-Proofpoint-GUID: bkK-p_TWHXcHCA0QODYSZb5ifuSgyCfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_01,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=782
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290057
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 3/29/2023 2:53 PM, Greg Kroah-Hartman wrote:
> On Mon, Mar 27, 2023 at 06:12:18PM +0800, Linyu Yuan wrote:
>> It is known that dev_vdbg() macro can accept NULL or non-NULL dev pointer.
>>
>> Add a struct device *dev member in struct ffs_data, set it to NULL before
>> binding or after unbinding to a usb_gadget, set it reference of usb_gadget
>> ->dev when bind success.
>>
>> Then it can help replace private pr_vdebug() to dev_vdbg() consistently.
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>> v3: new patch in this version
>>
>>   drivers/usb/gadget/function/f_fs.c | 3 +++
>>   drivers/usb/gadget/function/u_fs.h | 1 +
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index a4051c8..25461f1 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -1722,6 +1722,7 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
>>   		return NULL;
>>   	}
>>   
>> +	ffs->dev = NULL;
>>   	refcount_set(&ffs->ref, 1);
>>   	atomic_set(&ffs->opened, 0);
>>   	ffs->state = FFS_READ_DESCRIPTORS;
>> @@ -1831,6 +1832,7 @@ static int functionfs_bind(struct ffs_data *ffs, struct usb_composite_dev *cdev)
>>   	}
>>   
>>   	ffs->gadget = cdev->gadget;
>> +	ffs->dev = &cdev->gadget->dev;
>>   	ffs_data_get(ffs);
>>   	return 0;
>>   }
>> @@ -1843,6 +1845,7 @@ static void functionfs_unbind(struct ffs_data *ffs)
>>   		mutex_lock(&ffs->mutex);
>>   		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
>>   		ffs->ep0req = NULL;
>> +		ffs->dev = NULL;
>>   		ffs->gadget = NULL;
>>   		clear_bit(FFS_FL_BOUND, &ffs->flags);
>>   		mutex_unlock(&ffs->mutex);
>> diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/function/u_fs.h
>> index 4b3365f..c5f6167 100644
>> --- a/drivers/usb/gadget/function/u_fs.h
>> +++ b/drivers/usb/gadget/function/u_fs.h
>> @@ -146,6 +146,7 @@ enum ffs_setup_state {
>>   
>>   struct ffs_data {
>>   	struct usb_gadget		*gadget;
>> +	struct device			*dev;
> No, sorry, this is not correct.
>
> You already have a struct device right there in the struct usb_gadget.
> Use that one instead, as you are just setting this pointer to the same
> value (see above where you set it.)


just want to use consistent dev_(v)dbg() related macro, to avoid 
reference  usb_gadget->dev

when usb_gadget is NULL.


>
> thanks,
>
> greg k-h
