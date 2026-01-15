Return-Path: <linux-usb+bounces-32409-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B40C6D290E0
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 23:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F463303199B
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 22:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88BF32B9A5;
	Thu, 15 Jan 2026 22:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjW3OPZ5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770C42E090B
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 22:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768516728; cv=none; b=CHi+J4W2d1BpYNJaRvR2res4xxzThIMr1KRF8sANwEliGKYZdUvyKSfG1qK+yXRk8vpROnGRjwzMQBM/hz1WW+SDoCe7c30q9PLxmcrTiaIReco5+AkMyQJAeaSFymorhRaa88cGtDoahpQoiJEVsd3qziaGcNXgmtbnMHiUY2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768516728; c=relaxed/simple;
	bh=6vFAv82dueE4xxWsGtPAdMk3iELBEsWZzBgm6sOTOQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxLgGgRpsu29WGKy7f6ks1elPTAULxaBHF9w5GJe7wgmPyxOgsjeaHGDB01uw1iX7uLRTu53ZEL6bitUrSVd36Ag5A03cEnU86fJ6f1Dqkz7F7fuTyZ4Cys8s67JKj1P9Jgcidd8BU9j9Q5JEwEEVUleigc6BhlJb2eCJHqEDTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjW3OPZ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C64C116D0;
	Thu, 15 Jan 2026 22:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768516728;
	bh=6vFAv82dueE4xxWsGtPAdMk3iELBEsWZzBgm6sOTOQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JjW3OPZ57/zW//8OFVmr6EG9NiVDiouV+ND6ifKiVeaa5lKu/9+IDeLPTZr6IaEKM
	 9QBFS5sjVPTM60vty85Z2/5Md/EV5kSHCNTpXYylXZ6gVYN8fWkIWqw46mP/r0Bjf7
	 vIygAzwF6OzDxok12gWAryrCof5nTSIiLJa0+2aGNsZ/yavROP0h242eDn+VAh9We5
	 Im48DFEXgJyOVKjos1he0s3exyk2+Koj/Dk0N1LV+4RNNixtDNI7dBrVAamUsyqNBK
	 P9wYumppXItdUjd0kSqbDtfWOXYPe3ofgLMw8r7EUqHQi6VOO/7/7F3PSu8qpLSo3W
	 wh2F5s2/EVxRw==
Message-ID: <63f2d81c-79ce-4568-99fa-c47da98afd78@kernel.org>
Date: Thu, 15 Jan 2026 15:38:47 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB/IP bug report - dmesg filled with to usb_unlink_urb() when
 using two instances of same device
To: =?UTF-8?Q?Ignacio_Hern=C3=A1ndez-Ros?= <ignacio@hernandez-ros.com>,
 Shuah <shuah@kernel.org>
Cc: valentina.manea.m@gmail.com, linux-usb@vger.kernel.org, i@zenithal.me
References: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
 <c4559ccc-d4d4-4971-bc28-b02d80e57594@linuxfoundation.org>
 <0101019b97e8a815-bb84ea95-adbb-493e-b94a-dfe4afb55f60-000000@us-west-2.amazonses.com>
 <1b1ed320-eb7b-4b93-a1f1-84ae651abd17@kernel.org>
 <0101019ba7838344-f64c50aa-ea38-498a-9196-1467688fe7d7-000000@us-west-2.amazonses.com>
 <d9d2c4e6-43ae-48d7-88ee-4288e6f16907@kernel.org>
 <0101019bc32d3017-88891fcf-4b22-45d8-b8e4-c18a30dbbe15-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Shuah <shuah@kernel.org>
In-Reply-To: <0101019bc32d3017-88891fcf-4b22-45d8-b8e4-c18a30dbbe15-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/15/26 12:41, Ignacio Hernández-Ros wrote:
> Hi, find below the answers to your questions:
> 
>> You are able to attach the devices from "nut" - the problem starts
>> after attaching?
> 
> The problem starts after attaching the second device. Not after attaching the first device.
> 
>> What does "nut" run - what are kernel versions on usbip host and clients?
>>
> 
> “nut” runs a service that monitors the UPS devices. But the issue shall not be related with how “nut” uses the device as no issues are present when it is only working with one of the two UPS devices attached.
> 
> root@nut:~# uname -a
> Linux nut 6.12.57+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.12.57-1 (2025-11-05) x86_64 GNU/Linux
> 
> root@oraculo:~# uname -a
> Linux oraculo 6.12.47+rpt-rpi-v8 #1 SMP PREEMPT Debian 1:6.12.47-1+rpt1 (2025-09-16) aarch64 GNU/Linux
> 
> root@z2mqtt:~# uname -a
> Linux z2mqtt 6.12.57+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.12.57-1 (2025-11-05) x86_64 GNU/Linux
> 
> note, z2mqtt is using the Zigbee dongle. but that device is not raising issues.
> 
>> Can you detach these devices cleanly?
> 
> 
> Yes, while on “nut” I can do:
> 
> root@nut:~# usbip port
> Imported USB devices
> ====================
> Port 00: <Port in Use> at Full Speed(12Mbps)
>         MGE UPS Systems : UPS (0463:ffff)
>         9-1 -> usbip://oraculo:3240/1-1.4
>             -> remote bus/dev 001/005
> Port 01: <Port in Use> at Full Speed(12Mbps)
>         MGE UPS Systems : UPS (0463:ffff)
>         9-2 -> usbip://oraculo:3240/1-1.2
>             -> remote bus/dev 001/003
> root@nut:~# usbip detach -p 00
> usbip: info: Port 0 is now detached!
> 
> root@nut:~# usbip list -r oraculo
> Exportable USB devices
> ======================
>   - oraculo
>        1-1.4: MGE UPS Systems : UPS (0463:ffff)
>             : /sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1/1-1/1-1.4
>             : (Defined at Interface level) (00/00/00)
>             :  0 - Human Interface Device / No Subclass / None (03/00/00)
> 
> root@nut:~# usbip attach -r oraculo -b 1-1.4
> root@nut:~# usbip port
> Imported USB devices
> ====================
> Port 00: <Port in Use> at Full Speed(12Mbps)
>         MGE UPS Systems : UPS (0463:ffff)
>         9-1 -> usbip://oraculo:3240/1-1.4
>             -> remote bus/dev 001/005
> Port 01: <Port in Use> at Full Speed(12Mbps)
>         MGE UPS Systems : UPS (0463:ffff)
>         9-2 -> usbip://oraculo:3240/1-1.2
>             -> remote bus/dev 001/003
> root@nut:~#
> 
> All clean and without issues.
> 
> The only one issue is dmesg continuous messages:
> 
> [45519.289798] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
> [45521.204620] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
> [45521.291393] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
> [45523.205811] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
> [45523.292681] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
> [45525.207094] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
> [45525.293907] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
> [45527.208240] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
> [45527.295310] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
> 

Okay the only problem is these messages - these messages are
informational and there aren't reporting errors. These should
have been debug only - I will submit a fix to change the level
of these messages similar to how stub_rx and vhci_tx/rx handle
this condition.

thanks,
-- Shuah


