Return-Path: <linux-usb+bounces-31444-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5BCBDF55
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 14:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E792030249C0
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 13:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660582C11DD;
	Mon, 15 Dec 2025 13:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S1AiBZi1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9559B2BDC17
	for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 13:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804066; cv=none; b=cqxD7WnuvbABa1IY76Cn1LTxqLH71FDrOJARQVUQt0zxVIEDJJ0k3xsTz9YmBwpVfTqHHWse5EhFA32paFYnH7Wh/oBCyq/ryb9tHFf/0P1vI/MDVBTCtGOi0EI21+iv4fshgOj7L4DDzZR17iApCNHbaMP9VT4q3yNNVSnUWxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804066; c=relaxed/simple;
	bh=a02UgWGXyh9rDXXEyWzLzXmiEfNJSuSbi38zTkySJYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j8D64k9OSLmPrMezcxVZjUOZ6NI67MKI+e3VsYQDpG7fsdouXhjhIc6vDuvZsIhKBOfl1qvwWM038BT+Cu4ZBS9/D5EazZb7oDM6RlInvEooU3HIxmPmttgc9/dnw30udL4/KttQFGA9M4bUW6BpAXhUqXHqwIRFR96NrJcqPtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S1AiBZi1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so494480f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 05:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765804063; x=1766408863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7qplqnjhn6voo1EmfvYFzKleJFlIzqnKZo8SI4DFzVw=;
        b=S1AiBZi1f+6rFY1VYwV2FXm8tuGF0RbTfu42HR02oen79C4uhZCWsIZaaQy8BkqLU2
         t7gse4zGZFZHisaHFrJW7AqtH+B/NNXOnVTen8siO3nzN44TilJMQo/BFn5qE5EYSTYy
         rsd11P5XL12M71cZzs2RrFJ9Yz5oyy69Vu158fIns9n+WeWjrfMzMahk+b7gJetKn7Rq
         jXGOB00Rgv555Pqtv3qnOJ2JFhYNeea9DT2sogOb9mHUmpMCoMfQwFQuQgjvRvKcLP2V
         Abcp7tq0JofmtP/tOkLHyADG47WGdEA3hDtWDxq0ePmCsrTTQYS2zVB/8cKzPXnFZxYk
         25pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765804063; x=1766408863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qplqnjhn6voo1EmfvYFzKleJFlIzqnKZo8SI4DFzVw=;
        b=QAJPPb/14gi7imaABY9eflVmygUf9+RDOUy7cN2yQJkCrKNupoyk+2K6BGga4qEYkI
         RASOr7z8fFrNh9eBaZ9jaaQvQIjqRtcUpUGrDupGLxbjyxAI9pqiTbgJE4sSQXSQHQvB
         nOk+g8fGIxUDjWc5xGz1cw5Eo5CUlJx2jVRAUIWRO8xY2H5VzrINV8/fAV70bRt7uy0r
         wG58APw8CKo2jArzBMfkxg4u1uFGD9F/tp8K1L1p94lKiFCfBHZZtG8InAbXNkEu7cRY
         zkg9+TqOt2J4FmgbZAISw7usdjG8VL7INQQhj5E2PF4moXrFV6Etl4R4tDIvT5/leXf1
         2Brg==
X-Forwarded-Encrypted: i=1; AJvYcCVQkn5pgR7SL9DkrbEdhnZZjaJy8wHzkikm2MNwkDyzV+aE77bKZPFSCTOY3Ob7RRkM/4i1suCIv2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKkZsu9qFSWojt+Uc0tMRpu6qSi7Y/sfwRh9PfyPFSeVp333aL
	FLWUHh+jDV+yVUqthFvopgdVuZ9yaQu/CUDKRrmAAjmirK4Bo7KmK3oWnCm3HxW3O+vR/q7beCk
	Jdr6v
X-Gm-Gg: AY/fxX4oKtddpXnLsvJziGVIo4ZS+hURpyrAxzVJbIrkzBt8arE3RerfMY9SW+4+3EM
	CrfWUoDLxHVM+cHhU1nwLyWKd1+lp8lgWZQdSxUpUAgzz9pZ8XptJ5bAwuH0m6u4PWZxgK3XIEz
	jNH0QsPacngtgakDDYyh+9kC/FMDHwUdykIarqEwFgbERKg+hXWlcrk3aetdUN8tknb5TqI6a5w
	4KF1Oa1/V9ZN1L31oHEPd4cjG8BQc3aP0x8a4BeFJz8eGi54B6KBPvGpiHSZq0/LHpafWs9BKG+
	XY8ZWpH7XHRyKW96OE8HfsxUS9fFt8G+1j2o218Lvhlyvsja+WPNcFcMbI0lx6qMZ3oopzzx07g
	/s49X0WGGaYj+waF2yC5yRNsDYtkzl3h9ID2LScnMmMC5o0CBo0OQ7cZA8ueDekE0v8e9YeTPwg
	EvRo4cQVqcnbrWc8zYJDscAbesXZcrTrXMHUPeW6HvpsZ6AW50iLfp1CY=
X-Google-Smtp-Source: AGHT+IHXLdqnqFuHNlIVRwzuK52LvEb+mt9eBIYyfLG1RgkN186RymlVi97MKEV2Q5i32nmFNJQntA==
X-Received: by 2002:a05:6000:4013:b0:430:fcbc:dc51 with SMTP id ffacd0b85a97d-430fcbcddb3mr3763575f8f.14.1765804062618;
        Mon, 15 Dec 2025 05:07:42 -0800 (PST)
Received: from ?IPV6:2001:a61:137c:cb01:4211:8477:daab:9d33? ([2001:a61:137c:cb01:4211:8477:daab:9d33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f675c2basm11760586f8f.18.2025.12.15.05.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 05:07:42 -0800 (PST)
Message-ID: <ade89a9d-6034-43e6-ba74-778db2f8837c@suse.com>
Date: Mon, 15 Dec 2025 14:07:40 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trouble with drivers for Epson Moverio BT-40
To: natalie roentgen connolly <natalie@natalieee.net>,
 linux-usb@vger.kernel.org
References: <9c4491aa-88d3-4c9a-843c-2f0d471263e0@natalieee.net>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <9c4491aa-88d3-4c9a-843c-2f0d471263e0@natalieee.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12.12.25 06:33, natalie roentgen connolly wrote:

Hi,

> At this point I am unsure as to what to do as I have no experience working with
> kernel code. As far as I can tell, cdc-acm is indeed the correct driver to use
> here, as others said so in the thread I found.
> (https://lore.kernel.org/linux-usb/2023112652-scowling-submarine-5071@gregkh/)

Yes, it is the correct driver.
  
> Here is the device as it appears in /sys/kernel/debug/usb/devices:
> T:  Bus=07 Lev=02 Prnt=10 Port=01 Cnt=02 Dev#= 12 Spd=12   MxCh= 0
> D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=04b8 ProdID=0d12 Rev= 2.00
> S:  Manufacturer=Seiko Epson Corporation
> S:  Product=EPSON HMD Com&Sens
> S:  SerialNumber=NPH269690136
> C:* #Ifs= 4 Cfg#= 1 Atr=c0 MxPwr=100mA
> A:  FirstIf#= 1 IfCount= 2 Cls=02(comm.) Sub=02 Prot=01
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
> E:  Ad=83(I) Atr=03(Int.) MxPS=  64 Ivl=1ms
> I:* If#= 1 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=(none)

Problem

> E:  Ad=84(I) Atr=03(Int.) MxPS=   8 Ivl=16ms
> I:* If#= 2 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=(none)

Problem

> E:  Ad=01(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
> E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=1ms
> 

> Apologies if I have missed something obvious, as stated I have no experience

You are missing something, but it is not obvious. To understand
your issue you'd need to know what exactly NO_UNION_NORMAL does.
It forces the driver to use interfaces #0 and #1.
Your device uses different interface numbers. The driver verifies
that the interfaces are plausible and bails out in the failure case,
but does not try to correct its assumption.

Your device will need a quirk of its own, if we cannot get it
to work without a quirk. I would like to avoid that, if possible.
So could I ask you to post a log what happens with an unpatched kernel
and the output of "lsusb -v"?

	Regards
		Oliver


