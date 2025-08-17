Return-Path: <linux-usb+bounces-26939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FA6B293C5
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 17:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF0F2196871E
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 15:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69E929E0FD;
	Sun, 17 Aug 2025 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmeacs.de header.i=@mmeacs.de header.b="B+AOZ5wY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp6.goneo.de (smtp6.goneo.de [85.220.129.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347E529D28D
	for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.220.129.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755443624; cv=none; b=Mrqaf8WDnCixPY0583dKteAWvfA0uPYiIcscTULvsdvZ5NHgI/ltKmqF1Prmq9xmQezgLxHl6lEiNhY8PWSvrM1wFlsmhyNDmlN7rkHMO6pzhN7owWNUkjgGVg/x3wWOcR0at+UgjxiXRzlimxNlTnybRMNfpkO8lQzXqbpUeJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755443624; c=relaxed/simple;
	bh=uSSc0Bq76VI6MgkHO/HdQRmLePtP99Ka06JoAowyT44=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=SZlnvccb9l3i0YCAjFayfjvaoQb9M8/8LwUR/UH7qyWUGqxa89UrkFB9jTFoRNiDhrGlUpzg4zPNw7sxQCJdV9uazReOCxYc6hdHSE5qRwQgoxF0tujN3jU4o2VK2PUz/GkUFKU/lhH4FIAur4Y5DpSTUEe3bCSf795QTvCsg4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mmeacs.de; spf=pass smtp.mailfrom=mmeacs.de; dkim=pass (2048-bit key) header.d=mmeacs.de header.i=@mmeacs.de header.b=B+AOZ5wY; arc=none smtp.client-ip=85.220.129.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mmeacs.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmeacs.de
Received: from hub1.goneo.de (hub1.goneo.de [85.220.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by smtp6.goneo.de (Postfix) with ESMTPS id 0E9AA240AA3;
	Sun, 17 Aug 2025 17:07:39 +0200 (CEST)
Received: from hub1.goneo.de (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hub1.goneo.de (Postfix) with ESMTPS id 33044240477;
	Sun, 17 Aug 2025 17:07:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mmeacs.de; s=DKIM001;
	t=1755443257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMBHkmMaOOWX1FwZx9VWny9A6bfuwEeaGw7WzihY1jA=;
	b=B+AOZ5wYSViNnb3cw2cvFtMImr4WhpEd/0TDGJ72IkEfXQ8mMYiSyqAD4+BLeadn5ZsUmY
	ZrlD+5FqeNk704KAe2WKgdnxxezprNOR/9wM4iAwitBuFXUrIePKeMF8Iej2FoP80FYcx8
	u9oFnAagMQqveiWSO+5ThCtaks6lcIQp7Neq1jTQOiCbESjXOTIuz/8CO5ebvONtt23aGd
	JfsJtmSZ4g3CaIh3pCPBpQgEBxb3MuEtvY8LoaVzIp6crBny2shbhz2Mzub3IwkZvD7ir6
	L17OKBykEt8ImGixrvhIb6YkpS4uNaSO6XLSHJtiw/+ziDJTiLH+VvuuRknxcQ==
Received: from [192.168.177.20] (tmo-080-85.customers.d1-online.com [80.187.80.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hub1.goneo.de (Postfix) with ESMTPSA id E632024025B;
	Sun, 17 Aug 2025 17:07:36 +0200 (CEST)
Message-ID: <c34b41e9-627c-4c71-b61a-322afbf3f10d@mmeacs.de>
Date: Sun, 17 Aug 2025 17:07:36 +0200
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
From: Martin Maurer <martin.maurer@mmeacs.de>
To: linux-usb@vger.kernel.org, michal.pecio@gmail.com,
 mathias.nyman@linux.intel.com
References: <64e36d3b-606f-4fa7-bb6a-1dfd8a144de6@mmeacs.de>
 <2c13a7f8-647e-4199-b0e6-451128bdd61e@linux.intel.com>
 <1b1391ef-b8f4-48bd-952c-0530ebc97be4@mmeacs.de>
In-Reply-To: <1b1391ef-b8f4-48bd-952c-0530ebc97be4@mmeacs.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-UID: 8958b0
X-Rspamd-UID: cd2d3d

Don't use the links in original email!

Sorry, more spam than useful. I don't wanted to send big files to 
mailing list, but this service is also shit, sorry again:

I tried it now with WeTransfer:

https://wetransfer.com/downloads/a5ddcb347b80bc0e58413b2053d7aa5d20250817150401/7b0199?t_exp=1755702241&t_lsid=b037582b-3c5f-4b07-abbf-74bf23b4890c&t_network=link&t_rid=YXV0aDB8NjQwOGVjNThhOTFhMzAyZWI3OGU5M2M3&t_s=download_link&t_ts=1755443041&utm_campaign=TRN_TDL_12&utm_source=sendgrid&utm_medium=email&trk=TRN_TDL_12


Download only valid for 3 days.



Am 17.08.2025 um 16:58 schrieb Martin Maurer:
> Hello Michał, hello Mathias at all,
>
> many thanks for your answers!
>
> I have tried if I can reproduce it with a AMD Linux PC, but 
> unfortunately I was not able to reproduce (but setup is a bit different).
>
> So I went back to Raspberry Pi Compute Module 5, where I mainly 
> connected the radio module (Quectel RM520N-GL) via USB3,
>
> and installed a Wifi access point. All data/all connections from Wifi 
> access point are routed directly via wwan0 to radio module.
>
> This is currently my easiest setup to be able to reproduce the error. 
> Mostly in a few seconds.
>
> My knowledge in area Linux Kernel + USB is unfortunately not yet 
> enough to analyze and fix it by myself.
>
> But I used the help of ChatGPT-5 to create an usbmon and xhci kernel 
> trace.
>
> I create an usbmon trace as well as a trace from xhci (both recorded 
> in parallel):
>
> ... Removed due to spam website...

> This was the last output, my ping in a shell has shown:
>
> 64 bytes from 8.8.8.8: icmp_seq=2323 ttl=112 time=26.0 ms
> 64 bytes from 8.8.8.8: icmp_seq=2324 ttl=112 time=25.0 ms
> 64 bytes from 8.8.8.8: icmp_seq=2325 ttl=112 time=29.1 ms
> 64 bytes from 8.8.8.8: icmp_seq=2326 ttl=112 time=37.8 ms
>
> In parallel created more data traffic, but with ping I see first when 
> IP data connection does not work stable anymore.
>
> According to ChatGPT-5 the following places contain errors:
>
> *** USBMON ***
>
> In your usbmon_bus5_20250817-150158.log:
>
> First -71 (EPROTO) on the QMI Bulk-IN (Bi:5:005:14): line 2161, 
> timestamp 493245744
>
> 2161: ffffff8003c8cb40 493245744 C Bi:5:005:14 -71 0
>
> Just before that, there’s a -75 (EOVERFLOW) on the same IN EP, which 
> is often the first sign of trouble: line 2159, timestamp 493245221
>
> 2159: ffffff8003c8cd80 493245221 C Bi:5:005:14 -75 1024 = ...
>
> So the sequence is: several good completions → EOVERFLOW (-75) → then 
> a stream of EPROTO (-71) errors on Bi:5:005:14, which kills further 
> ping replies after your last good seq (2326).
>
>
> *** XHCI TRACE ***
>
> I found the first failure in your xHCI trace.
>
> First error line: line 8216
>
> Timestamp: 758267.000115
>
> Event: xhci_handle_event … type 'Transfer Event' … 'Error' … slot 1 ep 
> 29 … len 1472
>
> Why ep 29? In xHCI, the endpoint context index is ep_index = 2 * 
> ep_number + (direction), where direction is 0=OUT, 1=IN.
> So for Bulk IN ep 14: 2*14+1 = 29 → that’s your IN 0x87 pipe.
>
> Right after that line you can see the driver react:
>
> xhci_handle_transfer … length 1472 … (the failed TD)
>
> xhci_queue_command: Reset Endpoint Command … ep 29 (host tries to 
> recover)
>
> xhci_handle_event: … 'Command Completion Event' (reset completes)
>
> But from this point on, completions for that IN EP correspond to 
> usbmon -71 (EPROTO) — matching what you saw.
>
>
> Does this give a clue, where it could be coming from?
>
> It is 100% reproduceable in a few seconds on Raspberry Pi Ccompute 
> Module 5 (and I same behaviour on different kernel of i.MX8MP).
>
> Could it be a hardware problem? I already tried different radio module 
> (all Qualcomm, X62/X65 and X72/X75),
>
> different cables (all same length, all from same source), different 
> eval board for the M.2 radio modules (but from same source).
>
>
> Can you give me a hint, what to try next?
>
>
> ChatGPT-5 pinpoints me to try to disable LPM for USB3, could this be a 
> next step? Or is it something  else?
>
>
> Many thanks for your help!
>
> Best regards,
>
> Martin
>

