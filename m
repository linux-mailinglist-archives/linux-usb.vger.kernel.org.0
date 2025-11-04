Return-Path: <linux-usb+bounces-30064-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9079C3302E
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 22:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F4514E2C0B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 21:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AB42E8DFD;
	Tue,  4 Nov 2025 21:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="RcCJiEY1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27B723A9AE
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 21:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762291166; cv=none; b=DZEB6jryPar69riX+ENlczv2iFn/n437sP+GXgs4s/OVN1pTFvOCJ0k3osGp0GumlMfxsuNVwrDPO1B6x1QKRcnJdIInIeEqibNHThUo8myslIlmq4W/nd0YfRSihe8A/uwA+OMCsuddeaxWM8wWh7ZPvF9lj1ajOVP+aLh5Rgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762291166; c=relaxed/simple;
	bh=Zm71FBnkC3wz/Qo+97bBaeH9qUJcJYvt0o+tiP6HgTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvpeOSi3IciUbRtrb9vyBrIVAGdJT7W0HcHwfKuysjepYJo1ZTPFziz+vJarwGsT34TheOHvA58x/E4IBZy7LincMBkSabT1Erag5ebRjPKb2KAyuQfrHZcr0H8lDwDp1k/xVCOp8Ht5JbqnnzH+9byyZbdaJIXe1NU5Z5LIDN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=RcCJiEY1; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [10.50.4.39] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4d1Ltf5m2Tz4bg8;
	Tue,  4 Nov 2025 16:19:22 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1762291163; bh=Zm71FBnkC3wz/Qo+97bBaeH9qUJcJYvt0o+tiP6HgTI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RcCJiEY1HiElyJMS3UyiOP6VTJyjFxXNA0nAbH96IVmRRd8/290wWWWmR4MjJlBs7
	 bWhi8fZWBovL+2KU6RCsCnPvJ0IZdS9+ZUtbN6qsD4wo7jAh3b4JyDb4cCFoSS2ZWY
	 kFHhJlcELqTKl29FUh0O04oi+VZtRKtUy0byrqoE=
Message-ID: <3aa6006d-450c-4253-a617-bd76114e9ede@panix.com>
Date: Tue, 4 Nov 2025 13:19:21 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Reset NHI during S4 restore_noirq() callback
To: Mario Limonciello <superm1@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Kenneth C <kenny@panix.com>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com, westeri@kernel.org,
 YehezkelShB@gmail.com, Sanath.S@amd.com, linux-usb@vger.kernel.org
References: <20251023050354.115015-1-superm1@kernel.org>
 <20251023055603.GU2912318@black.igk.intel.com>
 <02191522-b3f7-459e-ae46-12788f36209a@kernel.org>
 <faaaf1ae-4763-40d6-b734-b2dd0e47b27b@panix.com>
 <1d635632-e51f-4538-9896-3e4fa56a4193@kernel.org>
 <00b5f5a6-27eb-4949-88ab-eb78badedc58@panix.com>
 <848584ae-897a-4b82-8532-059c148db9ed@kernel.org>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <848584ae-897a-4b82-8532-059c148db9ed@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/4/25 12:31, Mario Limonciello wrote:

> Are you doing S4 at all?  Or only s2idle/s3?  The patch was specifically 
> for resume from S4.

Ah, good point and I'll have to look out for that, but I do use "hybrid 
sleep", which (AIUI) starts a hibernation cycle but stays (in my case) 
in s0ix suspend until after 4h have passed.

-K

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


