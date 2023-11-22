Return-Path: <linux-usb+bounces-3200-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EE77F4BFC
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 17:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A98AC1C20A61
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 16:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C7F4A99B;
	Wed, 22 Nov 2023 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Cb8BhfpI"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 381 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Nov 2023 08:09:32 PST
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [IPv6:2001:41d0:203:375::b0])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D3EA2
	for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 08:09:31 -0800 (PST)
Message-ID: <7a4a6698-0954-4225-82ff-02dd13bd64bb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1700668987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+zG0kaVtnpV1mCBkeYtmeeP9ZdCmJp4PqJOO3u62dFQ=;
	b=Cb8BhfpIktRns14fQSXGAH/4j/9ZYiiVeI8I9z+nO7gzTFtcGXMu7ls0oNR2YJKx3dqopS
	kazLRJ/Gmk4zy4RUqS+Bfu+O4a28AZIAHj/lyNDOukN7UuVL1h/70fkno9SLme+g82q0NQ
	AFF4KmSe4DaIFbOdt2IHFnBxsnsORP0=
Date: Thu, 23 Nov 2023 00:02:51 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/6] drm: simplify support for transparent DRM bridges
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2023/11/4 07:03, Dmitry Baryshkov wrote:
> Supporting DP/USB-C can result in a chain of several transparent
> bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
> in a different way resulted either in series of hacks or in device tree
> not reflecting the actual hardware design. This results in drivers
> having similar boilerplate code for such bridges.

Please improve the written,  "resulted" -> "yield" ?

> Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> bridge can either be probed from the bridge->attach callback, when it is
> too late to return -EPROBE_DEFER, or from the probe() callback, when the
> next bridge might not yet be available, because it depends on the
> resources provided by the probing device. Device links can not fully
> solve this problem since there are mutual dependencies between adjancent
> devices.
>
> Last, but not least, this results in the the internal knowledge of DRM

There is a duplicated "the" word in this sentence.

As far as I can understand, nearly all of those troubles are because the display bridges
drivers are designed as a kernel module(.ko) instead of making them as static link-able
helpers. I means that a display bridge device can not work standalone, as it have to be
used with a display controller. So a display bridge is just a slave device or a auxiliary
device. My question is: if it can't works by itself, we probably shouldn't design them as
kernel modules style. Am I correct?

> subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.

Yeah, this indeed a problem.

> To solve all these issues, define a separate DRM helper, which creates
> separate aux device just for the bridge.

I'm supporting you if want to solve all these problems, this is fine and thanks a lot.
But I want to ask a question, now that you are solving these problems by creating separate
devices, does this manner match the hardware design perfectly? which is the hardware units
you newly created device is corresponding to?


> During probe such aux device
> doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> drivers to probe properly, according to the actual resource
> dependencies. The bridge auxdevs are then probed when the next bridge
> becomes available, sparing drivers from drm_bridge_attach() returning
> -EPROBE_DEFER.

OK, as far as I can understand,  in order to solve the mentioned problem
you are also retire the defer probe mechanism.


> Changes since v5:
>   - Removed extra semicolon in !DRM_AUX_HPD_BRIDGE stubs definition.
>
> Changes since v4:
>   - Added documentation for new API (Sima)
>   - Added generic code to handle "last mile" DP bridges implementing just
>     the HPD functionality.
>   - Rebased on top of linux-next to be able to drop #ifdef's around
>     drm_bridge->of_node
>
> Changes since v3:
>   - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
>   - Renamed it to aux-bridge (since there is already a simple_bridge driver)
>   - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
>   - Added missing kfree and ida_free (Dan Carpenter)
>
> Changes since v2:
>   - ifdef'ed bridge->of_node access (LKP)
>
> Changes since v1:
>   - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge
>
> Dmitry Baryshkov (6):
>    drm/bridge: add transparent bridge helper
>    phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
>    usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
>    drm/bridge: implement generic DP HPD bridge
>    soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
>    usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
>
>   drivers/gpu/drm/bridge/Kconfig                |  17 ++
>   drivers/gpu/drm/bridge/Makefile               |   2 +
>   drivers/gpu/drm/bridge/aux-bridge.c           | 140 +++++++++++++++
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 164 ++++++++++++++++++
>   drivers/phy/qualcomm/Kconfig                  |   2 +-
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  44 +----
>   drivers/soc/qcom/Kconfig                      |   1 +
>   drivers/soc/qcom/pmic_glink_altmode.c         |  33 +---
>   drivers/usb/typec/mux/Kconfig                 |   2 +-
>   drivers/usb/typec/mux/nb7vpq904m.c            |  44 +----
>   drivers/usb/typec/tcpm/Kconfig                |   1 +
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c |  41 +----
>   include/drm/bridge/aux-bridge.h               |  37 ++++
>   13 files changed, 383 insertions(+), 145 deletions(-)
>   create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
>   create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
>   create mode 100644 include/drm/bridge/aux-bridge.h
>

