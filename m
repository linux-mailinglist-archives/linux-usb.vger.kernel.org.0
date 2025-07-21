Return-Path: <linux-usb+bounces-26059-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D7AB0CBA2
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 22:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC1AC3A406F
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 20:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CB723A98E;
	Mon, 21 Jul 2025 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="merfMegC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D9B23B635
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 20:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753129064; cv=none; b=LwtRLj9jSjDshyNgyRy6qJXbilsc2pINZ8NpUHcCAtDVoh87fwwMIF4x4afRZEerv1BVNrWuz4m4Zd69ibOceVAojsAcvStY31XL3jndMbO2Xkcm9hYK0N3EXWLjaouYJHv0jkG5aQBXHmIebWF0SRU25WL+aSf9tcghLQphSpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753129064; c=relaxed/simple;
	bh=qNMjXYg7gSvi1w4o66Q/qp0UaJ/AUdAOz9hXwpFbNPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IuhJio/PYLVZORZCh8aRAjjf9pgYLnbbyNehGu+gQJzQdnHZnvjOJvyfg7snG3qaAoj98XqdsikaIDN72mdFpdLqUzTduGP3jl2dnRxRs+Rk/voPxPa7LejVyv6blQ5QA0pZk3CMzdQlS7GPpdBV/iTG2E7KS968LWEtxYqDzNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=merfMegC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a51481a598so2542568f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 13:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753129061; x=1753733861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dM8V1L459ePaBP5oquLpSUwSE8BaJwvLWNciMOJOtaY=;
        b=merfMegCMYwWsN27o6ZvoKAxuiIDUz2j+UCUcAXwR4cjDZzRxEDJXuNcS09EE58Wlx
         rCQ2CjyTmdx6FINi2LCktDlVkhBg4Zhqx26Ph9KeelPhiICTgvckMXLPGGzPMLLTy5dh
         xlhFsq0nJq7x5dHhHotX9tnvk5jBzpR+ubTOAUId1ewM100vMauN/LUJIxo+dSwWmkLl
         ZK/U647XyHymDEKFHOgW0iUl/gWtu+53kCixSGvaBdX9GtRmh/oaKEafGa+oW15I0GfU
         TtWx8KAD7MrLdTTa+G7U/FL6VmAZx1O8OYTkcbmBgUadq7MO/oM86zTmrvNKkjjZiEoY
         bAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753129061; x=1753733861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dM8V1L459ePaBP5oquLpSUwSE8BaJwvLWNciMOJOtaY=;
        b=MDDgEpRCUuZPRzc8l8U/D/7/ZT2fKmGK7LeR0Q8sN8+DixKFH2LJ4+62G5WdngLUDM
         Wo009+AE7YFgfBe4/ipk8B+9NhUx+xduELDbUl8IcfJ+M7bk7BYpl7lQSXKOlT+h9cpJ
         j3UKAkDGPXWHavfEtB73WLJ/RzT5NQT39ywnLmQWIyuiKwJq7nlu8BIaGXXNKyH/aYxc
         HGZyKx6COVeoj7SpM7jWLeXWPMtkN6L3nYe8Id7FUHEf6K1Ll3QmM2m1H874sYrr1/L7
         v+GiybT8LaWmCng5p0VP5ajsLxyGWvf/M3ElTWg1jPsb9Tr822uMsGYKbCXmPF8kTOaj
         NUQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPD7kNSSVhH+Vn4EwIOJ9wS8C/Uq2HIBukEH4DMCj+CU2S0hMUpNqL86+xMMi3zRbOe9tHWpmJhkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUlPhgjsQ6G6bCROyFYKHZL0ovOa6Klt6zBHTwIRr25dIYkbvl
	3wlVbQchyKWXZWSXyWp6wqZduYGJAJhnIbJ2S8OY56ZZ+qf08/342NgKgkpoUavgJQ4=
X-Gm-Gg: ASbGncvfd/qQFSBY0d3SCj2YKjFC5Diic122IJIgLZKyXD/8h6qthdNWEdh1W8E/i5b
	Y0LOfd17hlpnt8Cz5xQ2oej2BREY+bQTD0JmSKR40oi9cerdB4FyDR7WgPxQGPw8gUA1jz0dTEi
	DxKmGM8AKH95VeZmN8vozpRuaHOyibillQphZ+a7p4VfU7ygsPUH1VMsShroNHM+UTVCaJMCJj5
	MLKMDe8FXtJatFFetO3OdNJAbY8cm9K7KDPjA+Y+hBFRBOzMjJwPtWy6C+8sC1PgX64T8QWRYmA
	zk2Zj3zVOwipe4vXrwXDPc790imt6X0oGuiRUngN9sCzag7moZF9vF+01pi0F8r3e7L1rzjhwGY
	qbRA4jVPkVUvSRzsMOxqkcFKVyjctRJyw7MgmyL0NvC1HTXSSj7r5soUl8ReUEaj4ahLDwZjfg5
	qV0UQ=
X-Google-Smtp-Source: AGHT+IF62Mz23f/3FxKSXRlhY6X69Vv1j/s22nJAkdHPupT9WjDcJMNWjSNh7x1kPOXtrItb7cZ4Dg==
X-Received: by 2002:a5d:64e8:0:b0:3a5:8a68:b839 with SMTP id ffacd0b85a97d-3b60e53ee0amr17139819f8f.45.1753129060690;
        Mon, 21 Jul 2025 13:17:40 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:abd:1f99:991c:5b07:cd28? ([2a0d:e487:135f:abd:1f99:991c:5b07:cd28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca4894asm11444490f8f.49.2025.07.21.13.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 13:17:40 -0700 (PDT)
Message-ID: <8792778e-1fe6-4eff-9328-767ed38a1583@linaro.org>
Date: Mon, 21 Jul 2025 22:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] dt-bindings: thermal: tegra: Document Tegra210B01
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250714-t210b01-v1-0-e3f5f7de5dce@gmail.com>
 <20250714-t210b01-v1-5-e3f5f7de5dce@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250714-t210b01-v1-5-e3f5f7de5dce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/15/25 06:02, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the compatible string for Tegra210B01 SOC_THERM
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Applied patch 5/17

Thanks

> ---
>   Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
> index 19bb1f324183bb22bc75630798da67fc834920b8..cf47a1f3b3847d4a0371d0bc711638fc5e3b6cd3 100644
> --- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
> +++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
> @@ -21,6 +21,7 @@ properties:
>         - nvidia,tegra124-soctherm
>         - nvidia,tegra132-soctherm
>         - nvidia,tegra210-soctherm
> +      - nvidia,tegra210b01-soctherm
>   
>     reg:
>       maxItems: 2
> @@ -207,6 +208,7 @@ allOf:
>               enum:
>                 - nvidia,tegra124-soctherm
>                 - nvidia,tegra210-soctherm
> +              - nvidia,tegra210b01-soctherm
>       then:
>         properties:
>           reg:
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

