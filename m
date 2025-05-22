Return-Path: <linux-usb+bounces-24232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6077FAC0C21
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 15:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 169ED500C12
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 13:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838F128BAA5;
	Thu, 22 May 2025 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A5RRdEs4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6A528B3F9
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918913; cv=none; b=Hy9Xn/7xL70fA0tFx/dFZ2stfAROQh/ywFGID/GuxBLUMe3HkD6bDhtsK6TW04WtsvG/VkQVTqYgTQkdmTkNuwEZ2Brx2W2WIw5/1WOnEIWTTxBW0pGX3PhbvtHDQA4/pQUnEfIE+vkK1YZmvxBBma26D2/jjhbJ8tQGurrqQ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918913; c=relaxed/simple;
	bh=JzXq7R1XzNG+n52NXGFiyUXFEj1QJzG7yyTpmVmmP5k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TijbcBoYr37mrWY+VUvb+/eB8eZOBgXpf3+c/BV32WXGVxbfnF1XdCwlDBj49YfaJmMQST45MqqZx/WKf8TBq/fEs2eW3ISnLNvLb3KNbIkmVICr14WvtLln24pT+qcQ9IH6GWSlLxfzvZIKn+qB10TaUVSFT0/XlL7aYx6eWgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A5RRdEs4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso79509805e9.1
        for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 06:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747918909; x=1748523709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85ibc1rkewyOEAiRREZNyXGvEN9PNRSpUSRlKODUCCI=;
        b=A5RRdEs4QlW1gfeeVKrlkyQdzyhxrOi+bwEFVZTNPr1IUAhh1LngnccerQbqB0X3cb
         lV9GAcNy0BL8dl7A+fooRbZybkvFFysGu30qPWr29Hj/aUOBgZedqHWcTkCjlbu2C6np
         0JOTk7wR9Lgl77qHCnQ7oc/81L2GnV+b1Z7jk+/5pOgPZPUgSQBEzqX79/jWSb6VKK5P
         YHjFQ5Hzb4mQtK2UIHFkaC1/hW4gjjKJ7WITPCVUbnQ+VsDfOls3wbU81c+yKxxESaiZ
         W/MZwDDKlnaFQT18RXyOHQ4OYuRfYBgDBMGgx5Xo2M4kzoUP+wZ48Xzw1K6LemMTdtsq
         sg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918909; x=1748523709;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=85ibc1rkewyOEAiRREZNyXGvEN9PNRSpUSRlKODUCCI=;
        b=LNRb091095ecR4HKS4Uc2zEJKS2stGc7iCxVT3hb58xquoMi6YYCb/vNWrG0lcuAfU
         2XcP/0BpPXShheuMgHGh4EuPJckCgJUInNv7gMGoq6OrCkw/AYIu9UxvvaAAMbBHLfir
         lSQZoOneU2R4hHi65Ktv687hiTEkf/DldwijmdWHgRmt2gfA90KNWiW++lt1PjxWrwSq
         wju/L0+T/8fQSdy4cartman0hZgYIi6x2v/ddREDqxHXbYcfWKm0jy1QRbc+wL1uwwh8
         BSwpLyEtTWtP5nRyhR6Sp7kwbmID3e2/3IMteNuHkQUJT165rJ0cvyIM9nN+e7ClAgWO
         741g==
X-Forwarded-Encrypted: i=1; AJvYcCWvWKXWYtV5m6FGqF4qspUPElcyIbtIxWWp3Ro4g1NA3P+w6TW7nRTtjTzAveQvRCI9u159sFjaRQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKT3fcnYxjmBCR6dECZe8y48JZQ0oWbZ3hkJNmwcsWKnnkZSkR
	oovyfB5/xvyVnwFl6AanlfV2z8gl0yYDz8fnP6C30Py6eZxSpBxY+OP7TvFxOx5QSUU=
X-Gm-Gg: ASbGncvhEfsQKrsGJr1egvg2mnklVKpsPTVS1bF4BqNbPQQogNwNCGG8ML90uTxTx7Z
	m8o3/s4XmETfmDiCw7bEUR/BI8DpVVJwzRy+0pqHT7w72LUSwtqN/L/oeSIDj3N5pmYw8hH6w9B
	MokSNjMDcaEX0InpIZPEcaGg2sJJP1tkSfk9anD5mVD43QgGi304Af5RzwsRL2PWFA87DwwICj9
	Ldzc8x5Y29MbRQmkoU1EwSlMXeDy7T/IedePgLkECPnpUVoMArfnBIBUZI7yD0vuny4eWgEtLbF
	Hb4z8w9DKSmAg3McP/YCxj+5yIZhL0P5MMgShs4tXKqiptrh9gINMmXnlpwCf1srb3Shf1/PpCo
	kQRszutul1pQciOTg+2eBeEfnwrFF
X-Google-Smtp-Source: AGHT+IHDLzp25O1ERi2RnsBspAgj744QxUzZ/p26j4iE+yXlctI30IYPkhdc03KeFWm8NECKoIveHg==
X-Received: by 2002:a05:6000:2407:b0:3a3:4baa:3ea3 with SMTP id ffacd0b85a97d-3a35ffd2ae4mr21161771f8f.41.1747918908611;
        Thu, 22 May 2025 06:01:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5? ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88a34sm22855531f8f.70.2025.05.22.06.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 06:01:48 -0700 (PDT)
Message-ID: <94245ae6-a28c-4a37-a3dd-9828bd95c094@linaro.org>
Date: Thu, 22 May 2025 15:01:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
 <aAswZg9s41s/m/se@linaro.org>
 <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
 <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>
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
In-Reply-To: <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2025 14:18, Dmitry Baryshkov wrote:
> On Thu, 22 May 2025 at 14:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 25/04/2025 08:49, Abel Vesa wrote:
>>> On 25-04-21 15:00:13, Melody Olvera wrote:
>>>> From: Wesley Cheng <quic_wcheng@quicinc.com>
>>>>
>>>> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
>>>
>>> Nitpick: Drop the double space from the beginning of each phrase.
>>
>> Sorry, but why? That's a correct grammar.
> 
> 
> Being absolutely nitpicky, this depends on the country. In some cases
> (US) typography settled on using double space after full-stop. In
> other cases it's a normal space.

Ok just discovered it's a thing:
https://en.wikipedia.org/wiki/Sentence_spacing

```
Magazines, newspapers, and books began to adopt the single-space convention in the United States in the 1940s and in the United Kingdom in the 1950s.
```

Neil

