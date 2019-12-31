Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D25512D703
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2019 09:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfLaIPO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Dec 2019 03:15:14 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41400 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfLaIPO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Dec 2019 03:15:14 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBV8F4jU033448;
        Tue, 31 Dec 2019 02:15:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577780104;
        bh=JACKsJ0ir8dpXJ3NdT4HPdUU6px5Fg7M6npXsSkfiIM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JG2xc+aAEV/CdTBZ9zO1PwZAYVSULaVMyDdgJUATnTk10SbmgByQiSisOD2ynQxfL
         XuqtsG71osFbAAaH6KrMwl7uAD42C9Z0lkzsAP1Xit+ua4dtgiWZkdOo/NdQWjHNL2
         OOWogeL6hfCf8e5HL6bPD58PZVeo27jZ+XlyhWLw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBV8F4uI081777
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 31 Dec 2019 02:15:04 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 31
 Dec 2019 02:15:03 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 31 Dec 2019 02:15:03 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBV8F1K1073432;
        Tue, 31 Dec 2019 02:15:02 -0600
Subject: Re: [PATCH 1/1] phy: freescale: imx8qm-usb3: add imx8qm USB3 PHY
To:     Peter Chen <peter.chen@nxp.com>,
        Anil Joy Varughese <aniljoy@cadence.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
References: <1577426546-31423-1-git-send-email-peter.chen@nxp.com>
 <8bf4c685-f2e7-f500-bd5e-0421f3dd2903@ti.com>
 <20191231011400.GA22207@b29397-desktop>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <50fd4013-c030-e7ec-5cab-ffaf85a01c29@ti.com>
Date:   Tue, 31 Dec 2019 13:47:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20191231011400.GA22207@b29397-desktop>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Anil

Hi Peter,

On 31/12/19 6:44 AM, Peter Chen wrote:
> On 19-12-30 17:39:48, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On 27/12/19 11:32 AM, Peter Chen wrote:
>>> This USB3 PHY is used to support USB3 controller at imx8qm and imx8qxp
>>> SoCs.
>>>
>>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
>>> ---
>>>  drivers/phy/freescale/Kconfig               |   8 +
>>>  drivers/phy/freescale/Makefile              |   1 +
>>>  drivers/phy/freescale/phy-fsl-imx8qm-usb3.c | 254 ++++++++++++++++++++
>>>  3 files changed, 263 insertions(+)
>>>  create mode 100644 drivers/phy/freescale/phy-fsl-imx8qm-usb3.c
>>>
>>> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
>>> index 320630ffe3cd..4282f07784f8 100644
>>> --- a/drivers/phy/freescale/Kconfig
>>> +++ b/drivers/phy/freescale/Kconfig
>>> @@ -14,3 +14,11 @@ config PHY_MIXEL_MIPI_DPHY
>>>  	help
>>>  	  Enable this to add support for the Mixel DSI PHY as found
>>>  	  on NXP's i.MX8 family of SOCs.
>>> +
>>> +config PHY_FSL_IMX8QM_USB
>>> +	tristate "Freescale i.MX8QM USB3 PHY"
>>> +	depends on OF && ARCH_MXC
>>> +	select GENERIC_PHY
>>> +	help
>>> +	  Enable this to add support for the USB3 PHY as found
>>> +	  on NXP's i.MX8QM family of SOCs.
>>> diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
>>> index 1d02e3869b45..dcab710fb90d 100644
>>> --- a/drivers/phy/freescale/Makefile
>>> +++ b/drivers/phy/freescale/Makefile
>>> @@ -1,3 +1,4 @@
>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>  obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)	+= phy-fsl-imx8mq-usb.o
>>>  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
>>> +obj-$(CONFIG_PHY_FSL_IMX8QM_USB)	+= phy-fsl-imx8qm-usb3.o
>>> diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-usb3.c b/drivers/phy/freescale/phy-fsl-imx8qm-usb3.c
>>> new file mode 100644
>>> index 000000000000..19ab6aa3271b
>>> --- /dev/null
>>> +++ b/drivers/phy/freescale/phy-fsl-imx8qm-usb3.c
>>> @@ -0,0 +1,254 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/* Copyright (c) 2019 NXP. */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/io.h>
>>> +#include <linux/module.h>
>>> +#include <linux/phy/phy.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/delay.h>
>>> +
>>> +/* PHY register definition */
>>> +#define PHY_PMA_CMN_CTRL1			(0xC800 * 4)
>>
>> Please use regmap for this.
> 
> Hi Kishon,
> 
> Thanks for reviewing. These registers are dedicated for USB PHY,
> so it doesn't need to use regmap.

The "* 4" in the reg offset indicates there's some sort of encoding to
actually access the registers. The "* 4" can be specific to Freescale
platform. A different platform using the same IP can have a different
encoding. We've already faced this in both Sierra and Torrent and are
moving to regmap.

https://lkml.org/lkml/2019/11/28/199
https://lkml.org/lkml/2019/12/23/389

Please follow a similar format for this driver too. This driver should
also be moved to Cadence directory.
> 
>>> +#define TB_ADDR_CMN_DIAG_HSCLK_SEL		(0x01e0 * 4)
>>> +#define TB_ADDR_CMN_PLL0_VCOCAL_INIT_TMR	(0x0084 * 4)
>>> +#define TB_ADDR_CMN_PLL0_VCOCAL_ITER_TMR	(0x0085 * 4)
>>> +#define TB_ADDR_CMN_PLL0_INTDIV	                (0x0094 * 4)
>>> +#define TB_ADDR_CMN_PLL0_FRACDIV		(0x0095 * 4)
>>> +#define TB_ADDR_CMN_PLL0_HIGH_THR		(0x0096 * 4)
>>> +#define TB_ADDR_CMN_PLL0_SS_CTRL1		(0x0098 * 4)
>>> +#define TB_ADDR_CMN_PLL0_SS_CTRL2		(0x0099 * 4)
>>> +#define TB_ADDR_CMN_PLL0_DSM_DIAG		(0x0097 * 4)
>>> +#define TB_ADDR_CMN_DIAG_PLL0_OVRD		(0x01c2 * 4)
>>> +#define TB_ADDR_CMN_DIAG_PLL0_FBH_OVRD		(0x01c0 * 4)
>>> +#define TB_ADDR_CMN_DIAG_PLL0_FBL_OVRD		(0x01c1 * 4)
>>> +#define TB_ADDR_CMN_DIAG_PLL0_V2I_TUNE          (0x01C5 * 4)
>>> +#define TB_ADDR_CMN_DIAG_PLL0_CP_TUNE           (0x01C6 * 4)
>>> +#define TB_ADDR_CMN_DIAG_PLL0_LF_PROG           (0x01C7 * 4)
>>> +#define TB_ADDR_CMN_DIAG_PLL0_TEST_MODE		(0x01c4 * 4)
>>> +#define TB_ADDR_CMN_PSM_CLK_CTRL		(0x0061 * 4)
>>> +#define TB_ADDR_XCVR_DIAG_RX_LANE_CAL_RST_TMR	(0x40ea * 4)
>>> +#define TB_ADDR_XCVR_PSM_RCTRL	                (0x4001 * 4)
>>> +#define TB_ADDR_TX_PSC_A0		        (0x4100 * 4)
>>> +#define TB_ADDR_TX_PSC_A1		        (0x4101 * 4)
>>> +#define TB_ADDR_TX_PSC_A2		        (0x4102 * 4)
>>> +#define TB_ADDR_TX_PSC_A3		        (0x4103 * 4)
>>> +#define TB_ADDR_TX_DIAG_ECTRL_OVRD		(0x41f5 * 4)
>>> +#define TB_ADDR_TX_PSC_CAL		        (0x4106 * 4)
>>> +#define TB_ADDR_TX_PSC_RDY		        (0x4107 * 4)
>>> +#define TB_ADDR_RX_PSC_A0	                (0x8000 * 4)
>>> +#define TB_ADDR_RX_PSC_A1	                (0x8001 * 4)
>>> +#define TB_ADDR_RX_PSC_A2	                (0x8002 * 4)
>>> +#define TB_ADDR_RX_PSC_A3	                (0x8003 * 4)
>>> +#define TB_ADDR_RX_PSC_CAL	                (0x8006 * 4)
>>> +#define TB_ADDR_RX_PSC_RDY	                (0x8007 * 4)
>>> +#define TB_ADDR_TX_TXCC_MGNLS_MULT_000		(0x4058 * 4)
>>> +#define TB_ADDR_TX_DIAG_BGREF_PREDRV_DELAY	(0x41e7 * 4)
>>> +#define TB_ADDR_RX_SLC_CU_ITER_TMR		(0x80e3 * 4)
>>> +#define TB_ADDR_RX_SIGDET_HL_FILT_TMR		(0x8090 * 4)
>>> +#define TB_ADDR_RX_SAMP_DAC_CTRL		(0x8058 * 4)
>>> +#define TB_ADDR_RX_DIAG_SIGDET_TUNE		(0x81dc * 4)
>>> +#define TB_ADDR_RX_DIAG_LFPSDET_TUNE2		(0x81df * 4)
>>> +#define TB_ADDR_RX_DIAG_BS_TM	                (0x81f5 * 4)
>>> +#define TB_ADDR_RX_DIAG_DFE_CTRL1		(0x81d3 * 4)
>>> +#define TB_ADDR_RX_DIAG_ILL_IQE_TRIM4		(0x81c7 * 4)
>>> +#define TB_ADDR_RX_DIAG_ILL_E_TRIM0		(0x81c2 * 4)
>>> +#define TB_ADDR_RX_DIAG_ILL_IQ_TRIM0		(0x81c1 * 4)
>>> +#define TB_ADDR_RX_DIAG_ILL_IQE_TRIM6		(0x81c9 * 4)
>>> +#define TB_ADDR_RX_DIAG_RXFE_TM3		(0x81f8 * 4)
>>> +#define TB_ADDR_RX_DIAG_RXFE_TM4		(0x81f9 * 4)
>>> +#define TB_ADDR_RX_DIAG_LFPSDET_TUNE		(0x81dd * 4)
>>> +#define TB_ADDR_RX_DIAG_DFE_CTRL3		(0x81d5 * 4)
>>> +#define TB_ADDR_RX_DIAG_SC2C_DELAY		(0x81e1 * 4)
>>> +#define TB_ADDR_RX_REE_VGA_GAIN_NODFE		(0x81bf * 4)
>>> +#define TB_ADDR_XCVR_PSM_CAL_TMR		(0x4002 * 4)
>>> +#define TB_ADDR_XCVR_PSM_A0BYP_TMR		(0x4004 * 4)
>>> +#define TB_ADDR_XCVR_PSM_A0IN_TMR		(0x4003 * 4)
>>> +#define TB_ADDR_XCVR_PSM_A1IN_TMR		(0x4005 * 4)
>>> +#define TB_ADDR_XCVR_PSM_A2IN_TMR		(0x4006 * 4)
>>> +#define TB_ADDR_XCVR_PSM_A3IN_TMR		(0x4007 * 4)
>>> +#define TB_ADDR_XCVR_PSM_A4IN_TMR		(0x4008 * 4)
>>> +#define TB_ADDR_XCVR_PSM_A5IN_TMR		(0x4009 * 4)
>>> +#define TB_ADDR_XCVR_PSM_A0OUT_TMR		(0x400a * 4)
>>> +#define TB_ADDR_XCVR_PSM_A1OUT_TMR		(0x400b * 4)
>>> +#define TB_ADDR_XCVR_PSM_A2OUT_TMR		(0x400c * 4)
>>> +#define TB_ADDR_XCVR_PSM_A3OUT_TMR		(0x400d * 4)
>>> +#define TB_ADDR_XCVR_PSM_A4OUT_TMR		(0x400e * 4)
>>> +#define TB_ADDR_XCVR_PSM_A5OUT_TMR		(0x400f * 4)
>>> +#define TB_ADDR_TX_RCVDET_EN_TMR	        (0x4122 * 4)
>>> +#define TB_ADDR_TX_RCVDET_ST_TMR	        (0x4123 * 4)
>>> +#define TB_ADDR_XCVR_DIAG_LANE_FCM_EN_MGN_TMR	(0x40f2 * 4)
>>> +#define TB_ADDR_TX_RCVDETSC_CTRL	        (0x4124 * 4)
>>> +
>>> +/* TB_ADDR_TX_RCVDETSC_CTRL */
>>> +#define RXDET_IN_P3_32KHZ			(1 << 0)
>>> +
>>> +struct imx8qm_usb_phy {
>>> +	struct phy *phy;
>>> +	struct clk *clk;
>>> +	void __iomem *base;
>>> +};
>>> +
>>> +static int imx8qm_phy_power_on(struct phy *phy)
>>> +{
>>> +	struct imx8qm_usb_phy *imx_phy = phy_get_drvdata(phy);
>>> +	int ret;
>>> +	u32 value;
>>> +	void __iomem *regs = imx_phy->base;
>>> +
>>> +	ret = clk_prepare_enable(imx_phy->clk);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Below bringup sequence is from PHY's User Guide */
>>> +	writel(0x0830, regs + PHY_PMA_CMN_CTRL1);
>>
>> I'm not sure what these registers represent. But if they are programming
>> clocks (multiplier, divider etc..), it must be modeled as clocks.
>>
> 
> In fact, there is no detail explanation for this Cadence PHY. We only
> write the value the user guide suggested.
> 
>> We could also keep all these calibration values in a table similar to
>> what is done in phy/cadence/phy-cadence-sierra.c. That will help to
>> seamlessly add other modes (if supported by PHY).
>>
> 
> From this PHY spec, this PHY is only for USB. See below:
> 
> Features
> • Supported standards: USB 3.1 (SuperSpeed only), USB2 (optional)
> • Consists of one USB3 SS lane and (optional) USB2 lane
> • Contains a USB3 SS PIPE-based PCS
> • PHY-level logic delivered as ‘soft’ RTL
> • PMA delivered as ‘hard’ macros
> • Selectable 16- or 32-bit PIPE interface for USB3
> • PIPE interface is compliant to PIPE revision 4.0
> • Optional UTMI interface for USB2 PHY

What are the input clocks  or clock frequencies it supports?

Thanks
Kishon
