Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8A6633DE6
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 14:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232653AbiKVNkf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 08:40:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbiKVNkV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 08:40:21 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E540F59874
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 05:40:16 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMChMjZ014994;
        Tue, 22 Nov 2022 13:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8dOfnuMS4mn6uexQQhbQjcXeXDBAPQQQbPYjSZrz/gA=;
 b=g9F7bHereawxLWUJ2HGmBdbJFxIdFHURchjYn+XpX8YTECqNC2ROvEyWE+0Ri7kOVK+F
 +lA3+vE3KR8D8ZfyLAewm9jSdeUvbW/YfYOqYQ/URl3iE6X1jEx2NZAEUEJ6hXcqoNkn
 MjMTqwxIv8dD29CIRy8HTrKaQMQVBFUhg01Ew5elYKiT50VI5GXopkZTXkA4rhktSUe3
 LbTXvIAwptWQ/0/QcfxmIng3q46RnIOZrSbzCkc4osVUjNGO3SB3Ttyh8dVspY4j1/Bw
 EE4ooZ59/0R92L7KzBvoWHTegyf9cX231koiiL0yJ6VCehS6nvMP6SKO0dJPsE2dJb7N xQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kxrpb6xy7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Nov 2022 13:40:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AMDeAfo012890
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Nov 2022 13:40:10 GMT
Received: from [10.216.47.120] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 22 Nov
 2022 05:40:07 -0800
Message-ID: <9dc742e3-00af-e246-7be3-f4db8a83781b@quicinc.com>
Date:   Tue, 22 Nov 2022 19:10:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [v2] usb: gadget: f_fs: Prevent race between functionfs_unbind &
 ffs_ep0_queue_wait
Content-Language: en-US
To:     John Keeping <john@metanate.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Pratham Pratap" <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
References: <20221116111955.21057-1-quic_ugoswami@quicinc.com>
 <Y3ewqxYSbb2W1Hfq@donbot> <00b2c24d-a663-f16c-deb1-9beb40d424a2@quicinc.com>
 <Y3poWpdn05ZEuaF2@donbot> <3eb52cdb-fc32-8b06-97a5-d5196d4794da@quicinc.com>
 <Y3y21CAt7HBr7NRL@donbot> <a485330a-489b-7f0d-5291-1931ba2a749a@quicinc.com>
 <Y3zJnQKQslBE413v@donbot>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <Y3zJnQKQslBE413v@donbot>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pp_6HRbRBuceZ9PvTUso3m9qddND8Ros
X-Proofpoint-GUID: pp_6HRbRBuceZ9PvTUso3m9qddND8Ros
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_07,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211220099
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,

On 11/22/22 6:37 PM, John Keeping wrote:
> On Tue, Nov 22, 2022 at 05:56:56PM +0530, Udipto Goswami wrote:
>> On 11/22/22 5:17 PM, John Keeping wrote:
>>> On Mon, Nov 21, 2022 at 09:52:43AM +0530, Udipto Goswami wrote:
>>>> Hi John
>>>>
>>>> On 11/20/22 11:18 PM, John Keeping wrote:
>>>>> On Sun, Nov 20, 2022 at 12:23:50PM +0530, Udipto Goswami wrote:
>>>>>> On 11/18/22 9:49 PM, John Keeping wrote:
>>>>>>> On Wed, Nov 16, 2022 at 04:49:55PM +0530, Udipto Goswami wrote:
>>>>>>>> While performing fast composition switch, there is a possibility that the
>>>>>>>> process of ffs_ep0_write/ffs_ep0_read get into a race condition
>>>>>>>> due to ep0req being freed up from functionfs_unbind.
>>>>>>>>
>>>>>>>> Consider the scenario that the ffs_ep0_write calls the ffs_ep0_queue_wait
>>>>>>>> by taking a lock &ffs->ev.waitq.lock. However, the functionfs_unbind isn't
>>>>>>>> bounded so it can go ahead and mark the ep0req to NULL, and since there
>>>>>>>> is no NULL check in ffs_ep0_queue_wait we will end up in use-after-free.
>>>>>>>>
>>>>>>>> Fix this by making a serialized execution between the two functions using
>>>>>>>> a mutex_lock(ffs->mutex). Also, dequeue the ep0req to ensure that no
>>>>>>>> other function can use it after the free operation.
>>>>>>>>
>>>>>>>> Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
>>>>>>>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>>>>>>>> ---
>>>>>>>> v2: Replaces spinlock with mutex & added dequeue operation in unbind.
>>>>>>>>
>>>>>>>>      drivers/usb/gadget/function/f_fs.c | 7 +++++++
>>>>>>>>      1 file changed, 7 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>>>>>>>> index 73dc10a77cde..1439449df39a 100644
>>>>>>>> --- a/drivers/usb/gadget/function/f_fs.c
>>>>>>>> +++ b/drivers/usb/gadget/function/f_fs.c
>>>>>>>> @@ -279,6 +279,9 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>>>>>>>>      	struct usb_request *req = ffs->ep0req;
>>>>>>>>      	int ret;
>>>>>>>> +	if (!req)
>>>>>>>> +		return -EINVAL;
>>>>>>>> +
>>>>>>>>      	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
>>>>>>>>      	spin_unlock_irq(&ffs->ev.waitq.lock);
>>>>>>>> @@ -1892,10 +1895,14 @@ static void functionfs_unbind(struct ffs_data *ffs)
>>>>>>>>      	ENTER();
>>>>>>>>      	if (!WARN_ON(!ffs->gadget)) {
>>>>>>>> +		mutex_lock(&ffs->mutex);
>>>>>>>> +		/* dequeue before freeing ep0req */
>>>>>>>> +		usb_ep_dequeue(ffs->gadget->ep0, ffs->ep0req);
>>>>>>>>      		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
>>>>>>>>      		ffs->ep0req = NULL;
>>>>>>>>      		ffs->gadget = NULL;
>>>>>>>>      		clear_bit(FFS_FL_BOUND, &ffs->flags);
>>>>>>>> +		mutex_unlock(&ffs->mutex);
>>>>>>>
>>>>>>> There's now a deadlock here if some other thread is waiting in
>>>>>>> __ffs_ep0_queue_wait() on ep0req_completion.
>>>>>>>
>>>>>>> You need to dequeue before taking the lock.
>>>>>> That's a control request right, will it be async?
>>>>>>
>>>>>> Anyway I see only 2 possible threads ep0_read/ep0_write who calls
>>>>>> ep0_queue_wait and waits for the completion of ep0req and both
>>>>>> ep0_read/write are prptected by the mutex lock so i guess execution won't
>>>>>> reach there right ?
>>>>>> Say functionfs_unbind ran first then ep0_read/write had to wait will the
>>>>>> functionfs_unbind is completed so ep_dequeue will ran, will get completed,
>>>>>> further free the request, mark in NULL. now ep0_read/write will have ep0req
>>>>>> as NULL so bail out.
>>>>>>
>>>>>> Is reverse then functionfs_unbind will wait will the ep0_read/write is
>>>>>> completed.
>>>>>
>>>>> What guarantee is there that the transfer completes?
>>>>>
>>>>> If there is such a guarantee, then the request will not be queued, so
>>>>> why is usb_ep_dequeue() necessary?
>>>>
>>>> I Agree that we cannot say that for sure, but we see that
>>>> wait_for_completion in the ep0_queue_wait is also inside mutex which was
>>>> acquired in ep0_read/write right?
>>>
>>> Correct.
>>>
>>>> I Though of maintaining the uniformity for the approaches.
>>>
>>> What uniformity?  If one process is blocked waiting for completion and
>>> another process wants to cancel the operation, then the cancel
>>> (usb_eq_dequeue()) must run concurrently with the wait, otherwise the
>>> blocked process will never wake up.
>>
>> I get that, we want to rely on the dequeue to get us unblocked.
>> But this is also true right that doing dequeue outside might cause this?
>>
>> functionfs_unbind
>> ep0_dequeue
>> 			ffs_ep0_read
>> 			mutex_lock()
>> giveback		ep0_queue
>> 			map request buffer
>> unmap buffer
>>
>> This can affect the controller's list i.e the pending_list for ep0 or might
>> also result on controller accessing a stale memory address isn't it ?
>>
>> Or does the mutex would let the ep0_read execute in atomic context? No
>> right. Will it not be able to execute parallely? If not then yah we can do
>> dequeue outside mutex for sure.
> 
> I would expect that if we're in unbind then any attempt to enqueue a new
> request will fail, so if the mutex is taken in the case above ep_queue()
> should fail with -ESHUTDOWN.
> 
> But I can't actually find an point to any code that ensures that is the
> case!
> 
> This doesn't matter too much though - it's not going to result in any
> access to stale memory because either:
> 
> 	ep0_dequeue
> 				ffs_ep0_read
> 				mutex_lock()
> 				ep0_queue
> 				... wait for response ...
> 				read ep0req->status
> 				mutex_unlock()
> 	mutex_lock()
> 	free_ep0_request
> 	...
> 
> or:
> 
> 				ffs_ep0_read
> 				mutex_lock()
> 				ep0_queue
> 	ep0_dequeue
> 				wake up
> 				read ep0req->status
> 				mutex_unlock()
> 	mutex_lock()
> 	free_ep0_request
> 	...
> 
> The first case isn't ideal as we don't want to be waiting for a request
> while unbinding, but it's not unsafe.

Thanks for the clarification, i'll take the dequeue out of the mutex and 
do some testing, will update it in v3.

Thanks again,
-Udipto
