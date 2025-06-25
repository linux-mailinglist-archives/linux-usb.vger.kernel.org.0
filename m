Return-Path: <linux-usb+bounces-25092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A1AE7EA8
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 12:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A1A43ADB5B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 10:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C805B29E0E4;
	Wed, 25 Jun 2025 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c177Yd7A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845B827FD46
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846101; cv=none; b=S+EvJZP9VBeZOKY/FXXmRQPDeWdhu0RI1r37x6QVg5paaIbiE+NbabLkrMhh3YLhguhOigL/35dbSIWpyBVAowkRaf70l0pRj+jUXRYxKG9uAin9/aByKfIBVKH1rHkZK1MHmyECCovHRT+VC3umR2EZFrrvNhA8Z0ERZTloWnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846101; c=relaxed/simple;
	bh=EnhD8mOkb8vGwBuN9rCeqH+YO0Rg5V/a885XDSetZww=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=McK9KyzOy+usa93ZA4AynpSo0WcpvZOg/PMgCg4cGqRMN58tbX3YaAuxP+TNFDi4KuLYo9XW2GtqkL5OKs855sNqS4mTry1Qkfa3tI40Ddc6LV4AULm/M/XoUxFOR8xi4Lf7fHbuqbKxeX0SjYF01PTB9XIpRpqtvy88L4pxZHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c177Yd7A; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45363645a8eso11306495e9.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750846098; x=1751450898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+k3DzyWH4Jr6uupx7HYmyik+quFvCWjaPQqy+deeO10=;
        b=c177Yd7At+eundCYnnuQlx4eRg/pGxSCJ1PEG8P+R7FdNUFBp0uZhGduviJMSa24pl
         Pgjz1pnY4EG67edrNGTRYlyJML9QFS3W4NGTtb6mV/IKaqF/OolBe3mru7g/k3UoWxBN
         rl+NrfiyEpFdjyW2TVtgjUXidqbuRKWRFbTEPyiGT3MuJ4d+vo+DyhWKrMuCBXXWVjtZ
         LrJtSmijZxjTvWz1QjuHgIeFRVeWO4a8T4kn88lHKnl3wmLeujrV2/XqV2LvrxRj6H35
         PzWBTP9c/2lUqN3my1W2irs1ZXOsrY7hUogQLKxMBeg7hmcGlfSiFg9OeFBl9tzbe5Tv
         s8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846098; x=1751450898;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+k3DzyWH4Jr6uupx7HYmyik+quFvCWjaPQqy+deeO10=;
        b=q0o2PeepKUpNgfUFSoWk0PRilfyCWKh4GmmFHSdnjj5W1txnySUIRzfSRlRuP1FtS6
         bo0mjI0IPJxf2Vcw1GxzQIXkMncMDcbVTZCpDbN6VzqLvLl1h2BZ/nsVBMwwy/N3j7X/
         ZUs4DgMLme27qVK7vciv1azLRt/bL6hiP9kV6i5yTB0nDT8O9BOiC2SlJrIS31JbDrEA
         tKG7rfS++fOAZW50efGbHZST7M5IBr4hRYPiQtTowFAV7TPDbMOdJoylvGOpadNH5CRa
         dFDNwvKvHxPdpYD6Fu8Vh7wAPrs2Iz2UXBrxc8ptw6bnfG44oLGY3hNJPoLEQBmJIQwo
         e5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXpAxR9UyK+T4M1Y5E2bMWS2FqzaId2gSEnAeyw6qnqFdCV9jiizDZjThVXv9jHVJ9Ltc00SBR840=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxsoFsacmqZZwjs5eYpyqNLUkOrrhlKXm9YRzjkpdkquy+bMmN
	Jdk7gFWHvuEmSJtQXoz8IBAaswbIpSd2SCJc7CxRxHGFTX4vPFwUQjcpPPaBv5rZ1nV9BNmnjuS
	m8ex/BRM=
X-Gm-Gg: ASbGnctQKtN00RN12mzR8WySGdFTYO9MLETLiOMwqkHeUAK/UMNVfQjQKDjX5EinknY
	6nT3hHUtz7H4UP2iiVaZ4mx20XwrtdgYiVBo72WNxmd8M7PzZIBicE1mBEBetdJp5ED2twHos7a
	hjV6peMmnxCDujKV6FdWkz/EgrQJk79aYbIC6XYCK4BKgUtieGG1konpePgbRP4uG65nOlBPyEt
	6Fycl5Bu1Ul5xu2+NgjSfSmUQkIZu6jf2xQFowxw1bPiVRJzjUfgWvdpJMKZDUqofJHq4Y8TNNs
	vzOTuHlgYl3Z5ToJBM2+EgWJQwEmSLtLvslrWO23QapcS+AMDPLc3zyzu8fM4Io9xXPemqDfLj6
	fxHW05UxcJsUeu1QcqqrV+ebrxiTMTah9UGZd
X-Google-Smtp-Source: AGHT+IHE2dgeNi21VwtuCTw9LobXMX+5LWnzJekdeuK7dtjJ4RTE1kui3tw6ljIYJ1F6E+CxyZr0zA==
X-Received: by 2002:a05:600c:4e0c:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-45381a7651fmr22313705e9.0.1750846097926;
        Wed, 25 Jun 2025 03:08:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3df:bee7:215:e1a4? ([2a01:e0a:3d9:2080:b3df:bee7:215:e1a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2274sm4137080f8f.48.2025.06.25.03.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:08:17 -0700 (PDT)
Message-ID: <38a0abf9-e52f-4e27-8ea2-eb885312a209@linaro.org>
Date: Wed, 25 Jun 2025 12:08:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write
 from init sequence
To: Luca Weiss <luca.weiss@fairphone.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
 <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
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
In-Reply-To: <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2025 11:14, Luca Weiss wrote:
> As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
> sequence is missing writing 0x00 to USB_PHY_CFG0 at the end, as per the
> 'latest' HPG revision (as of November 2023).
> 
> [0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fda3246e09dd39e16e2ab43cd1329
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/phy/phy-snps-eusb2.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index b73a1d7e57b32cfdfbe314ab938ec54746ed53be..e232b8b4d29100b8fee9e913e2124788af09f2aa 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -437,6 +437,9 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
>   	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
>   				    USB2_SUSPEND_N_SEL, 0);
>   
> +	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
> +				    CMN_CTRL_OVERRIDE_EN, 0);
> +
>   	return 0;
>   }
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

