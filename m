Return-Path: <linux-usb+bounces-18659-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DA9F712A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 01:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 348821893DD7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 00:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1141023A0;
	Thu, 19 Dec 2024 00:03:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A0E17C;
	Thu, 19 Dec 2024 00:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734566586; cv=none; b=jeHzntTQszPe9ocX7KdZkpYk6/zhTaNjl0j13Bj8Y6TYnf824Bz3dLbBk0oXhNVoyVebhRh/Y0YzPvme986Iklj8gpRvhTPfxAyPcISHEfU1Ug0gqyNmWzzbKnRzu6hWl1uS/fGri/sJGjbHRMNbJrM0YBP7SkOyNb21vDXdT6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734566586; c=relaxed/simple;
	bh=azxG0394LGDqXJ89IGT68EdGiURQeMqAQpgSfw+5oRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOkWkGSxgSeTO9nFoVTqC7tsh73VahCxuyAfousJJhbPysA2+fbCB2q2wiwJir0lRQQvMwKYjCl38m0RIcpPQp4+4e2Du2u0tWV6HzCx2T6lV60HgUbrTM6gMZN43PimWKKF1Di7u0ufaX49dU0n5HzzIRR474NQNgoaACXl1hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af376.dynamic.kabel-deutschland.de [95.90.243.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 038CE61E6476B;
	Thu, 19 Dec 2024 01:02:27 +0100 (CET)
Message-ID: <999aa1d0-4e21-412f-bf1d-bcfbb274a122@molgen.mpg.de>
Date: Thu, 19 Dec 2024 01:02:27 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RIP: 0010:xhci_ring_expansion+0xbd/0x380 [xhci_hcd]
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <68e02165-e5a3-4751-bdf1-5b6671d42790@molgen.mpg.de>
 <6f057db9-b27a-45ee-98b5-08e979de0b26@linux.intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <6f057db9-b27a-45ee-98b5-08e979de0b26@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Mathias,


Am 18.12.24 um 10:43 schrieb Mathias Nyman:
> On 17.12.2024 23.57, Paul Menzel wrote:

>> Attaching a 2 TB external disk to the right port of the Dell XPS 13 
>> 9360 and running `sudo mkfs.ext4 -L "Verbatim HD" /dev/sda1` the 
>> command does not complete and the system finally locks up and has to 
>> be hard reset:
>>
>> ```
>> [    0.000000] Linux version 6.13.0-rc3-00017-gf44d154d6e3d (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.2.0-8) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.50.20241210) #42 SMP PREEMPT_DYNAMIC Tue Dec 17 11:17:55 CET 2024
>> […]
>> [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
> 
> There was a regression in 6.13-rc1 xhci ring expansion.

Yes, I found it this morning and replied to my report.

> Fix is now in Greg's usb tree on its way to 6.13.
> 
> Patch:
> https://lore.kernel.org/linux-usb/20241217102122.2316814-3-mathias.nyman@linux.intel.com/
> 
> Gregs usb-linus branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=b9252f80b807801056e67e3a672fb1be0ecb81d
> 
> Does this patch solve your mkfs case as well?

Yes, after applying both patches from the series, the problem is *not* 
reproducible.

Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

