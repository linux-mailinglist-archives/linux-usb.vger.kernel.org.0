Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA55D362D11
	for <lists+linux-usb@lfdr.de>; Sat, 17 Apr 2021 05:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235578AbhDQDLh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Apr 2021 23:11:37 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16133 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbhDQDLh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Apr 2021 23:11:37 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FMdLk2DlkzpYTh;
        Sat, 17 Apr 2021 11:08:14 +0800 (CST)
Received: from [10.67.102.118] (10.67.102.118) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Sat, 17 Apr 2021 11:11:01 +0800
Subject: Re: [RFC PATCH] USB:XHCI:skip hub registration
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>,
        <liudongdong3@huawei.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kong.kongxinwei@hisilicon.com>,
        <yisen.zhuang@huawei.com>
References: <1618489358-42283-1-git-send-email-liulongfang@huawei.com>
 <20210415144323.GC1530055@rowland.harvard.edu>
 <3dad6f4f-6386-427c-c36c-7d26b9a76fa4@huawei.com>
 <20210416152021.GA42403@rowland.harvard.edu>
From:   liulongfang <liulongfang@huawei.com>
Message-ID: <1abf8a09-4209-e000-f608-8664a4964670@huawei.com>
Date:   Sat, 17 Apr 2021 11:11:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210416152021.GA42403@rowland.harvard.edu>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.118]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/4/16 23:20, Alan Stern wrote:
> On Fri, Apr 16, 2021 at 10:03:21AM +0800, liulongfang wrote:
>> On 2021/4/15 22:43, Alan Stern wrote:
>>> On Thu, Apr 15, 2021 at 08:22:38PM +0800, Longfang Liu wrote:
>>>> When the number of ports on the USB hub is 0, skip the registration
>>>> operation of the USB hub.
>>>>
>>>> The current Kunpeng930's XHCI hardware controller is defective. The number
>>>> of ports on its USB3.0 bus controller is 0, and the number of ports on
>>>> the USB2.0 bus controller is 1.
>>>>
>>>> In order to solve this problem that the USB3.0 controller does not have
>>>> a port which causes the registration of the hub to fail, this patch passes
>>>> the defect information by adding flags in the quirks of xhci and usb_hcd,
>>>> and finally skips the registration process of the hub directly according
>>>> to the results of these flags when the hub is initialized.
>>>>
>>>> Signed-off-by: Longfang Liu <liulongfang@huawei.com>
>>>
>>> The objections that Greg raised are all good ones.
>>>
>>> But even aside from them, this patch doesn't actually do what the 
>>> description says.  The patch doesn't remove the call to usb_add_hcd 
>>> for the USB-3 bus.  If you simply skipped that call (and the 
>>> corresponding call to usb_remove_hcd) when there are no 
>>> ports on the root hub, none of the stuff in this patch would be needed.
>>>
>>> Alan Stern
>>>
>>
>> "[RFC PATCH] USB:XHCI:Adjust the log level of hub"
> 
> I don't understand.  What patch is that?  Do you have a URL for it?
> 
URL: https://patchwork.kernel.org/project/linux-usb/patch/1616666652-37920-1-git-send-email-liulongfang@huawei.com/
Thanks
Longfang.

>> The current method is an improved method of the above patch.
>> This patch just make it skip registering USB-3 root hub if that hub has no ports,
> 
> No, that isn't what this patch does.
> 
> If the root hub wasn't registered, hub_probe wouldn't get called.  But 
> with your patch, the system tries to register the root hub, and it does 
> call hub_probe, and then that function fails with a warning message.
> 
> The way to _really_ akip registering the root hub is to change the 
> xhci-hcd code.  Make it skip calling usb_add_hcd.
> 
>> after skipping registering, no port will not report error log,the goal of this
>> patch is reached without error log output.
> 
> Why do you want to get rid of the error log output?  There really _is_ 
> an error, because the USB-3 hardware on your controller is defective.  
> Since the hardware is buggy, we _should_ print an error message in the 
> kernel log.
> 
> Alan Stern
> .
> 
