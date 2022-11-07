Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7E661EA19
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 05:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbiKGELP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Nov 2022 23:11:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbiKGELF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Nov 2022 23:11:05 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABEAC742
        for <linux-usb@vger.kernel.org>; Sun,  6 Nov 2022 20:11:01 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A73sYhR005236;
        Mon, 7 Nov 2022 04:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xCxx0HPn+TshUvPxp7puiXBt5eSzRd4sF1m9kO5xe80=;
 b=j4PBPs7AgGOjtEDfQADwvbVMf4Xxe9/bW62h7sFkeL/j6V+vO+igXCv0ewhKtbPEhCZY
 xxOBDHGxg4LyKcBZ8QbyyxxlFWbjUUGsvqInuelOgrXcSJgq2dSEZBpihLCECgzhKSte
 Y6NIPZHjwowQ9Oooz+z9Yi9M4ddp4OsaCGnB1rpmmYfWyAzYqyrDfvQefSz/4t0AFLdE
 Taal9Hjw2OPTaCzEJG/ze3VlVZNIQb8RyIrIgp3JwHmzSjrXLHIgx1m9SbeUGc8WVw5P
 lPzW/dgA7sBE9jDJt+N6eSxlBu/bZ+AKv/4jzE0MFhgnjpdIUEMm40RWILQDUff0QE3Y OA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kppndrbjy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Nov 2022 04:10:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A74Aswq020319
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 7 Nov 2022 04:10:54 GMT
Received: from [10.206.25.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 6 Nov 2022
 20:10:51 -0800
Message-ID: <d18eddfb-ad88-707f-e3b5-c36d66c72e2c@quicinc.com>
Date:   Mon, 7 Nov 2022 09:40:48 +0530
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
 <Y2OKQ5xS23VYeRyj@donbot> <6b3e061f-f606-b498-cf5d-5fbfd79ced67@quicinc.com>
 <Y2Ode1eyrBHEFzGw@donbot> <12d74bde-4eb5-d7ec-97c9-08cc99e13983@quicinc.com>
 <a7bc3084-85fa-0775-baa1-9ea13a31beac@quicinc.com> <Y2T8RfjJusTWB1PC@donbot>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <Y2T8RfjJusTWB1PC@donbot>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Sr2yNCU27g1pS8BfPp7IIFQJ-MOSYCFL
X-Proofpoint-GUID: Sr2yNCU27g1pS8BfPp7IIFQJ-MOSYCFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_16,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 mlxlogscore=698 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070033
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,

On 11/4/22 5:19 PM, John Keeping wrote:
> On Fri, Nov 04, 2022 at 03:44:09PM +0530, Udipto Goswami wrote:
>> On 11/3/22 4:59 PM, Udipto Goswami wrote:
>>> On 11/3/22 4:22 PM, John Keeping wrote:
>>>> On Thu, Nov 03, 2022 at 03:57:02PM +0530, Udipto Goswami wrote:
>>>>> On 11/3/22 3:00 PM, John Keeping wrote:
>>>>>> On Thu, Nov 03, 2022 at 01:08:21PM +0530, Udipto Goswami wrote:
>>>>>>> While performing fast composition switch, there is a
>>>>>>> possibility that the
>>>>>>> process of ffs_ep0_write/ffs_ep0_read get into a race condition
>>>>>>> due to ep0req being freed up from functionfs_unbind.
>>>>>>>
>>>>>>> Consider the scenario that the ffs_ep0_write calls the
>>>>>>> ffs_ep0_queue_wait
>>>>>>> by taking a lock &ffs->ev.waitq.lock. However, the
>>>>>>> functionfs_unbind isn't
>>>>>>> bounded so it can go ahead and mark the ep0req to NULL,
>>>>>>> and since there
>>>>>>> is no NULL check in ffs_ep0_queue_wait we will end up in
>>>>>>> use-after-free.
>>>>>>>
>>>>>>> Fix this by introducing a NULL check before any req operation.
>>>>>>> Also to ensure the serialization, perform the ep0req ops inside
>>>>>>> spinlock &ffs->ev.waitq.lock.
>>>>>>>
>>>>>>> Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
>>>>>>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>>>>>>> ---
>>>>>>>     drivers/usb/gadget/function/f_fs.c | 9 +++++++++
>>>>>>>     1 file changed, 9 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/usb/gadget/function/f_fs.c
>>>>>>> b/drivers/usb/gadget/function/f_fs.c
>>>>>>> index 73dc10a77cde..39980b2bf285 100644
>>>>>>> --- a/drivers/usb/gadget/function/f_fs.c
>>>>>>> +++ b/drivers/usb/gadget/function/f_fs.c
>>>>>>> @@ -279,6 +279,13 @@ static int
>>>>>>> __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data,
>>>>>>> size_t len)
>>>>>>>         struct usb_request *req = ffs->ep0req;
>>>>>>>         int ret;
>>>>>>> +    if (!req)
>>>>>>> +        return -EINVAL;
>>>>>>> +    /*
>>>>>>> +     * Even if ep0req is freed won't be a problem since the local
>>>>>>> +     * copy of the request will be used here.
>>>>>>> +     */
>>>>>>
>>>>>> This doesn't sound right - if we set ep0req to NULL then we've called
>>>>>> usb_ep_free_request() on it so the request is not longer valid.
>>>>>
>>>>> Yes I agree as soon as we spin_unlock it the functionfs_unbind
>>>>> will execute
>>>>> and free_up the req, so performing and ep_queue after that even
>>>>> if it is a
>>>>> local copy could be fatal.
>>>>>
>>>>>            ret = usb_ep_queue(ffs->gadget->ep0, req, GFP_ATOMIC);
>>>>>            if (unlikely(ret < 0))
>>>>>                    return ret;
>>>>>
>>>>>           spin_unlock_irq(&ffs->ev.waitq.lock);
>>>>>    We can move the spin_unlock after to queue operation perhaps ?
>>>>
>>>> I don't think it's that simple.  The documentation for
>>>> usb_ep_free_request() says:
>>>>
>>>>      * Caller guarantees the request is not queued, and that it will
>>>>      * no longer be requeued (or otherwise used).
>>>>
>>>> so some extra synchronisation is required here.
>>>>
>>>> By the time we get to functionfs_unbind() everything should be disabled
>>>> by ffs_func_disable() and ffs_func_unbind() has drained the workqueue,
>>>> but none of that applies to ep0.
>>>>
>>>> I think ffs_unbind() needs to dequeue the ep0 request.
>>>>
>>>> In addition to that, I think we need a new ep0 status variable in struct
>>>> ffs_data so that req is not accessed after wait_for_completion() in
>>>> __ffs_ep0_queue_wait() and that status is set in ffs_ep0_complete().
>>>>
>>>> With the spin_unlock_irq() moved to immediately before
>>>> wait_for_completion() in __ffs_ep0_queue_wait() it looks like everything
>>>> is then safe.
>>>
>>> Thanks for the suggestions, let me try implementing it.
>>>
>> Just curious because i saw __ffs_ep0_queue_wait will only be called from
>> ffs_ep0_read & ffs_ep0_write, both using a mutex_lock(&ffs->mutex)
>>
>> So if we protect the functionfs_unbind with this mutex, it will be better
>> right?
>>
>> @@ -1889,12 +1889,13 @@ static int functionfs_bind(struct ffs_data *ffs,
>> struct usb_composite_dev *cdev)
>>   static void functionfs_unbind(struct ffs_data *ffs)
>>   {
>>          ENTER();
>>
>>          if (!WARN_ON(!ffs->gadget)) {
>> +               ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
>>                  usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
>>                  ffs->ep0req = NULL;
>>                  ffs->gadget = NULL;
>>                  clear_bit(FFS_FL_BOUND, &ffs->flags);
>> +               mutex_unlock(&ffs->mutex);
>>                  ffs_data_put(ffs);
>>          }
>>   }
>>
>> Perhaps we don't have to take care of the the serialization in that case
>> since it will exit the function __ffs_ep0_queue_wait only after everything
>> is done and hence functionfs_unbind will get the control after the
>> ep0_write/read has completed?
>>
>> What do you think ?
> 
> The documentation does say it protects ep0req so this might make sense.
> 
> But I think you need to ensure ep0req is dequeued before locking the
> mutex in order to avoid a deadlock as nothing else is going to complete
> an outstanding request at this point.
Got it, thanks for clarification, i'll make sure to dequeue it  to avoid 
any deadlocks in v2.

-Udipto
