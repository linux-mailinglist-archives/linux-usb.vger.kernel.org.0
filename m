Return-Path: <linux-usb+bounces-2231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763DF7D890B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 21:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F32B7B2113A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 19:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63253B7B0;
	Thu, 26 Oct 2023 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5803B2A3
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 19:40:22 +0000 (UTC)
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 26 Oct 2023 12:40:20 PDT
Received: from fgw21-4.mail.saunalahti.fi (fgw21-4.mail.saunalahti.fi [62.142.5.108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9803C10E
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 12:40:20 -0700 (PDT)
Received: from [192.168.1.15] (81-175-205-118.bb.dnainternet.fi [81.175.205.118])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTPSA
	id 58413f03-7437-11ee-abf4-005056bdd08f;
	Thu, 26 Oct 2023 22:39:15 +0300 (EEST)
Message-ID: <9aaf9d6a-71d3-45ff-a02b-ce94b32e24eb@gmail.com>
Date: Thu, 26 Oct 2023 22:39:14 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux kernel 6.1 - drivers/usb/storage/unusual_cypress.h "Super
 Top" minimum bcdDevice too high
Content-Language: en-US
To: linux-usb@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>
References: <7bfd4f9e-9f8d-4102-ab03-7d0401f00513@gmail.com>
 <2023102630-enviable-stood-9b2d@gregkh>
From: LihaSika <lihasika@gmail.com>
In-Reply-To: <2023102630-enviable-stood-9b2d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26.10.2023 22.14, Greg KH wrote:
> On Thu, Oct 26, 2023 at 06:32:02PM +0300, LihaSika wrote:
>> Hi,	
>>
>> in kernel 6.1 (maybe 5.x - 6.x) there's an ATACB setting for "Super Top USB
>> 2.0 SATA Bridge" -devices, where the minimum bcdDevice version to match has
>> been set to 1.60. It's in the file drivers/usb/storage/unusual_cypress.h:
>>
>> """
>> UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
>>   		"Super Top",
>>   		"USB 2.0  SATA BRIDGE",
>>   		USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
>> """
>>
>> My old USB HDD with a "Super Top" bridge has bcdDevice version 1.50, thus
>> the setting won't match and it will not mount.
>>
>> I'm not sure when this changed (after kernel 4.x?), but it used to work
>> before. Reading some earlier bug reports, it seems that the max version used
>> to be 0x9999, which then caused corruption in "Super Top" devices with
>> version >=2.20. So that's a reason for lowering the maximum value, but I
>> wonder why the minimum value has also been set to 0x0160.
>>
>>
>> I created a patch, changing 0x0160 to 0x0150 (though I should've left the
>> max version as it was...):
>>
>> """
>> UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0150,
>> """
>>
>> Built, installed and rebooted; now the USB HDD can be mounted and works
>> perfectly again. I did some write & read tests, checked with diff, cmp and
>> md5sum - no corruption, everything OK 👍
> 
> Please submit a proper patch to the linux-usb@vger.kernel.org mailing
> list and we will be glad to take it from there.
> 
> thanks,
> 
> greg k-h

OK, here it is!

Best regards,
L.
--

$ cat lihasika-unusual_cypress.patch
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


