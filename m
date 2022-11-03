Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0FD4617ACD
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 11:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbiKCK1R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 06:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiKCK1Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 06:27:16 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8726EC778
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 03:27:14 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A3AGg3B022758;
        Thu, 3 Nov 2022 10:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CCpeDMm1fY1DquAT0oa0wfRnCpz+vHNl78J2vRQ8Dhk=;
 b=YH3Xq/NFrm/kxop53VpYGrj43GUl8pg5UDidNWRhUuNY6dZWw5xCGpGEC0dKAZKbCTVo
 4W6KfHb6vuzxvzumCaTAnbKjz0RBJ0aG8IVjX22SeYSLQXGoHvWcYTgxAz9m1c1uXglr
 AiNJep+X7mJAjZWRY3G5dDHz+LlOBok4UnOBO2VJslyWvByGSczCN4PEVxKcf5RH2ChO
 KXRWPDxMZMoUibiRqECTJi1+YdL591fhNzqngJxD4zMgy02LHNFk+JMD8cFbC7WIR1Ib
 ujhHzK/xCBC+Bi37bcq9ywJ8e5nLzexZgjC0sTk1gvErqt5apiuHJhz6pjYFVbj2D6FC Uw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3km71ggvmj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Nov 2022 10:27:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A3AR96L027062
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Nov 2022 10:27:09 GMT
Received: from [10.206.25.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 3 Nov 2022
 03:27:05 -0700
Message-ID: <6b3e061f-f606-b498-cf5d-5fbfd79ced67@quicinc.com>
Date:   Thu, 3 Nov 2022 15:57:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] usb: gadget: f_fs: Prevent race between functionfs_unbind
 & ffs_ep0_queue_wait
Content-Language: en-US
To:     John Keeping <john@metanate.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Pratham Pratap" <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
References: <20221103073821.8210-1-quic_ugoswami@quicinc.com>
 <Y2OKQ5xS23VYeRyj@donbot>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <Y2OKQ5xS23VYeRyj@donbot>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8BFGwulqC221tm-yAvlGFve4vvwrwbCm
X-Proofpoint-ORIG-GUID: 8BFGwulqC221tm-yAvlGFve4vvwrwbCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=688
 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030072
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,

On 11/3/22 3:00 PM, John Keeping wrote:
> On Thu, Nov 03, 2022 at 01:08:21PM +0530, Udipto Goswami wrote:
>> While performing fast composition switch, there is a possibility that the
>> process of ffs_ep0_write/ffs_ep0_read get into a race condition
>> due to ep0req being freed up from functionfs_unbind.
>>
>> Consider the scenario that the ffs_ep0_write calls the ffs_ep0_queue_wait
>> by taking a lock &ffs->ev.waitq.lock. However, the functionfs_unbind isn't
>> bounded so it can go ahead and mark the ep0req to NULL, and since there
>> is no NULL check in ffs_ep0_queue_wait we will end up in use-after-free.
>>
>> Fix this by introducing a NULL check before any req operation.
>> Also to ensure the serialization, perform the ep0req ops inside
>> spinlock &ffs->ev.waitq.lock.
>>
>> Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>>   drivers/usb/gadget/function/f_fs.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 73dc10a77cde..39980b2bf285 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -279,6 +279,13 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>>   	struct usb_request *req = ffs->ep0req;
>>   	int ret;
>>   
>> +	if (!req)
>> +		return -EINVAL;
>> +	/*
>> +	 * Even if ep0req is freed won't be a problem since the local
>> +	 * copy of the request will be used here.
>> +	 */
> 
> This doesn't sound right - if we set ep0req to NULL then we've called
> usb_ep_free_request() on it so the request is not longer valid.

Yes I agree as soon as we spin_unlock it the functionfs_unbind will 
execute and free_up the req, so performing and ep_queue after that even 
if it is a local copy could be fatal.

          ret = usb_ep_queue(ffs->gadget->ep0, req, GFP_ATOMIC);
          if (unlikely(ret < 0))
                  return ret;

         spin_unlock_irq(&ffs->ev.waitq.lock);
  We can move the spin_unlock after to queue operation perhaps ?

> 
>>   	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
>>   
>>   	spin_unlock_irq(&ffs->ev.waitq.lock);
>> @@ -1892,11 +1899,13 @@ static void functionfs_unbind(struct ffs_data *ffs)
>>   	ENTER();
>>   
>>   	if (!WARN_ON(!ffs->gadget)) {
>> +		spin_lock_irq(&ffs->ev.waitq.lock);
>>   		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
>>   		ffs->ep0req = NULL;
>>   		ffs->gadget = NULL;
>>   		clear_bit(FFS_FL_BOUND, &ffs->flags);
>>   		ffs_data_put(ffs);
>> +		spin_unlock_irq(&ffs->ev.waitq.lock);
> 
> ffs may have been freed in ffs_data_put() so accessing the lock here is
> unsafe.
maybe we can move it before data_put ?
    		clear_bit(FFS_FL_BOUND, &ffs->flags);
  +		spin_unlock_irq(&ffs->ev.waitq.lock);
    		ffs_data_put(ffs);

the intention here is to protect the ep0req only since the 
ep0_queue_wait is also doing the assignments after taking the lock.

Thanks,
-Udipto
