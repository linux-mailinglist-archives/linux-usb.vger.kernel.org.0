Return-Path: <linux-usb+bounces-16861-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F12339B63C5
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 14:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B488D2824A8
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 13:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D941EABA0;
	Wed, 30 Oct 2024 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8O327b6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544391E9066
	for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2024 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730293838; cv=none; b=BDJK0RJnRaFt7zJvGZ9caJP04dYtXptXB7MRqvvtn/UQhKSJe1QScPo7F1CCawhRfYjH10zIJqLQLUysUI2titRCRb1PTFNp2x+jPmoECxJy4YZ+oKtc17ioFKjduhtXVwN5YKJslxiZK3IQOuwFqkZycDuKUkcp6gVUXZRbhBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730293838; c=relaxed/simple;
	bh=+uLWvVBY7M1ZsYNiD8248YT6lJ9Ix4OB7Fng9Yba3m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAG+IjZBgHIOyFuwliGhTQ4BTxJabsIuZ68iNNLTDH/l4m3fU95nTh4kyoAxnceXb1gseEWQh34OzR5200cnjg8fueObqFoHM1eEIvTJcmCFDwRMCImbdkBy2mKV3784RoO0y7XQ3NT5WeT9+RlK6FWvK/LZQF1VKlolngTjcN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8O327b6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7B9C4CEE3;
	Wed, 30 Oct 2024 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730293838;
	bh=+uLWvVBY7M1ZsYNiD8248YT6lJ9Ix4OB7Fng9Yba3m0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b8O327b6Oi0gUGZPEnDraqPcTyujl1bYV1Sfw1rjAOkxTr1ImIr+2z7/gyWHXR608
	 R73BTkfRmFIN9gIo7BNzD7ePG++n1iBeiK2tKPBUkClLY5YgROUtGy3DsEWas/GBfR
	 f5u/OGpT5DKmE2As0iltWDiwo10n0EJ+dnwpbkMTLaOSgIOyfQqsjUy8CPc66Ht77l
	 kpvH28LFpFz9/boEjJXsMBPUMXxb2jXHQnrM9OYsHPgZgLXDFNRBvH7OgvlvOIttRm
	 ZM/FcmHoGsdF9LGILPrIA6X5zbWsUZ5TDrNLpX159J/8cLMygNL6tSn7cUj7v11vEy
	 xtuFwBDz/2SZw==
Message-ID: <ca4daad3-9a34-4331-9faa-91b960924b9e@kernel.org>
Date: Wed, 30 Oct 2024 15:10:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Chris Morgan <macroalpha82@gmail.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <cover.1713310411.git.Thinh.Nguyen@synopsys.com>
 <e8f04e642889b4c865aaf06762cde9386e0ff830.1713310411.git.Thinh.Nguyen@synopsys.com>
 <1519dbe7-73b6-4afc-bfe3-23f4f75d772f@kernel.org>
 <671bef75.050a0220.e4bcd.1821@mx.google.com>
 <20241025224003.yfujqurxhrgzgzld@synopsys.com>
 <CADcbR4KhWdXpynk2c-tryx1=Eg4LhC4t=C6zcVHAMcMz2hH-8Q@mail.gmail.com>
 <20241029224900.by3zglncf33izsgw@synopsys.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241029224900.by3zglncf33izsgw@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Chris,

On 30/10/2024 00:49, Thinh Nguyen wrote:
> Hi,
> 
> On Tue, Oct 29, 2024, Chris Morgan wrote:
>> Sorry, to be specific it was the fix that causes the issues I'm now
>> observing. When I explicitly revert commit
>> 705e3ce37bccdf2ed6f848356ff355f480d51a91 things start working again
>> for me. With that commit in place, however, suspend fails for me.
> 
> Ok, Roger's patch is causing issue on your platform and the $subject
> patch? Can you provide more details on your test sequence?
> 
> * What does "no longer able to suspend" mean exactly (what error?)
> * What mode is your usb controller?
> * Is there any device connected while going into suspend?
> * Can you provide dwc3 regdump?

Commit 705e3ce37bccdf2ed6f848356ff355f480d51a91 will enable
DWC3_GUSB2PHYCFG_SUSPHY in DWC3_GUSB2PHYCFG(i)
and DWC3_GUSB3PIPECTL_SUSPHY in DWC3_GUSB3PIPECTL(i) during
system suspend path, unless snps,dis_u2_susphy_quirk or
snps,dis_u3_susphy_quirk is set.

I see rK356x.dtsi has snps,dis_u2_susphy_quirk;
Does adding snps,dis_u3_susphy_quirk resolve the issue?

cheers,
-roger
> 
> Thanks,
> Thinh
> 
>>
>> On Fri, Oct 25, 2024 at 5:40 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>>
>>> Hi,
>>>
>>> On Fri, Oct 25, 2024, Chris Morgan wrote:
>>>>
>>>> This patch seems to break system suspend on at least the Rockchip
>>>> RK3566 platform. I noticed that I was no longer able to suspend
>>>> and git bisect led me to this patch.
>>>>
>>>> My kernel message log shows the following, at which point it freezes
>>>> and does not allow me to resume from suspend:
>>>>
>>>> [   27.235049] PM: suspend entry (deep)
>>>> [   27.871641] Filesystems sync: 0.636 seconds
>>>> [   27.885320] Freezing user space processes
>>>> [   27.886932] Freezing user space processes completed (elapsed 0.001 seconds)
>>>> [   27.887642] OOM killer disabled.
>>>> [   27.887981] Freezing remaining freezable tasks
>>>> [   27.889655] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
>>>>
>>>> Thank you,
>>>> Chris
>>>
>>> Did you try out Roger's fix?
>>> 705e3ce37bcc ("usb: dwc3: core: Fix system suspend on TI AM62 platforms")
>>>
>>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=705e3ce37bccdf2ed6f848356ff355f480d51a91__;!!A4F2R9G_pg!ZXQdR2uLykSD67_3JSm0RZHuyJ7IVnw5EvmYvLnPsf3dDEilv5ZgHD9GX7gZr52t0H7oFKifzAEhbdK8EGYzmSji2UI$ 
>>>
>>> BR,
>>> Thinh


