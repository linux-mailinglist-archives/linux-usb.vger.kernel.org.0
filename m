Return-Path: <linux-usb+bounces-32019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8BD000F5
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 21:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1CC93019270
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 20:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595A4318ED7;
	Wed,  7 Jan 2026 20:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfEsJaxc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AC1225402;
	Wed,  7 Jan 2026 20:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767819056; cv=none; b=jwQttyaHEjUEf5TRGmGb8xaYQ6UN54D+3IJR80HZxr37OuqMiWAu2INOBZQtJCn0vBMw5GX2OpEjcxx/TdEH+jLvKJKBhPTlEYW1Fh5lTXoesFTgFyQE41eEuppzxn28Rn3SwpzrxqNo0C+FfUqcDbgTYJh60bUy381p3iB3TSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767819056; c=relaxed/simple;
	bh=/bQLQQ7/t8+fmjmDDrfiZS8Ka1/aGXekq+aewTtU4Do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8n2vC0g/LliC/J0U3T1Sg95MJO/9LKZhS1TSaiXpP0265KES4BcTWwrQA8RsAsOOoUIwZhTiSJDsJvcCfa/t3NWNB+fZqMY37eibneMLjpOYUe/kdLQl1Cn0uB/YfJY32EZ5KVn1uvmfJLL6mXCV0XMElx83UAEU/4xSNYYwPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfEsJaxc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE048C16AAE;
	Wed,  7 Jan 2026 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767819056;
	bh=/bQLQQ7/t8+fmjmDDrfiZS8Ka1/aGXekq+aewTtU4Do=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VfEsJaxcJ2jyzxF29azq81lmR+QoahN3LkJl7s7vkxTdUt1OsQbOZHYLQPPIKY//z
	 I3h3T72gSAPivO7zK5WY2Gxx8hmM+6CQRhak0069pH2rDDB15la8hTHy9jasoxCEkA
	 3zhbLUM01ZJJa4SUrFhizGDdF65SsGS2ExcPsQkipU/qLMAy0b3SL0B8uO07lWgjaJ
	 BXsJQcXKg3CPsiL2dXaCE1Ym2I8RrkplBZdKLjHutO5/jJivQlkxwYGPJxIR8n1NG6
	 XddSx/Jf65Bc17dj7u4tq/H7d4dtaa4/Zh6fkAvq/KlYGYDRcApyyB21w3zxG1NRnv
	 KysdVl856oPnQ==
Message-ID: <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>
Date: Wed, 7 Jan 2026 14:50:54 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>
References: <20260106053749.61440-1-superm1@kernel.org>
 <20260107093353.GO2275908@black.igk.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260107093353.GO2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 3:33 AM, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Jan 05, 2026 at 11:37:47PM -0600, Mario Limonciello (AMD) wrote:
>> When a machine is restored from S4 if the firmware CM has created
>> tunnels there can be an incongruity of expectation from the kernel
>> when compared to booting from S5.  This series addresses those.
> 
> I suspect there is no Firmware CM in AMD platforms so this actually means
> the BIOS CM, correct?

That's correct.

> 
> However, on S4 we actually do reset host router when the "boot kernel" is
> started before loading and jumping to the hibernation image. 

That's only if thunderbolt.ko is built into the kernel or is included in 
the initramfs before it does the pivot to the hibernation image.

At least in the tests we were doing it's not part of the boot kernel.

> It might be
> that this boot kernel tunnel configuration is causing the issues you are
> seeing (can you elaborate on those?) 

The issues manifest "downstream" in the GPU driver.  There are a bunch 
of aux failures and a non functional display.  Tracing it back the GPU 
driver isn't alive at the time that the tunnels are attempted to be 
reconstructed at the moment and so CM tears DP tunnel down and then when 
GPU driver does come up it is not functional.

DP tunnel constructed at:

[  486.007194] thunderbolt 0000:c6:00.6: AUX RX path activation complete

First DPRx timeout at:

[  486.135483] thunderbolt 0000:c6:00.6: 0:6 <-> 2:13 (DP): DPRX read 
timeout

DP tunnel deactivating at:

  [  486.331856] thunderbolt 0000:c6:00.6: 0:6 <-> 2:13 (DP): deactivating

First DPRx DPCD reading starts at:

[  486.351765] amdgpu 0000:c4:00.0: amdgpu: [drm] DPIA AUX failed on 
0xf0000(10), error 7

I believe by doing the reset in this series we instead get HPD events 
and react to those.  If we keep things as they are today I think we need 
to work out some changes to device ordering.

> but given that it is (typically the
> same kernel binary) it should be creating the tunnels the same way.
> 
>>
>> v1:
>> Link: https://lore.kernel.org/linux-usb/20251023050354.115015-1-superm1@kernel.org/
>>
>> Mario Limonciello (AMD) (2):
>>    thunderbolt: Move nhi_reset before pmops declaration
>>    thunderbolt: Reset NHI during S4 restore_noirq() callback
>>
>>   drivers/thunderbolt/nhi.c | 77 ++++++++++++++++++++++-----------------
>>   drivers/thunderbolt/tb.c  | 29 ++++++++-------
>>   drivers/thunderbolt/tb.h  |  1 +
>>   3 files changed, 61 insertions(+), 46 deletions(-)
>>
>> -- 
>> 2.43.0


