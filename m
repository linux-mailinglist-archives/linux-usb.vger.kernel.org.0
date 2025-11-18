Return-Path: <linux-usb+bounces-30654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9FC68702
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 10:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D5459343A76
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 09:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1993A2F656A;
	Tue, 18 Nov 2025 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pGVI7TSr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758C12F1FC8
	for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763456895; cv=none; b=SoSZAzugxoaVaZkWG7oX8MhSnDwNevKXJHKo2ewbgsmyjdZNHVadboreSkKdtY45IiLljhFOvg4WX6MA5s9Nbhg/vJ1Copx5YjvRSowGJAWC9MVNRF1t/vGEFXJagIp74iTlWLV+8zJWGBHinx6aYU//S2Mc8MtWIzNgx5tcoiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763456895; c=relaxed/simple;
	bh=kFlNIN+gR01G+eV5ulgKp1aOfF3zt2Lu4Fx+jo8b8dU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G/eFx88WMhspqenGUL2P+yLmv1pdEiKGu4kPFOGEQWpBxcHvBHeOpSgfBR7IsIytI83S+gOFFYXWQRtxVM67AQKC7w379sD/AVBw0rOFLP8g/Es7qsCKasrmTriOKyi+yF+VnmAI3cjqcWJ8kIX+rnf7EGRH9/rLrWSN85YnZy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pGVI7TSr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso31623355e9.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 01:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763456892; x=1764061692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8ojmwZvyIUVTGQLirWUPhk95m2/9IA4Sz9hLtWscRI=;
        b=pGVI7TSriLTZypdkRLa+3b9rzWRFjtNVxHi5N/99+r3X1j8ismzsScjBGcc92QF+H+
         iuGqKoRNsoVVZk9Ujkd45B3OND2cd2Dnnyvbil9MkDKO/PtqRox5787YCy5Bb3f1xBbJ
         XXEeJegzbMQ/TEYX42hzQt6cQXKFDa2R5B9FsFEYyru3SRiWUiF4Iw+nOhn0AN4GL2aw
         63w5X0eGLB88gY/mh0V+YZPpzVzMV4hw3owSTVCWTi1tqgnFZ2m9gRXJdb50qO8Aw46o
         u5v2osd/Gve1Z9BVIO/PRRtsbL0sCjmmRBKekMRZbUz2N9O5dmiCCptLUnZoeGZQLSGc
         n59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456892; x=1764061692;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8ojmwZvyIUVTGQLirWUPhk95m2/9IA4Sz9hLtWscRI=;
        b=nlRtc3916TDCUa0hrzNhlUKq1Oa4cwltwyR8iTxifzQN/t+6Cb7HZ9gue6fMpQThxF
         j7wt+rqPfvmeL/E9xPh4JEo5qLsPd69cvW2MWt4J6jO+r7QwjanMdijjAWmN9mFc+U+s
         g43VsFs1/h4Tr3daULAGGD1SjlUjl9g0jcHaVdZx3p5uX8Zp07YOCtP7csR9l6pf+2gn
         hZxOiW05P2aynALvcaar3thHdXEp7hSCAR1A6wB9etNy9zX3db7p1neDLrqScdPGpKsH
         i/4QOnwqhl7echPVcijAVePZzmDUcawOiECMrD4TTFMTOPxS+c0vwRpblOQHYeL62+65
         /mog==
X-Gm-Message-State: AOJu0YwafVnRvHsbaP4eFYSOs3SvA10XZNCKpBLJ4P5mhZtsMNNlAZ1T
	gLTeQ285Uk0oeR2OwjWk1xPFbAMSr3OvRir1L0F2RI63yQUDoD+1y6LzBsrfqr5kSww=
X-Gm-Gg: ASbGnctMEIU2qstucA41i3ya3pKLZ91D039SDa7fsvxVTi4+6+5zIvYdpUozIlivNpd
	JobyzXG5zmjjJ0K6Kxxxl0RT9VQNCDOnK/usXxtDf914j6uvFJPEoVfOPd/S4tbJHk5/cWDHPWg
	stpCh/Vwmrl1dJR9O8XZhsCyT4GwjdP6WRqhF5mA/Qx+SXs9OLnjNHt4IiCqEPSahGGlFWR2yT0
	zkMwtVxkMg8JQ2wBlHkYKe+v46XupoLeuo6NJo6IQj45lT21zof9fSu4ay4AAIZ1xHWRIBI+Zba
	Egc65e1E8iLJ+md4TzNuHIbDknSD7H8rQxt+DED3VXJKnvCG1JXLxscFOgqJyijDSGFYbeOJzHC
	WwcHolNfOzj5F9Whmtzu798aadPNfgmxwt2AZ0knt9yHIwa6FUbWgwxT0UdvVd/LwfHl+HcwvPw
	PqCzQihYetqXIkovKvANjZ53NtIKOblW3uQ3lkh9aAg/zm64s22E1NP59FuRS2Zx4=
X-Google-Smtp-Source: AGHT+IG6gLgCwxhtQm3Z8HznXw2PJ389guvo2P4OhOD1SCc8LUBuHyTff2qepHeal9ABmF52l4Ec4Q==
X-Received: by 2002:a05:600c:3e8e:b0:477:abea:901c with SMTP id 5b1f17b1804b1-477abea924dmr8401245e9.11.1763456891500;
        Tue, 18 Nov 2025 01:08:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f2084dsm31563471f8f.42.2025.11.18.01.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:08:11 -0800 (PST)
Message-ID: <7ca46d0d-d235-421e-95cb-901efb856b0c@linaro.org>
Date: Tue, 18 Nov 2025 10:08:09 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 06/10] phy: rockchip: phy-rockchip-typec: Add DRM AUX
 bridge
To: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
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
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-7-kernel@airkyi.com>
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
In-Reply-To: <20251111105040.94-7-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/25 11:50, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
> device.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> (no changes since v7)
> 
> Changes in v6:
> - Fix depend in Kconfig.
> 
>   drivers/phy/rockchip/Kconfig              |  2 +
>   drivers/phy/rockchip/phy-rockchip-typec.c | 52 +++++++++++++++++++++++
>   2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
> index db4adc7c53da..bcb5476222fc 100644
> --- a/drivers/phy/rockchip/Kconfig
> +++ b/drivers/phy/rockchip/Kconfig
> @@ -120,6 +120,8 @@ config PHY_ROCKCHIP_TYPEC
>   	tristate "Rockchip TYPEC PHY Driver"
>   	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
>   	depends on TYPEC || TYPEC=n
> +	depends on DRM || DRM=n
> +	select DRM_AUX_BRIDGE if DRM_BRIDGE
>   	select EXTCON
>   	select GENERIC_PHY
>   	select RESET_CONTROLLER
> diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
> index 1f5b4142cbe4..748a6eb8ad95 100644
> --- a/drivers/phy/rockchip/phy-rockchip-typec.c
> +++ b/drivers/phy/rockchip/phy-rockchip-typec.c
> @@ -36,6 +36,7 @@
>    * orientation, false is normal orientation.
>    */
>   
> +#include <linux/auxiliary_bus.h>
>   #include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/delay.h>
> @@ -56,6 +57,7 @@
>   #include <linux/phy/phy.h>
>   #include <linux/usb/typec_dp.h>
>   #include <linux/usb/typec_mux.h>
> +#include <drm/bridge/aux-bridge.h>
>   
>   #define CMN_SSM_BANDGAP			(0x21 << 2)
>   #define CMN_SSM_BIAS			(0x22 << 2)
> @@ -415,6 +417,7 @@ struct rockchip_usb3phy_port_cfg {
>   
>   struct rockchip_typec_phy {
>   	struct device *dev;
> +	struct auxiliary_device dp_port_dev;
>   	void __iomem *base;
>   	struct extcon_dev *extcon;
>   	struct typec_mux_dev *mux;
> @@ -1299,6 +1302,51 @@ static void tcphy_typec_mux_unregister(void *data)
>   	typec_mux_unregister(tcphy->mux);
>   }
>   
> +static void tcphy_dp_port_dev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	of_node_put(adev->dev.of_node);
> +}
> +
> +static void tcphy_dp_port_unregister_adev(void *_adev)
> +{
> +	struct auxiliary_device *adev = _adev;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static int tcphy_aux_bridge_register(struct rockchip_typec_phy *tcphy, struct device_node *np)
> +{
> +	struct auxiliary_device *adev = &tcphy->dp_port_dev;
> +	int ret;
> +
> +	adev->name = "dp_port";
> +	adev->dev.parent = tcphy->dev;
> +	adev->dev.of_node = of_node_get(np);
> +	adev->dev.release = tcphy_dp_port_dev_release;
> +
> +	ret = auxiliary_device_init(adev);
> +

Drop this empty line.

> +	if (ret) {
> +		of_node_put(adev->dev.of_node);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	devm_add_action_or_reset(tcphy->dev, tcphy_dp_port_unregister_adev, adev);
> +
> +	ret = drm_aux_bridge_register(&adev->dev);

Adding an aux device to an aux device looks quite overengineered to me !

If it's a matter of using the proper of_node, you may instead create a separate
drm_aux_bridge_register() like drm_aux_bridge_register_from_node() instead.

Neil

> +
> +	return 0;
> +}
> +
>   static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
>   {
>   	struct typec_mux_desc mux_desc = {};
> @@ -1312,6 +1360,10 @@ static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
>   	if (!of_property_read_bool(np, "mode-switch"))
>   		goto put_np;
>   
> +	ret = tcphy_aux_bridge_register(tcphy, np);
> +	if (ret)
> +		goto put_np;
> +
>   	mux_desc.drvdata = tcphy;
>   	mux_desc.fwnode = device_get_named_child_node(tcphy->dev, "dp-port");
>   	mux_desc.set = tcphy_typec_mux_set;


