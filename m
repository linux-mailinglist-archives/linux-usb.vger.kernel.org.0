Return-Path: <linux-usb+bounces-25940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1856B09609
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 22:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3103A465A2
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 20:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997B22264CD;
	Thu, 17 Jul 2025 20:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bigon.be header.i=@bigon.be header.b="Bb6xCnvA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B7EEBB
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752785770; cv=none; b=UgQyFcrTUTBBnc5jrMrNs26xX/GL34BF57UxD29U6G0aJTlMwXzlIl9MynRYiCk1l6Py5SVgojVwiEtfNEhimTyy6XvsqG3cNqoXzzCfJ6kgD7auB+erMxnh1FhzcRjW0TI6ORBdtGf/7a/WRHD0Rng2pAE9LFvYfpY9dbEETzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752785770; c=relaxed/simple;
	bh=KBhqILzcTLN8LoLWHoreiE3wqW5xXVe1E43eXz4UQuQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GadCHR1fCWsWYRAPzwpu+mZWDuujM4Y2NONtdgjSa/fkRJr2JKQSnFwBksM44mgEASILZ86R8P0YqEqGj4vnxqvJlSc7LGAN6tfUVrkpa/YYy3fRPLVdASYe/uIpY57VTOWA4o0GAea7mcOGakKylpzSZmp6Mpgfo0dZtPv7QSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bigon.be; spf=pass smtp.mailfrom=bigon.be; dkim=pass (2048-bit key) header.d=bigon.be header.i=@bigon.be header.b=Bb6xCnvA; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bigon.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bigon.be
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bjlZN4SqVz9sp2;
	Thu, 17 Jul 2025 22:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bigon.be; s=MBO0001;
	t=1752785756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1fBe/2KlyVZIpjGXqXWGNpzwAsk5az2vLsdD9+RjvBg=;
	b=Bb6xCnvA8jEtsHbG1H250gDweYFu84XEmFTBpqjtv64jB7auud7jFqZcyrVMIQdk5VCr3n
	n48ok3ITk1JIGfnUDmbtmzkiaZE+LpQNad4sia8ki5xHLQnpCzvcSEQfa++R33FMaUzX+J
	AKiCHQIIwHpkETRCLCLEjkmVf3yItCsVd3mJECNVTRK6xaQx8qZx0nwL7YhHM7rUehT1jR
	o44pBtbEv62q9SpAOEOyWMYlhwaSHWWf/MlphtaLV9k4tN+ogVYodkQPjB6cV2e0UWf5G2
	atrucTv6LpWeRyLFjG6ZqVcgZcXDComLVUagkV8k/627gZHc4I6HYCdzWmDk1g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of bigon@bigon.be designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=bigon@bigon.be
Message-ID: <9f9554de-5288-4eda-8838-49ca7d87290c@bigon.be>
Date: Thu, 17 Jul 2025 22:55:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Laurent Bigonville <bigon@bigon.be>
Subject: Re: Hikmicro Mini2 V2: unable to enumerate USB device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <c05a76cc-ac27-4f64-a4a7-5a1e0fd349d9@bigon.be>
 <2025071756-improve-compactor-207f@gregkh>
Content-Language: en-US, fr-BE, fr
In-Reply-To: <2025071756-improve-compactor-207f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bjlZN4SqVz9sp2

Le 17/07/25 à 16:38, Greg KH a écrit :
> On Thu, Jul 17, 2025 at 02:06:13PM +0200, Laurent Bigonville wrote:
>> Hello,
>>
>> I just bought an Hikmicro Mini2 V2 USB thermal camera and the device is not
>> recognized
>>
>> [   64.039667] usb 3-2: new high-speed USB device number 11 using xhci_hcd
>> [   64.245840] usb 3-2: New USB device found, idVendor=2bdf, idProduct=0106,
>> bcdDevice= 4.09
>> [   64.245857] usb 3-2: New USB device strings: Mfr=1, Product=2,
>> SerialNumber=3
>> [   64.245862] usb 3-2: Product: Thermal Imager
>> [   64.245865] usb 3-2: Manufacturer: Hikmicro
>> [   64.245868] usb 3-2: SerialNumber: XXXXXXXX
>> [   65.817499] usb 3-2: USB disconnect, device number 11
>> [   66.162197] usb 3-2: new high-speed USB device number 12 using xhci_hcd
>> [   66.344529] usb 3-2: device descriptor read/64, error -71
>> [   66.629395] usb 3-2: device descriptor read/64, error -71
>> [   66.922427] usb 3-2: new high-speed USB device number 13 using xhci_hcd
>> [   67.104880] usb 3-2: device descriptor read/64, error -71
>> [   67.390254] usb 3-2: device descriptor read/64, error -71
>> [   67.493238] usb usb3-port2: attempt power cycle
>> [   68.151973] usb 3-2: new high-speed USB device number 14 using xhci_hcd
>> [   68.152150] usb 3-2: Device not responding to setup address.
>> [   68.354479] usb 3-2: Device not responding to setup address.
>> [   68.560631] usb 3-2: device not accepting address 14, error -71
>> [   68.747321] usb 3-2: new high-speed USB device number 15 using xhci_hcd
>> [   68.747422] usb 3-2: Device not responding to setup address.
>> [   68.950227] usb 3-2: Device not responding to setup address.
>> [   69.152505] usb 3-2: device not accepting address 15, error -71
>> [   69.152593] usb usb3-port2: unable to enumerate USB device
>>
>> The device is not listed in lsusb after this
>>
>> It's not clear whether the camera is a UVC one, but the device should still
>> appear, right?
>>
>> An idea what to do?
> What kernel version is this?  The device really doesn't like to be read
> from, does it work in any other machine?  Plugged into a different
> port/hub?

This was 6.15.6, I tried with 6.12.37 on the same machine same problem.

The device works on my android smartphone. I plugged the device on my 
desktop and it works on Windows.

On my desktop with 6.12.37, I get a different error in dmesg:

[  125.969892] usb 1-9: new high-speed USB device number 18 using xhci_hcd
[  126.089957] usb 1-9: device descriptor read/64, error -71
[  126.314006] usb 1-9: device descriptor read/64, error -71
[  126.805979] usb 1-9: new high-speed USB device number 19 using xhci_hcd
[  126.926014] usb 1-9: device descriptor read/64, error -71
[  127.149944] usb 1-9: device descriptor read/64, error -71
[  127.254057] usb usb1-port9: attempt power cycle
[  127.645932] usb 1-9: new high-speed USB device number 20 using xhci_hcd
[  127.646058] usb 1-9: Device not responding to setup address.
[  127.849893] usb 1-9: Device not responding to setup address.
[  128.053960] usb 1-9: device not accepting address 20, error -71
[  128.377946] usb 1-9: new high-speed USB device number 21 using xhci_hcd
[  128.401717] usb 1-9: New USB device found, idVendor=2bdf, 
idProduct=0102, bcdDevice= 4.09
[  128.401729] usb 1-9: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[  128.401732] usb 1-9: Product: Camera
[  128.401735] usb 1-9: Manufacturer: HIK
[  128.401738] usb 1-9: SerialNumber: EA2228627
[  128.411139] usb 1-9: Found UVC 1.10 device Camera (2bdf:0102)
[  195.050243] uvcvideo 1-9:1.1: Failed to query (130) UVC probe control 
: -32 (exp. 34).
[  195.051467] uvcvideo 1-9:1.1: Failed to query (130) UVC probe control 
: -32 (exp. 34).
[  195.052702] uvcvideo 1-9:1.1: Failed to query (130) UVC probe control 
: -32 (exp. 34).
[  195.054114] uvcvideo 1-9:1.1: Failed to query (130) UVC probe control 
: -32 (exp. 34).
[  195.055431] uvcvideo 1-9:1.1: Failed to query (130) UVC probe control 
: -32 (exp. 34).
[  195.056530] uvcvideo 1-9:1.1: Failed to query (130) UVC probe control 
: -32 (exp. 34).

Here the device appears un lsusb, but UVC driver is not happy.

I applied quirks=0x02 to uvcvideo and I have "something" (that something 
is not the same image as I get on windows though, on windows I get a 
nice black/white image here it's a not so nice green image split in 3)

So I guess there are 2 issues here

For the 2nd issue, I not the only one it seems: 
https://forums.raspberrypi.com/viewtopic.php?t=376245


