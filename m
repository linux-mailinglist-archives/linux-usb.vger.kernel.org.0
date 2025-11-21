Return-Path: <linux-usb+bounces-30800-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55853C7A60E
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 16:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C4D1D4F119C
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 14:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E522C0262;
	Fri, 21 Nov 2025 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fGDREBdW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3202C15A0
	for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 14:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763736864; cv=none; b=fAzL62uzIlgv52BWLVCMAF36dfAR9xhw3z9AKMgErXsHfhWoCrXFWdhog1Om4PaN8IdGriIQexiP1nyJrW3ZaAkZS1FmkgdJjoSJANyDB3hzw84gfJ9aKPtWYlo0xJJFjm8GdFgiAfX1f5bNUuNLiHnwareWVHmUn2633UTZL3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763736864; c=relaxed/simple;
	bh=AnQKGJnYk4Teekj1tXX+rjwLt+v1iwpKAUDCKgZG7e8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ibt6DkM3jAj0Czz9dJrot0/S/DKKMdLaDwmMvpLA8q0z0x1Pb2RHZN5dH14cS0GdKgOWfLmtWdoT8w23s1NW3DNKYnZIZ0lICmG+ccUmCmREItMUbyulGMs3wIHFSzcZ/j5k5uxh5ChsvV10YtuPsBvGnqmvUQ0IChhl4qvLM74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fGDREBdW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso17372295e9.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 06:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763736860; x=1764341660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETN4gl1iZbhJeLn6OCDI+9u79qwxOMAaoq4ImqB9HJI=;
        b=fGDREBdWIjZ1DZrCzRbYnV1uRES1nzAkKaTsn5tAlzphE/fsfzH9Vq45eutFtNXRlL
         upF9giWDbxGIen86mOPMEgenb++90fp18qTZ5UtZE4PwcUhn2bue/JRQcBL/uADsJUJE
         71EroFIxLBtysSu/OIHGYsdKE451Ua24+qIXdWKJkrneqXnHDecBOVGsBzxR7Rwbl9ok
         f+4GzsuqIuLmhui17UB83T6Ijx16NltVcjY6Kl0SMV7hhW1VevNEFHkiLfQqLK1X11+f
         LGXPPLQjTHNOE2OO2Pcg/dYgBSJrqXuMR6ldinlj+9u7ct5+rAnjpezwJtuwSx+WD9tm
         AHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763736860; x=1764341660;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETN4gl1iZbhJeLn6OCDI+9u79qwxOMAaoq4ImqB9HJI=;
        b=KNHBZ0Phf5T1d2IFu9X/bwBP+pe6IWliZxkCnCGSWVp0AreO7TjBPGhxM0eRH3hyaz
         ogsoQTGDhI+7hrWeH+rKg4rf7OGK+kIuBfGsoPbcA4qIfji0ZsAoi0ihlqtuYHJEqgk2
         ya4DOzjRH5v3EeijLyj4XT2tx0civZCBOYpBWzTlmBzOSZu3Rhq+h9rKc6PqkDRUFehi
         IGvpm/HV/BtCxYTXf2FrS3Z60NeI+3unHr2HcVMnoCLNxV3ErF1wOyU/+JQ490JnGcRg
         DkWfcXIhRaNmU4qlFIv0C/S1nE8CYmwSPeZeVeXEHJamCg/+BF9PNM9NlgE2dp5PFizf
         60vw==
X-Gm-Message-State: AOJu0YxrDdpCT2+Gt7vk9MuGqJwYi3XPx6iQaQMgZMHKEbkWewIbAPt5
	2OqDnwvd6u0TPr0a84fgwm0EO4s2o/Dt2FPQegnUfriSR7tJij2MAdz7nLze/O6Wks0=
X-Gm-Gg: ASbGnctkm2fKNP9dnYGKORCwxpHoVpG9K5toSGlGFbK5IgToPKTukz/9/rTcoCOSx8g
	1j43FDkvHR1TGvFlUGU8SY25w3I7j/0GZnRrRo4k0NnJPlf++DMB2o7/BrutM9sKpZ8krZ7xMYT
	fgeQDrXIqkr78OgzXEiU0PtaVLIO82CqhH0S/QAWdV6wAJgxsjzw4zCn1PEavOgZnX9u9Uw5T8f
	YV2kB8KzSIUBvwb3Cdcpx7mTxuZNiAFLjxSHWx4DkAeKnwQhbnYgLSg4lfAkbHieoQIrjI3w231
	Uo0LBHckPkSbB5V7nD2XyCQtJzUqGfDfiK07TF3C64KHvjRAPQmAkWlyQzWEeZ4wgwZbeRU8rHW
	e52jBbF3FV9OlF3BnqCdG5GG6I7YtGrYln+gqk4n+k+ptu2RAc0rBD0RQEveYyUp1sd0LBhmyrl
	4scao2/HYlOvTPjzX7wNvo6d0ve+ikFyqdVebV08dzf2PosPmhC8jy65whTNMB3oU=
X-Google-Smtp-Source: AGHT+IEGzoj+G1XJyD7HRZUpDf/Nmo3R0LQETO+OA2bCF/axjJi8k5L8RSAIauSreqKt4GiwYJQXaA==
X-Received: by 2002:a05:600c:1d14:b0:477:9d88:2da6 with SMTP id 5b1f17b1804b1-477c026ed62mr28503395e9.0.1763736859683;
        Fri, 21 Nov 2025 06:54:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:159f:1839:bb92:1eca? ([2a01:e0a:3d9:2080:159f:1839:bb92:1eca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f3635bsm11604067f8f.17.2025.11.21.06.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:54:19 -0800 (PST)
Message-ID: <cd200f33-dd6f-4eb3-b2d9-8f41d0dde992@linaro.org>
Date: Fri, 21 Nov 2025 15:54:18 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v10 04/11] drm/bridge: aux: Add
 drm_aux_bridge_register_from_node()
To: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-5-kernel@airkyi.com>
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
In-Reply-To: <20251120022343.250-5-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/25 03:23, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The drm_aux_bridge_register() uses the device->of_node as the
> bridge->of_node.
> 
> This patch adds drm_aux_bridge_register_from_node() to allow
> specifying the of_node corresponding to the bridge.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>   drivers/gpu/drm/bridge/aux-bridge.c | 24 ++++++++++++++++++++++--
>   include/drm/bridge/aux-bridge.h     |  6 ++++++
>   2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
> index b3e4cdff61d6..52dff4601c2d 100644
> --- a/drivers/gpu/drm/bridge/aux-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-bridge.c
> @@ -35,6 +35,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
>   /**
>    * drm_aux_bridge_register - Create a simple bridge device to link the chain
>    * @parent: device instance providing this bridge
> + * @np: device node pointer corresponding to this bridge instance
>    *
>    * Creates a simple DRM bridge that doesn't implement any drm_bridge
>    * operations. Such bridges merely fill a place in the bridge chain linking
> @@ -42,7 +43,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
>    *
>    * Return: zero on success, negative error code on failure
>    */
> -int drm_aux_bridge_register(struct device *parent)
> +int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
>   {
>   	struct auxiliary_device *adev;
>   	int ret;
> @@ -62,7 +63,10 @@ int drm_aux_bridge_register(struct device *parent)
>   	adev->dev.parent = parent;
>   	adev->dev.release = drm_aux_bridge_release;
>   
> -	device_set_of_node_from_dev(&adev->dev, parent);
> +	if (np)
> +		device_set_node(&adev->dev, of_fwnode_handle(np));
> +	else
> +		device_set_of_node_from_dev(&adev->dev, parent);
>   
>   	ret = auxiliary_device_init(adev);
>   	if (ret) {
> @@ -80,6 +84,22 @@ int drm_aux_bridge_register(struct device *parent)
>   
>   	return devm_add_action_or_reset(parent, drm_aux_bridge_unregister_adev, adev);
>   }
> +EXPORT_SYMBOL_GPL(drm_aux_bridge_register_from_node);
> +
> +/**
> + * drm_aux_bridge_register - Create a simple bridge device to link the chain
> + * @parent: device instance providing this bridge
> + *
> + * Creates a simple DRM bridge that doesn't implement any drm_bridge
> + * operations. Such bridges merely fill a place in the bridge chain linking
> + * surrounding DRM bridges.
> + *
> + * Return: zero on success, negative error code on failure
> + */
> +int drm_aux_bridge_register(struct device *parent)
> +{
> +	return drm_aux_bridge_register_from_node(parent, NULL);
> +}
>   EXPORT_SYMBOL_GPL(drm_aux_bridge_register);
>   
>   struct drm_aux_bridge_data {
> diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
> index c2f5a855512f..7dd1f17a1354 100644
> --- a/include/drm/bridge/aux-bridge.h
> +++ b/include/drm/bridge/aux-bridge.h
> @@ -13,11 +13,17 @@ struct auxiliary_device;
>   
>   #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
>   int drm_aux_bridge_register(struct device *parent);
> +int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np);
>   #else
>   static inline int drm_aux_bridge_register(struct device *parent)
>   {
>   	return 0;
>   }
> +
> +static inline int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
> +{
> +	return 0;
> +}
>   #endif
>   
>   #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)

Looks fine:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

