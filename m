Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182EF2B79F0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Nov 2020 10:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgKRJEt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Nov 2020 04:04:49 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7697 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgKRJEq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Nov 2020 04:04:46 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CbcLw5yx2zkXXJ;
        Wed, 18 Nov 2020 17:04:24 +0800 (CST)
Received: from [10.67.102.118] (10.67.102.118) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Wed, 18 Nov 2020 17:04:36 +0800
Subject: Re: [RFC PATCH] USB: xhci: Enable HCE event reset function
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <yisen.zhuang@huawei.com>,
        <tanxiaofei@huawei.com>, <mathias.nyman@intel.com>
References: <1605670573-949-1-git-send-email-liulongfang@huawei.com>
 <X7TG+UWWtgbX6EnU@kroah.com>
From:   liulongfang <liulongfang@huawei.com>
Message-ID: <0877eba8-dcce-0c5e-98b4-64dd0fc06e4f@huawei.com>
Date:   Wed, 18 Nov 2020 17:04:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X7TG+UWWtgbX6EnU@kroah.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.118]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/11/18 15:02, Greg KH Wrote:
> On Wed, Nov 18, 2020 at 11:36:13AM +0800, Longfang Liu wrote:
>> The HCE(Host Controller Error) event has been defined in
>> the XHCI driver but has not been used. If we want to use
>> the HCE event to reset the controller, can we implement
>> it in the interrupt function as follows:
>>
>> xhci_irq()
>>     |----xhci_halt()
>>     |----xhci_shutdown()
>>     |----xhci_start()
>>     |----xhci_run()
>>
>> Signed-off-by: Longfang Liu <liulongfang@huawei.com>
>> ---
>>  drivers/usb/host/xhci-ring.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
> 
> $ ./scripts/get_maintainer.pl --file drivers/usb/host/xhci-ring.c
> Mathias Nyman <mathias.nyman@intel.com> (supporter:USB XHCI DRIVER)
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
> linux-usb@vger.kernel.org (open list:USB XHCI DRIVER)
> linux-kernel@vger.kernel.org (open list)
> 
> Any reason to not include the maintainer of the xhci driver here?
OK, I will include the maintainer in the next patch.
> 
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 2c255d0..87b3a40 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -2857,6 +2857,16 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
>>  		goto out;
>>  	}
>>  
>> +	if (status & STS_HCE) {
>> +		xhci_warn(xhci, "WARNING: Host Controller Error\n");
>> +		xhci_halt(xhci);
>> +		xhci_shutdown(hcd);
>> +		xhci_start(xhci);
>> +		xhci_run(hcd);
>> +		ret = IRQ_HANDLED;
>> +		goto out;
>> +	}
>> +
> 
> Does this fix a real problem for you?  Are you sure we will not suddenly
> start resetting devices that were working properly and sending this
> error incorrectly?  How did you test this?
> 
> thanks,
> 
> greg k-h
> .
> 
Yes, we want to add a RAS feature to the USB,
Use the HCE event to trigger the reset operation of the USB controller.

By searching for the current xhci driver, the driver did not handle HCE event.
In fact, I am not sure if other operations will cause HCE, The HCE event is
used to reset the USB controller according to the definition of the event.

I test this reset operation through the Sysfs file, but have not tested all usage scenarios.
Thanks.
Longfang
