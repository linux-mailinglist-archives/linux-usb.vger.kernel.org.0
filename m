Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33E047AA90
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 14:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbhLTNqV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 08:46:21 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:27664 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232800AbhLTNqV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 08:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1640007981; x=1671543981;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iVRe6fsCl27Ojqo2tcwlK9H93q5OH0MmdUwmGFltg9c=;
  b=pnLxKJTMWXtEaAKVUE9Xxisug1A7677DMK3oltEUj41ouMlGnltNeocF
   KT0lo9yhjG0bGUh3DIUFW1ESLQXKzO+3asuCAqEYW+MjDz97jamaxmKjw
   x8BLLd+ZG0snLELHEq1GnkELF/IpE2FBYSiLkiXMueqIud0J8PPQ+ZnTf
   U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Dec 2021 05:46:21 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 05:46:20 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 20 Dec 2021 05:46:20 -0800
Received: from [10.216.28.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 20 Dec
 2021 05:46:17 -0800
Message-ID: <35df37e9-226b-c059-a538-581b5d2e53ff@quicinc.com>
Date:   Mon, 20 Dec 2021 19:16:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v6] usb: f_fs: Fix use-after-free for epfile
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <balbi@kernel.org>, John Keeping <john@metanate.com>,
        <linux-usb@vger.kernel.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
References: <1638857274-24842-1-git-send-email-quic_ugoswami@quicinc.com>
 <YbdT+6FkeIuHz55L@kroah.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <YbdT+6FkeIuHz55L@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Apologies for the delay, please find the following comments as per my 
understanding inline.

On 13-12-2021 07:38 pm, Greg Kroah-Hartman wrote:
> On Tue, Dec 07, 2021 at 11:37:54AM +0530, Udipto Goswami wrote:
>> Consider a case where ffs_func_eps_disable is called from
>> ffs_func_disable as part of composition switch and at the
>> same time ffs_epfile_release get called from userspace.
>> ffs_epfile_release will free up the read buffer and call
>> ffs_data_closed which in turn destroys ffs->epfiles and
>> mark it as NULL. While this was happening the driver has
>> already initialized the local epfile in ffs_func_eps_disable
>> which is now freed and waiting to acquire the spinlock. Once
>> spinlock is acquired the driver proceeds with the stale value
>> of epfile and tries to free the already freed read buffer
>> causing use-after-free.
>>
>> Following is the illustration of the race:
>>
>>        CPU1                                  CPU2
>>
>>     ffs_func_eps_disable
>>     epfiles (local copy)
>> 					ffs_epfile_release
>> 					ffs_data_closed
>> 					if (last file closed)
>> 					ffs_data_reset
>> 					ffs_data_clear
>> 					ffs_epfiles_destroy
>> spin_lock
>> dereference epfiles
>>
>> Fix this races by taking epfiles local copy & assigning it under
>> spinlock and if epfiles(local) is null then update it in ffs->epfiles
>> then finally destroy it.
Fixes: a9e6f83c2df (usb: gadget: f_fs: stop sleeping in 
ffs_func_eps_disable)
>> Reviewed-by: John Keeping <john@metanate.com>
>> Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
>> Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>> v6: Addressing minor code formatting.
>>
>>   drivers/usb/gadget/function/f_fs.c | 44 +++++++++++++++++++++++++++++---------
>>   1 file changed, 34 insertions(+), 10 deletions(-)
> What commit does this fix?
>
> Does this need to go to stable kernel releases?
>
> thanks,
>
> greg k-h
>
This is fixing Commit:  a9e6f83c2df (usb: gadget: f_fs: stop sleeping in 
ffs_func_eps_disable)

Yes this fix is needed for >=5.4 Kernel releases.

>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 3c584da..6f23a66 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -1711,16 +1711,24 @@ static void ffs_data_put(struct ffs_data *ffs)
>>   
>>   static void ffs_data_closed(struct ffs_data *ffs)
>>   {
>> +	struct ffs_epfile *epfiles;
>> +	unsigned long flags;
>> +
>>   	ENTER();
>>   
>>   	if (atomic_dec_and_test(&ffs->opened)) {
>>   		if (ffs->no_disconnect) {
>>   			ffs->state = FFS_DEACTIVATED;
>> -			if (ffs->epfiles) {
>> -				ffs_epfiles_destroy(ffs->epfiles,
>> -						   ffs->eps_count);
>> -				ffs->epfiles = NULL;
>> -			}
>> +			spin_lock_irqsave(&ffs->eps_lock, flags);
>> +			epfiles = ffs->epfiles;
>> +			ffs->epfiles = NULL;
>> +			spin_unlock_irqrestore(&ffs->eps_lock,
>> +							flags);
>> +
>> +			if (epfiles)
>> +				ffs_epfiles_destroy(epfiles,
>> +						 ffs->eps_count);
> You are accessing epfiles outside of the lock.  How is that ok?
There are 2 parties that are trying to free the ffs->epfiles. We use the 
lock to serialize which party gets to free the ffs->epfiles. Where we 
are making it NULL we protected that, The freeing part doesn't need to 
be inside spinlock because now it is epfiles(local_ variable) with which 
we are trying to operate now. We removed the ffs->epfiles as the common 
structure to operate and made the local variable epfiles to do the job.
>
>> +
>>   			if (ffs->setup_state == FFS_SETUP_PENDING)
>>   				__ffs_ep0_stall(ffs);
>>   		} else {
>> @@ -1767,14 +1775,27 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
>>   
>>   static void ffs_data_clear(struct ffs_data *ffs)
>>   {
>> +	struct ffs_epfile *epfiles;
>> +	unsigned long flags;
>> +
>>   	ENTER();
>>   
>>   	ffs_closed(ffs);
>>   
>>   	BUG_ON(ffs->gadget);
>>   
>> -	if (ffs->epfiles)
>> -		ffs_epfiles_destroy(ffs->epfiles, ffs->eps_count);
>> +	spin_lock_irqsave(&ffs->eps_lock, flags);
>> +	epfiles = ffs->epfiles;
>> +	ffs->epfiles = NULL;
>> +	spin_unlock_irqrestore(&ffs->eps_lock, flags);
>> +
>> +	/*
>> +	 * potential race possible between ffs_func_eps_disable
>> +	 * & ffs_epfile_release therefore maintaining a local
>> +	 * copy of epfile will save us from use-after-free.
>> +	 */
>> +	if (epfiles)
>> +		ffs_epfiles_destroy(epfiles, ffs->eps_count);
> How will it save you from a use-after-free as you never increased a
> reference count on the pointer here?
 From the above we already serialized the one who gets to free it. So 
whoever gets to access will mark it NULL so the other function trying to 
access ffs->epfiles backs off. I think reference count is not applicable 
here.
>
> And don't write code with new races.  Or are you trying to say this
> fixes a race?
Yes this is for an existing race which we encountered.
>
> Just saving off a pointer feels wrong here.  What happens if the lock is
> properly grabbed, then freed, right after you unlock?  You aren't really
> protecting this properly in a normal way that reference counts and locks
> work from what I can tell, only trying to reduce the race window but not
> fixing it.
This I Doubt because the reference count might not be decremented at 
anycase.
>
> thanks,
>
> greg k-h
