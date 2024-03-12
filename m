Return-Path: <linux-usb+bounces-7884-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EA58795CA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 15:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BF771C21734
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 14:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3516B7A73A;
	Tue, 12 Mar 2024 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1IlNN0w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE7D7A72C;
	Tue, 12 Mar 2024 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710252783; cv=none; b=tONyK39qwVA0/BUAt9Sr+fva67cWWyUPzA/sHSLBLQhUjm+2BEwn/HBJNtF0vLEX7R7LAKlX6uG7/B6nsW0L6RaSE9EjoSKKAAeM3OmAwhN2x97pREIgiByBvZ7vWNPluhf6+zdwm1woTyg74eSHukajYa5xk9z1yGetMIUX5c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710252783; c=relaxed/simple;
	bh=/ZXR4/owSs83DKfO7SB8Ww3SVPygRLhylyQ88s804jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUUL6g0CbAOuJuWa0WSQKCZsEkCGs0BCEwXSEJkkzJhXBbgcC3fmF4+KqkHq/aT13J8OVES0H54gD38082sr5LmqfemYYeqpp0oorpoi8N43rpPF/Z6mktsgmuYlGim4OFoAm32x4V+bdNNQOhH7ZFTJD9vKXi1rl9NYXbfJzoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1IlNN0w; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710252780; x=1741788780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ZXR4/owSs83DKfO7SB8Ww3SVPygRLhylyQ88s804jU=;
  b=S1IlNN0wP46CHG0+H5nRkfd5u0rY1DqFNqAPuzCl+IhiVlO/1a0XrqlR
   Z8tecTgcTVEV7+SQ8vw20q5JUIyA4BqgbnM2jVx+KKgXn2+WqtMyttj1L
   h5zIL6g1Kx6a5mhXw/TrVaSBTDbn2DgtTjxw9/9fJ0kH/WzuVIxn1dboL
   vgVvZwOOk5QtT8SEnxJ7ZFhuRrHGY+Nwu1ZZK2ncWgRCCySuc5lxjWl4o
   aqc/y7lzujyfWBHKbTG1Mvz0y25as3jJKaUFjQ7lLWAm4p63jX86rbVG/
   MrH3T4KUoGh0kwnroZu/7NbDMleN1LC5dgealI5bCVTTbQNpdPZ1zkOnn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="22416931"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22416931"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 07:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="937051890"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="937051890"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 12 Mar 2024 07:12:54 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 12 Mar 2024 16:12:53 +0200
Date: Tue, 12 Mar 2024 16:12:53 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: phone-devel@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>,
	fiona.klute@gmx.de, martijn@brixit.nl, samuel@sholland.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, megi@xff.cz
Subject: Re: [PATCHv2 2/2] usb: typec: anx7688: Add driver for ANX7688 USB-C
 HDMI bridge
Message-ID: <ZfBi5Qj3zV9ffkwQ@kuha.fi.intel.com>
References: <ZcaCXYOf6o4VNneu@duo.ucw.cz>
 <ZdkOESbty6iMfyhj@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdkOESbty6iMfyhj@duo.ucw.cz>

Hi Pavel,

I'm sorry to keep you waiting.

On Fri, Feb 23, 2024 at 10:28:49PM +0100, Pavel Machek wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> This is driver for ANX7688 USB-C HDMI, with flashing and debugging
> features removed. ANX7688 is rather criticial piece on PinePhone,
> there's no display and no battery charging without it.
> 
> There's likely more work to be done here, but having basic support
> in mainline is needed to be able to work on the other stuff
> (networking, cameras, power management).
> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Co-developed-by: Martijn Braam <martijn@brixit.nl>
> Co-developed-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> ---
> 
> v2: Fix checkpatch stuff. Some cleanups, adapt to dts format in 1/2.
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 2f80c2792dbd..c9043ae61546 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -64,6 +64,17 @@ config TYPEC_ANX7411
>  	  If you choose to build this driver as a dynamically linked module, the
>  	  module will be called anx7411.ko.
>  
> +config TYPEC_ANX7688
> +	tristate "Analogix ANX7688 Type-C DRP Port controller and mux driver"
> +	depends on I2C
> +	depends on USB_ROLE_SWITCH
> +	help
> +	  Say Y or M here if your system has Analogix ANX7688 Type-C Bridge
> +	  controller driver.
> +
> +	  If you choose to build this driver as a dynamically linked module, the
> +	  module will be called anx7688.ko.
> +
>  config TYPEC_RT1719
>  	tristate "Richtek RT1719 Sink Only Type-C controller driver"
>  	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> index 7a368fea61bc..3f8ff94ad294 100644
> --- a/drivers/usb/typec/Makefile
> +++ b/drivers/usb/typec/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
>  obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
>  obj-$(CONFIG_TYPEC_TPS6598X)	+= tipd/
>  obj-$(CONFIG_TYPEC_ANX7411)	+= anx7411.o
> +obj-$(CONFIG_TYPEC_ANX7688)	+= anx7688.o
>  obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
>  obj-$(CONFIG_TYPEC_STUSB160X) 	+= stusb160x.o
>  obj-$(CONFIG_TYPEC_RT1719)	+= rt1719.o
> diff --git a/drivers/usb/typec/anx7688.c b/drivers/usb/typec/anx7688.c
> new file mode 100644
> index 000000000000..14d033bbc0c7
> --- /dev/null
> +++ b/drivers/usb/typec/anx7688.c
> @@ -0,0 +1,1927 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ANX7688 USB-C HDMI bridge/PD driver
> + *
> + * Warning, this driver is somewhat PinePhone specific.
> + *
> + * How this works:
> + * - this driver allows to program firmware into ANX7688 EEPROM, and
> + *   initialize it
> + * - it then communicates with the firmware running on the OCM (on-chip
> + *   microcontroller)
> + * - it detects whether there is cable plugged in or not and powers
> + *   up or down the ANX7688 based on that
> + * - when the cable is connected the firmware on the OCM will handle
> + *   the detection of the nature of the device on the other end
> + *   of the USB-C cable
> + * - this driver then communicates with the USB phy to let it swap
> + *   data roles accordingly
> + * - it also enables VBUS and VCONN regulators as appropriate
> + * - USB phy driver (Allwinner) needs to know whether to switch to
> + *   device or host mode, or whether to turn off
> + * - when the firmware detects SRC.1.5A or SRC.3.0A via CC pins
> + *   or something else via PD, it notifies this driver via software
> + *   interrupt and this driver will determine how to update the TypeC
> + *   port status and what input current limit is appropriate
> + * - input current limit determination happens 500ms after cable
> + *   insertion or hard reset (delay is necessary to determine whether
> + *   the remote end is PD capable or not)
> + * - this driver tells to the PMIC driver that the input current limit
> + *   needs to be changed
> + * - this driver also monitors PMIC status and re-sets the input current
> + *   limit if it changes for some reason (due to PMIC internal decision
> + *   making) (this is disabled for now)
> + *
> + * ANX7688 FW behavior as observed:
> + *
> + * - DO NOT SET MORE THAN 1 SINK CAPABILITY! Firmware will ignore what
> + *   you set and send hardcoded PDO_BATT 5-21V 30W message!
> + *
> + * Product brief:
> + * https://www.analogix.com/en/system/files/AA-002281-PB-6-ANX7688_Product_Brief_0.pdf
> + * Development notes:
> + * https://xnux.eu/devices/feature/anx7688.html
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/extcon-provider.h>
> +#include <linux/firmware.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqreturn.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
> +#include <linux/power_supply.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/usb/pd.h>
> +#include <linux/usb/role.h>
> +#include <linux/usb/typec.h>
> +
> +/* firmware regs */
> +
> +#define ANX7688_REG_VBUS_OFF_DELAY_TIME 0x22
> +#define ANX7688_REG_FEATURE_CTRL        0x27
> +#define ANX7688_REG_EEPROM_LOAD_STATUS1 0x11
> +#define ANX7688_REG_EEPROM_LOAD_STATUS0 0x12
> +#define ANX7688_REG_FW_VERSION1         0x15
> +#define ANX7688_REG_FW_VERSION0         0x16
> +
> +#define ANX7688_EEPROM_FW_LOADED	0x01
> +
> +#define ANX7688_REG_STATUS_INT_MASK     0x17
> +#define ANX7688_REG_STATUS_INT          0x28
> +#define ANX7688_IRQS_RECEIVED_MSG       BIT(0)
> +#define ANX7688_IRQS_RECEIVED_ACK       BIT(1)
> +#define ANX7688_IRQS_VCONN_CHANGE       BIT(2)
> +#define ANX7688_IRQS_VBUS_CHANGE        BIT(3)
> +#define ANX7688_IRQS_CC_STATUS_CHANGE   BIT(4)
> +#define ANX7688_IRQS_DATA_ROLE_CHANGE   BIT(5)
> +
> +#define ANX7688_REG_STATUS              0x29
> +#define ANX7688_VCONN_STATUS            BIT(2) /* 0 = off  1 = on */
> +#define ANX7688_VBUS_STATUS             BIT(3) /* 0 = off  1 = on */
> +#define ANX7688_DATA_ROLE_STATUS        BIT(5) /* 0 = device 1 = host */
> +
> +#define ANX7688_REG_CC_STATUS           0x2a
> +#define ANX7688_REG_TRY_UFP_TIMER       0x23
> +#define ANX7688_REG_TIME_CTRL           0x24
> +
> +#define ANX7688_REG_MAX_VOLTAGE         0x1b
> +#define ANX7688_REG_MAX_POWER           0x1c
> +#define ANX7688_REG_MIN_POWER           0x1d
> +#define ANX7688_REG_MAX_VOLTAGE_STATUS  0x1e
> +#define ANX7688_REG_MAX_POWER_STATUS    0x1f
> +
> +#define ANX7688_SOFT_INT_MASK           0x7f
> +
> +/* tcpc regs */
> +
> +#define ANX7688_TCPC_REG_VENDOR_ID0     0x00
> +#define ANX7688_TCPC_REG_VENDOR_ID1     0x01
> +#define ANX7688_TCPC_REG_ALERT0         0x10
> +#define ANX7688_TCPC_REG_ALERT1         0x11
> +#define ANX7688_TCPC_REG_ALERT_MASK0    0x12
> +#define ANX7688_TCPC_REG_ALERT_MASK1    0x13
> +#define ANX7688_TCPC_REG_INTERFACE_SEND 0x30
> +#define ANX7688_TCPC_REG_INTERFACE_RECV 0x51
> +
> +/* hw regs */
> +
> +#define ANX7688_REG_IRQ_EXT_SOURCE0     0x3e
> +#define ANX7688_REG_IRQ_EXT_SOURCE1     0x4e
> +#define ANX7688_REG_IRQ_EXT_SOURCE2     0x4f
> +#define ANX7688_REG_IRQ_EXT_MASK0       0x3b
> +#define ANX7688_REG_IRQ_EXT_MASK1       0x3c
> +#define ANX7688_REG_IRQ_EXT_MASK2       0x3d
> +#define ANX7688_REG_IRQ_SOURCE0         0x54
> +#define ANX7688_REG_IRQ_SOURCE1         0x55
> +#define ANX7688_REG_IRQ_SOURCE2         0x56
> +#define ANX7688_REG_IRQ_MASK0           0x57
> +#define ANX7688_REG_IRQ_MASK1           0x58
> +#define ANX7688_REG_IRQ_MASK2           0x59
> +
> +#define ANX7688_IRQ2_SOFT_INT           BIT(2)
> +
> +#define ANX7688_REG_USBC_RESET_CTRL		0x05
> +#define ANX7688_USBC_RESET_CTRL_OCM_RESET	BIT(4)
> +
> +/* ocm messages */
> +
> +#define ANX7688_OCM_MSG_PWR_SRC_CAP     0x00
> +#define ANX7688_OCM_MSG_PWR_SNK_CAP     0x01
> +#define ANX7688_OCM_MSG_DP_SNK_IDENTITY 0x02
> +#define ANX7688_OCM_MSG_SVID            0x03
> +#define ANX7688_OCM_MSG_GET_DP_SNK_CAP  0x04
> +#define ANX7688_OCM_MSG_ACCEPT          0x05
> +#define ANX7688_OCM_MSG_REJECT          0x06
> +#define ANX7688_OCM_MSG_PSWAP_REQ       0x10
> +#define ANX7688_OCM_MSG_DSWAP_REQ       0x11
> +#define ANX7688_OCM_MSG_GOTO_MIN_REQ    0x12
> +#define ANX7688_OCM_MSG_VCONN_SWAP_REQ  0x13
> +#define ANX7688_OCM_MSG_VDM             0x14
> +#define ANX7688_OCM_MSG_DP_SNK_CFG      0x15
> +#define ANX7688_OCM_MSG_PWR_OBJ_REQ     0x16
> +#define ANX7688_OCM_MSG_PD_STATUS_REQ   0x17
> +#define ANX7688_OCM_MSG_DP_ALT_ENTER    0x19
> +#define ANX7688_OCM_MSG_DP_ALT_EXIT     0x1a
> +#define ANX7688_OCM_MSG_GET_SNK_CAP     0x1b
> +#define ANX7688_OCM_MSG_RESPONSE_TO_REQ 0xf0
> +#define ANX7688_OCM_MSG_SOFT_RST        0xf1
> +#define ANX7688_OCM_MSG_HARD_RST        0xf2
> +#define ANX7688_OCM_MSG_RESTART         0xf3
> +
> +static const char * const anx7688_supply_names[] = {
> +	"avdd33",
> +	"avdd18",
> +	"dvdd18",
> +	"avdd10",
> +	"dvdd10",
> +	"i2c",
> +	"hdmi-vt",
> +
> +	"vconn", // power for VCONN1/VCONN2 switches
> +	"vbus", // vbus power
> +};
> +
> +#define ANX7688_NUM_SUPPLIES ARRAY_SIZE(anx7688_supply_names)
> +#define ANX7688_NUM_ALWAYS_ON_SUPPLIES (ANX7688_NUM_SUPPLIES - 1)
> +
> +#define ANX7688_I2C_INDEX (ANX7688_NUM_SUPPLIES - 4)
> +#define ANX7688_VCONN_INDEX (ANX7688_NUM_SUPPLIES - 2)
> +#define ANX7688_VBUS_INDEX (ANX7688_NUM_SUPPLIES - 1)
> +
> +enum {
> +	ANX7688_F_POWERED,
> +	ANX7688_F_CONNECTED,
> +	ANX7688_F_FW_FAILED,
> +	ANX7688_F_PWRSUPPLY_CHANGE,
> +	ANX7688_F_CURRENT_UPDATE,
> +};
> +
> +struct anx7688 {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct i2c_client *client_tcpc;
> +	struct regulator_bulk_data supplies[ANX7688_NUM_SUPPLIES];
> +	struct power_supply *vbus_in_supply;
> +	struct notifier_block vbus_in_nb;
> +	int input_current_limit; // mA
> +	struct gpio_desc *gpio_enable;
> +	struct gpio_desc *gpio_reset;
> +	struct gpio_desc *gpio_cabledet;
> +
> +	uint32_t src_caps[8];

Use u32 instead of uint32_t.

> +	unsigned int n_src_caps;
> +
> +	uint32_t snk_caps[8];

Ditto.

> +	unsigned int n_snk_caps;
> +
> +	unsigned long flags[1];
> +
> +	struct delayed_work work;
> +	struct timer_list work_timer;
> +
> +	struct mutex lock;
> +	bool vbus_on, vconn_on;
> +	bool pd_capable;
> +	int pd_current_limit; // mA
> +	ktime_t current_update_deadline;
> +
> +	struct typec_port *port;
> +	struct typec_partner *partner;
> +	struct usb_pd_identity partner_identity;
> +	struct usb_role_switch *role_sw;
> +	int pwr_role, data_role;
> +
> +	struct dentry *debug_root;
> +
> +	/* for debug */
> +	int last_status;
> +	int last_cc_status;
> +	int last_dp_state;
> +	int last_bc_result;
> +
> +	/* for HDMI HPD */
> +	struct extcon_dev *extcon;
> +	int last_extcon_state;
> +};
> +
> +static const unsigned int anx7688_extcon_cable[] = {
> +	EXTCON_DISP_HDMI,
> +	EXTCON_NONE,
> +};
> +
> +static int anx7688_reg_read(struct anx7688 *anx7688, u8 reg_addr)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(anx7688->client, reg_addr);
> +	if (ret < 0)
> +		dev_err(anx7688->dev, "i2c read failed at 0x%x (%d)\n",
> +			reg_addr, ret);

dev_dbg instead.

> +
> +	return ret;
> +}
> +
> +static int anx7688_reg_write(struct anx7688 *anx7688, u8 reg_addr, u8 value)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(anx7688->client, reg_addr, value);
> +	if (ret < 0)
> +		dev_err(anx7688->dev, "i2c write failed at 0x%x (%d)\n",
> +			reg_addr, ret);

Ditto.

> +
> +	return ret;
> +}
> +
> +static int anx7688_reg_update_bits(struct anx7688 *anx7688, u8 reg_addr,
> +				   u8 mask, u8 value)
> +{
> +	int ret;
> +
> +	ret = anx7688_reg_read(anx7688, reg_addr);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret &= ~mask;
> +	ret |= value;
> +
> +	return anx7688_reg_write(anx7688, reg_addr, ret);
> +}
> +
> +static int anx7688_tcpc_reg_read(struct anx7688 *anx7688, u8 reg_addr)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(anx7688->client_tcpc, reg_addr);
> +	if (ret < 0)
> +		dev_err(anx7688->dev, "tcpc i2c read failed at 0x%x (%d)\n",
> +			reg_addr, ret);

Ditto.

> +
> +	return ret;
> +}
> +
> +static int anx7688_tcpc_reg_write(struct anx7688 *anx7688, u8 reg_addr, u8 value)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(anx7688->client_tcpc, reg_addr, value);
> +	if (ret < 0)
> +		dev_err(anx7688->dev, "tcpc i2c write failed at 0x%x (%d)\n",
> +			reg_addr, ret);

Ditto.

> +
> +	return ret;
> +}
> +
> +static void anx7688_power_enable(struct anx7688 *anx7688)
> +{
> +	gpiod_set_value(anx7688->gpio_reset, 1);
> +	gpiod_set_value(anx7688->gpio_enable, 1);
> +
> +	/* wait for power to stabilize and release reset */
> +	msleep(10);

So is it okay that the sleep may take up to 20ms?

> +	gpiod_set_value(anx7688->gpio_reset, 0);
> +	udelay(2);

Use usleep_range() instead.

> +	dev_dbg(anx7688->dev, "power enabled\n");
> +
> +	set_bit(ANX7688_F_POWERED, anx7688->flags);
> +}
> +
> +static void anx7688_power_disable(struct anx7688 *anx7688)
> +{
> +	gpiod_set_value(anx7688->gpio_reset, 1);
> +	msleep(5);

The same question here, is it a problem if the sleep ends up taking
20ms?

> +	gpiod_set_value(anx7688->gpio_enable, 0);
> +
> +	dev_dbg(anx7688->dev, "power disabled\n");
> +
> +	clear_bit(ANX7688_F_POWERED, anx7688->flags);
> +}
> +
> +static int anx7688_send_ocm_message(struct anx7688 *anx7688, int cmd,
> +				    const u8 *data, int data_len)
> +{
> +	int ret = 0, i;
> +	u8 pkt[32];
> +
> +	if (data_len > sizeof(pkt) - 3) {
> +		dev_dbg(anx7688->dev,
> +			"invalid ocm message length cmd=0x%02x len=%d\n",
> +			cmd, data_len);
> +		return -EINVAL;
> +	}
> +
> +	// prepare pd packet
> +	pkt[0] = data_len + 1;
> +	pkt[1] = cmd;
> +	if (data_len > 0)
> +		memcpy(pkt + 2, data, data_len);
> +	pkt[2 + data_len] = 0;
> +	for (i = 0; i < data_len + 2; i++)
> +		pkt[data_len + 2] -= pkt[i];
> +
> +	dev_dbg(anx7688->dev, "send pd packet cmd=0x%02x %*ph\n",
> +		cmd, data_len + 3, pkt);
> +
> +	ret = anx7688_tcpc_reg_read(anx7688, ANX7688_TCPC_REG_INTERFACE_SEND);
> +	if (ret) {
> +		dev_err(anx7688->dev,
> +			"failed to send pd packet (tx buffer full)\n");

One line should be enought for that one.

> +		return -EBUSY;
> +	}
> +
> +	ret = i2c_smbus_write_i2c_block_data(anx7688->client_tcpc,
> +					     ANX7688_TCPC_REG_INTERFACE_SEND,
> +					     data_len + 3, pkt);
> +	if (ret < 0)
> +		dev_err(anx7688->dev,
> +			"failed to send pd packet (err=%d)\n", ret);

Ditto.

> +	// wait until the message is processed (30ms max)
> +	for (i = 0; i < 300; i++) {
> +		ret = anx7688_tcpc_reg_read(anx7688, ANX7688_TCPC_REG_INTERFACE_SEND);
> +		if (ret <= 0)
> +			return ret;
> +
> +		udelay(100);
> +	}
> +
> +	dev_err(anx7688->dev, "timeout waiting for the message queue flush\n");

Maybe dev_dbg for this too.

> +	return -ETIMEDOUT;
> +}
> +
> +static int anx7688_connect(struct anx7688 *anx7688)
> +{
> +	struct typec_partner_desc desc = {};
> +	int ret, i;
> +	u8 fw[2];
> +	const u8 dp_snk_identity[16] = {
> +		0x00, 0x00, 0x00, 0xec,	/* id header */
> +		0x00, 0x00, 0x00, 0x00,	/* cert stat */
> +		0x00, 0x00, 0x00, 0x00,	/* product type */
> +		0x39, 0x00, 0x00, 0x51	/* alt mode adapter */
> +	};
> +	const u8 svid[4] = {
> +		0x00, 0x00, 0x01, 0xff,
> +	};
> +	u32 caps[8];
> +
> +	dev_dbg(anx7688->dev, "cable inserted\n");
> +
> +	anx7688->last_status = -1;
> +	anx7688->last_cc_status = -1;
> +	anx7688->last_dp_state = -1;
> +
> +	msleep(10);
> +	anx7688_power_enable(anx7688);
> +
> +	ret = regulator_enable(anx7688->supplies[ANX7688_VCONN_INDEX].consumer);
> +	if (ret) {
> +		dev_err(anx7688->dev, "failed to enable vconn\n");
> +		goto err_poweroff;
> +	}
> +	anx7688->vconn_on = true;
> +
> +	/* wait till the firmware is loaded (typically ~30ms) */
> +	for (i = 0; i < 100; i++) {
> +		ret = anx7688_reg_read(anx7688, ANX7688_REG_EEPROM_LOAD_STATUS0);
> +
> +		if (ret >= 0 && (ret & ANX7688_EEPROM_FW_LOADED) == ANX7688_EEPROM_FW_LOADED) {
> +			dev_dbg(anx7688->dev, "eeprom0 = 0x%02x\n", ret);
> +			dev_info(anx7688->dev, "fw loaded after %d ms\n", i * 10);

Debugging information. Use dev_dbg.

> +			goto fw_loaded;
> +		}
> +
> +		msleep(5);
> +	}
> +
> +	set_bit(ANX7688_F_FW_FAILED, anx7688->flags);
> +	dev_err(anx7688->dev, "boot firmware load failed (you may need to flash FW to anx7688 first)\n");
> +	ret = -ETIMEDOUT;
> +	goto err_vconoff;
> +
> +fw_loaded:

This label looks a bit messy to me. You could also move that firmware
loading wait to its own function.

> +	ret = i2c_smbus_read_i2c_block_data(anx7688->client,
> +					    ANX7688_REG_FW_VERSION1, 2, fw);
> +	if (ret < 0) {
> +		dev_err(anx7688->dev, "failed to read firmware version\n");
> +		goto err_vconoff;
> +	}
> +
> +	dev_info(anx7688->dev, "OCM firmware loaded (version 0x%04x)\n",
> +		 fw[1] | fw[0] << 8);

deb_dbg.

> +	/* Unmask interrupts */
> +	ret = anx7688_reg_write(anx7688, ANX7688_REG_STATUS_INT, 0);
> +	if (ret)
> +		goto err_vconoff;
> +
> +	ret = anx7688_reg_write(anx7688, ANX7688_REG_STATUS_INT_MASK, ~ANX7688_SOFT_INT_MASK);
> +	if (ret)
> +		goto err_vconoff;
> +
> +	ret = anx7688_reg_write(anx7688, ANX7688_REG_IRQ_EXT_SOURCE2, 0xff);
> +	if (ret)
> +		goto err_vconoff;
> +
> +	ret = anx7688_reg_write(anx7688, ANX7688_REG_IRQ_EXT_MASK2, (u8)~ANX7688_IRQ2_SOFT_INT);
> +	if (ret)
> +		goto err_vconoff;
> +
> +	/* time to turn off vbus after cc disconnect (unit is 4 ms) */
> +	ret = anx7688_reg_write(anx7688, ANX7688_REG_VBUS_OFF_DELAY_TIME, 100 / 4);
> +	if (ret)
> +		goto err_vconoff;
> +
> +	/* 300ms (unit is 2 ms) */
> +	ret = anx7688_reg_write(anx7688, ANX7688_REG_TRY_UFP_TIMER, 300 / 2);
> +	if (ret)
> +		goto err_vconoff;
> +
> +	/* maximum voltage in 100 mV units */
> +	ret = anx7688_reg_write(anx7688, ANX7688_REG_MAX_VOLTAGE, 50); /* 5 V */
> +	if (ret)
> +		goto err_vconoff;
> +
> +	/* min/max power in 500 mW units */
> +	ret = anx7688_reg_write(anx7688, ANX7688_REG_MAX_POWER, 15 * 2); /* 15 W */
> +	if (ret)
> +		goto err_vconoff;
> +
> +	ret = anx7688_reg_write(anx7688, ANX7688_REG_MIN_POWER, 1);  /* 0.5 W */
> +	if (ret)
> +		goto err_vconoff;
> +
> +	/* auto_pd, try.src, try.sink, goto safe 5V */
> +	ret = anx7688_reg_write(anx7688, ANX7688_REG_FEATURE_CTRL, 0x1e & ~BIT(2)); // disable try_src
> +	if (ret)
> +		goto err_vconoff;
> +
> +	for (i = 0; i < anx7688->n_src_caps; i++)
> +		caps[i] = cpu_to_le32(anx7688->src_caps[i]);
> +	ret = anx7688_send_ocm_message(anx7688, ANX7688_OCM_MSG_PWR_SRC_CAP,
> +				       (u8 *)&caps, 4 * anx7688->n_src_caps);
> +	if (ret)
> +		goto err_vconoff;
> +
> +	for (i = 0; i < anx7688->n_snk_caps; i++)
> +		caps[i] = cpu_to_le32(anx7688->snk_caps[i]);
> +	ret = anx7688_send_ocm_message(anx7688, ANX7688_OCM_MSG_PWR_SNK_CAP,
> +				       (u8 *)&caps, 4 * anx7688->n_snk_caps);
> +	if (ret)
> +		goto err_vconoff;
> +
> +	/* Send DP SNK identity */
> +	ret = anx7688_send_ocm_message(anx7688, ANX7688_OCM_MSG_DP_SNK_IDENTITY,
> +				       dp_snk_identity, sizeof(dp_snk_identity));
> +	if (ret)
> +		goto err_vconoff;
> +
> +	ret = anx7688_send_ocm_message(anx7688, ANX7688_OCM_MSG_SVID,
> +				       svid, sizeof(svid));
> +	if (ret)
> +		goto err_vconoff;
> +
> +	dev_dbg(anx7688->dev, "OCM configuration completed\n");
> +
> +	desc.accessory = TYPEC_ACCESSORY_NONE;
> +
> +	typec_unregister_partner(anx7688->partner);
> +
> +	anx7688->partner = typec_register_partner(anx7688->port, &desc);
> +	if (IS_ERR(anx7688->partner)) {
> +		ret = PTR_ERR(anx7688->partner);
> +		goto err_vconoff;
> +	}
> +
> +	// after this deadline passes we'll check if device is pd_capable and
> +	// set up the current limit accordingly
> +	anx7688->current_update_deadline = ktime_add_ms(ktime_get(), 3000);
> +
> +	set_bit(ANX7688_F_CONNECTED, anx7688->flags);
> +	return 0;
> +
> +err_vconoff:
> +	regulator_disable(anx7688->supplies[ANX7688_VCONN_INDEX].consumer);
> +	anx7688->vconn_on = false;
> +err_poweroff:
> +	anx7688_power_disable(anx7688);
> +	dev_err(anx7688->dev, "OCM configuration failed\n");
> +	return ret;
> +}
> +
> +static void anx7688_set_hdmi_hpd(struct anx7688 *anx7688, int state)
> +{
> +	if (!anx7688->extcon)
> +		return;
> +
> +	if (anx7688->last_extcon_state != state) {
> +		extcon_set_state_sync(anx7688->extcon, EXTCON_DISP_HDMI, state);
> +		anx7688->last_extcon_state = state;
> +	}
> +}
> +
> +static void anx7688_disconnect(struct anx7688 *anx7688)
> +{
> +	union power_supply_propval val = {0,};
> +	struct device *dev = anx7688->dev;
> +	int ret;
> +
> +	dev_dbg(dev, "cable removed\n");
> +
> +	anx7688->current_update_deadline = 0;
> +
> +	anx7688_set_hdmi_hpd(anx7688, 0);
> +
> +	if (anx7688->vconn_on) {
> +		regulator_disable(anx7688->supplies[ANX7688_VCONN_INDEX].consumer);
> +		anx7688->vconn_on = false;
> +	}
> +
> +	if (anx7688->vbus_on) {
> +		regulator_disable(anx7688->supplies[ANX7688_VBUS_INDEX].consumer);
> +		anx7688->vbus_on = false;
> +	}
> +
> +	anx7688_power_disable(anx7688);
> +
> +	anx7688->pd_capable = false;
> +
> +	typec_unregister_partner(anx7688->partner);
> +	anx7688->partner = NULL;
> +
> +	anx7688->pwr_role = TYPEC_SINK;
> +	anx7688->data_role = TYPEC_DEVICE;
> +	typec_set_pwr_role(anx7688->port, anx7688->pwr_role);
> +	typec_set_data_role(anx7688->port, anx7688->data_role);
> +	typec_set_pwr_opmode(anx7688->port, TYPEC_PWR_MODE_USB);
> +	typec_set_vconn_role(anx7688->port, TYPEC_SINK);
> +
> +	usb_role_switch_set_role(anx7688->role_sw, USB_ROLE_NONE);
> +
> +	val.intval = 500 * 1000;
> +	dev_dbg(dev, "setting vbus_in current limit to %d mA\n", val.intval);
> +	ret = power_supply_set_property(anx7688->vbus_in_supply,
> +					POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
> +					&val);
> +	if (ret)
> +		dev_err(dev, "failed to set vbus_in current to %d mA\n",
> +			val.intval / 1000);
> +
> +	val.intval = 0;
> +	dev_dbg(dev, "disabling vbus_in power path\n");
> +	ret = power_supply_set_property(anx7688->vbus_in_supply,
> +					POWER_SUPPLY_PROP_ONLINE,
> +					&val);
> +	if (ret)
> +		dev_err(dev, "failed to offline vbus_in\n");
> +
> +	dev_dbg(dev, "enabling USB BC 1.2 detection\n");
> +
> +	clear_bit(ANX7688_F_CONNECTED, anx7688->flags);
> +}
> +
> +static void anx7688_handle_cable_change(struct anx7688 *anx7688)
> +{
> +	int cabledet;
> +	bool connected;
> +
> +	connected = test_bit(ANX7688_F_CONNECTED, anx7688->flags);
> +	cabledet = gpiod_get_value(anx7688->gpio_cabledet);
> +
> +	if (cabledet && !connected)
> +		anx7688_connect(anx7688);
> +	else if (!cabledet && connected)
> +		anx7688_disconnect(anx7688);
> +}
> +
> +static irqreturn_t anx7688_irq_plug_handler(int irq, void *data)
> +{
> +	struct anx7688 *anx7688 = data;
> +
> +	dev_dbg(anx7688->dev, "plug irq (cd=%d)\n",
> +		gpiod_get_value(anx7688->gpio_cabledet));
> +
> +	/*
> +	 * After each cabledet change the scheduled work timer is reset
> +	 * to fire in ~10ms. So the work is done only after the cabledet
> +	 * is stable for ~10ms.
> +	 */
> +	schedule_delayed_work(&anx7688->work, msecs_to_jiffies(10));
> +
> +	return IRQ_HANDLED;
> +}
> +
> +enum {
> +	CMD_SUCCESS,
> +	CMD_REJECT,
> +	CMD_FAIL,
> +	CMD_BUSY,
> +};
> +
> +static const char * const anx7688_cmd_statuses[] = {
> +	"SUCCESS",
> +	"REJECT",
> +	"FAIL",
> +	"BUSY",
> +};
> +
> +static int anx7688_handle_pd_message_response(struct anx7688 *anx7688,
> +					      u8 to_cmd, u8 resp)
> +{
> +	const char *status = resp <= CMD_BUSY ? anx7688_cmd_statuses[resp] : "UNKNOWN";
> +
> +	switch (to_cmd) {
> +	case ANX7688_OCM_MSG_PSWAP_REQ:
> +		dev_info(anx7688->dev, "received response to PSWAP_REQ (%s)\n", status);
> +		break;
> +
> +	case ANX7688_OCM_MSG_DSWAP_REQ:
> +		dev_info(anx7688->dev, "received response to DSWAP_REQ (%s)\n", status);
> +		break;
> +
> +	case ANX7688_OCM_MSG_VCONN_SWAP_REQ:
> +		dev_info(anx7688->dev, "received response to VCONN_SWAP_REQ (%s)\n", status);
> +		break;
> +
> +	case ANX7688_OCM_MSG_PWR_OBJ_REQ:
> +		dev_info(anx7688->dev, "received response to PWR_OBJ_REQ (%s)\n", status);
> +		break;
> +
> +	case ANX7688_OCM_MSG_VDM:
> +		dev_info(anx7688->dev, "received response to VDM (%s)\n", status);
> +		break;
> +
> +	case ANX7688_OCM_MSG_GOTO_MIN_REQ:
> +		dev_info(anx7688->dev, "received response to GOTO_MIN_REQ (%s)\n", status);
> +		break;
> +
> +	case ANX7688_OCM_MSG_GET_SNK_CAP:
> +		dev_info(anx7688->dev, "received response to GET_SNK_CAP (%s)\n", status);
> +		break;
> +
> +	default:
> +		dev_info(anx7688->dev, "received response to unknown request (%s)\n", status);
> +		break;
> +	}
> +
> +	return 0;
> +}

Noise. Drop this whole function. If you need this kind of information,
then please consider trace points, or just use some debugfs trick like
what we have in drivers/usb/typec/tcpm/tcpm.c and few other drivers.

> +static int anx7688_handle_pd_message(struct anx7688 *anx7688,
> +				     u8 cmd, u8 *msg, unsigned int len)
> +{
> +	struct device *dev = anx7688->dev;
> +	union power_supply_propval psy_val = {0,};
> +	uint32_t *pdos = (uint32_t *)msg;

u32

> +	int ret, i, rdo_max_v, rdo_max_p;
> +	uint32_t pdo, rdo;

u32

> +	switch (cmd) {
> +	case ANX7688_OCM_MSG_PWR_SRC_CAP:
> +		dev_info(anx7688->dev, "received SRC_CAP\n");

Noise.

> +
> +		if (len % 4 != 0) {
> +			dev_warn(anx7688->dev, "received invalid sized PDO array\n");
> +			break;
> +		}
> +
> +		/* the partner is PD capable */
> +		anx7688->pd_capable = true;
> +
> +		for (i = 0; i < len / 4; i++) {
> +			pdo = le32_to_cpu(pdos[i]);
> +
> +			if (pdo_type(pdo) == PDO_TYPE_FIXED) {
> +				unsigned int voltage = pdo_fixed_voltage(pdo);
> +				unsigned int max_curr = pdo_max_current(pdo);
> +
> +				dev_info(anx7688->dev, "SRC_CAP PDO_FIXED (%umV %umA)\n", voltage, max_curr);

Noise.

> +			} else if (pdo_type(pdo) == PDO_TYPE_BATT) {
> +				unsigned int min_volt = pdo_min_voltage(pdo);
> +				unsigned int max_volt = pdo_max_voltage(pdo);
> +				unsigned int max_pow = pdo_max_power(pdo);
> +
> +				dev_info(anx7688->dev, "SRC_CAP PDO_BATT (%umV-%umV %umW)\n", min_volt, max_volt, max_pow);

Noise. That line also really should be split in two.

I'm stopping my review here. This driver is too noisy. All dev_info
calls need to be dropped. If the driver is working correctly then it
needs to quiet.

Most of those prints are useful for debugging only, so I think similar
debugfs log like the one tcpm.c uses could be a good idea for them
since you already use debugfs in this driver in any case.

thanks,

> +			} else if (pdo_type(pdo) == PDO_TYPE_VAR) {
> +				unsigned int min_volt = pdo_min_voltage(pdo);
> +				unsigned int max_volt = pdo_max_voltage(pdo);
> +				unsigned int max_curr = pdo_max_current(pdo);
> +
> +				dev_info(anx7688->dev, "SRC_CAP PDO_VAR (%umV-%umV %umA)\n", min_volt, max_volt, max_curr);
> +			} else {
> +				dev_info(anx7688->dev, "SRC_CAP PDO_APDO (0x%08X)\n", pdo);
> +			}
> +		}
> +
> +		/* when auto_pd mode is enabled, the FW has already set
> +		 * RDO_MAX_VOLTAGE and RDO_MAX_POWER for the RDO it sent to the
> +		 * partner based on the received SOURCE_CAPs. This does not
> +		 * mean, the request was acked, but we can't do better here than
> +		 * calculate the current_limit to set later and hope for the best.
> +		 */
> +		rdo_max_v = anx7688_reg_read(anx7688, ANX7688_REG_MAX_VOLTAGE_STATUS);
> +		if (rdo_max_v < 0)
> +			return rdo_max_v;
> +		if (rdo_max_v == 0)
> +			return -EINVAL;
> +
> +		rdo_max_p = anx7688_reg_read(anx7688, ANX7688_REG_MAX_POWER_STATUS);
> +		if (rdo_max_p < 0)
> +			return rdo_max_p;
> +
> +		anx7688->pd_current_limit = rdo_max_p * 5000 / rdo_max_v;
> +
> +		dev_dbg(anx7688->dev, "RDO max voltage = %dmV, max power = %dmW, PD current limit = %dmA\n",
> +			rdo_max_v * 100, rdo_max_p * 500, anx7688->pd_current_limit);
> +
> +		// update current limit sooner, now that we have PD negotiation result
> +		anx7688->current_update_deadline = ktime_add_ms(ktime_get(), 500);
> +		break;
> +
> +	case ANX7688_OCM_MSG_PWR_SNK_CAP:
> +		dev_info(anx7688->dev, "received SNK_CAP\n");
> +
> +		if (len % 4 != 0) {
> +			dev_warn(anx7688->dev, "received invalid sized PDO array\n");
> +			break;
> +		}
> +
> +		for (i = 0; i < len / 4; i++) {
> +			pdo = le32_to_cpu(pdos[i]);
> +
> +			if (pdo_type(pdo) == PDO_TYPE_FIXED) {
> +				unsigned int voltage = pdo_fixed_voltage(pdo);
> +				unsigned int max_curr = pdo_max_current(pdo);
> +
> +				dev_info(anx7688->dev, "SNK_CAP PDO_FIXED (%umV %umA)\n", voltage, max_curr);
> +			} else if (pdo_type(pdo) == PDO_TYPE_BATT) {
> +				unsigned int min_volt = pdo_min_voltage(pdo);
> +				unsigned int max_volt = pdo_max_voltage(pdo);
> +				unsigned int max_pow = pdo_max_power(pdo);
> +
> +				dev_info(anx7688->dev, "SNK_CAP PDO_BATT (%umV-%umV %umW)\n", min_volt, max_volt, max_pow);
> +			} else if (pdo_type(pdo) == PDO_TYPE_VAR) {
> +				unsigned int min_volt = pdo_min_voltage(pdo);
> +				unsigned int max_volt = pdo_max_voltage(pdo);
> +				unsigned int max_curr = pdo_max_current(pdo);
> +
> +				dev_info(anx7688->dev, "SNK_CAP PDO_VAR (%umV-%umV %umA)\n", min_volt, max_volt, max_curr);
> +			} else {
> +				dev_info(anx7688->dev, "SNK_CAP PDO_APDO (0x%08X)\n", pdo);
> +			}
> +		}
> +
> +		break;
> +
> +	case ANX7688_OCM_MSG_PWR_OBJ_REQ:
> +		dev_info(anx7688->dev, "received PWR_OBJ_REQ\n");
> +
> +		anx7688->pd_capable = true;
> +
> +		if (len != 4) {
> +			dev_warn(anx7688->dev, "received invalid sized RDO\n");
> +			break;
> +		}
> +
> +		rdo = le32_to_cpu(pdos[0]);
> +
> +		if (rdo_index(rdo) >= 1 && rdo_index(rdo) <= anx7688->n_src_caps) {
> +			unsigned int rdo_op_curr = rdo_op_current(rdo);
> +			unsigned int rdo_max_curr = rdo_max_current(rdo);
> +			unsigned int rdo_idx = rdo_index(rdo) - 1;
> +			unsigned int pdo_volt, pdo_max_curr;
> +
> +			pdo = anx7688->src_caps[rdo_idx];
> +			pdo_volt = pdo_fixed_voltage(pdo);
> +			pdo_max_curr = pdo_max_current(pdo);
> +
> +			dev_info(anx7688->dev, "RDO (idx=%d op=%umA max=%umA)\n",
> +				 rdo_idx, rdo_op_curr, rdo_max_curr);
> +
> +			dev_info(anx7688->dev, "PDO_FIXED (%umV %umA)\n",
> +				 pdo_volt, pdo_max_curr);
> +
> +			// We could check the req and respond with accept/reject
> +			// but we're using auto_pd feature, so the FW will do
> +			// this for us
> +		} else {
> +			dev_info(anx7688->dev, "PWR_OBJ RDO index out of range (RDO = 0x%08X)\n", rdo);
> +		}
> +
> +		break;
> +
> +	case ANX7688_OCM_MSG_ACCEPT:
> +		dev_info(anx7688->dev, "received ACCEPT\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_REJECT:
> +		dev_info(anx7688->dev, "received REJECT\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_RESPONSE_TO_REQ:
> +		if (len < 2) {
> +			dev_warn(anx7688->dev, "received short RESPONSE_TO_REQ\n");
> +			break;
> +		}
> +
> +		anx7688_handle_pd_message_response(anx7688, msg[0], msg[1]);
> +		break;
> +
> +	case ANX7688_OCM_MSG_SOFT_RST:
> +		dev_info(anx7688->dev, "received SOFT_RST\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_HARD_RST:
> +		if (anx7688->pd_capable) {
> +			dev_info(anx7688->dev, "received HARD_RST\n");
> +
> +			// stop drawing power from VBUS
> +			psy_val.intval = 0;
> +			dev_dbg(dev, "disabling vbus_in power path\n");
> +			ret = power_supply_set_property(anx7688->vbus_in_supply,
> +							POWER_SUPPLY_PROP_ONLINE,
> +							&psy_val);
> +			if (ret)
> +				dev_err(anx7688->dev, "failed to offline vbus_in\n");
> +
> +			// wait till the dust settles
> +			anx7688->current_update_deadline = ktime_add_ms(ktime_get(), 3000);
> +		} else {
> +			dev_dbg(anx7688->dev, "received HARD_RST, idiot firmware is bored\n");
> +		}
> +
> +		break;
> +
> +	case ANX7688_OCM_MSG_RESTART:
> +		dev_info(anx7688->dev, "received RESTART\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_PSWAP_REQ:
> +		dev_info(anx7688->dev, "received PSWAP_REQ\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_DSWAP_REQ:
> +		dev_info(anx7688->dev, "received DSWAP_REQ\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_VCONN_SWAP_REQ:
> +		dev_info(anx7688->dev, "received VCONN_SWAP_REQ\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_DP_ALT_ENTER:
> +		dev_info(anx7688->dev, "received DP_ALT_ENTER\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_DP_ALT_EXIT:
> +		dev_info(anx7688->dev, "received DP_ALT_EXIT\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_DP_SNK_IDENTITY:
> +		dev_info(anx7688->dev, "received DP_SNK_IDENTITY\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_SVID:
> +		dev_info(anx7688->dev, "received SVID\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_VDM:
> +		dev_info(anx7688->dev, "received VDM\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_GOTO_MIN_REQ:
> +		dev_info(anx7688->dev, "received GOTO_MIN_REQ\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_PD_STATUS_REQ:
> +		dev_info(anx7688->dev, "received PD_STATUS_REQ\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_GET_DP_SNK_CAP:
> +		dev_info(anx7688->dev, "received GET_DP_SNK_CAP\n");
> +		break;
> +
> +	case ANX7688_OCM_MSG_DP_SNK_CFG:
> +		dev_info(anx7688->dev, "received DP_SNK_CFG\n");
> +		break;
> +
> +	default:
> +		dev_info(anx7688->dev, "received unknown message 0x%02x\n", cmd);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int anx7688_receive_msg(struct anx7688 *anx7688)
> +{
> +	u8 pkt[32], checksum = 0;
> +	int i, ret;
> +
> +	ret = i2c_smbus_read_i2c_block_data(anx7688->client_tcpc,
> +					    ANX7688_TCPC_REG_INTERFACE_RECV,
> +					    32, pkt);
> +	if (ret < 0) {
> +		dev_err(anx7688->dev, "failed to read pd msg\n");
> +		return ret;
> +	}
> +
> +	ret = anx7688_tcpc_reg_write(anx7688, ANX7688_TCPC_REG_INTERFACE_RECV, 0);
> +	if (ret)
> +		dev_warn(anx7688->dev, "failed to clear recv FIFO\n");
> +
> +	if (pkt[0] == 0 || pkt[0] > sizeof(pkt) - 2) {
> +		dev_err(anx7688->dev, "received invalid pd message: %*ph\n",
> +			(int)sizeof(pkt), pkt);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(anx7688->dev, "recv ocm message cmd=0x%02x %*ph\n",
> +		pkt[1], pkt[0] + 2, pkt);
> +
> +	for (i = 0; i < pkt[0] + 2; i++)
> +		checksum += pkt[i];
> +
> +	if (checksum != 0) {
> +		dev_err(anx7688->dev, "bad checksum on received message\n");
> +		return -EINVAL;
> +	}
> +
> +	anx7688_handle_pd_message(anx7688, pkt[1], pkt + 2, pkt[0] - 1);
> +	return 0;
> +}
> +
> +static const char *anx7688_cc_status_string(unsigned int v)
> +{
> +	switch (v) {
> +	case 0: return "SRC.Open";
> +	case 1: return "SRC.Rd";
> +	case 2: return "SRC.Ra";
> +	case 4: return "SNK.Default";
> +	case 8: return "SNK.Power1.5";
> +	case 12: return "SNK.Power3.0";
> +	default: return "UNK";
> +	}
> +}
> +
> +static int anx7688_update_status(struct anx7688 *anx7688)
> +{
> +	struct device *dev = anx7688->dev;
> +	bool vbus_on, vconn_on, dr_dfp;
> +	int status, cc_status, dp_state, dp_substate, ret;
> +
> +	status = anx7688_reg_read(anx7688, ANX7688_REG_STATUS);
> +	if (status < 0)
> +		return status;
> +
> +	cc_status = anx7688_reg_read(anx7688, ANX7688_REG_CC_STATUS);
> +	if (cc_status < 0)
> +		return cc_status;
> +
> +	dp_state = anx7688_tcpc_reg_read(anx7688, 0x87);
> +	if (dp_state < 0)
> +		return dp_state;
> +
> +	dp_substate = anx7688_tcpc_reg_read(anx7688, 0x88);
> +	if (dp_substate < 0)
> +		return dp_substate;
> +
> +	anx7688_set_hdmi_hpd(anx7688, dp_state >= 3);
> +
> +	dp_state = (dp_state << 8) | dp_substate;
> +
> +	if (anx7688->last_status == -1 || anx7688->last_status != status) {
> +		anx7688->last_status = status;
> +		dev_dbg(dev, "status changed to 0x%02x\n", status);
> +	}
> +
> +	if (anx7688->last_cc_status == -1 || anx7688->last_cc_status != cc_status) {
> +		anx7688->last_cc_status = cc_status;
> +		dev_dbg(dev, "cc_status changed to CC1 = %s CC2 = %s\n",
> +			anx7688_cc_status_string(cc_status & 0xf),
> +			anx7688_cc_status_string((cc_status >> 4) & 0xf));
> +	}
> +
> +	if (anx7688->last_dp_state == -1 || anx7688->last_dp_state != dp_state) {
> +		anx7688->last_dp_state = dp_state;
> +		dev_dbg(dev, "DP state changed to 0x%04x\n", dp_state);
> +	}
> +
> +	vbus_on = !!(status & ANX7688_VBUS_STATUS);
> +	vconn_on = !!(status & ANX7688_VCONN_STATUS);
> +	dr_dfp = !!(status & ANX7688_DATA_ROLE_STATUS);
> +
> +	if (anx7688->vbus_on != vbus_on) {
> +		dev_dbg(anx7688->dev, "POWER role change to %s\n",
> +			vbus_on ? "SOURCE" : "SINK");
> +
> +		if (vbus_on) {
> +			ret = regulator_enable(anx7688->supplies[ANX7688_VBUS_INDEX].consumer);
> +			if (ret) {
> +				dev_err(anx7688->dev, "failed to enable vbus\n");
> +				return ret;
> +			}
> +		} else {
> +			ret = regulator_disable(anx7688->supplies[ANX7688_VBUS_INDEX].consumer);
> +			if (ret) {
> +				dev_err(anx7688->dev, "failed to disable vbus\n");
> +				return ret;
> +			}
> +		}
> +
> +		anx7688->pwr_role = vbus_on ? TYPEC_SOURCE : TYPEC_SINK;
> +		typec_set_pwr_role(anx7688->port, anx7688->pwr_role);
> +		anx7688->vbus_on = vbus_on;
> +	}
> +
> +	if (anx7688->vconn_on != vconn_on) {
> +		dev_dbg(anx7688->dev, "VCONN role change to %s\n",
> +			vconn_on ? "SOURCE" : "SINK");
> +
> +		if (vconn_on) {
> +			ret = regulator_enable(anx7688->supplies[ANX7688_VCONN_INDEX].consumer);
> +			if (ret) {
> +				dev_err(anx7688->dev, "failed to enable vconn\n");
> +				return ret;
> +			}
> +		} else {
> +			ret = regulator_disable(anx7688->supplies[ANX7688_VCONN_INDEX].consumer);
> +			if (ret) {
> +				dev_err(anx7688->dev, "failed to disable vconn\n");
> +				return ret;
> +			}
> +		}
> +
> +		typec_set_vconn_role(anx7688->port, vconn_on ? TYPEC_SOURCE : TYPEC_SINK);
> +		anx7688->vconn_on = vconn_on;
> +	}
> +
> +	anx7688->data_role = dr_dfp ? TYPEC_HOST : TYPEC_DEVICE;
> +	typec_set_data_role(anx7688->port, anx7688->data_role);
> +
> +	if (usb_role_switch_get_role(anx7688->role_sw) !=
> +	    (dr_dfp ? USB_ROLE_HOST : USB_ROLE_DEVICE)) {
> +		dev_dbg(anx7688->dev, "DATA role change requested to %s\n",
> +			dr_dfp ? "DFP" : "UFP");
> +
> +		ret = usb_role_switch_set_role(anx7688->role_sw,
> +					       dr_dfp ? USB_ROLE_HOST : USB_ROLE_DEVICE);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t anx7688_irq_status_handler(int irq, void *data)
> +{
> +	struct anx7688 *anx7688 = data;
> +	struct device *dev = anx7688->dev;
> +	int tcpc_status, ext2_status, soft_status;
> +
> +	mutex_lock(&anx7688->lock);
> +
> +	if (!test_bit(ANX7688_F_CONNECTED, anx7688->flags)) {
> +		dev_dbg(dev, "spurious status irq\n");
> +		/*
> +		 * anx chip should be disabled and power off, nothing
> +		 * more to do
> +		 */
> +		goto out_unlock;
> +	}
> +
> +	// clear tcpc interrupt
> +	tcpc_status = anx7688_tcpc_reg_read(anx7688, ANX7688_TCPC_REG_ALERT0);
> +	if (tcpc_status > 0)
> +		anx7688_tcpc_reg_write(anx7688, ANX7688_TCPC_REG_ALERT0, tcpc_status);
> +
> +	ext2_status = anx7688_reg_read(anx7688, ANX7688_REG_IRQ_EXT_SOURCE2);
> +	if (ext2_status & ANX7688_IRQ2_SOFT_INT) {
> +		soft_status = anx7688_reg_read(anx7688, ANX7688_REG_STATUS_INT);
> +		anx7688_reg_write(anx7688, ANX7688_REG_STATUS_INT, 0);
> +
> +		if (soft_status > 0) {
> +			soft_status &= ANX7688_SOFT_INT_MASK;
> +
> +			if (soft_status & ANX7688_IRQS_RECEIVED_MSG)
> +				anx7688_receive_msg(anx7688);
> +
> +			if (soft_status & (ANX7688_IRQS_CC_STATUS_CHANGE |
> +					   ANX7688_IRQS_VBUS_CHANGE |
> +					   ANX7688_IRQS_VCONN_CHANGE |
> +					   ANX7688_IRQS_DATA_ROLE_CHANGE)) {
> +				anx7688_update_status(anx7688);
> +			}
> +		}
> +
> +		anx7688_reg_write(anx7688, ANX7688_REG_IRQ_EXT_SOURCE2, ANX7688_IRQ2_SOFT_INT);
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&anx7688->lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int anx7688_dr_set(struct typec_port *port, enum typec_data_role role)
> +{
> +	struct anx7688 *anx7688 = typec_get_drvdata(port);
> +	int ret = 0;
> +
> +	dev_info(anx7688->dev, "data role set %d\n", role);
> +
> +	if (anx7688->data_role != role) {
> +		mutex_lock(&anx7688->lock);
> +		ret = anx7688_send_ocm_message(anx7688, ANX7688_OCM_MSG_DSWAP_REQ, 0, 0);
> +		mutex_unlock(&anx7688->lock);
> +	}
> +
> +	return ret;
> +}
> +
> +static int anx7688_pr_set(struct typec_port *port, enum typec_role role)
> +{
> +	struct anx7688 *anx7688 = typec_get_drvdata(port);
> +	int ret = 0;
> +
> +	dev_info(anx7688->dev, "power role set %d\n", role);
> +
> +	if (anx7688->pwr_role != role) {
> +		mutex_lock(&anx7688->lock);
> +		ret = anx7688_send_ocm_message(anx7688, ANX7688_OCM_MSG_PSWAP_REQ, 0, 0);
> +		mutex_unlock(&anx7688->lock);
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * Calls to the EEPROM functions need to be taken under the anx7688 lock.
> + */
> +static int anx7688_eeprom_set_address(struct anx7688 *anx7688, u16 addr)
> +{
> +	int ret;
> +
> +	ret = anx7688_reg_write(anx7688, 0xe0, (addr >> 8) & 0xff);
> +	if (ret < 0)
> +		return ret;
> +
> +	return anx7688_reg_write(anx7688, 0xe1, addr & 0xff);
> +}
> +
> +static int anx7688_eeprom_wait_done(struct anx7688 *anx7688)
> +{
> +	ktime_t timeout;
> +	int ret;
> +
> +	// wait for read to be done
> +	timeout = ktime_add_us(ktime_get(), 50000);
> +	while (true) {
> +		ret = anx7688_reg_read(anx7688, 0xe2);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (ret & BIT(3))
> +			return 0;
> +
> +		if (ktime_after(ktime_get(), timeout)) {
> +			dev_err(anx7688->dev, "timeout waiting for eeprom\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +}
> +
> +/* wait for internal FSM of EEPROM to be in a state ready for
> + * programming/reading
> + */
> +static int anx7688_eeprom_wait_ready(struct anx7688 *anx7688)
> +{
> +	ktime_t timeout;
> +	int ret;
> +
> +	// wait until eeprom is ready
> +	timeout = ktime_add_us(ktime_get(), 1000000);
> +	while (true) {
> +		ret = anx7688_reg_read(anx7688, 0x7f);
> +		if (ret < 0)
> +			return ret;
> +
> +		if ((ret & 0x0f) == 7)
> +			return 0;
> +
> +		if (ktime_after(ktime_get(), timeout)) {
> +			dev_err(anx7688->dev, "timeout waiting for eeprom to initialize\n");
> +			return -ETIMEDOUT;
> +		}
> +
> +		msleep(5);
> +	}
> +}
> +
> +static int anx7688_eeprom_read(struct anx7688 *anx7688, unsigned int addr, u8 buf[16])
> +{
> +	int ret;
> +
> +	ret = anx7688_eeprom_set_address(anx7688, addr);
> +	if (ret)
> +		return ret;
> +
> +	// initiate read
> +	ret = anx7688_reg_write(anx7688, 0xe2, 0x06);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = anx7688_eeprom_wait_done(anx7688);
> +	if (ret)
> +		return ret;
> +
> +	ret = i2c_smbus_read_i2c_block_data(anx7688->client, 0xd0, 16, buf);
> +	if (ret < 0) {
> +		dev_err(anx7688->dev,
> +			"failed to read eeprom data (err=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct typec_operations anx7688_typec_ops = {
> +	.dr_set = anx7688_dr_set,
> +	.pr_set = anx7688_pr_set,
> +};
> +
> +/*
> + * This function has to work when the ANX7688 is active, and when
> + * it is powered down. It power cycles the chip and asserts the OCM
> + * reset, to prevent OCM FW interfering with EEPROM reading.
> + *
> + * After reading EEPROM, the reconnection is scheduled.
> + */
> +static int anx7688_firmware_show(struct seq_file *s, void *data)
> +{
> +	struct anx7688 *anx7688 = s->private;
> +	unsigned int addr;
> +	u8 buf[16];
> +	int ret;
> +
> +	mutex_lock(&anx7688->lock);
> +
> +	if (test_bit(ANX7688_F_CONNECTED, anx7688->flags))
> +		anx7688_disconnect(anx7688);
> +
> +	msleep(20);
> +
> +	anx7688_power_enable(anx7688);
> +
> +	ret = anx7688_reg_update_bits(anx7688, ANX7688_REG_USBC_RESET_CTRL,
> +				      ANX7688_USBC_RESET_CTRL_OCM_RESET,
> +				      ANX7688_USBC_RESET_CTRL_OCM_RESET);
> +	if (ret < 0)
> +		goto out_powerdown;
> +
> +	ret = anx7688_eeprom_wait_ready(anx7688);
> +	if (ret)
> +		goto out_powerdown;
> +
> +	msleep(10);
> +
> +	for (addr = 0x10; addr < 0x10000; addr += 16) {
> +		// set address
> +		ret = anx7688_eeprom_read(anx7688, addr, buf);
> +		if (ret < 0)
> +			goto out_powerdown;
> +
> +		seq_write(s, buf, sizeof(buf));
> +	}
> +
> +out_powerdown:
> +	anx7688_power_disable(anx7688);
> +	schedule_delayed_work(&anx7688->work, 0);
> +	mutex_unlock(&anx7688->lock);
> +
> +	return ret;
> +}
> +DEFINE_SHOW_ATTRIBUTE(anx7688_firmware);
> +
> +static int anx7688_regs_show(struct seq_file *s, void *data)
> +{
> +	struct anx7688 *anx7688 = s->private;
> +	u8 buf[16];
> +	unsigned int i, addr;
> +	int ret = -ENODEV;
> +
> +	mutex_lock(&anx7688->lock);
> +
> +	if (!test_bit(ANX7688_F_POWERED, anx7688->flags))
> +		goto out_unlock;
> +
> +	for (addr = 0; addr < 256; addr += 16) {
> +		ret = i2c_smbus_read_i2c_block_data(anx7688->client, addr,
> +						    sizeof(buf), buf);
> +		if (ret < 0) {
> +			dev_err(anx7688->dev,
> +				"failed to read registers (err=%d)\n", ret);
> +			goto out_unlock;
> +		}
> +
> +		for (i = 0; i < 16; i++)
> +			seq_printf(s, "50%02x: %02x\n", addr + i, buf[i]);
> +	}
> +
> +	for (addr = 0; addr < 256; addr += 16) {
> +		ret = i2c_smbus_read_i2c_block_data(anx7688->client_tcpc, addr,
> +						    sizeof(buf), buf);
> +		if (ret < 0) {
> +			dev_err(anx7688->dev,
> +				"failed to read registers (err=%d)\n", ret);
> +			goto out_unlock;
> +		}
> +
> +		for (i = 0; i < 16; i++)
> +			seq_printf(s, "58%02x: %02x\n", addr + i, buf[i]);
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&anx7688->lock);
> +
> +	return ret;
> +}
> +DEFINE_SHOW_ATTRIBUTE(anx7688_regs);
> +
> +static int anx7688_status_show(struct seq_file *s, void *data)
> +{
> +	struct anx7688 *anx7688 = s->private;
> +
> +	mutex_lock(&anx7688->lock);
> +
> +	seq_puts(s, "not much\n");
> +
> +	mutex_unlock(&anx7688->lock);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(anx7688_status);
> +
> +/*
> + * This is just a 1s watchdog checking the state if cabledet pin.
> + */
> +static void anx7688_cabledet_timer_fn(struct timer_list *t)
> +{
> +	struct anx7688 *anx7688 = from_timer(anx7688, t, work_timer);
> +
> +	schedule_delayed_work(&anx7688->work, 0);
> +	mod_timer(t, jiffies + msecs_to_jiffies(1000));
> +}
> +
> +static void anx7688_handle_vbus_in_notify(struct anx7688 *anx7688)
> +{
> +	union power_supply_propval psy_val = {0,};
> +	struct device *dev = anx7688->dev;
> +	int ret;
> +
> +	ret = power_supply_get_property(anx7688->vbus_in_supply,
> +					POWER_SUPPLY_PROP_USB_TYPE,
> +					&psy_val);
> +	if (ret) {
> +		dev_err(dev, "failed to get USB BC1.2 result\n");
> +		return;
> +	}
> +
> +	if (anx7688->last_bc_result == psy_val.intval)
> +		return;
> +
> +	anx7688->last_bc_result = psy_val.intval;
> +
> +	switch (psy_val.intval) {
> +	case POWER_SUPPLY_USB_TYPE_DCP:
> +	case POWER_SUPPLY_USB_TYPE_CDP:
> +		dev_dbg(dev, "BC 1.2 result: DCP or CDP\n");
> +		break;
> +	case POWER_SUPPLY_USB_TYPE_SDP:
> +	default:
> +		dev_dbg(dev, "BC 1.2 result: SDP\n");
> +		break;
> +	}
> +}
> +
> +static int anx7688_cc_status(unsigned int v)
> +{
> +	switch (v) {
> +	case 0: return -1;
> +	case 1: return -1;
> +	case 2: return -1;
> +	case 4: return TYPEC_PWR_MODE_USB;
> +	case 8: return TYPEC_PWR_MODE_1_5A;
> +	case 12: return TYPEC_PWR_MODE_3_0A;
> +	default: return -1;
> +	}
> +}
> +
> +static const char *anx7688_get_power_mode_name(enum typec_pwr_opmode mode)
> +{
> +	switch (mode) {
> +	case TYPEC_PWR_MODE_USB: return "USB";
> +	case TYPEC_PWR_MODE_1_5A: return "1.5A";
> +	case TYPEC_PWR_MODE_3_0A: return "3.0A";
> +	case TYPEC_PWR_MODE_PD: return "PD";
> +	default: return "Unknown";
> +	}
> +}
> +
> +/*
> + * This is called after 500ms after connection when the PD contract should have
> + * been negotiated. We should inspect CC pins or PD status here and decide what
> + * input current limit to set.
> + */
> +static void anx7688_handle_current_update(struct anx7688 *anx7688)
> +{
> +	unsigned int cc_status = anx7688->last_cc_status;
> +	union power_supply_propval val = {0,};
> +	struct device *dev = anx7688->dev;
> +	int pwr_mode, ret, current_limit = 0;
> +
> +	if (anx7688->pd_capable) {
> +		pwr_mode = TYPEC_PWR_MODE_PD;
> +	} else if (cc_status < 0) {
> +		pwr_mode = TYPEC_PWR_MODE_USB;
> +	} else {
> +		pwr_mode = anx7688_cc_status(cc_status & 0xf);
> +		if (pwr_mode < 0)
> +			pwr_mode = anx7688_cc_status((cc_status >> 4) & 0xf);
> +		if (pwr_mode < 0)
> +			pwr_mode = TYPEC_PWR_MODE_USB;
> +	}
> +
> +	if (pwr_mode == TYPEC_PWR_MODE_1_5A)
> +		current_limit = 1500;
> +	else if (pwr_mode == TYPEC_PWR_MODE_3_0A)
> +		current_limit = 3000;
> +	else if (pwr_mode == TYPEC_PWR_MODE_PD)
> +		current_limit = anx7688->pd_current_limit;
> +
> +	anx7688->input_current_limit = current_limit;
> +
> +	dev_info(anx7688->dev, "updating power mode to %s, current limit %dmA (0 => BC1.2)\n",
> +		 anx7688_get_power_mode_name(pwr_mode), current_limit);
> +
> +	if (current_limit) {
> +		/*
> +		 * Disable BC1.2 detection, because we'll be setting
> +		 * a current limit determined by USB-PD
> +		 */
> +		dev_dbg(dev, "disabling USB BC 1.2 detection\n");
> +
> +		val.intval = current_limit * 1000;
> +		dev_dbg(dev, "setting vbus_in current limit to %d mA\n", current_limit);
> +		ret = power_supply_set_property(anx7688->vbus_in_supply,
> +						POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
> +						&val);
> +		if (ret)
> +			dev_err(dev, "failed to set vbus_in current to %d mA\n",
> +				current_limit);
> +	}
> +		/*
> +		 * else use the result of BC1.2 detection performed by PMIC.
> +		 */
> +
> +	/* Turn on VBUS power path inside PMIC. */
> +	val.intval = 1;
> +	dev_dbg(dev, "enabling vbus_in power path\n");
> +	ret = power_supply_set_property(anx7688->vbus_in_supply,
> +					POWER_SUPPLY_PROP_ONLINE,
> +					&val);
> +	if (ret)
> +		dev_err(anx7688->dev, "failed to enable vbus_in\n");
> +
> +	typec_set_pwr_opmode(anx7688->port, pwr_mode);
> +}
> +
> +static int anx7688_vbus_in_notify(struct notifier_block *nb,
> +				  unsigned long val, void *v)
> +{
> +	struct anx7688 *anx7688 = container_of(nb, struct anx7688, vbus_in_nb);
> +	struct power_supply *psy = v;
> +
> +	/* atomic context */
> +	if (val == PSY_EVENT_PROP_CHANGED && psy == anx7688->vbus_in_supply) {
> +		set_bit(ANX7688_F_PWRSUPPLY_CHANGE, anx7688->flags);
> +		schedule_delayed_work(&anx7688->work, 0);
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static void anx7688_work(struct work_struct *work)
> +{
> +	struct anx7688 *anx7688 = container_of(work, struct anx7688, work.work);
> +
> +	if (test_bit(ANX7688_F_FW_FAILED, anx7688->flags))
> +		return;
> +
> +	mutex_lock(&anx7688->lock);
> +
> +	if (test_and_clear_bit(ANX7688_F_PWRSUPPLY_CHANGE, anx7688->flags))
> +		anx7688_handle_vbus_in_notify(anx7688);
> +
> +	anx7688_handle_cable_change(anx7688);
> +
> +	if (test_bit(ANX7688_F_CONNECTED, anx7688->flags)) {
> +		/*
> +		 * We check status periodically outside of interrupt, just to
> +		 * be sure we didn't miss any status interrupts
> +		 */
> +		anx7688_update_status(anx7688);
> +
> +		if (anx7688->current_update_deadline &&
> +			ktime_after(ktime_get(), anx7688->current_update_deadline)) {
> +			anx7688->current_update_deadline = 0;
> +			anx7688_handle_current_update(anx7688);
> +		}
> +	}
> +
> +	mutex_unlock(&anx7688->lock);
> +}
> +
> +static int anx7688_parse_connector(struct device *dev, struct anx7688 *anx7688, struct typec_capability *cap)
> +{
> +	struct fwnode_handle *fwnode;
> +	const char *buf;
> +	int ret;
> +
> +	fwnode = device_get_named_child_node(dev, "connector");
> +	if (!fwnode)
> +		return -EINVAL;
> +
> +	ret = fwnode_property_read_string(fwnode, "power-role", &buf);
> +	if (ret) {
> +		dev_err(dev, "power-role not found: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = typec_find_port_power_role(buf);
> +	if (ret < 0)
> +		return ret;
> +	cap->type = ret;
> +
> +	ret = fwnode_property_read_string(fwnode, "data-role", &buf);
> +	if (ret) {
> +		dev_err(dev, "data-role not found: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = typec_find_port_data_role(buf);
> +	if (ret < 0)
> +		return ret;
> +	cap->data = ret;
> +
> +	ret = fwnode_property_read_string(fwnode, "try-power-role", &buf);
> +	if (ret) {
> +		dev_err(dev, "try-power-role not found: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = typec_find_power_role(buf);
> +	if (ret < 0)
> +		return ret;
> +	cap->prefer_role = ret;
> +
> +	/* Get source pdos */
> +	ret = fwnode_property_count_u32(fwnode, "source-pdos");
> +	if (ret <= 0)
> +		return -EINVAL;
> +
> +	anx7688->n_src_caps = min_t(u8, ret, ARRAY_SIZE(anx7688->src_caps));
> +	ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
> +					     anx7688->src_caps,
> +					     anx7688->n_src_caps);
> +	if (ret < 0) {
> +		dev_err(dev, "source cap validate failed: %d\n", ret);
> +		return -EINVAL;
> +	}
> +
> +	ret = fwnode_property_count_u32(fwnode, "sink-pdos");
> +	if (ret <= 0)
> +		return -EINVAL;
> +
> +	anx7688->n_snk_caps = min_t(u8, ret, ARRAY_SIZE(anx7688->snk_caps));
> +	ret = fwnode_property_read_u32_array(fwnode, "sink-pdos",
> +					     anx7688->snk_caps,
> +					     anx7688->n_snk_caps);
> +	if (ret < 0) {
> +		dev_err(dev, "sink cap validate failed: %d\n", ret);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int anx7688_i2c_probe(struct i2c_client *client)
> +{
> +	struct anx7688 *anx7688;
> +	struct device *dev = &client->dev;
> +	struct typec_capability typec_cap = { };
> +	int i, vid_h, vid_l;
> +	int irq_cabledet;
> +	int ret = 0;
> +
> +	anx7688 = devm_kzalloc(dev, sizeof(*anx7688), GFP_KERNEL);
> +	if (!anx7688)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, anx7688);
> +	anx7688->client = client;
> +	anx7688->dev = &client->dev;
> +	mutex_init(&anx7688->lock);
> +	INIT_DELAYED_WORK(&anx7688->work, anx7688_work);
> +	anx7688->last_extcon_state = -1;
> +
> +	ret = anx7688_parse_connector(dev, anx7688, &typec_cap);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to parse connector from DT\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < ANX7688_NUM_SUPPLIES; i++)
> +		anx7688->supplies[i].supply = anx7688_supply_names[i];
> +	ret = devm_regulator_bulk_get(dev, ANX7688_NUM_SUPPLIES,
> +				      anx7688->supplies);
> +	if (ret)
> +		return ret;
> +
> +	anx7688->vbus_in_supply =
> +		devm_power_supply_get_by_phandle(dev, "vbus-in-supply");
> +	if (IS_ERR(anx7688->vbus_in_supply)) {
> +		dev_err(dev, "Couldn't get the VBUS power supply\n");
> +		return PTR_ERR(anx7688->vbus_in_supply);
> +	}
> +
> +	if (!anx7688->vbus_in_supply)
> +		return -EPROBE_DEFER;
> +
> +	anx7688->gpio_enable = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(anx7688->gpio_enable)) {
> +		dev_err(dev, "Could not get enable gpio\n");
> +		return PTR_ERR(anx7688->gpio_enable);
> +	}
> +
> +	anx7688->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(anx7688->gpio_reset)) {
> +		dev_err(dev, "Could not get reset gpio\n");
> +		return PTR_ERR(anx7688->gpio_reset);
> +	}
> +
> +	anx7688->gpio_cabledet = devm_gpiod_get(dev, "cabledet", GPIOD_IN);
> +	if (IS_ERR(anx7688->gpio_cabledet)) {
> +		dev_err(dev, "Could not get cabledet gpio\n");
> +		return PTR_ERR(anx7688->gpio_cabledet);
> +	}
> +
> +	irq_cabledet = gpiod_to_irq(anx7688->gpio_cabledet);
> +	if (irq_cabledet < 0) {
> +		dev_err(dev, "Could not get cabledet irq\n");
> +		return irq_cabledet;
> +	}
> +
> +	// Initialize extcon device
> +	anx7688->extcon = devm_extcon_dev_allocate(dev, anx7688_extcon_cable);
> +	if (IS_ERR(anx7688->extcon))
> +		return -ENOMEM;
> +
> +	ret = devm_extcon_dev_register(dev, anx7688->extcon);
> +	if (ret) {
> +		dev_err(dev, "failed to register extcon device\n");
> +		return ret;
> +	}
> +
> +	// Register the TCPC i2c interface as second interface (0x58)
> +	anx7688->client_tcpc = i2c_new_dummy_device(client->adapter, 0x2c);
> +	if (IS_ERR(anx7688->client_tcpc)) {
> +		dev_err(dev, "Could not register tcpc i2c client\n");
> +		return PTR_ERR(anx7688->client_tcpc);
> +	}
> +	i2c_set_clientdata(anx7688->client_tcpc, anx7688);
> +
> +	// powerup and probe the ANX chip
> +
> +	ret = regulator_bulk_enable(ANX7688_NUM_ALWAYS_ON_SUPPLIES,
> +				    anx7688->supplies);
> +	if (ret) {
> +		dev_err(dev, "Could not enable regulators\n");
> +		goto err_dummy_dev;
> +	}
> +
> +	msleep(10);
> +
> +	anx7688_power_enable(anx7688);
> +
> +	vid_l = anx7688_tcpc_reg_read(anx7688, ANX7688_TCPC_REG_VENDOR_ID0);
> +	vid_h = anx7688_tcpc_reg_read(anx7688, ANX7688_TCPC_REG_VENDOR_ID1);
> +	if (vid_l < 0 || vid_h < 0) {
> +		ret = vid_l < 0 ? vid_l : vid_h;
> +		anx7688_power_disable(anx7688);
> +		goto err_disable_reg;
> +	}
> +
> +	dev_info(dev, "Vendor id 0x%04x\n", vid_l | vid_h << 8);
> +
> +	anx7688_power_disable(anx7688);
> +
> +	anx7688->role_sw = usb_role_switch_get(dev);
> +	if (IS_ERR(anx7688->role_sw)) {
> +		dev_err(dev, "Could not get role switch\n");
> +		ret = PTR_ERR(anx7688->role_sw);
> +		goto err_disable_reg;
> +	}
> +
> +	// setup a typec port device
> +	typec_cap.revision = USB_TYPEC_REV_1_2;
> +	typec_cap.pd_revision = 0x200;
> +	ret = -EINVAL;
> +	if (typec_cap.type != TYPEC_PORT_DRP)
> +		goto err_disable_reg;
> +	if (typec_cap.data != TYPEC_PORT_DRD)
> +		goto err_disable_reg;
> +	typec_cap.driver_data = anx7688;
> +	typec_cap.ops = &anx7688_typec_ops;
> +
> +	anx7688->port = typec_register_port(dev, &typec_cap);
> +	if (IS_ERR(anx7688->port)) {
> +		dev_err(dev, "Could not register type-c port\n");
> +		ret = PTR_ERR(anx7688->port);
> +		goto err_role_sw;
> +	}
> +
> +	anx7688->pwr_role = TYPEC_SINK;
> +	anx7688->data_role = TYPEC_DEVICE;
> +	typec_set_pwr_role(anx7688->port, anx7688->pwr_role);
> +	typec_set_data_role(anx7688->port, anx7688->data_role);
> +	typec_set_pwr_opmode(anx7688->port, TYPEC_PWR_MODE_USB);
> +	typec_set_vconn_role(anx7688->port, TYPEC_SINK);
> +
> +	// make sure BC1.2 detection in PMIC is enabled
> +	anx7688->last_bc_result = -1;
> +
> +	dev_dbg(dev, "enabling USB BC 1.2 detection\n");
> +
> +	ret = devm_request_irq(dev, irq_cabledet, anx7688_irq_plug_handler,
> +			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
> +			       "anx7688-cabledet", anx7688);
> +	if (ret < 0) {
> +		dev_err(dev, "Could not request cabledet irq (%d)\n", ret);
> +		goto err_cport;
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, client->irq,
> +					NULL, anx7688_irq_status_handler,
> +					IRQF_ONESHOT, NULL, anx7688);
> +	if (ret < 0) {
> +		dev_err(dev, "Could not request irq (%d)\n", ret);
> +		goto err_cport;
> +	}
> +
> +	anx7688->vbus_in_nb.notifier_call = anx7688_vbus_in_notify;
> +	anx7688->vbus_in_nb.priority = 0;
> +	ret = power_supply_reg_notifier(&anx7688->vbus_in_nb);
> +	if (ret)
> +		goto err_cport;
> +
> +	anx7688->debug_root = debugfs_create_dir("anx7688", NULL);
> +	debugfs_create_file("firmware", 0444, anx7688->debug_root, anx7688,
> +			    &anx7688_firmware_fops);
> +	debugfs_create_file("regs", 0444, anx7688->debug_root, anx7688,
> +			    &anx7688_regs_fops);
> +	debugfs_create_file("status", 0444, anx7688->debug_root, anx7688,
> +			    &anx7688_status_fops);
> +
> +	schedule_delayed_work(&anx7688->work, msecs_to_jiffies(10));
> +
> +	timer_setup(&anx7688->work_timer, anx7688_cabledet_timer_fn, 0);
> +	mod_timer(&anx7688->work_timer, jiffies + msecs_to_jiffies(1000));
> +	return 0;
> +
> +err_cport:
> +	typec_unregister_port(anx7688->port);
> +err_role_sw:
> +	usb_role_switch_put(anx7688->role_sw);
> +err_disable_reg:
> +	regulator_bulk_disable(ANX7688_NUM_ALWAYS_ON_SUPPLIES, anx7688->supplies);
> +err_dummy_dev:
> +	i2c_unregister_device(anx7688->client_tcpc);
> +	return ret;
> +}
> +
> +static void anx7688_i2c_remove(struct i2c_client *client)
> +{
> +	struct anx7688 *anx7688 = i2c_get_clientdata(client);
> +
> +	mutex_lock(&anx7688->lock);
> +
> +	power_supply_unreg_notifier(&anx7688->vbus_in_nb);
> +
> +	del_timer_sync(&anx7688->work_timer);
> +
> +	cancel_delayed_work_sync(&anx7688->work);
> +
> +	if (test_bit(ANX7688_F_CONNECTED, anx7688->flags))
> +		anx7688_disconnect(anx7688);
> +
> +	typec_unregister_partner(anx7688->partner);
> +	typec_unregister_port(anx7688->port);
> +	usb_role_switch_put(anx7688->role_sw);
> +
> +	regulator_bulk_disable(ANX7688_NUM_ALWAYS_ON_SUPPLIES, anx7688->supplies);
> +	i2c_unregister_device(anx7688->client_tcpc);
> +
> +	debugfs_remove(anx7688->debug_root);
> +
> +	mutex_unlock(&anx7688->lock);
> +}
> +
> +static int __maybe_unused anx7688_suspend(struct device *dev)
> +{
> +	struct anx7688 *anx7688 = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	del_timer_sync(&anx7688->work_timer);
> +	cancel_delayed_work_sync(&anx7688->work);
> +
> +	regulator_disable(anx7688->supplies[ANX7688_I2C_INDEX].consumer);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused anx7688_resume(struct device *dev)
> +{
> +	struct anx7688 *anx7688 = i2c_get_clientdata(to_i2c_client(dev));
> +	int ret;
> +
> +	ret = regulator_enable(anx7688->supplies[ANX7688_I2C_INDEX].consumer);
> +	if (ret)
> +		dev_warn(anx7688->dev,
> +			 "failed to enable I2C regulator (%d)\n", ret);
> +
> +	// check status right after resume, since it could have changed during
> +	// sleep
> +	schedule_delayed_work(&anx7688->work, msecs_to_jiffies(50));
> +	mod_timer(&anx7688->work_timer, jiffies + msecs_to_jiffies(1000));
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops anx7688_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(anx7688_suspend, anx7688_resume)
> +};
> +
> +static const struct i2c_device_id anx7688_ids[] = {
> +	{ "anx7688", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, anx7688_ids);
> +
> +static const struct of_device_id anx7688_of_match_table[] = {
> +	{ .compatible = "analogix,anx7688" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, anx7688_of_match_table);
> +
> +static struct i2c_driver anx7688_driver = {
> +	.driver = {
> +		.name = "anx7688",
> +		.of_match_table = anx7688_of_match_table,
> +		.pm = &anx7688_pm_ops,
> +	},
> +	.probe = anx7688_i2c_probe,
> +	.remove = anx7688_i2c_remove,
> +	.id_table = anx7688_ids,
> +};
> +
> +module_i2c_driver(anx7688_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Martijn Braam <martijn@brixit.nl>");
> +MODULE_AUTHOR("Ondrej Jirman <megi@xff.cz>");
> +MODULE_DESCRIPTION("Analogix ANX7688 USB-C DisplayPort bridge");
> 
> 
> -- 
> People of Russia, stop Putin before his war on Ukraine escalates.



-- 
heikki

