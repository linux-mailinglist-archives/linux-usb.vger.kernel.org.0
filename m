Return-Path: <linux-usb+bounces-1678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EA67CAB89
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 16:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE861B20D64
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 14:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BF827ECC;
	Mon, 16 Oct 2023 14:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZVhLTHNm"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A2D28E10
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 14:32:59 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E459C
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 07:32:58 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32d9b507b00so2870821f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 07:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697466777; x=1698071577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MirTTMDBF2noGg1AFEV5Zt62GQyR/ng5/Y330ynh3s=;
        b=ZVhLTHNmvvCnlbKyQw7z1zpWq8NqJtZFaqCSVm78GH4TwaBWh3WFJ+Ul08VvznjCmM
         uGisGLIiK9t9buOCwZg3YJsoKZjcGszWrB6p52W4Kv7ZX3Nb2hjHblKc0LzVwreK8RkU
         e/z2mn1Mu50BCeGkI53ls2vPsRptgzYnWotoHynlRla66AllofWCEa7T54h/h1MS3+Yj
         /zR8UzBnl6Yw9evCLqOxyNBCDbeas3aXLI0RFCuXLp1cUK7oniQlhJGdwnjSZZDNHk+D
         leQKQHzdP3zDiA09HoRet99zN9L6/Dl1JgOoSaKvGecslHAM0I5Ct7NhxCQN1MfALOxh
         Q6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697466777; x=1698071577;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5MirTTMDBF2noGg1AFEV5Zt62GQyR/ng5/Y330ynh3s=;
        b=wO2HxHuI7NxaVpIEHXKuQ78pJr2evnLvVynTSJcSlXOblf3M+MKfRN6Gy1oURVqHhr
         e7hWptdwSjECaPxUP4K0W1wfvnFzF6XkyZ0h3wOLxYH40DmZAHhs7YbD6Ry+raQl0utH
         rAnLOViMjJKICMI9vjx6Ka2Fwy0V/YwpempB1nEQL8LLZ3QTTKlAG6k448qJF6+iyNSG
         VB7Cu93jg3AnT66xX06qdgF9T5jVqMiQBjlyJlv8jhjFfvX/6cWr+9aiGsxAXp66rPYX
         cPAqXU1k5D3UUNWeqI2qc+aLDy0UpkgBa3Z72OgCFZzTS6NjYK/bV8zsw0vvo8TuLSCg
         dKAA==
X-Gm-Message-State: AOJu0YyFfquRoi6MK6lMrNDt/qbnidb3AhkHTp+ssliBlPDf3UFqsaPN
	3FJlbmtRLmRyfddg8yZ3171x8Q==
X-Google-Smtp-Source: AGHT+IFk0Upybw+CNBvkb8f8bHryxWmhv+wiTfTAiv3+xIUVY/TgT74Vle1GgSWRTpx+Q/RrDa+FNg==
X-Received: by 2002:a05:6000:709:b0:32d:b06c:80b2 with SMTP id bs9-20020a056000070900b0032db06c80b2mr3538892wrb.0.1697466776794;
        Mon, 16 Oct 2023 07:32:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b5ab:4a16:fd45:8130? ([2a01:e0a:982:cbb0:b5ab:4a16:fd45:8130])
        by smtp.gmail.com with ESMTPSA id bx7-20020a5d5b07000000b003232f167df5sm1845522wrb.108.2023.10.16.07.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 07:32:56 -0700 (PDT)
Message-ID: <323ff7db-0963-4e63-94e9-551540dd6490@linaro.org>
Date: Mon, 16 Oct 2023 16:32:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: fsa4480: Add data-lanes property to
 endpoint
Content-Language: en-US, fr
To: Rob Herring <robh@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20231013-fsa4480-swap-v1-0-b877f62046cc@fairphone.com>
 <20231013-fsa4480-swap-v1-1-b877f62046cc@fairphone.com>
 <20231016142256.GA2754674-robh@kernel.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231016142256.GA2754674-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 16/10/2023 16:22, Rob Herring wrote:
> On Fri, Oct 13, 2023 at 01:38:05PM +0200, Luca Weiss wrote:
>> Allow specifying data-lanes to reverse the SBU muxing orientation where
>> necessary by the hardware design.
> 
> What situation in the hardware design makes this necessary. Please
> describe the problem.
> 
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   .../devicetree/bindings/usb/fcs,fsa4480.yaml       | 29 +++++++++++++++++++++-
>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
>> index f6e7a5c1ff0b..86f6d633c2fb 100644
>> --- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
>> +++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
>> @@ -32,10 +32,37 @@ properties:
>>       type: boolean
>>   
>>     port:
>> -    $ref: /schemas/graph.yaml#/properties/port
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>>       description:
>>         A port node to link the FSA4480 to a TypeC controller for the purpose of
>>         handling altmode muxing and orientation switching.
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          data-lanes:
>> +            $ref: /schemas/types.yaml#/definitions/uint32-array
>> +            description:
>> +              Specifies how the AUX+/- lines are connected to SBU1/2.
> 
> Doesn't this depend on the connector orientation? Or it is both that and
> the lines can be swapped on the PCB?
> 
> Seems like an abuse of data-lanes which already has a definition which
> is not about swapping + and - differential lanes.

The FSA acts as a mux between DP AUX, Audio lanes on one side and
the USB-C SBU lanes on the other side.
_______          ______
       |          |     |
       |-- HP   --|     |
       |-- MIC  --|     |or
SoC   |          | MUX |-- SBU1 --->  To the USB-C
Codec |-- AUX+ --|     |-- SBU2 --->  connected
       |-- AUX- --|     |
______|          |____ |

The SBU1 & SBU2 are connected to the USB-C connector, and the actual orientation
to the connected devices/cable/whatever is determined by the TPCM and the MUX in
the FSA4480 with be dynamically changed according to the CC1/CC2 detection and PD alt mode.

But on the other side the orientation of the AUX+/AUX- connected to the SoC
is not tied to the USB-C orientation but how it's routed on the PCB.

This describes how the AUX+/AUX- are physically routed to the FSA4480 chip.

Neil

> 
> Rob


