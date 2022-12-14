Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80CA964C6E9
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 11:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbiLNKOS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Dec 2022 05:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237700AbiLNKNX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 05:13:23 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B7421E1D
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 02:12:20 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BE7RPnI032191;
        Wed, 14 Dec 2022 10:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Pr+D5wBj3WjLVVxiRsjK/Pvfq5ZjcHuSrGjvEtfDDfk=;
 b=BMW2jxsRh4wpxpTDHGcmZB+a6gJ2nsh6u2sxmQQHKa18cAaon+PhzT6m2ubMDNpJ/46r
 hlfnUoo+JEWX1lCfS2TiCWDKpdzb3qHQoEY8mVQu9rY6fOYXB6Mb0wfzdTlbfnLHKel5
 VSvjZZvSSoo96GqrTYLh+35dwk8gOFQCeXVivOuFu01WnJyrR6fFyoxnAgsgaM1PuxXJ
 QNFYsCSZ9NCetesrue7XiWglUVbxAo810dchRn6/wLjlpUeQZ5dKADv5Z08rR6eU5o1Z
 kUqtE1g6r7yJpeh+PR3Iathx5+WtngKnZZ+uYbkvkgLLpRMreMSyRyItyv4T50bcAH+9 ig== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6rcrq8q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Dec 2022 10:12:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BEACGkE029649
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Dec 2022 10:12:16 GMT
Received: from [10.206.24.224] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 14 Dec
 2022 02:12:13 -0800
Message-ID: <43bbd23f-f560-8b65-daaf-2f205082fc7f@quicinc.com>
Date:   Wed, 14 Dec 2022 15:42:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [v3] usb: gadget: f_fs: Prevent race between functionfs_unbind &
 ffs_ep0_queue_wait
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     John Keeping <john@metanate.com>, <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>
References: <20221125054119.25135-1-quic_ugoswami@quicinc.com>
 <68e1a725-9343-c7ad-ff70-bcbf11a11bc8@quicinc.com>
 <Y5mICGooaaQJOOQL@kroah.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <Y5mICGooaaQJOOQL@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MmetKGCNP0Iiv_ok9gdbPvh2tEnS1GC6
X-Proofpoint-ORIG-GUID: MmetKGCNP0Iiv_ok9gdbPvh2tEnS1GC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_04,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=791
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212140081
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 12/14/22 1:53 PM, Greg Kroah-Hartman wrote:
> On Wed, Dec 14, 2022 at 12:47:17PM +0530, Udipto Goswami wrote:
>> Hi All,
>>
>> On 11/25/22 11:11 AM, Udipto Goswami wrote:
>>> While performing fast composition switch, there is a possibility that the
>>> process of ffs_ep0_write/ffs_ep0_read get into a race condition
>>> due to ep0req being freed up from functionfs_unbind.
>>>
>>> Consider the scenario that the ffs_ep0_write calls the ffs_ep0_queue_wait
>>> by taking a lock &ffs->ev.waitq.lock. However, the functionfs_unbind isn't
>>> bounded so it can go ahead and mark the ep0req to NULL, and since there
>>> is no NULL check in ffs_ep0_queue_wait we will end up in use-after-free.
>>>
>>> Fix this by making a serialized execution between the two functions using
>>> a mutex_lock(ffs->mutex). Also, dequeue the ep0req to ensure that no
>>> other function can use it after the free operation.
>>>
>>> Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
>>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>>> ---
>>> v3: Moved dequeue out of mutex to prevent deadlock
>>>
>>>    drivers/usb/gadget/function/f_fs.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>>> index 73dc10a77cde..523a961b910b 100644
>>> --- a/drivers/usb/gadget/function/f_fs.c
>>> +++ b/drivers/usb/gadget/function/f_fs.c
>>> @@ -279,6 +279,9 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>>>    	struct usb_request *req = ffs->ep0req;
>>>    	int ret;
>>> +	if (!req)
>>> +		return -EINVAL;
>>> +
>>>    	req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
>>>    	spin_unlock_irq(&ffs->ev.waitq.lock);
>>> @@ -1892,10 +1895,14 @@ static void functionfs_unbind(struct ffs_data *ffs)
>>>    	ENTER();
>>>    	if (!WARN_ON(!ffs->gadget)) {
>>> +		/* dequeue before freeing ep0req */
>>> +		usb_ep_dequeue(ffs->gadget->ep0, ffs->ep0req);
>>> +		mutex_lock(&ffs->mutex);
>>>    		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
>>>    		ffs->ep0req = NULL;
>>>    		ffs->gadget = NULL;
>>>    		clear_bit(FFS_FL_BOUND, &ffs->flags);
>>> +		mutex_unlock(&ffs->mutex);
>>>    		ffs_data_put(ffs);
>>>    	}
>>>    }
>>
>> Gentle reminder for any comments/suggestions on this patch.
> 
> It's the middle of the merge window, and you submitted a patch that has
> obvious coding style issues, so there's nothing that we can do with it
> no matter what...

Apologies for this, I had ran checkpatch, I didn't get any error:

total: 0 errors, 0 warnings, 23 lines checked

0001-usb-gadget-f_fs-Prevent-race-between-functionfs_unbi.patch has no
obvious style problems and is ready for submission.

was curious what's the coding style error you are referring here?
> 
> Also, you are not explaining how this has been tested, or if it really
> solves the problem for you or not, and it seems you are mixing two
> different things into the same patch.

Yah it does solves the problem of the race condition.
For testing this i was running USB Plug-in Plug-out along with fast 
composition switch.

Thanks for pointing it out I'll make a a separate patch for ep0_dequeue.
> 
> thanks,
> 
> greg k-h
