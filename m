Return-Path: <linux-usb+bounces-32288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD0D1A011
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 16:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA81030751CF
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 15:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2422FFF80;
	Tue, 13 Jan 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q1mpDzMV"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72A2727E2
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319146; cv=none; b=mfq3K3tV9Y74O7QTuKWuqBjMEf0IIMUZ88LwdrgoWgb/1FCs/ehMu07K6xKbl8r/mzKgr67H1y71ZVgJCnK3YdjBgVx2nUQinQJ5XoJSyhQulZ5ciu4wCUNP621cH1H9MAZSGgoEvSZE+9JFbN2+ooxUna0h1uhbaL2dtzQAdmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319146; c=relaxed/simple;
	bh=3SQQBYUjNQwpzOuLiSkEMbjhE+P5XgeNzGpGVNXU6gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eOZtkXRz1Cn6jszhGzxzT/P+7f0ntYlkfwILKwpb8WGj/d0APk8BzCA21jyZj96yfqqm7TbNw0jBRLyjAOWUTQDmqbtMWYaNBdUDno/0jUC02J/xGKGOwTAUSUxIDJlXUOq5JN2k5r/bm0Oex5/0oHZdcOBPi9t/jwwSsZPaEew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q1mpDzMV; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <d6788510-3ae2-4f13-85f6-c0438c89b9a6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768319143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rj6P6vozmH1EvRwA6aSxUolOJmV8G7aB4o/SJ24/mXY=;
	b=q1mpDzMVQ4sFCbigI5ukfTND8EiyoDkl6Ckhxgqny2OhbE81/mmJ1WbGePIr9J1xndh1B2
	1z7lOzMuixBXWH+2jh9y40jNgeXj+OsjmGIYT5h0mMw6lZtyn824jkZKZa+tecKRs7RrzY
	zznRKdIO1G7a0XhVV0F4g0nuNTowcBk=
Date: Tue, 13 Jan 2026 10:45:32 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
 "Frager, Neal" <neal.frager@amd.com>, "Simek, Michal"
 <michal.simek@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260106171018.501612-1-sean.anderson@linux.dev>
 <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
 <MN0PR12MB59538C2F8613A9C0641BEAFBB782A@MN0PR12MB5953.namprd12.prod.outlook.com>
 <8f0e04a5-49df-4fe3-9c76-9a1c0bd822a0@linux.dev>
 <20260113004941.4fhmvlkhf5pifwgt@synopsys.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260113004941.4fhmvlkhf5pifwgt@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/12/26 19:49, Thinh Nguyen wrote:
> On Fri, Jan 09, 2026, Sean Anderson wrote:
>> On 1/9/26 01:01, Pandey, Radhey Shyam wrote:
>> > [AMD Official Use Only - AMD Internal Distribution Only]
>> > 
>> >> -----Original Message-----
>> >> From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>> >> Sent: Friday, January 9, 2026 6:19 AM
>> >> To: Sean Anderson <sean.anderson@linux.dev>
>> >> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>; open list:DESIGNWARE
>> >> USB3 DRD IP DRIVER <linux-usb@vger.kernel.org>; Frager, Neal
>> >> <neal.frager@amd.com>; Simek, Michal <michal.simek@amd.com>; open list
>> >> <linux-kernel@vger.kernel.org>; moderated list:ARM/ZYNQ ARCHITECTURE
>> >> <linux-arm-kernel@lists.infradead.org>; Philipp Zabel <p.zabel@pengutronix.de>;
>> >> Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; Greg Kroah-Hartman
>> >> <gregkh@linuxfoundation.org>
>> >> Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
>> >>
>> >> On Tue, Jan 06, 2026, Sean Anderson wrote:
>> >> > If we don't have a usb3 phy we don't need to assert the core resets.
>> >> > Deassert them even if we didn't assert them to support booting when
>> >> > the bootloader never released the core from reset.
>> > Is it a customized bootloader ? i.e it assert reset but don't deassert.
>> 
>> No. Most peripheral resets are asserted on PoR. So if the bootloader
>> doesn't deassert them then Linux has to.
>> 
>> My goal is to make init_serdes() in psu_init_gpl.c optional and do all
>> serdes initialization in the phy driver (and in the consumer drivers). I
>> have this working for DP/PCIe. I'm working on SATA, and I don't think
>> USB/SGMII need much special. This gives the following advantages:
>> 
>> - On some boards (mine) the reference clocks may not be configured in
>>   SPL/FSBL. So ILL calibration will fail (and take a long time to do so)
>>   unless we defer initialization to U-Boot/Linux where the phy driver
>>   can request the clocks.
>> - If PCIe/SATA are not used in U-Boot, ILL calibration can be deferred
>>   until Linux when it can be done it parallel with other initialization.
>> - We will have flexibility to switch between different serdes
>>   configurations at runtime. For example, this could allow the
>>   bootloader to fixup the devicetree to support PCIe and SATA M.2
>>   drives, depending on what the user has plugged in.
>> 
>> > I think ideally core /APB reset should be done independent on
>> > MAC 2.0/3.0 configuration.
>> 
>> I agree, but I think the existing code does this optimization to reduce
>> boot time when the bootloader has already initialized USB. I have
>> preserved that in this patch.
>> 
> 
> I think all this info is useful. Can we include it in the change log?

OK, how about:

I am working on moving serdes initialization to the phy (and consumer)
drivers to improve flexibility and boot times (depending on
configuration). Currently, core resets are released in the bootloader by
init_serdes() in psu_init_gpl.c. In order to remove init_serdes, we
need to handle the case where the bootloader never released the core
resets. If we don't have a usb3 phy we don't need to assert the core
resets, but deassert them anyway to handle this case.

We could assert all resets every boot, but I believe the existing
procedure is an optimization to reduce boot time when the bootloader has
already initialized USB. So this patch preserves the separate code
paths.

