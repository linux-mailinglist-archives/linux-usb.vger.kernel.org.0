Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57313F8D2E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 19:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243193AbhHZRkI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 13:40:08 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:34410 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhHZRkH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Aug 2021 13:40:07 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 75737208E9CB
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] usb: core: hcd: merge repetitive strings in
 usb_hcd_request_irqs()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <f6ee0fdf-097b-797f-3f8c-beea7c73496e@omp.ru>
 <YSd76/cyZo6xLq7A@kroah.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <3d811f11-cd42-08f4-73a5-642e1c82045c@omp.ru>
Date:   Thu, 26 Aug 2021 20:39:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YSd76/cyZo6xLq7A@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/26/21 2:32 PM, Greg Kroah-Hartman wrote:
[...]
>> Two dev_info() calls in usb_hcd_request_irqs() have the same "io " strings
>> needlessly repeated. Merge these strings into the format strings of those
>> dev_info() calls...
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> ---
>> The patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo...
>>
>>  drivers/usb/core/hcd.c |   12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> Index: usb/drivers/usb/core/hcd.c
>> ===================================================================
>> --- usb.orig/drivers/usb/core/hcd.c
>> +++ usb/drivers/usb/core/hcd.c
>> @@ -2730,16 +2730,16 @@ static int usb_hcd_request_irqs(struct u
>>  			return retval;
>>  		}
>>  		hcd->irq = irqnum;
>> -		dev_info(hcd->self.controller, "irq %d, %s 0x%08llx\n", irqnum,
>> -				(hcd->driver->flags & HCD_MEMORY) ?
>> -					"io mem" : "io base",
>> -					(unsigned long long)hcd->rsrc_start);
>> +		dev_info(hcd->self.controller, "irq %d, io %s 0x%08llx\n",
>> +				irqnum, (hcd->driver->flags & HCD_MEMORY) ?
>> +					"mem" : "base",
>> +				(unsigned long long)hcd->rsrc_start);
> 
> This now makes it harder to grep for messages in the kernel source :(

   Mhm, maybe...

> As this saves almost no memory, I'll just ignore this patch.

   I also didn't find the current strings adequate -- I'd understand "io mem" vs "io port",
not what it is now...

> thanks,
> 
> greg k-h

MBR, Sergey
