Return-Path: <linux-usb+bounces-14395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EA796647A
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 16:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFBD8B24914
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 14:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D471B2EDF;
	Fri, 30 Aug 2024 14:50:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from pasta.tip.net.au (pasta.tip.net.au [203.10.76.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21AB7A13A
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.10.76.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725029403; cv=none; b=bDZU19MkPbCKiwDeiYM9NjWf1v4GlKcYGYMOlQSTuxeocZSu6TLAVxZ0Ihy7OAgXtzrIKDqa7slTSjPrbxYK2hAy56rqHl6NOohTMXo3uaQmePuL33SUQNK91QEzLY+0h/IA6HGSjU5B4gLICLj5s9tyYV6FCDNXm16NDKnfl0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725029403; c=relaxed/simple;
	bh=8/uveVPiBOgNebiGjtm7cgkW8+O8jlr4NGkObcetiaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g6JRLhqPVCQUtNlJYUOMllxCswjUvbhd9DTdntSH3kNiE0++Ag4y/+bNXxLJhNGQ59PsboNiCLkHG1hEzAco0uBNT/DxvetqUelUkta7sSgtLr8ulNGCfw9s9fjeoaPruxXmr3LsGvau68kPNx5JTDB3j6dpd3YPVIANejCcJRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au; spf=pass smtp.mailfrom=eyal.emu.id.au; arc=none smtp.client-ip=203.10.76.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eyal.emu.id.au
Received: from [192.168.2.7] (unknown [101.115.81.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailhost.tip.net.au (Postfix) with ESMTPSA id 4WwLfC2b4Xz9R83
	for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 00:49:55 +1000 (AEST)
Message-ID: <89e5c05f-b8da-4890-809c-9fb5d9aaa7f0@eyal.emu.id.au>
Date: Sat, 31 Aug 2024 00:49:52 +1000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eyal@eyal.emu.id.au
Subject: Re: Understanding 'lsusb -t'
To: linux-usb@vger.kernel.org
References: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>
 <92687a8a-4dbf-4a16-8b6d-a2f78f7b3ddc@rowland.harvard.edu>
Content-Language: en-US
From: Eyal Lebedinsky <eyal@eyal.emu.id.au>
In-Reply-To: <92687a8a-4dbf-4a16-8b6d-a2f78f7b3ddc@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/8/24 12:25 am, Alan Stern wrote:
> On Fri, Aug 30, 2024 at 10:14:20PM +1000, Eyal Lebedinsky wrote:
>> I assume that the generated list is a tree, so each leaf (Device/If) is on only one point.
>>
>> I note this output:
>>
>> $ lsusb -tv
>> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/16p, 480M
>>      ID 1d6b:0002 Linux Foundation 2.0 root hub
>> [trimmed]
>>      |__ Port 004: Dev 004, If 0, Class=Hub, Driver=hub/4p, 480M
>> [trimmed]
>>      |__ Port 005: Dev 006, If 0, Class=Hub, Driver=hub/4p, 480M
>> [trimmed]
>>      |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
>>          ID 2109:2817 VIA Labs, Inc.
>> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
>> [trimmed]
>>      |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
>>          ID 2109:0817 VIA Labs, Inc.
>>
>> I removed some content that is not relevant to my question.
>>
>> Note the Bus 001.Port 006 and Bus 002.Port 006 entries.
>>
>> I verified that both are for the same (one) device. They do not show when I disconnect it.
>> The device is an external 4-port USB3.0 hub. It is listed once as 480M and once as 5000M.
>> Nothing is plugged into any of the four ports.
>>
>> Is this correct? Why does this device show twice in the list?
> 
> USB 3 actually uses _two_ physical buses.  Each cable has two twisted
> pairs of wires carrying the SuperSpeed (5000 Mb/s or more) USB-3 data in
> and out, and also has two wires carrying the legacy USB-2 data (480 Mb/s
> or less) in and out.
> 
> These physical buses are represented separately in the kernel.  In your
> example, Bus 001 and Bus 002 use the same cable and the same xHCI host
> controller; Bus 001 is the legacy USB-2 bus (you can tell by the speed)
> and Bus 002 is the SuperSpeed bus.
> 
> Most devices use one or the other of those signal paths, depending on
> the speed they connect at.  But hubs have to handle both paths, because
> the devices plugged into them may want to use either one.  Therefore
> your VIA Labs hub connects to both of these buses.  That's why it
> appears twice in the output from lsusb.

So this is expected, good.

BTW, the reason I looked at this is that I started, lst night, to be flooded with these messages:
	kernel: usb usb2-port6: Cannot enable. Maybe the USB cable is bad?
and I thought it was from a USB-C PCIe card I have.

Rebooting the machine and cold shutdown/boot did not help, not even removing the PCIe card.
Now I looked at all the other devices. and just plug/unplug this USB3 hub stopped the errors.

I still do not know why this started at 5am today, when a lsusb runs from cron. Hope it works tonight.

I learn something every day.

Thanks,
	Eyal

> Alan Stern

-- 
Eyal at Home (eyal@eyal.emu.id.au)


