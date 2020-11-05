Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFDB92A7710
	for <lists+linux-usb@lfdr.de>; Thu,  5 Nov 2020 06:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgKEF3s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 00:29:48 -0500
Received: from z5.mailgun.us ([104.130.96.5]:59425 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgKEF3s (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Nov 2020 00:29:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604554186; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7Fgplp/vGedVzY7LkgXnQph8/xJaGqTQde+yVz6mUJc=; b=fTWthj3La94fL2zB2/z5ZZUd2f4TsuwmsovoQuxu4B5fvQ19MYI4TbLDnkoTM+mX6mZDF4U7
 NGEP/s98IlR/nKHzMtjFkPwVAAsZiu95WKEnB7OhtQ0EcrEyV6d0IZmbKimG04/4Wsj7wtSq
 5Z8z27lG8grhq9k3U25iSfNmhO0=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fa38dc846e8885ab887edaa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 05 Nov 2020 05:29:44
 GMT
Sender: sallenki=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1392AC433CB; Thu,  5 Nov 2020 05:29:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [103.110.145.22])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sallenki)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 564BCC433C6;
        Thu,  5 Nov 2020 05:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 564BCC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sallenki@codeaurora.org
Subject: Re: strange call stack when running uvc-gadget application
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
References: <20201102094936.GA29581@b29397-desktop>
 <af78c723-0836-95aa-80fe-a914d708eeb6@codeaurora.org>
 <20201104100511.GA16946@b29397-desktop>
From:   Sriharsha Allenki <sallenki@codeaurora.org>
Message-ID: <51accf3a-6fe8-4d3d-2773-7d0756dab806@codeaurora.org>
Date:   Thu, 5 Nov 2020 10:59:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104100511.GA16946@b29397-desktop>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On 11/4/2020 3:35 PM, Peter Chen wrote:
> On 20-11-03 11:50:17, Sriharsha Allenki wrote:
>> Hi Peter,
>>
>> On 11/2/2020 3:20 PM, Peter Chen wrote:
>>> Hi all,
>>>
>>> When running run uvc-gadget application at HS using dwc3 gadget at Linux
>>> v5.10-rc1, the video stream will be stopped after 1-2 minutes running. The
>>> trace log like below, I wonder how _raw_spin_lock_irqsave calls __switch_to?
>>> Any hints? Thanks.
>>>
>>> usb_test# [ 4757.322728] configfs-gadget gadget: uvc: VS request completed with status -18.
>>> [ 4757.329971] configfs-gadget gadget: uvc: VS request completed with status -18.
>>> UVC: Possible USB shutdown requested from Host, seen during VIDIOC_DQBUF
>>>
>>> usb_test# [ 4812.376465] check_interval: 37 callbacks suppressed
>>> [ 4825.307665] configfs-gadget gadget: uvc: VS request completed with status -18.
>>> [ 4825.314912] configfs-gadget gadget: uvc: VS request completed with status -18.
>>> UVC: Possible USB shutdown requested from Host, seen during VIDIOC_DQBUF
>>> [ 4826.231392] check_interval: 3 callbacks suppressed
>>> select timeout
>>> [ 4827.336088] dwc3 38100000.dwc3: request 0000000080ebefd3 was not queued to ep2in
>>> [ 4827.343547] dwc3 38100000.dwc3: request 00000000b578605c was not queued to ep2in
>>> [ 4827.350989] dwc3 38100000.dwc3: request 00000000c6d191cd was not queued to ep2in
>>> [ 4827.358422] dwc3 38100000.dwc3: request 0000000085205409 was not queued to ep2in
>>> UVC: Stopping video stream.
>>>
>>> [ 4848.381718] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
>>> [ 4848.387824] rcu:     3-...0: (1 GPs behind) idle=162/1/0x4000000000000000 softirq=10819/10819 fqs=2356
>>> [ 4848.396956]  (detected by 2, t=5252 jiffies, g=20129, q=3770)
>>> [ 4848.396959] Task dump for CPU 3:
>>> [ 4848.405925] task:uvc-gadget_wlhe state:R  running task     stack:    0 pid:  674 ppid:   636 flags:0x00000202
>>> [ 4848.415842] Call trace:
>>> [ 4848.418294]  __switch_to+0xc0/0x170
>>> [ 4848.421785]  _raw_spin_lock_irqsave+0x84/0xb0
>>> [ 4848.426143]  composite_disconnect+0x28/0x78
>>> [ 4848.430327]  configfs_composite_disconnect+0x68/0x70
>>> [ 4848.435290]  usb_gadget_disconnect+0x10c/0x128
>>> [ 4848.439733]  usb_gadget_deactivate+0xd4/0x108
>>> [ 4848.444089]  usb_function_deactivate+0x6c/0x80
>>> [ 4848.448534]  uvc_function_disconnect+0x20/0x58
>>> [ 4848.452976]  uvc_v4l2_release+0x30/0x88
>>> [ 4848.456812]  v4l2_release+0xbc/0xf0
>>> [ 4848.460301]  __fput+0x7c/0x230
>>> [ 4848.463353]  ____fput+0x14/0x20
>>> [ 4848.466495]  task_work_run+0x88/0x140
>>> [ 4848.470157]  do_notify_resume+0x240/0x6f0
>>> [ 4848.474166]  work_pending+0x8/0x200
>> The reason for this seems to be that the usb_gadget_deactivate is being called with
>> spinlock held from the usb_function_deactivate and the same lock is being used
>> in the composite_disconnect (&cdev->lock).
>>
>> This should be able to resolve it.
>>
>> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
>> index 05b176c82cc5..5fced737e4ef 100644
>> --- a/drivers/usb/gadget/composite.c
>> +++ b/drivers/usb/gadget/composite.c
>> @@ -392,8 +392,11 @@ int usb_function_deactivate(struct usb_function *function)
>>
>>         spin_lock_irqsave(&cdev->lock, flags);
>>
>> -       if (cdev->deactivations == 0)
>> +       if (cdev->deactivations == 0) {
>> +               spin_unlock_irqrestore(&cdev->lock, flags);
>>                 status = usb_gadget_deactivate(cdev->gadget);
>> +               spin_lock_irqsave(&cdev->lock, flags);
>> +       }
>>         if (status == 0)
>>                 cdev->deactivations++;
>>
>> @@ -424,8 +427,11 @@ int usb_function_activate(struct usb_function *function)
>>                 status = -EINVAL;
>>         else {
>>                 cdev->deactivations--;
>> -               if (cdev->deactivations == 0)
>> +               if (cdev->deactivations == 0) {
>> +                       spin_unlock_irqrestore(&cdev->lock, flags);
>>                         status = usb_gadget_activate(cdev->gadget);
>> +                       spin_lock_irqsave(&cdev->lock, flags);
>> +               }
>>         }
>>
>>         spin_unlock_irqrestore(&cdev->lock, flags);
>>
> Thanks, Sriharsha. It fixed the kernel dump after video stream has
> stopped, I did not check the whole trace carefully, and not found this
> spin recursion issue. You could add my Tested-by for it. Meanwhile,
> this issue was reported before, and unlock at usb_function_activate
> could also fix the possible sleep at atomic context issue for dwc3.
>
> https://lore.kernel.org/linux-usb/20191115070122.GF30608@b29397-desktop/T/
Thanks for the testing and confirmation, will raise the patch soon.

Regards,
Sriharsha
>
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

