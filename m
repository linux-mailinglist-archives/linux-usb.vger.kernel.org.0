Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49203CD69A
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jul 2021 16:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240506AbhGSNsv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jul 2021 09:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbhGSNsu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jul 2021 09:48:50 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EF8C061574
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 06:55:52 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r11so22281192wro.9
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jTGFyKmyEEnS7Rzt2ir5YF3Fyf30zkeBkab/bmBJND0=;
        b=fx3tjaH/7EZEqqrBewrCepvSqh4lvYqFQqPpAdvNocaBZO4+fcFFZs+FgVSfSELvqJ
         iGoq3s+ilImfC/uUWQaJbFQuAGEIt7wasXlXkTcR7h6V+Jls8iS25uEb6tZlPe21EVjg
         Moc1pFeKDxXe2Hay8ciUFHGXxCTBlkcIoXKakqSDOuGdQKBqYPUNmsnmhWal4narZpc7
         hFHxyMS0hXT98TpeRNA/RMvSJHPN20ltIakiE4DB38adk6rIAFf0RiFQuHiP0OnJClwA
         6Rb4w2kTrV3GlNIsh0tQjJ620Y6qweLDuToodVg/delAotjR3pMRkVauhLS85GDkNemc
         qBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jTGFyKmyEEnS7Rzt2ir5YF3Fyf30zkeBkab/bmBJND0=;
        b=mfctIMTMsiK/oXC1Q3gfrp3UPMt3HHHR5Hk2OG6TlQbC6hoowJ+6va+62OnrxX4Yhr
         IebPGfUG86ZYliFe0NXKGcu1Lhz9Zf4QEx6NH1GfV/GpXTqvK7SMx+7Je7yC5vBYBSiB
         FTg1cTUKVb8DtMczOUa7lXfdYeqUyg5RvshvcPTfZM89/XadVt18O+ZKx9sGG9yAXjFO
         pAy8W8qhp7EQ8SDgftBszZ5OkC+mYUpNPs4dF6ORJTgiCLQeoyZsTfSjeG1ncwcjm+/N
         F6Fth5getAGQwgOxOUmaSp6BiuLWu96scbpWZrBP5wwIY+KsHacnhkLTO8dkEhK6ylsE
         X7lg==
X-Gm-Message-State: AOAM533WmEft29W50j3K5LXDDr/cahx8ZJTDTMCbxw04Obii8AeW2fEC
        RCBwke0Mxlf0T97hH8BAjw==
X-Google-Smtp-Source: ABdhPJx1Kene7P5loF/yOSiMZdNVt1FFsYr4kdAKm10f1BQAHvb7FMK3Kpt5O/r6b1KJ1lI+AtckHg==
X-Received: by 2002:adf:9d88:: with SMTP id p8mr31269588wre.409.1626704967351;
        Mon, 19 Jul 2021 07:29:27 -0700 (PDT)
Received: from [192.168.200.247] (ip5b429fd6.dynamic.kabel-deutschland.de. [91.66.159.214])
        by smtp.gmail.com with ESMTPSA id o11sm160534wmc.2.2021.07.19.07.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 07:29:26 -0700 (PDT)
Subject: Re: [PATCH 1/4] phy: rockchip: add rockchip usb3 innosilicon phy
 driver
To:     Peter Geis <pgwipeout@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     frank.wang@rock-chips.com, zyw@rock-chips.com,
        linux-usb@vger.kernel.org, kever.yang@rock-chips.com,
        linux-rockchip@lists.infradead.org, william.wu@rock-chips.com,
        wulf@rock-chips.com, linux-arm-kernel@lists.infradead.org
References: <20201116151735.178737-1-pgwipeout@gmail.com>
 <20201116151735.178737-2-pgwipeout@gmail.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <6e7a5a02-cd3c-81d3-a473-f87385c41e5a@gmail.com>
Date:   Mon, 19 Jul 2021 16:29:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20201116151735.178737-2-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

thanks for working on this (I hope to have picked the latest version of 
your series).

It's pretty obvious that the quirky innosilicon phy Rockchip decided for 
in RK3328 needs a additional glue layer. Even if this version isn't 
perfect yet (usb3 devices "sometimes" do net get detected if detached 
and attached again) - it makes thing *a lot* better than it is now (IIRC 
its about the same in vendor tree)

So: are you going to rebase this on current upstream?

Regards,

Alex

Am 16.11.20 um 16:17 schrieb Peter Geis:
> The innosilicon based usb3 phy used in rockchip devices such as the rk3328 is bugged, requiring special handling.
> The following erata have been observed:
>   - usb3 device disconnect events are not detected by the controller
>   - usb2 hubs with no devices attached do not trigger disconnect events when removed
>   - interrupts are not reliable
>
> To work around these issue we implement polling of the usb2 and usb3 status.
> On usb3 disconnection we reset the usb3 phy which triggers the disconnect event.
> On usb2 disconnection we have to force reset the whole controller.
> This requires a handoff to a special dwc3 device driver.
>
> This has been tested on the rk3328-roc-cc board with the following devices:
>   - usb2 only device
>   - usb3 only device
>   - usb2 only hub without devices
>   - usb3 hub without devices
>   - usb2 hub with devices
>   - usb3 hub with devices
>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>   drivers/phy/rockchip/Kconfig                  |   9 +
>   drivers/phy/rockchip/Makefile                 |   1 +
>   drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 425 ++++++++++++++++++
>   3 files changed, 435 insertions(+)
>   create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
>
> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
> index c2f22f90736c..ce16e0877354 100644
> --- a/drivers/phy/rockchip/Kconfig
> +++ b/drivers/phy/rockchip/Kconfig
> @@ -47,6 +47,15 @@ config PHY_ROCKCHIP_INNO_USB2
>   	help
>   	  Support for Rockchip USB2.0 PHY with Innosilicon IP block.
>   
> +config PHY_ROCKCHIP_INNO_USB3
> +	tristate "Rockchip INNO USB3PHY Driver"
> +	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> +	depends on COMMON_CLK
> +	depends on USB_SUPPORT
> +	select USB_COMMON
> +	help
> +	  Support for Rockchip USB3.0 PHY with Innosilicon IP block.
> +
>   config PHY_ROCKCHIP_INNO_DSIDPHY
>   	tristate "Rockchip Innosilicon MIPI/LVDS/TTL PHY driver"
>   	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> diff --git a/drivers/phy/rockchip/Makefile b/drivers/phy/rockchip/Makefile
> index c3cfc7f0af5c..738e3574a722 100644
> --- a/drivers/phy/rockchip/Makefile
> +++ b/drivers/phy/rockchip/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_PHY_ROCKCHIP_EMMC)		+= phy-rockchip-emmc.o
>   obj-$(CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY)	+= phy-rockchip-inno-dsidphy.o
>   obj-$(CONFIG_PHY_ROCKCHIP_INNO_HDMI)	+= phy-rockchip-inno-hdmi.o
>   obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB2)	+= phy-rockchip-inno-usb2.o
> +obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB3)	+= phy-rockchip-inno-usb3.o
>   obj-$(CONFIG_PHY_ROCKCHIP_PCIE)		+= phy-rockchip-pcie.o
>   obj-$(CONFIG_PHY_ROCKCHIP_TYPEC)	+= phy-rockchip-typec.o
>   obj-$(CONFIG_PHY_ROCKCHIP_USB)		+= phy-rockchip-usb.o
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb3.c b/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> new file mode 100644
> index 000000000000..6e4aa2f0ba46
> --- /dev/null
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> @@ -0,0 +1,425 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/extcon-provider.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/workqueue.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/usb/phy.h>
> +
> +#define USB3_STATUS_REG 0x284
> +#define USB2_STATUS_REG 0x30
> +#define USB3_CONN_BIT BIT(0)
> +#define USB2_CONN_BIT BIT(7)
> +#define USB2_STATE_SHIFT 6
> +#define REG_WRITE_MASK GENMASK(31, 16)
> +
> +struct rockchip_usb3phy_port{
> +	struct device		*dev;
> +	struct regmap		*regmap;
> +	struct usb_phy		phy;
> +	struct rockchip_usb3phy	*parent;
> +	unsigned char 		type;
> +};
> +
> +enum usb3phy_mode {
> +	PHY_IDLE = 0,
> +	PHY_USB3,
> +	PHY_USB2,
> +	PHY_COMBO
> +};
> +
> +struct rockchip_usb3phy {
> +	struct device			*dev;
> +	struct regmap			*regmap;
> +	struct clk			*clk_pipe;
> +	struct clk			*clk_otg;
> +	struct reset_control		*u3por_rst;
> +	struct reset_control		*u2por_rst;
> +	struct reset_control		*pipe_rst;
> +	struct reset_control		*utmi_rst;
> +	struct reset_control		*pipe_apb_rst;
> +	struct reset_control		*utmi_apb_rst;
> +	struct rockchip_usb3phy_port	port_pipe;
> +	struct rockchip_usb3phy_port	port_utmi;
> +	struct work_struct		usb_phy_work;
> +	struct notifier_block		nb;
> +	enum usb3phy_mode		mode;
> +	struct mutex			lock;
> +};
> +
> +static int rockchip_usb3phy_reset(struct rockchip_usb3phy *usb3phy, bool reset, enum usb3phy_mode mode)
> +{
> +	if (reset == true) {
> +		if ((mode == PHY_USB2) | (mode == PHY_COMBO)){
> +			clk_disable_unprepare(usb3phy->clk_otg);
> +			reset_control_assert(usb3phy->utmi_rst);
> +			reset_control_assert(usb3phy->u2por_rst);
> +		}
> +		if ((mode == PHY_USB3) | (mode == PHY_COMBO)){
> +			clk_disable_unprepare(usb3phy->clk_pipe);
> +			reset_control_assert(usb3phy->pipe_rst);
> +			reset_control_assert(usb3phy->u3por_rst);
> +		}
> +	}
> +
> +	if (reset == false) {
> +		if ((mode == PHY_USB2) | (mode == PHY_COMBO)){
> +			reset_control_deassert(usb3phy->u2por_rst);
> +			udelay(1000);
> +			clk_prepare_enable(usb3phy->clk_otg);
> +			udelay(500);
> +			reset_control_deassert(usb3phy->utmi_rst);
> +		}
> +		if ((mode == PHY_USB3) | (mode == PHY_COMBO)){
> +			reset_control_deassert(usb3phy->u3por_rst);
> +			udelay(500);
> +			clk_prepare_enable(usb3phy->clk_pipe);
> +			udelay(1000);
> +			reset_control_deassert(usb3phy->pipe_rst);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void rockchip_usb3phy_work(struct work_struct *work)
> +{
> +	struct rockchip_usb3phy *usb3phy = container_of(work, struct rockchip_usb3phy, usb_phy_work);
> +	struct rockchip_usb3phy_port *port_pipe = &usb3phy->port_pipe;
> +	struct rockchip_usb3phy_port *port_utmi = &usb3phy->port_utmi;
> +	int usb2, usb3, tmp, state;
> +
> +	mutex_lock(&usb3phy->lock);
> +
> +	regmap_read(port_pipe->regmap, USB3_STATUS_REG, &tmp);
> +	usb3 = tmp & USB3_CONN_BIT;
> +	regmap_read(usb3phy->regmap, USB2_STATUS_REG, &tmp);
> +	usb2 = ((tmp & USB2_CONN_BIT) ^ USB2_CONN_BIT ) >> USB2_STATE_SHIFT;
> +	state = (usb3 | usb2);
> +	dev_dbg(usb3phy->dev, "mode %i, state %i\n", usb3phy->mode, state);
> +
> +	if (usb3phy->mode == state)
> +		/* not our device */
> +		goto out;
> +
> +	if (usb2) {
> +		usb3phy->mode = PHY_USB2;
> +		dev_dbg(usb3phy->dev, "usb3phy utmi polling started\n");
> +		regmap_read_poll_timeout(usb3phy->regmap, USB2_STATUS_REG, tmp, (tmp & USB2_CONN_BIT), 2000, 0);
> +		state = ((tmp & USB2_CONN_BIT) ^ USB2_CONN_BIT ) >> USB2_STATE_SHIFT;
> +		dev_dbg(usb3phy->dev, "usb3phy utmi polling completed\n");
> +
> +		atomic_notifier_call_chain(&port_utmi->phy.notifier, 0, NULL);
> +		goto out;
> +	}
> +
> +	if (usb3) {
> +		dev_dbg(usb3phy->dev, "usb3phy pipe polling started\n");
> +		regmap_read_poll_timeout(port_pipe->regmap, USB3_STATUS_REG, tmp, !(tmp & USB3_CONN_BIT), 2000, 0);
> +		dev_dbg(usb3phy->dev, "usb3phy pipe polling completed\n");
> +
> +		rockchip_usb3phy_reset(usb3phy, true, PHY_USB3);
> +		udelay(500);
> +		rockchip_usb3phy_reset(usb3phy, false, PHY_USB3);
> +		udelay(500);
> +
> +		goto out;
> +	}
> +
> +out:
> +	usb3phy->mode = PHY_IDLE;
> +	mutex_unlock(&usb3phy->lock);
> +	return;
> +}
> +
> +static int rockchip_usb3phy_parse_dt(struct rockchip_usb3phy *usb3phy, struct device *dev)
> +{
> +	usb3phy->clk_pipe = devm_clk_get(dev, "usb3phy-pipe");
> +	if (IS_ERR(usb3phy->clk_pipe)) {
> +		dev_err(dev, "could not get usb3phy pipe clock\n");
> +		return PTR_ERR(usb3phy->clk_pipe);
> +	}
> +
> +	usb3phy->clk_otg = devm_clk_get(dev, "usb3phy-otg");
> +	if (IS_ERR(usb3phy->clk_otg)) {
> +		dev_err(dev, "could not get usb3phy otg clock\n");
> +		return PTR_ERR(usb3phy->clk_otg);
> +	}
> +
> +	usb3phy->u2por_rst = devm_reset_control_get(dev, "usb3phy-u2-por");
> +	if (IS_ERR(usb3phy->u2por_rst)) {
> +		dev_err(dev, "no usb3phy-u2-por reset control found\n");
> +		return PTR_ERR(usb3phy->u2por_rst);
> +	}
> +
> +	usb3phy->u3por_rst = devm_reset_control_get(dev, "usb3phy-u3-por");
> +	if (IS_ERR(usb3phy->u3por_rst)) {
> +		dev_err(dev, "no usb3phy-u3-por reset control found\n");
> +		return PTR_ERR(usb3phy->u3por_rst);
> +	}
> +
> +	usb3phy->pipe_rst = devm_reset_control_get(dev, "usb3phy-pipe-mac");
> +	if (IS_ERR(usb3phy->pipe_rst)) {
> +		dev_err(dev, "no usb3phy_pipe_mac reset control found\n");
> +		return PTR_ERR(usb3phy->pipe_rst);
> +	}
> +
> +	usb3phy->utmi_rst = devm_reset_control_get(dev, "usb3phy-utmi-mac");
> +	if (IS_ERR(usb3phy->utmi_rst)) {
> +		dev_err(dev, "no usb3phy-utmi-mac reset control found\n");
> +		return PTR_ERR(usb3phy->utmi_rst);
> +	}
> +
> +	usb3phy->pipe_apb_rst = devm_reset_control_get(dev, "usb3phy-pipe-apb");
> +	if (IS_ERR(usb3phy->pipe_apb_rst)) {
> +		dev_err(dev, "no usb3phy-pipe-apb reset control found\n");
> +		return PTR_ERR(usb3phy->pipe_apb_rst);
> +	}
> +
> +	usb3phy->utmi_apb_rst = devm_reset_control_get(dev, "usb3phy-utmi-apb");
> +	if (IS_ERR(usb3phy->utmi_apb_rst)) {
> +		dev_err(dev, "no usb3phy-utmi-apb reset control found\n");
> +		return PTR_ERR(usb3phy->utmi_apb_rst);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rockchip_usb3phy_notify(struct notifier_block *nb, unsigned long action, void *data)
> +{
> +	struct rockchip_usb3phy *usb3phy = container_of(nb, struct rockchip_usb3phy, nb);
> +	switch (action) {
> +	case USB_DEVICE_ADD:
> +		dev_dbg(usb3phy->dev, "notified of device add\n");
> +		if (!(mutex_is_locked(&usb3phy->lock)))
> +			schedule_work(&usb3phy->usb_phy_work);
> +		return NOTIFY_OK;
> +	}
> +	return NOTIFY_DONE;
> +}
> +
> +static int rockchip_usb3phy_init(struct usb_phy *phy)
> +{
> +	struct rockchip_usb3phy_port *usb3phy_port = container_of(phy, struct rockchip_usb3phy_port, phy);
> +	struct rockchip_usb3phy *usb3phy = usb3phy_port->parent;
> +
> +	dev_warn(usb3phy->dev, "usb3phy_init %s\n", phy->label);
> +	if (phy->type == USB_PHY_TYPE_USB3){
> +		rockchip_usb3phy_reset(usb3phy, false, PHY_USB3);
> +		udelay(100); /* let it stabilize */
> +		usb3phy->nb.notifier_call = rockchip_usb3phy_notify;
> +		usb_register_notify(&usb3phy->nb);
> +	}
> +	if (phy->type == USB_PHY_TYPE_USB2){
> +		rockchip_usb3phy_reset(usb3phy, false, PHY_USB2);
> +		udelay(100); /* let it stabilize */
> +	}
> +
> +	return 0;
> +}
> +
> +static void rockchip_usb3phy_shutdown(struct usb_phy *phy)
> +{
> +	struct rockchip_usb3phy_port *usb3phy_port = container_of(phy, struct rockchip_usb3phy_port, phy);
> +	struct rockchip_usb3phy *usb3phy = usb3phy_port->parent;
> +
> +	dev_dbg(usb3phy->dev, "usb3phy_shutdown\n");
> +	if (phy->type == USB_PHY_TYPE_USB3){
> +		rockchip_usb3phy_reset(usb3phy, false, PHY_USB3);
> +		usb_unregister_notify(&usb3phy->nb);
> +	}
> +	if (phy->type == USB_PHY_TYPE_USB2){
> +		rockchip_usb3phy_reset(usb3phy, false, PHY_USB2);
> +	}
> +}
> +
> +static const struct regmap_config rockchip_usb3phy_port_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x1000,
> +};
> +
> +static const struct regmap_config rockchip_usb3phy_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x1000,
> +	.write_flag_mask = REG_WRITE_MASK,
> +};
> +
> +static int rockchip_usb3phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct rockchip_usb3phy *usb3phy;
> +	struct rockchip_usb3phy_port *usb3phy_port;
> +	struct regmap_config regmap_config = rockchip_usb3phy_regmap_config;
> +	struct regmap_config regmap_port_config = rockchip_usb3phy_port_regmap_config;
> +	const struct of_device_id *match;
> +	void __iomem *base;
> +	int ret;
> +
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	if (!match) {
> +		dev_err(dev, "phy node not assigned\n");
> +		return -EINVAL;
> +	}
> +
> +	if (of_node_name_eq(np, "usb3-phy")) {
> +		dev_dbg(dev, "Probe usb3phy main block\n");
> +
> +		usb3phy = devm_kzalloc(dev, sizeof(*usb3phy), GFP_KERNEL);
> +		if (!usb3phy)
> +			return -ENOMEM;
> +
> +		ret = rockchip_usb3phy_parse_dt(usb3phy, dev);
> +		if (ret) {
> +			dev_err(dev, "parse dt failed %i\n", ret);
> +			return ret;
> +		}
> +
> +		base = devm_of_iomap(dev, np, 0, NULL);
> +		if (IS_ERR(base)) {
> +			dev_err(dev, "failed port ioremap\n");
> +			return PTR_ERR(base);
> +		}
> +
> +		regmap_config.name = np->name;
> +
> +		usb3phy->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
> +		if (IS_ERR(usb3phy->regmap)) {
> +			dev_err(dev, "regmap init failed\n");
> +			return PTR_ERR(usb3phy->regmap);
> +		}
> +
> +		usb3phy->dev = dev;
> +		platform_set_drvdata(pdev, usb3phy);
> +
> +		/* place block in reset */
> +		reset_control_assert(usb3phy->pipe_rst);
> +		reset_control_assert(usb3phy->utmi_rst);
> +		reset_control_assert(usb3phy->u3por_rst);
> +		reset_control_assert(usb3phy->u2por_rst);
> +		reset_control_assert(usb3phy->pipe_apb_rst);
> +		reset_control_assert(usb3phy->utmi_apb_rst);
> +
> +		udelay(20);
> +
> +		/* take apb interface out of reset */
> +		reset_control_deassert(usb3phy->utmi_apb_rst);
> +		reset_control_deassert(usb3phy->pipe_apb_rst);
> +
> +		usb3phy->mode = PHY_IDLE;
> +		INIT_WORK(&usb3phy->usb_phy_work, rockchip_usb3phy_work);
> +		dev_dbg(dev, "Completed usb3phy core probe \n");
> +
> +		return devm_of_platform_populate(&pdev->dev);
> +	}
> +
> +	/* probe the actual ports */
> +	usb3phy = platform_get_drvdata(of_find_device_by_node(np->parent));
> +
> +	if (of_node_name_eq(np, "utmi")) {
> +		usb3phy_port = &usb3phy->port_utmi;
> +		usb3phy_port->phy.label	= "usb2-phy";
> +		usb3phy_port->phy.type	= USB_PHY_TYPE_USB2;
> +	}
> +	else if (of_node_name_eq(np, "pipe")) {
> +		usb3phy_port = &usb3phy->port_pipe;
> +		usb3phy_port->phy.label	= "usb3-phy";
> +		usb3phy_port->phy.type	= USB_PHY_TYPE_USB3;
> +	}
> +	else {
> +		dev_err(dev, "unknown child node port type %s\n", np->name);
> +		return -EINVAL;
> +	}
> +
> +	usb3phy_port->dev = dev;
> +
> +	base = devm_of_iomap(dev, np, 0, NULL);
> +	if (IS_ERR(base)) {
> +		dev_err(dev, "failed port ioremap\n");
> +		return PTR_ERR(base);
> +	}
> +
> +	regmap_port_config.name = np->name;
> +
> +	usb3phy_port->regmap = devm_regmap_init_mmio(dev, base, &regmap_port_config);
> +	if (IS_ERR(usb3phy_port->regmap)) {
> +		dev_err(dev, "regmap init failed\n");
> +		return PTR_ERR(usb3phy_port->regmap);
> +	}
> +
> +	usb3phy_port->phy.dev = dev;
> +	usb3phy_port->phy.init = rockchip_usb3phy_init;
> +	usb3phy_port->phy.shutdown = rockchip_usb3phy_shutdown;
> +	usb3phy_port->parent = usb3phy;
> +
> +	ret = usb_add_phy_dev(&usb3phy_port->phy);
> +	if (ret) {
> +		dev_err(dev, "add usb phy failed %i\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_init(&usb3phy->lock);
> +
> +	dev_info(dev, "Completed usb3phy %s port init\n", usb3phy_port->phy.label);
> +	return 0;
> +}
> +
> +
> +static int rockchip_usb3phy_remove(struct platform_device *pdev)
> +{
> +	struct rockchip_usb3phy *usb3phy = platform_get_drvdata(pdev);
> +	struct rockchip_usb3phy_port *port_pipe = &usb3phy->port_pipe;
> +	struct rockchip_usb3phy_port *port_utmi = &usb3phy->port_utmi;
> +
> +	if (&port_pipe->phy.head)
> +		usb_remove_phy(&port_pipe->phy);
> +	if (&port_utmi->phy.head)
> +		usb_remove_phy(&port_utmi->phy);
> +
> +	reset_control_assert(usb3phy->pipe_apb_rst);
> +	reset_control_assert(usb3phy->utmi_apb_rst);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rockchip_usb3phy_dt_ids[] = {
> +	{ .compatible = "rockchip,rk3328-usb3phy", },
> +	{ .compatible = "rockchip,rk3328-usb3phy-utmi", },
> +	{ .compatible = "rockchip,rk3328-usb3phy-pipe", },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, rockchip_usb3phy_dt_ids);
> +
> +static struct platform_driver rockchip_usb3phy_driver = {
> +	.probe		= rockchip_usb3phy_probe,
> +	.remove		= rockchip_usb3phy_remove,
> +	.driver		= {
> +		.name	= "rockchip-usb3-phy",
> +		.of_match_table = rockchip_usb3phy_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(rockchip_usb3phy_driver);
> +
> +MODULE_AUTHOR("Peter Geis <pgwipeout@gmail.com>");
> +MODULE_DESCRIPTION("Rockchip USB 3 PHY driver");
> +MODULE_LICENSE("GPL v2");
>
>  From patchwork Mon Nov 16 15:17:34 2020
> Content-Type: text/plain; charset="utf-8"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> X-Patchwork-Submitter: Peter Geis <pgwipeout@gmail.com>
> X-Patchwork-Id: 11909625
> Return-Path:
>   <SRS0=LF/6=EW=lists.infradead.org=linux-rockchip-bounces+patchwork-linux-rockchip=patchwork.kernel.org@kernel.org>
> Received: from mail.kernel.org (pdx-korg-mail-1.web.codeaurora.org
>   [172.30.200.123])
> 	by pdx-korg-patchwork-2.web.codeaurora.org (Postfix) with ESMTP id 55BB9697
> 	for <patchwork-linux-rockchip@patchwork.kernel.org>;
>   Mon, 16 Nov 2020 15:35:06 +0000 (UTC)
> Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by mail.kernel.org (Postfix) with ESMTPS id 0D65A221F9
> 	for <patchwork-linux-rockchip@patchwork.kernel.org>;
>   Mon, 16 Nov 2020 15:35:06 +0000 (UTC)
> Authentication-Results: mail.kernel.org;
> 	dkim=pass (2048-bit key) header.d=lists.infradead.org
>   header.i=@lists.infradead.org header.b="jsfH5g5h";
> 	dkim=fail reason="signature verification failed" (2048-bit key)
>   header.d=infradead.org header.i=@infradead.org header.b="I/yJoMVd";
> 	dkim=fail reason="signature verification failed" (2048-bit key)
>   header.d=gmail.com header.i=@gmail.com header.b="Shq+sOAW"
> DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D65A221F9
> Authentication-Results: mail.kernel.org;
>   dmarc=fail (p=none dis=none) header.from=gmail.com
> Authentication-Results: mail.kernel.org;
>   spf=none
>   smtp.mailfrom=linux-rockchip-bounces+patchwork-linux-rockchip=patchwork.kernel.org@lists.infradead.org
> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
> 	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
> 	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
> 	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
> 	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
> 	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
> 	 bh=LN7oenZpewcGL3cSqtzRVbmzIehtfpcXBk2EI0G63Vs=; b=jsfH5g5hRNdkYJn8xrQ9/LWsI
> 	0V2NUFrRf39IBLF4iB2W0QIVZo1HTOXHHQ9kZWepsMWLawoU6rDYzS2hWfQALS2fpMbW0CEqStGcB
> 	G3H2FD5W1ei4/j4fesAeVussIdB7MLeDRovPLvtcwKymSmwmp5QUkKhJUdQIeMUacyUxuwuFNLQOZ
> 	Gpq7Fs2vfItDG55Smkteh/jpbpxqwiZcLMC4PXXTjjXmsBBzcFuwei2Am3UFmayF+S1YE++166tFI
> 	mNqvkzYS75ERm2qvZBvNMA1wOCwgp8VXjHugJT+kyvO85HNNWUUEmYcDrmZZVOt3WnZtjcAaLnLAl
> 	aQ0aonbbw==;
> Received: from localhost ([::1] helo=merlin.infradead.org)
> 	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
> 	id 1kegWx-0004Yt-45; Mon, 16 Nov 2020 15:34:59 +0000
> Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
>   by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
>   id 1kegQd-0001TW-Fm; Mon, 16 Nov 2020 15:28:27 +0000
> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
>   d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
>   References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
>   Content-Type:Content-ID:Content-Description;
>   bh=w34tgFsfoNSL9WZ/5ErfIg33MWZNf9bk46tXnv+A4zs=; b=I/yJoMVde6ej6+DmxTSMArIqtb
>   +WsxPwGfFlDF0UwIAcG73Vo/X0mwdQff6aL6slWJR4B4P91R0/Q3dnlI1jXuDQ+a6XoQ7CaBRZhTl
>   lub2ox6kDJbxKAdiHWLy/QryyyjJ9WLmoshiweiwnkuo7GWFu0LDYQSS28s117rYQFxl271V1TPsL
>   0J8abmbkXkg/wU2NA+mntkqY64Sw+BG+5hpQ4Rb9ipAxCRQkOnxb2oZFpC2gFEaq66ZFqFugftQw4
>   AKd0CzZ4vX7aQJxE5Je4Wqam6TvTqMbLH7O6FRpI6jRClZ/+3MuUtoOb2EiX0EJFH9Vhx5YFm8hlg
>   bT90699A==;
> Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
>   by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
>   id 1kegHu-0006st-Gk; Mon, 16 Nov 2020 15:19:34 +0000
> Received: by mail-qv1-xf41.google.com with SMTP id u23so1477447qvf.1;
>   Mon, 16 Nov 2020 07:19:25 -0800 (PST)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
>   h=from:to:cc:subject:date:message-id:in-reply-to:references
>   :mime-version:content-transfer-encoding;
>   bh=w34tgFsfoNSL9WZ/5ErfIg33MWZNf9bk46tXnv+A4zs=;
>   b=Shq+sOAW4lgOPgBS5y9b0hdkqGvjhkRYMTvpIVckQyvqL4k6SOfTOZQGLiO6HIixU5
>   GtByhu2Wav9gcY1forc0KxdAdHkMC6xyNiFSH8EHH+MV9gmLLPCFOnfpJIpnA2bpL6c9
>   VbMoGQVzAdGpB0ER8/3/PR3g4LGAU0NeJq9tjqY/7PmFdcjb5EjpnsDg5kc13C8wZsE+
>   DOg7JUxRhYNN45OTnzcCmHoJ8WwSP5/83G4l5qUmV9c8c58S2tCGbrN27THnQyEEs8nt
>   n8ePpL7qyB3nZvJxRCdVy+QXJYX6CGUrQO2/z6gAYnCvUi16a5gLRYj2qhvrjeJxpUR3
>   eyZg==
> X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
>   d=1e100.net; s=20161025;
>   h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
>   :references:mime-version:content-transfer-encoding;
>   bh=w34tgFsfoNSL9WZ/5ErfIg33MWZNf9bk46tXnv+A4zs=;
>   b=BftVMckt31dk68xTgH5o/1SgXjlN75sM5315E6Bb0M82B6aX7sqkYCQn6z3XOJ+6ET
>   ugwwgkyh2UrfHJSeULJwyWoaCkypl+0Pob5vZjA/n0sd5ofiG4PpgP+iID+eeOkIHBEC
>   rDiKHVVFBNKLNiR3JwDxTJEIaISaYquvcuKF3PHCBPVDBBXjdGmj1fzt3FPOVKI/khjK
>   3HPzI5RRYd51VKvY6YXuMcyq3cPmQ3EVnbQMgiwoSYXJMwA7iQtAaSZJqUsWETim9MVz
>   XJcYTlHw9LwYQ2qlJP+Ty/znMuLX9hO995+xWRmO7H9rgVRAOpxg2j5djRNtLz/+HDKF
>   nBtw==
> X-Gm-Message-State: AOAM533DA882tZ2X8Z1wvuAKDIUdYC52kpsejBvhf37MlDgjtiP3SB9F
>   XAKYdNg3Xb/H1Ejku+EhBKU=
> X-Google-Smtp-Source:
>   ABdhPJzR0XL0NJX31+OywaRPuQxtyQR1QdfhOmqO+/GGz2NIIr+GkJzf1aSvkVIcmho99HCQ8jH97w==
> X-Received: by 2002:ad4:47b0:: with SMTP id a16mr15565115qvz.22.1605539961774;
>   Mon, 16 Nov 2020 07:19:21 -0800 (PST)
> Received: from rockpro64.sparksnet ([2601:153:900:7730::20])
>   by smtp.gmail.com with ESMTPSA id p127sm12216818qkc.37.2020.11.16.07.19.20
>   (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
>   Mon, 16 Nov 2020 07:19:21 -0800 (PST)
> From: Peter Geis <pgwipeout@gmail.com>
> To: Felipe Balbi <balbi@kernel.org>,
>   Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
>   Heiko Stuebner <heiko@sntech.de>
> Subject: [PATCH 2/4] usb: dwc3: add rockchip innosilicon usb3 glue layer
> Date: Mon, 16 Nov 2020 15:17:34 +0000
> Message-Id: <20201116151735.178737-3-pgwipeout@gmail.com>
> X-Mailer: git-send-email 2.25.1
> In-Reply-To: <20201116151735.178737-1-pgwipeout@gmail.com>
> References: <20201116151735.178737-1-pgwipeout@gmail.com>
> MIME-Version: 1.0
> X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3
> X-CRM114-CacheID: sfid-20201116_151926_870482_5B810876
> X-CRM114-Status: GOOD (  25.52  )
> X-Spam-Score: -2.1 (--)
> X-Spam-Report: SpamAssassin version 3.4.4 on casper.infradead.org summary:
>   Content analysis details:   (-2.1 points, 5.0 required)
>   pts rule name              description
>   ---- ----------------------
>   --------------------------------------------------
>   -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
>   no trust [2607:f8b0:4864:20:0:0:0:f41 listed in]
>   [list.dnswl.org]
>   -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
>   [score: 0.0000]
>   -0.0 SPF_PASS               SPF: sender matches SPF record
>   0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
>   0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
>   provider [pgwipeout[at]gmail.com]
>   -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
>   author's domain
>   -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
>   envelope-from domain
>   0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
>   not necessarily
>   valid
>   -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
> X-BeenThere: linux-rockchip@lists.infradead.org
> X-Mailman-Version: 2.1.29
> Precedence: list
> List-Id: Upstream kernel work for Rockchip platforms
>   <linux-rockchip.lists.infradead.org>
> List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
>   <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
> List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
> List-Post: <mailto:linux-rockchip@lists.infradead.org>
> List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
> List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
>   <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
> Cc: frank.wang@rock-chips.com, zyw@rock-chips.com, linux-usb@vger.kernel.org,
>   kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
>   Peter Geis <pgwipeout@gmail.com>, william.wu@rock-chips.com,
>   wulf@rock-chips.com, linux-arm-kernel@lists.infradead.org
> Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
> Errors-To:
>   linux-rockchip-bounces+patchwork-linux-rockchip=patchwork.kernel.org@lists.infradead.org
>
> This adds the handler glue for the rockchip usb3 innosilicon phy driver.
> This driver attaches to the phy driver through the notification system.
> When a usb2 disconnect event occurs this driver tears down the hcd and rebuilds it manually.
> This is to work around the usb2 controller becoming wedged and not detecting any usb2 devices after a usb2 hub is removed.
>
> It is based off work originally done by rockchip.
>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>   drivers/usb/dwc3/Kconfig              |  10 +
>   drivers/usb/dwc3/Makefile             |   1 +
>   drivers/usb/dwc3/dwc3-rockchip-inno.c | 271 ++++++++++++++++++++++++++
>   3 files changed, 282 insertions(+)
>   create mode 100644 drivers/usb/dwc3/dwc3-rockchip-inno.c
>
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 7a2304565a73..2e33a45f55ff 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -139,4 +139,14 @@ config USB_DWC3_QCOM
>   	  for peripheral mode support.
>   	  Say 'Y' or 'M' if you have one such device.
>   
> +config USB_DWC3_ROCKCHIP_INNO
> +	tristate "Rockchip Platforms with INNO PHY"
> +	depends on OF && COMMON_CLK && ARCH_ROCKCHIP
> +	depends on USB=y || USB=USB_DWC3
> +	default USB_DWC3
> +	help
> +	  Support of USB2/3 functionality in Rockchip platforms
> +	  with INNO USB 3.0 PHY IP inside.
> +	  say 'Y' or 'M' if you have one such device.
> +
>   endif
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index ae86da0dc5bd..f5eb7de10128 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -51,3 +51,4 @@ obj-$(CONFIG_USB_DWC3_MESON_G12A)	+= dwc3-meson-g12a.o
>   obj-$(CONFIG_USB_DWC3_OF_SIMPLE)	+= dwc3-of-simple.o
>   obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
>   obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
> +obj-$(CONFIG_USB_DWC3_ROCKCHIP_INNO)	+= dwc3-rockchip-inno.o
> diff --git a/drivers/usb/dwc3/dwc3-rockchip-inno.c b/drivers/usb/dwc3/dwc3-rockchip-inno.c
> new file mode 100644
> index 000000000000..7007ddbcbdae
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-rockchip-inno.c
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dwc3-rockchip-inno.c - DWC3 glue layer for Rockchip devices with Innosilicon based PHY
> + *
> + * Based on dwc3-of-simple.c
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/clk.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <linux/workqueue.h>
> +#include <linux/usb.h>
> +#include <linux/usb/hcd.h>
> +#include <linux/usb/phy.h>
> +
> +#include "core.h"
> +#include "../host/xhci.h"
> +
> +
> +struct dwc3_rk_inno {
> +	struct device		*dev;
> +	struct clk_bulk_data	*clks;
> +	struct dwc3		*dwc;
> +	struct usb_phy		*phy;
> +	struct notifier_block	reset_nb;
> +	struct work_struct	reset_work;
> +	struct mutex		lock;
> +	int			num_clocks;
> +	struct reset_control	*resets;
> +};
> +
> +static int dwc3_rk_inno_host_reset_notifier(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +	struct dwc3_rk_inno	*rk_inno = container_of(nb, struct dwc3_rk_inno, reset_nb);
> +
> +	schedule_work(&rk_inno->reset_work);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void dwc3_rk_inno_host_reset_work(struct work_struct *work)
> +{
> +	struct dwc3_rk_inno	*rk_inno = container_of(work, struct dwc3_rk_inno, reset_work);
> +	struct usb_hcd		*hcd = dev_get_drvdata(&rk_inno->dwc->xhci->dev);
> +	struct usb_hcd		*shared_hcd = hcd->shared_hcd;
> +	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
> +	unsigned int		count = 0;
> +
> +	mutex_lock(&rk_inno->lock);
> +
> +	if (hcd->state != HC_STATE_HALT) {
> +		usb_remove_hcd(shared_hcd);
> +		usb_remove_hcd(hcd);
> +	}
> +
> +	if (rk_inno->phy)
> +		usb_phy_shutdown(rk_inno->phy);
> +
> +	while (hcd->state != HC_STATE_HALT) {
> +		if (++count > 1000) {
> +			dev_err(rk_inno->dev, "wait for HCD remove 1s timeout!\n");
> +			break;
> +		}
> +		usleep_range(1000, 1100);
> +	}
> +
> +	if (hcd->state == HC_STATE_HALT) {
> +		xhci->shared_hcd = shared_hcd;
> +		usb_add_hcd(hcd, hcd->irq, IRQF_SHARED);
> +		usb_add_hcd(shared_hcd, hcd->irq, IRQF_SHARED);
> +	}
> +
> +	if (rk_inno->phy)
> +		usb_phy_init(rk_inno->phy);
> +
> +	mutex_unlock(&rk_inno->lock);
> +	dev_dbg(rk_inno->dev, "host reset complete\n");
> +}
> +
> +static int dwc3_rk_inno_probe(struct platform_device *pdev)
> +{
> +	struct dwc3_rk_inno	*rk_inno;
> +	struct device		*dev = &pdev->dev;
> +	struct device_node	*np = dev->of_node, *child, *node;
> +	struct platform_device	*child_pdev;
> +
> +	int			ret;
> +
> +	rk_inno = devm_kzalloc(dev, sizeof(*rk_inno), GFP_KERNEL);
> +	if (!rk_inno)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, rk_inno);
> +	rk_inno->dev = dev;
> +
> +	rk_inno->resets = of_reset_control_array_get(np, false, true,
> +						    true);
> +	if (IS_ERR(rk_inno->resets)) {
> +		ret = PTR_ERR(rk_inno->resets);
> +		dev_err(dev, "failed to get device resets, err=%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = reset_control_deassert(rk_inno->resets);
> +	if (ret)
> +		goto err_resetc_put;
> +
> +	ret = clk_bulk_get_all(rk_inno->dev, &rk_inno->clks);
> +	if (ret < 0)
> +		goto err_resetc_assert;
> +
> +	rk_inno->num_clocks = ret;
> +	ret = clk_bulk_prepare_enable(rk_inno->num_clocks, rk_inno->clks);
> +	if (ret)
> +		goto err_resetc_assert;
> +
> +	ret = of_platform_populate(np, NULL, NULL, dev);
> +	if (ret)
> +		goto err_clk_put;
> +
> +	child = of_get_child_by_name(np, "dwc3");
> +	if (!child) {
> +		dev_err(dev, "failed to find dwc3 core node\n");
> +		ret = -ENODEV;
> +		goto err_plat_depopulate;
> +	}
> +
> +	child_pdev = of_find_device_by_node(child);
> +	if (!child_pdev) {
> +		dev_err(dev, "failed to get dwc3 core device\n");
> +		ret = -ENODEV;
> +		goto err_plat_depopulate;
> +	}
> +
> +	rk_inno->dwc = platform_get_drvdata(child_pdev);
> +	if (!rk_inno->dwc || !rk_inno->dwc->xhci) {
> +		ret = -EPROBE_DEFER;
> +		goto err_plat_depopulate;
> +	}
> +
> +	node = of_parse_phandle(child, "usb-phy", 0);
> +	INIT_WORK(&rk_inno->reset_work, dwc3_rk_inno_host_reset_work);
> +	rk_inno->reset_nb.notifier_call = dwc3_rk_inno_host_reset_notifier;
> +	rk_inno->phy = devm_usb_get_phy_by_node(dev, node, &rk_inno->reset_nb);
> +	of_node_put(node);
> +	mutex_init(&rk_inno->lock);
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);
> +
> +	return 0;
> +
> +err_plat_depopulate:
> +	of_platform_depopulate(dev);
> +
> +err_clk_put:
> +	clk_bulk_disable_unprepare(rk_inno->num_clocks, rk_inno->clks);
> +	clk_bulk_put_all(rk_inno->num_clocks, rk_inno->clks);
> +
> +err_resetc_assert:
> +	reset_control_assert(rk_inno->resets);
> +
> +err_resetc_put:
> +	reset_control_put(rk_inno->resets);
> +	return ret;
> +}
> +
> +static void __dwc3_rk_inno_teardown(struct dwc3_rk_inno *rk_inno)
> +{
> +	of_platform_depopulate(rk_inno->dev);
> +
> +	clk_bulk_disable_unprepare(rk_inno->num_clocks, rk_inno->clks);
> +	clk_bulk_put_all(rk_inno->num_clocks, rk_inno->clks);
> +	rk_inno->num_clocks = 0;
> +
> +	reset_control_assert(rk_inno->resets);
> +
> +	reset_control_put(rk_inno->resets);
> +
> +	pm_runtime_disable(rk_inno->dev);
> +	pm_runtime_put_noidle(rk_inno->dev);
> +	pm_runtime_set_suspended(rk_inno->dev);
> +}
> +
> +static int dwc3_rk_inno_remove(struct platform_device *pdev)
> +{
> +	struct dwc3_rk_inno	*rk_inno = platform_get_drvdata(pdev);
> +
> +	__dwc3_rk_inno_teardown(rk_inno);
> +
> +	return 0;
> +}
> +
> +static void dwc3_rk_inno_shutdown(struct platform_device *pdev)
> +{
> +	struct dwc3_rk_inno	*rk_inno = platform_get_drvdata(pdev);
> +
> +	__dwc3_rk_inno_teardown(rk_inno);
> +}
> +
> +static int __maybe_unused dwc3_rk_inno_runtime_suspend(struct device *dev)
> +{
> +	struct dwc3_rk_inno	*rk_inno = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable(rk_inno->num_clocks, rk_inno->clks);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dwc3_rk_inno_runtime_resume(struct device *dev)
> +{
> +	struct dwc3_rk_inno	*rk_inno = dev_get_drvdata(dev);
> +
> +	return clk_bulk_enable(rk_inno->num_clocks, rk_inno->clks);
> +}
> +
> +static int __maybe_unused dwc3_rk_inno_suspend(struct device *dev)
> +{
> +	struct dwc3_rk_inno *rk_inno = dev_get_drvdata(dev);
> +
> +	reset_control_assert(rk_inno->resets);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dwc3_rk_inno_resume(struct device *dev)
> +{
> +	struct dwc3_rk_inno *rk_inno = dev_get_drvdata(dev);
> +
> +	reset_control_deassert(rk_inno->resets);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops dwc3_rk_inno_dev_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_rk_inno_suspend, dwc3_rk_inno_resume)
> +	SET_RUNTIME_PM_OPS(dwc3_rk_inno_runtime_suspend,
> +			dwc3_rk_inno_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id of_dwc3_rk_inno_match[] = {
> +	{ .compatible = "rockchip,rk3328-dwc3" },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_dwc3_rk_inno_match);
> +
> +static struct platform_driver dwc3_rk_inno_driver = {
> +	.probe		= dwc3_rk_inno_probe,
> +	.remove		= dwc3_rk_inno_remove,
> +	.shutdown	= dwc3_rk_inno_shutdown,
> +	.driver		= {
> +		.name	= "dwc3-rk-inno",
> +		.of_match_table = of_dwc3_rk_inno_match,
> +		.pm	= &dwc3_rk_inno_dev_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(dwc3_rk_inno_driver);
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("DesignWare USB3 Rockchip Innosilicon Glue Layer");
> +MODULE_AUTHOR("Peter Geis <pgwipeout@gmail.com>");
>
>  From patchwork Mon Nov 16 15:17:35 2020
> Content-Type: text/plain; charset="utf-8"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> X-Patchwork-Submitter: Peter Geis <pgwipeout@gmail.com>
> X-Patchwork-Id: 11909615
> Return-Path:
>   <SRS0=LF/6=EW=lists.infradead.org=linux-rockchip-bounces+patchwork-linux-rockchip=patchwork.kernel.org@kernel.org>
> Received: from mail.kernel.org (pdx-korg-mail-1.web.codeaurora.org
>   [172.30.200.123])
> 	by pdx-korg-patchwork-2.web.codeaurora.org (Postfix) with ESMTP id EA33415E6
> 	for <patchwork-linux-rockchip@patchwork.kernel.org>;
>   Mon, 16 Nov 2020 15:31:22 +0000 (UTC)
> Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by mail.kernel.org (Postfix) with ESMTPS id B11162068D
> 	for <patchwork-linux-rockchip@patchwork.kernel.org>;
>   Mon, 16 Nov 2020 15:31:22 +0000 (UTC)
> Authentication-Results: mail.kernel.org;
> 	dkim=pass (2048-bit key) header.d=lists.infradead.org
>   header.i=@lists.infradead.org header.b="x23I+l2Q";
> 	dkim=fail reason="signature verification failed" (2048-bit key)
>   header.d=gmail.com header.i=@gmail.com header.b="TQ6YksiZ"
> DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B11162068D
> Authentication-Results: mail.kernel.org;
>   dmarc=fail (p=none dis=none) header.from=gmail.com
> Authentication-Results: mail.kernel.org;
>   spf=none
>   smtp.mailfrom=linux-rockchip-bounces+patchwork-linux-rockchip=patchwork.kernel.org@lists.infradead.org
> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
> 	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
> 	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
> 	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
> 	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
> 	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
> 	 bh=aE1uTQlB4dk5p9/bUtsD5nvR7JrGDJXbvP9wv4F1ZKI=; b=x23I+l2QaPeAYNgh1fxzAurB3
> 	QjOFUQhBqj16/RePwVYUcdLuXkvmgvQJmYQAQYb5epwVlv0WvjuacH9QG9GCs/PliUoNU7mDF7RYw
> 	8uONuYUvFMNrGDJOkkvhpJTjSNe2bqT3lsl/0Il7uXyRFirFZDOiUxOiwFarwZBU0i9zzUWYr8w3h
> 	LpMer1kXqSZqIsA10vCZvQcjtGv/rb1BkYfQx4fBFTlVsQL/IzxF3AuVpUTzgBsWnBtYJHDO/yxX1
> 	56efJlMxvuHI1xFla8xqwcoM0bFBECHvKTR/b+G3wJRxKeqTEo/lI1IfZNbBOL+Js4eC0xHJ0iTz6
> 	d76+Tz4zw==;
> Received: from localhost ([::1] helo=merlin.infradead.org)
> 	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
> 	id 1kegTM-0002lq-4l; Mon, 16 Nov 2020 15:31:16 +0000
> Received: from mail-qt1-f196.google.com ([209.85.160.196])
>   by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
>   id 1kegHx-0005uU-Du; Mon, 16 Nov 2020 15:19:36 +0000
> Received: by mail-qt1-f196.google.com with SMTP id i12so13089259qtj.0;
>   Mon, 16 Nov 2020 07:19:25 -0800 (PST)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
>   h=from:to:cc:subject:date:message-id:in-reply-to:references
>   :mime-version:content-transfer-encoding;
>   bh=96RQbd3xbCoXq8nQaSvV25c7fBVmlkmtbILb9lLEVCc=;
>   b=TQ6YksiZV6nNmzn4KO6jK2ge1GzMrVa1svfsXapdp9thN3ZUITDdwUlTzSQ0dpPfYh
>   geJEUW344+HQEFlZGBdjxMnMLhik6/mV6ADVcbT3dcFj5ZmuPJMqf99UPMdFtOQ5SRCu
>   l0mpSd8SbWCQzEWYmoVQHhDJagRUKY6VJx2b/7PyNT0y3Sc1k3nXvUwRGgSI8ATwKsVg
>   EgSP3JXy+7c/c97LZ3iuSAizuQdabqNXYl2n/CbhyjZcD1ynxklduF7zgxG8Cue0Ep//
>   SLy5RtiE1RgsFHn4qvsJ1VXdbYByCqZPe6XeDMOLG93/5CWupms4iy90imhdFk1Moqze
>   BWyg==
> X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
>   d=1e100.net; s=20161025;
>   h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
>   :references:mime-version:content-transfer-encoding;
>   bh=96RQbd3xbCoXq8nQaSvV25c7fBVmlkmtbILb9lLEVCc=;
>   b=R+N2/Nie35nxV6pv8yn6t+yDKqt40CKPJXAcIy9OgMz0RRtcED3IqO5WKO/nfCS1fS
>   qwp7lGWDJ+J1SwxRaqunw8/qem9Tv6jbi+z22DdMEidJmESa1optaFVnrXMro2XA0iQw
>   xucg/cptTdJgUnyJobh4o1Mrns6JjgtcrrJqcUI1VCP/EsgVueho66W4pvEdrFbjDas9
>   YOvnokQojqgbgMjTbYCo7aEgKKDKaZxnxzBSLdSDyG4Gw3B3Lp7tiQQqVQiJdqsa4n+C
>   yIO0hMHg7KS7y3jQxuYm/0zNSl0DelNLHiVqm29wJgO5ETXVR/WuU5Tbbba53cObObXm
>   sj4Q==
> X-Gm-Message-State: AOAM531bj2SyMyUS74FYoL6yfb2Y9zgiazHGzcvUi7SkFSpF7tiObRBs
>   1QK+z/JakzqgTDh1OcYd+qg=
> X-Google-Smtp-Source:
>   ABdhPJyyrcB8/QuxOXY/HwMuNFrHfoL262pDdTeD92yflaQrFlebYxfBUlull52uCQufmLKxtF3Dbw==
> X-Received: by 2002:ac8:5ccc:: with SMTP id
>   s12mr14307478qta.309.1605539962795;
>   Mon, 16 Nov 2020 07:19:22 -0800 (PST)
> Received: from rockpro64.sparksnet ([2601:153:900:7730::20])
>   by smtp.gmail.com with ESMTPSA id p127sm12216818qkc.37.2020.11.16.07.19.21
>   (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
>   Mon, 16 Nov 2020 07:19:22 -0800 (PST)
> From: Peter Geis <pgwipeout@gmail.com>
> To: Felipe Balbi <balbi@kernel.org>,
>   Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
>   Heiko Stuebner <heiko@sntech.de>
> Subject: [PATCH 3/4] arm64: dts: rockchip: add rk3328 usb3 and usb3phy nodes
> Date: Mon, 16 Nov 2020 15:17:35 +0000
> Message-Id: <20201116151735.178737-4-pgwipeout@gmail.com>
> X-Mailer: git-send-email 2.25.1
> In-Reply-To: <20201116151735.178737-1-pgwipeout@gmail.com>
> References: <20201116151735.178737-1-pgwipeout@gmail.com>
> MIME-Version: 1.0
> X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3
> X-CRM114-CacheID: sfid-20201116_101929_565628_4646539B
> X-CRM114-Status: GOOD (  12.32  )
> X-Spam-Score: -0.2 (/)
> X-Spam-Report: SpamAssassin version 3.4.4 on merlin.infradead.org summary:
>   Content analysis details:   (-0.2 points)
>   pts rule name              description
>   ---- ----------------------
>   --------------------------------------------------
>   -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
>   no trust [209.85.160.196 listed in list.dnswl.org]
>   0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
>   [209.85.160.196 listed in wl.mailspike.net]
>   -0.0 SPF_PASS               SPF: sender matches SPF record
>   0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
>   0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
>   provider [pgwipeout[at]gmail.com]
>   -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
>   -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
>   envelope-from domain
>   -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
>   author's domain
>   0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
>   not necessarily
>   valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
> X-BeenThere: linux-rockchip@lists.infradead.org
> X-Mailman-Version: 2.1.29
> Precedence: list
> List-Id: Upstream kernel work for Rockchip platforms
>   <linux-rockchip.lists.infradead.org>
> List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
>   <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
> List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
> List-Post: <mailto:linux-rockchip@lists.infradead.org>
> List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
> List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
>   <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
> Cc: frank.wang@rock-chips.com, zyw@rock-chips.com, linux-usb@vger.kernel.org,
>   kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
>   Peter Geis <pgwipeout@gmail.com>, william.wu@rock-chips.com,
>   wulf@rock-chips.com, linux-arm-kernel@lists.infradead.org
> Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
> Errors-To:
>   linux-rockchip-bounces+patchwork-linux-rockchip=patchwork.kernel.org@lists.infradead.org
>
> Add the usb3 controller and usb3 phy nodes to the rk3328.
>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3328.dtsi | 65 ++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index bbdb19a3e85d..9fea9203d114 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -853,6 +853,40 @@ u2phy_host: host-port {
>   		};
>   	};
>   
> +	usb3phy: usb3-phy@ff470000 {
> +		compatible = "rockchip,rk3328-usb3phy";
> +		reg = <0x0 0xff460000 0x0 0x10000>;
> +		clocks = <&cru PCLK_USB3PHY_OTG>, <&cru PCLK_USB3PHY_PIPE>;
> +		clock-names = "usb3phy-otg", "usb3phy-pipe";
> +		resets = <&cru SRST_USB3PHY_U2>,
> +			 <&cru SRST_USB3PHY_U3>,
> +			 <&cru SRST_USB3PHY_PIPE>,
> +			 <&cru SRST_USB3OTG_UTMI>,
> +			 <&cru SRST_USB3PHY_OTG_P>,
> +			 <&cru SRST_USB3PHY_PIPE_P>;
> +		reset-names = "usb3phy-u2-por", "usb3phy-u3-por",
> +			      "usb3phy-pipe-mac", "usb3phy-utmi-mac",
> +			      "usb3phy-utmi-apb", "usb3phy-pipe-apb";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		status = "disabled";
> +
> +		usb3phy_utmi: utmi@ff470000 {
> +			compatible = "rockchip,rk3328-usb3phy-utmi";
> +			reg = <0x0 0xff470000 0x0 0x8000>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		usb3phy_pipe: pipe@ff478000 {
> +			compatible = "rockchip,rk3328-usb3phy-pipe";
> +			reg = <0x0 0xff478000 0x0 0x8000>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +	};
> +
>   	sdmmc: mmc@ff500000 {
>   		compatible = "rockchip,rk3328-dw-mshc", "rockchip,rk3288-dw-mshc";
>   		reg = <0x0 0xff500000 0x0 0x4000>;
> @@ -983,6 +1017,37 @@ usb_host0_ohci: usb@ff5d0000 {
>   		status = "disabled";
>   	};
>   
> +       usbdrd3: usb@ff600000 {
> +		compatible = "rockchip,rk3328-dwc3";
> +		clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
> +			 <&cru SCLK_USB3OTG_SUSPEND>;
> +		clock-names = "ref", "bus_early", "suspend";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		status = "disabled";
> +
> +		usbdrd_dwc3: dwc3@ff600000 {
> +			compatible = "snps,dwc3";
> +			reg = <0x0 0xff600000 0x0 0x100000>;
> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
> +				 <&cru SCLK_USB3OTG_SUSPEND>;
> +			clock-names = "ref", "bus_early", "suspend";
> +			dr_mode = "host";
> +			usb-phy = <&usb3phy_utmi>, <&usb3phy_pipe>;
> +			phy_type = "utmi_wide";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis-u2-freeclk-exists-quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis-tx-ipgap-linecheck-quirk;
> +			snps,xhci-trb-ent-quirk;
> +			status = "disabled";
> +		};
> +	};
> +
>   	gic: interrupt-controller@ff811000 {
>   		compatible = "arm,gic-400";
>   		#interrupt-cells = <3>;
>
>  From patchwork Mon Nov 16 15:17:36 2020
> Content-Type: text/plain; charset="utf-8"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> X-Patchwork-Submitter: Peter Geis <pgwipeout@gmail.com>
> X-Patchwork-Id: 11909629
> Return-Path:
>   <SRS0=LF/6=EW=lists.infradead.org=linux-rockchip-bounces+patchwork-linux-rockchip=patchwork.kernel.org@kernel.org>
> Received: from mail.kernel.org (pdx-korg-mail-1.web.codeaurora.org
>   [172.30.200.123])
> 	by pdx-korg-patchwork-2.web.codeaurora.org (Postfix) with ESMTP id 26236697
> 	for <patchwork-linux-rockchip@patchwork.kernel.org>;
>   Mon, 16 Nov 2020 15:35:19 +0000 (UTC)
> Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by mail.kernel.org (Postfix) with ESMTPS id D2F812076E
> 	for <patchwork-linux-rockchip@patchwork.kernel.org>;
>   Mon, 16 Nov 2020 15:35:18 +0000 (UTC)
> Authentication-Results: mail.kernel.org;
> 	dkim=pass (2048-bit key) header.d=lists.infradead.org
>   header.i=@lists.infradead.org header.b="uUuchFSc";
> 	dkim=fail reason="signature verification failed" (2048-bit key)
>   header.d=infradead.org header.i=@infradead.org header.b="RZqLuJOp";
> 	dkim=fail reason="signature verification failed" (2048-bit key)
>   header.d=gmail.com header.i=@gmail.com header.b="UHuHKb1w"
> DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2F812076E
> Authentication-Results: mail.kernel.org;
>   dmarc=fail (p=none dis=none) header.from=gmail.com
> Authentication-Results: mail.kernel.org;
>   spf=none
>   smtp.mailfrom=linux-rockchip-bounces+patchwork-linux-rockchip=patchwork.kernel.org@lists.infradead.org
> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
> 	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
> 	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
> 	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
> 	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
> 	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
> 	 bh=Et9bnnJA6iG/rLDpchCS0bxRlQgBQpayEZxT3kS/J04=; b=uUuchFScHUR3b189VxGoFe7ZJ
> 	f8UsD3AWi3Om64ppw6AXlm4tP08vMxQfTIMrkiKhGBiZRvq0lhUCP+2B5eja79gFOoVCDXlh6tcMW
> 	jMKsd4XE4kDjzdc8zOgaaRAIzqfKZO020x0rI+aSdsKP1RRjZvgOEcW42y9nVk5DvaClraJvvH8DI
> 	IFlobhRZIHWby2I07FDdu6ukufcnoeKBQcQobYcNNVf8GItjsuaM6kF4iqVsqswrCzIfmkLURi6uT
> 	mE/kogci38lrqpqANoN6L8/4hzO62dVDKr8sd1TSuh3KeTNQNgl+PT/jkgOeG2b5Jc3VblJ6y2YsU
> 	gHPmjrGRQ==;
> Received: from localhost ([::1] helo=merlin.infradead.org)
> 	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
> 	id 1kegXA-0004fY-1W; Mon, 16 Nov 2020 15:35:12 +0000
> Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
>   by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
>   id 1kegQg-0001TW-6H; Mon, 16 Nov 2020 15:28:30 +0000
> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
>   d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
>   References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
>   Content-Type:Content-ID:Content-Description;
>   bh=eWtERLXExs4DoM6gWGaTUFy6iPC/nCVkimSM+qIDVKM=; b=RZqLuJOpu1Jh2eT0FovM5VjZBD
>   68c5MPR8nuwlrXCz8KN/dAk5oDaR04d9WZmnssPGmelKS+l25SyEs8LETRbImd6eB7BCAzNVsanlG
>   rU/AbCP1gT+VTscXhuNFeQ9Rv0PJd5rFpz902eARSbqROnhPvuTs/CD8UK+IbEWg/Ar7Tt/ekhG5S
>   Ksf1+shXUzmxIn6zLlTNURs4EdEn9elKsGjOGoVwmrVKnCNGC41ERv/gZrHXMtKkxCF1hpPvhbVwZ
>   fGW6PPV8iYBJ9ptpKMej9Prn9Xu3nmPlIr7c/flyPh2nQMkFVsCiNjA4ih/CTXFKIHljhxe3DBeXG
>   dfEe96uQ==;
> Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
>   by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
>   id 1kegHu-0006sv-4T; Mon, 16 Nov 2020 15:19:30 +0000
> Received: by mail-qt1-x844.google.com with SMTP id f93so13042784qtb.10;
>   Mon, 16 Nov 2020 07:19:26 -0800 (PST)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
>   h=from:to:cc:subject:date:message-id:in-reply-to:references
>   :mime-version:content-transfer-encoding;
>   bh=eWtERLXExs4DoM6gWGaTUFy6iPC/nCVkimSM+qIDVKM=;
>   b=UHuHKb1wyzJgScpQpTHI+khKWYoA0r+5oV4I4cL+EXw762BNPY6IkiLTLnw7WI6vXX
>   XFRXGWlHjy3L/v6/t8qZGt/ACYNMjAXyVJXA2jP1QltuyhGKVzJe0xsM52OpnSRgzh5e
>   azZNUKR0ppmLCIEr61/CjjMSwazJcDSjYNBkTOmfSgp2yZawPeHX/Ie0w2k8yY1yzUSs
>   Rqnu/m/uLC4WLFZsjftlmMaMdRJfPoAlIKQs+yVyyzuhJXhfR755gLQ5h4VoNQDy/A4Z
>   SGQwkxLqM6Jd5yX5mXQvG+QFggL6XzgC12DqJ2XMhvykSOYVz8KjgQ3lbpi2orB/fACo
>   ztfA==
> X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
>   d=1e100.net; s=20161025;
>   h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
>   :references:mime-version:content-transfer-encoding;
>   bh=eWtERLXExs4DoM6gWGaTUFy6iPC/nCVkimSM+qIDVKM=;
>   b=lq4dY7b0JW7rBnuD9c2rllEjn5Bel4Hf2NeM10R8P1EsIJSbVqhBMBo/d5uAJIERm5
>   1WndZcLiqaA5K7g9IVYxmH6Xx/iUSZ1V2wRiwzI+6wmfGXDkSWFYuEHcJrKC9I+1mqXr
>   t7/OhaqatQs6jLPEWWOz2TfMV3u0AWbUeOe5YV4AtCXPojQCwIphU0BrqheQvje8QIHS
>   FSkLacK1/k1DevrbJs2MVL9Jj72HJ7l8PoHyxRsqHA+acPr/WcG/gy8XSrEu1VHaLgjy
>   osInPMUsBpfC8PYx4sy5siFK9bkvHp4yNorlmoAE9KEy32eczeRWhNjgBIZwGHvPXGMh
>   LGdg==
> X-Gm-Message-State: AOAM532vtMLkHMB9ChIpzBeitLngNf6qoArsoHgdr8e747hiV4i0d79z
>   8uZRU6fzZYPWowct2alx3AU=
> X-Google-Smtp-Source:
>   ABdhPJwYnI/O7MjyagGSH+7FQMKnfE01e57JG2POD/MrOpJLlI2if5o0NkVRHFEUiDoG5h7TqaOQmg==
> X-Received: by 2002:aed:3263:: with SMTP id
>   y90mr14509217qtd.196.1605539964181;
>   Mon, 16 Nov 2020 07:19:24 -0800 (PST)
> Received: from rockpro64.sparksnet ([2601:153:900:7730::20])
>   by smtp.gmail.com with ESMTPSA id p127sm12216818qkc.37.2020.11.16.07.19.22
>   (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
>   Mon, 16 Nov 2020 07:19:23 -0800 (PST)
> From: Peter Geis <pgwipeout@gmail.com>
> To: Felipe Balbi <balbi@kernel.org>,
>   Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
>   Heiko Stuebner <heiko@sntech.de>
> Subject: [PATCH 4/4] arm64: dts: rockchip: enable usb3 on rk3328-roc-cc board
> Date: Mon, 16 Nov 2020 15:17:36 +0000
> Message-Id: <20201116151735.178737-5-pgwipeout@gmail.com>
> X-Mailer: git-send-email 2.25.1
> In-Reply-To: <20201116151735.178737-1-pgwipeout@gmail.com>
> References: <20201116151735.178737-1-pgwipeout@gmail.com>
> MIME-Version: 1.0
> X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3
> X-CRM114-CacheID: sfid-20201116_151926_565663_1ACFAF07
> X-CRM114-Status: UNSURE (   9.44  )
> X-CRM114-Notice: Please train this message.
> X-Spam-Score: -2.1 (--)
> X-Spam-Report: SpamAssassin version 3.4.4 on casper.infradead.org summary:
>   Content analysis details:   (-2.1 points, 5.0 required)
>   pts rule name              description
>   ---- ----------------------
>   --------------------------------------------------
>   -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
>   no trust [2607:f8b0:4864:20:0:0:0:844 listed in]
>   [list.dnswl.org]
>   -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
>   [score: 0.0000]
>   -0.0 SPF_PASS               SPF: sender matches SPF record
>   0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
>   0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
>   provider [pgwipeout[at]gmail.com]
>   -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
>   author's domain
>   -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
>   envelope-from domain
>   0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
>   not necessarily
>   valid
>   -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
> X-BeenThere: linux-rockchip@lists.infradead.org
> X-Mailman-Version: 2.1.29
> Precedence: list
> List-Id: Upstream kernel work for Rockchip platforms
>   <linux-rockchip.lists.infradead.org>
> List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
>   <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
> List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
> List-Post: <mailto:linux-rockchip@lists.infradead.org>
> List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
> List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
>   <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
> Cc: frank.wang@rock-chips.com, zyw@rock-chips.com, linux-usb@vger.kernel.org,
>   kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
>   Peter Geis <pgwipeout@gmail.com>, william.wu@rock-chips.com,
>   wulf@rock-chips.com, linux-arm-kernel@lists.infradead.org
> Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
> Errors-To:
>   linux-rockchip-bounces+patchwork-linux-rockchip=patchwork.kernel.org@lists.infradead.org
>
> Enable the usb3 controller and usb3 phy nodes on the rk3328-roc-cc board file.
>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>   .../arm64/boot/dts/rockchip/rk3328-roc-cc.dts | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
> index b70ffb1c6a63..b060323830af 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
> @@ -345,6 +345,27 @@ &usb_host0_ohci {
>   	status = "okay";
>   };
>   
> +&usbdrd3 {
> +	status = "okay";
> +};
> +
> +&usbdrd_dwc3 {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usb3phy {
> +	status = "okay";
> +};
> +
> +&usb3phy_utmi {
> +	status = "okay";
> +};
> +
> +&usb3phy_pipe {
> +	status = "okay";
> +};
> +
>   &vop {
>   	status = "okay";
>   };
