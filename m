Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689D1277099
	for <lists+linux-usb@lfdr.de>; Thu, 24 Sep 2020 14:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbgIXMIf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 08:08:35 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:50174 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727480AbgIXMIe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 08:08:34 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08OC7osA000419;
        Thu, 24 Sep 2020 14:08:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=VpjJwHTUO3+orFoKEzf+VvCRmjD6z4z3/JIoCta26GI=;
 b=Gpp4LgbRZm6nD5XvdSShh7aQdsLsK+VBkzx/Je24dNYmyLaB1IvGmTdvbWM6/YggSpmK
 sfvhg7Tnq/GVEilRRA3ktsPbrJg/fG0mF8g87L+xx01CF4TF2fCpHXJ9zxtCXgat+0LA
 ulhdn8oU6jsHfsCzl3bRUipym/VOTyJ4W7TDqTLq1ClHJFzR/2End5TzPGs+Kp9NkSoA
 WAFEkB8wkqKm23z9Y2DvqvGrCerC9ND4k4MtoXXWhNhfKnCXi4ZuMlwC5x/TjC6A+FR2
 oN9uKpQRfJFfEzFb+vQkUeJT+aug5ooS671fGn+lt1Yp80piqc2dKNwK/pHFcfpYJIta fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33n8vf5f59-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Sep 2020 14:08:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44EB010002A;
        Thu, 24 Sep 2020 14:08:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2320C2AD2AB;
        Thu, 24 Sep 2020 14:08:10 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Sep
 2020 14:08:08 +0200
Subject: Re: [PATCH v6 2/3] usb: dwc2: override PHY input signals with usb
 role switch support
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Fabrice GASNIER <fabrice.gasnier@st.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20200909093511.4728-1-amelie.delaunay@st.com>
 <20200909093511.4728-3-amelie.delaunay@st.com>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <b533c13d-55dc-8601-12c9-4e7b876292d4@st.com>
Date:   Thu, 24 Sep 2020 14:08:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909093511.4728-3-amelie.delaunay@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-24_08:2020-09-24,2020-09-24 signatures=0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Gentle reminder.

Thanks,
Amelie

On 9/9/20 11:35 AM, Amelie DELAUNAY wrote:
> This patch adds support for usb role switch to dwc2, by using overriding
> control of the PHY voltage valid and ID input signals.
> 
> iddig signal (ID) can be overridden:
> - when setting GUSBCFG_FORCEHOSTMODE, iddig input pin is overridden with 1;
> - when setting GUSBCFG_FORCEDEVMODE, iddig input pin is overridden with 0.
> 
> avalid/bvalid/vbusvalid signals can be overridden respectively with:
> - GOTGCTL_AVALOEN + GOTGCTL_AVALOVAL
> - GOTGCTL_BVALOEN + GOTGCTL_BVALOVAL
> - GOTGCTL_VBVALEN + GOTGCTL_VBVALOVAL
> 
> It is possible to determine valid sessions thanks to usb role switch:
> - if USB_ROLE_NONE then !avalid && !bvalid && !vbusvalid
> - if USB_ROLE_DEVICE then !avalid && bvalid && vbusvalid
> - if USB_ROLE_HOST then avalid && !bvalid && vbusvalid
> 
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
> Changes in v5:
> - Select USB_ROLE_SWITCH if USB_DWC2, and not only if USB_DWC2_DUAL_ROLE:
>    drd.c is built whatever DWC2 mode (DUAL, HOST, PERIPHERAL) as it is used also
>    to detect attach/detach (so a-valid/b-valid sessions).
> No changes in v5.
> Changes in v4:
> - Simplify call to dwc2_force_mode in drd.c
> - Add error_drd label in probe error path in platform.c
> Changes in v3:
> - Fix build issue reported by kernel test robot in drd.c
> Changes in v2:
> - Fix build issue reported by kernel test robot
> - Move call to dwc2_force_mode outside spinlock context
> - Add dwc2_drd_exit call in probe error path
> ---
>   drivers/usb/dwc2/Kconfig    |   1 +
>   drivers/usb/dwc2/Makefile   |   2 +-
>   drivers/usb/dwc2/core.h     |   9 ++
>   drivers/usb/dwc2/drd.c      | 180 ++++++++++++++++++++++++++++++++++++
>   drivers/usb/dwc2/gadget.c   |   2 +-
>   drivers/usb/dwc2/platform.c |  20 +++-
>   6 files changed, 210 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/usb/dwc2/drd.c
> 
> diff --git a/drivers/usb/dwc2/Kconfig b/drivers/usb/dwc2/Kconfig
> index 16e1aa304edc..c131719367ec 100644
> --- a/drivers/usb/dwc2/Kconfig
> +++ b/drivers/usb/dwc2/Kconfig
> @@ -5,6 +5,7 @@ config USB_DWC2
>   	depends on HAS_DMA
>   	depends on USB || USB_GADGET
>   	depends on HAS_IOMEM
> +	select USB_ROLE_SWITCH
>   	help
>   	  Say Y here if your system has a Dual Role Hi-Speed USB
>   	  controller based on the DesignWare HSOTG IP Core.
> diff --git a/drivers/usb/dwc2/Makefile b/drivers/usb/dwc2/Makefile
> index 440320cc20a4..2bcd6945df46 100644
> --- a/drivers/usb/dwc2/Makefile
> +++ b/drivers/usb/dwc2/Makefile
> @@ -3,7 +3,7 @@ ccflags-$(CONFIG_USB_DWC2_DEBUG)	+= -DDEBUG
>   ccflags-$(CONFIG_USB_DWC2_VERBOSE)	+= -DVERBOSE_DEBUG
>   
>   obj-$(CONFIG_USB_DWC2)			+= dwc2.o
> -dwc2-y					:= core.o core_intr.o platform.o
> +dwc2-y					:= core.o core_intr.o platform.o drd.o
>   dwc2-y					+= params.o
>   
>   ifneq ($(filter y,$(CONFIG_USB_DWC2_HOST) $(CONFIG_USB_DWC2_DUAL_ROLE)),)
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 9deff0400a92..7161344c6522 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -860,6 +860,7 @@ struct dwc2_hregs_backup {
>    *                      - USB_DR_MODE_PERIPHERAL
>    *                      - USB_DR_MODE_HOST
>    *                      - USB_DR_MODE_OTG
> + * @role_sw:		usb_role_switch handle
>    * @hcd_enabled:	Host mode sub-driver initialization indicator.
>    * @gadget_enabled:	Peripheral mode sub-driver initialization indicator.
>    * @ll_hw_enabled:	Status of low-level hardware resources.
> @@ -1054,6 +1055,7 @@ struct dwc2_hsotg {
>   	struct dwc2_core_params params;
>   	enum usb_otg_state op_state;
>   	enum usb_dr_mode dr_mode;
> +	struct usb_role_switch *role_sw;
>   	unsigned int hcd_enabled:1;
>   	unsigned int gadget_enabled:1;
>   	unsigned int ll_hw_enabled:1;
> @@ -1376,6 +1378,11 @@ static inline int dwc2_is_device_mode(struct dwc2_hsotg *hsotg)
>   	return (dwc2_readl(hsotg, GINTSTS) & GINTSTS_CURMODE_HOST) == 0;
>   }
>   
> +int dwc2_drd_init(struct dwc2_hsotg *hsotg);
> +void dwc2_drd_suspend(struct dwc2_hsotg *hsotg);
> +void dwc2_drd_resume(struct dwc2_hsotg *hsotg);
> +void dwc2_drd_exit(struct dwc2_hsotg *hsotg);
> +
>   /*
>    * Dump core registers and SPRAM
>    */
> @@ -1392,6 +1399,7 @@ int dwc2_hsotg_resume(struct dwc2_hsotg *dwc2);
>   int dwc2_gadget_init(struct dwc2_hsotg *hsotg);
>   void dwc2_hsotg_core_init_disconnected(struct dwc2_hsotg *dwc2,
>   				       bool reset);
> +void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg);
>   void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg);
>   void dwc2_hsotg_disconnect(struct dwc2_hsotg *dwc2);
>   int dwc2_hsotg_set_test_mode(struct dwc2_hsotg *hsotg, int testmode);
> @@ -1417,6 +1425,7 @@ static inline int dwc2_gadget_init(struct dwc2_hsotg *hsotg)
>   { return 0; }
>   static inline void dwc2_hsotg_core_init_disconnected(struct dwc2_hsotg *dwc2,
>   						     bool reset) {}
> +static inline void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg) {}
>   static inline void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg) {}
>   static inline void dwc2_hsotg_disconnect(struct dwc2_hsotg *dwc2) {}
>   static inline int dwc2_hsotg_set_test_mode(struct dwc2_hsotg *hsotg,
> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> new file mode 100644
> index 000000000000..2d4176f5788e
> --- /dev/null
> +++ b/drivers/usb/dwc2/drd.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * drd.c - DesignWare USB2 DRD Controller Dual-role support
> + *
> + * Copyright (C) 2020 STMicroelectronics
> + *
> + * Author(s): Amelie Delaunay <amelie.delaunay@st.com>
> + */
> +
> +#include <linux/iopoll.h>
> +#include <linux/platform_device.h>
> +#include <linux/usb/role.h>
> +#include "core.h"
> +
> +static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
> +{
> +	unsigned long flags;
> +	u32 gotgctl;
> +
> +	spin_lock_irqsave(&hsotg->lock, flags);
> +
> +	gotgctl = dwc2_readl(hsotg, GOTGCTL);
> +	gotgctl |= GOTGCTL_BVALOEN | GOTGCTL_AVALOEN | GOTGCTL_VBVALOEN;
> +	gotgctl |= GOTGCTL_DBNCE_FLTR_BYPASS;
> +	gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
> +	dwc2_writel(hsotg, gotgctl, GOTGCTL);
> +
> +	dwc2_force_mode(hsotg, false);
> +
> +	spin_unlock_irqrestore(&hsotg->lock, flags);
> +}
> +
> +static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, bool valid)
> +{
> +	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
> +
> +	/* Check if A-Session is already in the right state */
> +	if ((valid && (gotgctl & GOTGCTL_ASESVLD)) ||
> +	    (!valid && !(gotgctl & GOTGCTL_ASESVLD)))
> +		return -EALREADY;
> +
> +	if (valid)
> +		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
> +	else
> +		gotgctl &= ~(GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
> +	dwc2_writel(hsotg, gotgctl, GOTGCTL);
> +
> +	return 0;
> +}
> +
> +static int dwc2_ovr_bvalid(struct dwc2_hsotg *hsotg, bool valid)
> +{
> +	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
> +
> +	/* Check if B-Session is already in the right state */
> +	if ((valid && (gotgctl & GOTGCTL_BSESVLD)) ||
> +	    (!valid && !(gotgctl & GOTGCTL_BSESVLD)))
> +		return -EALREADY;
> +
> +	if (valid)
> +		gotgctl |= GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL;
> +	else
> +		gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL);
> +	dwc2_writel(hsotg, gotgctl, GOTGCTL);
> +
> +	return 0;
> +}
> +
> +static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
> +{
> +	struct dwc2_hsotg *hsotg = usb_role_switch_get_drvdata(sw);
> +	unsigned long flags;
> +	int already = 0;
> +
> +	/* Skip session not in line with dr_mode */
> +	if ((role == USB_ROLE_DEVICE && hsotg->dr_mode == USB_DR_MODE_HOST) ||
> +	    (role == USB_ROLE_HOST && hsotg->dr_mode == USB_DR_MODE_PERIPHERAL))
> +		return -EINVAL;
> +
> +#if IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) || \
> +	IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)
> +	/* Skip session if core is in test mode */
> +	if (role == USB_ROLE_NONE && hsotg->test_mode) {
> +		dev_dbg(hsotg->dev, "Core is in test mode\n");
> +		return -EBUSY;
> +	}
> +#endif
> +
> +	spin_lock_irqsave(&hsotg->lock, flags);
> +
> +	if (role == USB_ROLE_HOST) {
> +		already = dwc2_ovr_avalid(hsotg, true);
> +	} else if (role == USB_ROLE_DEVICE) {
> +		already = dwc2_ovr_bvalid(hsotg, true);
> +		/* This clear DCTL.SFTDISCON bit */
> +		dwc2_hsotg_core_connect(hsotg);
> +	} else {
> +		if (dwc2_is_device_mode(hsotg)) {
> +			if (!dwc2_ovr_bvalid(hsotg, false))
> +				/* This set DCTL.SFTDISCON bit */
> +				dwc2_hsotg_core_disconnect(hsotg);
> +		} else {
> +			dwc2_ovr_avalid(hsotg, false);
> +		}
> +	}
> +
> +	spin_unlock_irqrestore(&hsotg->lock, flags);
> +
> +	if (!already && hsotg->dr_mode == USB_DR_MODE_OTG)
> +		/* This will raise a Connector ID Status Change Interrupt */
> +		dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
> +
> +	dev_dbg(hsotg->dev, "%s-session valid\n",
> +		role == USB_ROLE_NONE ? "No" :
> +		role == USB_ROLE_HOST ? "A" : "B");
> +
> +	return 0;
> +}
> +
> +int dwc2_drd_init(struct dwc2_hsotg *hsotg)
> +{
> +	struct usb_role_switch_desc role_sw_desc = {0};
> +	struct usb_role_switch *role_sw;
> +	int ret;
> +
> +	if (!device_property_read_bool(hsotg->dev, "usb-role-switch"))
> +		return 0;
> +
> +	role_sw_desc.driver_data = hsotg;
> +	role_sw_desc.fwnode = dev_fwnode(hsotg->dev);
> +	role_sw_desc.set = dwc2_drd_role_sw_set;
> +	role_sw_desc.allow_userspace_control = true;
> +
> +	role_sw = usb_role_switch_register(hsotg->dev, &role_sw_desc);
> +	if (IS_ERR(role_sw)) {
> +		ret = PTR_ERR(role_sw);
> +		dev_err(hsotg->dev,
> +			"failed to register role switch: %d\n", ret);
> +		return ret;
> +	}
> +
> +	hsotg->role_sw = role_sw;
> +
> +	/* Enable override and initialize values */
> +	dwc2_ovr_init(hsotg);
> +
> +	return 0;
> +}
> +
> +void dwc2_drd_suspend(struct dwc2_hsotg *hsotg)
> +{
> +	u32 gintsts, gintmsk;
> +
> +	if (hsotg->role_sw && !hsotg->params.external_id_pin_ctl) {
> +		gintmsk = dwc2_readl(hsotg, GINTMSK);
> +		gintmsk &= ~GINTSTS_CONIDSTSCHNG;
> +		dwc2_writel(hsotg, gintmsk, GINTMSK);
> +		gintsts = dwc2_readl(hsotg, GINTSTS);
> +		dwc2_writel(hsotg, gintsts | GINTSTS_CONIDSTSCHNG, GINTSTS);
> +	}
> +}
> +
> +void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
> +{
> +	u32 gintsts, gintmsk;
> +
> +	if (hsotg->role_sw && !hsotg->params.external_id_pin_ctl) {
> +		gintsts = dwc2_readl(hsotg, GINTSTS);
> +		dwc2_writel(hsotg, gintsts | GINTSTS_CONIDSTSCHNG, GINTSTS);
> +		gintmsk = dwc2_readl(hsotg, GINTMSK);
> +		gintmsk |= GINTSTS_CONIDSTSCHNG;
> +		dwc2_writel(hsotg, gintmsk, GINTMSK);
> +	}
> +}
> +
> +void dwc2_drd_exit(struct dwc2_hsotg *hsotg)
> +{
> +	if (hsotg->role_sw)
> +		usb_role_switch_unregister(hsotg->role_sw);
> +}
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 5b9d23991c99..16c5f976f141 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -3530,7 +3530,7 @@ void dwc2_hsotg_core_init_disconnected(struct dwc2_hsotg *hsotg,
>   		dwc2_readl(hsotg, DOEPCTL0));
>   }
>   
> -static void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg)
> +void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg)
>   {
>   	/* set the soft-disconnect bit */
>   	dwc2_set_bit(hsotg, DCTL, DCTL_SFTDISCON);
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index b28e90e0b685..238004050557 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -314,6 +314,8 @@ static int dwc2_driver_remove(struct platform_device *dev)
>   	if (hsotg->gadget_enabled)
>   		dwc2_hsotg_remove(hsotg);
>   
> +	dwc2_drd_exit(hsotg);
> +
>   	if (hsotg->params.activate_stm_id_vb_detection)
>   		regulator_disable(hsotg->usb33d);
>   
> @@ -533,10 +535,17 @@ static int dwc2_driver_probe(struct platform_device *dev)
>   		dwc2_writel(hsotg, ggpio, GGPIO);
>   	}
>   
> +	retval = dwc2_drd_init(hsotg);
> +	if (retval) {
> +		if (retval != -EPROBE_DEFER)
> +			dev_err(hsotg->dev, "failed to initialize dual-role\n");
> +		goto error_init;
> +	}
> +
>   	if (hsotg->dr_mode != USB_DR_MODE_HOST) {
>   		retval = dwc2_gadget_init(hsotg);
>   		if (retval)
> -			goto error_init;
> +			goto error_drd;
>   		hsotg->gadget_enabled = 1;
>   	}
>   
> @@ -562,7 +571,7 @@ static int dwc2_driver_probe(struct platform_device *dev)
>   		if (retval) {
>   			if (hsotg->gadget_enabled)
>   				dwc2_hsotg_remove(hsotg);
> -			goto error_init;
> +			goto error_drd;
>   		}
>   		hsotg->hcd_enabled = 1;
>   	}
> @@ -594,6 +603,9 @@ static int dwc2_driver_probe(struct platform_device *dev)
>   	dwc2_debugfs_exit(hsotg);
>   	if (hsotg->hcd_enabled)
>   		dwc2_hcd_remove(hsotg);
> +error_drd:
> +	dwc2_drd_exit(hsotg);
> +
>   error_init:
>   	if (hsotg->params.activate_stm_id_vb_detection)
>   		regulator_disable(hsotg->usb33d);
> @@ -612,6 +624,8 @@ static int __maybe_unused dwc2_suspend(struct device *dev)
>   	if (is_device_mode)
>   		dwc2_hsotg_suspend(dwc2);
>   
> +	dwc2_drd_suspend(dwc2);
> +
>   	if (dwc2->params.activate_stm_id_vb_detection) {
>   		unsigned long flags;
>   		u32 ggpio, gotgctl;
> @@ -692,6 +706,8 @@ static int __maybe_unused dwc2_resume(struct device *dev)
>   	/* Need to restore FORCEDEVMODE/FORCEHOSTMODE */
>   	dwc2_force_dr_mode(dwc2);
>   
> +	dwc2_drd_resume(dwc2);
> +
>   	if (dwc2_is_device_mode(dwc2))
>   		ret = dwc2_hsotg_resume(dwc2);
>   
> 
