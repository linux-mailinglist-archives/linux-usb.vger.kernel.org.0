Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D3312436E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2019 10:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbfLRJid convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 18 Dec 2019 04:38:33 -0500
Received: from mail-oln040092254064.outbound.protection.outlook.com ([40.92.254.64]:25195
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725785AbfLRJic (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Dec 2019 04:38:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcKFJ303N6ab5IKlnRz9+rEqeq1BoTX5j6SSM16Ygwfo/GXK5b01/aDWZFUbaqm5u5tgjLVYlepJel1Jq1kvci3uS9/fiiDqWbd6zUom1GdLGWrf/m2w3SvdyXXJojp2FF418BhfQXEB8Kh0L9WZES+9JfLEJWvd3ZGExbO0U+EotqgBv12Goig7StAUD1W6yLsKBOxfF3/YaebwRYiY7GmGvsoYPpICyN1iQZN4QiSlS+OthGGXRnqfDuBfmYO8iBpTWxdnHBGODeDRY1cY/ADDpg5aT0OtwtNtCtCtdDv6zNXDzGUnIZBksHcZ/+HG233OoB3b0/xb8XF0vUIAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgJb+NsdCo5HCG2CcDdWmPFhM1ZqQtnbbA1WFy1teB4=;
 b=NvgfJ63ziOmOfZZU/HmXt5Ll9uvoL2xolZAsXAOi+p5lUgPh0KouXS+y2dIh+JIXEnfS+wafKGy4cBoHjBWDAOvKG7r1NeHnGTeEOEPqP3ZMJyw1WwvqVyqoe8xt7HYnTyyQnCl9wIxpQ6czlNNNNNW4VQo/oQHURSCbSAIG55IRulx8epPMKuDmqdXObWdJvDNgfAqxu4yA61D1vfxWPFV6M5/h1oI75F6IdhxdeqctFzMgasPRKrlWDkk6d99pda4ArXABQEfZ0Xvqj9IhhDrIBtd8//y1FpvIminh5TRD48HzQVLl6YxtZoxS+0N+V9B/nA7pp2pguuS4TkL17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SG2APC01FT010.eop-APC01.prod.protection.outlook.com
 (10.152.250.52) by SG2APC01HT185.eop-APC01.prod.protection.outlook.com
 (10.152.251.234) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15; Wed, 18 Dec
 2019 09:38:21 +0000
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM (10.152.250.52) by
 SG2APC01FT010.mail.protection.outlook.com (10.152.250.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Wed, 18 Dec 2019 09:38:21 +0000
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::20ad:6646:5bcd:63c9]) by PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::20ad:6646:5bcd:63c9%11]) with mapi id 15.20.2559.012; Wed, 18 Dec
 2019 09:38:21 +0000
From:   Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Mario.Limonciello@dell.com" <Mario.Limonciello@dell.com>,
        Anthony Wong <anthony.wong@canonical.com>,
        Oliver Neukum <oneukum@suse.com>,
        Christian Kellner <ckellner@redhat.com>,
        "David S . Miller" <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 7/9] thunderbolt: Add support for Time Management Unit
Thread-Topic: [PATCH v2 7/9] thunderbolt: Add support for Time Management Unit
Thread-Index: AQHVtNZFQY5A6hbf9EuKz5HGrfBctqe/pAyA
Date:   Wed, 18 Dec 2019 09:38:21 +0000
Message-ID: <PSXP216MB0438D5F1AF46C217C71E5C4180530@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
References: <20191217123345.31850-1-mika.westerberg@linux.intel.com>
 <20191217123345.31850-8-mika.westerberg@linux.intel.com>
In-Reply-To: <20191217123345.31850-8-mika.westerberg@linux.intel.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SYBPR01CA0098.ausprd01.prod.outlook.com
 (2603:10c6:10:1::14) To PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 (2603:1096:300:d::20)
x-incomingtopheadermarker: OriginalChecksum:9A4B31AFA5167F9712976C422FF00AD4ECE2BB0E49637E1C4D35BBBCE134E781;UpperCasedChecksum:B2C44AF73D5B8F65D33122C02134C258E7D05BD19085C1C9DE0D1C9BE9686A84;SizeAsReceived:8158;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [yZAyGGzRALBQdqTXzhSqn2PVs31tKTmNgALeBG1R0Zh2DNoUUq7u6vPbCyBweC3q]
x-microsoft-original-message-id: <20191218093811.GC3499@nicholas-dell-linux>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 05bb9513-6dec-4710-6eef-08d7839e04c1
x-ms-traffictypediagnostic: SG2APC01HT185:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DL5Qn9SzhZD3M59JJeSxSSvF4SAvKbAr4LL2s6sTDINtAY9Xzg8G7BX7BQ3NU4HKlRPXL4NbQRZ8suSiglr/QRTrbAhbykyK1m7g100EkhEmOpQat6ZYaxt13Y6T1CQbi7N3z0TqExYCcz4M7JjrBvqRf+IPMtKNWJ6rVZLb1tWsR0A1zE2b6OEHGG+Vq7pG
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7489E18DC1EE7A438838893287FE9B79@KORP216.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bb9513-6dec-4710-6eef-08d7839e04c1
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 09:38:21.0188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT185
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 17, 2019 at 03:33:43PM +0300, Mika Westerberg wrote:
> From: Rajmohan Mani <rajmohan.mani@intel.com>
> 
> Time Management Unit (TMU) is included in each USB4 router. It is used
> to synchronize time across the USB4 fabric. By default when USB4 router
> is plugged to the domain, its TMU is turned off. This differs from
> Thunderbolt (1, 2 and 3) devices whose TMU is by default configured to
> bi-directional HiFi mode. Since time synchronization is needed for
> proper Display Port tunneling this means we need to configure the TMU on
Nitpick: DisplayPort is a single word.

> USB4 compliant devices.
> 
> The USB4 spec allows some flexibility on how the TMU can be configured.
> This makes it possible to enable link power management states (CLx) in
> certain topologies, where for example DP tunneling is not used. TMU can
> also be re-configured dynamicaly depending on types of tunnels created
> over the USB4 fabric.
> 
> In this patch we simply configure the TMU to be in bi-directional HiFi
> mode. This way we can tunnel any kind of traffic without need to perform
> complex steps to re-configure the domain dynamically. We can add more
> fine-grained TMU configuration later on when we start enabling CLx
> states.
> 
> Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
> Co-developed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/Makefile  |   2 +-
>  drivers/thunderbolt/switch.c  |   4 +
>  drivers/thunderbolt/tb.c      |  28 +++
>  drivers/thunderbolt/tb.h      |  47 +++++
>  drivers/thunderbolt/tb_regs.h |  20 ++
>  drivers/thunderbolt/tmu.c     | 383 ++++++++++++++++++++++++++++++++++
>  6 files changed, 483 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/thunderbolt/tmu.c
> 
> diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
> index 102e9529ee66..eae28dd45250 100644
> --- a/drivers/thunderbolt/Makefile
> +++ b/drivers/thunderbolt/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-${CONFIG_USB4} := thunderbolt.o
>  thunderbolt-objs := nhi.o nhi_ops.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
> -thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o usb4.o
> +thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index c1d5cd7e0631..82f45780dc81 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -2338,6 +2338,10 @@ int tb_switch_add(struct tb_switch *sw)
>  		ret = tb_switch_update_link_attributes(sw);
>  		if (ret)
>  			return ret;
> +
> +		ret = tb_switch_tmu_init(sw);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	ret = device_add(&sw->dev);
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 6b99dcd1790c..e446624dd3e7 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -158,6 +158,25 @@ static void tb_scan_xdomain(struct tb_port *port)
>  	}
>  }
>  
> +static int tb_enable_tmu(struct tb_switch *sw)
> +{
> +	int ret;
> +
> +	/* If it is already enabled in correct mode, don't touch it */
> +	if (tb_switch_tmu_is_enabled(sw))
> +		return 0;
> +
> +	ret = tb_switch_tmu_disable(sw);
> +	if (ret)
> +		return ret;
> +
> +	ret = tb_switch_tmu_post_time(sw);
> +	if (ret)
> +		return ret;
> +
> +	return tb_switch_tmu_enable(sw);
> +}
> +
>  static void tb_scan_port(struct tb_port *port);
>  
>  /**
> @@ -257,6 +276,9 @@ static void tb_scan_port(struct tb_port *port)
>  	if (tb_switch_lane_bonding_enable(sw))
>  		tb_sw_warn(sw, "failed to enable lane bonding\n");
>  
> +	if (tb_enable_tmu(sw))
> +		tb_sw_warn(sw, "failed to enable TMU\n");
> +
>  	tb_scan_switch(sw);
>  }
>  
> @@ -709,6 +731,7 @@ static void tb_handle_hotplug(struct work_struct *work)
>  			tb_sw_set_unplugged(port->remote->sw);
>  			tb_free_invalid_tunnels(tb);
>  			tb_remove_dp_resources(port->remote->sw);
> +			tb_switch_tmu_disable(port->remote->sw);
>  			tb_switch_lane_bonding_disable(port->remote->sw);
>  			tb_switch_remove(port->remote->sw);
>  			port->remote = NULL;
> @@ -855,6 +878,8 @@ static int tb_start(struct tb *tb)
>  		return ret;
>  	}
>  
> +	/* Enable TMU if it is off */
> +	tb_switch_tmu_enable(tb->root_switch);
>  	/* Full scan to discover devices added before the driver was loaded. */
>  	tb_scan_switch(tb->root_switch);
>  	/* Find out tunnels created by the boot firmware */
> @@ -886,6 +911,9 @@ static void tb_restore_children(struct tb_switch *sw)
>  {
>  	struct tb_port *port;
>  
> +	if (tb_enable_tmu(sw))
> +		tb_sw_warn(sw, "failed to restore TMU configuration\n");
> +
>  	tb_switch_for_each_port(sw, port) {
>  		if (!tb_port_has_remote(port))
>  			continue;
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 28dd0e0b1579..63ffb3cbdefe 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -46,6 +46,38 @@ struct tb_switch_nvm {
>  #define TB_SWITCH_MAX_DEPTH		6
>  #define USB4_SWITCH_MAX_DEPTH		5
>  
> +/**
> + * enum tb_switch_tmu_rate - TMU refresh rate
> + * @TB_SWITCH_TMU_RATE_OFF: %0 (Disable Time Sync handshake)
> + * @TB_SWITCH_TMU_RATE_HIFI: %16 us time interval between successive
> + *			     transmission of the Delay Request TSNOS
> + *			     (Time Sync Notification Ordered Set) on a Link
> + * @TB_SWITCH_TMU_RATE_NORMAL: %1 ms time interval between successive
> + *			       transmission of the Delay Request TSNOS on
> + *			       a Link
> + */
> +enum tb_switch_tmu_rate {
> +	TB_SWITCH_TMU_RATE_OFF = 0,
> +	TB_SWITCH_TMU_RATE_HIFI = 16,
> +	TB_SWITCH_TMU_RATE_NORMAL = 1000,
> +};
> +
> +/**
> + * struct tb_switch_tmu - Structure holding switch TMU configuration
> + * @cap: Offset to the TMU capability (%0 if not found)
> + * @has_ucap: Does the switch support uni-directional mode
> + * @rate: TMU refresh rate related to upstream switch. In case of root
> + *	  switch this holds the domain rate.
> + * @unidirectional: Is the TMU in uni-directional or bi-directional mode
> + *		    related to upstream switch. Don't case for root switch.
> + */
> +struct tb_switch_tmu {
> +	int cap;
> +	bool has_ucap;
> +	enum tb_switch_tmu_rate rate;
> +	bool unidirectional;
> +};
> +
>  /**
>   * struct tb_switch - a thunderbolt switch
>   * @dev: Device for the switch
> @@ -55,6 +87,7 @@ struct tb_switch_nvm {
>   *	      mailbox this will hold the pointer to that (%NULL
>   *	      otherwise). If set it also means the switch has
>   *	      upgradeable NVM.
> + * @tmu: The switch TMU configuration
>   * @tb: Pointer to the domain the switch belongs to
>   * @uid: Unique ID of the switch
>   * @uuid: UUID of the switch (or %NULL if not supported)
> @@ -93,6 +126,7 @@ struct tb_switch {
>  	struct tb_regs_switch_header config;
>  	struct tb_port *ports;
>  	struct tb_dma_port *dma_port;
> +	struct tb_switch_tmu tmu;
>  	struct tb *tb;
>  	u64 uid;
>  	uuid_t *uuid;
> @@ -129,6 +163,7 @@ struct tb_switch {
>   * @remote: Remote port (%NULL if not connected)
>   * @xdomain: Remote host (%NULL if not connected)
>   * @cap_phy: Offset, zero if not found
> + * @cap_tmu: Offset of the adapter specific TMU capability (%0 if not present)
>   * @cap_adap: Offset of the adapter specific capability (%0 if not present)
>   * @cap_usb4: Offset to the USB4 port capability (%0 if not present)
>   * @port: Port number on switch
> @@ -147,6 +182,7 @@ struct tb_port {
>  	struct tb_port *remote;
>  	struct tb_xdomain *xdomain;
>  	int cap_phy;
> +	int cap_tmu;
>  	int cap_adap;
>  	int cap_usb4;
>  	u8 port;
> @@ -672,6 +708,17 @@ bool tb_switch_query_dp_resource(struct tb_switch *sw, struct tb_port *in);
>  int tb_switch_alloc_dp_resource(struct tb_switch *sw, struct tb_port *in);
>  void tb_switch_dealloc_dp_resource(struct tb_switch *sw, struct tb_port *in);
>  
> +int tb_switch_tmu_init(struct tb_switch *sw);
> +int tb_switch_tmu_post_time(struct tb_switch *sw);
> +int tb_switch_tmu_disable(struct tb_switch *sw);
> +int tb_switch_tmu_enable(struct tb_switch *sw);
> +
> +static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw)
> +{
> +	return sw->tmu.rate == TB_SWITCH_TMU_RATE_HIFI &&
> +	       !sw->tmu.unidirectional;
> +}
> +
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
>  int tb_port_add_nfc_credits(struct tb_port *port, int credits);
>  int tb_port_set_initial_credits(struct tb_port *port, u32 credits);
> diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> index 47f73f992412..ec1a5d1f7c94 100644
> --- a/drivers/thunderbolt/tb_regs.h
> +++ b/drivers/thunderbolt/tb_regs.h
> @@ -26,6 +26,7 @@
>  #define TB_MAX_CONFIG_RW_LENGTH 60
>  
>  enum tb_switch_cap {
> +	TB_SWITCH_CAP_TMU		= 0x03,
>  	TB_SWITCH_CAP_VSE		= 0x05,
>  };
>  
> @@ -195,6 +196,21 @@ struct tb_regs_switch_header {
>  #define ROUTER_CS_26_ONS			BIT(30)
>  #define ROUTER_CS_26_OV				BIT(31)
>  
> +/* Router TMU configuration */
> +#define TMU_RTR_CS_0				0x00
> +#define TMU_RTR_CS_0_TD				BIT(27)
> +#define TMU_RTR_CS_0_UCAP			BIT(30)
> +#define TMU_RTR_CS_1				0x01
> +#define TMU_RTR_CS_1_LOCAL_TIME_NS_MASK		GENMASK(31, 16)
> +#define TMU_RTR_CS_1_LOCAL_TIME_NS_SHIFT	16
> +#define TMU_RTR_CS_2				0x02
> +#define TMU_RTR_CS_3				0x03
> +#define TMU_RTR_CS_3_LOCAL_TIME_NS_MASK		GENMASK(15, 0)
> +#define TMU_RTR_CS_3_TS_PACKET_INTERVAL_MASK	GENMASK(31, 16)
> +#define TMU_RTR_CS_3_TS_PACKET_INTERVAL_SHIFT	16
> +#define TMU_RTR_CS_22				0x16
> +#define TMU_RTR_CS_24				0x18
> +
>  enum tb_port_type {
>  	TB_TYPE_INACTIVE	= 0x000000,
>  	TB_TYPE_PORT		= 0x000001,
> @@ -248,6 +264,10 @@ struct tb_regs_port_header {
>  #define ADP_CS_5_LCA_MASK			GENMASK(28, 22)
>  #define ADP_CS_5_LCA_SHIFT			22
>  
> +/* TMU adapter registers */
> +#define TMU_ADP_CS_3				0x03
> +#define TMU_ADP_CS_3_UDM			BIT(29)
> +
>  /* Lane adapter registers */
>  #define LANE_ADP_CS_0				0x00
>  #define LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK	GENMASK(25, 20)
> diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
> new file mode 100644
> index 000000000000..039c42a06000
> --- /dev/null
> +++ b/drivers/thunderbolt/tmu.c
> @@ -0,0 +1,383 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Thunderbolt Time Management Unit (TMU) support
> + *
> + * Copyright (C) 2019, Intel Corporation
> + * Authors: Mika Westerberg <mika.westerberg@linux.intel.com>
> + *	    Rajmohan Mani <rajmohan.mani@intel.com>
> + */
> +
> +#include <linux/delay.h>
> +
> +#include "tb.h"
> +
> +static const char *tb_switch_tmu_mode_name(const struct tb_switch *sw)
> +{
> +	bool root_switch = !tb_route(sw);
> +
> +	switch (sw->tmu.rate) {
> +	case TB_SWITCH_TMU_RATE_OFF:
> +		return "off";
> +
> +	case TB_SWITCH_TMU_RATE_HIFI:
> +		/* Root switch does not have upstream directionality */
> +		if (root_switch)
> +			return "HiFi";
> +		if (sw->tmu.unidirectional)
> +			return "uni-directional, HiFi";
> +		return "bi-directional, HiFi";
> +
> +	case TB_SWITCH_TMU_RATE_NORMAL:
> +		if (root_switch)
> +			return "normal";
> +		return "uni-directional, normal";
> +
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static bool tb_switch_tmu_ucap_supported(struct tb_switch *sw)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
> +			 sw->tmu.cap + TMU_RTR_CS_0, 1);
> +	if (ret)
> +		return false;
> +
> +	return !!(val & TMU_RTR_CS_0_UCAP);
> +}
> +
> +static int tb_switch_tmu_rate_read(struct tb_switch *sw)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
> +			 sw->tmu.cap + TMU_RTR_CS_3, 1);
> +	if (ret)
> +		return ret;
> +
> +	val >>= TMU_RTR_CS_3_TS_PACKET_INTERVAL_SHIFT;
> +	return val;
> +}
> +
> +static int tb_switch_tmu_rate_write(struct tb_switch *sw, int rate)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
> +			 sw->tmu.cap + TMU_RTR_CS_3, 1);
> +	if (ret)
> +		return ret;
> +
> +	val &= ~TMU_RTR_CS_3_TS_PACKET_INTERVAL_MASK;
> +	val |= rate << TMU_RTR_CS_3_TS_PACKET_INTERVAL_SHIFT;
> +
> +	return tb_sw_write(sw, &val, TB_CFG_SWITCH,
> +			   sw->tmu.cap + TMU_RTR_CS_3, 1);
> +}
> +
> +static int tb_port_tmu_write(struct tb_port *port, u8 offset, u32 mask,
> +			     u32 value)
> +{
> +	u32 data;
> +	int ret;
> +
> +	ret = tb_port_read(port, &data, TB_CFG_PORT, port->cap_tmu + offset, 1);
> +	if (ret)
> +		return ret;
> +
> +	data &= ~mask;
> +	data |= value;
> +
> +	return tb_port_write(port, &data, TB_CFG_PORT,
> +			     port->cap_tmu + offset, 1);
> +}
> +
> +static int tb_port_tmu_set_unidirectional(struct tb_port *port,
> +					  bool unidirectional)
> +{
> +	u32 val;
> +
> +	if (!port->sw->tmu.has_ucap)
> +		return 0;
> +
> +	val = unidirectional ? TMU_ADP_CS_3_UDM : 0;
> +	return tb_port_tmu_write(port, TMU_ADP_CS_3, TMU_ADP_CS_3_UDM, val);
> +}
> +
> +static inline int tb_port_tmu_unidirectional_disable(struct tb_port *port)
> +{
> +	return tb_port_tmu_set_unidirectional(port, false);
> +}
> +
> +static bool tb_port_tmu_is_unidirectional(struct tb_port *port)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = tb_port_read(port, &val, TB_CFG_PORT,
> +			   port->cap_tmu + TMU_ADP_CS_3, 1);
> +	if (ret)
> +		return false;
> +
> +	return val & TMU_ADP_CS_3_UDM;
> +}
> +
> +static int tb_switch_tmu_set_time_disruption(struct tb_switch *sw, bool set)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
> +			 sw->tmu.cap + TMU_RTR_CS_0, 1);
> +	if (ret)
> +		return ret;
> +
> +	if (set)
> +		val |= TMU_RTR_CS_0_TD;
> +	else
> +		val &= ~TMU_RTR_CS_0_TD;
> +
> +	return tb_sw_write(sw, &val, TB_CFG_SWITCH,
> +			   sw->tmu.cap + TMU_RTR_CS_0, 1);
> +}
> +
> +/**
> + * tb_switch_tmu_init() - Initialize switch TMU structures
> + * @sw: Switch to initialized
> + *
> + * This function must be called before other TMU related functions to
> + * makes the internal structures are filled in correctly. Does not
> + * change any hardware configuration.
> + */
> +int tb_switch_tmu_init(struct tb_switch *sw)
> +{
> +	struct tb_port *port;
> +	int ret;
> +
> +	if (tb_switch_is_icm(sw))
> +		return 0;
> +
> +	ret = tb_switch_find_cap(sw, TB_SWITCH_CAP_TMU);
> +	if (ret > 0)
> +		sw->tmu.cap = ret;
> +
> +	tb_switch_for_each_port(sw, port) {
> +		int cap;
> +
> +		cap = tb_port_find_cap(port, TB_PORT_CAP_TIME1);
> +		if (cap > 0)
> +			port->cap_tmu = cap;
> +	}
> +
> +	ret = tb_switch_tmu_rate_read(sw);
> +	if (ret < 0)
> +		return ret;
> +
> +	sw->tmu.rate = ret;
> +
> +	sw->tmu.has_ucap = tb_switch_tmu_ucap_supported(sw);
> +	if (sw->tmu.has_ucap) {
> +		tb_sw_dbg(sw, "TMU: supports uni-directional mode\n");
> +
> +		if (tb_route(sw)) {
> +			struct tb_port *up = tb_upstream_port(sw);
> +
> +			sw->tmu.unidirectional =
> +				tb_port_tmu_is_unidirectional(up);
> +		}
> +	} else {
> +		sw->tmu.unidirectional = false;
> +	}
> +
> +	tb_sw_dbg(sw, "TMU: current mode: %s\n", tb_switch_tmu_mode_name(sw));
> +	return 0;
> +}
> +
> +/**
> + * tb_switch_tmu_post_time() - Update switch local time
> + * @sw: Switch whose time to update
> + *
> + * Updates switch local time using time posting procedure.
> + */
> +int tb_switch_tmu_post_time(struct tb_switch *sw)
> +{
> +	unsigned int  post_local_time_offset, post_time_offset;
> +	struct tb_switch *root_switch = sw->tb->root_switch;
> +	u64 hi, mid, lo, local_time, post_time;
> +	int i, ret, retries = 100;
> +	u32 gm_local_time[3];
> +
> +	if (!tb_route(sw))
> +		return 0;
> +
> +	if (!tb_switch_is_usb4(sw))
> +		return 0;
> +
> +	/* Need to be able to read the grand master time */
> +	if (!root_switch->tmu.cap)
> +		return 0;
> +
> +	ret = tb_sw_read(root_switch, gm_local_time, TB_CFG_SWITCH,
> +			 root_switch->tmu.cap + TMU_RTR_CS_1,
> +			 ARRAY_SIZE(gm_local_time));
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(gm_local_time); i++)
> +		tb_sw_dbg(root_switch, "local_time[%d]=0x%08x\n", i,
> +			  gm_local_time[i]);
> +
> +	/* Convert to nanoseconds (drop fractional part) */
> +	hi = gm_local_time[2] & TMU_RTR_CS_3_LOCAL_TIME_NS_MASK;
> +	mid = gm_local_time[1];
> +	lo = (gm_local_time[0] & TMU_RTR_CS_1_LOCAL_TIME_NS_MASK) >>
> +		TMU_RTR_CS_1_LOCAL_TIME_NS_SHIFT;
> +	local_time = hi << 48 | mid << 16 | lo;
> +
> +	/* Tell the switch that time sync is disrupted for a while */
> +	ret = tb_switch_tmu_set_time_disruption(sw, true);
> +	if (ret)
> +		return ret;
> +
> +	post_local_time_offset = sw->tmu.cap + TMU_RTR_CS_22;
> +	post_time_offset = sw->tmu.cap + TMU_RTR_CS_24;
> +
> +	/*
> +	 * Write the Grandmaster time to the Post Local Time registers
> +	 * of the new switch.
> +	 */
> +	ret = tb_sw_write(sw, &local_time, TB_CFG_SWITCH,
> +			  post_local_time_offset, 2);
> +	if (ret)
> +		goto out;
> +
> +	/*
> +	 * Have the new switch update its local time (by writing 1 to
> +	 * the post_time registers) and wait for the completion of the
> +	 * same (post_time register becomes 0). This means the time has
> +	 * been converged properly.
> +	 */
> +	post_time = 1;
> +
> +	ret = tb_sw_write(sw, &post_time, TB_CFG_SWITCH, post_time_offset, 2);
> +	if (ret)
> +		goto out;
> +
> +	do {
> +		usleep_range(5, 10);
> +		ret = tb_sw_read(sw, &post_time, TB_CFG_SWITCH,
> +				 post_time_offset, 2);
> +		if (ret)
> +			goto out;
> +	} while (--retries && post_time);
> +
> +	if (!retries) {
> +		ret = -ETIMEDOUT;
> +		goto out;
> +	}
> +
> +	tb_sw_dbg(sw, "TMU: updated local time to %#llx\n", local_time);
> +
> +out:
> +	tb_switch_tmu_set_time_disruption(sw, false);
> +	return ret;
> +}
> +
> +/**
> + * tb_switch_tmu_disable() - Disable TMU of a switch
> + * @sw: Switch whose TMU to disable
> + *
> + * Turns off TMU of @sw if it is enabled. If not enabled does nothing.
> + */
> +int tb_switch_tmu_disable(struct tb_switch *sw)
> +{
> +	int ret;
> +
> +	if (!tb_switch_is_usb4(sw))
> +		return 0;
> +
> +	/* Already disabled? */
> +	if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF)
> +		return 0;
> +
> +	if (sw->tmu.unidirectional) {
> +		struct tb_switch *parent = tb_switch_parent(sw);
> +		struct tb_port *up, *down;
> +
> +		up = tb_upstream_port(sw);
> +		down = tb_port_at(tb_route(sw), parent);
> +
> +		/* The switch may be unplugged so ignore any errors */
> +		tb_port_tmu_unidirectional_disable(up);
> +		ret = tb_port_tmu_unidirectional_disable(down);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
> +
> +	sw->tmu.unidirectional = false;
> +	sw->tmu.rate = TB_SWITCH_TMU_RATE_OFF;
> +
> +	tb_sw_dbg(sw, "TMU: disabled\n");
> +	return 0;
> +}
> +
> +/**
> + * tb_switch_tmu_enable() - Enable TMU on a switch
> + * @sw: Switch whose TMU to enable
> + *
> + * Enables TMU of a switch to be in bi-directional, HiFi mode. In this mode
> + * all tunneling should work.
> + */
> +int tb_switch_tmu_enable(struct tb_switch *sw)
> +{
> +	int ret;
> +
> +	if (!tb_switch_is_usb4(sw))
> +		return 0;
> +
> +	if (tb_switch_tmu_is_enabled(sw))
> +		return 0;
> +
> +	ret = tb_switch_tmu_set_time_disruption(sw, true);
> +	if (ret)
> +		return ret;
> +
> +	/* Change mode to bi-directional */
> +	if (tb_route(sw) && sw->tmu.unidirectional) {
> +		struct tb_switch *parent = tb_switch_parent(sw);
> +		struct tb_port *up, *down;
> +
> +		up = tb_upstream_port(sw);
> +		down = tb_port_at(tb_route(sw), parent);
> +
> +		ret = tb_port_tmu_unidirectional_disable(down);
> +		if (ret)
> +			return ret;
> +
> +		ret = tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_HIFI);
> +		if (ret)
> +			return ret;
> +
> +		ret = tb_port_tmu_unidirectional_disable(up);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_HIFI);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	sw->tmu.unidirectional = false;
> +	sw->tmu.rate = TB_SWITCH_TMU_RATE_HIFI;
> +	tb_sw_dbg(sw, "TMU: mode set to: %s\n", tb_switch_tmu_mode_name(sw));
> +
> +	return tb_switch_tmu_set_time_disruption(sw, false);
> +}
> -- 
> 2.24.0
> 

Kind regards,
Nicholas
