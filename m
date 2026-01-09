Return-Path: <linux-usb+bounces-32122-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 086A0D0C884
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 00:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93FA43017679
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 23:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1401B33A01B;
	Fri,  9 Jan 2026 23:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rh7HF8VF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A4E11CA0
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 23:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768001090; cv=none; b=r3or2U2pwKWtx128o1NwG0Me7uKMP5dN03hwRA6H++UD+6RVuVL1tga8MeK+G1etDN6KQDW28uvFniqEWHlZHGEvMJq/vOHu7Ovz7/9U1T0/0Xvw75Z2qFYOKUhXsc4UJNNt9x+kuboxEYulzHSVGXZV2bzOOGRWAl2fP1Jt59k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768001090; c=relaxed/simple;
	bh=QOi526edSfTFBmarWGUGGQC0R25Avke59+ogWiHQba0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHB1mv2i0KQ4Oj8ySzcGU5GiM9nmBoogRF58cX2+DyV09/N/tNY13T7YIg/KOQqXAl/IWvcyhyIBVh9j09qaBTVkJe5zedLLvzysGJxRwuWAQ5R93pdHcBW4+DEG+Z7HMK/Sq5rxaF2bxmD6JAqBDCY9GpuZKzwsl8FmUJvrERQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rh7HF8VF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF28C4CEF1;
	Fri,  9 Jan 2026 23:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768001090;
	bh=QOi526edSfTFBmarWGUGGQC0R25Avke59+ogWiHQba0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rh7HF8VFtOdR6u2L9bH1hJVh6wli4RxH4CiSKD+6f7rIcvl9s+b3LuDE73wF7s2J9
	 u8OyJroVBJCiyNMSdjEZeyVCLckZoB99SvPAa4kKsGeUadMTRWZV4m4gxVBo7NJLnW
	 cSkRYKGxsiSmrFTK8vrj3eX+c8IEKuCAJ//pWvrp5tRxr5R9SCnyo8K/IfI3maOsZe
	 n09f1erOQppHmIHgwtS1epZHmFZr6FhpRjKYLDzRyhWWrHN8AI72MXLI7FxXzXE5sk
	 Mvz8x0b4n+kmzW0xRR1j0zq97H2Wp0s5aRZ/MPi+tX5ODaWSdCZTA+BX+by0XR4smX
	 yxSmCvfcWXIVA==
Message-ID: <1b1ed320-eb7b-4b93-a1f1-84ae651abd17@kernel.org>
Date: Fri, 9 Jan 2026 16:24:37 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB/IP bug report - dmesg filled with to usb_unlink_urb() when
 using two instances of same device
To: =?UTF-8?Q?Ignacio_Hern=C3=A1ndez-Ros?= <ignacio@hernandez-ros.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, linux-usb@vger.kernel.org,
 i@zenithal.me
References: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
 <c4559ccc-d4d4-4971-bc28-b02d80e57594@linuxfoundation.org>
 <0101019b97e8a815-bb84ea95-adbb-493e-b94a-dfe4afb55f60-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Shuah <shuah@kernel.org>
In-Reply-To: <0101019b97e8a815-bb84ea95-adbb-493e-b94a-dfe4afb55f60-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/7/26 03:02, Ignacio Hernández-Ros wrote:
> Dear Shuah,
> 
> Thank you for your quick response, find enclosed responses to your questions:
> 
>> Can you elaborate on this "sharing the two devices" part.
> 
> I’m sorry, “Sharing" might not be the right term. English is not my maiden language so let me apologise.
> 
> In my infrastructure, I’ve one Raspberry PI acting as “usb host" "server” “exporting USB devices” the host name is “oraculo". At this time it is exporting 3 devices.
> 
> 1. Zigbee dongle (domotics at home) connected to port 1-1.3
> 2. UPS 1 (MGE UPS Systems UPS) connected to port 1-1.2
> 2. UPS 2 (MGE UPS Systems UPS) connected to port 1-1.4
> 
> In the same local network, there are 5 servers of which 4 are running Proxmox and hosting several virtual machines.
> 
> One (and only one) of the virtual machines is running “nut” software in “netserver” mode so, that VM (called “nut”) is acting as the “virtual host controller” “client” “importing the two UPS systems”.

What is "nut" software in netserver?

> 
> Full dmesg.log file obtained from the “usb host” “server” is attached to the end of this email. It is 43kb of text, I’m not sure it it will be filtered, in that case I can publish on one of my web servers for you.

The dmesg wasn't useful. Is it possible to send me the following
information:

usbip_host:

- What does "lsusb -t" show after binding 3 devices on the host - oraculo?

usbip_client:

- What does "usbip list -r oraculo" command show on "nut"?
- How are you attaching devices from "nut"
- Can you send "usbip port" ouput fro, the client after attching
   each device

I am still not clear on your configuration to be be able to debug
the problem.

thanks,
-- Shuah

