Return-Path: <linux-usb+bounces-2270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56F47D9788
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 14:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D368E1C21004
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A4F19BB8;
	Fri, 27 Oct 2023 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD68A199B7
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 12:15:53 +0000 (UTC)
Received: from fgw23-4.mail.saunalahti.fi (fgw23-4.mail.saunalahti.fi [62.142.5.110])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DB7FA
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 05:15:52 -0700 (PDT)
Received: from [192.168.1.15] (81-175-205-118.bb.dnainternet.fi [81.175.205.118])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTPSA
	id 8f3f22bf-74c2-11ee-b972-005056bdfda7;
	Fri, 27 Oct 2023 15:15:48 +0300 (EEST)
Message-ID: <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
Date: Fri, 27 Oct 2023 15:15:46 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] set 1.50 as the lower bcdDevice value for "Super Top"-device
 in drivers/usb/storage/unusual_cypress.h
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux USB <linux-usb@vger.kernel.org>,
 Linux USB Storage <usb-storage@lists.one-eyed-alien.net>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
References: <ZTsR-RhhjxSpqrsz@debian.me>
Content-Language: en-US
From: LihaSika <lihasika@gmail.com>
In-Reply-To: <ZTsR-RhhjxSpqrsz@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.10.2023 4.27, Bagas Sanjaya wrote:
> On Thu, Oct 26, 2023 at 10:39:14PM +0300, LihaSika wrote:
>> On 26.10.2023 22.14, Greg KH wrote:
>>> Please submit a proper patch to the linux-usb@vger.kernel.org mailing
>>> list and we will be glad to take it from there.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> OK, here it is!
>>
>> Best regards,
>> L.
>> --
>>
>> $ cat lihasika-unusual_cypress.patch
>> diff --git a/drivers/usb/storage/unusual_cypress.h
>> b/drivers/usb/storage/unusual_cypress.h
>> index 0547daf..7b3d5f0 100644
>> --- a/drivers/usb/storage/unusual_cypress.h
>> +++ b/drivers/usb/storage/unusual_cypress.h
>> @@ -19,7 +19,7 @@ UNUSUAL_DEV(  0x04b4, 0x6831, 0x0000, 0x9999,
>>   		"Cypress ISD-300LP",
>>   		USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
>>
>> -UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
>> +UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0160,
>>   		"Super Top",
>>   		"USB 2.0  SATA BRIDGE",
>>   		USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
>>
> 
> Hi LihaSika,
> 
> Please follow proper patch submission process in order to get above patch
> accepted. See Documentation/process/submitting-patches.rst in the kernel
> sources for how to do that properly. You may also consider adding
> `Cc: stable@vger.kernel.org` trailer in your patch to mark it to be
> backported to stable kernels (including one you use).
> 
> Thanks.
> 

All right, here's a new attempt. Is it OK now?

Cc: stable@vger.kernel.org
Signed-off-by: Liha Sikanen <lihasika@gmail.com>
---

diff --git a/drivers/usb/storage/unusual_cypress.h 
b/drivers/usb/storage/unusual_cypress.h
index 0547daf..7b3d5f0 100644
--- a/drivers/usb/storage/unusual_cypress.h
+++ b/drivers/usb/storage/unusual_cypress.h
@@ -19,7 +19,7 @@ UNUSUAL_DEV(  0x04b4, 0x6831, 0x0000, 0x9999,
          "Cypress ISD-300LP",
          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),

-UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
+UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0160,
          "Super Top",
          "USB 2.0  SATA BRIDGE",
          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),


