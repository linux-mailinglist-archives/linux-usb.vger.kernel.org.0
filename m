Return-Path: <linux-usb+bounces-30060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5C6C32BCD
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 20:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E1413B5AF0
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 19:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2D333B94A;
	Tue,  4 Nov 2025 19:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="jeDKyjiA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0139E2E8B9B
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762283485; cv=none; b=boNuwyGeAzxkp+jC2apwIr8c7sDn/LjJxjlf3UeU1FKLo2uG/nUNcwqNXe59pwwomALJWMB4X7mNRp3F/rjwfvFVXf/WlJrFN3xRQzPktOOIFsEHD2WytFbEXSY22VMjLj8eGTuKlYWiLZgPKb3sCA3Av8Jbd7NsYo95tnip6WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762283485; c=relaxed/simple;
	bh=8vbOkoXUTzNxhESlv9wdXJC5jj1PZN33YXdGtpJG7g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kndAjceNHzCzvzSg0gmp1YDwUg20YfJ+Mu+0gxW6/6CL6oyZPQRlF+TjSg6CCFteDhId5cjFNyPl8kIOODLaFON0mCUzbUDzKaxDFNue715a8Mc2YghdnpSi64BtBcYDYdHzgvDvOCxwEfcp8pDKAtbwZzjZEhOMCDKYqaxr4Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=jeDKyjiA; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [10.50.4.39] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4d1J2q25vTz4RDt;
	Tue,  4 Nov 2025 14:11:15 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1762283476; bh=8vbOkoXUTzNxhESlv9wdXJC5jj1PZN33YXdGtpJG7g8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jeDKyjiAWh63R+XCiyiIPfC5F1qXqASV6jTPlFgMcghWiI4Ud0cv8wlM/H9eojYil
	 OyUIMoAr1W4yugLj6RhCEBEw4flBme1kjVXX8c2cLzu74YhMJNZZyhAflW1i9FrMPW
	 t3SwuatNTge2qcBIeezUGxIiPkpkLGSKUyRsDcLQ=
Message-ID: <faaaf1ae-4763-40d6-b734-b2dd0e47b27b@panix.com>
Date: Tue, 4 Nov 2025 11:11:13 -0800
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
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <02191522-b3f7-459e-ae46-12788f36209a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/23/25 07:13, Mario Limonciello wrote:

> I didn't check this, I'll spin a v2 and get that checked before posting it.

Any luck/update with a V2? (Is V1 close enough to try testing?)

I have a similar problem with my XPS 9320; if I don't wait an 
appropriate amount of time after coming out of suspend before plugging 
in a TB dock that wasn't the one I'd suspended with, my laptop still 
thinks it's plugged into the original TB dock (and things like DP 
monitor resolutions, etc. aren't adapted to the new environment) and I 
would like to help you test this out.

Thanks, Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


