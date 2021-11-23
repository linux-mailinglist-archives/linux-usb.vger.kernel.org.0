Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E51945A3D7
	for <lists+linux-usb@lfdr.de>; Tue, 23 Nov 2021 14:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbhKWNhJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Nov 2021 08:37:09 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:29022 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhKWNhI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Nov 2021 08:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637674441; x=1669210441;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=SRDdipB/Jpy61c//gfY8R+QlvolZ49U93q14yzppqo4=;
  b=YZYVrhG54laCRK9lfXbiBk8tKZKHZHetmt1dpyKW2ztJjvF1MftBsdxS
   /5DOInIco8JviXiZnr4NXznec3+OltaPOBHMNBeQecdWhOq/bSDJWkzqL
   oqkbyQR8SJi3/9IgJyGMHpsAVmgfxkosLgUTCBmSGZimMB8JsAMFlNmh/
   8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 23 Nov 2021 05:34:00 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 05:34:00 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 05:34:00 -0800
Received: from [10.216.35.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 23 Nov
 2021 05:33:56 -0800
Subject: Re: [PATCH v2] usb: f_fs: Fix use-after-free for epfile
To:     John Keeping <john@metanate.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
References: <1637316529-31605-1-git-send-email-quic_ugoswami@quicinc.com>
 <YZuX7O0V76gCf+b/@donbot>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
Message-ID: <a77ee104-41d4-1838-bcf5-26ea25a18c36@quicinc.com>
Date:   Tue, 23 Nov 2021 19:03:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YZuX7O0V76gCf+b/@donbot>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,

Thanks for the feedback, will rectify the things mentioned

in the next version.


On 22-11-2021 06:45 pm, John Keeping wrote:
> On Fri, Nov 19, 2021 at 03:38:49PM +0530, Udipto Goswami wrote:
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
>> 				  __ffs_epfile_read_buffer_free
>> 					kfree(read_buffers)
>> 					kfree(epfile)
>> (epfiles still accessible
>>   since local copy)
>> kfree(read_buffers) <use_after_free>
> For added clarity here, it looks like the issue is more like:
>
>          CPU1                            CPU2
>
>          ffs_func_eps_disable
>          epfiles (local copy)
>                                          ffs_epfile_release
>                                          ffs_data_closed
>                                          if (last file closed)
>                                              ffs_data_reset
>                                              ffs_data_clear
>                                              ffs_epfiles_destroy
>                                              free(epfiles)
>          spin_lock
>          dereference epfiles
>
> leading to a use after free, is that correct?
>
> In this case CPU1 may be called via set_alt() from the UDC code and CPU2
> is from a userspace close().


Yes this is exactly the scenario, will use this illustration for this, 
thanks.

>> Another possibility of user after free is with the read_buffers
>> Currently, ffs_func_eps_disable & ffs_epfile_release can race,
>> if ffs_epfile_release ran in between while ffs_func_eps_disable
>> was executing, due to not being in any lock it can go ahead
>> and free the read buffer, but since ffs_func_eps_disable
>> maintains a local copy of epfiles, it will still be valid here
>> which when tried to free again will cause a user_after_free.
>> Following is the illustration of the case:
>>        CPU1				      CPU2
>>
>>     ffs_func_eps_disable
>>     spin_lock_irqsave
>>     (epfile) local copy
>> 	   				ffs_epfile_release
>> 					__ffs_epfile_read_buffer_free
>> 					kfree(epfile->read_buffer)
>>     __ffs_epfile_read_buffer_free
>>     kfree(epfile->read_buffer)
>>       <<use_after_free>>
> I don't see how this race can happen.  __ffs_epfile_read_buffer_free()
> does:
>
> 	struct ffs_buffer *buf = xchg(&epfile->read_buffer, READ_BUFFER_DROP);
> 	if (buf && buf != READ_BUFFER_DROP)
> 		kfree(buf);
>
> so there's no way for both threads to call kfree() on the same buffer
> here.


You Are correct here.

>> Fix this races by taking epfile local copy & assigning it under
>> spinlock and if epfile(local) is null then update it in ffs->epfiles
>> then finally destroy it.
>>
>> Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
>> Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>> v2: Fixed the tags.
>>
>>   drivers/usb/gadget/function/f_fs.c | 44 +++++++++++++++++++++++++++++---------
>>   1 file changed, 34 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 3c584da..3cdc636 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -1268,10 +1268,13 @@ static int
>>   ffs_epfile_release(struct inode *inode, struct file *file)
>>   {
>>   	struct ffs_epfile *epfile = inode->i_private;
>> +	unsigned long flags;
>>   
>>   	ENTER();
>>   
>> +	spin_lock_irqsave(&epfile->ffs->eps_lock, flags);
>>   	__ffs_epfile_read_buffer_free(epfile);
>> +	spin_unlock_irqrestore(&epfile->ffs->eps_lock, flags);
> Can you explain why the comment in struct ffs_epfile is wrong about the
> buffer synchronisation?  At the very least, this patch looks like it
> should be updating that comment as well since the locking rules have
> clearly changed.
>
> But I'm not convinced this hunk is necessary - what is guarded here?
> epfile comes from the inode, so no need for eps_lock there and
> __ffs_epfile_read_buffer_free() accesses read_buffer via xchg() as
> described in ffs_epfile, so again no need for the lock.


I think as long as epfile is intact we are good. Will drop this snippet.

>>   	ffs_data_closed(epfile->ffs);
>>   
>>   	return 0;
>> @@ -1711,16 +1714,23 @@ static void ffs_data_put(struct ffs_data *ffs)
>>   
>>   static void ffs_data_closed(struct ffs_data *ffs)
>>   {
>> +	struct ffs_epfile *epfile;
> Should this be epfiles to match the field it is saving?


Done

>
>> +	unsigned long flags;
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
>> +			epfile = ffs->epfiles;
>> +			ffs->epfiles = NULL;
>> +			spin_unlock_irqrestore(&ffs->eps_lock,
>> +							flags);
>> +
>> +			if (epfile)
>> +				ffs_epfiles_destroy(epfile,
>> +						 ffs->eps_count);
>> +
>>   			if (ffs->setup_state == FFS_SETUP_PENDING)
>>   				__ffs_ep0_stall(ffs);
>>   		} else {
>> @@ -1767,14 +1777,25 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
>>   
>>   static void ffs_data_clear(struct ffs_data *ffs)
>>   {
>> +	struct ffs_epfile *epfile;
> Again, epfiles?


Done

>
>> +	unsigned long flags;
>>   	ENTER();
>>   
>>   	ffs_closed(ffs);
>>   
>>   	BUG_ON(ffs->gadget);
>>   
>> -	if (ffs->epfiles)
>> -		ffs_epfiles_destroy(ffs->epfiles, ffs->eps_count);
>> +	spin_lock_irqsave(&ffs->eps_lock, flags);
>> +	epfile = ffs->epfiles;
>> +	ffs->epfiles = NULL;
>> +	spin_unlock_irqrestore(&ffs->eps_lock, flags);
>> +	/* potential race possible between ffs_func_eps_disable
>> +	 * & ffs_epfile_release therefore maintaining a local
>> +	 * copy of epfile will save us from use-after-free.
>> +	 */
>> +	if (epfile)
>> +		ffs_epfiles_destroy(epfile,
>> +				    ffs->eps_count);
>>   
>>   	if (ffs->ffs_eventfd)
>>   		eventfd_ctx_put(ffs->ffs_eventfd);
>> @@ -1919,12 +1940,15 @@ static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
>>   
>>   static void ffs_func_eps_disable(struct ffs_function *func)
>>   {
>> -	struct ffs_ep *ep         = func->eps;
>> -	struct ffs_epfile *epfile = func->ffs->epfiles;
>> -	unsigned count            = func->ffs->eps_count;
>> +	struct ffs_ep *ep;
>> +	struct ffs_epfile *epfile;
> epfiles?


Done

>> +	unsigned short count;
> Why change this to "unsigned short"?


Encountered a checkpatch error here saying:

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
#147: FILE: drivers/usb/gadget/function/f_fs.c:1945:
+       unsigned count;

total: 0 errors, 1 warnings, 86 lines checked

>
>>   	unsigned long flags;
>>   
>>   	spin_lock_irqsave(&func->ffs->eps_lock, flags);
>> +	count = func->ffs->eps_count;
>> +	epfile = func->ffs->epfiles;
>> +	ep = func->eps;
>>   	while (count--) {
>>   		/* pending requests get nuked */
>>   		if (ep->ep)
>> -- 
>> 2.7.4
>>
