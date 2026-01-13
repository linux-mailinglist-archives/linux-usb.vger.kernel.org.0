Return-Path: <linux-usb+bounces-32211-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A65ED167C4
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 04:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AA8B3027CCF
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 03:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E223271F9;
	Tue, 13 Jan 2026 03:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="j8obcMol"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49194.qiye.163.com (mail-m49194.qiye.163.com [45.254.49.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE15F314B77;
	Tue, 13 Jan 2026 03:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768274877; cv=none; b=a6/LEBUS4SBxghgv1DpRHLhWzIsg97VNThYicEL3cwHevBH5aFqwh14ko0cjt6gTpoAJSUmsCGlA1BtEyoEBH/SEzeyGKidYGJAmrKZ/uTzmCDX5vq7WSXPlR1SLPSh3MJpwwtViZi5dI4jqlECudgmcWXeiA8JsXzhpHuLti6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768274877; c=relaxed/simple;
	bh=oDiFkOAJhwhhqlFgPM2tfPbbhucudExPMwp31zh0MVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhPxT9LiTsTsnMxAzKo2zzTaNcr2iHM5bEu8c4Ryg8RYXggeou0BEXiw96M7CH1wincC6Xk+WEljioeFt4R77EHy+QJ71svgp4VSljmQpY+eM8uP2bbTdHsjdTRkwZuc8m+CSVFhW9n+rkrQTmX4B27/mVchh05eHQ0b9l28cRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=j8obcMol; arc=none smtp.client-ip=45.254.49.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 306a5f42e;
	Tue, 13 Jan 2026 11:27:47 +0800 (GMT+08:00)
Message-ID: <568b9e25-bf96-4e78-9af0-4791cbb90a56@rock-chips.com>
Date: Tue, 13 Jan 2026 11:27:42 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: Add binding for WCH CH334/CH335
 hub controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jonas Karlman <jonas@kwiboo.se>,
 Hsun Lai <i@chainsx.cn>, John Clark <inindev@gmail.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260112022823.91-1-kernel@airkyi.com>
 <20260112022823.91-2-kernel@airkyi.com>
 <20260112-lively-hallowed-beetle-fc15b2@quoll>
 <1515a445-576a-4833-a604-c31062f7d3fa@rock-chips.com>
 <b4eb4ab6-6fde-4c01-8069-470545ffdac4@kernel.org>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <b4eb4ab6-6fde-4c01-8069-470545ffdac4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bb565344303abkunm4f7b74c5bb9b2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5NTFYeGk9CHR1MQktOGElWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=j8obcMol5+AOwJGWd4CkkJSotssuGuB56Xxp96+E1lKmAzQYeIzcaoyDSvz1xiGd3APhWcqSoGnAIz41qphb61NIPnSgVTf3eE3YChEg8vwlEfPzNxR7NfgJZXRLCJjYtimcvheLwMxkY7URpqko6HPO0z0Qs2NWTcqKjvU4DXs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=kdJ4UgolWe5TG4TnfG60pnogZaazG17AzGYzZPOjrtM=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

On 1/12/2026 10:28 PM, Krzysztof Kozlowski wrote:
> On 12/01/2026 09:59, Chaoyi Chen wrote:
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>> +    usb {
>>>> +        dr_mode = "host";
> 
> One more thing - drop above line.
> 

Will fix in next version.

>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +
>>>> +        hub: hub@1 {
>>>> +            compatible = "usb1a86,8091";
>>>> +            reg = <1>;
>>>> +            reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
>>>
>>> Are you sure?
>>
>> I guess what you're concerned about here is the polarity? 
>> If that's the case, then there's no problem.
> 
> Yes, I was wondering whether polarity is set correctly.

Yes, it is active-low, so during normal operation it should be set to high.

-- 
Best, 
Chaoyi

