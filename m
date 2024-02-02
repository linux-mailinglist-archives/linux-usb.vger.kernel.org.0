Return-Path: <linux-usb+bounces-5756-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F0A8469D9
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 08:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 695821C264B9
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 07:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9107117C69;
	Fri,  2 Feb 2024 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0L67y10"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF8417BBE
	for <linux-usb@vger.kernel.org>; Fri,  2 Feb 2024 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860504; cv=none; b=bYPI2GQSSONGMUgOjKZGK+KRJB923A8MZeoPgEjQfJVmsUeA8MmR8Jp3gEUtM9h7J6ViarpcMeLE1u94S+h2XrfyaCpLANjyMWOe4rDDgTT+2uACuydfNRILPMWUN7WC+N983hJwHUbNW52JuZgufZmryTruX7rJ+MrizH6pAtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860504; c=relaxed/simple;
	bh=d05QpvGicLD2Mgia0jhT1gvXTtZojRUVJZiL2/TcCE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpIcZl+z8iRRyvWc/Bjc02nc8uH8cRKvVkwKuYLQrmEI/2knK2TOBxFrGsvs81d+xVhWUfN0iHYUNdai6vpVK0sX1XbPXNKmneeGJKGrfOr/IC4HrP8j6nRYoI9YN2H6+ViFUbgqMgvOezFXfIjeCUbsGjtZQtFpogynr533UXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z0L67y10; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a363961b96aso233632066b.3
        for <linux-usb@vger.kernel.org>; Thu, 01 Feb 2024 23:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706860499; x=1707465299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wzq+LiPEbZxoH38h1tvNSw4DIsMFNlTtTCBb84cZfOI=;
        b=z0L67y10Wg/0iWtdYcdBc4JwNXEt633xW+WccsZrgd/wurgQrCe4hlWPljRFO9kp9I
         HeRwcfzMVFVcVkPM2DLlGzk9UtLYzrN+lOopPxx5Lux6WC9PZgg9nGHcTFEzs1Db9ovf
         V8K9iEfk5gSroP+yYmqpctjENz+OM77XcD+3YRnnrFk2s3m8Sn9S+rY7H1vyDN6LbUjK
         Uey3EI6OgRID4ZcdaCV7yw32p5+MZ1RvocQk3U4oGvnY1woQ/eOwfaILun0S5+otVaTr
         jQcKUJIXObRUvwTiHCCMe7mDoBEreQu/L+NejK/aDOsNjMXJadXEpEnS0hGbm8/4zfxq
         pLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860499; x=1707465299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzq+LiPEbZxoH38h1tvNSw4DIsMFNlTtTCBb84cZfOI=;
        b=wcGr8T2Wfkg58s2gnCWzDVSZl5XnxMJ9oiVk1V4rShlklcuNr5O0cd2ZjZfLlonDNY
         2de9ZG8p8I/uFgIbRkJWJgqEZa9rYJ95cI+5XhTqxadrsFj/VgYTBRCQ+U9XVh7v1jt1
         tXopJdb64bzr4io1JXahQjvK6+7bG3RWtuQZsdNGhg4O/gFwd9Fo0eo4JD+Xf3e5im5C
         JUM3A3JOFn26vbZ4rhtwz5en6EFAARe1kOeMjLsgIXKdTjfykt9BA6UPc/JVFoJLe/7d
         IG1ndEWwqiXWwEImvMBZ1B/qxj2sgi/70iLUrgE3x6c80JEzHc/MG/VG+d3nhP7/pXo+
         VZoA==
X-Gm-Message-State: AOJu0Ywd9MJpMMYKuhTh6yVwgGzRFNPOjB5QOKnVbHo1J41EOfTCwTIW
	Wsle95DPmSKrGJzcNiLvzpPyie+8HiMOpGes+6g6lAT3HwO1uYLfQP0p/a0uwIw=
X-Google-Smtp-Source: AGHT+IEYMLDa5cnygUbcoiz6KeOcbygocMht0o+FGAfNtid8bCmRxOmoGmFvbLCh7vusclnJHBhG2w==
X-Received: by 2002:a17:906:4556:b0:a2d:7fb5:fc83 with SMTP id s22-20020a170906455600b00a2d7fb5fc83mr5465191ejq.71.1706860498995;
        Thu, 01 Feb 2024 23:54:58 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUNRMGFzKDWi8rc/9DKT+G+uKDzxGhV6e22srgwPTpFGPZCW++0Tq1cM9kmJglXmDldNqGxbRylF7VjJhBEHLh4JzYUKo6Ao5zZgx7n7bq1BQi1mV2jBL0r7zOztybnUsFQkHu/SNu03c1ysMvuIm5W/Ej6rjFIyUBNBXNDpqha3RhxNlS9JM9S58UOoV2StAdCHEpV4y+oHnCRVCh6LpKhPYBpYkuIMBl+tQC2RrSXvTlhFTrswDHmUgc8t4Bkf44mvUBPDxSR35d3LtOpVMg/6LcbWtDf8syklfNiPkjOMrsqTwXQrdEu1U55yNYBlroKTLP2VQfXhTXCQUlU0UUNhcji5lAOATg8GQdYl8JCmVpwRyjtaN20g0Tk/h2mSX+QmQqHKqAz0/DXzUmkqbEA3ncDm6Sa1bWpKuCaBKOpcFnbU03nFKIiPCTYsrom6UgzJZy+ZuuZOuEiTBl2OQIm6zd/a1BsVQferLE41Dtuk7oB
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id ot8-20020a170906ccc800b00a35d6482fdbsm612246ejb.77.2024.02.01.23.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 23:54:58 -0800 (PST)
Message-ID: <a0134089-a283-488b-8d7f-3f59dd938b60@linaro.org>
Date: Fri, 2 Feb 2024 08:54:55 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] dt-bindings: usb: ci-hdrc-usb2: add restrictions
 for reg, interrupts, clock and clock-names properties
Content-Language: en-US
To: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, peter.chen@kernel.org
Cc: linux-imx@nxp.com, jun.li@nxp.com, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
 <20240131114324.3722428-4-xu.yang_2@nxp.com>
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
In-Reply-To: <20240131114324.3722428-4-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2024 12:43, Xu Yang wrote:
> Change reg, interrupts, clock and clock-names as common properties and add
> restrictions on them for different compatibles.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v4:
>  - new patch since v3's discussion
>  - split the reg, interrupts, clock and clock-names properties into
>    common part and device-specific
> Changes in v5:
>  - keep common property unchanged
>  - make if-then more readable
>  - remove non imx part
> ---
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 3b56e0edb1c6..6ad3582051b8 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -412,6 +412,124 @@ allOf:
>          samsung,picophy-pre-emp-curr-control: false
>          samsung,picophy-dc-vol-level-adjust: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          const: fsl,imx27-usb
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          minItems: 3
> +          maxItems: 3
> +          items:
> +            anyOf:
> +              - const: ipg
> +              - const: ahb
> +              - const: per

This would be just: enum: [ipg, ahb, per], but in both cases I question
why the order should be flexible? Nothing in commit msg explains it.

Plus I will repeat myself from your v4. I don't think this is helping,
because the file will soon grow to umnanageable chunk. I prefer to fix
it at beginning, before we reach snps-schema level of complexities.

Please define common schema, reference in this file and move IMX to own
file.

In any case, please provide short comment in the code why you have such
duplicated if:then:

Best regards,
Krzysztof


