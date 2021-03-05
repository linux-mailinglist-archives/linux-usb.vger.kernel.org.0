Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE6F32EE40
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 16:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhCEPS1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 10:18:27 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39304 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhCEPR5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 10:17:57 -0500
Received: from [IPv6:2003:c7:cf38:3800:8df:3f9b:2ff1:d151] (p200300c7cf38380008df3f9b2ff1d151.dip0.t-ipconnect.de [IPv6:2003:c7:cf38:3800:8df:3f9b:2ff1:d151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 300A91F46B95;
        Fri,  5 Mar 2021 15:17:55 +0000 (GMT)
Subject: Re: [PATCH v5 2/2] drm/bridge: anx7688: Add ANX7688 bridge driver
 support
To:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-usb@vger.kernel.org
Cc:     a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
        chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
        enric.balletbo@collabora.com, drinkcat@chromium.org,
        hsinyi@chromium.org, kernel@collabora.com, dafna3@gmail.com,
        robh+dt@kernel.org, megous@megous.com
References: <20210305124351.15079-1-dafna.hirschfeld@collabora.com>
 <20210305124351.15079-3-dafna.hirschfeld@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <5ecb7e50-5566-0285-892e-129b6bcd7dc5@collabora.com>
Date:   Fri, 5 Mar 2021 16:17:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305124351.15079-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adding megous@megous.com and linux-usb@vger.kernel.org to the list

Thanks,
Dafna

On 05.03.21 13:43, Dafna Hirschfeld wrote:
> From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> This driver adds support for the ANX7688 HDMI to DP converter block of the
> ANX7688 device.
> 
> For our use case, the only reason the Linux kernel driver is necessary is
> to reject resolutions that require more bandwidth than what is available
> on the DP side. DP bandwidth and lane count are reported by the bridge via
> 2 registers and, as far as we know, only chips that have a firmware
> version greater than 0.85 support these two registers.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> [The driver is OF only so should depends on CONFIG_OF]
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> [convert the driver to be a i2c driver]
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>   drivers/gpu/drm/bridge/analogix/Kconfig       |  11 ++
>   drivers/gpu/drm/bridge/analogix/Makefile      |   1 +
>   .../drm/bridge/analogix/analogix-anx7688.c    | 186 ++++++++++++++++++
>   3 files changed, 198 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
> index 024ea2a570e7..323327aabc38 100644
> --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> @@ -11,6 +11,17 @@ config DRM_ANALOGIX_ANX6345
>   	  ANX6345 transforms the LVTTL RGB output of an
>   	  application processor to eDP or DisplayPort.
>   
> +config DRM_ANALOGIX_ANX7688
> +	tristate "Analogix ANX7688 bridge"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	help
> +	  ANX7688 is an ultra-low power 4K Ultra-HD (4096x2160p60)
> +	  mobile HD transmitter designed for portable
> +	  devices. The ANX7688 converts HDMI 2.0 to
> +	  DisplayPort 1.3 Ultra-HD.
> +
>   config DRM_ANALOGIX_ANX78XX
>   	tristate "Analogix ANX78XX bridge"
>   	select DRM_ANALOGIX_DP
> diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm/bridge/analogix/Makefile
> index 44da392bb9f9..8f2272b8b732 100644
> --- a/drivers/gpu/drm/bridge/analogix/Makefile
> +++ b/drivers/gpu/drm/bridge/analogix/Makefile
> @@ -2,5 +2,6 @@
>   analogix_dp-objs := analogix_dp_core.o analogix_dp_reg.o analogix-i2c-dptx.o
>   obj-$(CONFIG_DRM_ANALOGIX_ANX6345) += analogix-anx6345.o
>   obj-$(CONFIG_DRM_ANALOGIX_ANX7625) += anx7625.o
> +obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
>   obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
>   obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp.o
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> new file mode 100644
> index 000000000000..85a4b1a23035
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ANX7688 HDMI->DP bridge driver
> + *
> + * Copyright 2020 Google LLC
> + */
> +
> +#include <linux/types.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_print.h>
> +
> +/* Register addresses */
> +#define ANX7688_VENDOR_ID_REG		0x00
> +#define ANX7688_DEVICE_ID_REG		0x02
> +
> +#define ANX7688_FW_VERSION_REG		0x80
> +
> +#define ANX7688_DP_BANDWIDTH_REG	0x85
> +#define ANX7688_DP_LANE_COUNT_REG	0x86
> +
> +#define ANX7688_VENDOR_ID		0x1f29
> +#define ANX7688_DEVICE_ID		0x7688
> +
> +/* First supported firmware version (0.85) */
> +#define ANX7688_MINIMUM_FW_VERSION	0x0085
> +
> +static const struct regmap_config anx7688_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +struct anx7688 {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	struct drm_bridge bridge;
> +	bool filter;
> +};
> +
> +static inline struct anx7688 *
> +bridge_to_anx7688(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct anx7688, bridge);
> +}
> +
> +static bool anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
> +				      const struct drm_display_mode *mode,
> +				      struct drm_display_mode *adjusted_mode)
> +{
> +	struct anx7688 *anx = bridge_to_anx7688(bridge);
> +	int totalbw, requiredbw;
> +	u8 dpbw, lanecount;
> +	u8 regs[2];
> +	int ret;
> +
> +	if (!anx->filter)
> +		return true;
> +
> +	/* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
> +	ret = regmap_bulk_read(anx->regmap, ANX7688_DP_BANDWIDTH_REG, regs, 2);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to read bandwidth/lane count\n");
> +		return false;
> +	}
> +	dpbw = regs[0];
> +	lanecount = regs[1];
> +
> +	/* Maximum 0x19 bandwidth (6.75 Gbps Turbo mode), 2 lanes */
> +	if (dpbw > 0x19 || lanecount > 2) {
> +		DRM_ERROR("Invalid bandwidth/lane count (%02x/%d)\n", dpbw,
> +			  lanecount);
> +		return false;
> +	}
> +
> +	/* Compute available bandwidth (kHz) */
> +	totalbw = dpbw * lanecount * 270000 * 8 / 10;
> +
> +	/* Required bandwidth (8 bpc, kHz) */
> +	requiredbw = mode->clock * 8 * 3;
> +
> +	DRM_DEBUG_KMS("DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
> +		      totalbw, dpbw, lanecount, requiredbw);
> +
> +	if (totalbw == 0) {
> +		DRM_ERROR("Bandwidth/lane count are 0, not rejecting modes\n");
> +		return true;
> +	}
> +
> +	return totalbw >= requiredbw;
> +}
> +
> +static const struct drm_bridge_funcs anx7688_bridge_funcs = {
> +	.mode_fixup = anx7688_bridge_mode_fixup,
> +};
> +
> +static int anx7688_bridge_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct anx7688 *anx7688;
> +	u16 vendor, device, fw_version;
> +	u8 buffer[4];
> +	int ret;
> +
> +	anx7688 = devm_kzalloc(dev, sizeof(*anx7688), GFP_KERNEL);
> +	if (!anx7688)
> +		return -ENOMEM;
> +
> +	anx7688->client = client;
> +	i2c_set_clientdata(client, anx7688);
> +
> +	anx7688->regmap = devm_regmap_init_i2c(client, &anx7688_regmap_config);
> +
> +	/* Read both vendor and device id (4 bytes). */
> +	ret = regmap_bulk_read(anx7688->regmap, ANX7688_VENDOR_ID_REG,
> +			       buffer, 4);
> +	if (ret) {
> +		dev_err(dev, "Failed to read chip vendor/device id\n");
> +		return ret;
> +	}
> +
> +	vendor = (u16)buffer[1] << 8 | buffer[0];
> +	device = (u16)buffer[3] << 8 | buffer[2];
> +	if (vendor != ANX7688_VENDOR_ID || device != ANX7688_DEVICE_ID) {
> +		dev_err(dev, "Invalid vendor/device id %04x/%04x\n",
> +			vendor, device);
> +		return -ENODEV;
> +	}
> +
> +	ret = regmap_bulk_read(anx7688->regmap, ANX7688_FW_VERSION_REG,
> +			       buffer, 2);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to read firmware version\n");
> +		return ret;
> +	}
> +
> +	fw_version = (u16)buffer[0] << 8 | buffer[1];
> +	dev_info(dev, "ANX7688 firmware version 0x%04x\n", fw_version);
> +
> +	anx7688->bridge.of_node = dev->of_node;
> +
> +	/* FW version >= 0.85 supports bandwidth/lane count registers */
> +	if (fw_version >= ANX7688_MINIMUM_FW_VERSION)
> +		anx7688->filter = true;
> +	else
> +		/* Warn, but not fail, for backwards compatibility */
> +		DRM_WARN("Old ANX7688 FW version (0x%04x), not filtering\n",
> +			 fw_version);
> +
> +	anx7688->bridge.funcs = &anx7688_bridge_funcs;
> +	drm_bridge_add(&anx7688->bridge);
> +
> +	return 0;
> +}
> +
> +static int anx7688_bridge_remove(struct i2c_client *client)
> +{
> +	struct anx7688 *anx7688 = i2c_get_clientdata(client);
> +
> +	drm_bridge_remove(&anx7688->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id anx7688_bridge_match_table[] = {
> +	{ .compatible = "analogix,anx7688", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, anx7688_bridge_match_table);
> +
> +static struct i2c_driver anx7688_bridge_driver = {
> +	.probe_new = anx7688_bridge_probe,
> +	.remove = anx7688_bridge_remove,
> +	.driver = {
> +		.name = "anx7688-bridge",
> +		.of_match_table = anx7688_bridge_match_table,
> +	},
> +};
> +
> +module_i2c_driver(anx7688_bridge_driver);
> +
> +MODULE_DESCRIPTION("ANX7688 HDMI->DP bridge driver");
> +MODULE_AUTHOR("Nicolas Boichat <drinkcat@chromium.org>");
> +MODULE_AUTHOR("Enric Balletbo i Serra <enric.balletbo@collabora.com>");
> +MODULE_LICENSE("GPL");
> 
