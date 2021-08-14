Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4822C3EC469
	for <lists+linux-usb@lfdr.de>; Sat, 14 Aug 2021 20:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238931AbhHNSRk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Aug 2021 14:17:40 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:51434 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238937AbhHNSRj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Aug 2021 14:17:39 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru CBC942061858
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v3 0/2] Stop calling request_irq(), etc. with invalid IRQs
 in the USB drivers`
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>
CC:     <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>
References: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
 <YRdlGFh71JmKrJIm@kroah.com> <e17abfd6-09ab-d701-49c2-e2a1891c72ba@omp.ru>
 <YRfGTlkvpSccyM2g@kroah.com>
Organization: Open Mobile Platform
Message-ID: <fd165652-d7fd-9518-5598-87f08f6a6352@omp.ru>
Date:   Sat, 14 Aug 2021 21:16:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YRfGTlkvpSccyM2g@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/14/21 4:34 PM, Greg Kroah-Hartman wrote:

>>>> Here are 2 patches against the 'usb-linus' branch of GregKH's 'usb.git' repo.
>>>
>>> Wait, why that branch?
>>
>>    What branch I'd use for the fixes then?
> 
> Ah, you really want this in for 5.14-final?

   Not necessarily, it's your call. But all the patches are fixes.

> People are hitting this issue now?

   No, the patches ware all the result of the code reviews...

>>>  Please make them against the branch you want
>>> them applied to.  Hopefully they will apply to the usb-next branch...
>>
>>    I didn't intend them for usb-next but looks like they apply there too.
> 
> I think it belongs there as a "nice cleanup to have", right?

   No, they're definitely not cleanups and all have the "Fixes:" tags, so going
to end up in the stable trees (some already have).
   There's going to be 10-patch series soon, all fixing the deferred probing due
to platfrorm_get_irq()...
   Luckily, the USB tree doesn't shave the 3rd kind of platfrorm_get_irq() bugs:
treating 0 as error and returning it immediately along with the negative values,
without doing the remaining part of probe...

> thanks,
> 
> greg k-h

MBR, Sergey
