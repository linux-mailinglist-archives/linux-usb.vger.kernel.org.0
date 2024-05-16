Return-Path: <linux-usb+bounces-10292-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E68DB8C7150
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 07:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9934028313E
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 05:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1054A14AB4;
	Thu, 16 May 2024 05:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0l9YuZ3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4289119BA6
	for <linux-usb@vger.kernel.org>; Thu, 16 May 2024 05:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715836755; cv=none; b=rSEe5p37f932LrjY/xS4T4LcU/bepQmwUeUIMZh8Bf3DGOSTD56tLwxK79au2J/bZFgWideB6iCjqeBvLOJ9UeVQjf2ketnzhA3EiXgQLBYSb0XfEU6jC662QjSzpIdFZMXv+6FOpUuRn/wq2UqghYXVdrx5vO0HkuLjjlaIPRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715836755; c=relaxed/simple;
	bh=k62xpfTZqbWq8v6JmHkGZ2b7PYi8xPszC9XfD4ExLxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOgVf9aqv5xVvlmwG5Su6NF7WV1gZTZRI2lqrzf9z/BPxueF3XUNJrUJ+RdFjne/IoCzmuDYB3qgG2oZYdCREPC/bmMFz7MJT3LVrzrkx1vNybezDsAB/uH89c6VdLmxZsHfulpG12aIaDjSEr2cWOzIoUMErzkRBNmB1mIxfXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0l9YuZ3; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c99e8e372fso3275116b6e.3
        for <linux-usb@vger.kernel.org>; Wed, 15 May 2024 22:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715836753; x=1716441553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FlMIOnYEDrH3FsMZmwuEsS1zNmjf1w4qliUhc3PP9Jo=;
        b=A0l9YuZ33gtwwm918n5ggT5Ntj+2Ht+o8PeGgKrRpsYwvwhZhPdiLvaCVa2dcGDHd1
         DFY+GOnsy+tQ+2HOxNjfwMXOoZBj5iCimcgcjN9AUfXCytNeqDAdQHkVHzBSlkyux3sP
         Qo+rWlU8Tu0FMtn5rVrcRLJT97Ed85lrOM479nqwlvPh2SLgwQf6q6gUrCNyhzJ9S9b6
         6tJPVD66+2DMw+Y/pxkLs2XmMk0TA1jMtL6W9+CMY4YQrg7Xo7Loqe10GEPOWe8wedUi
         tASG/vrFJE+FC3HLhoj316fZw1EpZ3T27sWr0WPLDvkY01YSSGWTCWCeux0aeXq22wuU
         oiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715836753; x=1716441553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FlMIOnYEDrH3FsMZmwuEsS1zNmjf1w4qliUhc3PP9Jo=;
        b=lnrU0uqQ46NFHt0ZEsw9VbDBLO/u4PZ0TXSC+ysUsJgpKfVmMMNgXZjbiFjpIdvmC2
         +JpDthUXdIuiEAhJ/Cc9pqqOI9McsEd6Cy0H2Z48UeZRHdvubs6qdwPk9feeKR0Db2Dr
         Mo2GGX0RkMMtbPnIgJgWphTuFyAx1HQe2U/mzWXfvj2ewAkJMKYiD2iFbPQLz5vR6rwF
         oTKVYna7o8vj7Q8JzzkPYxqVlDu7vCSGrBaGI836PO/phnb8WdS5TN4Dahho3vkJjgk0
         p1L3eNt1G89Zt6a9cuSQPTdon5NfLzbl0AT//kvBFZOi6PH5lZ/3FWHcyCQVx3yaFjvf
         3+1Q==
X-Gm-Message-State: AOJu0Yxo531uL+1t6F4aOOAFR81IcZh/HYpFQqP7CtN8Fi/7uHHQ6yq9
	FLRaqkJVvd/ORx911LLq7xKC+kLEyCE3P+2X/FMVqarAXHVk80sNW/087Q0oBUM=
X-Google-Smtp-Source: AGHT+IGm9hsE7yqCTIyLY6OcOp9+AjBV5ARgSSnRg0GIu4f06SsVP6JgOusRDE7rS2NEESB2mh3YpA==
X-Received: by 2002:a05:6870:4191:b0:239:8e67:6f10 with SMTP id 586e51a60fabf-2417290478cmr20933758fac.30.1715836753048;
        Wed, 15 May 2024 22:19:13 -0700 (PDT)
Received: from [100.64.100.6] ([103.163.220.31])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-6f67678336fsm2322073b3a.59.2024.05.15.22.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 22:19:12 -0700 (PDT)
Message-ID: <8d415ea6-fe5a-4ec0-8e95-45c03968e666@gmail.com>
Date: Thu, 16 May 2024 12:19:07 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assistance getting the Universal Audio Apollo Solo USB to work
 with Linux
To: Ethin Probst <ethindp@pm.me>, Alan Stern <stern@rowland.harvard.edu>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <DJiA8anOC3V1gHoj0H-8pmsXujLNu7IlZvNmvUEoDfnjC5VIzZ3YsoTgnUD-zVTsnhgln5BzEsy1n4YkoqkEd_pvTF9oZaukzUoyL-pDfRs=@pm.me>
 <ab4d0394-0d71-45a7-a79b-02e3c90f8ac8@rowland.harvard.edu>
 <N-wnVREkI4qROqLV1rCTIoLRiRzMGvywHt9QIdRD-e5AHby9wfaXcTn2V-Gd_UnmW-JomnWn6xGNhDhIeHIG3VHfHRFmnmPdZEPL8Qi5Gf4=@pm.me>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <N-wnVREkI4qROqLV1rCTIoLRiRzMGvywHt9QIdRD-e5AHby9wfaXcTn2V-Gd_UnmW-JomnWn6xGNhDhIeHIG3VHfHRFmnmPdZEPL8Qi5Gf4=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-16 05:12, Ethin Probst wrote:
> On Sunday, May 12th, 2024 at 09:13, Alan Stern <stern@rowland.harvard.edu> wrote:
> 
>> ...
> 
>> Most likely, Windows sends some firmware to the device (which it needs
>> in order to run properly) and then restarts the device.
> 
> I don't believe this is happening after trying to dig into the
> captures a bit more. The firmware blobs that are in the archive are
> over 100000 bytes, and though there are some significantly large
> transfers, there isn't a single transfer that is the size of the
> firmware blob. I can't tell for certain though; VirtualBox truncated
> those large frames, so I'm uncertain what data is in them.

The .inf files in your drivers directory clearly tells the difference 
between the two USB Id's.
The description of 2b5a:000c is "UAD2 Arrow Firmware Loader" while the 
description for 2b5a:000d is "Universal Audio Apollo Solo USB" so there 
is no doubt what the initial pid 000c is intended for.

There is nothing in your packet captures indicating a firmware transfer 
but that does not necessarily have to happen, there might just be a 
check of what firmware version is currently loaded in your audio 
hardware and if their isn't a more recent one in the firmware directory 
then everything is ok.

What puzzles me is your ua-init-windows.pcap, it starts with the device 
already having the pid 000d (packet #2). You said that the capture 
starts when the device is plugged in but I think you have missed 
something, it should have started as pid 000c and later transitioned to 
pid 000d.

I can also not find such a transition in your other two captures, all
descriptor readouts that includes USB Id are 2b5a:000c.


rgds
Lars




