Return-Path: <linux-usb+bounces-21352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF61A4EA0C
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 18:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DD1F17C513
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 17:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C6D27F4EC;
	Tue,  4 Mar 2025 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="vPvc4aTx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA0C24EAB9
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 17:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109394; cv=none; b=hCB1EVp+AGWThKisJ+X8ZHRhDHdbYkY84rdXXIDu96vr3n1nzLNPO5nZARTPi7KvDxHt78RESVcg6I5BxCmxu49u09fsSjXrCXu4K2QDZS0e2hfSVslS3EUX3EbKteZl6bDcQ+IAhJk87h1+RUBlsaxG0e1LE8TtHvR3VByWKg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109394; c=relaxed/simple;
	bh=ERNhdDABOVobVdLtVqDh2yN8tQw2AsRk3DIxBUjAZZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5s7sPc0M5olKznHxF53ZrXubq1SZTrIa+Tqce6fW179fQStnnCtb4cyZ/OCz591C5qxxWOdIKOEJIMZGe+pToHAhf0wL0YVOv1zYw+i6ehexkwrsO/QcZXmoRbWVcPE366cT7c2nxPv3zzXRlKJ60bnoo+dEAzd02OCRm4nics=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=vPvc4aTx; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [10.50.4.36] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z6jNt6jfNz4PcD;
	Tue,  4 Mar 2025 12:29:50 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741109391; bh=ERNhdDABOVobVdLtVqDh2yN8tQw2AsRk3DIxBUjAZZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=vPvc4aTxDmh+xNFlewJYffrgtF4vPx5CYD89tmgn1pz5Lo6ZoPpNTEpCRM1M9/fkD
	 JbsNmM7RQJLUEYcNlafGJz+59gVvDOZ8b0cLa46KEcEQtn6L+QKYhTKd6tSrmJvXnv
	 igD3sXfqV450GE9iUDc2SFVVcNqCacBTBDv87+XI=
Message-ID: <ae9cfc12-99ba-4c40-b698-e2b12eb22ab8@panix.com>
Date: Tue, 4 Mar 2025 09:29:49 -0800
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
References: <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
 <20250303142058.GA3713119@black.fi.intel.com>
 <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>
 <20250303175818.GB3713119@black.fi.intel.com>
 <007b005f-a6d1-44a2-9795-036c8f397274@panix.com>
 <48ef4c14-55d5-4baa-b862-f9e7368ed950@panix.com>
 <20250304082731.GF3713119@black.fi.intel.com>
 <14351945-fcde-4088-b7b3-542c6e4b7d0e@panix.com>
 <20250304134017.GL3713119@black.fi.intel.com>
 <7c5ec580-9b1c-40b7-9a8d-64bc95c41432@panix.com>
 <20250304135148.GM3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250304135148.GM3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/4/25 05:51, Mika Westerberg wrote:

>>> It only happens if you have TBT dock and the NVMe connected and you
>>> disconnect them while the system is suspended. I suggest trying that a
>>> couple times and see if that happens. For me it
>>> happened pretty much on first suspend cycle.

So I've tried it twice again today-

1 - CalDigit dock, NVMe adaptor. Put it to sleep, disconnected 
everything, even waited a while (call me crazy, but I swear how long the 
system is suspended seems to make a difference). Opened the lid, and it 
came right up.

2 - CalDigit dock, NVMe adaptor. Hibernated, drove to clients' offices. 
Resumed, came up OK.

Now I'm curious what difference the "4. Authorize both PCIe tunnels, 
verify devices are there." makes to your system, as I have "boltd" 
running and that handles it for me.

Tell ya what- if Linus pushes anything to master today, I'll 
pull/build/boot it and since the TB dyndbg is on, I'll post the dmesg 
from the runs so you can see them when you get in tomorrow.

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


