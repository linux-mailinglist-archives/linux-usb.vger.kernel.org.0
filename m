Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE84147FA23
	for <lists+linux-usb@lfdr.de>; Mon, 27 Dec 2021 05:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235218AbhL0E4Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Dec 2021 23:56:24 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61799 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235205AbhL0E4X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Dec 2021 23:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1640580983; x=1672116983;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yl3wv0Cqy69FDLDNT9ztc8rOGnPmvmmqqIm5clMh2Fo=;
  b=EAk/IH8aXMAC8wGjACNlGms8SgAy0BBo+IrwuN8vHkWsMFMotOt65lFK
   oEgNO1AI2UxEOvQL2Qx7+XaZMTfUN4WBfGgtdJgL3ZvFjiB+o4QT1XcWB
   vwvzFn7cXrzDo3cmoE80sjcwVIEpltWsl+6HbSK7ZmdvhhJYJKE8Xpqdr
   w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 26 Dec 2021 20:56:23 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2021 20:56:23 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 26 Dec 2021 20:56:22 -0800
Received: from [10.216.10.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Sun, 26 Dec
 2021 20:56:19 -0800
Message-ID: <465e8e43-72b0-e182-16be-f1e7ed58173c@quicinc.com>
Date:   Mon, 27 Dec 2021 10:26:15 +0530
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
 <35df37e9-226b-c059-a538-581b5d2e53ff@quicinc.com>
 <YcGGXx26yP2TFjxy@kroah.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <YcGGXx26yP2TFjxy@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 21-12-2021 01:16 pm, Greg Kroah-Hartman wrote:
> On Mon, Dec 20, 2021 at 07:16:14PM +0530, Udipto Goswami wrote:
>> Hi Greg,
>>
>> Apologies for the delay, please find the following comments as per my
>> understanding inline.
>>
>> On 13-12-2021 07:38 pm, Greg Kroah-Hartman wrote:
>>> On Tue, Dec 07, 2021 at 11:37:54AM +0530, Udipto Goswami wrote:
>>>> Consider a case where ffs_func_eps_disable is called from
>>>> ffs_func_disable as part of composition switch and at the
>>>> same time ffs_epfile_release get called from userspace.
>>>> ffs_epfile_release will free up the read buffer and call
>>>> ffs_data_closed which in turn destroys ffs->epfiles and
>>>> mark it as NULL. While this was happening the driver has
>>>> already initialized the local epfile in ffs_func_eps_disable
>>>> which is now freed and waiting to acquire the spinlock. Once
>>>> spinlock is acquired the driver proceeds with the stale value
>>>> of epfile and tries to free the already freed read buffer
>>>> causing use-after-free.
>>>>
>>>> Following is the illustration of the race:
>>>>
>>>>         CPU1                                  CPU2
>>>>
>>>>      ffs_func_eps_disable
>>>>      epfiles (local copy)
>>>> 					ffs_epfile_release
>>>> 					ffs_data_closed
>>>> 					if (last file closed)
>>>> 					ffs_data_reset
>>>> 					ffs_data_clear
>>>> 					ffs_epfiles_destroy
>>>> spin_lock
>>>> dereference epfiles
>>>>
>>>> Fix this races by taking epfiles local copy & assigning it under
>>>> spinlock and if epfiles(local) is null then update it in ffs->epfiles
>>>> then finally destroy it.
>> Fixes: a9e6f83c2df (usb: gadget: f_fs: stop sleeping in
>> ffs_func_eps_disable)
>>>> Reviewed-by: John Keeping <john@metanate.com>
>>>> Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
>>>> Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>>>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>>>> ---
>>>> v6: Addressing minor code formatting.
>>>>
>>>>    drivers/usb/gadget/function/f_fs.c | 44 +++++++++++++++++++++++++++++---------
>>>>    1 file changed, 34 insertions(+), 10 deletions(-)
>>> What commit does this fix?
>>>
>>> Does this need to go to stable kernel releases?
>>>
>>> thanks,
>>>
>>> greg k-h
>>>
>> This is fixing Commit:  a9e6f83c2df (usb: gadget: f_fs: stop sleeping in
>> ffs_func_eps_disable)
>>
>> Yes this fix is needed for >=5.4 Kernel releases.
> Please put that in the patch when you resend it.
>
>>>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>>>> index 3c584da..6f23a66 100644
>>>> --- a/drivers/usb/gadget/function/f_fs.c
>>>> +++ b/drivers/usb/gadget/function/f_fs.c
>>>> @@ -1711,16 +1711,24 @@ static void ffs_data_put(struct ffs_data *ffs)
>>>>    static void ffs_data_closed(struct ffs_data *ffs)
>>>>    {
>>>> +	struct ffs_epfile *epfiles;
>>>> +	unsigned long flags;
>>>> +
>>>>    	ENTER();
>>>>    	if (atomic_dec_and_test(&ffs->opened)) {
>>>>    		if (ffs->no_disconnect) {
>>>>    			ffs->state = FFS_DEACTIVATED;
>>>> -			if (ffs->epfiles) {
>>>> -				ffs_epfiles_destroy(ffs->epfiles,
>>>> -						   ffs->eps_count);
>>>> -				ffs->epfiles = NULL;
>>>> -			}
>>>> +			spin_lock_irqsave(&ffs->eps_lock, flags);
>>>> +			epfiles = ffs->epfiles;
>>>> +			ffs->epfiles = NULL;
>>>> +			spin_unlock_irqrestore(&ffs->eps_lock,
>>>> +							flags);
>>>> +
>>>> +			if (epfiles)
>>>> +				ffs_epfiles_destroy(epfiles,
>>>> +						 ffs->eps_count);
>>> You are accessing epfiles outside of the lock.  How is that ok?
>> There are 2 parties that are trying to free the ffs->epfiles. We use the
>> lock to serialize which party gets to free the ffs->epfiles. Where we are
>> making it NULL we protected that, The freeing part doesn't need to be inside
>> spinlock because now it is epfiles(local_ variable) with which we are trying
>> to operate now. We removed the ffs->epfiles as the common structure to
>> operate and made the local variable epfiles to do the job.
> Why is the lock used only for that one field and not all other fields in
> that structure?  What about the no_disconnect access above these lines?
> The setup_state access below them?  Why does only one pointer deserve
> this locking and not all of them?
I believe what you are trying to reference for protecting the ffs_data 
structure is a little tricky. I understand that the entire ffs_data 
isn't itself protected between concurrent cases but it will be probably 
a bigger redesign which is out of scope of this patch.

Here we were trying only to protect the epfiles structure, which we get 
from ffs_epfiles_create() ffs_func_eps_enable() is where we assign it 
and ffs_data_reset() is where we are clearing it.

Maybe we can broaden the scope of this patch and try to protect the 
epfiles in all the places we are using?
something like this?

@@ -1811,7 +1811,6 @@ static void ffs_data_reset(struct ffs_data *ffs)

          ffs_data_clear(ffs);

-       ffs->epfiles = NULL;
          ffs->raw_descs_data = NULL;
          ffs->raw_descs = NULL;
          ffs->raw_strings = NULL;
@@ -1899,6 +1898,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
          if (!epfiles)
                  return -ENOMEM;

+       spin_lock_irqsave(&ffs->eps_lock, flags);
          epfile = epfiles;
          for (i = 1; i <= count; ++i, ++epfile) {
                  epfile->ffs = ffs;
@@ -1912,11 +1912,13 @@ static int ffs_epfiles_create(struct ffs_data 
*ffs) &ffs_epfile_operations);
                  if (!epfile->dentry) {
                          ffs_epfiles_destroy(epfiles, i - 1);
+ spin_unlock_irqrestore(&ffs->eps_lock, flags);

should we be adding epfiles = NULL?

                          return -ENOMEM;
                  }
          }

          ffs->epfiles = epfiles;
+       spin_unlock_irqrestore(&ffs->eps_lock, flags);
          return 0;
   }

@@ -1966,14 +1968,18 @@ static void ffs_func_eps_disable(struct 
ffs_function *func)

   static int ffs_func_eps_enable(struct ffs_function *func)
   {
-       struct ffs_data *ffs      = func->ffs;
-       struct ffs_ep *ep         = func->eps;
-       struct ffs_epfile *epfile = ffs->epfiles;
-       unsigned count            = ffs->eps_count;
+       struct ffs_data *ffs;
+       struct ffs_ep *ep;
+       struct ffs_epfile *epfile;
+       unsigned count;
          unsigned long flags;
          int ret = 0;

          spin_lock_irqsave(&func->ffs->eps_lock, flags);
+       ffs = func->ffs;
+       ep = func->eps;
+       epfiles = ffs->epfiles;
+       count = ffs->eps_count;
          while(count--) {
                  ep->ep->driver_data = ep;

This is the intention actually to protect the epfiles. This additional 
snippet will cover other EP related structures, and concurrent accesses 
which i have mentioned in the illustration of the race.

We are more interested in protecting epfiles is because we have multiple 
report from our customers indicating epfiles is accessed after free and 
it is fixed with this patch.
We can work on the ffs_data protection seperately if required.


Thanks,

-Udipto
