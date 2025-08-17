Return-Path: <linux-usb+bounces-26942-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F111B29452
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 19:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51D6E7A32BF
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 17:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3E3226CFD;
	Sun, 17 Aug 2025 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmeacs.de header.i=@mmeacs.de header.b="QTJPblHZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp6.goneo.de (smtp6.goneo.de [85.220.129.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2471C2AE97
	for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 17:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.220.129.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450116; cv=none; b=PXwOSTUQsenWD/Q+Yk1P6QUImK4EyMXg6WGV4yj/DGkCBDs3/UdgXcqU/ifLpc2GZftqo9l4eOI/mWLNELg3qVZxHcDnDdSKbUHH0wjiHDd094LZyuOy1VwCa5W+sbnDn7WeLoFlF+bgT2yYmvyJk6b/ke3ZvHk1yi+dzV6X1Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450116; c=relaxed/simple;
	bh=oXFTNsoC/ubRuyOEG0NCFAlt4jHbivcXBGTSNcYGVeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CD9r688jSBr/pRDQBgQIMJuXqAB9z//qvDNSFQ9jyPhfxyYw5kJV1asv2gQIPbIgFPQFZ9qsrVFAI2dfI17sBUAxVl29iG13B0XbaNfCa6fJtlAh6p9eqleq7TW7WrLnwhTTSjt6TsdSadSZ6fDskjJtEc/AjYOxPf1jNMCy9l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mmeacs.de; spf=pass smtp.mailfrom=mmeacs.de; dkim=pass (2048-bit key) header.d=mmeacs.de header.i=@mmeacs.de header.b=QTJPblHZ; arc=none smtp.client-ip=85.220.129.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mmeacs.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmeacs.de
Received: from hub1.goneo.de (hub1.goneo.de [85.220.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by smtp6.goneo.de (Postfix) with ESMTPS id C32F12409FD;
	Sun, 17 Aug 2025 19:01:48 +0200 (CEST)
Received: from hub1.goneo.de (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hub1.goneo.de (Postfix) with ESMTPS id E397F24084C;
	Sun, 17 Aug 2025 19:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mmeacs.de; s=DKIM001;
	t=1755450107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHQiyJynyoB1XLNhvJtSFE+yVV/z0WrrcmSprfXEd3E=;
	b=QTJPblHZc56AfU5O+Lnl0tahezeWImJ+sl8B2+a4lUH/ObQ48pKY/sVZIos04tlsmH/qzI
	8UWwQXhKGFUiJ/c2iyYgaPkLpJnTs+Qk2k/VU389HggTl0mlScym7Rs6boGjGwUc+MoziR
	5gu/NslTAJm3l5QVWfEweCUj2x1Z7lHl1je2znDLsU81GGq9qgk4pHK4o1f6BIYCMToywz
	3Gj6CR1qE3NqhX2TLNMnuLKXKqJ1b7juBRzRiEKIsQzoduVKjuHwKm+1Ah8Ag357G9ZNNa
	PG2uwz2xM5r5CPPIGOe3YiBIZo4wxj5N2Gfj+v8QCnG+x2bavThEP9ZUG9/qvA==
Received: from [192.168.177.20] (tmo-080-85.customers.d1-online.com [80.187.80.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hub1.goneo.de (Postfix) with ESMTPSA id 8D8212405BB;
	Sun, 17 Aug 2025 19:01:46 +0200 (CEST)
Message-ID: <8a7d28ac-a269-4ce5-ba72-a685541f4c16@mmeacs.de>
Date: Sun, 17 Aug 2025 19:01:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problem hanging Bulk IN, with USB 3.x, perhaps due to
 wMaxPacketSize = 1024 and wMaxBurst = 6 (OUT) and 2 (IN), tested and
 reproduceable with i.MX8MP and Raspberry Pi Compute Module 5 (CM5)
To: Daniele Palmas <dnlplm@gmail.com>
Cc: linux-usb@vger.kernel.org, michal.pecio@gmail.com,
 mathias.nyman@linux.intel.com
References: <64e36d3b-606f-4fa7-bb6a-1dfd8a144de6@mmeacs.de>
 <2c13a7f8-647e-4199-b0e6-451128bdd61e@linux.intel.com>
 <1b1391ef-b8f4-48bd-952c-0530ebc97be4@mmeacs.de>
 <CAGRyCJEaysizTYu=bsP2mhg54-iiP-rWeS6_9h5sfm4yr705yw@mail.gmail.com>
From: Martin Maurer <martin.maurer@mmeacs.de>
In-Reply-To: <CAGRyCJEaysizTYu=bsP2mhg54-iiP-rWeS6_9h5sfm4yr705yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-UID: 8316da
X-Rspamd-UID: 8fe525

Hi Daniele,

many thanks for your reply!

I can only partly open

https://www.spinics.net

pages, often pages time out...

Have I understood correctly, that there is a known bug, but it was not 
fixed (from 2020 till now).

But as workaround enabling qmux/qmimux could work?

Best regards,

Martin



Am 17.08.2025 um 17:22 schrieb Daniele Palmas:
> Hello Martin,
>
> Il giorno dom 17 ago 2025 alle ore 17:09 Martin Maurer
> <martin.maurer@mmeacs.de> ha scritto:
>> Hello Michał, hello Mathias at all,
>>
>> many thanks for your answers!
>>
>> I have tried if I can reproduce it with a AMD Linux PC, but
>> unfortunately I was not able to reproduce (but setup is a bit different).
>>
>> So I went back to Raspberry Pi Compute Module 5, where I mainly
>> connected the radio module (Quectel RM520N-GL) via USB3,
>>
>> and installed a Wifi access point. All data/all connections from Wifi
>> access point are routed directly via wwan0 to radio module.
>>
>> This is currently my easiest setup to be able to reproduce the error.
>> Mostly in a few seconds.
>>
>> My knowledge in area Linux Kernel + USB is unfortunately not yet enough
>> to analyze and fix it by myself.
>>
>> But I used the help of ChatGPT-5 to create an usbmon and xhci kernel trace.
>>
>> I create an usbmon trace as well as a trace from xhci (both recorded in
>> parallel):
>>
>> https://www.file-upload.net/en/download-15523936/usbmon_bus5_20250817-150158.log.html
>>
>> https://www.file-upload.net/en/download-15523937/xhci_20250817-150158.trace.html
>>
>> This was the last output, my ping in a shell has shown:
>>
>> 64 bytes from 8.8.8.8: icmp_seq=2323 ttl=112 time=26.0 ms
>> 64 bytes from 8.8.8.8: icmp_seq=2324 ttl=112 time=25.0 ms
>> 64 bytes from 8.8.8.8: icmp_seq=2325 ttl=112 time=29.1 ms
>> 64 bytes from 8.8.8.8: icmp_seq=2326 ttl=112 time=37.8 ms
>>
>> In parallel created more data traffic, but with ping I see first when IP
>> data connection does not work stable anymore.
>>
>> According to ChatGPT-5 the following places contain errors:
>>
>> *** USBMON ***
>>
>> In your usbmon_bus5_20250817-150158.log:
>>
>> First -71 (EPROTO) on the QMI Bulk-IN (Bi:5:005:14): line 2161,
>> timestamp 493245744
>>
>> 2161: ffffff8003c8cb40 493245744 C Bi:5:005:14 -71 0
>>
>> Just before that, there’s a -75 (EOVERFLOW) on the same IN EP, which is
>> often the first sign of trouble: line 2159, timestamp 493245221
>>
> I did not have the chance to look at the usbmon traces so I'm not sure
> that this is really the same scenario, but you could take a look at
> the whole thread at
> https://www.spinics.net/lists/netdev/msg635944.html
>
> If it is the same issue, basically, if you setup the data connection
> with QMAP you should not face the issue.
>
> Regards,
> Daniele
>
>> 2159: ffffff8003c8cd80 493245221 C Bi:5:005:14 -75 1024 = ...
>>
>> So the sequence is: several good completions → EOVERFLOW (-75) → then a
>> stream of EPROTO (-71) errors on Bi:5:005:14, which kills further ping
>> replies after your last good seq (2326).
>>
>>
>> *** XHCI TRACE ***
>>
>> I found the first failure in your xHCI trace.
>>
>> First error line: line 8216
>>
>> Timestamp: 758267.000115
>>
>> Event: xhci_handle_event … type 'Transfer Event' … 'Error' … slot 1 ep
>> 29 … len 1472
>>
>> Why ep 29? In xHCI, the endpoint context index is ep_index = 2 *
>> ep_number + (direction), where direction is 0=OUT, 1=IN.
>> So for Bulk IN ep 14: 2*14+1 = 29 → that’s your IN 0x87 pipe.
>>
>> Right after that line you can see the driver react:
>>
>> xhci_handle_transfer … length 1472 … (the failed TD)
>>
>> xhci_queue_command: Reset Endpoint Command … ep 29 (host tries to recover)
>>
>> xhci_handle_event: … 'Command Completion Event' (reset completes)
>>
>> But from this point on, completions for that IN EP correspond to usbmon
>> -71 (EPROTO) — matching what you saw.
>>
>>
>> Does this give a clue, where it could be coming from?
>>
>> It is 100% reproduceable in a few seconds on Raspberry Pi Ccompute
>> Module 5 (and I same behaviour on different kernel of i.MX8MP).
>>
>> Could it be a hardware problem? I already tried different radio module
>> (all Qualcomm, X62/X65 and X72/X75),
>>
>> different cables (all same length, all from same source), different eval
>> board for the M.2 radio modules (but from same source).
>>
>>
>> Can you give me a hint, what to try next?
>>
>>
>> ChatGPT-5 pinpoints me to try to disable LPM for USB3, could this be a
>> next step? Or is it something  else?
>>
>>
>> Many thanks for your help!
>>
>> Best regards,
>>
>> Martin
>>
>>

