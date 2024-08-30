Return-Path: <linux-usb+bounces-14386-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2813D9663B2
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 16:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8E8D284726
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 14:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10EC1AF4F8;
	Fri, 30 Aug 2024 14:07:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from pasta.tip.net.au (pasta.tip.net.au [203.10.76.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5087DA94
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.10.76.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026857; cv=none; b=Q/o2kDAy85hxA3FxSpULX1spNtGT9V5Hnmp69DMPQl7KG5/f1v9ziFVTFccXkxaX71eZb5IexpJ9I7abYTXgZBi2bgvMsED1jIC1pyVw52G5M1fLIWFufE/ExqB+OLO1xO/gL8NTnniOJ34hIIVoPE3qDZ/4Sgdys8tVi3m2QCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026857; c=relaxed/simple;
	bh=uzmVF4YuoTPqmLHP1/LWahVsLikCq7H98YMUVFeG258=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:
	 In-Reply-To:Content-Type; b=s6uITyu8sIP0xTUtXYG3zdz+qXj34C1Uiph9Nvhwasl/mmqetKCxZGXwkf0y9XAjmOuIhrqsM4UTvpyIbJhsAwoTErmnujamMmsNGGMRJtoQvAUkYUCe+i9texlKuvxNtk7z/4xQWApBl/bOL53pJ3tG4cPDJk0bdu375LIkbf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au; spf=pass smtp.mailfrom=eyal.emu.id.au; arc=none smtp.client-ip=203.10.76.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eyal.emu.id.au
Received: from [192.168.2.7] (unknown [101.115.81.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailhost.tip.net.au (Postfix) with ESMTPSA id 4WwKjK0603z9R5C
	for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 00:07:32 +1000 (AEST)
Message-ID: <d46a455c-a17d-4775-81be-57a5224bc41a@eyal.emu.id.au>
Date: Sat, 31 Aug 2024 00:07:32 +1000
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
> 
> thanks,
> 
> greg k-h

BTW, I run a nightly log of system commands which includes lsusb.
The first time the device is listed twice is:

$ uname -a
Linux e7.eyal.emu.id.au 6.9.11-200.fc40.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Jul 25 18:17:34 UTC 2024 x86_64 GNU/Linux

$ lsusb --version
lsusb (usbutils) 017

-- 
Eyal at Home (eyal@eyal.emu.id.au)


