Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488BC433CBC
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 18:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhJSQyL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 12:54:11 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:53308 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhJSQyK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 12:54:10 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 3FB0720AD54A
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 11/22] usb: host: ohci-at91: deny IRQ0
To:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <20211018183930.8448-12-s.shtylyov@omp.ru>
 <YW6o2dfHElc4yTvW@ada.ifak-system.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <7fb6c034-5060-85d6-ea69-f4ea6da0f4bc@omp.ru>
Date:   Tue, 19 Oct 2021 19:51:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YW6o2dfHElc4yTvW@ada.ifak-system.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/19/21 2:15 PM, Alexander Dahl wrote:

>> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
>> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
>> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
>>
>> Fixes: 60bbfc84b6d9 ("USB OHCI controller support for PNX4008")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> ---
>>  drivers/usb/host/ohci-nxp.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
>> index 85878e8ad331..afb9c2fc85c3 100644
>> --- a/drivers/usb/host/ohci-nxp.c
>> +++ b/drivers/usb/host/ohci-nxp.c
>> @@ -215,6 +215,10 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>>  		ret = -ENXIO;
>>  		goto fail_resource;
>>  	}
>> +	if (!irq) {
>> +		ret = -EINVAL;
>> +		goto fail_resource;
>> +	}
>>  
>>  	ohci_nxp_start_hc();
>>  	platform_set_drvdata(pdev, hcd);
> 
> Subject refers to at91 while content is about nxp.

   Oops, sorry! :-<
   That's what you get when you send 22 patches fixing the same issue... :-)

> Greets
> Alex

MBR, Sergey
