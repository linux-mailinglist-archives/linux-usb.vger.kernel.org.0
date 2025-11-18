Return-Path: <linux-usb+bounces-30657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27849C68943
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 10:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 073512A788
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 09:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AC03164B4;
	Tue, 18 Nov 2025 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IX/NU+qL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m3299.qiye.163.com (mail-m3299.qiye.163.com [220.197.32.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355241F5437;
	Tue, 18 Nov 2025 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458672; cv=none; b=TRlYL0De3NDN9LaGX8meStASpPfyeGl9K0K43p7vJ/CJWUNjWW7LseTabgyBVLn8QtTK8rdb5UeM2qQ/XIF/WFTRMcJl1O4Ipe8iltTE8TfPeD9rnP+/RVVW55HgvERWTWAeQC8KW7oZPQfA8w9Yfi9XMkl/8v3Pfr2igeKOBmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458672; c=relaxed/simple;
	bh=fXgYAJWIGY4pQtZGKh9V8hXCasI48G2CNBqy9tjlIO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTSS/p/zk5UZlL/1GXFPzDAi5NletgtriNLHam/vQmQOUtJm8n4/3rIQzT7XOhQZ8rh1v612R5g/UdjpEe1on234N5bL0PJb/r5gXSgfGLd+HNKwQw9VR2nGoayjX/EpdVcLJmaczG+DdZhpi83O8PT8PMyfIxSvey+nUhfFCU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IX/NU+qL; arc=none smtp.client-ip=220.197.32.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29fbbda7b;
	Tue, 18 Nov 2025 17:37:40 +0800 (GMT+08:00)
Message-ID: <525040d5-84db-4de1-aed0-3b4b5a672f8b@rock-chips.com>
Date: Tue, 18 Nov 2025 17:37:39 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/10] phy: rockchip: phy-rockchip-typec: Add DRM AUX
 bridge
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Chaoyi Chen <kernel@airkyi.com>,
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
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-7-kernel@airkyi.com>
 <7ca46d0d-d235-421e-95cb-901efb856b0c@linaro.org>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <7ca46d0d-d235-421e-95cb-901efb856b0c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a9653b96903abkunmdd5bac12ac7c5b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkkaTlYfHUoaThlMGkNMSk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	9VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=IX/NU+qLfjpc6jNOUokdq+mlntEXb77qHZKkJ9s4nb711L7OON8h5dqK7p3ob8lQuodsMJH5PP/UEAjPxp2FGszqJCz5PIUkZPtYDoAMdBI3gqfWs9lxcFir/AqFnDfu3ECbZBWBOW0/7v/CHt0D1o3TWssNEa9VVNiVVtzULiQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Ju+gAVn51Xi01WO06/xEtoW6S8aMqC2W8WHS0vrOthQ=;
	h=date:mime-version:subject:message-id:from;

Hi Neil,

On 11/18/2025 5:08 PM, Neil Armstrong wrote:
> On 11/11/25 11:50, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
>> device.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> (no changes since v7)
>>
>> Changes in v6:
>> - Fix depend in Kconfig.
>>
>>   drivers/phy/rockchip/Kconfig              |  2 +
>>   drivers/phy/rockchip/phy-rockchip-typec.c | 52 +++++++++++++++++++++++
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
>> index db4adc7c53da..bcb5476222fc 100644
>> --- a/drivers/phy/rockchip/Kconfig
>> +++ b/drivers/phy/rockchip/Kconfig
>> @@ -120,6 +120,8 @@ config PHY_ROCKCHIP_TYPEC
>>       tristate "Rockchip TYPEC PHY Driver"
>>       depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
>>       depends on TYPEC || TYPEC=n
>> +    depends on DRM || DRM=n
>> +    select DRM_AUX_BRIDGE if DRM_BRIDGE
>>       select EXTCON
>>       select GENERIC_PHY
>>       select RESET_CONTROLLER
>> diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
>> index 1f5b4142cbe4..748a6eb8ad95 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-typec.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-typec.c
>> @@ -36,6 +36,7 @@
>>    * orientation, false is normal orientation.
>>    */
>>   +#include <linux/auxiliary_bus.h>
>>   #include <linux/clk.h>
>>   #include <linux/clk-provider.h>
>>   #include <linux/delay.h>
>> @@ -56,6 +57,7 @@
>>   #include <linux/phy/phy.h>
>>   #include <linux/usb/typec_dp.h>
>>   #include <linux/usb/typec_mux.h>
>> +#include <drm/bridge/aux-bridge.h>
>>     #define CMN_SSM_BANDGAP            (0x21 << 2)
>>   #define CMN_SSM_BIAS            (0x22 << 2)
>> @@ -415,6 +417,7 @@ struct rockchip_usb3phy_port_cfg {
>>     struct rockchip_typec_phy {
>>       struct device *dev;
>> +    struct auxiliary_device dp_port_dev;
>>       void __iomem *base;
>>       struct extcon_dev *extcon;
>>       struct typec_mux_dev *mux;
>> @@ -1299,6 +1302,51 @@ static void tcphy_typec_mux_unregister(void *data)
>>       typec_mux_unregister(tcphy->mux);
>>   }
>>   +static void tcphy_dp_port_dev_release(struct device *dev)
>> +{
>> +    struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> +
>> +    of_node_put(adev->dev.of_node);
>> +}
>> +
>> +static void tcphy_dp_port_unregister_adev(void *_adev)
>> +{
>> +    struct auxiliary_device *adev = _adev;
>> +
>> +    auxiliary_device_delete(adev);
>> +    auxiliary_device_uninit(adev);
>> +}
>> +
>> +static int tcphy_aux_bridge_register(struct rockchip_typec_phy *tcphy, struct device_node *np)
>> +{
>> +    struct auxiliary_device *adev = &tcphy->dp_port_dev;
>> +    int ret;
>> +
>> +    adev->name = "dp_port";
>> +    adev->dev.parent = tcphy->dev;
>> +    adev->dev.of_node = of_node_get(np);
>> +    adev->dev.release = tcphy_dp_port_dev_release;
>> +
>> +    ret = auxiliary_device_init(adev);
>> +
>
> Drop this empty line.

>
>> +    if (ret) {
>> +        of_node_put(adev->dev.of_node);
>> +        return ret;
>> +    }
>> +
>> +    ret = auxiliary_device_add(adev);
>> +    if (ret) {
>> +        auxiliary_device_uninit(adev);
>> +        return ret;
>> +    }
>> +
>> +    devm_add_action_or_reset(tcphy->dev, tcphy_dp_port_unregister_adev, adev);
>> +
>> +    ret = drm_aux_bridge_register(&adev->dev);
>
> Adding an aux device to an aux device looks quite overengineered to me !
>
> If it's a matter of using the proper of_node, you may instead create a separate
> drm_aux_bridge_register() like drm_aux_bridge_register_from_node() instead.

Yes, as you said, the aux device here is only to let the drm_aux_bridge get the correct of_node. I will add the API you mentioned in v10. Thank you.


-- 
Best,
Chaoyi


