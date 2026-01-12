Return-Path: <linux-usb+bounces-32171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E166CD115CE
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 09:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C744B3043913
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 08:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8867346A0C;
	Mon, 12 Jan 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IRBny3i1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m21466.qiye.163.com (mail-m21466.qiye.163.com [117.135.214.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC5E3314D7;
	Mon, 12 Jan 2026 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208358; cv=none; b=oZrHHkeGcjvN1Bw+19HQvBffctltzOiKk8M3GbYpvYkWXBKFCIoOLPagmoRWZFSOkrseUhpfVKqzfPl2fYINVT/5D/x//KnbkrFiLRq8FgQVPXT38gds3rHRpDn0/XnK4engJ2fkH6oYE40Y/7YFvhbfrbZGIsB9kgjc5XxjfYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208358; c=relaxed/simple;
	bh=vO2RnU6S8Kc1wyqcgsVXtmdmNAR0L5SwmKPGQWP1IyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HbUT/u1P/bnuhtTzAgosHdcFtgjWlYnfxgRofMpwqG8Zyzy81/Xa5COuXOeQUDfS8OPgU4P4XTEiknqJ3qo1Z9AccG+srKnBVk9dFNiKIKSIoP5qPqKp6KgQkytMBdfBSfvuj/UMssUUGMwtoeCrFl16S4gyuY2GKQcp+sGohUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IRBny3i1; arc=none smtp.client-ip=117.135.214.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 30502a33a;
	Mon, 12 Jan 2026 16:59:05 +0800 (GMT+08:00)
Message-ID: <1515a445-576a-4833-a604-c31062f7d3fa@rock-chips.com>
Date: Mon, 12 Jan 2026 16:59:01 +0800
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
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260112-lively-hallowed-beetle-fc15b2@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bb16e281a03abkunma6637fdf5a04c7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk9CH1ZLQkxOGUlJHR0fSxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=IRBny3i1tny0lQHFT1Kqi2Zrp+U9KRru8lqXZ51/YlMkyThb2yqMK/JpU6UZiwbqTyvgn1Kphp/9+DbwHiCbHAtEw/Zt8qxZxPtWhVzjSxypG3x/yor73Pjw6G9NOLVxvR4W5nmhMD0Lh9jTcTDZ3ffUIG8W8dFmxCtmFSqfKuU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ldRCPrtOBfLYItSV9yMq54CAANmfFEavMvsJtpmTTys=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

On 1/12/2026 4:50 PM, Krzysztof Kozlowski wrote:
> On Mon, Jan 12, 2026 at 10:28:21AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The WCH CH334/CH335[0] are USB2.0 protocol compliant 4-port USB HUB
>> controller chips, supporting USB2.0 high-speed and full-speed for
>> upstream ports, and USB2.0 high-speed 480Mbps, full-speed 12Mbps and
>> low-speed 1.5Mbps for downstream ports, supporting not only low-cost STT
>> mode (single TT schedules 4 downstream ports in time share), but also
>> supports high performance MTT mode (4 TTs each corresponding to 1 port,
>> concurrent processing).
>>
>> Add a device tree binding for it.
>>
>> [0]: https://www.wch-ic.com/downloads/CH334DS1_PDF.html
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>  .../devicetree/bindings/usb/wch,ch334.yaml    | 65 +++++++++++++++++++
> 
> This must be separate patch. Do not combine independent subsystems into
> one patchset.
> 

Okay, thank you for the reminder.

>>  1 file changed, 65 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/wch,ch334.yaml b/Documentation/devicetree/bindings/usb/wch,ch334.yaml
>> new file mode 100644
>> index 000000000000..2eeb92f25b4c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/wch,ch334.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/wch,ch334.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: WCH CH334/CH335 USB 2.0 Hub Controller
>> +
>> +maintainers:
>> +  - Chaoyi Chen <kernel@airkyi.com>
>> +
>> +allOf:
>> +  - $ref: usb-hub.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - usb1a86,8091
>> +
>> +  reg: true
>> +
>> +  reset-gpios:
>> +    description: GPIO controlling the RESET# pin.
>> +
>> +  vdd-supply:
>> +    description:
>> +      The regulator that provides 3.3V core power to the hub.
>> +
>> +  vdd2-supply:
>> +    description:
>> +      The regulator that provides 3.3V or 5V power to the hub.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    patternProperties:
>> +      '^port@':
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +        properties:
>> +          reg:
>> +            minimum: 1
>> +            maximum: 4
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    usb {
>> +        dr_mode = "host";
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        hub: hub@1 {
>> +            compatible = "usb1a86,8091";
>> +            reg = <1>;
>> +            reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> 
> Are you sure?

I guess what you're concerned about here is the polarity? 
If that's the case, then there's no problem.

-- 
Best, 
Chaoyi

