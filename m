Return-Path: <linux-usb+bounces-14384-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D9966379
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 15:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 391A8282E46
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 13:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAD91AF4DA;
	Fri, 30 Aug 2024 13:55:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from pasta.tip.net.au (pasta.tip.net.au [203.10.76.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE13165F05
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.10.76.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026145; cv=none; b=ixbiOv8SKzZ3TjUau3xaJ1TCDh/J8AAfXlEsIe7LKCM7/nKbAg3XyKoSawtGGVXQndhMh9gzfSmKjfK02utCObXF3ID5z7kTdk7LYbR3K52YhsJHD+/NRtT+DfajbGxTivANAajpbOOvDcLNGkF+cishxPqVwMF+F9Gvohly0uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026145; c=relaxed/simple;
	bh=yfG2dOFUUIH7HBgNA4zYeEh0GnhJGJ9soh6jsjdmpAQ=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:
	 In-Reply-To:Content-Type; b=d/45/NOcRh5eC83ExWPqijofzOK740nuog+v+hCxtZvM2NKrmbG5Vwu2/2ISwh6OIKIr8b7zPJjP8zsREhv2mO98LzT1M5tn9mOLPLYEXrpOMPMHEjxWW9rPqFLQDG7evKv60cmdD21mjB8kliSc6LbeIYXFM8SUI/GoEZebJSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au; spf=pass smtp.mailfrom=eyal.emu.id.au; arc=none smtp.client-ip=203.10.76.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eyal.emu.id.au
Received: from [192.168.2.7] (unknown [101.115.81.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailhost.tip.net.au (Postfix) with ESMTPSA id 4WwKRc6nndz9RCP
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 23:55:40 +1000 (AEST)
Message-ID: <dd7050f0-0c33-41cb-bbee-acae266ef810@eyal.emu.id.au>
Date: Fri, 30 Aug 2024 23:55:38 +1000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eyal@eyal.emu.id.au
Subject: Re: Understanding 'lsusb -t'
References: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>
 <2024083057-charger-lustrous-d434@gregkh>
Content-Language: en-US
From: Eyal Lebedinsky <eyal@eyal.emu.id.au>
To: linux-usb@vger.kernel.org
In-Reply-To: <2024083057-charger-lustrous-d434@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/8/24 10:32 pm, Greg KH wrote:
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
> That's odd, as the same device shouldn't be on multiple busses.  Busses
> are a "root port" on the system (i.e. a new PCI controller device), so
> are you sure you just don't have multiple devices with the same
> device/vendor id?
> 
> What is the diff between running the command before and after removing a
> single device?

I now attached a different 4-port usb3 hub (another brand: idVendor=2109, idProduct=0817)
and I see two devices detected (4 ports each) again, these are the new devices listed:

/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/16p, 480M
...
     |__ Port 006: Dev 023, If 0, Class=Hub, Driver=hub/4p, 480M
         ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
...
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
...
     |__ Port 006: Dev 010, If 0, Class=Hub, Driver=hub/4p, 5000M
         ID 0bda:0411 Realtek Semiconductor Corp. Hub

> thanks,
> 
> greg k-h

-- 
Eyal at Home (eyal@eyal.emu.id.au)


