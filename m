Return-Path: <linux-usb+bounces-19173-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D57A08048
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 19:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A0EA16828E
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 18:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0532E1A239D;
	Thu,  9 Jan 2025 18:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvmiSWVr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D354C1ACEC5
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 18:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736449054; cv=none; b=nQ76EysaMfpjiJNvYvHqOy1MNQiiaUP8Qc4NWJkWZpl64n4xZf/smE8xZm8HIt/Bl+JWX1us0e2QvDnLe2+ZrNJDx5Aix1RK/CepLS3wzDQBJsB0w+v7EL+guldWqnqpO67RzhZUfZnTtBMfi9VyLqL7v0DjyZ0KQahZGj1ZHGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736449054; c=relaxed/simple;
	bh=fLWmdb/RQ4270kbLp72LPVXQP9kN/KAXSYM9J3zkmmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p7CcxysZV7lCr5BFrgYexeHnI7s4QSTDR/Y7BfDfDunMdSiCpPh8c5kps9oCAZ5U06Fos1c+y198F4FzmvzkezmwbX2HZcz936LJGLrHSAM1sZ45xCfBVeMDEYXmn9YdjhZHV9NWgxwXTVReoaYzcBdA9bQ/u2yjQ/WJckJ9808=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvmiSWVr; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so4515494a12.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2025 10:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736449051; x=1737053851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zq9xzMahA9Tt/pvfM4DjzIUQ4fSYZ/WBnSDkMiXoeT0=;
        b=hvmiSWVrn9s+Xpekx8xzBhAhEUqYs3F8vzNFnAGuxezAfHFAaBhBYZxmQWiFzLGlLb
         fLxUOIv6F7qavm/IX+PjI+sQKbUDMeUvi9lInainYFuyq6iPlz+eM4EFRZ/1wkUENMBG
         fOXOu420zqiyfXaH4ifzrTskhFrm3h18blxh9Kepwv8/HPPbSAku4SUWCaeDEtUV4o2i
         5DXua6hYQN+WlWBF0siBsRyPzIgTO9ChAzrPxVTPx9Gcp6FR61w5BByBrH9UTBNUxz8H
         p7MwRj3UBxjOtojhIw+7ZWOMMtloT2iS4QcziCKmJ0msCDppcqKlwpvMHShI9XAvGNjO
         XPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736449051; x=1737053851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zq9xzMahA9Tt/pvfM4DjzIUQ4fSYZ/WBnSDkMiXoeT0=;
        b=TWTBrzyT1ejdf6Xv3RpNDPeIcA1VTUBMGDS4m3UjQpBPGO96/PS+IDrd9+lQONk4DB
         oivtA/eDTX6Zu/ZyCAgVeaZhYHUhOLIM1vDfDD+8MMHLG+7bsYjeEi9cpY2OkaMCRoGU
         YMa29qVsLfhfFyM3c5Vy8aslDI78ogBFSI7cK6zm/xpJC7nRb5kDulCBTwxg9S18a3yn
         8BTD9zFM9o7UTN1kiumCs+nG7f2AQkJme74YVHY8XK/jhXmU9foAtnZIqTwaq45qqMK9
         K1ePtGRrwYt8gjCZxsV9uaLvgjf0lgfj8KguSHNBER9nv3jl6WiZxSQOiTPOPNxYN0Nx
         HN/Q==
X-Gm-Message-State: AOJu0YyJwGalj1HrMad0QWNVsQtVAWxdULk99u55EpG8y0gZgP8oR15V
	su5XPIQHZ7H5ptjVorKKn5euI4DrdHd+F3CpZuVL504CE8yOi9Vs
X-Gm-Gg: ASbGncuIYqo+JP14La1VkOrQEvQC4AZkRuFrObRLytT4wyJWU6kiwFvQgR+uxXRUN6n
	S7ZPUi4eGQJn3unddN1+S2zAeVbDmXat3iu8yzoOCZTok6fAZ5TxMaejHdnykVSqRdjiozsHeG6
	2r7flu49HnROfnMfyW630bHuSmOXbWhr89jT8ov5gbVM9kcNJu9xX891lv5095TzQ3siIzMpxgk
	/qonebfanhdNFAJ0AFKxqmb4avTowge3TYBiu+901kLzQPr+QYnF9vUvCaCljTf
X-Google-Smtp-Source: AGHT+IFUbbCi9ecU6yuu/GoeFcJdT37SkOZJV9wbJSLt+21t3CjfBLpT+EgVE+eY2xGv2zfRk1ok9A==
X-Received: by 2002:a17:907:1c23:b0:aa6:9d09:b17b with SMTP id a640c23a62f3a-ab2c3daffc0mr348301166b.28.1736449050839;
        Thu, 09 Jan 2025 10:57:30 -0800 (PST)
Received: from [192.168.0.50] ([79.119.240.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c4326sm836738a12.23.2025.01.09.10.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 10:57:30 -0800 (PST)
Message-ID: <c1a60120-ed18-4793-a7ba-a119e048ab2b@gmail.com>
Date: Thu, 9 Jan 2025 20:57:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MT7601U with on-board storage reports incorrect capacity
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
References: <060301fe-17e2-4061-bb01-f5660b5d10a3@gmail.com>
 <2be45061-034f-4cbb-8ed1-f028bbb35936@rowland.harvard.edu>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <2be45061-034f-4cbb-8ed1-f028bbb35936@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/01/2025 17:34, Alan Stern wrote:
> On Thu, Jan 09, 2025 at 04:02:58PM +0200, Bitterblue Smith wrote:
>> Hi,
>>
>> I have this wifi device with on-board storage for the Windows driver:
>>
>> New USB device found, idVendor=148f, idProduct=2878, bcdDevice= 0.01
>>
>> After switching to wifi mode, we can see it's a MT7601U:
>>
>> New USB device found, idVendor=148f, idProduct=7601, bcdDevice= 0.00
>>
>> The problem with this one is that it can't be mounted, nothing happens
>> for a long time. I'm testing with kernel 6.12.8-arch1-1 but it's been
>> like this for at least two years. 
>>
>> The problem seems to be that reading from the "end" of the device
>> takes 17 seconds. I assume the reason for that is the fake capacity:
>>
>> SCSI Payload (Read Capacity(10) Response Data)
>>     [LUN: 0x0000]
>>     [Command Set:CD-ROM (0x05) ]
>>     [MMC Opcode: Read Capacity(10) (0x25)]
>>     [Request in: 212]
>>     [Response in: 217]
>>     LBA: 65280 
>>     Block size in bytes: 2048
>>     Read capacity: 133693440 bytes (127.50 MiB)
>>
>> The real capacity is probably just 8 MiB. The driver files stored in
>> it are ~7 MiB total.
>>
>> This takes 17 seconds and returns 4096 bytes filled with 0xff:
>>
>> SCSI CDB Read(10)
>>     [LUN: 0x0000]
>>     [Command Set:CD-ROM (0x05) ]
>>     [Response in: 565]
>>     Opcode: Read(10) (0x28)
>>     Flags: 0x00
>>     Logical Block Address (LBA): 0x0000fefc (65276)
>>     ...0 0000 = Group: 0x00
>>     Transfer Length: 2
>>     Control: 0x00
>>
>> Windows never tries to read that far. (The device works in Windows.)
>>
>> How can this be fixed?
> 
> Upgrade the WiFi device's firmware.  If you can convince the vendor to 
> fix the bug, which seems unlikely because it works okay with Windows.
> 
> Part of the partition probing (which tries to read the device's last 
> sector) is done by various userspace programs.  But I think some of it 
> is also done by the kernel, and as far as I know the only way to prevent 
> it is to build a kernel without support for the partition schemes which 
> store some of their data near the end of the device.
> 
> Probably your best approach is to tell usb-storage to ignore the device 
> completely.  You can do this with a suitable module parameter for the 
> usb-storage driver.  For example, add:
> 
> 	usb-storage.quirks=148f:7601:i
> 
> on the kernel's boot command line (or put a similar entry in an 
> /etc/modprobe.d/*.conf file if usb-storage is a loadable kernel module 
> on your system).  Of course, then you wouldn't be able to mount the 
> device or access the Windows driver files on it, but I imagine you don't 
> care about them very much while you're running Linux.
> 
>> usb_modeswitch can switch it to wifi mode, so it's not a huge problem.
>> I'm just curious.
> 
> If you really wanted, you could create a custom kernel which which 
> adjust the storage capacity of this particular device down to 8 MB.  But 
> you would never be able to convince anyone to include such a workaround 
> in the main kernel.
> 
> Alan Stern

Haha, so it's hopeless. Thank you for the detailed explanation.

