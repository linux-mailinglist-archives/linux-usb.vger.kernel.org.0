Return-Path: <linux-usb+bounces-32398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1D8D26295
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 18:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F1F333037F40
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 17:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6381A3BFE43;
	Thu, 15 Jan 2026 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VL5Zmf2n"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FA2D238A
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 17:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496798; cv=none; b=poRb2HD1Ec50XieKRR6BB+RXIhlpA3x/mPoKrmlOe2v4mhcF3NTsg1HyHrsnTwZUpiEs0rq7w2GgLGu2ppN6DSCO5+jbdhhLNJLlymfu2QG5m+A4631f9SAFZjwWfEmnMIRH8Q0eJOSeANLwdGmGt2ZOEsfCZzXRW/aGBHT3CuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496798; c=relaxed/simple;
	bh=sE6K1FmOQ83aRjwTTZfXhNdOhFiemXLK4zMP1hMUTlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTHmQf0kzkO9nfllwQiDdGO14mkr17Fx/dQ1QmXQpUUkHI8g/UWDnB7QFonaECyyOANs7DLb29IIVRv5iJwjlA90LiSZGkACwruHq1H4uzgOnWITWav0WWF6yaH2UxO8X0OwrdqQiJ7WvVK3/d9yEpE+ROKelcuREKewNbqhCjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VL5Zmf2n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C1EC116D0;
	Thu, 15 Jan 2026 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768496798;
	bh=sE6K1FmOQ83aRjwTTZfXhNdOhFiemXLK4zMP1hMUTlU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VL5Zmf2nQ+1C12iOR5eQ4f0dMumsfzVK93CHSc9z1X+THXPcSOrkdDETYcraacPAU
	 P30pgiQYeeYCnbHV0O1TFquk3vLkXyQ8nS2MYhiUf3MqPR4MEKyfF+QpvXIswmQFO2
	 Qt5s7/KLUIyLaS8uUUAM67s/l0I4qTUGNClKa8mY4ivw9dMeweN5hn7bx4KstFDTYX
	 2bQGF7w4qyeRWJ4Fj/t0OwQiYkgw2ercMhqGnd2LfEm3DAzt/q4y8ksa+WOEOWLINO
	 WgQLseHwQRhhq5Za6CPO2us/kH1NBQhjG2LR8TQYW5oii+/YX+bAdjgKZDYtihD/eN
	 Wl3jZLKRUUEvQ==
Message-ID: <d9d2c4e6-43ae-48d7-88ee-4288e6f16907@kernel.org>
Date: Thu, 15 Jan 2026 10:06:37 -0700
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
Content-Language: en-US
From: Shuah <shuah@kernel.org>
In-Reply-To: <0101019ba7838344-f64c50aa-ea38-498a-9196-1467688fe7d7-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/10/26 03:46, Ignacio Hernández-Ros wrote:
> Hi,
> 
>> What is "nut" software in netserver?
> 
> The primary goal of the Network UPS Tools (NUT) project is to provide support for Power Devices, such as Uninterruptible Power Supplies, Power Distribution Units, Automatic Transfer Switches, Power Supply Units and Solar Controllers. NUT provides a common protocol and set of tools to monitor and manage such devices, and to consistently name equivalent features and data points, across a vast range of vendor-specific protocols and connection media types.
> 
> https://networkupstools.org/
> 
>> - What does "lsusb -t" show after binding 3 devices on the host - oraculo?
> 
> root@oraculo:~# lsusb -t
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 480M
>      |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
>          |__ Port 002: Dev 003, If 0, Class=Human Interface Device, Driver=[none], 12M
>          |__ Port 003: Dev 004, If 0, Class=Communications, Driver=[none], 12M
>          |__ Port 003: Dev 004, If 1, Class=CDC Data, Driver=[none], 12M
>          |__ Port 004: Dev 005, If 0, Class=Human Interface Device, Driver=[none], 12M
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 5000M
> 
>> - What does "usbip list -r oraculo" command show on "nut”?
> 
> 
> When no devices have been attached:
> 
> root@nut:~# cat usbip_list
> Exportable USB devices
> ======================
>   - oraculo
>        1-1.4: MGE UPS Systems : UPS (0463:ffff)
>             : /sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1/1-1/1-1.4
>             : (Defined at Interface level) (00/00/00)
> 
>        1-1.2: MGE UPS Systems : UPS (0463:ffff)
>             : /sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1/1-1/1-1.2
>             : (Defined at Interface level) (00/00/00)
> 
> After devices attached:
> 
> root@nut:~# usbip list -r oraculo
> usbip: info: no exportable devices found on oraculo
> 
> And “nut” software see the devices and operates without visible issues.
> 
>> - How are you attaching devices from “nut"
> 
> usbip attach -r oraculo -b 1-1.2
> usbip attach -r oraculo -b 1-1.4
> 
>> - Can you send "usbip port" ouput fro, the client after attching each device
> 
> 
> root@nut:~# usbip port
> Imported USB devices
> ====================
> Port 00: <Port in Use> at Full Speed(12Mbps)
>         MGE UPS Systems : UPS (0463:ffff)
>         9-1 -> usbip://oraculo.chiton:3240/1-1.2
>             -> remote bus/dev 001/003
> Port 01: <Port in Use> at Full Speed(12Mbps)
>         MGE UPS Systems : UPS (0463:ffff)
>         9-2 -> usbip://oraculo.chiton:3240/1-1.4
>             -> remote bus/dev 001/005
> 

You are able to attach the devices from "nut" - the problem starts
after attaching?

What does "nut" run - what are kernel versions on usbip host and clients?

Can you detach these devices cleanly?

thanks,
-- Shuah

