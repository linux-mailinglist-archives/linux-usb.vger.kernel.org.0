Return-Path: <linux-usb+bounces-28823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EADBAE583
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 20:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D967416D95A
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 18:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518F5271A94;
	Tue, 30 Sep 2025 18:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lXbcCMZk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DC322126D
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759258100; cv=none; b=u1nhziZM70QmGL3xyICRubf78WSGwjqs7Vdn3XQ2HRDIxR8cHPwfNjHCkuXz7N5RGYWu9xl8nZbt0weHGf/ZcPNZYQathkV3dOmpQ5cil7wophwAd1vVz0SX+YfOqLv1d+CRZ8XupVB7fA91mpP744SGDhgY2DezvE04NmKg+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759258100; c=relaxed/simple;
	bh=AkSZ2p2ipyMcwGlPDAvkNQcfgzKLfIjz9ybYo7uFpDY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YCojlz4SMU53a9O2h4CvsiXp+s5T/nVb8XlEdtjWawC96+B6ynk9sYUSlHyrm4DjHxdYs5LvuHo6noq5KG9v1ut7dZrs/GhLJ3b1KMLMPCudPtHKPEJZPHNpKqtCZ361p9PsKWFcwVEyo8ku1jYbsdebeEcyRx+2UbS0UIM/0CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lXbcCMZk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e52279279so20247655e9.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 11:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759258096; x=1759862896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffgRfYtnm1HKc4tZUZavEotYf7CHOSNEIdJwn2PiGvQ=;
        b=lXbcCMZknREsrO0Mtv0yPYP13BJVVZ2gkmpfkDKw6p1ZzRMiivZOqT09U4l28iNtxU
         3iKpihgtEh4t3amIpA6sefYQe4qyPpsEonzquIoeSVXlkHyvp2hSLg9MiT20De8d5rw/
         1l0ca3tj/lrZb29j0KYyElE0vBbucFWTt74e8ByCdG+JdRHArWmqOlrqE6RytaC3zfhD
         GNmZezOs4Olu61uBpdonmVG2c/PCm3walosz2XHfaGw7nHI0z6Lib4yc+TuERuTAd4py
         QeVFk73u5ro48O3P4WWo7uG7X6o1NR0Z6I0RY0v83MMNsrcQRl5NzlAv4e2tjK/fXo4x
         bglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759258096; x=1759862896;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ffgRfYtnm1HKc4tZUZavEotYf7CHOSNEIdJwn2PiGvQ=;
        b=e0u+st0WFfFR6OQekdI63OtuZFYkHXIcJQsmTfCU5qw18Y0MddzclvFMGAkQyRL4xK
         TreiQdD6INEvE6fLhVVbWFOB+olBdbXAeiEkkL/0ae6synTlVAs5nNwPf9BgsoaWSb0Z
         RDr+Y70ZMbgvV2aG6gl/+5iZA2GhSdZ2/g15ST05078nb846/KAOGB9tjMoUlDxDbWrd
         VLXFBD/kQXGipaBqs1MXZC/xbjYJGCKse6wWsBC96jPiItKvsbyo/R44meSIxwZqjC/p
         JHlGNBqLA90S/RYUU1KvDbPnkdRs3LlmxRwwnwh5cW/a+Z6mTentIOI091cghTcuyjUt
         vhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX14tpErigrEtWVy7ziMKHQ8wyo3VREMoKm70NJNkwBClQONVrI6hcgUqOooGLoLJOv+WfGZK2vcEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+JZsDcVC2EDP4TgZ+cNOwyHAaB6VQO7ZPWvuR+qD58vVEOFw
	3n1drJQvktNI+xJvidKthy28Sxnras+cYsPalSpfKZkaoIyDeDB4xJuqtz8gvywpzaI=
X-Gm-Gg: ASbGncunmpQ+lP5oIc0h9Xj3ECiWNJHH/vTC6uVjAf7GYqxPiNwiFl+s6IiRu01sqBV
	uc5WvlFI0pX2AtOp595LtSKP6xHZYqSUpZWZYxbR8gBXgOvPamMREcXw8d0RsLyRK4IImsLvbeP
	r9rw+1z2K0PtZ46GrO8dT5n40z0M8iJiMh7Q8OrsFIyIMmapzxaOQ+HtYQttwAnNhEgjX5Jp14u
	RFiZOoc4nHzAKw68oT77qZGjKPz7KZCDiRILPGbpw0iup2z4e1bW9KhwTb1LwE7NqateJ97dMkX
	7YX7xHhW5TvKVIbUMU38SOKXYMJlaMP2gJYOLHafSPwfWn4IFbV3/h0rmd0p7Glo4KzV+ICFTNr
	DMZsHMwiyc5JMoXgcwbijVTc8GRsYkaD8CPlC76PB7WNJcYbmiHKGxBPzT7Cp9jBuwgKhy+zUqe
	EcvYnD9Mek2HHH9HfZuOuzBmg=
X-Google-Smtp-Source: AGHT+IEYI3huopKWdfDQEJir5e/rv3rOBRHS1Emu0fC6ieyMwwYyTSg13GLpRz3qoAuTqhlVIXzV/Q==
X-Received: by 2002:a05:600c:5303:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-46e612192ecmr7706325e9.13.1759258095988;
        Tue, 30 Sep 2025 11:48:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9459:14e0:525e:d859? ([2a01:e0a:3d9:2080:9459:14e0:525e:d859])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6199fb54sm5013245e9.9.2025.09.30.11.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 11:48:15 -0700 (PDT)
Message-ID: <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
Date: Tue, 30 Sep 2025 20:48:13 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss
 <luca.weiss@fairphone.com>, Abel Vesa <abel.vesa@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
 <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
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
In-Reply-To: <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/25 20:43, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 07:17:21PM +0200, Neil Armstrong wrote:
>> The ports definition currently defined in the usb-switch.yaml
>> fits standards devices which are either recipient of altmode
>> muxing and orientation switching events or an element of the
>> USB Super Speed data lanes.
>>
>> This doesn't necessarely fit combo PHYs like the Qualcomm
>> USB3/DP Combo which has a different ports representation.
>>
>> Move the ports definition to a separate usb-switch-ports.yaml
>> and reference it next to the usb-switch.yaml, except for
>> the Qualcomm USB3/DP Combo PHY bindings.
> 
> Isn't it easier to make QMP PHY use $ref for port nodes instead of allOf
> and keep ports definitions inside the usb-switch schema?

Rob asked to not do that... see https://lore.kernel.org/all/20250905175533.GA1000951-robh@kernel.org/

Neil

> 
>>
>> Reported-by: Rob Herring <robh@kernel.org>
>> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
>> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/phy/fsl,imx8mq-usb-phy.yaml           |  4 +-
>>   .../bindings/phy/samsung,usb3-drd-phy.yaml         |  4 +-
>>   .../devicetree/bindings/usb/fcs,fsa4480.yaml       |  1 +
>>   .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |  1 +
>>   .../devicetree/bindings/usb/nxp,ptn36502.yaml      |  1 +
>>   .../devicetree/bindings/usb/onnn,nb7vpq904m.yaml   |  1 +
>>   .../devicetree/bindings/usb/parade,ps8830.yaml     |  1 +
>>   .../bindings/usb/qcom,wcd939x-usbss.yaml           |  1 +
>>   .../devicetree/bindings/usb/ti,tusb1046.yaml       |  1 +
>>   .../devicetree/bindings/usb/usb-switch-ports.yaml  | 68 ++++++++++++++++++++++
>>   .../devicetree/bindings/usb/usb-switch.yaml        | 52 -----------------
>>   11 files changed, 81 insertions(+), 54 deletions(-)
>>
> 


