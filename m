Return-Path: <linux-usb+bounces-21271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 348F7A4C0FF
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 13:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B45D83A1E3F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 12:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB93420CCD9;
	Mon,  3 Mar 2025 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="AQqxjEP8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA11F19A
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741006314; cv=none; b=Tb3921yJW+u/Ta1zygIFH+uX0xUXlkTVE7TcjYbH0+xnmI9ECrUmuQx1E/y3Cq7G7tECLOJ+d4KIRNi1U+JA3uVIWciIS0OaiRFEjQKYFqP9twcqyI9LFGZl3fX8YVJACXO+sk3UA1QN4B8up62OKINEXA8iYCCw0zytu6fC3hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741006314; c=relaxed/simple;
	bh=BFD2M/szFlNvjEW75LhAtqzivuok/9xM9idwONnGPww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Exep5U3RfBgeHkinjJy/sDbHLv9o5TkaqOdxposo4UFI6wvy/1Z1cc62bCoK23Jqhh3t/LTELxUSjiLwmnVh2jdHosda/xGhOvgbQuALUJyOpDa2ke4fl/d86G6aojv3ExNPGZyjPcF4gBvFGMFOz5NKeMBOQk8EWmrZScALVVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=AQqxjEP8; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.189] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z5zGb2H1rzyvq;
	Mon,  3 Mar 2025 07:51:51 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741006311; bh=BFD2M/szFlNvjEW75LhAtqzivuok/9xM9idwONnGPww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AQqxjEP8FIl9ivjWMnwXM0F6t5n5072gmhDWd6+z1J5K61rKbd2PKb8sxSjO0bQrU
	 Bz9ggtChj1+AkNLoWEsiymq8yT2XqZnKB2035Hh2RyLeFE28RzCArghETipU7eSmYN
	 xoaLAaAdRA6GjydwRNU90dIzo/KpDVPPGqSSKbeA=
Message-ID: <25859cf7-9b5c-47e0-885f-3b7523a642f4@panix.com>
Date: Mon, 3 Mar 2025 04:51:50 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Me <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
 <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
 <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <e557db09-2fe8-4a85-8d0a-4493aaa4f198@panix.com>
 <20250303115557.GU3713119@black.fi.intel.com>
 <6193f04f-d878-49db-9038-005d4f7bb04d@panix.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <6193f04f-d878-49db-9038-005d4f7bb04d@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


... and FWIW I've been tempting fate while writing these emails this 
morning too, as I've found nothing breaks a thing faster than declaring 
it fixed.

With both reverts on Linus master (14-rc5) I've since moved from the 
CalDigit setup (with attached NVMe) to resuming from hibernate into 
nothing connected to the laptop at all, to finally suspending then 
moving to the downstairs setup, which is a standard LED monitor 
connected via a DP cable to a Belkin TB dock; been 3 for 3 with no failures.

LMK if there's anything I can do to help diagnose d6d4... ; having seen 
the commit message it looks like quite a useful commit (and maybe 
solvable with a race-condition fix?).

-K

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


