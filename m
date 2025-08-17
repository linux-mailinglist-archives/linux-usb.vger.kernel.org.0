Return-Path: <linux-usb+bounces-26938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A89CB293BC
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 17:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8B31B2273B
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 15:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B18B22FE06;
	Sun, 17 Aug 2025 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmeacs.de header.i=@mmeacs.de header.b="X1NmzoaK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp052.goneo.de (smtp052.goneo.de [85.220.129.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E751C84BD
	for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.220.129.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755443284; cv=none; b=krYfgktHZvqNI8n04D836iiMprBV+/4o0Ep3Dhq38cPFYCPvtS9WPw/ZbgIdQmwjEV9mrJf8NigHyvn6y5O0O/VV8V/j5CIC77DvqqJGM5kZuNIZtZBiLDOmb0aDyWDd5SKKw97QRmkzKptXP17PfZqjSvljqHHPDAdlOMm4elw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755443284; c=relaxed/simple;
	bh=TRVYyuHUqVfcDrrLbmHcFx4+kqVphf70M/bGABAedaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KWGS8NhqblUF3U8xB+B1mvArEUS4u5GX/9/GhuL4szMujVIJGSijihh46CCjdzBKtwgt1TM4OudVZF1zLNwiujhafAdECVJzL+hfs33JsN57i0tLb4UTJTEL8dkKeR2TyiiFT/UluOb+IBGOQ8LEWG9gVnhp1+2VlXmpab8Cuzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mmeacs.de; spf=pass smtp.mailfrom=mmeacs.de; dkim=pass (2048-bit key) header.d=mmeacs.de header.i=@mmeacs.de header.b=X1NmzoaK; arc=none smtp.client-ip=85.220.129.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mmeacs.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmeacs.de
Received: from hub1.goneo.de (hub1.goneo.de [85.220.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by smtp5.goneo.de (Postfix) with ESMTPS id A2CBF2402AC;
	Sun, 17 Aug 2025 16:58:43 +0200 (CEST)
Received: from hub1.goneo.de (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hub1.goneo.de (Postfix) with ESMTPS id C765A2402E7;
	Sun, 17 Aug 2025 16:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mmeacs.de; s=DKIM001;
	t=1755442721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jQApN9UebpED+ZS+jzZo7/PgKn0HCRrCkjA9+B3CKgw=;
	b=X1NmzoaK47osdO5Mu9TlNfT1//dggs+G2c0A6Ju3dM3zV3CPQTFt9+trORBpVQaypLR9FY
	VNxTNK1HJoVP8GiEfKcTyN6rvLCFogr4wbqbv4RWpQWcomlmRcvBsUnLIKl+udcVFGKyVF
	QJll2nxyo6UEm7TKLnE9rEDwtpPqoZ/y8Wr3dVlC6f0wOsD9Gu0ho1rjChQonkvNi1PPRT
	MoHe5MjQHnIZoQysCd2A5jLiEbPrLCtGdbQlyuvesBE1411yezWcvNioSzY0o4ijJrq2yi
	EAXFvpL45Nil31V1KbrhNa5IbEzc6vEPGDDXCV9u382DDUca4vW5FnGFhvUHuA==
Received: from [192.168.177.20] (tmo-080-85.customers.d1-online.com [80.187.80.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hub1.goneo.de (Postfix) with ESMTPSA id 463E8240167;
	Sun, 17 Aug 2025 16:58:41 +0200 (CEST)
Message-ID: <1b1391ef-b8f4-48bd-952c-0530ebc97be4@mmeacs.de>
Date: Sun, 17 Aug 2025 16:58:40 +0200
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
To: linux-usb@vger.kernel.org, michal.pecio@gmail.com,
 mathias.nyman@linux.intel.com
References: <64e36d3b-606f-4fa7-bb6a-1dfd8a144de6@mmeacs.de>
 <2c13a7f8-647e-4199-b0e6-451128bdd61e@linux.intel.com>
From: Martin Maurer <martin.maurer@mmeacs.de>
In-Reply-To: <2c13a7f8-647e-4199-b0e6-451128bdd61e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-UID: 5f67c5
X-Rspamd-UID: 18f28e

Hello Michał, hello Mathias at all,

many thanks for your answers!

I have tried if I can reproduce it with a AMD Linux PC, but 
unfortunately I was not able to reproduce (but setup is a bit different).

So I went back to Raspberry Pi Compute Module 5, where I mainly 
connected the radio module (Quectel RM520N-GL) via USB3,

and installed a Wifi access point. All data/all connections from Wifi 
access point are routed directly via wwan0 to radio module.

This is currently my easiest setup to be able to reproduce the error. 
Mostly in a few seconds.

My knowledge in area Linux Kernel + USB is unfortunately not yet enough 
to analyze and fix it by myself.

But I used the help of ChatGPT-5 to create an usbmon and xhci kernel trace.

I create an usbmon trace as well as a trace from xhci (both recorded in 
parallel):

https://www.file-upload.net/en/download-15523936/usbmon_bus5_20250817-150158.log.html

https://www.file-upload.net/en/download-15523937/xhci_20250817-150158.trace.html

This was the last output, my ping in a shell has shown:

64 bytes from 8.8.8.8: icmp_seq=2323 ttl=112 time=26.0 ms
64 bytes from 8.8.8.8: icmp_seq=2324 ttl=112 time=25.0 ms
64 bytes from 8.8.8.8: icmp_seq=2325 ttl=112 time=29.1 ms
64 bytes from 8.8.8.8: icmp_seq=2326 ttl=112 time=37.8 ms

In parallel created more data traffic, but with ping I see first when IP 
data connection does not work stable anymore.

According to ChatGPT-5 the following places contain errors:

*** USBMON ***

In your usbmon_bus5_20250817-150158.log:

First -71 (EPROTO) on the QMI Bulk-IN (Bi:5:005:14): line 2161, 
timestamp 493245744

2161: ffffff8003c8cb40 493245744 C Bi:5:005:14 -71 0

Just before that, there’s a -75 (EOVERFLOW) on the same IN EP, which is 
often the first sign of trouble: line 2159, timestamp 493245221

2159: ffffff8003c8cd80 493245221 C Bi:5:005:14 -75 1024 = ...

So the sequence is: several good completions → EOVERFLOW (-75) → then a 
stream of EPROTO (-71) errors on Bi:5:005:14, which kills further ping 
replies after your last good seq (2326).


*** XHCI TRACE ***

I found the first failure in your xHCI trace.

First error line: line 8216

Timestamp: 758267.000115

Event: xhci_handle_event … type 'Transfer Event' … 'Error' … slot 1 ep 
29 … len 1472

Why ep 29? In xHCI, the endpoint context index is ep_index = 2 * 
ep_number + (direction), where direction is 0=OUT, 1=IN.
So for Bulk IN ep 14: 2*14+1 = 29 → that’s your IN 0x87 pipe.

Right after that line you can see the driver react:

xhci_handle_transfer … length 1472 … (the failed TD)

xhci_queue_command: Reset Endpoint Command … ep 29 (host tries to recover)

xhci_handle_event: … 'Command Completion Event' (reset completes)

But from this point on, completions for that IN EP correspond to usbmon 
-71 (EPROTO) — matching what you saw.


Does this give a clue, where it could be coming from?

It is 100% reproduceable in a few seconds on Raspberry Pi Ccompute 
Module 5 (and I same behaviour on different kernel of i.MX8MP).

Could it be a hardware problem? I already tried different radio module 
(all Qualcomm, X62/X65 and X72/X75),

different cables (all same length, all from same source), different eval 
board for the M.2 radio modules (but from same source).


Can you give me a hint, what to try next?


ChatGPT-5 pinpoints me to try to disable LPM for USB3, could this be a 
next step? Or is it something  else?


Many thanks for your help!

Best regards,

Martin


