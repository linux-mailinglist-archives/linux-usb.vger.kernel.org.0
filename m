Return-Path: <linux-usb+bounces-31573-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2444CCB440
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 10:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 251DE3017390
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 09:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B388833290B;
	Thu, 18 Dec 2025 09:52:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7280E1F9F70;
	Thu, 18 Dec 2025 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766051568; cv=none; b=mouvUXBR5HppC6cly0ozaH8v9+w+UOTFLMJTItSbStiAi540Rz1P/9DJO1fVc3wQMzvcpACF4ZNQ9NJyyThl8m+R1jJi4/rfZCK8UV4jNEKYJbPinZ2TRh1Ay3NyMcmYQIgXZRwCFysL8XbGlSO77gBMjWm4DdXeJNY/mHHutOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766051568; c=relaxed/simple;
	bh=ZAg+Vxb7Yy4hbcKu3h+/HwRKNvvS+LmAMjg1tpUKHnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eu376FWvEzmmdYz3v3MtmaibWnW2YPgS8OPcWEtgGnOcQhSBi2aGbCBHmB27cWPBCITd91eioEje5/c1J0HlKTVKF9NaQkST2Qkmn+CQcLx5IifRLthPaSHOBvq8vpffnaFTZG9+Iqq/Ub2qK1u72Hlv6uOBMER2LePgyNlZyCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 18 Dec 2025 18:52:34 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id ACA992091484;
	Thu, 18 Dec 2025 18:52:34 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Thu, 18 Dec 2025 18:52:34 +0900
Received: from [10.212.247.110] (unknown [10.212.247.110])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id AC36E10A01F;
	Thu, 18 Dec 2025 18:52:33 +0900 (JST)
Message-ID: <e773f4ef-1772-47d5-bce8-9b97979391a5@socionext.com>
Date: Thu, 18 Dec 2025 18:52:36 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: Add Socionext Uniphier DWC3 controller
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251215212507.3317805-1-robh@kernel.org>
 <0775e913-e531-44b5-b191-7ce0cf4d1e3a@socionext.com>
 <CAL_Jsq+sXky33rD1-DkLvWdNcUEBNAty8t2NzvHFx-2ZK1cCSQ@mail.gmail.com>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <CAL_Jsq+sXky33rD1-DkLvWdNcUEBNAty8t2NzvHFx-2ZK1cCSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/12/17 1:38, Rob Herring wrote:
> On Mon, Dec 15, 2025 at 7:22 PM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
>>
>> Hi Rob,
>>
>> On 2025/12/16 6:25, Rob Herring (Arm) wrote:
>>> The Socionext Uniphier DWC3 controller binding is already in use, but
>>> undocumented. It's a straight-forward binding similar to other DWC3
>>> bindings.
>>
>> After being pointed out by Krzysztof at OSSJapan, I've checked the
>> bindings
>> and was preparing some additions or fixes to resolve the warning.
>>
>> It's almost the same as my proposal, however, I add a little.
>>
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>>    .../bindings/usb/socionext,uniphier-dwc3.yaml | 89 +++++++++++++++++++
>>>    1 file changed, 89 insertions(+)
>>>    create mode 100644
>>> Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
>>> b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
>>> new file mode 100644
>>> index 000000000000..892ae3458c1b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
>>> @@ -0,0 +1,89 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/usb/socionext,uniphier-dwc3.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Socionext Uniphier SuperSpeed DWC3 USB SoC controller
>>> +
>>> +maintainers:
>>> +  - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>>> +  - Masami Hiramatsu <mhiramat@kernel.org>
>>> +
>>> +select:
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        const: socionext,uniphier-dwc3
>>> +  required:
>>> +    - compatible
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: socionext,uniphier-dwc3
>>> +      - const: snps,dwc3
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: Host or single combined interrupt
>>> +      - description: Peripheral interrupt
>>> +
>>> +  interrupt-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - enum:
>>> +          - dwc_usb3
>>> +          - host
>>> +      - const: peripheral
>> There's no problem, but how about the following description
>> following snps,dwc3.yaml?
>>
>>     interrupt-names:
>>       oneOf:
>>         - const: dwc_usb3
>>         - items:
>>             enum: [host, peripheral]
> 
> That allows for 'peripheral, host' or just 'peripheral'. Mine would
> seemingly allow 'dwc_usb3, host', but snps,dwc3.yaml will prevent
> that.

I see. The property combinations are complex, so
I'll follow your suggestion from the currnet .dts files.
  
>>
>>> +
>>> +  clocks:
>>> +    maxItems: 3
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: ref
>>> +      - const: bus_early
>>> +      - const: suspend
>>> +
>>> +  phys:
>>> +    description: 1 to 4 HighSpeed PHYs followed by 1 or 2 SuperSpeed
>>> PHYs
>>> +    minItems: 2
>>> +    maxItems: 6
>>
>> Since Pro4 only has one PHY, so:
>>       minItems: 1
> 
> Ah, I only checked arm64. Will fix> 
> If there's other arm32 warnings, I'm not looking at those. So fixes
> appreciated there.

Yes, I'll address the arm32 warnings.

Thank you,

---
Best Regards
Kunihiko Hayashi

