Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D7D2B81A2
	for <lists+linux-usb@lfdr.de>; Wed, 18 Nov 2020 17:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgKRQUB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Nov 2020 11:20:01 -0500
Received: from mga09.intel.com ([134.134.136.24]:35420 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbgKRQUB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Nov 2020 11:20:01 -0500
IronPort-SDR: pD/GdBmAcKmm1YfQr3K1r2772rXSe48TKw8W57TQlJHljgBmA4xVp+9uaFfJ1OoWog3MH/eiU7
 9M/p0eU4ktiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="171309905"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="171309905"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 08:20:00 -0800
IronPort-SDR: IwO7ay7d/r4Z3MXUQBffgeLJywTHhgF60dsip14DJwf19iBrSLIdnIMlXMuAACAoLMnr7+aU2t
 WXEewkD7FHgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="310706419"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 18 Nov 2020 08:19:58 -0800
Subject: Re: [RFC PATCH] USB: xhci: Enable HCE event reset function
To:     Greg KH <gregkh@linuxfoundation.org>,
        liulongfang <liulongfang@huawei.com>
Cc:     linux-usb@vger.kernel.org, yisen.zhuang@huawei.com,
        tanxiaofei@huawei.com, mathias.nyman@intel.com
References: <1605670573-949-1-git-send-email-liulongfang@huawei.com>
 <X7TG+UWWtgbX6EnU@kroah.com>
 <0877eba8-dcce-0c5e-98b4-64dd0fc06e4f@huawei.com>
 <X7TmBT2LbdJbDypG@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <aa5b4ef3-444a-176e-495e-4109720de4ff@linux.intel.com>
Date:   Wed, 18 Nov 2020 18:21:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X7TmBT2LbdJbDypG@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18.11.2020 11.14, Greg KH wrote:
> On Wed, Nov 18, 2020 at 05:04:36PM +0800, liulongfang wrote:
>> On 2020/11/18 15:02, Greg KH Wrote:
>>> On Wed, Nov 18, 2020 at 11:36:13AM +0800, Longfang Liu wrote:
>>>> The HCE(Host Controller Error) event has been defined in
>>>> the XHCI driver but has not been used. If we want to use
>>>> the HCE event to reset the controller, can we implement
>>>> it in the interrupt function as follows:
>>>>
>>>> xhci_irq()
>>>>     |----xhci_halt()
>>>>     |----xhci_shutdown()
>>>>     |----xhci_start()
>>>>     |----xhci_run()
>>>>
>>>> Signed-off-by: Longfang Liu <liulongfang@huawei.com>
>>>> ---
>>>>  drivers/usb/host/xhci-ring.c | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>
>>> $ ./scripts/get_maintainer.pl --file drivers/usb/host/xhci-ring.c
>>> Mathias Nyman <mathias.nyman@intel.com> (supporter:USB XHCI DRIVER)
>>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
>>> linux-usb@vger.kernel.org (open list:USB XHCI DRIVER)
>>> linux-kernel@vger.kernel.org (open list)
>>>
>>> Any reason to not include the maintainer of the xhci driver here?
>> OK, I will include the maintainer in the next patch.
>>>
>>>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>>>> index 2c255d0..87b3a40 100644
>>>> --- a/drivers/usb/host/xhci-ring.c
>>>> +++ b/drivers/usb/host/xhci-ring.c
>>>> @@ -2857,6 +2857,16 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
>>>>  		goto out;
>>>>  	}
>>>>  
>>>> +	if (status & STS_HCE) {
>>>> +		xhci_warn(xhci, "WARNING: Host Controller Error\n");
>>>> +		xhci_halt(xhci);
>>>> +		xhci_shutdown(hcd);
>>>> +		xhci_start(xhci);
>>>> +		xhci_run(hcd);
>>>> +		ret = IRQ_HANDLED;
>>>> +		goto out;
>>>> +	}
This won't work at all.  It doesn't reset the xHC which is the one thing needed to
recover from a HCE. This would deadlock immediately.
Many of the above functions shouldn't be called from interrupt context, and if
HCE is set we probably even won't get any interrupts.

A reset will set all registers to their initial values, and need to be
re-initialized. Nothing is freed or re-allocated, registrs are not re-initialized
here.  

Please revisit the xhci spec about HCE, and HCRST, and a more detail look
at the xhci driver, and test the code before submitting. 

>>>> +
>>>
>>> Does this fix a real problem for you?  Are you sure we will not suddenly
>>> start resetting devices that were working properly and sending this
>>> error incorrectly?  How did you test this?
>>>
>>> thanks,
>>>
>>> greg k-h
>>> .
>>>
>> Yes, we want to add a RAS feature to the USB,
> 
> What is "RAS"?
> 
>> Use the HCE event to trigger the reset operation of the USB controller.
> 
> Is that allowed by the XHCI specification?
> 
>> By searching for the current xhci driver, the driver did not handle HCE event.
>> In fact, I am not sure if other operations will cause HCE, The HCE event is
>> used to reset the USB controller according to the definition of the event.
> 
> What generates that event?  Do existing controllers do that today?  What
> causes it?
> 

It's not an event, it's a controller internal error state.
It's probably not very useful to check for it in the interrupt handler as
the xHC hw ceases all activity when it sets the HCE bit, including sending
interrupts.
 
From the spec:

4.24.1 Internal Errors
The Host Controller Error (HCE) flag is asserted when an internal xHC error is
detected that exclusively affects the xHC. When the HCE flag is set to ‘1’ the xHC
shall cease all activity. Software response to the assertion of HCE is to reset the
xHC (HCRST = ‘1’) and reinitialize it

>> I test this reset operation through the Sysfs file, but have not tested all usage scenarios.
> 
> What sysfs file?

I'm also interested in this, and to know more about RAS?

Thanks
-Mathias
