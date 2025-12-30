Return-Path: <linux-usb+bounces-31844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5051CE9D84
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 15:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35EDD3031A2A
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 14:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA21C239E75;
	Tue, 30 Dec 2025 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDAYa7W8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C653189BB0;
	Tue, 30 Dec 2025 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103233; cv=none; b=txODIi7zkIddP+6kKN+07TcsVdMK2GJK5HPapVt7lRKAcc9UVB5Oxg/0+ibDBF86p1FOhq228HXbbR4kvQZ5OtnJw9iflGMBReBEEGB0ogxYUyt61dCeoffOunvD154o5XHyiWrNZouOQ6MmOcq5KhIDLaJXsC+lGwYpRQCxY0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103233; c=relaxed/simple;
	bh=qszXpoahE4ALvto425hqG2uUu1+aPT/ZbY4aF26L4E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9kAnYs7vHsoMBqB2HRmS3JcaNNHClSeNUMqjK7A18rTX/n2UTOvLSWlSrKaorNTf7qapcpHTjGq73XhsVvioNUty/HymzM4gobp3JkHJekWRKLZiLaDSSiIutdSypBEmrm482zTtqKgx1TIIW9UPgnKDsYSxhQpr8LJJTviGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDAYa7W8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F462C4CEFB;
	Tue, 30 Dec 2025 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767103231;
	bh=qszXpoahE4ALvto425hqG2uUu1+aPT/ZbY4aF26L4E4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CDAYa7W8rTgPiF0BzqeFhpS2ssZTvHQOcKPH54L8AhCoiHE0qkVRLvbS5OAoaRSS0
	 YrpMIOAgvP7NYo/VfBb67LEStItwiUaGtR1g8aZI/rMFH9Y6kYzZ3g6HQkx4Ou1fH+
	 s1LUnf/M02rU+nSe/LY8Y2hdUELMzCFzSz1UvXzzoMXdoVLZr+8EuMXSshKW0FdRuX
	 t8nM35JGkKfPVY9kcjhegXzTr66gMYD0vsXiU2aGyiZxyk7DCQsD6U977yS98KS846
	 3hGiDv5ibjzOMrEmENg1YLOHc+ZAjoSV2k3mgEEq3qSgZ7uFEGIIPIlS9CRILyvTYq
	 Qqh1eBsicJZFA==
Message-ID: <572407e8-bac7-4277-bfbd-ed42327b0ff4@kernel.org>
Date: Tue, 30 Dec 2025 15:00:26 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: soc: canaan: Add top syscon for Canaan
 K230 SoC
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: conor@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 neil.armstrong@linaro.org, krzk+dt@kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230-jumping-visionary-coyote-c0be31@quoll>
 <aVPQNIhyfR/Da/gk@duge-virtual-machine>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aVPQNIhyfR/Da/gk@duge-virtual-machine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/12/2025 14:14, Jiayu Du wrote:
> On Tue, Dec 30, 2025 at 08:39:19AM +0100, Krzysztof Kozlowski wrote:
>> On Tue, Dec 30, 2025 at 10:37:21AM +0800, Jiayu Du wrote:
>>> The Canaan K230 SoC top system controller provides register access
>>> to configure related modules. It includes a USB2 PHY and eMMC/SDIO PHY.
>>>
>>> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ...
>>> +
>>> +  "#size-cells":
>>> +    const: 1
>>> +
>>> +  usb-phy@70:
>>> +    $ref: schemas/phy/canaan,k230-usb-phy.yaml#
>>
>> So that's why you did not have example there? But where did you explain
>> merging strategy/constraints/dependencies? How maintainers can now they
>> can apply this or not?
> 
> Sorry, I will update in v2.
> 
>>
>>
>>> +    unevaluatedProperties: false
>>> +
>>> +  usb-phy@90:
>>> +    $ref: schemas/phy/canaan,k230-usb-phy.yaml#
>>> +    unevaluatedProperties: false
>>
>> Anyway, these are not really real children. Defining child per phy,
>> where each such phy is just few registers, is way too granular. Instead
>> define one phy with phy-cells=2.

Just a note: phy-cells=1, I made mistake before.

>>
>> You also MUST make this device - hisys - binding complete. If you do
>> not, then my review is: fold the children here, because you do not have
>> any other resources for the parent.
> 
> This hisys memory area not only includes the usbphy registers,
> but also contains the registers of sd/mmc phy. Therefore, the
> hisys node is necessary and cannot be folded.

Can be. There is absolutely nothing stopping it.

Anyway, define all nodes.

> 
> 
> If what I said above is accepted by you, do I still need to
> merge the two usb phy nodes by defining one phy with phy-cells=2?

You should read your datasheet, not exactly rely on me guessing. In
current form of the binding, you must fold the child into the parent.

Best regards,
Krzysztof

