Return-Path: <linux-usb+bounces-21291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D7BA4CC27
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 20:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B2861896506
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 19:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFEB232386;
	Mon,  3 Mar 2025 19:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="NiZqARDX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CD11C9EB1
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 19:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741031062; cv=none; b=ZLDFVSpbzwsfsSlHPN/zBgkY3K+SspcLMDaYCDRIVeTqOhETNCD2m2Bu7gxfG5pfEzuRx6+7tTAC5yG7BnXEEQ5yC3ZsaMq0cQnJkjouZtXS6Ov4LmnMgykZA/TW3LbSKcPMAJRs1kS51KIAwNjEnAsGxDQBF/7WL5qDC8zrl5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741031062; c=relaxed/simple;
	bh=fabnzi9vWgzRqqKwyo8LUzdcKhc0FaXUyBFasiSgBNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkMrZ1pRX8WpC3OLn1sBniDARUyAlTLtH0N5kDVUCFcv+stYvuyZ6O5kUAde8p5Hz6kk8lqzj5nV103jD+S6ncoOJmOq6Uxyfl6522ccohgS1Hxilj4FTsl0PrPK1hS/Y8AJ3IJZKrmw/o8h6aCTfGFngh/2VFh4Jo0CF1Qfc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=NiZqARDX; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.189] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z68QQ42Jdz4Hsp;
	Mon,  3 Mar 2025 14:44:14 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741031054; bh=fabnzi9vWgzRqqKwyo8LUzdcKhc0FaXUyBFasiSgBNI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NiZqARDX2sARpdSeH2COfuYCdYyi8xUrLKizx9MBIAiJaKNZi/si12iq9FYm9stV6
	 EM5Yn6sk4pchua/ATO2oYOmUPCR8AMpmyYbZjdMd1jY1/oT6MoP6pL46RDxMB/X1OG
	 iAJ7bqyXaD+pbI3o9OMILozTdcc5ZZJl1tsTbFN0=
Message-ID: <48ef4c14-55d5-4baa-b862-f9e7368ed950@panix.com>
Date: Mon, 3 Mar 2025 11:44:13 -0800
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
References: <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
 <20250303131359.GV3713119@black.fi.intel.com>
 <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>
 <20250303132327.GW3713119@black.fi.intel.com>
 <20250303134618.GX3713119@black.fi.intel.com>
 <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
 <20250303140156.GY3713119@black.fi.intel.com>
 <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
 <20250303142058.GA3713119@black.fi.intel.com>
 <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>
 <20250303175818.GB3713119@black.fi.intel.com>
 <007b005f-a6d1-44a2-9795-036c8f397274@panix.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <007b005f-a6d1-44a2-9795-036c8f397274@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/3/25 10:20, Kenneth Crudup wrote:

> Building now. Fingers crossed!

So far, so good- tried a variety of suspend/hibernate with/without 
scenarios on none, one and two connected monitors, and I can't get any 
resume OOPSes. Nice!

I did see one anomaly I haven't seen before, but I'm not sure if it's 
related to this patch (or original commit, masked by the OOPS) or not. 
For some reason after resuming from the 2nd or 3rd hibernation cycle my 
Belkin Dock couldn't get authorized by boltd after I'd plugged it in 
post-hibernation-resume. It was indeed authorized the first time 
(post-hibernate) with the new code (was plugged in at the time of resume):

----
2025-03-03T10:39:34.405568-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] parent is 63ae8780-500c...
2025-03-03T10:39:34.406815-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] connected: connected 
(/sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/0-1)
2025-03-03T10:39:34.406995-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: authmode: 
enabled, policy: iommu, iommu: yes -> ok
2025-03-03T10:39:34.407094-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: security: 
iommu+user mode, key: no -> ok
2025-03-03T10:39:34.407287-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] authorize: authorization 
prepared for 'user' level
2025-03-03T10:39:34.408876-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] udev: device changed: 
authorizing -> authorizing
2025-03-03T10:39:34.412223-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] udev: device changed: 
authorizing -> authorizing
2025-03-03T10:39:34.417191-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] authorize: finished: ok 
(status: authorized, flags: 0)
2025-03-03T10:39:34.417414-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: authorization 
successful
2025-03-03T10:39:34.419207-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] udev: device changed: 
authorized -> authorized
2025-03-03T10:47:42.252854-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] disconnected 
(/sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/0-1)
----

But after that, it wouldn't get authorized again until I'd rebooted:
----
2025-03-03T10:47:42.252854-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] disconnected 
(/sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/0-1)
2025-03-03T10:49:24.319123-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] parent is 63ae8780-500c...
2025-03-03T10:49:24.320239-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] connected: connected 
(/sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/0-1)
2025-03-03T10:49:24.320320-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: authmode: 
enabled, policy: iommu, iommu: yes -> ok
2025-03-03T10:49:24.320368-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: security: 
iommu+user mode, key: no -> ok
2025-03-03T10:49:24.320449-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] authorize: authorization 
prepared for 'user' level
2025-03-03T10:49:24.320539-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] udev: device changed: 
authorizing -> authorizing
2025-03-03T10:49:24.321698-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] udev: device changed: 
authorizing -> authorizing
2025-03-03T10:49:24.335697-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] authorize: finished: FAIL 
(status: auth-error, flags: 0)
2025-03-03T10:49:24.335817-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] auto-auth: authorization 
failed: kernel error: write error: Cannot allocate memory
2025-03-03T10:49:59.011121-08:00 xps-9320 boltd[1240]: 
[c2010000-0072-Thunderbolt 3 Dock Core    ] disconnected 
(/sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/0-1)
----

Oh, and while I couldn't see any of the USB functions of the dock, the 
DP tunnel was working, the external (cable-attached) monitor was on. 
There were no kernel messages from the failure either (but I didn't have 
TB dyndbg turned on).

Several attempts at reconnecting and a fully-disconnected power-cycle of 
the dock gave the same error until I'd rebooted the laptop. What's 
interesting is my CalDigit dock had no problem being recognized when I'd 
plugged it in during these failures:

----
2025-03-03T11:03:33.383513-08:00 xps-9320 boltd[1240]: 
[80a78780-00b3-TS4                        ] parent is 833f8780-3179...
2025-03-03T11:03:33.385441-08:00 xps-9320 boltd[1240]: 
[80a78780-00b3-TS4                        ] connected: connected 
(/sys/devices/pci0000:00/0000:00:0d.3/domain1/1-0/1-1)
2025-03-03T11:03:33.385585-08:00 xps-9320 boltd[1240]: 
[80a78780-00b3-TS4                        ] auto-auth: authmode: 
enabled, policy: iommu, iommu: yes -> ok
2025-03-03T11:03:33.385635-08:00 xps-9320 boltd[1240]: 
[80a78780-00b3-TS4                        ] auto-auth: security: 
iommu+user mode, key: no -> ok
2025-03-03T11:03:33.385733-08:00 xps-9320 boltd[1240]: 
[80a78780-00b3-TS4                        ] authorize: authorization 
prepared for 'user' level
2025-03-03T11:03:33.387211-08:00 xps-9320 boltd[1240]: 
[80a78780-00b3-TS4                        ] udev: device changed: 
authorizing -> authorizing
2025-03-03T11:03:33.389891-08:00 xps-9320 boltd[1240]: 
[80a78780-00b3-TS4                        ] udev: device changed: 
authorizing -> authorizing
2025-03-03T11:03:34.395468-08:00 xps-9320 boltd[1240]: 
[80a78780-00b3-TS4                        ] authorize: finished: ok 
(status: authorized, flags: 0)
2025-03-03T11:03:34.395641-08:00 xps-9320 boltd[1240]: 
[80a78780-00b3-TS4                        ] auto-auth: authorization 
successful
2025-03-03T11:03:34.395943-08:00 xps-9320 boltd[1240]: 
[80a78780-00b3-TS4                        ] udev: device changed: 
authorized -> authorized
----

I'll keep an eye out for it if it happens again, but at least it's not 
crashing!

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


