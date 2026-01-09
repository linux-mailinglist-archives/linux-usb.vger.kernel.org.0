Return-Path: <linux-usb+bounces-32115-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD97D0B03F
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 16:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ECE9314B223
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 15:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C82C363C51;
	Fri,  9 Jan 2026 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wtd3S0AZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB5235E529;
	Fri,  9 Jan 2026 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973084; cv=none; b=B+J7rBNiWf6IDPB09nh8S5r5QlINPbBjaZ3XCUniOqavrZ+OXbKYJkfkbhCGLcQrvlcBBvtXqZKQeze+N/ug3XIG0E+3KfTkMSTSBp7m0XrkSUO2Y1Aq+qiVzc2OyvfmLBR8yfgCvGF9kR43gAdzUIjFHajkWjjGoBSUsxGrKeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973084; c=relaxed/simple;
	bh=XQlFAVMsB6kBmwNGZCM10GnkLEZSa+RUEW1eaNYKGEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azwwwt4HvUACwpreC5ZHTQjpCPuzQ82hMcg7EvZlJQZIZmvvrjlUHq9hjBlE7xL590Qfc9NvQ0qjigdvGcFcwMLLI1pPHpRSLaR3HzViCnK/35nvKauEcN+3uw/iTt9bnvuGC52gdNu2AIlgeuyOjLX3ZYRxGX5ABw3axrfBcDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wtd3S0AZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB17C4CEF1;
	Fri,  9 Jan 2026 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767973084;
	bh=XQlFAVMsB6kBmwNGZCM10GnkLEZSa+RUEW1eaNYKGEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wtd3S0AZ2djzPPC/LzLR9qh2QMolS3nGnCfoaWFmJi+U4nfwgebiRTRi4sc+CtaxV
	 LHsHmnIfokFLc9AxsbOpvbjchsIC2ksy1D/WKG2QFthPR5o413KJ1+x3njQ14TimG5
	 5Z4ePyaT3uMeQnhJ3smb1WitcKPiDvdX6S9bh0TYgWABbHA9IyvUWyt7xkpmqJUdsK
	 OsukX09wvkT4CIE1G+hj2Z1cfCbUV8oQw7Nk+2LK/31YGvfKBdM66CRZWvZg+tTls3
	 byLe+P8jX4Tkv5/ynZUDFQ6BFVDpnhHltJvyLuvQ27/yjuvrqTbNIp1wMOpTRP2XMY
	 brs8hwSqxr/Sw==
Message-ID: <3e47698b-6e6a-45e6-a312-b7db8f473359@kernel.org>
Date: Fri, 9 Jan 2026 09:38:02 -0600
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
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pooja Katiyar <pooja.katiyar@intel.com>,
 Rene Sapiens <rene.sapiens@linux.intel.com>, "S, Sanath" <Sanath.S@amd.com>
References: <20260106053749.61440-1-superm1@kernel.org>
 <20260107093353.GO2275908@black.igk.intel.com>
 <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>
 <20260108114205.GS2275908@black.igk.intel.com>
 <ad8cf89d-a171-4e72-996e-8b09d16f9017@kernel.org>
 <20260109072318.GU2275908@black.igk.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260109072318.GU2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/26 1:23 AM, Mika Westerberg wrote:
> On Thu, Jan 08, 2026 at 01:18:58PM -0600, Mario Limonciello wrote:
>> On 1/8/26 5:42 AM, Mika Westerberg wrote:
>>> On Wed, Jan 07, 2026 at 02:50:54PM -0600, Mario Limonciello wrote:
>>>> On 1/7/26 3:33 AM, Mika Westerberg wrote:
>>>>> Hi,
>>>>>
>>>>> On Mon, Jan 05, 2026 at 11:37:47PM -0600, Mario Limonciello (AMD) wrote:
>>>>>> When a machine is restored from S4 if the firmware CM has created
>>>>>> tunnels there can be an incongruity of expectation from the kernel
>>>>>> when compared to booting from S5.  This series addresses those.
>>>>>
>>>>> I suspect there is no Firmware CM in AMD platforms so this actually means
>>>>> the BIOS CM, correct?
>>>>
>>>> That's correct.
>>>>
>>>>>
>>>>> However, on S4 we actually do reset host router when the "boot kernel" is
>>>>> started before loading and jumping to the hibernation image.
>>>>
>>>> That's only if thunderbolt.ko is built into the kernel or is included in the
>>>> initramfs before it does the pivot to the hibernation image.
>>>
>>> Ah good point.
>>>
>>>> At least in the tests we were doing it's not part of the boot kernel.
>>>>
>>>>> It might be
>>>>> that this boot kernel tunnel configuration is causing the issues you are
>>>>> seeing (can you elaborate on those?)
>>>>
>>>> The issues manifest "downstream" in the GPU driver.  There are a bunch of
>>>> aux failures and a non functional display.  Tracing it back the GPU driver
>>>> isn't alive at the time that the tunnels are attempted to be reconstructed
>>>> at the moment and so CM tears DP tunnel down and then when GPU driver does
>>>> come up it is not functional.
>>>>
>>>> DP tunnel constructed at:
>>>>
>>>> [  486.007194] thunderbolt 0000:c6:00.6: AUX RX path activation complete
>>>>
>>>> First DPRx timeout at:
>>>>
>>>> [  486.135483] thunderbolt 0000:c6:00.6: 0:6 <-> 2:13 (DP): DPRX read
>>>> timeout
>>>>
>>>> DP tunnel deactivating at:
>>>>
>>>>    [  486.331856] thunderbolt 0000:c6:00.6: 0:6 <-> 2:13 (DP): deactivating
>>>
>>> Hmm, we have dprx_timeout by default 12 seconds. How come it tears down the
>>> tunnel already?
>>
>> *I believe* it's because of a hot unplug event that occurs from it not
>> working.
>>
>>>
>>>>
>>>> First DPRx DPCD reading starts at:
>>>>
>>>> [  486.351765] amdgpu 0000:c4:00.0: amdgpu: [drm] DPIA AUX failed on
>>>> 0xf0000(10), error 7
>>>
>>> This would have maked it within the 12s if I read the timestamps right.
>>
>> Let me just share the whole log so you can see the full context.
>>
>> https://gist.github.com/superm1/6798fff44d0875b4ed0fe43d0794f81e
> 
> Thanks!
> 
> [Side note, you seem to have the link trained at Gen2 (20G) instead of Gen3
> (40G).]
> 
> Looking at the dmesg I recalled that there is an internal report about
> similar issue by Pooja and Rene (Cc'd) and it all boils down to this log
> entry:
> 
> [  489.339148] thunderbolt 0000:c6:00.6: 2:13: could not allocate DP tunnel
> 
> They made a hack patch that works it around, see below. I wonder if you
> could try that too? If that's the issue (not releasing HopIDs) then we need
> to figure a way to fix it properly. 

Thanks! I shared it with our internal team that reproduced it, will come 
back next week with their results.

> One suggestion is to release DP
> resources earlier, and of course doing full reset as done here. I would
> prefer "smallest" possible change.

Well FWIW the v1 of my patch for the reset was a lot smaller :P

https://lore.kernel.org/linux-usb/20251023050354.115015-1-superm1@kernel.org/#t

> 
> @Pooja, any updates on your side to this?
> 
> diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
> index 28c1e5c062f3..45f7ee940f10 100644
> --- a/drivers/thunderbolt/tunnel.c
> +++ b/drivers/thunderbolt/tunnel.c
> @@ -1084,6 +1084,9 @@ static void tb_dp_dprx_work(struct work_struct *work)
>   
>   static int tb_dp_dprx_start(struct tb_tunnel *tunnel)
>   {
> +	if (tunnel->dprx_started)
> +		return 0;
> +
>   	/*
>   	 * Bump up the reference to keep the tunnel around. It will be
>   	 * dropped in tb_dp_dprx_stop() once the tunnel is deactivated.


