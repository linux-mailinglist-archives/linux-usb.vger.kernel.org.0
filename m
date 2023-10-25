Return-Path: <linux-usb+bounces-2181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC587D7187
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 18:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 006BE1C20E3C
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 16:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982DD2E64F;
	Wed, 25 Oct 2023 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6F27EF0
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 16:16:13 +0000 (UTC)
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2EC12F;
	Wed, 25 Oct 2023 09:16:11 -0700 (PDT)
Received: from [192.168.1.103] (31.173.84.85) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Wed, 25 Oct
 2023 19:16:06 +0300
Subject: Re: [PATCH v5] usb: Reduce 'set_address' command timeout with a new
 quirk
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>, <gregkh@linuxfoundation.org>,
	<stern@rowland.harvard.edu>, <mathias.nyman@intel.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<erosca@de.adit-jv.com>
References: <de2ed64a-363a-464c-95be-584ce1a7a4ad@rowland.harvard.edu>
 <20231025141316.117514-1-hgajjar@de.adit-jv.com>
 <41e22c23-07b3-5fd9-5fb1-935ab42fa83e@omp.ru>
Organization: Open Mobile Platform
Message-ID: <032f236a-e212-fa28-ecf4-b5b585ba7ac2@omp.ru>
Date: Wed, 25 Oct 2023 19:16:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <41e22c23-07b3-5fd9-5fb1-935ab42fa83e@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.84.85]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 10/25/2023 16:01:13
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 180896 [Oct 25 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.84.85 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.84.85 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;31.173.84.85:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.84.85
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/25/2023 16:07:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/25/2023 2:47:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 10/25/23 7:00 PM, Sergey Shtylyov wrote:

[...]
>    Sorry to be PITA but... (-:

   I just had to speak up after Alan's ACK. :-)

>> This patch introduces a new USB quirk, USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT,
>> which modifies the timeout value for the 'set_address' command. The
> 
>    This is called a request, not a command by the spec. And the USB spec
> names the requests in all uppercase, e.g. SET_ADDRESS...
> 
>> standard timeout for this command is 5000 ms, as recommended in the USB
>> 3.2 specification (section 9.2.6.1).
> 
>    This section in the USB specs 1.1/2.0/3.0 talks about _all_ requests.
> I don't have USB 3.2 but It believe it has the same wording.
> 
> [...]
> 
>> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
[...]

>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index e1b1b64a0723..0c610a853aef 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -3998,11 +3998,17 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
>>  }
>>  
>>  /*
> 
>    You seem to be converting the existing comment to a kernel-doc one
> but you miss changing from /* /** at the start and adding colons after

   From /* to /**, I meant to type...

> the param names below...

   This comment update also looks like a meterial for a separate patch...

>> - * Issue an Address Device command and optionally send a corresponding
>> - * SetAddress request to the device.
>> + * xhci_setup_device - issues an Address Device command to assign a unique
>> + *			USB bus address.
>> + * @hcd USB host controller data structure.
>> + * @udev USB dev structure representing the connected device.
>> + * @setup Enum specifying setup mode: address only or with context.
>> + * @timeout_ms Max wait time (ms) for the command operation to complete.
>> + *
>> + * Return: 0 if successful; otherwise, negative error code.
>>   */
>>  static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
>> -			     enum xhci_setup_dev setup)
>> +			     enum xhci_setup_dev setup, unsigned int timeout_ms)
> [...]

MBR, Sergey

