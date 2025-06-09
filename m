Return-Path: <linux-usb+bounces-24601-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A572BAD1E7A
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 15:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70379162741
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 13:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37562571A2;
	Mon,  9 Jun 2025 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QiftTRxd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D31BC148
	for <linux-usb@vger.kernel.org>; Mon,  9 Jun 2025 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474450; cv=none; b=NPFMLGwCzAFt1m65Obf0XRFLbMAgdueeaX09aTwmvCgi0oINTECMcqEdSAcrQMO8TFMoIllE9iaGGkcNiYh8NnYa6Cmm9uMJpzgWzJojtygBxDQ0dPw7YPWM+7ymgsH4svxSewB2ajOtuPZuKDjVrP1hoUi/clBwGuwJ1C1OUgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474450; c=relaxed/simple;
	bh=4KI7I/4G3f9DwzIE0i8vJo0YT+Ol855YEn779oAU6/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qi2UpPIPb3sePPuuaKvC7m3RtwED2EWhJ0LOZJI/sxl2ZTWZL0sFKtl4bEe7qWIxew9U+2jcmPsxz9u+btNmy2CpV22LqeQvrERCioWtCS97jzTVJ3+mSk/0Fvb7K2rIEgmz9Mni53/+hWpcmelCI7Fb64dKb7IF83YvKZ/ZHso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiftTRxd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D629EC4CEEB;
	Mon,  9 Jun 2025 13:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749474450;
	bh=4KI7I/4G3f9DwzIE0i8vJo0YT+Ol855YEn779oAU6/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QiftTRxdFTVorkSvsZJ/bSaGyJv8F8ZH6UscQUTxZYSZpa9L1jDVrF41OCrb1MlUQ
	 f2zUZqd/kQzbcv0oc7OOrwGpQaI1MCLIXR9CNl2s7buWgaj7XVEGRK5gjDtj+7RcLX
	 dFW/br1oTnjyOYPkORb4vJG1uJfWT0MhYuRtS6j3e9mejFc2YB60v7rAUzPsK3wbEJ
	 PagG8Z2pImaoX0qu6tVLrXIVVDw8xL44VJUdzXpmTSK/5S6zuEbyYa9lZpn+R3uS0S
	 eSFIz6f1SfOBCo+iR0ihqgbUqNH74sN+EGdab103V5MxIxuCGAIwuQH2M1KXupnlnC
	 VzY6sYfMdmfdA==
Message-ID: <af65c710-8dcf-47e5-ab97-f23839f6278e@kernel.org>
Date: Mon, 9 Jun 2025 08:07:27 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] usb: xhci: Avoid showing errors during surprise
 removal
To: Mathias Nyman <mathias.nyman@linux.intel.com>, mario.limonciello@amd.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
References: <20250609020223.269407-1-superm1@kernel.org>
 <20250609020223.269407-4-superm1@kernel.org>
 <12a8fd39-e910-4558-8fec-d41d2eecfd15@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <12a8fd39-e910-4558-8fec-d41d2eecfd15@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/2025 7:42 AM, Mathias Nyman wrote:
> On 9.6.2025 4.58, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> When a USB4 dock is unplugged from a system it won't respond to ring
>> events. The PCI core handles the surprise removal event and notifies
>> all PCI drivers. The XHCI PCI driver sets a flag that the device is
>> being removed as well.
>>
>> When that flag is set don't show messages in the cleanup path for
>> marking the controller dead.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> 

Thanks for the acks Mathias!

All 4 patches were sent together because of the relation but they really 
don't have a dependency to need to be committed together.

Would you mind picking up the patches for 3 and 4 to USB tree and I'll 
keep discussing 1 and 2 with linux-pci M/L.

