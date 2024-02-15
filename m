Return-Path: <linux-usb+bounces-6453-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8498D856111
	for <lists+linux-usb@lfdr.de>; Thu, 15 Feb 2024 12:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419542927BB
	for <lists+linux-usb@lfdr.de>; Thu, 15 Feb 2024 11:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128FC24B26;
	Thu, 15 Feb 2024 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjVyf8Tw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F7A1756B
	for <linux-usb@vger.kernel.org>; Thu, 15 Feb 2024 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707995455; cv=none; b=vBxSCa7vtV3rQYkxR0d6/q4dQr9gR0EcPh4fs0uZhcxwch3r8bYvytX+Fnm01yRtuGHqNpp441UJFH9RyyhLZjscqfXNK1XfrOtjHlM2OzOFovcFWYe/D6BHCnZZBmbyyR/0EQHJ2c1vgKbJT+aSS13SABWQ82EkV5MFbUNBKQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707995455; c=relaxed/simple;
	bh=8FtNOjalLANYC7eUmvetPD8WdDl0lrseCr0LxvYZ1eQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=JJPaeUJoYhlnom1wQwr9gsJRuteNs55TiscbYNDxnpiiEmkSbarJ85B7lB5DveD40Q1sQgDMj3q1LFdRdLjI/01uXB3I8r43mjQNOcnZGl80tuX0TVx7T/OZ/G9sfTFWIsi8doRritEAzGWGD0iu8s6JjA3SatDPq5suBH2QAbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjVyf8Tw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707995454; x=1739531454;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=8FtNOjalLANYC7eUmvetPD8WdDl0lrseCr0LxvYZ1eQ=;
  b=OjVyf8TwsoRUqCMQUIiz0FYMU+EPK780Tnksj73BcLDjH3sdgmeb0Xdp
   3cIXqTlRpsmw+m5maaVeb1+Vw/C80d35ueS0mN1Nqchks+8bYyIlSFUq2
   oIDYOJxq5nOODj3EGG6I2AIf/S6GLIaYgdG3cCG3EQXQ4fpeu6RU6gQwV
   Gs+2JmDPJeN1PFOsyS1oxsEzPFLIsxPFYHjPviP8xETQP0Un2lcsUCp2R
   Afmd04U0Gk3PDiPViVO1HVPTEAHO6fLQ4Ash2aSlJ445f/dm+pCN4ICxJ
   O8+skiuH1TEyiW7Te03DWNFL1KTRlaCfNDhQd6RkEgGgaxTEj4YG8FRps
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5904777"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5904777"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 03:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="935647553"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="935647553"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2024 03:10:51 -0800
Message-ID: <9c53ec38-812f-f701-d2f6-91e28367bb82@linux.intel.com>
Date: Thu, 15 Feb 2024 13:12:28 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 "Artem S. Tashkinov" <aros@gmx.com>
References: <5406d361-f5b7-4309-b0e6-8c94408f7d75@molgen.mpg.de>
 <7efc3c5b-3237-30c9-1ff2-88747897ed57@linux.intel.com>
 <0cd07b3e-148f-9d0b-7ef4-917b0ed23cbd@linux.intel.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Linux warns `usb: port power management may be unreliable` on
 several systems
In-Reply-To: <0cd07b3e-148f-9d0b-7ef4-917b0ed23cbd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.2.2024 15.00, Mathias Nyman wrote:
> On 14.2.2024 14.58, Mathias Nyman wrote:
>> On 14.2.2024 11.31, Paul Menzel wrote:
>>> Dear Linux folks,
>>>
>>> As a follow-up to *Linux warning `usb: port power management may be unreliable` on Dell XPS 13 9360* [1][2], Linux warns about this on Dell laptops, desktops, and servers, and also on devices from other manufacturers [3].
>>>
>>> Is this a firmware issue or a Linux one? As a user I am unsure what to do, and ignoring warnings sounds wrong to me.
>>
>> At a fist glance it looks like a firmware issue.
>>
>> USB2 and USB3 ports are in this case matched and peered based on the ports
>> ACPI _PLD (Physical Device Location) entries.
>> Usually there is only one USB2 and one USB3 port with exactly the same _PLD values,
>> but here it appears more ports return similar _PLD values.

Looks like these machines have _PLD ACPI objects for all USB ports, including
unusable USB host ports that are not wired to any connector or internal device.

All these unusable ports return similar _PLD objects, with zeroes in their group
token and position fields. This confuses the port peering code pairing USB2 and
USB3 ports that are wired to the same connector.

These unusable ports have a ACPI _UPC object stating they are not connectable.
We could probably tune the port peering code for those. At least skip
the warning messages.

Thanks
Mathias

