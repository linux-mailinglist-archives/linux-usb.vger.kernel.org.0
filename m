Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E4D46B273
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 06:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235593AbhLGFk2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 00:40:28 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:28111 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234147AbhLGFk1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 00:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1638855418; x=1670391418;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bCDiJ3a4cJkI+J0DxiPo5ciiGY5VxATe2lgLvRM2248=;
  b=Cekd/TQq3TynTqWf1G5TA7BQ97Aq0faKHK6dCZq2TyVh0WTEcrggiCR9
   xm0fWbW0De3hNZX30GwMw6vegVGkjV61ZfZ7uYD60/IBOoMZ14Fh0dOGl
   NVzK9PpNf+/hoBOBBfsDg9F99Ez8Cdg7nA0v92OtK7NFHpOz5k7RejVV6
   A=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Dec 2021 21:36:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 21:36:57 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 6 Dec 2021 21:36:57 -0800
Received: from [10.216.53.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 6 Dec 2021
 21:36:54 -0800
Message-ID: <67efc7a5-74b3-9e65-9cf3-67efeda99c99@quicinc.com>
Date:   Tue, 7 Dec 2021 11:06:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v5] usb: f_fs: Fix use-after-free for epfile
Content-Language: en-US
To:     John Keeping <john@metanate.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
References: <1638186777-29540-1-git-send-email-quic_ugoswami@quicinc.com>
 <YaenLIsKSRzF9qew@donbot>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <YaenLIsKSRzF9qew@donbot>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi John,

Thanks for the review, i'll push v6 with the nits addressed.

On 01-12-2021 10:17 pm, John Keeping wrote:
> On Mon, Nov 29, 2021 at 05:22:57PM +0530, Udipto Goswami wrote:
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
>> Change-Id: I84b46f6c07cbf307a2bf92c366b933dc0e83d91a
>> Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
>> Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> A few formatting nits below, but other than that this is:
>
> Reviewed-by: John Keeping <john@metanate.com>
>
>> ---
>> v5: Changed the naming of epfile to singular in
>> ffs_func_eps_disable
>>
>>   drivers/usb/gadget/function/f_fs.c | 41 ++++++++++++++++++++++++++++----------
>>   1 file changed, 31 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 3c584da..f7be222 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -1711,16 +1711,23 @@ static void ffs_data_put(struct ffs_data *ffs)
>>   
>>   static void ffs_data_closed(struct ffs_data *ffs)
>>   {
>> +	struct ffs_epfile *epfiles;
>> +	unsigned long flags;
> Blank line after variable declarations.
>
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
> Again there should be a blank line here.
>
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
> /*
>   * Multi-line comment blocks have the opening "/*" and closing "*/" each
>   * on their own line.  This may benefit from a blank line before the
>   * comment as well.
>   */
>
>> +	if (epfiles)
>> +		ffs_epfiles_destroy(epfiles,
>> +				    ffs->eps_count);
> This was all one line before and you've made it shorter, so it can
> probably stay on one line.
>
>>   
>>   	if (ffs->ffs_eventfd)
>>   		eventfd_ctx_put(ffs->ffs_eventfd);
>> @@ -1919,12 +1937,15 @@ static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
>>   
>>   static void ffs_func_eps_disable(struct ffs_function *func)
>>   {
>> -	struct ffs_ep *ep         = func->eps;
>> -	struct ffs_epfile *epfile = func->ffs->epfiles;
>> -	unsigned count            = func->ffs->eps_count;
>> +	struct ffs_ep *ep;
>> +	struct ffs_epfile *epfile;
>> +	unsigned short count;
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
