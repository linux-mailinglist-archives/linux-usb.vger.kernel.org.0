Return-Path: <linux-usb+bounces-30933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA22C87CE7
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 03:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1EB973553B0
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 02:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5996D30BF68;
	Wed, 26 Nov 2025 02:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Hr6YCgnG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m1973179.qiye.163.com (mail-m1973179.qiye.163.com [220.197.31.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D21130B50D;
	Wed, 26 Nov 2025 02:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764123249; cv=none; b=V7jkXilHaHNPiRLusvbI0EshFsKfa3qKIOlLILmP304Bi8j3jNS7BWFLkuMPJZbQs0oevCikz7bKSGqvem81Fo/lKTYlPd6n3tibm91otvpW8owRA5urXJYt2frFZWtwbfdUDUXzOEgBQ+4eMaoC4sVSngep0ncDgobnTy1mgkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764123249; c=relaxed/simple;
	bh=golNzLLSjS29iU21CW5F7u8ey476VWzR4hUCaqwHi5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dq1t3YfT70ZNp4VZeI79Z8FY8A1MNJw6ylgTOOuT5Fg/E+d3VDI5PU53MLOqMVVKBKE3vNq6T7EglQf78YlXk3CZRsGV1jHGv3o2D7a+LjNUHr/xh1DkH58IY/om+khYBQC2KnoN/FH+LnA42jEQ7PYnfa1bktQz26s0P8jvCIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Hr6YCgnG; arc=none smtp.client-ip=220.197.31.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ae76c0ea;
	Wed, 26 Nov 2025 10:14:00 +0800 (GMT+08:00)
Message-ID: <db9541d3-bc5c-4907-9dc5-965810ef92d9@rock-chips.com>
Date: Wed, 26 Nov 2025 10:13:58 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/11] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-4-kernel@airkyi.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20251120022343.250-4-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9abdf0668a03abkunm24c9a3ad56c93f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09JTFZLGEJDTxkZSU1DSElWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Hr6YCgnGlX5GNA/vTj8sVjGPdiIhmMPdJQnyYtxbw3hg6lfKvInidLdPWbW1zoY9j4+tpGlmkTBW1hQjwb4Z9gxpa0ZXKE9DBTBWfsQ5ypJKu7ENzb9BI6KSsu6oCgf8VWCri84W3Qg1rBhVR7tf4N1nKB/LQqKafx0ZEpr82tE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=4tyc09Ao125oOeQ1/2CjusJ4Ro4JNAsugQFnuIaNAdI=;
	h=date:mime-version:subject:message-id:from;

Hi Heikki,

On 11/20/2025 10:23 AM, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 

[...]

> 
>  drivers/gpu/drm/bridge/Kconfig                | 10 ++++
>  drivers/gpu/drm/bridge/Makefile               |  1 +
>  .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 50 +++++++++++++++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> 
> +
> +static int drm_typec_bus_event(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{
> +	struct typec_altmode *alt = (struct typec_altmode *)data;
> +
> +	if (action != TYPEC_ALTMODE_REGISTERED)
> +		goto done;
> +
> +	if (is_typec_partner(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
> +		goto done;

It should be "is_typec_partner(alt->dev.parent)".
Sorry, I didn't notice this earlier. I will fix this in v11.

> +
> +	/*
> +	 * alt->dev.parent->parent : USB-C controller device
> +	 * alt->dev.parent         : USB-C connector device
> +	 */
> +	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> +				   to_of_node(alt->dev.parent->fwnode));
> +
> +done:
> +	return NOTIFY_OK;
> +}
> +

-- 
Best, 
Chaoyi

