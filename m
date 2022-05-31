Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7702539155
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 15:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344507AbiEaNGX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 09:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbiEaNGV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 09:06:21 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5002F87207
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654002380; x=1685538380;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4DX338VRWl5LLp6TqCvElHU9sOz4/ltDxMK4rxc+rkM=;
  b=UVwvCRWCoULwr0Ndz4/3OAkf6ZId7z+qSaUyp4xLHBDEMqjg3TLg4880
   egUplc95AtaoQpWic7w1NtDnRRQna/SKHxxXf0WHh29+O1dkk7k0Vjl5C
   eqwh6nAf/63xQMWx1h17gZGM1DqGZeW8rK1XKYVe0bTHN9LKFxKzusbup
   s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 31 May 2022 06:06:18 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 06:06:15 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 06:06:15 -0700
Received: from [10.253.77.86] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 31 May
 2022 06:06:13 -0700
Message-ID: <a550d33d-5487-d769-c2d8-663bd9c413ad@quicinc.com>
Date:   Tue, 31 May 2022 21:06:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 1/2] usb: gadget: ffs: change ep->status safe in
 ffs_epfile_io()
Content-Language: en-US
To:     John Keeping <john@metanate.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, Michael Wu <michael@allwinnertech.com>
References: <1653989775-14267-1-git-send-email-quic_linyyuan@quicinc.com>
 <1653989775-14267-2-git-send-email-quic_linyyuan@quicinc.com>
 <YpX/sILPw90Uvq+S@donbot>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <YpX/sILPw90Uvq+S@donbot>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 5/31/2022 7:44 PM, John Keeping wrote:
> On Tue, May 31, 2022 at 05:36:14PM +0800, Linyu Yuan wrote:
>> If a task read/write data in blocking mode, it will wait the completion
>> in ffs_epfile_io(), if function unbind occurs, ffs_func_unbind() will
>> kfree ffs ep, once the task wake up, it still dereference the ffs ep to
>> obtain the request status.
>>
>> Fix it by moving the request status to io_data which is stack-safe.
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> One minor issue below, but otherwise I like this approach and it will
> help solving a similar issue on the AIO path which I spotted while
> looking into this (ffs_func_unbind() calls ffs_func_eps_disable()
> setting epfile->ep = NULL before draining the completion workqueue where
> ffs_user_copy_worker() relies on epfile->ep being non-null).
>
>> ---
>>   drivers/usb/gadget/function/f_fs.c | 32 +++++++++++++++++---------------
>>   1 file changed, 17 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 4585ee3..dcba835 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -122,8 +122,6 @@ struct ffs_ep {
>>   	struct usb_endpoint_descriptor	*descs[3];
>>   
>>   	u8				num;
>> -
>> -	int				status;	/* P: epfile->mutex */
>>   };
>>   
>>   struct ffs_epfile {
>> @@ -227,6 +225,9 @@ struct ffs_io_data {
>>   	bool use_sg;
>>   
>>   	struct ffs_data *ffs;
>> +
>> +	int status;
>> +	struct completion done;
>>   };
>>   
>>   struct ffs_desc_helper {
>> @@ -707,12 +708,12 @@ static const struct file_operations ffs_ep0_operations = {
>>   
>>   static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
>>   {
>> +	struct ffs_io_data *io_data = req->context;
>> +
>>   	ENTER();
>> -	if (req->context) {
>> -		struct ffs_ep *ep = _ep->driver_data;
>> -		ep->status = req->status ? req->status : req->actual;
>> -		complete(req->context);
>> -	}
>> +
>> +	io_data->status = req->status ? req->status : req->actual;
>> +	complete(&io_data->done);
>>   }
>>   
>>   static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
>> @@ -1050,7 +1051,6 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>>   		WARN(1, "%s: data_len == -EINVAL\n", __func__);
>>   		ret = -EINVAL;
>>   	} else if (!io_data->aio) {
>> -		DECLARE_COMPLETION_ONSTACK(done);
>>   		bool interrupted = false;
>>   
>>   		req = ep->req;
>> @@ -1066,7 +1066,8 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>>   
>>   		io_data->buf = data;
>>   
>> -		req->context  = &done;
>> +		init_completion(&io_data->done);
>> +		req->context  = io_data;
>>   		req->complete = ffs_epfile_io_complete;
>>   
>>   		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
>> @@ -1075,7 +1076,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>>   
>>   		spin_unlock_irq(&epfile->ffs->eps_lock);
>>   
>> -		if (wait_for_completion_interruptible(&done)) {
>> +		if (wait_for_completion_interruptible(&io_data->done)) {
>>   			/*
>>   			 * To avoid race condition with ffs_epfile_io_complete,
>>   			 * dequeue the request first then check
>> @@ -1083,17 +1084,18 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>>   			 * condition with req->complete callback.
>>   			 */
>>   			usb_ep_dequeue(ep->ep, req);
>> -			wait_for_completion(&done);
>> -			interrupted = ep->status < 0;
>> +			wait_for_completion(&io_data->done);
>> +			interrupted = true;
> This is a change in behaviour - shouldn't this be:
>
> 	interrupted = io_data->status;
>
> ?
>
> Otherwise data is lost unnecessarily if the request completes
> successfully in the small window between cancellation and being
> dequeued.

thanks for explanation,  will follow your suggestion in V2.

>>   		}
>>   
>>   		if (interrupted)
>>   			ret = -EINTR;
>> -		else if (io_data->read && ep->status > 0)
>> -			ret = __ffs_epfile_read_data(epfile, data, ep->status,
>> +		else if (io_data->read && io_data->status > 0)
>> +			ret = __ffs_epfile_read_data(epfile, data, io_data->status,
>>   						     &io_data->data);
>>   		else
>> -			ret = ep->status;
>> +			ret = io_data->status;
>> +
>>   		goto error_mutex;
>>   	} else if (!(req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC))) {
>>   		ret = -ENOMEM;
>> -- 
>> 2.7.4
>>
