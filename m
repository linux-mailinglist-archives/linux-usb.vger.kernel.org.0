Return-Path: <linux-usb+bounces-11574-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4081591453D
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 10:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E10A3281631
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 08:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EB384D03;
	Mon, 24 Jun 2024 08:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EG5/4e10"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E383649656
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719218831; cv=none; b=p3TybkSEzI8oKhtGKqLPeYNyQ8/h4ipxkifuK6EbrAZprLJEyg14dhMmseoy2J5HIyjdZXGcZVSUuRKemeij18W4EFhvqttGed+wQZI6bEzF5+2ljl81tX3cYgGfoRJCCjPm2PiS/MfKXcdoxV+bU8ajPQDcv9HrE9VedhqaMCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719218831; c=relaxed/simple;
	bh=eU4nMjyHqP9lDtrgeOyiukYnith+es5NNEOJEiDek94=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=D0958MeA+yS8WDoynL7H0SHfh4JFrNTWM7RC6npOqTkY702vqD5o/DeKg4VBDkK4tCQrgB3h26Z0eBNvKgrYjZa53CxRdZTYTh5/PzrJPFYOTU4J7MT8N38cflFuSrnsipUsudVwFhRSFFBpW+KX8IFhvzPCa116LpxVTLnhLiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EG5/4e10; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-366dcd21604so1389095f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 01:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719218828; x=1719823628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOmYUVm2j5km1qbX8I7OKBLBGe3knpV1YYtkOnv6f2g=;
        b=EG5/4e104hxgK4TG9b21b3m/kMAtjo0PuxsDvCBo0WoilKkyKFuKKyE1Us7/Hue5rz
         EFFGCMOQ/bb1PC4eePJdcfHUsELm1/E+p8Gb3Iqjd+eDXbMGutlhAE3gWkDLJ1MouDHa
         hWyNqGvV8IikKgIDVYjjaJNvmwpj93l+pkkMcK3YCrOp5uz/enOAHn+n5aegYeBv3OSY
         4S+nEHh3WYeK0caBRTdWPl6O9LaUKWcI5BWh91dquDRRwk6nHVJGM8m6nJPYL0rHp+jF
         7FSz6daspcE8rkQqVh4QDZd+wGxBF0nQMyLwSzyoigtliZrqKIQV6+C4LZTTxH+HErhR
         xIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719218828; x=1719823628;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IOmYUVm2j5km1qbX8I7OKBLBGe3knpV1YYtkOnv6f2g=;
        b=eI+dr18Baak1dXGICHoA+5SAPUFlFb42LnhVm1bIM2YlSYUF516y5N58Pt8KTwl+XG
         MgwzM9qdQ7OJAHXYY1KEsSeLbGxQqV3b7hvffOMlbTz5hE/zXi+OOmRmW5mQN3oFu9bV
         Hq1Rj9tYbAVkzJhaL6FXAwtd3byTfbWiLRqnIILyaDcSG9dTuoTitnsrz/YDTXuW7Vho
         rwurpb1Mm7kLciPoGt0c4ZYp6JZRiOgLglEIzvTbYqrk5xZFcoVOBqaVIRx+bQt6apCJ
         AKSun9AM7pPLeJV2HcUNMYO+UPlqMLICrgHyXvyzIbU/CoDx7b/fr/LMQa5GSPPgJOVr
         G+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLfMTvOxFjXaTQvMG1AkoMSADydc4W0Tt5VP4U2Q/xi9akj+m4G0V18REgxPiCpKa3geJYyq9i71ecpcW2KidPrZaViX3PlvBu
X-Gm-Message-State: AOJu0YwNSzV9JRjX6TGlSR0m+OX8jcUumk2Z58W0FDfTJL4ApPU6Pglz
	sT+BvurQOJMLmJV/JrrJPEaSldQFl3u60lEwwNSIf04SXVTb2BZEMFk7nwMWQ64=
X-Google-Smtp-Source: AGHT+IGZJ3/lyvL7w/mqQEND7dQl87CA7HzGwlUkfTzI+v57PMUoZkRRQtioHBzH3/TdjiQ7LrRo4w==
X-Received: by 2002:a05:6000:154d:b0:366:e7b5:3b49 with SMTP id ffacd0b85a97d-366e7b540a8mr3975443f8f.54.1719218827851;
        Mon, 24 Jun 2024 01:47:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74? ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366bd575f6asm8741077f8f.6.2024.06.24.01.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 01:47:07 -0700 (PDT)
Message-ID: <f1cc92b9-44ac-409b-bedb-95bc4908712a@linaro.org>
Date: Mon, 24 Jun 2024 10:47:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: usb: dwc2: allow device sub-nodes
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240605-topic-amlogic-upstream-bindings-fixes-dwc2-subnodes-v1-1-915893e0cb20@linaro.org>
 <20240606004001.GA3525173-robh@kernel.org>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <20240606004001.GA3525173-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2024 02:40, Rob Herring wrote:
> On Wed, Jun 05, 2024 at 12:01:20PM +0200, Neil Armstrong wrote:
>> Allow the '#address-cells', '#size-cells' and subnodes as defined in
>> usb-hcd.yaml and used in the meson-gxbb-odroidc2 DT.
> 
> Doesn't referencing usb-hcd.yaml instead work? Or you need
> unevaluatedProperties?

Yes unevaluatedProperties: false does the trick

Thanks,
Neil

> 
>>
>> The fixes the following:
>> meson-gxbb-odroidc2.dtb: usb@c9100000: '#address-cells', '#size-cells', 'hub@1' do not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/usb/dwc2.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
>> index 4f36a22aa6d7..9e737f587664 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
>> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
>> @@ -177,6 +177,13 @@ properties:
>>       minItems: 1
>>       maxItems: 2
>>   
>> +  "#address-cells": true
>> +
>> +  "#size-cells": true
>> +
>> +patternProperties:
>> +  "^.*@[0-9a-f]{1,2}$": true
>> +
>>   dependencies:
>>     port: [ usb-role-switch ]
>>     role-switch-default-mode: [ usb-role-switch ]
>>
>> ---
>> base-commit: c3f38fa61af77b49866b006939479069cd451173
>> change-id: 20240605-topic-amlogic-upstream-bindings-fixes-dwc2-subnodes-4a68ead79624
>>
>> Best regards,
>> -- 
>> Neil Armstrong <neil.armstrong@linaro.org>
>>


