Return-Path: <linux-usb+bounces-31188-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5818CA5E6A
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 03:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD6183133AF5
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 02:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041502DFA48;
	Fri,  5 Dec 2025 02:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="dsPsGNd5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49219.qiye.163.com (mail-m49219.qiye.163.com [45.254.49.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A879F1DE3DB;
	Fri,  5 Dec 2025 02:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764901601; cv=none; b=ahXKBxWuZrj2Vl1OWpz17OAKbyVbsmGgiiF/SCVZ0e+Ydlp1kx6RQLD5Ir7IwuOKcqifnWKxTwUf4SN6OrcSW/GD802FYg5ZLNaTCnkS1k6ixF6BPEPwsyfnMUH7L0iETHU5Mweu3UjpJNLHOG5Vo90oOt4xlMSszdAXpdlAwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764901601; c=relaxed/simple;
	bh=9TrmCfGVyVnvI6XWZ8+IP7Hqve84kPzrKKpqjcF2JOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hip4h4/Jw7xuwqihTfYI9bopedDrPRy8X/VuflhcAiTZxkdgjbvP5Iynjk6XuRBVdIBltTcFpiZwpETQKOl3nvTSyG4lNCnFmx9o6O8czetv575BSs/SKnClureghzyvd3W+mNmUJLWECHl8J7PtalGPSCZtpL4iUzsg4VHYnAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=dsPsGNd5; arc=none smtp.client-ip=45.254.49.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c1095715;
	Fri, 5 Dec 2025 10:26:26 +0800 (GMT+08:00)
Message-ID: <84f06c0f-3ec7-4a43-bba2-1979c3a07127@rock-chips.com>
Date: Fri, 5 Dec 2025 10:26:20 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v11 03/11] drm/bridge: Implement generic USB Type-C
 DP HPD bridge
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
References: <20251204063109.104-1-kernel@airkyi.com>
 <20251204063109.104-4-kernel@airkyi.com> <aTGPaJmwd7uHfrnV@kuha>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aTGPaJmwd7uHfrnV@kuha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9aec5504a403abkunm9ee3fce2af812e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk1NH1ZPHkhJTkMfTR5JSx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=dsPsGNd5e897H3fkHx9JCGvZRm2YiJCFhvaP+jw00pxK222QJL0XiP31/eVLZJlPrKbaJjN00u9w23Xj3Uw4IfNFQ/6SaZ4EwtVpGeZp74TgSbKhAJMmi/wQoPo9/wpRg3t9Rqmf/pKCfLKP+Rx212Jo9299la1sGPByNezAavk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=VtwmAIo0SaGp/QXNcsjM3U1Vr4tjF0Aq/LuKxWtI5aQ=;
	h=date:mime-version:subject:message-id:from;

Hi Heikki,

On 12/4/2025 9:40 PM, Heikki Krogerus wrote:
> Hi,
> 
> I don't know what's going on here - this series is the 12th?
> In any case, you need to fix this..
> 

It is 11th. Patch 1 was missing the Signed-off-by line, so I've resent
it. Sorry for the confusion.

>> diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>> new file mode 100644
>> index 000000000000..94be3d5f69e9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>> @@ -0,0 +1,51 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +#include <linux/of.h>
>> +#include <linux/usb/typec_altmode.h>
>> +#include <linux/usb/typec_dp.h>
>> +
>> +#include <drm/bridge/aux-bridge.h>
>> +
>> +static int drm_typec_bus_event(struct notifier_block *nb,
>> +			       unsigned long action, void *data)
>> +{
>> +	struct device *dev = (struct device *)data;
>> +	struct typec_altmode *alt = to_typec_altmode(dev);
>> +
>> +	if (action != BUS_NOTIFY_ADD_DEVICE)
>> +		goto done;
>> +
>> +	if (is_typec_partner_altmode(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
>> +		goto done;
> 
> That's still not enough because of the plug altmodes. You need to
> check that it's a port altmode:
> 
>         if (is_typec_port_altmode(&alt->dev) && alt->svid == USB_TYPEC_DP_SID)
>         	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
>         				   to_of_node(alt->dev.parent->fwnode));
>

Oh, it is. Will fix in v12. Thank you.

>> +	/*
>> +	 * alt->dev.parent->parent : USB-C controller device
>> +	 * alt->dev.parent         : USB-C connector device
>> +	 */
>> +	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
>> +				   to_of_node(alt->dev.parent->fwnode));
>> +
>> +done:
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block drm_typec_event_nb = {
>> +	.notifier_call = drm_typec_bus_event,
>> +};
>> +
>> +static void drm_aux_hpd_typec_dp_bridge_module_exit(void)
>> +{
>> +	bus_unregister_notifier(&typec_bus, &drm_typec_event_nb);
>> +}
>> +
>> +static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
>> +{
>> +	bus_register_notifier(&typec_bus, &drm_typec_event_nb);
>> +
>> +	return 0;
>> +}
>> +
>> +module_init(drm_aux_hpd_typec_dp_bridge_module_init);
>> +module_exit(drm_aux_hpd_typec_dp_bridge_module_exit);
>> +
>> +MODULE_DESCRIPTION("DRM TYPEC DP HPD BRIDGE");
>> +MODULE_LICENSE("GPL");
> 
> thanks,
> 

-- 
Best, 
Chaoyi

