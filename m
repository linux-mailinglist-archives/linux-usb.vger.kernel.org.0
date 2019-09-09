Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83ED5AD5DD
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2019 11:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfIIJht (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Sep 2019 05:37:49 -0400
Received: from mail.sysgo.com ([176.9.12.79]:49102 "EHLO mail.sysgo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728792AbfIIJht (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Sep 2019 05:37:49 -0400
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Sep 2019 05:37:47 EDT
Subject: Re: [PATCH] usb: dwc3: reset the address and run_stop on init
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Roman Kapl <rka@sysgo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
References: <20190905095151.26590-1-rka@sysgo.com>
 <14b0d784-e172-7c22-8804-a9e7035d970f@synopsys.com>
From:   Roman Kapl <roman.kapl@sysgo.com>
Message-ID: <5a6a8d61-1ccf-9731-0b80-da783636970f@sysgo.com>
Date:   Mon, 9 Sep 2019 11:32:45 +0200
MIME-Version: 1.0
In-Reply-To: <14b0d784-e172-7c22-8804-a9e7035d970f@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On 9/5/19 8:57 PM, Thinh Nguyen wrote:
> Hi,
> 
> Roman Kapl wrote:
>> The address should be set to zero during reset according to the
>> documentation.
> 
> That is for usb reset and not core soft reset, and dwc3 already handles
> that case.

I thought that core soft reset is part of the USB reset (it is done 
during the init, right?).

> 
>> Clearing RunStop ensures that the host disconnects from
>> the device (it was not cleared by CSFTRST, at least on ls1043).
>>
>> This allows the dwc3 to properly initialize even if the previous
>> driver did not shutdown the device (e.g. when using virtualization).
> 
> This sounds like a workaround to some issue that the function driver did
> not handle.

I am using the ACM function driver. However, as I said, the issue arises 
only when the dwc3 driver is in a guest OS that is rebooted (even if the 
reboot is initiated from within the guest OS, not a hard reset).

Maybe this is out of scope for Linux, trying to 'clean up' after the 
previous driver?

Thank you, Roman Kapl

> 
>> Signed-off-by: Roman Kapl <rka@sysgo.com>
>> ---
>>    drivers/usb/dwc3/core.c | 5 +++++
>>    1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index c9bb93a2c81e..c633f5e0621d 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -250,6 +250,7 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
>>    
>>    	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
>>    	reg |= DWC3_DCTL_CSFTRST;
>> +	reg &= ~DWC3_DCTL_RUN_STOP;
>>    	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
>>    
>>    	do {
>> @@ -266,6 +267,10 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
>>    	return -ETIMEDOUT;
>>    
>>    done:
>> +	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
>> +	reg &= ~(DWC3_DCFG_DEVADDR_MASK);
>> +	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
>> +
>>    	/*
>>    	 * For DWC_usb31 controller, once DWC3_DCTL_CSFTRST bit is cleared,
>>    	 * we must wait at least 50ms before accessing the PHY domain
> 
> BR,
> Thinh
> 
