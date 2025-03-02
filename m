Return-Path: <linux-usb+bounces-21236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EF3A4B320
	for <lists+linux-usb@lfdr.de>; Sun,  2 Mar 2025 17:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7D35188F698
	for <lists+linux-usb@lfdr.de>; Sun,  2 Mar 2025 16:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4AA1E9B1D;
	Sun,  2 Mar 2025 16:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="a+Ia5vwS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8C1DF25C
	for <linux-usb@vger.kernel.org>; Sun,  2 Mar 2025 16:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740932821; cv=none; b=pZe0UVUUEb2cQ9IlzXlf96Iq3JMfFJllqno/Ddzl/b4JuyAPGrDZ9iZ+pAeyRGzhyn0OuaOe7yY72J89EKjAtcyOQBezzC10s5v3Qci9foF2N01tb/RRnEPtkDhgxmGucIlhqPZkRDNtGFRXDoCPf5rH/5SXCeKaWwDgY2RDHVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740932821; c=relaxed/simple;
	bh=Yn+k/V/ItCHeQ/6H2kM2tcbljXu9sXeAU0nvOEqhInQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRSN1Lhu19KcUM/AmH8XlPN0SNHKmeWJKhftrc10PAPOoKKPZZgVTc729R2FPtjjWfg3EnAA+SkGeS2so8QxSqfMO9vQLd8cYi9Kp4JqPFjwQWKvOC5Gble7Jks/Xo1uwCKVEqBzz0pVDJUaZ33izEwW9MO7bRGVdbcQpJicVKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=a+Ia5vwS; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.122] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z5S5G4Mlvz4BD1;
	Sun,  2 Mar 2025 11:26:58 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1740932818; bh=Yn+k/V/ItCHeQ/6H2kM2tcbljXu9sXeAU0nvOEqhInQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=a+Ia5vwSKoWKx70I7/egrc7qG/m9BR7NlvK5ZT6jtBI+V0s9fmxiPQ7PxAT5ZpPyG
	 BSg+jrXJMY8tO1fpkcE4YhexFoRTq/8gAHzONysYUwyoCVG5RGO7i036n2y0V64y0U
	 71C0w2qrI4CEZvTnPIRr38X19auLd3zNAS28U9M0=
Message-ID: <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
Date: Sun, 2 Mar 2025 08:26:57 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


FWIW, seeing a Metric F'ton (13171) of these after testing a hibernate 
cycle- I guess now that my resumes are completing these are occurring now:

thunderbolt 0000:00:0d.3: hotplug event from non existent switch 1:d 
(unplug: 0)

This is one of my onboard ports (presumably the right one I use all the 
time at home):

----
0000:00:0d.3 USB controller [0c03]: Intel Corporation Alder Lake-P 
Thunderbolt 4 NHI #1 [8086:466d] (rev 02) (prog-if 40 [USB4 Host Interface])
         Subsystem: Dell Device [1028:0af3]
         Flags: bus master, fast devsel, latency 0, IRQ 16, IOMMU group 8
         Memory at 6040200000 (64-bit, non-prefetchable) [size=256K]
         Memory at 60402e3000 (64-bit, non-prefetchable) [size=4K]
         Capabilities: [80] Power Management version 3
         Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
         Capabilities: [a0] MSI-X: Enable+ Count=16 Masked-
         Kernel driver in use: thunderbolt
----

-K

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


