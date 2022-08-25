Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 693C55A1AD3
	for <lists+linux-usb@lfdr.de>; Thu, 25 Aug 2022 23:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbiHYVJX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 17:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242106AbiHYVJW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 17:09:22 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4D7656A
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 14:09:20 -0700 (PDT)
Received: from [192.168.1.103] (178.176.76.138) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Fri, 26 Aug
 2022 00:09:11 +0300
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] usb: gadget: function: rndis: limit # of RNDIS instances
 to 1000
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <balbi@kernel.org>, <linux-usb@vger.kernel.org>
References: <a8180973-3ded-3644-585a-169589a37642@omp.ru>
 <YwW8+hcJ9idgSbwl@kroah.com>
Organization: Open Mobile Platform
Message-ID: <6d2d6ae1-4a23-01b2-b505-e3031c2c7caf@omp.ru>
Date:   Fri, 26 Aug 2022 00:09:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YwW8+hcJ9idgSbwl@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.76.138]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 08/25/2022 20:48:37
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 172388 [Aug 25 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 496 496 76afdfb3eafb219d63a59f0593e2cada48535e98
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.76.138 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.76.138 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;178.176.76.138:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.76.138
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/25/2022 20:52:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 8/25/2022 6:43:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 8/24/22 8:54 AM, Greg Kroah-Hartman wrote:

>> As follows from #define NAME_TEMPLATE, the procfs code in the RNDIS driver
>> expects the # of instances to be 3-digit decimal, while the driver calls
>> ida_simple_get() passing 0 as the 'end' argument which results in actual
>> max instance # of INT_MAX.  Limit the maximum # of RNDIS instances to 1000
>> which is still a lot! :-)
>>
>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>> analysis tool.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> ---
>> This patch is against the 'next' branch of Felipe Balbi's 'usb.git' repo...
>>
>>  drivers/usb/gadget/function/rndis.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Index: usb/drivers/usb/gadget/function/rndis.c
>> ===================================================================
>> --- usb.orig/drivers/usb/gadget/function/rndis.c
>> +++ usb/drivers/usb/gadget/function/rndis.c
>> @@ -865,7 +865,7 @@ EXPORT_SYMBOL_GPL(rndis_msg_parser);
>>  
>>  static inline int rndis_get_nr(void)
>>  {
>> -	return ida_simple_get(&rndis_ida, 0, 0, GFP_KERNEL);
>> +	return ida_simple_get(&rndis_ida, 0, 1000, GFP_KERNEL);
> 
> Why not just change the procfs code instead?

   You mean changing #define NAME_TEMPLATE from "driver/rndis-%03d" to
"driver/rndis-%010d" and then changing the size of the name[] buffers to
24 bytes?

> It's not like anyone should ever be using this driver anyway.
> We should delete it soon, it's
> totally broken and insecure as noted in the past :(

   Oh, I wasn't aware of that... I just got the SVACE reports tossed
at me by the ISP people...

> thanks,
> 
> greg k-h

MBR, Sergey
