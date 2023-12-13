Return-Path: <linux-usb+bounces-4110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01355810FD6
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 12:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 329871C20B79
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 11:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0562224C9;
	Wed, 13 Dec 2023 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ps4H3KJ9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA5DD0
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 03:25:02 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54c9116d05fso9080184a12.3
        for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 03:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702466701; x=1703071501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gv/A7jHNjFLyzRYzKfqK0WHlrVZmXn0422j25ExLZCs=;
        b=ps4H3KJ9SrjAw3O4iZ9guR/YT4TPtbKuzpULj1uDgS3SIInFeYOMJnwvy1k74c9ajD
         R/MFAF45Vfk5lNQrHYSsz+FRNvU/MJoDnUJnAx/o0zza9jNISpepGE0bgxd69inUUR23
         srXlGDmweyQR5BIErRUCCc6Z3qcMk2B9SZXwt+UBE0enZJDyvvHPQ02s07KnLI99mhZo
         S57HFkzD514h5hzNM7U2rLht8jrIpvBqEX1h4Ix9jC2riLgmSKJS9qcfiPrEf7uFv/5P
         YwtIR/S5jBHaa9pogDWxzuSgWRmqMvNteuWWDcjsJngdMAjAwmlOXLjgQXdba9CY/SG2
         3A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702466701; x=1703071501;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gv/A7jHNjFLyzRYzKfqK0WHlrVZmXn0422j25ExLZCs=;
        b=dhreCpik82IBujKNgJs+RudS/6fFcg8o74fjgTOgADlbQoKu2Y4EeLgVr1ALpClISP
         oKp21YwF8fptrCcGtuSuoSjD1ZcdcfDjuw+4RkZxeqegrOUmXQ8hdo7Vz0OKcyDo+GK5
         IzEqM9gE4Zzg5QmguXg2g6fj86i5zAyh+NMaxljUIddJiGrdUs/G2+HnKPyfDT9J9R4n
         6f3t22Ky+Hx13wriZQ1fphzI/m9WxiCpWzSYOzR3vEvOZ9mC2NPitkMhy74IivynnBqd
         tVga8X8Z+6V+m36VJ+loJ0hKaV/Z0ksuZm+ymDONw1f1Hj6Nr7G/ncLk2gisEPMci/Q5
         CtlA==
X-Gm-Message-State: AOJu0Yxx0WYCFG0qvJvlkuFkp3ByjI+erR1uPLgDKkH79JTLMxluDQVh
	u8vPRxjL4/g4klEiEI7DAdH/hA==
X-Google-Smtp-Source: AGHT+IGJlXn1Mi08HlP34ar3lkIRgsRhx1P0eKXDU6J4SGUwS5vCrIpbvzuXSTpw61BYOYGEpzAJEQ==
X-Received: by 2002:a17:906:8b:b0:a1f:821b:1d9c with SMTP id 11-20020a170906008b00b00a1f821b1d9cmr2132407ejc.288.1702466701283;
        Wed, 13 Dec 2023 03:25:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id cw13-20020a170907160d00b00a1c9f65a31csm7602722ejd.4.2023.12.13.03.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 03:25:00 -0800 (PST)
Message-ID: <8745cfde-57d1-4b08-9020-bbec9b9c7fc1@linaro.org>
Date: Wed, 13 Dec 2023 12:24:58 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtk-xhci: add a property for Gen1
 isoc-in transfer issue
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Macpaul Lin <macpaul.lin@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20231213063543.12435-1-chunfeng.yun@mediatek.com>
 <c1bc144d-07d6-422c-8294-42be47f83e59@linaro.org>
 <5327b2fd-94c6-46fe-b987-52cfff042033@collabora.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5327b2fd-94c6-46fe-b987-52cfff042033@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2023 12:17, AngeloGioacchino Del Regno wrote:
> Il 13/12/23 09:05, Krzysztof Kozlowski ha scritto:
>> On 13/12/2023 07:35, Chunfeng Yun wrote:
>>> For Gen1 isoc-in endpoint on controller before about SSUSB IPM v1.6.0, it
>>> still send out unexpected ACK after receiving a short packet in burst
>>> transfer, this will cause an exception on connected device, specially for
>>> a 4k camera.
>>> Add a quirk property "mediatek,rxfifo-depth" to work around this hardware
>>> issue;
>>> The side-effect is that may cause performance drop about 10%, including
>>> bulk transfer.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>> ---
>>>   .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml     | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>>> index e9644e333d78..b8ed68574ba4 100644
>>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>>> @@ -124,6 +124,16 @@ properties:
>>>         defined in the xHCI spec on MTK's controller.
>>>       default: 5000
>>>   
>>> +  mediatek,rxfifo-depth:
>>> +    description:
>>
>> The property description and driver patch suggest you configure the
>> depth of FIFO, so this should be not bool, but some uint32. And then,
>> use generic "fifo-depth" property to set desired depth.
> 
> Did you mean "rx-fifo-depth" instead, as used in net?
> This FIFO depth parameter is for RX only.

I guess yes, if it is specific to RX.

Best regards,
Krzysztof


