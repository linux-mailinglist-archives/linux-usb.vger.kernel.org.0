Return-Path: <linux-usb+bounces-30844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0665AC7ED25
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 03:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C8D2B4E0518
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 02:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51CE28A1CC;
	Mon, 24 Nov 2025 02:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m8x/Irwa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189128850B
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 02:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763951652; cv=none; b=UBoxtE2hm+AKK6MFOrH7Y5QgKK0L5vTuPLzPDCMhRuOV5uCoaqSnNCsAiFRAFjErNKWbe1Is75e10gClTYn+bBnqiC8WcMbmjYV1gJY650BHgvsTQoOH7GBTiJUibt80e+Wf/LSHg4IEJJ8NTELtKuPm/D1n0IZa+v4hXbOebPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763951652; c=relaxed/simple;
	bh=u50wiEtGTDGab7ZHLTtEof0ZVgdLfgY/RffYitv2A9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPcjZyfEntzPlKh0Kb8y73uS++NCq0R0H6j1c0S6J5D14nWg3bgWudoTtT24Ea2ZH8G9qyA8Vwhj4AAFKw/O19ZXb35Ofd0Tk1Av3am2VPcxXimMkF2u9CjH7rjRzXGr/purSRojTTM1pgLcFbe5BC5BuzpvRn3JOabXSllqRXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m8x/Irwa; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63fc72db706so3108031d50.2
        for <linux-usb@vger.kernel.org>; Sun, 23 Nov 2025 18:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763951649; x=1764556449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJnKQ9oJ9uOzEtfzk8AKk4PwanNXBUdVi5ibWSqh/IQ=;
        b=m8x/IrwaiGnCb0YBQz7bEJk0cbf46DK1nrNm2Kwf8vW9VvfhJto4J7VC6xJdKeWM58
         GEWqUnq2+rVPoIN+62SlrcgIizlmxlvmG50u0HenUdY3x7ttd2jzBxl7Fo08vaqaJXLU
         1lGuLVic55gDwMu+dOLEa9KHlp/YqJCukKMKeiZKRwyyq9WyIypGGv+Kh8wntAI3/Tgs
         RzDKPQOETilaHBt0vgwifEkDh24ZrSqIkox8G9aqwCOzyXZ+KVBt9nQqpqUahk3jc0yS
         U/2W2W4UvLW6njF1ue9GuGHZwkt1He9eUc8hRVE0rcX7BMQAttBfHYqs+Iog8XQl53M/
         WOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763951649; x=1764556449;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJnKQ9oJ9uOzEtfzk8AKk4PwanNXBUdVi5ibWSqh/IQ=;
        b=L4luKR8panQKFbqO+lVrg5DUOPGrbZfaJIBnhnXMomHy2XKY7aaZ+8SYahJHj36NwT
         XqCNaIjNQ3xRXn+m4PBgmRCdN6LZ5ubXYr/TGe/zVponnkiOAKKZora3LRJEmLU+Xmy+
         CuawDa9osbO6ilSmJLQf+zNE6aL8QOsmeipT+EOzP6w4uz8IUMMRF4rsMg2bJc/jq2tZ
         I2Y2LrqGHRpoF/B6/jPjhqAGYQdg0YkRqbDM5U5FLy3QcgeG8lxmsVEXvOTA6gyKdw8r
         App0K/iNZHsBugQo7MfmSYb3wH3EiveKJpoTVhq/JUn9WClX1bsxd5AOnqUmyBzVUAOc
         U2hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCuFfy9FuVskc9Ie3ecDRjGmEJlX9Tnxc1Fx2WOigSc4UXP+gp2gaCGx81xnM+7OSOnhppMtd62DM=@vger.kernel.org
X-Gm-Message-State: AOJu0YytJkVzIPxhfqVhOCWcj8JJlyUq7LD/Im/uZw2O6Cduwk56yeLb
	NpuvVR7bjfnyaLVO6H2MBsjkujdLCZXj7uwSfk2rTgHsZx06ROIlanSKCriiZzTFVg==
X-Gm-Gg: ASbGncsVNrS9UOjtlpPTafNDRjEVZ1uQ4nh5sfsLm+XQ3EcYpCYw3tVPO06nYACtmtd
	aI4Ig9jnRkkCD5tPv95k+WeQDCHlHujyqLbPOR1IwFBvuxvctD9Z7ZdwLfcxcgQkqqw6PjusrkM
	TtSTV/+jR5Ag+rrXBGRqoLUfW7i/ntIuTUlMdpu6NYsYHT8aY10XxD/MrowV1h35ilXcsKkXR6P
	/WNH6M8U+xMU5L3k708io6Mur3LuNBqSaM1KSKu0tjFYi1F5Db0iOtiDi5kLaE0DuwBAiIJHrVU
	CG7Va5T1iP9UvSe2LiY2uj//2FIrn8FcDLPa3BXPTP6aa/9YW1UQkcmGEA9jvwhi6nBLU4LdWjx
	pazIZiW4pJAtH66xTbqNp4TqTmxIq3oyfPOifTwAqMJsRvcHxIE7CBAuTZPpxP3ol7iWsb4D2RX
	naBTXHb1SEIZTlTgNBsMrx/8x6gx/xrfHvDBJDzEeK+j4dnEtCF78O1B9toF4=
X-Google-Smtp-Source: AGHT+IHxC+BdP7vzl95DrlP/y364+xUvzMJ0RS3cskY282bYh7RWJ066M6U+GDgwPwRF2d9d7KuiRA==
X-Received: by 2002:a05:690e:400d:b0:641:f5bc:699a with SMTP id 956f58d0204a3-64302b37d39mr6827251d50.72.1763951649099;
        Sun, 23 Nov 2025 18:34:09 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:1806:1fd4:facd:d088? ([2600:1700:4570:89a0:1806:1fd4:facd:d088])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a5decsm40005717b3.21.2025.11.23.18.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 18:34:08 -0800 (PST)
Message-ID: <c9b059f8-9219-4219-95c8-23a3733fea58@google.com>
Date: Sun, 23 Nov 2025 18:34:05 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: power: supply: Add Maxim MAX77759
 charger
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-1-6b2e4b8f7f54@google.com>
 <d4455f4b-2a0f-4bc0-b897-14f2e27af3ea@kernel.org>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <d4455f4b-2a0f-4bc0-b897-14f2e27af3ea@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 11/23/25 1:28 AM, Krzysztof Kozlowski wrote:
> On 23/11/2025 09:35, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add bindings for Maxim max77759 charger device.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>  .../power/supply/maxim,max77759-charger.yaml       | 36 ++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>> new file mode 100644
>> index 000000000000..71f866419774
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>> @@ -0,0 +1,36 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/supply/maxim,max77759-charger.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim Integrated MAX77759 Battery charger
>> +
>> +maintainers:
>> +  - Amit Sunil Dhamne <amitsd@google.com>
>> +
>> +description: |
>> +  This module is part of the MAX77759 PMIC. For additional information, see
>> +  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
>> +
>> +  The Maxim MAX77759 is a dual input switch mode battery charger for portable
>> +  applications. It supports wired and wireless charging and can operate in buck
>> +  and boost mode.
>> +
>> +allOf:
>> +  - $ref: power-supply.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: maxim,max77759-charger
>> +
> This should be just folded into parent node, no need for separate
> charger device or is just incomplete.

Thanks for the review! You are right, the binding is incomplete. This
charger block actually listens on its own I2C address, distinct from the
main PMIC.

I will update v2 to include the reg property. I will also add the
standard properties `constant-charge-current-max-microamp` and
`constant-charge-voltage-max-microvolt` to configure the hardware
limits, as this charger device does not manage the battery profile
directly (that is handled by a separate fuel gauge).


Thanks,

Amit

>
>> +  usb-otg-vbus-regulator:
>> +    type: object
>> +    description: Provides Boost for sourcing VBUS.
>> +    $ref: /schemas/regulator/regulator.yaml#
>> +    unevaluatedProperties: false
>> +
> Best regards,
> Krzysztof

