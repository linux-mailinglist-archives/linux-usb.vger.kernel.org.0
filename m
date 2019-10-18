Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3A52DC088
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 11:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389170AbfJRJGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 05:06:46 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:49956 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbfJRJGp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 05:06:45 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iLODb-0004dn-DT; Fri, 18 Oct 2019 10:06:43 +0100
Subject: Re: [PATCH] usb: cdns3: include host-export,h for cdns3_host_init
To:     Pawel Laszczak <pawell@cadence.com>,
        "linux-kernel@lists.codethink.co.uk" 
        <linux-kernel@lists.codethink.co.uk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20191017124427.17055-1-ben.dooks@codethink.co.uk>
 <BYAPR07MB47099123D3A6BD193491FD34DD6C0@BYAPR07MB4709.namprd07.prod.outlook.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <fe82dabc-c446-e132-bbfe-d79a75feece2@codethink.co.uk>
Date:   Fri, 18 Oct 2019 10:06:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <BYAPR07MB47099123D3A6BD193491FD34DD6C0@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18/10/2019 04:45, Pawel Laszczak wrote:
> Hi
> 
>> The cdns3_host_init() function is declared in host-export.h
>> but host.c does not include it. Add the include to have
>> the declaration present (and remove the declaration of
>> cdns3_host_exit which is now static).
>>
>> Fixes the following sparse warning:
>>
>> drivers/usb/cdns3/host.c:58:5: warning: symbol 'cdns3_host_init' was not declared. Should it be static?
> 
> It should not be static. It can be called from core.c file.
> It will be static only if CONFIG_USB_CDNS3_HOST will not be defined and in
> this case function will be declared in host-export.h  as static.

I know, this isn't being made static, that's a warning.

> For me It doesn't look like driver issue.

>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Pawel Laszczak <pawell@cadence.com>
>> Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
>> Cc: "Ben Dooks
>> Cc: linux-usb@vger.kernel.org
>> ---
>> drivers/usb/cdns3/host-export.h | 1 -
>> drivers/usb/cdns3/host.c        | 1 +
>> 2 files changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-export.h
>> index b498a170b7e8..ae11810f8826 100644
>> --- a/drivers/usb/cdns3/host-export.h
>> +++ b/drivers/usb/cdns3/host-export.h
>> @@ -12,7 +12,6 @@
>> #ifdef CONFIG_USB_CDNS3_HOST
>>
>> int cdns3_host_init(struct cdns3 *cdns);
>> -void cdns3_host_exit(struct cdns3 *cdns);
> 
> We can't remove this function. It is invoked from core.c file.
> If you remove it from host-export.h then it will not be visible there.
> 
>>
>> #else
>>
>> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
>> index 2733a8f71fcd..ad788bf3fe4f 100644
>> --- a/drivers/usb/cdns3/host.c
>> +++ b/drivers/usb/cdns3/host.c
>> @@ -12,6 +12,7 @@
>> #include <linux/platform_device.h>
>> #include "core.h"
>> #include "drd.h"
>> +#include "host-export.h"
> 
> Why host must include this file. This function is implemented
> In host.c and is used only in  core.c file .

The implementation should also have the declaration to ensure
that the implemented function matches the declared prototype in
the header



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
