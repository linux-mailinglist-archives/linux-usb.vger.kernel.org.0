Return-Path: <linux-usb+bounces-32213-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA45D168F9
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 04:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73B59301B487
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 03:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265BA308F3D;
	Tue, 13 Jan 2026 03:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ICLXnlUC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m15590.qiye.163.com (mail-m15590.qiye.163.com [101.71.155.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9459163;
	Tue, 13 Jan 2026 03:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768276252; cv=none; b=tA+shgujkeVZwmfOgJTGUiBR1c0FF24yfHoaipV2IT5O80bs0MLiifyzcVP09SMvRJH5s7BpU8tnWkywdwi8m4wCevvT86Wgl+xta0pMnCd1UOUqg8pNfHJxl9bWvdXte4gZLaiwrKqMovOMz3n5HdJ4c4zL1SOMEBNf6VtUj1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768276252; c=relaxed/simple;
	bh=+0/2IF5z7o1wcBvsgWG+eBqE4okj4szedjYBDDu8QF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfJwHLDnnTg/nrtjwQXQFiAU5SKlMOfNvuPxhe+zCTzzGcUCl0ZZSWC7adJMuzCrw+GG4L+M1KcYCbOYNxSTxRQyNpjBGCnts75pJ/54j/mFcFz71BegdhZv/y/db8EXA/VEWXFH2n+CHmM3tC0REVXflbVF7rCaPd+Fex6hNIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ICLXnlUC; arc=none smtp.client-ip=101.71.155.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 306affc4c;
	Tue, 13 Jan 2026 11:45:35 +0800 (GMT+08:00)
Message-ID: <b901011c-d062-4a4f-8a2e-9f918eab3838@rock-chips.com>
Date: Tue, 13 Jan 2026 11:45:30 +0800
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
 <568b9e25-bf96-4e78-9af0-4791cbb90a56@rock-chips.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <568b9e25-bf96-4e78-9af0-4791cbb90a56@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bb575818903abkunm0fc5f439c0aac
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkoaHlZPGEoaHRlPH0tPGRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ICLXnlUCKdw0l4C5PwjkIWI+IVk7r4/+WwkYTgaVw86rZ636qn6GnsMAlH3m9KDe331gcSkS3TklrGhw8/QrO0k6/hTC3s1bGoI9x213B9d26cr4/F/RDXu76m2tvVwDtwq+Qyw1eBwnYz+/a3EN9/JjCw818hD+5H3XmHoPYvc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=RLlZk5JLSHjXxq4/+unFmqq6XhZxTOn9ntEjqGDpUTM=;
	h=date:mime-version:subject:message-id:from;

On 1/13/2026 11:27 AM, Chaoyi Chen wrote:
> Hi Krzysztof,
> 
> On 1/12/2026 10:28 PM, Krzysztof Kozlowski wrote:
>> On 12/01/2026 09:59, Chaoyi Chen wrote:
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>>> +    usb {
>>>>> +        dr_mode = "host";
>>
>> One more thing - drop above line.
>>
> 
> Will fix in next version.
> 
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +
>>>>> +        hub: hub@1 {
>>>>> +            compatible = "usb1a86,8091";
>>>>> +            reg = <1>;
>>>>> +            reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
>>>>
>>>> Are you sure?
>>>
>>> I guess what you're concerned about here is the polarity? 
>>> If that's the case, then there's no problem.
>>
>> Yes, I was wondering whether polarity is set correctly.
> 
> Yes, it is active-low, so during normal operation it should be set to high.
> 

Sorry, I didn't consider the driver situation. 
I will fix it in the next version.

-- 
Best, 
Chaoyi

