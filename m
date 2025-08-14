Return-Path: <linux-usb+bounces-26869-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EC2B26AB4
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 17:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97D57AA1F55
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 15:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D747219315;
	Thu, 14 Aug 2025 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="Q5k3KMeW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9185B1A3164
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 15:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755184330; cv=none; b=QQ7x50gkWzccJ30KeSP8UxfFEo6YFPpa5XpHObByWDX2uaN4ir+bBIYaUqr1a1URRBwdZVIOgw7pkhqdPyvx8ejF+5HthIyQilW8GcC+DFNyHhK+kEXoqETxXM9uN4b6ArokITL24QFIQcSbUWwOsBHZHD4FRA2p85x0xTrI0Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755184330; c=relaxed/simple;
	bh=qcG2jkbFhbTVm6OSqhDBbxAN1PBGDCPgmUaO2YakBo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atBB2yOrQ9RsX8zVO3pZn4RbtHV3KgXiPZjGnkaYz8VnEfx/YlAqhF3PTniwObseTKY3yVC0zy/0uhfg0MokW4N9FVSXdDVmoU0+kEpVJt+1DJMLXuES7UfgUV8bAK1ipiscOkY86+5yAGCFw0HOp1GJ1fnLnk37pgPZ1pf4CbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=Q5k3KMeW; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64EC41BBFB04;
	Thu, 14 Aug 2025 18:11:59 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1755184321;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=yXMLZUoyjdOunyM8BWYKbiq9V052PHFXKNeZwX6GRIY=;
	b=Q5k3KMeWufuEeFf5toJRDaef6c/VbUnK9jpBJx8cot4HbGdVJ7WqiqCrAKvoEnQ2VSY3xe
	GKlPM7rMX5LZLj5ZaTG54AVD91+FaSoyDCbVzWpfzMfEGXyLVz4GJSHMpJ+ze31/aEjw9X
	TH62DXmmdRuLwJHygagryULFJxRXIL1w3i28QurZkziu5Ulok5DZp7QrL0zLbhxeVTeYqv
	PnRylPS1PmP57h1TKjNAGPRxVl/x3VMMIyNkECD/INb2wUpicx7VCG3zHiYXlB2vXa7FHY
	4thsj8dDhzWe1A/jM4J0MPX+/sa+swirPsqbg2uzEYE2UHges3vBc9qwKFkz/w==
Message-ID: <f2c433ae-f9d0-4beb-a2c7-84d2fd68e02e@valdikss.org.ru>
Date: Thu, 14 Aug 2025 18:11:59 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
References: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>
 <6017298f-fc03-41c9-b0e3-a74180f4c9a1@rowland.harvard.edu>
Content-Language: ru, en-US
From: ValdikSS <iam@valdikss.org.ru>
Autocrypt: addr=iam@valdikss.org.ru; keydata=
 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
 OEcVmRU/pw5/zoQyQg==
In-Reply-To: <6017298f-fc03-41c9-b0e3-a74180f4c9a1@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 14.08.2025 5:24 PM, Alan Stern wrote:
> On Thu, Aug 14, 2025 at 04:56:40AM +0300, ValdikSS wrote:
>> I have an old USB 1.1 Full Speed printer (Canon LBP1120) which can't print
>> large documents due to insufficient USB 1.1 transfer speed/high latency on
>> Linux.
>> I believe this may be Linux OHCI bug or deficiency.
>>
>> If I connect the printer to USB 2.0 port (uses "companion" OHCI controller),
>> the printing engine reports data underflow using its proprietary command
>> protocol, and the full-page picture fails to print (only 1/3 is printed).
> 
> Why on earth would a printer protocol have speed/latency requirements?
> That's just bad design.  It's not like printers are under any severe
> time constraints -- they won't blow up if they have to wait an extra ten
> seconds for the computer to send the contents of a page.

That's a very old printer from the lower-end segment, which have so 
little RAM that it requires page (not job) streaming from the PC.
AFAIK it has 512 KB of RAM, and the whole-page picture compressed to the 
printer language (CAPTv1) is around 1.5 MB.

The printer doesn't use regular usb EP stall feature to tell the host 
that it shouldn't send any more data. Instead, it uses bi-directional 
protocol where the host polls the printer status every time during the 
printing process, and checks whether printer says it can accept the data.

So it's constant:
1. Hey printer, tell me your BasicStatus
2. Here it is, 6 bytes of data
3. Hey printer, tell me your ExtendedStatus
4. Here it is, first BasicStatus again, then ExtendedStatus 16 bytes in 
the next USB transfer
5. So you're ready to accept the data? Here you are, your <=6144 raster.
6. Hey printer, tell me your BasicStatus...

You can imagine how inefficient is that for USB 1.1.

And a single USB transfer raster data is limited to 6144 bytes in the 
"driver" (CUPS filter) for some reason. This doesn't seem to be a 
printer hardware limitation: I've patched this limit to 16128 and it 
seems to work as a workaround for this issue (more data in a single USB 
transfer).

This is an official proprietary x86 Canon driver. I'm running it on ARM 
via both qemu and box86 (and the interpretation performance is not an 
issue here, I checked that. It works fine on much lower-end SBC which 
has MUSB stack with EHCI only).


> The timing information in the usbmon traces will contain helpful clues
> about what's going on, especially if the OHCI trace is compared to the
> EHCI trace.  (Incidentally, you shouldn't use usbmon0; you should the
> bus number that the printer is attached to.)

The "success" response on OUT raster data takes about 2-2.5x longer with 
OHCI than via the hub. And I can't say it's too slow either, everything 
seems to be more or less fine regarding the timings, but the printer 
doesn't like it, reporting NOT_READY | OFFLINE in BasicStatus and 
UNDERFLOW in Engine ExtendedStatus.

I'm not very versed in USB though.
I can upload .pcaps if that's useful.


> 
>> Here's a speed comparison using simple Python script with asks the printer
>> status 10000 times.
>>
>> Direct connection, OHCI:
>>
>> # python3 speedtest.py
>> Opening printer at /dev/usb/lp0...
>> Testing 10000/10000...
>> Avg delta: 1.916 ms
>> Min: 1.443 ms
>> Max: 2.891 ms
>>
>> Connection via the USB 2.0 hub, EHCI:
>>
>> # python3 speedtest.py
>> Opening printer at /dev/usb/lp0...
>> Testing 10000/10000...
>> Avg delta: 0.696 ms
>> Min: 0.590 ms
>> Max: 1.072 ms
> 
> Without knowing what these numbers refer to, it's hard to say anything
> useful.  About all I can glean is that EHCI is faster than OHCI, which
> we already know.

The speedtest.py requests BasicStatus and reads the response in a loop.

> 
>> The printer is from year 2002, with USB 1.1 full speed, and was designed to
>> work via USB 1.1 controllers.
>> Any ideas what could be wrong?
> 
> No.  Have you tried using the printer on a computer with a different
> (non-Linux) operating system?

I think I have a PC on LGA775 which may have OHCI support. I'll try the 
speedtest.py under Windows XP or 7.

> 
> Alan Stern


