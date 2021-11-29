Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F044613DA
	for <lists+linux-usb@lfdr.de>; Mon, 29 Nov 2021 12:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239851AbhK2LbW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 06:31:22 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:39797 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242767AbhK2L3W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Nov 2021 06:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1638185165; x=1669721165;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EpMD3yHh5Sx4YEbLxXcJ8R55vhO6Hsd54SIb8hhZ3XA=;
  b=ZhT2NBpUQL3nKNtcQZsqNSOjH8tbuXa3nIUpRaGJjtjCIB5XEb/GRFwY
   eqK+5W9Ao0kFCxXSnXwjafdcAHzTvDNExSxEnmC95XQUTIExTM3VVX2Kl
   zN4GqYNSfP8E1bS38rsYKvxNLuRGCMVnPrFLheA4i9+7Ckys4csPzSipU
   g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 29 Nov 2021 03:26:03 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 03:26:03 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 29 Nov 2021 03:26:02 -0800
Received: from [10.216.23.176] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 29 Nov
 2021 03:25:59 -0800
Message-ID: <c9ddabae-84df-1490-0e6d-bfb4274e17ac@quicinc.com>
Date:   Mon, 29 Nov 2021 16:55:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v4] usb: f_fs: Fix use-after-free for epfile
Content-Language: en-US
To:     Jack Pham <quic_jackp@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Keeping <john@metanate.com>, <linux-usb@vger.kernel.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>
References: <1637936072-32263-1-git-send-email-quic_ugoswami@quicinc.com>
 <20211128165350.GA23891@jackp-linux.qualcomm.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <20211128165350.GA23891@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jack

Sure I'll address it in v5.

Thanks

On 28-11-2021 10:23 pm, Jack Pham wrote:
> Hi Udipto,
>
> On Fri, Nov 26, 2021 at 07:44:32PM +0530, Udipto Goswami wrote:
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
>>
>> Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
>> Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>> v4: Fix undeclared epfile error in ffs_func_eps_disable.
>>
>>   drivers/usb/gadget/function/f_fs.c | 49 +++++++++++++++++++++++++++-----------
>>   1 file changed, 35 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 3c584da..2a634d7 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -1711,16 +1711,23 @@ static void ffs_data_put(struct ffs_data *ffs)
>>   
>>   static void ffs_data_closed(struct ffs_data *ffs)
>>   {
>> +	struct ffs_epfile *epfiles;
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
>> +			epfiles = ffs->epfiles;
>> +			ffs->epfiles = NULL;
>> +			spin_unlock_irqrestore(&ffs->eps_lock,
>> +							flags);
>> +
>> +			if (epfiles)
>> +				ffs_epfiles_destroy(epfiles,
>> +						 ffs->eps_count);
>> +
>>   			if (ffs->setup_state == FFS_SETUP_PENDING)
>>   				__ffs_ep0_stall(ffs);
>>   		} else {
>> @@ -1767,14 +1774,25 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
>>   
>>   static void ffs_data_clear(struct ffs_data *ffs)
>>   {
>> +	struct ffs_epfile *epfiles;
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
>> +	epfiles = ffs->epfiles;
>> +	ffs->epfiles = NULL;
>> +	spin_unlock_irqrestore(&ffs->eps_lock, flags);
>> +	/* potential race possible between ffs_func_eps_disable
>> +	 * & ffs_epfile_release therefore maintaining a local
>> +	 * copy of epfile will save us from use-after-free.
>> +	 */
>> +	if (epfiles)
>> +		ffs_epfiles_destroy(epfiles,
>> +				    ffs->eps_count);
>>   
>>   	if (ffs->ffs_eventfd)
>>   		eventfd_ctx_put(ffs->ffs_eventfd);
>> @@ -1919,22 +1937,25 @@ static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
>>   
>>   static void ffs_func_eps_disable(struct ffs_function *func)
>>   {
>> -	struct ffs_ep *ep         = func->eps;
>> -	struct ffs_epfile *epfile = func->ffs->epfiles;
>> -	unsigned count            = func->ffs->eps_count;
>> +	struct ffs_ep *ep;
>> +	struct ffs_epfile *epfiles;
> This particular instance could have been kept named "epfile" (singular)
> as it functions more like an iterator in this function.  It'll also help
> avoid needing to change the chunk below within the while loop.
>
>> +	unsigned short count;
>>   	unsigned long flags;
>>   
>>   	spin_lock_irqsave(&func->ffs->eps_lock, flags);
>> +	count = func->ffs->eps_count;
>> +	epfiles = func->ffs->epfiles;
>> +	ep = func->eps;
>>   	while (count--) {
>>   		/* pending requests get nuked */
>>   		if (ep->ep)
>>   			usb_ep_disable(ep->ep);
>>   		++ep;
>>   
>> -		if (epfile) {
>> -			epfile->ep = NULL;
>> -			__ffs_epfile_read_buffer_free(epfile);
>> -			++epfile;
>> +		if (epfiles) {
>> +			epfiles->ep = NULL;
>> +			__ffs_epfile_read_buffer_free(epfiles);
>> +			++epfiles;
>>   		}
>>   	}
>>   	spin_unlock_irqrestore(&func->ffs->eps_lock, flags);
> Thanks,
> Jack
