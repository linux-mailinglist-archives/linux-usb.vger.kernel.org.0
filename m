Return-Path: <linux-usb+bounces-31031-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E599EC90BDF
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 04:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C28534E4BC6
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 03:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9CE1E1E16;
	Fri, 28 Nov 2025 03:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1Ec+14Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3694C2EA;
	Fri, 28 Nov 2025 03:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299847; cv=none; b=Lf9VVqtHQHaRgxiY40+WfaBMkWUe0g28ExQT642whzWtM54/+k4Jo3T3ZjJfaE7/szW00f2IHGzOrh/bcPDvnEnkaL2bubi51DJ1gL/JJQQC7zM+zxl/QdgFJ7432WjUcLg6N0wgzGvQIbz1ErVh9yJeHaXwNL9gpljTDhqFKVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299847; c=relaxed/simple;
	bh=ryPXwfuMaZzBXoYMo/9eVTKnHFtI3lVtoZXMBixOIc4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gl79T2zpUcCfmEiIAllqfli6k/+KejcHwMTti6uAqKe5pW9uqSYniLrZyy8Mi1UY/NZqGGbWjtYWqSvEC2XIOI8+NZaGsrCdYMIOex9gpkTOSJxrvRPCt50BKzK/HbFa6psjQPDn6CBk4xkvAKnccqkFHbUlPeu3R/1NZLoiL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1Ec+14Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DF0C4CEF8;
	Fri, 28 Nov 2025 03:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764299847;
	bh=ryPXwfuMaZzBXoYMo/9eVTKnHFtI3lVtoZXMBixOIc4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=R1Ec+14ZjpPF5TvGD5MwhTACaQKRf4CPFDQlWnS3iKcnA8nYJoHgtULZac5QL0R8e
	 ONuNr0QhVzGQQpBd9bAMc1HDkJTHGmkM+T4u3EYEry/bXjqhlfnzkJ148xc96GDTWS
	 9m44RRHE9/pa6qqT19+hA/3uKMQ2VlMa/O1lNQSYr2D7vVq8xL5+nhR0SPDO0iTntq
	 f/ldas7ZXnM+NMMiIVPZ0xtlmSLav22QSnLLOw/JE1y6uSSXurk3KHRR9Zrbm1mnqz
	 R9TMfNxqW8aiwae9iBkcsN7xtjhBhTn7smCfb7sO/wYSYR0TxnNyu3olV+kHpfMGwO
	 8NTnuNSIdcdtA==
Date: Thu, 27 Nov 2025 21:17:25 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Diederik de Haas <didi.debian@cknow.org>, Dragan Simic <dsimic@manjaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-phy@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Johan Jonker <jbx6244@gmail.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Robert Foss <rfoss@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-rockchip@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Peter Robinson <pbrobinson@gmail.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-arm-kernel@lists.infradead.org, 
 Frank Wang <frank.wang@rock-chips.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20251128020405.90-6-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
 <20251128020405.90-6-kernel@airkyi.com>
Message-Id: <176429984551.1030074.10716294618988682110.robh@kernel.org>
Subject: Re: [PATCH v11 05/11] dt-bindings: phy: rockchip:
 rk3399-typec-phy: Support mode-switch


On Fri, 28 Nov 2025 10:03:59 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The RK3399 SoC integrates two USB/DP combo PHYs, each of which
> supports software-configurable pin mapping and DisplayPort lane
> assignment. These capabilities enable the PHY itself to handle both
> mode switching and orientation switching, based on the Type-C plug
> orientation and USB PD negotiation results.
> 
> While an external Type-C controller is still required to detect cable
> attachment and report USB PD events, the actual mode and orientation
> switching is performed internally by the PHY through software
> configuration. This allows the PHY to act as a Type-C multiplexer for
> both data role and DP altmode configuration.
> 
> To reflect this hardware design, this patch introduces a new
> "mode-switch" property for the dp-port node in the device tree bindings.
> This property indicates that the connected PHY is capable of handling
> Type-C mode switching itself.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> (no changes since v5)
> 
> Changes in v4:
> - Remove "|" in description.
> 
> Changes in v3:
> - Add more descriptions to clarify the role of the PHY in switching.
> 
> Changes in v2:
> - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
> 
>  .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/slimbus/slimbus.example.dtb: slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required property
	from schema $id: http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251128020405.90-6-kernel@airkyi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


