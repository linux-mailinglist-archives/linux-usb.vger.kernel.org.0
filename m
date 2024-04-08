Return-Path: <linux-usb+bounces-9062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC5689C301
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 15:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47447B2B4B0
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 13:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF357D3E3;
	Mon,  8 Apr 2024 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fw5bN7P4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F957CF29
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 13:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712582826; cv=none; b=M+Iwag7ocWyBJ4EK4FCYdKl7J4llDIY7uuKJjueNpb1T6TlUYJ88ydJhSKnc5pci5hZoWX8Qix8RR0WP15YkDM2c7ElbmhoMOnMgYhK8W4rQZPn9A6U6DGtez+VXHa3QBs3ZxrrJhXkn8Nt3rJvY0GtB4Y8Ixqu83UV7uW3k4B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712582826; c=relaxed/simple;
	bh=irNNoFJZO1Gz1+eRkFAf0ZYdvMxb4fZry5HvMmVnPXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kmW6rMCrlYLEvwfnzQvhAVh2n9fh/G7cS17sz9yJX51s1tF8nrSMI079zJ3klItEccOZk640YhUOidtLQPKSZy3ZhrKtIfvXf1XEP6u6vKAn6xAI28VTND/58s5NeAHIiRwsqjusy1pz6hOtZwOoRJG1GQz+ascyKYhGxn/k6eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fw5bN7P4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a51d05c50b2so156961666b.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Apr 2024 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712582822; x=1713187622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TiZX3mVFBF7BLHgtOUkl0S2NrftfNbyBEoRd4uLMG+Q=;
        b=fw5bN7P4KoIuJNNTvm/PcT8sRUSSUdr4SWHQst0KCOQ6AgMpxkNPcHeYgp/CxJo/Yy
         9M4f9mQn1uJl3VJMgmG7nMUWaCplJc6a+6MPnkiw9uLxfoBqWYDtQYQvZrXdiWRUJ9Bc
         mzQ3Y25vzU/kl+gGjyFogJI5kadcUshzr9jBtI/z4TTqXzZJ78f20kqygO7cOuwGGcQ8
         LAQc4VdrnVToTZMZsmjCzCLor2Vg//m0gzKb+Uvp/GZs9cK4BF1w4/pwv+asG3qi4Bbv
         8jqdLlcJnZOQB6HW2CdZG6+YufJuapMt9tc/py1pMsLCE9MnoeOVmzL2nGMDGQtrtYJu
         HKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712582822; x=1713187622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiZX3mVFBF7BLHgtOUkl0S2NrftfNbyBEoRd4uLMG+Q=;
        b=aHDzVGOAq7jkhQE8qMpgO427gWovN8S8pIU6AzW5ayhfrHMMW7i5b1UbM/cXeXIjfw
         49lg/d+nW6VkT5p0N3vDiVHBuQs7CqFH80rM6pEeA1DYwIzGhX/eQKOpPxoWjT1a4qrF
         fOi/BNu/Y6xEJZ+N/p+LWN2QrDfqgpVhHPbs3PKWq0Z98oAmTrIIDEYT9qLiXt8d7nf1
         CTPeuCWcxVycLnr8V8PyMQZnOAb4Zn/Nqyi/gqtHw0vXAbevoYH5P8aVqvA5Z0hmg55g
         3NILlPBv2uzeuaZAs1FCImOYbKM5qPBkKCQfKBOSujJOeckj3MuWpRASQJMAa7gxn9Q6
         O6iA==
X-Forwarded-Encrypted: i=1; AJvYcCVO0FRFTimYN87G4Sre6J1FzG/RJIFcPnuU3Hlhzf5heKTbTeAgGivUK2++KIChYLivW2DlN3Qg9wg001+1oZmjgR9joH40E3wt
X-Gm-Message-State: AOJu0YzART7MA9ha6d60UNNxfV5Up7gwJ1LfH0SjlVMqX2LtoX7WTBPC
	msRvKfALR8DVp6aAEKkp/2KwrWUOKyVGcsT5BYvMeppSLP6uXq/EWsCwtFKXnC0=
X-Google-Smtp-Source: AGHT+IEJj9yKQD6yiMMokwJ/A3E08HGTwQ18dwUwQSVxyuMUaUFGzXP8AXIG+S//bXb32FuaipcRvg==
X-Received: by 2002:a17:907:7ba2:b0:a51:b0e1:863b with SMTP id ne34-20020a1709077ba200b00a51b0e1863bmr6049600ejc.1.1712582822321;
        Mon, 08 Apr 2024 06:27:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id jy23-20020a170907763700b00a4ea0479235sm4453870ejc.107.2024.04.08.06.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 06:27:01 -0700 (PDT)
Message-ID: <1502383c-9caf-4362-8bd6-ed719a304f08@linaro.org>
Date: Mon, 8 Apr 2024 15:27:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 1/2] dt-bindings: usb: typec: anx7688: start a binding
 document
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, Pavel Machek
 <pavel@ucw.cz>, phone-devel@vger.kernel.org,
 kernel list <linux-kernel@vger.kernel.org>, fiona.klute@gmx.de,
 martijn@brixit.nl, samuel@sholland.org, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
References: <ZhPMHdt6r/4D99Zg@duo.ucw.cz>
 <ab9affc8-de68-4ec9-bdfc-02131191bc3a@linaro.org>
 <ZhPTTxI4oTF3pgrk@duo.ucw.cz>
 <e7841ad2-fa3d-442d-804d-51f12e05c234@linaro.org>
 <e6vvuttix5k5fioy7q44ick5wj6u5gleh7mht36s4zjjcym7vy@bziejyohtc4b>
 <7976e254-ed1e-406d-870b-1ecdc4b1e23c@linaro.org>
 <uoo7xltbfx7u6iai7urj3wez7cwotokxt6lwjhff57xbljusqn@fr2xejnrlak7>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <uoo7xltbfx7u6iai7urj3wez7cwotokxt6lwjhff57xbljusqn@fr2xejnrlak7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/04/2024 14:48, Ondřej Jirman wrote:
> On Mon, Apr 08, 2024 at 01:59:12PM GMT, Krzysztof Kozlowski wrote:
>> On 08/04/2024 13:52, Ondřej Jirman wrote:
>>> On Mon, Apr 08, 2024 at 01:24:03PM GMT, Krzysztof Kozlowski wrote:
>>>> On 08/04/2024 13:21, Pavel Machek wrote:
>>>>> Hi!
>>>>>
>>>>>>> Add binding for anx7688 usb type-c bridge. I don't have a datasheet,
>>>>>>> but I did best I could.
>>>>>>>
>>>>>>> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>> +  cabledet-gpios:
>>>>>>> +    maxItems: 1
>>>>>>> +    description: GPIO controlling CABLE_DET (C3) pin.
>>>>>>> +
>>>>>>> +  avdd10-supply:
>>>>>>> +    description: 1.0V power supply going to AVDD10 (A4, ...) pins
>>>>>>> +
>>>>>>> +  dvdd10-supply:
>>>>>>> +    description: 1.0V power supply going to DVDD10 (D6, ...) pins
>>>>>>> +
>>>>>>> +  avdd18-supply:
>>>>>>> +    description: 1.8V power supply going to AVDD18 (E3, ...) pins
>>>>>>> +
>>>>>>> +  dvdd18-supply:
>>>>>>> +    description: 1.8V power supply going to DVDD18 (G4, ...) pins
>>>>>>> +
>>>>>>> +  avdd33-supply:
>>>>>>> +    description: 3.3V power supply going to AVDD33 (C4, ...) pins
>>>>>>> +
>>>>>>> +  i2c-supply: true
>>>>>>> +  vconn-supply: true
>>>>>>
>>>>>> There are no such supplies like i2c and vconn on the schematics.
>>>>>>
>>>>>> I think this represents some other part of component which was added
>>>>>> here only for convenience.
>>>>>
>>>>> Can you give me pointer to documentation you are looking at?
>>>>
>>>> The schematics you linked in the document at the beginning. Page 13. Do
>>>> you see these pins there? I saw only VCONN1_EN, but that's not a supply.
>>>
>>> The supply is U1308.
>>
>> That's not a supply to anx7688.
> 
> Yeah, I understand where the confusion is. The driver is not for anx7688 chip
> really. The driver is named anx7688, but that's mostly a historical accident at
> this point.
> 
> I guess there can be a driver for anx7688 chip that can directly use the chip's
> resources from the host by directly manipulating its registers and implementing
> type-c functionality via eg. Linux's TCPM or TCPCI stack, etc. (eg. like
> fusb302 driver, or various tcpci subdrivers).
> 
> But in this case the chip is driven by an optional on-chip microcontroller's
> firmware and *this driver* is specifically for *the Type-C port on Pinephone*

We do not talk here about the driver, but bindings, so hardware.

> and serves as an integration driver for quite a bunch of things that need to
> work together on Pinephone for all of the Type-C port's features to operate
> reasonably well (and one of those is some communication with anx7688 firmware
> that we use, and enabling power to this chip and other things as appropriate,
> based on the communication from the firmware).

That's still looking like putting board design into particular device
binding.

> 
> It handles the specific needs of the Pinephone's Type-C implementation, all of
> its quirks (of which there are many over several HW revisions) that can't be
> handled by the particular implementation of on-chip microcontroller firmware
> directly and need host side interaction.
> 
> In an ideal world, many of the things this driver handles would be handled by
> embedded microcontroller on the board (like it is with some RK3399 based Google
> devices), but Pinephone has no such thing and this glue needs to be implemented
> somewhere in the kernel.

You might need multiple schemas, because this is for anx7688, not for
Pinephone type-c implementation.

However I still do not see yet a limitation of DTS requiring stuffing
some other properties into anx7688 or creating some other, virtual entity.


Best regards,
Krzysztof


