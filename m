Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179842B937A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 14:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgKSNNy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 08:13:54 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8001 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgKSNNw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 08:13:52 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CcKqv4BBfzhYyS;
        Thu, 19 Nov 2020 21:13:31 +0800 (CST)
Received: from [10.67.102.118] (10.67.102.118) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Nov 2020 21:13:38 +0800
Subject: Re: [RFC PATCH] USB: xhci: Enable HCE event reset function
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        <linux-usb@vger.kernel.org>, <yisen.zhuang@huawei.com>,
        <tanxiaofei@huawei.com>, <mathias.nyman@intel.com>
References: <1605670573-949-1-git-send-email-liulongfang@huawei.com>
 <X7TG+UWWtgbX6EnU@kroah.com>
 <0877eba8-dcce-0c5e-98b4-64dd0fc06e4f@huawei.com>
 <X7TmBT2LbdJbDypG@kroah.com>
 <aa5b4ef3-444a-176e-495e-4109720de4ff@linux.intel.com>
 <3422ed2b-81e2-6927-fb9a-1ff5151945a5@huawei.com>
 <X7YMFq/ji/x1B7ww@kroah.com>
From:   liulongfang <liulongfang@huawei.com>
Message-ID: <980246c1-b55d-c3f0-8595-93ce9f0da904@huawei.com>
Date:   Thu, 19 Nov 2020 21:13:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X7YMFq/ji/x1B7ww@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.102.118]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/11/19 14:09, Greg KH Wrote:
> On Thu, Nov 19, 2020 at 09:50:20AM +0800, liulongfang wrote:
>> On 2020/11/19 0:21, Mathias Nyman Wrote:
>>> On 18.11.2020 11.14, Greg KH wrote:
>>>> On Wed, Nov 18, 2020 at 05:04:36PM +0800, liulongfang wrote:
>>>>> On 2020/11/18 15:02, Greg KH Wrote:
>>>>>> On Wed, Nov 18, 2020 at 11:36:13AM +0800, Longfang Liu wrote:
>>>>>>> The HCE(Host Controller Error) event has been defined in
>>>>>>> the XHCI driver but has not been used. If we want to use
>>>>>>> the HCE event to reset the controller, can we implement
>>>>>>> it in the interrupt function as follows:
>>>>>>>
>>>>>>> xhci_irq()
>>>>>>>     |----xhci_halt()
>>>>>>>     |----xhci_shutdown()
>>>>>>>     |----xhci_start()
>>>>>>>     |----xhci_run()
>>>>>>>
>>>>>>> Signed-off-by: Longfang Liu <liulongfang@huawei.com>
>>>>>>> ---
>>>>>>>  drivers/usb/host/xhci-ring.c | 10 ++++++++++
>>>>>>>  1 file changed, 10 insertions(+)
>>>>>>
>>>>>> $ ./scripts/get_maintainer.pl --file drivers/usb/host/xhci-ring.c
>>>>>> Mathias Nyman <mathias.nyman@intel.com> (supporter:USB XHCI DRIVER)
>>>>>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
>>>>>> linux-usb@vger.kernel.org (open list:USB XHCI DRIVER)
>>>>>> linux-kernel@vger.kernel.org (open list)
>>>>>>
>>>>>> Any reason to not include the maintainer of the xhci driver here?
>>>>> OK, I will include the maintainer in the next patch.
>>>>>>
>>>>>>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>>>>>>> index 2c255d0..87b3a40 100644
>>>>>>> --- a/drivers/usb/host/xhci-ring.c
>>>>>>> +++ b/drivers/usb/host/xhci-ring.c
>>>>>>> @@ -2857,6 +2857,16 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
>>>>>>>  		goto out;
>>>>>>>  	}
>>>>>>>  
>>>>>>> +	if (status & STS_HCE) {
>>>>>>> +		xhci_warn(xhci, "WARNING: Host Controller Error\n");
>>>>>>> +		xhci_halt(xhci);
>>>>>>> +		xhci_shutdown(hcd);
>>>>>>> +		xhci_start(xhci);
>>>>>>> +		xhci_run(hcd);
>>>>>>> +		ret = IRQ_HANDLED;
>>>>>>> +		goto out;
>>>>>>> +	}
>>> This won't work at all.  It doesn't reset the xHC which is the one thing needed to
>>> recover from a HCE. This would deadlock immediately.
>>> Many of the above functions shouldn't be called from interrupt context, and if
>>> HCE is set we probably even won't get any interrupts.
>>>
>>> A reset will set all registers to their initial values, and need to be
>>> re-initialized. Nothing is freed or re-allocated, registrs are not re-initialized
>>> here.  
>>>
>>> Please revisit the xhci spec about HCE, and HCRST, and a more detail look
>>> at the xhci driver, and test the code before submitting. 
>>>
>>>>>>> +
>>>>>>
>>>>>> Does this fix a real problem for you?  Are you sure we will not suddenly
>>>>>> start resetting devices that were working properly and sending this
>>>>>> error incorrectly?  How did you test this?
>>>>>>
>>>>>> thanks,
>>>>>>
>>>>>> greg k-h
>>>>>> .
>>>>>>
>>>>> Yes, we want to add a RAS feature to the USB,
>>>>
>>>> What is "RAS"?
>>>>
>>>>> Use the HCE event to trigger the reset operation of the USB controller.
>>>>
>>>> Is that allowed by the XHCI specification?
>>>>
>>>>> By searching for the current xhci driver, the driver did not handle HCE event.
>>>>> In fact, I am not sure if other operations will cause HCE, The HCE event is
>>>>> used to reset the USB controller according to the definition of the event.
>>>>
>>>> What generates that event?  Do existing controllers do that today?  What
>>>> causes it?
>>>>
>>>
>>> It's not an event, it's a controller internal error state.
>>> It's probably not very useful to check for it in the interrupt handler as
>>> the xHC hw ceases all activity when it sets the HCE bit, including sending
>>> interrupts.
>>>  
>>>> >From the spec:
>>>
>>> 4.24.1 Internal Errors
>>> The Host Controller Error (HCE) flag is asserted when an internal xHC error is
>>> detected that exclusively affects the xHC. When the HCE flag is set to ‘1’ the xHC
>>> shall cease all activity. Software response to the assertion of HCE is to reset the
>>> xHC (HCRST = ‘1’) and reinitialize it
>>>
>>>>> I test this reset operation through the Sysfs file, but have not tested all usage scenarios.
>>>>
>>>> What sysfs file?
>>>
>>> I'm also interested in this, and to know more about RAS?
>>>
>>> Thanks
>>> -Mathias
>>> .
>>>
>> RAS: Reliablity, Availability and Serviceability.
> 
> That's a marketing phrase, what specifically are you talking about when
> it comes to the xhci driver?
> It means that when the hardware detects HCE, the USB controller could recover.
>> sysfs: a virtual file system based on memory, it's similar as proc.
> 
> I am very aware of what sysfs is, look at the MAINTAINERS entry for it :)
> 
>> Use DEVICE_ATTR or DRIVER_ATTR to create files to the /sys directory
> 
> Yes, but what file did you use for this?  I don't see one in the kernel
> that can cause this, do you?
> 
> thanks,
> 
> greg k-h
> .
> 
I found that there is debugfs in the USB xhci driver,
and the reset test can be realized by adding the debugfs file
thanks,
Longfang.

