Return-Path: <linux-usb+bounces-32082-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D8D05C9A
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 20:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 459C33035F65
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 19:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E0D2F12D4;
	Thu,  8 Jan 2026 19:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1DQO7Nz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39891DF97C;
	Thu,  8 Jan 2026 19:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767899940; cv=none; b=sCGRfENcREA2Ggasj4ASLcm+NlCuxbsRH4ZHHwWLd7D0ul5kO7P7y57ngeOu3pz+92xkrpIehFawxfKTb6Lu0YFCG7a1rUlUgTMDWd+YoTM74LMv5uTjcuEX0X2Z0w5ZW+fO14u2gBUmRF4AF+p780zc+Fn167gO9+JBn84uIlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767899940; c=relaxed/simple;
	bh=w2lBp29bboEib3MWb4ez9Qx/ZyS8nUKvbngJN37g+kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdtJrh+WDwItaSr2LySLxf73PolUbLwkNGbJwkOAoAFCJBXQQVJseHsFRr0h/W+PpeDT2RQk0H8G+dkqqAbncaUOCEnnR6vUH/ap8o8jd18RA0fSYN/UviTgy434PI2Lz2rRaNRVGQ+RtkPxemi54PWrNpP92og3IAhaE8sYyK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1DQO7Nz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FE6C116C6;
	Thu,  8 Jan 2026 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767899939;
	bh=w2lBp29bboEib3MWb4ez9Qx/ZyS8nUKvbngJN37g+kA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I1DQO7NzPWxe36edjW2XTc/ApFcPqZ9l+8h/rGmuOsFoFqbS1iUgUrzDOVXrHPtq9
	 tH+L7X50u+fXSA7yCFsVxJQ66LcN7QeKSUdeiVoraEa2TBsxn8bspEveUO3DHWoxnf
	 Ly7MENdtcJwyM7ahvhwp0ejJXeQaRQyI5UxJiLYw3E3/kbE0NXwZk4f2nOoSQ6+elt
	 yK79SqgQiwsGMA1btAUk92+aUzuZS/u1h/r0Wj43k9mP/kjboGyahrvG6aUy91A8n5
	 nTPNNIT4CFYZVDO/mKeozhTP9o/JLU8FeiwrjT5lH+GRzzWvLOddveK+wzGEdpRBHw
	 yjf+oy5OfQV7Q==
Message-ID: <ad8cf89d-a171-4e72-996e-8b09d16f9017@kernel.org>
Date: Thu, 8 Jan 2026 13:18:58 -0600
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
 <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>
 <20260108114205.GS2275908@black.igk.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260108114205.GS2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/26 5:42 AM, Mika Westerberg wrote:
> On Wed, Jan 07, 2026 at 02:50:54PM -0600, Mario Limonciello wrote:
>> On 1/7/26 3:33 AM, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Mon, Jan 05, 2026 at 11:37:47PM -0600, Mario Limonciello (AMD) wrote:
>>>> When a machine is restored from S4 if the firmware CM has created
>>>> tunnels there can be an incongruity of expectation from the kernel
>>>> when compared to booting from S5.  This series addresses those.
>>>
>>> I suspect there is no Firmware CM in AMD platforms so this actually means
>>> the BIOS CM, correct?
>>
>> That's correct.
>>
>>>
>>> However, on S4 we actually do reset host router when the "boot kernel" is
>>> started before loading and jumping to the hibernation image.
>>
>> That's only if thunderbolt.ko is built into the kernel or is included in the
>> initramfs before it does the pivot to the hibernation image.
> 
> Ah good point.
> 
>> At least in the tests we were doing it's not part of the boot kernel.
>>
>>> It might be
>>> that this boot kernel tunnel configuration is causing the issues you are
>>> seeing (can you elaborate on those?)
>>
>> The issues manifest "downstream" in the GPU driver.  There are a bunch of
>> aux failures and a non functional display.  Tracing it back the GPU driver
>> isn't alive at the time that the tunnels are attempted to be reconstructed
>> at the moment and so CM tears DP tunnel down and then when GPU driver does
>> come up it is not functional.
>>
>> DP tunnel constructed at:
>>
>> [  486.007194] thunderbolt 0000:c6:00.6: AUX RX path activation complete
>>
>> First DPRx timeout at:
>>
>> [  486.135483] thunderbolt 0000:c6:00.6: 0:6 <-> 2:13 (DP): DPRX read
>> timeout
>>
>> DP tunnel deactivating at:
>>
>>   [  486.331856] thunderbolt 0000:c6:00.6: 0:6 <-> 2:13 (DP): deactivating
> 
> Hmm, we have dprx_timeout by default 12 seconds. How come it tears down the
> tunnel already?

*I believe* it's because of a hot unplug event that occurs from it not 
working.

> 
>>
>> First DPRx DPCD reading starts at:
>>
>> [  486.351765] amdgpu 0000:c4:00.0: amdgpu: [drm] DPIA AUX failed on
>> 0xf0000(10), error 7
> 
> This would have maked it within the 12s if I read the timestamps right.

Let me just share the whole log so you can see the full context.

https://gist.github.com/superm1/6798fff44d0875b4ed0fe43d0794f81e

Notice that GPU driver resume hasn't started yet at the time of the 
first two instances of DPRX timeout.  This is the time that display has 
been brought back up.

[  486.328339] amdgpu 0000:c4:00.0: amdgpu: [drm] DMUB hardware 
initialized: version=0x09001C01




