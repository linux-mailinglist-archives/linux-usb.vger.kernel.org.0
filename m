Return-Path: <linux-usb+bounces-32212-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 292BCD168A2
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 04:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01773300766F
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 03:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E20F34B1BE;
	Tue, 13 Jan 2026 03:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="EfK1WbsQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m32107.qiye.163.com (mail-m32107.qiye.163.com [220.197.32.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47025F994;
	Tue, 13 Jan 2026 03:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768275836; cv=none; b=isoUKh6nljzd+N+30PTPsM8kSLx2NekxMeOQNAlPnHiqh+q8zuBiJrtRDJesZ8NT8EpcdJbbPaQa8OmlrLxrE1NkdDVYsIT8pq+UzkqBzNRBrqgSd0syXyTx/uck3PbpLFSeVOjQO2wh1uiUVtxNO82+U7SAT2o9YXE7NtnK7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768275836; c=relaxed/simple;
	bh=/dtHleA9qsK4o3GSUp+PHST+NiHksDjZc3lkTxmOQzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8AYJq8ZZWtdN/cfiU5+2V07DO3qlsrV9QbHLAYcXT09Q6rD1gVoz3Kaeea1rhPWSp5Ka71obqZGMa/etyxsQmkXeJmodQISklN0aer0kzPmUKUKSRuULpW9B18YS16qnwsRA+kwSzfW/uvM8ClS7SYxJu9LbGP5X5ZQRKsjfgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=EfK1WbsQ; arc=none smtp.client-ip=220.197.32.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 306abc5d2;
	Tue, 13 Jan 2026 11:38:25 +0800 (GMT+08:00)
Message-ID: <dc5dbed9-cd48-4d22-9960-d35f9dcdc5f0@rock-chips.com>
Date: Tue, 13 Jan 2026 11:38:20 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: Add binding for WCH CH334/CH335
 hub controller
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>, Hsun Lai <i@chainsx.cn>,
 John Clark <inindev@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260112022823.91-1-kernel@airkyi.com>
 <20260112022823.91-2-kernel@airkyi.com>
 <07ce7c4e-7fc7-40f8-9c46-4977e3ce2458@cherry.de>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <07ce7c4e-7fc7-40f8-9c46-4977e3ce2458@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bb56ef09a03abkunm4d9a2525bea91
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkMaHlZPHxhNTh5MQkoZSE1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=EfK1WbsQ2pS868dyEmAt018UkLX0plHykv8VwY0z06nQOnLBA8V/nAlesyU4ZeeCiwPO4y82K14gHO2Yv3upKG8FkH3T19BUID8R25VKOnmk1OBZFZClwC0HACXVovPWQ8fX1HXTHJX5jEJI5WUZy1jovZ8dBcUW9WbJRVo3+z0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Efl5RuE0mVY+YJW1yRffgZbr4IC25Y+TVgIpBMs5y7Y=;
	h=date:mime-version:subject:message-id:from;

Hi Quentin,

On 1/12/2026 10:00 PM, Quentin Schulz wrote:
> Hi Chaoyi,
> 
> On 1/12/26 3:28 AM, Chaoyi Chen wrote:
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
>>   .../devicetree/bindings/usb/wch,ch334.yaml    | 65 +++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml
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
> 
> Which driver does this node bind to? I couldn't quickly find a driver which would match this compatible?
>

Oh, I missed that part. It will be fixed in the next version.

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
> 
> There's v5 and vdd33 as power input, shouldn't we maybe use those names instead? How did you come up with vdd/vdd2?
>

That make sense. Will fix in next version.

> There's also a timing that needs to be respected after a power-on event so that the reset has enough time to be performed, c.f. 3.2.1 Power-on Reset in the datasheet you linked to in the commit log. How are you making sure we wait those (apparently, the wording in the datasheet is confusing) 14ms?

This part should be described in the driver. 
I'll fix it in the next version.

-- 
Best, 
Chaoyi

