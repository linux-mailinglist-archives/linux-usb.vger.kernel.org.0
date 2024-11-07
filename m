Return-Path: <linux-usb+bounces-17333-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3888D9C0E38
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 20:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0912282F4A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 19:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD43D217672;
	Thu,  7 Nov 2024 19:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KR3+qkq0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC39217668
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 19:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731006176; cv=none; b=hXjk62D7uBFTi7AJD6DLp/s4uQlhaHDX4Xlydks4rI4D+JhI7rAzXv0UmkD6vp29dxCO12F8CnuKAdJthLZdfcKhdEUWruA3ZPU4E4C+2ZdkWjid+UyLImCEf+GDcqrrkVV7ipHZaVPvHGQsrmxk9Q8b0+dbpTJoDdj6RYnN2zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731006176; c=relaxed/simple;
	bh=kIky1Dz2MgNJV5tjVARxYROJ3loqDlcVUJdKbs+CCe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ml5AcH9138srQEaw7oq7TodWREOEJMox5tDlaHuLI1zpuNC51rOvX72FkPhNhwes+/AqnG8N9LU+R/GeNgv6YFp8qAQ3q1gbd+7Pn8MLajVeVpCytccFkhl9SD8pgjDVAwuH8OeKjYpL3Z4Q4D56wZ29xHWu9BJfi5d/PUNtm3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KR3+qkq0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB31C4CECC;
	Thu,  7 Nov 2024 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731006175;
	bh=kIky1Dz2MgNJV5tjVARxYROJ3loqDlcVUJdKbs+CCe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KR3+qkq0j7WwjOjobeGqfT6vaSCYxNK6PvGElMYbiDl6MjI4Lj9wOojNoUenGuzxZ
	 fOJ/IH8/NxlVCUNkbVOH3lSqk0zw8SPouj7P1MPGWVJZOT1OBunlnFO2qYPwjTmjh7
	 kFzQb17IUTVA9T651ApZmhafHWzaTiFyN8mTEn3kShGY0kKuf1OihUueh5wq0iyA1Y
	 +vwh7xdUdUTaBZLdWxkWwom05T4QlswpnbQ3rWd1C3RAHpLPUMzLKE5VqYSyei5OgX
	 qpOJ7jrVHNTFCG2O5x/k3OWuOig5mYEOUkKEHMF8RHeOgERAeUdBNTW0szqQq4icN+
	 95HQy7YT9lZlQ==
Message-ID: <9546c6f0-7cff-4661-968d-a7415134e731@kernel.org>
Date: Thu, 7 Nov 2024 21:02:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
To: Chris Morgan <macroalpha82@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <cover.1713310411.git.Thinh.Nguyen@synopsys.com>
 <e8f04e642889b4c865aaf06762cde9386e0ff830.1713310411.git.Thinh.Nguyen@synopsys.com>
 <1519dbe7-73b6-4afc-bfe3-23f4f75d772f@kernel.org>
 <671bef75.050a0220.e4bcd.1821@mx.google.com>
 <20241025224003.yfujqurxhrgzgzld@synopsys.com>
 <CADcbR4KhWdXpynk2c-tryx1=Eg4LhC4t=C6zcVHAMcMz2hH-8Q@mail.gmail.com>
 <20241029224900.by3zglncf33izsgw@synopsys.com>
 <ca4daad3-9a34-4331-9faa-91b960924b9e@kernel.org>
 <672291b9.9d0a0220.1f040e.013f@mx.google.com>
 <20241031013353.cgxjqgboz6hcy4xx@synopsys.com>
 <672d0c05.050a0220.114196.1e8b@mx.google.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <672d0c05.050a0220.114196.1e8b@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Chris,

On 07/11/2024 20:50, Chris Morgan wrote:
> On Thu, Oct 31, 2024 at 01:33:54AM +0000, Thinh Nguyen wrote:
>> On Wed, Oct 30, 2024, Chris Morgan wrote:
>>> On Wed, Oct 30, 2024 at 03:10:34PM +0200, Roger Quadros wrote:
>>>> Hi Chris,
>>>>
>>>> On 30/10/2024 00:49, Thinh Nguyen wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, Oct 29, 2024, Chris Morgan wrote:
>>>>>> Sorry, to be specific it was the fix that causes the issues I'm now
>>>>>> observing. When I explicitly revert commit
>>>>>> 705e3ce37bccdf2ed6f848356ff355f480d51a91 things start working again
>>>>>> for me. With that commit in place, however, suspend fails for me.
>>>>>
>>>>> Ok, Roger's patch is causing issue on your platform and the $subject
>>>>> patch? Can you provide more details on your test sequence?
>>>>>
>>>>> * What does "no longer able to suspend" mean exactly (what error?)
>>>>> * What mode is your usb controller?
>>>>> * Is there any device connected while going into suspend?
>>>>> * Can you provide dwc3 regdump?
>>>>
>>>> Commit 705e3ce37bccdf2ed6f848356ff355f480d51a91 will enable
>>>> DWC3_GUSB2PHYCFG_SUSPHY in DWC3_GUSB2PHYCFG(i)
>>>> and DWC3_GUSB3PIPECTL_SUSPHY in DWC3_GUSB3PIPECTL(i) during
>>>> system suspend path, unless snps,dis_u2_susphy_quirk or
>>>> snps,dis_u3_susphy_quirk is set.
>>>>
>>>> I see rK356x.dtsi has snps,dis_u2_susphy_quirk;
>>>> Does adding snps,dis_u3_susphy_quirk resolve the issue?
>>>
>>> I'm afraid it does not fix the issue. Specifically when I do
>>> "systemctl suspend" the device begins to suspend but freezes with the
>>> kernel log output via serial console listed previously. Note I have
>>> console enabled in suspend. Additionally button input no longer
>>> works at this point.
>>>
>>> Specifically, I'm testing this with the Anbernic RG353P device based on
>>> the Rockchip RK3566 SoC, in case you're curious.
>>>
>>> I'm not able to get you a register dump post suspend attempt as the
>>> system completely freezes, however I can get you a dump prior to
>>> suspend if that will help?
>>
>> Yes, any data is useful.
>>
>>>
>>> Thank you,
>>> Chris
>>
>> Can you help answer the other bullet questions I have previously.
>>
>> Thanks,
>> Thinh
> 
> I have 2 ports, here is a dump of each:

Did you try this patch [1]. Does it fix the issue for you?

[1] https://lore.kernel.org/all/20241104-am62-lpm-usb-fix-v1-1-e93df73a4f0d@kernel.org/

-- 
cheers,
-roger

