Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E8C375571
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 16:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbhEFOPU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 10:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233737AbhEFOPT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 10:15:19 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3E4C061574
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 07:14:20 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n205so3487122wmf.1
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:subject:from
         :to:cc:references:in-reply-to;
        bh=7gGV9a1ueH32rfySwFg+PsZVB6JF8f0Zf/IRGWr7Zw4=;
        b=CKAdrZAxvsxz+MPulIIjur5Kpco9c2P+j6R50/VAnh7Q3OB+EuRSWYfkLjJqp/hqZg
         ZqkV+2ec2e3Tyw4QXEKEClRbYNPY3ZZv8OqAFtGMd4Kger8oMGcJVEPIaTgROqMC3Qpa
         DUzNBwu3ukP5IiPs/BopOHYNhBNAL2RKkQNyQkEd6CIVBSrjbf9ZYTtgPGYQ7Yg5/82T
         6eASQJA7WpwkIZp4MNK9mkGRbr+7C3A1MM2pWADolq7HhZb46gTmqlDLd7B8Makbiz3E
         rQKs1g4PzYIR5KMaubenb8XBrozg3e+z23WUl9BNUxPAnhtY9jqu0/gYH4ogvwNkq+1M
         f2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:subject:from:to:cc:references:in-reply-to;
        bh=7gGV9a1ueH32rfySwFg+PsZVB6JF8f0Zf/IRGWr7Zw4=;
        b=MO+yxeb/9vkXTr8Du7GIu7d3wqbywlkvam86EhyK7GY6AdY+ETF+EsgFwJFsWf72dP
         RfHslA1adv6MHTwmjbeHF6+zk8TS42Z3HoS2jMgTxRDj4jJT6WXOHtwkJ1udMBWi80iV
         cj1WRTi7KvFEWxhtuI2Kx4XS1Qw8y1NV6pS3P0ZR9Zx2UNFnoJdT3IFDyF1NEg5DJjC+
         U9aOzoZV26Y2xv5VLETW6dHobCgb2pC6KUMljEQ1pA05q3hVwXtgHCguemLO4AeF1YH5
         gGU3kwh4UhTtUBfFzN3mOXN1AQQwaB24yRZp35SmmPfZopfUN5OPbpnYzadx/KgKGOYC
         S6WQ==
X-Gm-Message-State: AOAM532J3xBiMeYloO/6wJh6VL217jh8TUrwIdwN3I75766n5cXNUXiR
        g5Sg+Uxs8AeTJI3UUquIxcR+rw==
X-Google-Smtp-Source: ABdhPJzdygZtRsc8ccbkRtPI/egmXd0P3rLAoKKYWXwS2rziBC7zL+nlipkbvB5ygE+RVSebKLdgFQ==
X-Received: by 2002:a1c:b342:: with SMTP id c63mr4298480wmf.162.1620310457610;
        Thu, 06 May 2021 07:14:17 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id n7sm4574725wri.14.2021.05.06.07.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 07:14:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 06 May 2021 15:14:15 +0100
Message-Id: <CB684BAWX4VZ.2C7CTYKX8TJ2P@arch-thunder>
Subject: Re: [PATCH 1/7] usb: isp1760: move to regmap for register access
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Sebastian Siewior" <bigeasy@linutronix.de>,
        "Rob Herring" <robh+dt@kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20210504101910.18619-1-rui.silva@linaro.org>
 <20210504101910.18619-2-rui.silva@linaro.org>
 <YJPgFaJEFqHfYQSj@pendragon.ideasonboard.com>
 <CB67DHRVT0FW.1JTB39XCX16VU@arch-thunder>
 <YJPzBQlsR+LUMW08@pendragon.ideasonboard.com>
In-Reply-To: <YJPzBQlsR+LUMW08@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Laurent,
On Thu May 6, 2021 at 2:45 PM WEST, Laurent Pinchart wrote:
> Hi Rui,
>
> On Thu, May 06, 2021 at 02:39:13PM +0100, Rui Miguel Silva wrote:
> > On Thu May 6, 2021 at 1:24 PM WEST, Laurent Pinchart wrote:
> > > On Tue, May 04, 2021 at 11:19:04AM +0100, Rui Miguel Silva wrote:
> > > > Rework access to registers and memory to use regmap framework.
> > > > No change in current feature or way of work is intended with this
> > > > change.
> > > >=20
> > > > This will allow to reuse this driver with other IP of this family,
> > > > for example isp1763, with little changes and effort.
> > > >=20
> > > > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > > ---
> > > >  drivers/usb/isp1760/isp1760-core.c | 123 +++++---
> > > >  drivers/usb/isp1760/isp1760-core.h |  38 ++-
> > > >  drivers/usb/isp1760/isp1760-hcd.c  | 436 ++++++++++++++-----------=
---
> > > >  drivers/usb/isp1760/isp1760-hcd.h  |  18 +-
> > > >  drivers/usb/isp1760/isp1760-if.c   |   4 +-
> > > >  drivers/usb/isp1760/isp1760-regs.h | 442 +++++++++++++++++--------=
----
> > > >  drivers/usb/isp1760/isp1760-udc.c  | 235 +++++++++------
> > > >  drivers/usb/isp1760/isp1760-udc.h  |  10 +-
> > > >  8 files changed, 779 insertions(+), 527 deletions(-)
> > > >=20
> > > > diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp17=
60/isp1760-core.c
> > > > index fdeb4cf97cc5..f78e637d3b9a 100644
> > > > --- a/drivers/usb/isp1760/isp1760-core.c
> > > > +++ b/drivers/usb/isp1760/isp1760-core.c
> > > > @@ -25,8 +25,8 @@
> > > > =20
> > > >  static void isp1760_init_core(struct isp1760_device *isp)
> > > >  {
> > > > -	u32 otgctrl;
> > > > -	u32 hwmode;
> > > > +	struct isp1760_hcd *hcd =3D &isp->hcd;
> > > > +	struct isp1760_udc *udc =3D &isp->udc;
> > > > =20
> > > >  	/* Low-level chip reset */
> > > >  	if (isp->rst_gpio) {
> > > > @@ -39,24 +39,22 @@ static void isp1760_init_core(struct isp1760_de=
vice *isp)
> > > >  	 * Reset the host controller, including the CPU interface
> > > >  	 * configuration.
> > > >  	 */
> > > > -	isp1760_write32(isp->regs, HC_RESET_REG, SW_RESET_RESET_ALL);
> > > > +	isp1760_field_set(hcd->fields, SW_RESET_RESET_ALL);
> > > >  	msleep(100);
> > > > =20
> > > >  	/* Setup HW Mode Control: This assumes a level active-low interru=
pt */
> > > > -	hwmode =3D HW_DATA_BUS_32BIT;
> > > > -
> > > >  	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_16)
> > > > -		hwmode &=3D ~HW_DATA_BUS_32BIT;
> > > > +		isp1760_field_clear(hcd->fields, HW_DATA_BUS_WIDTH);
> > > >  	if (isp->devflags & ISP1760_FLAG_ANALOG_OC)
> > > > -		hwmode |=3D HW_ANA_DIGI_OC;
> > > > +		isp1760_field_set(hcd->fields, HW_ANA_DIGI_OC);
> > > >  	if (isp->devflags & ISP1760_FLAG_DACK_POL_HIGH)
> > > > -		hwmode |=3D HW_DACK_POL_HIGH;
> > > > +		isp1760_field_set(hcd->fields, HW_DACK_POL_HIGH);
> > > >  	if (isp->devflags & ISP1760_FLAG_DREQ_POL_HIGH)
> > > > -		hwmode |=3D HW_DREQ_POL_HIGH;
> > > > +		isp1760_field_set(hcd->fields, HW_DREQ_POL_HIGH);
> > > >  	if (isp->devflags & ISP1760_FLAG_INTR_POL_HIGH)
> > > > -		hwmode |=3D HW_INTR_HIGH_ACT;
> > > > +		isp1760_field_set(hcd->fields, HW_INTR_HIGH_ACT);
> > > >  	if (isp->devflags & ISP1760_FLAG_INTR_EDGE_TRIG)
> > > > -		hwmode |=3D HW_INTR_EDGE_TRIG;
> > > > +		isp1760_field_set(hcd->fields, HW_INTR_EDGE_TRIG);
> > >
> > > This makes a difference, as you're now writing the register for every
> > > bit. It can have a performance impact (although that should be small,
> >=20
> > This is in initialization time, so I am not expecting this to have a
> > major performance impact.
>
> This comment applies to the rest of the driver too, not just this
> location. Sorry for not making that clear.

humm, I will change this one, but I can not really spot any other
sequence similar that is in an fast path in which the
read-modify-write would make impact, all access in ptd and mem
read/write are done with isp1760_reg_{read,write}.
Even in run time I did not found any issues.

------
Cheers,
     Rui

>
> > > but still), but also a functional impact. I'd rather keep a single wr=
ite
> > > for this kind of sequence, especially when no read-modify-write seque=
nce
> > > is needed. If you need read-modify-write for the platform you work on=
,
> > > switching to such patterns should be done in a patch of its own.
> >=20
> > For me that's ok, I do not have strong feelings about this. I can
> > change it for isp1760_reg_write at the end.
>
> Thanks.
>
> > > > =20
> > > >  	/*
> > > >  	 * The ISP1761 has a dedicated DC IRQ line but supports sharing t=
he HC
> > > > @@ -65,18 +63,10 @@ static void isp1760_init_core(struct isp1760_de=
vice *isp)
> > > >  	 * spurious interrupts during HCD registration.
> > > >  	 */
> > > >  	if (isp->devflags & ISP1760_FLAG_ISP1761) {
> > > > -		isp1760_write32(isp->regs, DC_MODE, 0);
> > > > -		hwmode |=3D HW_COMN_IRQ;
> > > > +		isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
> > > > +		isp1760_field_set(hcd->fields, HW_COMN_IRQ);
> > > >  	}
> > > > =20
> > > > -	/*
> > > > -	 * We have to set this first in case we're in 16-bit mode.
> > > > -	 * Write it twice to ensure correct upper bits if switching
> > > > -	 * to 16-bit mode.
> > > > -	 */
> > > > -	isp1760_write32(isp->regs, HC_HW_MODE_CTRL, hwmode);
> > > > -	isp1760_write32(isp->regs, HC_HW_MODE_CTRL, hwmode);
> > > > -
> > > >  	/*
> > > >  	 * PORT 1 Control register of the ISP1760 is the OTG control regi=
ster
> > > >  	 * on ISP1761.
> > > > @@ -85,14 +75,15 @@ static void isp1760_init_core(struct isp1760_de=
vice *isp)
> > > >  	 * when OTG is requested.
> > > >  	 */
> > > >  	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
> > > > -	    (isp->devflags & ISP1760_FLAG_OTG_EN))
> > > > -		otgctrl =3D ((HW_DM_PULLDOWN | HW_DP_PULLDOWN) << 16)
> > > > -			| HW_OTG_DISABLE;
> > > > -	else
> > > > -		otgctrl =3D (HW_SW_SEL_HC_DC << 16)
> > > > -			| (HW_VBUS_DRV | HW_SEL_CP_EXT);
> > > > -
> > > > -	isp1760_write32(isp->regs, HC_PORT1_CTRL, otgctrl);
> > > > +	    (isp->devflags & ISP1760_FLAG_OTG_EN)) {
> > > > +		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
> > > > +		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
> > > > +		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
> > > > +	} else {
> > > > +		isp1760_field_set(hcd->fields, HW_SW_SEL_HC_DC);
> > > > +		isp1760_field_set(hcd->fields, HW_VBUS_DRV);
> > > > +		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
> > > > +	}
> > > > =20
> > > >  	dev_info(isp->dev, "bus width: %u, oc: %s\n",
> > > >  		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_16 ? 16 : 32,
> > > > @@ -101,16 +92,43 @@ static void isp1760_init_core(struct isp1760_d=
evice *isp)
> > > > =20
> > > >  void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
> > > >  {
> > > > -	isp1760_write32(isp->regs, HW_OTG_CTRL_SET,
> > > > -			enable ? HW_DP_PULLUP : HW_DP_PULLUP << 16);
> > > > +	struct isp1760_udc *udc =3D &isp->udc;
> > > > +
> > > > +	if (enable)
> > > > +		isp1760_field_set(udc->fields, HW_DP_PULLUP);
> > > > +	else
> > > > +		isp1760_field_set(udc->fields, HW_DP_PULLUP_CLEAR);
> > > >  }
> > > > =20
> > > > +static struct regmap_config isp1760_hc_regmap_conf =3D {
> > > > +	.name =3D "isp1760-hc",
> > > > +	.reg_bits =3D 16,
> > > > +	.val_bits =3D 32,
> > > > +	.fast_io =3D true,
> > > > +	.max_register =3D ISP176x_HC_MEMORY,
> > > > +	.volatile_table =3D &isp176x_hc_volatile_table,
> > > > +};
> > > > +
> > > > +static struct regmap_config isp1761_dc_regmap_conf =3D {
> > > > +	.name =3D "isp1761-dc",
> > > > +	.reg_bits =3D 16,
> > > > +	.val_bits =3D 32,
> > > > +	.fast_io =3D true,
> > > > +	.max_register =3D ISP1761_DC_OTG_CTRL_CLEAR,
> > > > +	.volatile_table =3D &isp176x_dc_volatile_table,
> > > > +};
> > > > +
> > > >  int isp1760_register(struct resource *mem, int irq, unsigned long =
irqflags,
> > > >  		     struct device *dev, unsigned int devflags)
> > > >  {
> > > >  	struct isp1760_device *isp;
> > > > +	struct isp1760_hcd *hcd;
> > > > +	struct isp1760_udc *udc;
> > > >  	bool udc_disabled =3D !(devflags & ISP1760_FLAG_ISP1761);
> > > > +	struct regmap_field *f;
> > > > +	void __iomem *base;
> > > >  	int ret;
> > > > +	int i;
> > > > =20
> > > >  	/*
> > > >  	 * If neither the HCD not the UDC is enabled return an error, as =
no
> > > > @@ -126,19 +144,52 @@ int isp1760_register(struct resource *mem, in=
t irq, unsigned long irqflags,
> > > > =20
> > > >  	isp->dev =3D dev;
> > > >  	isp->devflags =3D devflags;
> > > > +	hcd =3D &isp->hcd;
> > > > +	udc =3D &isp->udc;
> > > > +
> > > > +	if (devflags & ISP1760_FLAG_BUS_WIDTH_16) {
> > > > +		isp1760_hc_regmap_conf.val_bits =3D 16;
> > > > +		isp1761_dc_regmap_conf.val_bits =3D 16;
> > > > +	}
> > > > =20
> > > >  	isp->rst_gpio =3D devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HI=
GH);
> > > >  	if (IS_ERR(isp->rst_gpio))
> > > >  		return PTR_ERR(isp->rst_gpio);
> > > > =20
> > > > -	isp->regs =3D devm_ioremap_resource(dev, mem);
> > > > -	if (IS_ERR(isp->regs))
> > > > -		return PTR_ERR(isp->regs);
> > > > +	hcd->base =3D devm_ioremap_resource(dev, mem);
> > > > +	if (IS_ERR(hcd->base))
> > > > +		return PTR_ERR(hcd->base);
> > > > +
> > > > +	hcd->regs =3D devm_regmap_init_mmio(dev, base, &isp1760_hc_regmap=
_conf);
> > > > +	if (IS_ERR(hcd->regs))
> > > > +		return PTR_ERR(hcd->regs);
> > > > +
> > > > +	for (i =3D 0; i < HC_FIELD_MAX; i++) {
> > > > +		f =3D devm_regmap_field_alloc(dev, hcd->regs,
> > > > +					    isp1760_hc_reg_fields[i]);
> > > > +		if (IS_ERR(f))
> > > > +			return PTR_ERR(f);
> > > > +
> > > > +		hcd->fields[i] =3D f;
> > > > +	}
> > > > +
> > > > +	udc->regs =3D devm_regmap_init_mmio(dev, base, &isp1761_dc_regmap=
_conf);
> > > > +	if (IS_ERR(udc->regs))
> > > > +		return PTR_ERR(udc->regs);
> > > > +
> > > > +	for (i =3D 0; i < DC_FIELD_MAX; i++) {
> > > > +		f =3D devm_regmap_field_alloc(dev, udc->regs,
> > > > +					    isp1761_dc_reg_fields[i]);
> > > > +		if (IS_ERR(f))
> > > > +			return PTR_ERR(f);
> > > > +
> > > > +		udc->fields[i] =3D f;
> > > > +	}
> > > > =20
> > > >  	isp1760_init_core(isp);
> > > > =20
> > > >  	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
> > > > -		ret =3D isp1760_hcd_register(&isp->hcd, isp->regs, mem, irq,
> > > > +		ret =3D isp1760_hcd_register(hcd, mem, irq,
> > > >  					   irqflags | IRQF_SHARED, dev);
> > > >  		if (ret < 0)
> > > >  			return ret;
> > > > @@ -147,7 +198,7 @@ int isp1760_register(struct resource *mem, int =
irq, unsigned long irqflags,
> > > >  	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && !udc_disabled) {
> > > >  		ret =3D isp1760_udc_register(isp, irq, irqflags);
> > > >  		if (ret < 0) {
> > > > -			isp1760_hcd_unregister(&isp->hcd);
> > > > +			isp1760_hcd_unregister(hcd);
> > > >  			return ret;
> > > >  		}
> > > >  	}
> > > > diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp17=
60/isp1760-core.h
> > > > index d9a0a4cc467c..8fec6395f19f 100644
> > > > --- a/drivers/usb/isp1760/isp1760-core.h
> > > > +++ b/drivers/usb/isp1760/isp1760-core.h
> > > > @@ -14,6 +14,7 @@
> > > >  #define _ISP1760_CORE_H_
> > > > =20
> > > >  #include <linux/ioport.h>
> > > > +#include <linux/regmap.h>
> > > > =20
> > > >  #include "isp1760-hcd.h"
> > > >  #include "isp1760-udc.h"
> > > > @@ -38,7 +39,6 @@ struct gpio_desc;
> > > >  struct isp1760_device {
> > > >  	struct device *dev;
> > > > =20
> > > > -	void __iomem *regs;
> > > >  	unsigned int devflags;
> > > >  	struct gpio_desc *rst_gpio;
> > > > =20
> > > > @@ -52,14 +52,42 @@ void isp1760_unregister(struct device *dev);
> > > > =20
> > > >  void isp1760_set_pullup(struct isp1760_device *isp, bool enable);
> > > > =20
> > > > -static inline u32 isp1760_read32(void __iomem *base, u32 reg)
> > > > +static inline u32 isp1760_field_read(struct regmap_field **fields,=
 u32 field)
> > > >  {
> > > > -	return readl(base + reg);
> > > > +	unsigned int val;
> > > > +
> > > > +	regmap_field_read(fields[field], &val);
> > > > +
> > > > +	return val;
> > > > +}
> > > > +
> > > > +static inline void isp1760_field_write(struct regmap_field **field=
s, u32 field,
> > > > +				       u32 val)
> > > > +{
> > > > +	regmap_field_write(fields[field], val);
> > > > +}
> > > > +
> > > > +static inline void isp1760_field_set(struct regmap_field **fields,=
 u32 field)
> > > > +{
> > > > +	isp1760_field_write(fields, field, 0xFFFFFFFF);
> > > >  }
> > > > =20
> > > > -static inline void isp1760_write32(void __iomem *base, u32 reg, u3=
2 val)
> > > > +static inline void isp1760_field_clear(struct regmap_field **field=
s, u32 field)
> > > >  {
> > > > -	writel(val, base + reg);
> > > > +	isp1760_field_write(fields, field, 0);
> > > >  }
> > > > =20
> > > > +static inline u32 isp1760_reg_read(struct regmap *regs, u32 reg)
> > > > +{
> > > > +	unsigned int val;
> > > > +
> > > > +	regmap_read(regs, reg, &val);
> > > > +
> > > > +	return val;
> > > > +}
> > > > +
> > > > +static inline void isp1760_reg_write(struct regmap *regs, u32 reg,=
 u32 val)
> > > > +{
> > > > +	regmap_write(regs, reg, val);
> > > > +}
> > > >  #endif
> > > > diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp176=
0/isp1760-hcd.c
> > > > index 33ae656c4b68..0601b1a4bd42 100644
> > > > --- a/drivers/usb/isp1760/isp1760-hcd.c
> > > > +++ b/drivers/usb/isp1760/isp1760-hcd.c
> > > > @@ -66,6 +66,10 @@ struct ptd {
> > > >  #define ATL_PTD_OFFSET		0x0c00
> > > >  #define PAYLOAD_OFFSET		0x1000
> > > > =20
> > > > +#define ISP_BANK_0		0x00
> > > > +#define ISP_BANK_1		0x01
> > > > +#define ISP_BANK_2		0x02
> > > > +#define ISP_BANK_3		0x03
> > > > =20
> > > >  /* ATL */
> > > >  /* DW0 */
> > > > @@ -159,16 +163,59 @@ struct urb_listitem {
> > > >  };
> > > > =20
> > > >  /*
> > > > - * Access functions for isp176x registers (addresses 0..0x03FF).
> > > > + * Access functions for isp176x registers regmap fields
> > > >   */
> > > > -static u32 reg_read32(void __iomem *base, u32 reg)
> > > > +static u32 isp1760_hcd_read(struct usb_hcd *hcd, u32 field)
> > > >  {
> > > > -	return isp1760_read32(base, reg);
> > > > +	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > > +
> > > > +	return isp1760_field_read(priv->fields, field);
> > > > +}
> > > > +
> > > > +static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 =
val)
> > > > +{
> > > > +	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > > +
> > > > +	isp1760_field_write(priv->fields, field, val);
> > > > +}
> > > > +
> > > > +static void isp1760_hcd_set(struct usb_hcd *hcd, u32 field)
> > > > +{
> > > > +	isp1760_hcd_write(hcd, field, 0xFFFFFFFF);
> > > > +}
> > > > +
> > > > +static void isp1760_hcd_clear(struct usb_hcd *hcd, u32 field)
> > > > +{
> > > > +	isp1760_hcd_write(hcd, field, 0);
> > > > +}
> > > > +
> > > > +static int isp1760_hcd_set_poll_timeout(struct usb_hcd *hcd, u32 f=
ield,
> > > > +					u32 timeout_us)
> > > > +{
> > > > +	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > > +	unsigned int val;
> > > > +
> > > > +	isp1760_hcd_set(hcd, field);
> > > > +
> > > > +	return regmap_field_read_poll_timeout(priv->fields[field], val, 1=
, 1,
> > > > +					      timeout_us);
> > > >  }
> > > > =20
> > > > -static void reg_write32(void __iomem *base, u32 reg, u32 val)
> > > > +static int isp1760_hcd_clear_poll_timeout(struct usb_hcd *hcd, u32=
 field,
> > > > +					  u32 timeout_us)
> > > >  {
> > > > -	isp1760_write32(base, reg, val);
> > > > +	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > > +	unsigned int val;
> > > > +
> > > > +	isp1760_hcd_clear(hcd, field);
> > > > +
> > > > +	return regmap_field_read_poll_timeout(priv->fields[field], val, 0=
, 1,
> > > > +					      timeout_us);
> > > > +}
> > > > +
> > > > +static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
> > > > +{
> > > > +	return !!isp1760_hcd_read(hcd, field);
> > > >  }
> > > > =20
> > > >  /*
> > > > @@ -231,12 +278,15 @@ static void bank_reads8(void __iomem *src_bas=
e, u32 src_offset, u32 bank_addr,
> > > >  	}
> > > >  }
> > > > =20
> > > > -static void mem_reads8(void __iomem *src_base, u32 src_offset, voi=
d *dst,
> > > > -								u32 bytes)
> > > > +static void mem_reads8(struct usb_hcd *hcd, void __iomem *src_base=
,
> > > > +		       u32 src_offset, void *dst, u32 bytes)
> > > >  {
> > > > -	reg_write32(src_base, HC_MEMORY_REG, src_offset + ISP_BANK(0));
> > > > +	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
> > > > +	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
> > > > +
> > > >  	ndelay(90);
> > > > -	bank_reads8(src_base, src_offset, ISP_BANK(0), dst, bytes);
> > > > +
> > > > +	bank_reads8(src_base, src_offset, ISP_BANK_0, dst, bytes);
> > > >  }
> > > > =20
> > > >  static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
> > > > @@ -278,14 +328,15 @@ static void mem_writes8(void __iomem *dst_bas=
e, u32 dst_offset,
> > > >   * Read and write ptds. 'ptd_offset' should be one of ISO_PTD_OFFS=
ET,
> > > >   * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than =
32.
> > > >   */
> > > > -static void ptd_read(void __iomem *base, u32 ptd_offset, u32 slot,
> > > > -								struct ptd *ptd)
> > > > +static void ptd_read(struct usb_hcd *hcd, void __iomem *base,
> > > > +		     u32 ptd_offset, u32 slot, struct ptd *ptd)
> > > >  {
> > > > -	reg_write32(base, HC_MEMORY_REG,
> > > > -				ISP_BANK(0) + ptd_offset + slot*sizeof(*ptd));
> > > > +	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
> > > > +	isp1760_hcd_write(hcd, MEM_START_ADDR,
> > > > +			  ptd_offset + slot * sizeof(*ptd));
> > > >  	ndelay(90);
> > > > -	bank_reads8(base, ptd_offset + slot*sizeof(*ptd), ISP_BANK(0),
> > > > -						(void *) ptd, sizeof(*ptd));
> > > > +	bank_reads8(base, ptd_offset + slot * sizeof(*ptd), ISP_BANK_0,
> > > > +		    (void *)ptd, sizeof(*ptd));
> > > >  }
> > > > =20
> > > >  static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot=
,
> > > > @@ -377,34 +428,15 @@ static void free_mem(struct usb_hcd *hcd, str=
uct isp1760_qtd *qtd)
> > > >  	qtd->payload_addr =3D 0;
> > > >  }
> > > > =20
> > > > -static int handshake(struct usb_hcd *hcd, u32 reg,
> > > > -		      u32 mask, u32 done, int usec)
> > > > -{
> > > > -	u32 result;
> > > > -	int ret;
> > > > -
> > > > -	ret =3D readl_poll_timeout_atomic(hcd->regs + reg, result,
> > > > -					((result & mask) =3D=3D done ||
> > > > -					 result =3D=3D U32_MAX), 1, usec);
> > > > -	if (result =3D=3D U32_MAX)
> > > > -		return -ENODEV;
> > > > -
> > > > -	return ret;
> > > > -}
> > > > -
> > > >  /* reset a non-running (STS_HALT =3D=3D 1) controller */
> > > >  static int ehci_reset(struct usb_hcd *hcd)
> > > >  {
> > > >  	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > > =20
> > > > -	u32 command =3D reg_read32(hcd->regs, HC_USBCMD);
> > > > -
> > > > -	command |=3D CMD_RESET;
> > > > -	reg_write32(hcd->regs, HC_USBCMD, command);
> > > >  	hcd->state =3D HC_STATE_HALT;
> > > >  	priv->next_statechange =3D jiffies;
> > > > =20
> > > > -	return handshake(hcd, HC_USBCMD, CMD_RESET, 0, 250 * 1000);
> > > > +	return isp1760_hcd_set_poll_timeout(hcd, CMD_RESET, 250 * 1000);
> > > >  }
> > > > =20
> > > >  static struct isp1760_qh *qh_alloc(gfp_t flags)
> > > > @@ -432,8 +464,10 @@ static void qh_free(struct isp1760_qh *qh)
> > > >  /* one-time init, only for memory state */
> > > >  static int priv_init(struct usb_hcd *hcd)
> > > >  {
> > > > -	struct isp1760_hcd		*priv =3D hcd_to_priv(hcd);
> > > > -	u32			hcc_params;
> > > > +	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > > +	u32 isoc_cache;
> > > > +	u32 isoc_thres;
> > > > +
> > > >  	int i;
> > > > =20
> > > >  	spin_lock_init(&priv->lock);
> > > > @@ -448,12 +482,14 @@ static int priv_init(struct usb_hcd *hcd)
> > > >  	priv->periodic_size =3D DEFAULT_I_TDPS;
> > > > =20
> > > >  	/* controllers may cache some of the periodic schedule ... */
> > > > -	hcc_params =3D reg_read32(hcd->regs, HC_HCCPARAMS);
> > > > +	isoc_cache =3D isp1760_hcd_read(hcd->regs, HCC_ISOC_CACHE);
> > > > +	isoc_thres =3D isp1760_hcd_read(hcd->regs, HCC_ISOC_THRES);
> > > > +
> > > >  	/* full frame cache */
> > > > -	if (HCC_ISOC_CACHE(hcc_params))
> > > > +	if (isoc_cache)
> > > >  		priv->i_thresh =3D 8;
> > > >  	else /* N microframes cached */
> > > > -		priv->i_thresh =3D 2 + HCC_ISOC_THRES(hcc_params);
> > > > +		priv->i_thresh =3D 2 + isoc_thres;
> > > > =20
> > > >  	return 0;
> > > >  }
> > > > @@ -462,12 +498,13 @@ static int isp1760_hc_setup(struct usb_hcd *h=
cd)
> > > >  {
> > > >  	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > >  	int result;
> > > > -	u32 scratch, hwmode;
> > > > +	u32 scratch;
> > > > +
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_SCRATCH, 0xdeadbabe);
> > > > =20
> > > > -	reg_write32(hcd->regs, HC_SCRATCH_REG, 0xdeadbabe);
> > > >  	/* Change bus pattern */
> > > > -	scratch =3D reg_read32(hcd->regs, HC_CHIP_ID_REG);
> > > > -	scratch =3D reg_read32(hcd->regs, HC_SCRATCH_REG);
> > > > +	scratch =3D isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
> > > > +	scratch =3D isp1760_reg_read(priv->regs, ISP176x_HC_SCRATCH);
> > > >  	if (scratch !=3D 0xdeadbabe) {
> > > >  		dev_err(hcd->self.controller, "Scratch test failed.\n");
> > > >  		return -ENODEV;
> > > > @@ -481,10 +518,13 @@ static int isp1760_hc_setup(struct usb_hcd *h=
cd)
> > > >  	 * the host controller through the EHCI USB Command register. The=
 device
> > > >  	 * has been reset in core code anyway, so this shouldn't matter.
> > > >  	 */
> > > > -	reg_write32(hcd->regs, HC_BUFFER_STATUS_REG, 0);
> > > > -	reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE=
);
> > > > -	reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE=
);
> > > > -	reg_write32(hcd->regs, HC_ISO_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE=
);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_BUFFER_STATUS, 0);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
> > > > +			  NO_TRANSFER_ACTIVE);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
> > > > +			  NO_TRANSFER_ACTIVE);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP,
> > > > +			  NO_TRANSFER_ACTIVE);
> > > > =20
> > > >  	result =3D ehci_reset(hcd);
> > > >  	if (result)
> > > > @@ -493,14 +533,11 @@ static int isp1760_hc_setup(struct usb_hcd *h=
cd)
> > > >  	/* Step 11 passed */
> > > > =20
> > > >  	/* ATL reset */
> > > > -	hwmode =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL) & ~ALL_ATX_RESE=
T;
> > > > -	reg_write32(hcd->regs, HC_HW_MODE_CTRL, hwmode | ALL_ATX_RESET);
> > > > +	isp1760_hcd_set(hcd, ALL_ATX_RESET);
> > > >  	mdelay(10);
> > > > -	reg_write32(hcd->regs, HC_HW_MODE_CTRL, hwmode);
> > > > -
> > > > -	reg_write32(hcd->regs, HC_INTERRUPT_ENABLE, INTERRUPT_ENABLE_MASK=
);
> > > > +	isp1760_hcd_clear(hcd, ALL_ATX_RESET);
> > > > =20
> > > > -	priv->hcs_params =3D reg_read32(hcd->regs, HC_HCSPARAMS);
> > > > +	isp1760_hcd_set(hcd, HC_INT_ENABLE);
> > > > =20
> > > >  	return priv_init(hcd);
> > > >  }
> > > > @@ -730,12 +767,12 @@ static void start_bus_transfer(struct usb_hcd=
 *hcd, u32 ptd_offset, int slot,
> > > > =20
> > > >  	/* Make sure done map has not triggered from some unlinked transf=
er */
> > > >  	if (ptd_offset =3D=3D ATL_PTD_OFFSET) {
> > > > -		priv->atl_done_map |=3D reg_read32(hcd->regs,
> > > > -						HC_ATL_PTD_DONEMAP_REG);
> > > > +		priv->atl_done_map |=3D isp1760_reg_read(priv->regs,
> > > > +						ISP176x_HC_ATL_PTD_DONEMAP);
> > > >  		priv->atl_done_map &=3D ~(1 << slot);
> > > >  	} else {
> > > > -		priv->int_done_map |=3D reg_read32(hcd->regs,
> > > > -						HC_INT_PTD_DONEMAP_REG);
> > > > +		priv->int_done_map |=3D isp1760_reg_read(priv->regs,
> > > > +					       ISP176x_HC_INT_PTD_DONEMAP);
> > > >  		priv->int_done_map &=3D ~(1 << slot);
> > > >  	}
> > > > =20
> > > > @@ -744,16 +781,20 @@ static void start_bus_transfer(struct usb_hcd=
 *hcd, u32 ptd_offset, int slot,
> > > >  	slots[slot].timestamp =3D jiffies;
> > > >  	slots[slot].qtd =3D qtd;
> > > >  	slots[slot].qh =3D qh;
> > > > -	ptd_write(hcd->regs, ptd_offset, slot, ptd);
> > > > +	ptd_write(priv->base, ptd_offset, slot, ptd);
> > > > =20
> > > >  	if (ptd_offset =3D=3D ATL_PTD_OFFSET) {
> > > > -		skip_map =3D reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
> > > > +		skip_map =3D isp1760_reg_read(priv->regs,
> > > > +					    ISP176x_HC_ATL_PTD_SKIPMAP);
> > > >  		skip_map &=3D ~(1 << qh->slot);
> > > > -		reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, skip_map);
> > > > +		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
> > > > +				  skip_map);
> > > >  	} else {
> > > > -		skip_map =3D reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
> > > > +		skip_map =3D isp1760_reg_read(priv->regs,
> > > > +					    ISP176x_HC_INT_PTD_SKIPMAP);
> > > >  		skip_map &=3D ~(1 << qh->slot);
> > > > -		reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, skip_map);
> > > > +		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
> > > > +				  skip_map);
> > > >  	}
> > > >  }
> > > > =20
> > > > @@ -766,9 +807,10 @@ static int is_short_bulk(struct isp1760_qtd *q=
td)
> > > >  static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *q=
h,
> > > >  						struct list_head *urb_list)
> > > >  {
> > > > -	int last_qtd;
> > > > +	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > >  	struct isp1760_qtd *qtd, *qtd_next;
> > > >  	struct urb_listitem *urb_listitem;
> > > > +	int last_qtd;
> > > > =20
> > > >  	list_for_each_entry_safe(qtd, qtd_next, &qh->qtd_list, qtd_list) =
{
> > > >  		if (qtd->status < QTD_XFER_COMPLETE)
> > > > @@ -783,9 +825,10 @@ static void collect_qtds(struct usb_hcd *hcd, =
struct isp1760_qh *qh,
> > > >  			if (qtd->actual_length) {
> > > >  				switch (qtd->packet_type) {
> > > >  				case IN_PID:
> > > > -					mem_reads8(hcd->regs, qtd->payload_addr,
> > > > -							qtd->data_buffer,
> > > > -							qtd->actual_length);
> > > > +					mem_reads8(hcd, priv->base,
> > > > +						   qtd->payload_addr,
> > > > +						   qtd->data_buffer,
> > > > +						   qtd->actual_length);
> > > >  					fallthrough;
> > > >  				case OUT_PID:
> > > >  					qtd->urb->actual_length +=3D
> > > > @@ -873,8 +916,8 @@ static void enqueue_qtds(struct usb_hcd *hcd, s=
truct isp1760_qh *qh)
> > > >  			if ((qtd->length) &&
> > > >  			    ((qtd->packet_type =3D=3D SETUP_PID) ||
> > > >  			     (qtd->packet_type =3D=3D OUT_PID))) {
> > > > -				mem_writes8(hcd->regs, qtd->payload_addr,
> > > > -						qtd->data_buffer, qtd->length);
> > > > +				mem_writes8(priv->base, qtd->payload_addr,
> > > > +					    qtd->data_buffer, qtd->length);
> > > >  			}
> > > > =20
> > > >  			qtd->status =3D QTD_PAYLOAD_ALLOC;
> > > > @@ -1074,9 +1117,9 @@ static void handle_done_ptds(struct usb_hcd *=
hcd)
> > > >  	int modified;
> > > >  	int skip_map;
> > > > =20
> > > > -	skip_map =3D reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
> > > > +	skip_map =3D isp1760_reg_read(priv->regs, ISP176x_HC_INT_PTD_SKIP=
MAP);
> > > >  	priv->int_done_map &=3D ~skip_map;
> > > > -	skip_map =3D reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
> > > > +	skip_map =3D isp1760_reg_read(priv->regs, ISP176x_HC_ATL_PTD_SKIP=
MAP);
> > > >  	priv->atl_done_map &=3D ~skip_map;
> > > > =20
> > > >  	modified =3D priv->int_done_map || priv->atl_done_map;
> > > > @@ -1094,7 +1137,7 @@ static void handle_done_ptds(struct usb_hcd *=
hcd)
> > > >  				continue;
> > > >  			}
> > > >  			ptd_offset =3D INT_PTD_OFFSET;
> > > > -			ptd_read(hcd->regs, INT_PTD_OFFSET, slot, &ptd);
> > > > +			ptd_read(hcd, priv->base, INT_PTD_OFFSET, slot, &ptd);
> > > >  			state =3D check_int_transfer(hcd, &ptd,
> > > >  							slots[slot].qtd->urb);
> > > >  		} else {
> > > > @@ -1109,7 +1152,7 @@ static void handle_done_ptds(struct usb_hcd *=
hcd)
> > > >  				continue;
> > > >  			}
> > > >  			ptd_offset =3D ATL_PTD_OFFSET;
> > > > -			ptd_read(hcd->regs, ATL_PTD_OFFSET, slot, &ptd);
> > > > +			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
> > > >  			state =3D check_atl_transfer(hcd, &ptd,
> > > >  							slots[slot].qtd->urb);
> > > >  		}
> > > > @@ -1134,7 +1177,7 @@ static void handle_done_ptds(struct usb_hcd *=
hcd)
> > > > =20
> > > >  			qtd->status =3D QTD_XFER_COMPLETE;
> > > >  			if (list_is_last(&qtd->qtd_list, &qh->qtd_list) ||
> > > > -							is_short_bulk(qtd))
> > > > +			    is_short_bulk(qtd))
> > > >  				qtd =3D NULL;
> > > >  			else
> > > >  				qtd =3D list_entry(qtd->qtd_list.next,
> > > > @@ -1210,13 +1253,15 @@ static irqreturn_t isp1760_irq(struct usb_h=
cd *hcd)
> > > >  	if (!(hcd->state & HC_STATE_RUNNING))
> > > >  		goto leave;
> > > > =20
> > > > -	imask =3D reg_read32(hcd->regs, HC_INTERRUPT_REG);
> > > > +	imask =3D isp1760_reg_read(priv->regs, ISP176x_HC_INTERRUPT);
> > > >  	if (unlikely(!imask))
> > > >  		goto leave;
> > > > -	reg_write32(hcd->regs, HC_INTERRUPT_REG, imask); /* Clear */
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_INTERRUPT, imask); /* Cl=
ear */
> > > > =20
> > > > -	priv->int_done_map |=3D reg_read32(hcd->regs, HC_INT_PTD_DONEMAP_=
REG);
> > > > -	priv->atl_done_map |=3D reg_read32(hcd->regs, HC_ATL_PTD_DONEMAP_=
REG);
> > > > +	priv->int_done_map |=3D isp1760_reg_read(priv->regs,
> > > > +					       ISP176x_HC_INT_PTD_DONEMAP);
> > > > +	priv->atl_done_map |=3D isp1760_reg_read(priv->regs,
> > > > +					       ISP176x_HC_ATL_PTD_DONEMAP);
> > > > =20
> > > >  	handle_done_ptds(hcd);
> > > > =20
> > > > @@ -1271,7 +1316,7 @@ static void errata2_function(struct timer_lis=
t *unused)
> > > >  		if (priv->atl_slots[slot].qh && time_after(jiffies,
> > > >  					priv->atl_slots[slot].timestamp +
> > > >  					msecs_to_jiffies(SLOT_TIMEOUT))) {
> > > > -			ptd_read(hcd->regs, ATL_PTD_OFFSET, slot, &ptd);
> > > > +			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
> > > >  			if (!FROM_DW0_VALID(ptd.dw0) &&
> > > >  					!FROM_DW3_ACTIVE(ptd.dw3))
> > > >  				priv->atl_done_map |=3D 1 << slot;
> > > > @@ -1288,9 +1333,8 @@ static void errata2_function(struct timer_lis=
t *unused)
> > > > =20
> > > >  static int isp1760_run(struct usb_hcd *hcd)
> > > >  {
> > > > +	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > >  	int retval;
> > > > -	u32 temp;
> > > > -	u32 command;
> > > >  	u32 chipid;
> > > > =20
> > > >  	hcd->uses_new_polling =3D 1;
> > > > @@ -1298,23 +1342,20 @@ static int isp1760_run(struct usb_hcd *hcd)
> > > >  	hcd->state =3D HC_STATE_RUNNING;
> > > > =20
> > > >  	/* Set PTD interrupt AND & OR maps */
> > > > -	reg_write32(hcd->regs, HC_ATL_IRQ_MASK_AND_REG, 0);
> > > > -	reg_write32(hcd->regs, HC_ATL_IRQ_MASK_OR_REG, 0xffffffff);
> > > > -	reg_write32(hcd->regs, HC_INT_IRQ_MASK_AND_REG, 0);
> > > > -	reg_write32(hcd->regs, HC_INT_IRQ_MASK_OR_REG, 0xffffffff);
> > > > -	reg_write32(hcd->regs, HC_ISO_IRQ_MASK_AND_REG, 0);
> > > > -	reg_write32(hcd->regs, HC_ISO_IRQ_MASK_OR_REG, 0xffffffff);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_AND, 0);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_OR, 0xfffff=
fff);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_AND, 0);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_OR, 0xfffff=
fff);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_AND, 0);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_OR, 0xfffff=
fff);
> > > >  	/* step 23 passed */
> > > > =20
> > > > -	temp =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL);
> > > > -	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp | HW_GLOBAL_INTR_EN)=
;
> > > > +	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
> > > > =20
> > > > -	command =3D reg_read32(hcd->regs, HC_USBCMD);
> > > > -	command &=3D ~(CMD_LRESET|CMD_RESET);
> > > > -	command |=3D CMD_RUN;
> > > > -	reg_write32(hcd->regs, HC_USBCMD, command);
> > > > +	isp1760_hcd_clear(hcd, CMD_LRESET);
> > > > +	isp1760_hcd_clear(hcd, CMD_RESET);
> > > > =20
> > > > -	retval =3D handshake(hcd, HC_USBCMD, CMD_RUN, CMD_RUN, 250 * 1000=
);
> > > > +	retval =3D isp1760_hcd_set_poll_timeout(hcd, CMD_RUN, 250 * 1000)=
;
> > > >  	if (retval)
> > > >  		return retval;
> > > > =20
> > > > @@ -1324,9 +1365,8 @@ static int isp1760_run(struct usb_hcd *hcd)
> > > >  	 * the semaphore while doing so.
> > > >  	 */
> > > >  	down_write(&ehci_cf_port_reset_rwsem);
> > > > -	reg_write32(hcd->regs, HC_CONFIGFLAG, FLAG_CF);
> > > > =20
> > > > -	retval =3D handshake(hcd, HC_CONFIGFLAG, FLAG_CF, FLAG_CF, 250 * =
1000);
> > > > +	retval =3D isp1760_hcd_set_poll_timeout(hcd, FLAG_CF, 250 * 1000)=
;
> > > >  	up_write(&ehci_cf_port_reset_rwsem);
> > > >  	if (retval)
> > > >  		return retval;
> > > > @@ -1336,21 +1376,22 @@ static int isp1760_run(struct usb_hcd *hcd)
> > > >  	errata2_timer.expires =3D jiffies + msecs_to_jiffies(SLOT_CHECK_P=
ERIOD);
> > > >  	add_timer(&errata2_timer);
> > > > =20
> > > > -	chipid =3D reg_read32(hcd->regs, HC_CHIP_ID_REG);
> > > > +	chipid =3D isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
> > > >  	dev_info(hcd->self.controller, "USB ISP %04x HW rev. %d started\n=
",
> > > >  					chipid & 0xffff, chipid >> 16);
> > > > =20
> > > >  	/* PTD Register Init Part 2, Step 28 */
> > > > =20
> > > >  	/* Setup registers controlling PTD checking */
> > > > -	reg_write32(hcd->regs, HC_ATL_PTD_LASTPTD_REG, 0x80000000);
> > > > -	reg_write32(hcd->regs, HC_INT_PTD_LASTPTD_REG, 0x80000000);
> > > > -	reg_write32(hcd->regs, HC_ISO_PTD_LASTPTD_REG, 0x00000001);
> > > > -	reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, 0xffffffff);
> > > > -	reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, 0xffffffff);
> > > > -	reg_write32(hcd->regs, HC_ISO_PTD_SKIPMAP_REG, 0xffffffff);
> > > > -	reg_write32(hcd->regs, HC_BUFFER_STATUS_REG,
> > > > -						ATL_BUF_FILL | INT_BUF_FILL);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_LASTPTD, 0x80000=
000);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_LASTPTD, 0x80000=
000);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_LASTPTD, 0x00000=
001);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP, 0xfffff=
fff);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP, 0xfffff=
fff);
> > > > +	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP, 0xfffff=
fff);
> > > > +
> > > > +	isp1760_hcd_set(hcd, ATL_BUF_FILL);
> > > > +	isp1760_hcd_set(hcd, INT_BUF_FILL);
> > > > =20
> > > >  	/* GRR this is run-once init(), being done every time the HC star=
ts.
> > > >  	 * So long as they're part of class devices, we can't do it init(=
)
> > > > @@ -1584,15 +1625,19 @@ static void kill_transfer(struct usb_hcd *h=
cd, struct urb *urb,
> > > >  	/* We need to forcefully reclaim the slot since some transfers ne=
ver
> > > >  	   return, e.g. interrupt transfers and NAKed bulk transfers. */
> > > >  	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
> > > > -		skip_map =3D reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
> > > > +		skip_map =3D isp1760_reg_read(priv->regs,
> > > > +					    ISP176x_HC_ATL_PTD_SKIPMAP);
> > > >  		skip_map |=3D (1 << qh->slot);
> > > > -		reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, skip_map);
> > > > +		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
> > > > +				  skip_map);
> > > >  		priv->atl_slots[qh->slot].qh =3D NULL;
> > > >  		priv->atl_slots[qh->slot].qtd =3D NULL;
> > > >  	} else {
> > > > -		skip_map =3D reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
> > > > +		skip_map =3D isp1760_reg_read(priv->regs,
> > > > +					    ISP176x_HC_INT_PTD_SKIPMAP);
> > > >  		skip_map |=3D (1 << qh->slot);
> > > > -		reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, skip_map);
> > > > +		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
> > > > +				  skip_map);
> > > >  		priv->int_slots[qh->slot].qh =3D NULL;
> > > >  		priv->int_slots[qh->slot].qtd =3D NULL;
> > > >  	}
> > > > @@ -1705,8 +1750,7 @@ static void isp1760_endpoint_disable(struct u=
sb_hcd *hcd,
> > > >  static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
> > > >  {
> > > >  	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > > -	u32 temp, status =3D 0;
> > > > -	u32 mask;
> > > > +	u32 status =3D 0;
> > > >  	int retval =3D 1;
> > > >  	unsigned long flags;
> > > > =20
> > > > @@ -1716,17 +1760,13 @@ static int isp1760_hub_status_data(struct u=
sb_hcd *hcd, char *buf)
> > > > =20
> > > >  	/* init status to no-changes */
> > > >  	buf[0] =3D 0;
> > > > -	mask =3D PORT_CSC;
> > > > =20
> > > >  	spin_lock_irqsave(&priv->lock, flags);
> > > > -	temp =3D reg_read32(hcd->regs, HC_PORTSC1);
> > > > =20
> > > > -	if (temp & PORT_OWNER) {
> > > > -		if (temp & PORT_CSC) {
> > > > -			temp &=3D ~PORT_CSC;
> > > > -			reg_write32(hcd->regs, HC_PORTSC1, temp);
> > > > -			goto done;
> > > > -		}
> > > > +	if (isp1760_hcd_is_set(hcd, PORT_OWNER) &&
> > > > +	    isp1760_hcd_is_set(hcd, PORT_CSC)) {
> > > > +		isp1760_hcd_clear(hcd, PORT_CSC);
> > > > +		goto done;
> > > >  	}
> > > > =20
> > > >  	/*
> > > > @@ -1735,11 +1775,9 @@ static int isp1760_hub_status_data(struct us=
b_hcd *hcd, char *buf)
> > > >  	 * high-speed device is switched over to the companion
> > > >  	 * controller by the user.
> > > >  	 */
> > > > -
> > > > -	if ((temp & mask) !=3D 0
> > > > -			|| ((temp & PORT_RESUME) !=3D 0
> > > > -				&& time_after_eq(jiffies,
> > > > -					priv->reset_done))) {
> > > > +	if (isp1760_hcd_is_set(hcd, PORT_CSC) ||
> > > > +	    (isp1760_hcd_is_set(hcd, PORT_RESUME) &&
> > > > +	     time_after_eq(jiffies, priv->reset_done))) {
> > > >  		buf [0] |=3D 1 << (0 + 1);
> > > >  		status =3D STS_PCD;
> > > >  	}
> > > > @@ -1752,9 +1790,11 @@ static int isp1760_hub_status_data(struct us=
b_hcd *hcd, char *buf)
> > > >  static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
> > > >  		struct usb_hub_descriptor *desc)
> > > >  {
> > > > -	int ports =3D HCS_N_PORTS(priv->hcs_params);
> > > > +	int ports;
> > > >  	u16 temp;
> > > > =20
> > > > +	ports =3D isp1760_hcd_read(priv->hcd, HCS_N_PORTS);
> > > > +
> > > >  	desc->bDescriptorType =3D USB_DT_HUB;
> > > >  	/* priv 1.0, 2.3.9 says 20ms max */
> > > >  	desc->bPwrOn2PwrGood =3D 10;
> > > > @@ -1770,7 +1810,7 @@ static void isp1760_hub_descriptor(struct isp=
1760_hcd *priv,
> > > > =20
> > > >  	/* per-port overcurrent reporting */
> > > >  	temp =3D HUB_CHAR_INDV_PORT_OCPM;
> > > > -	if (HCS_PPC(priv->hcs_params))
> > > > +	if (isp1760_hcd_is_set(priv->hcd, HCS_PPC))
> > > >  		/* per-port power control */
> > > >  		temp |=3D HUB_CHAR_INDV_PORT_LPSM;
> > > >  	else
> > > > @@ -1781,38 +1821,37 @@ static void isp1760_hub_descriptor(struct i=
sp1760_hcd *priv,
> > > > =20
> > > >  #define	PORT_WAKE_BITS	(PORT_WKOC_E|PORT_WKDISC_E|PORT_WKCONN_E)
> > > > =20
> > > > -static int check_reset_complete(struct usb_hcd *hcd, int index,
> > > > -		int port_status)
> > > > +static void check_reset_complete(struct usb_hcd *hcd, int index)
> > > >  {
> > > > -	if (!(port_status & PORT_CONNECT))
> > > > -		return port_status;
> > > > +	if (!(isp1760_hcd_is_set(hcd, PORT_CONNECT)))
> > > > +		return;
> > > > =20
> > > >  	/* if reset finished and it's still not enabled -- handoff */
> > > > -	if (!(port_status & PORT_PE)) {
> > > > -
> > > > +	if (!isp1760_hcd_is_set(hcd, PORT_PE)) {
> > > >  		dev_info(hcd->self.controller,
> > > >  					"port %d full speed --> companion\n",
> > > >  					index + 1);
> > > > =20
> > > > -		port_status |=3D PORT_OWNER;
> > > > -		port_status &=3D ~PORT_RWC_BITS;
> > > > -		reg_write32(hcd->regs, HC_PORTSC1, port_status);
> > > > +		isp1760_hcd_set(hcd, PORT_OWNER);
> > > > =20
> > > > +		isp1760_hcd_clear(hcd, PORT_CSC);
> > > >  	} else
> > > >  		dev_info(hcd->self.controller, "port %d high speed\n",
> > > >  								index + 1);
> > > > =20
> > > > -	return port_status;
> > > > +	return;
> > > >  }
> > > > =20
> > > >  static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
> > > >  		u16 wValue, u16 wIndex, char *buf, u16 wLength)
> > > >  {
> > > >  	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > > -	int ports =3D HCS_N_PORTS(priv->hcs_params);
> > > > -	u32 temp, status;
> > > > +	u32 status;
> > > >  	unsigned long flags;
> > > >  	int retval =3D 0;
> > > > +	int ports;
> > > > +
> > > > +	ports =3D isp1760_hcd_read(hcd, HCS_N_PORTS);
> > > > =20
> > > >  	/*
> > > >  	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
> > > > @@ -1837,7 +1876,6 @@ static int isp1760_hub_control(struct usb_hcd=
 *hcd, u16 typeReq,
> > > >  		if (!wIndex || wIndex > ports)
> > > >  			goto error;
> > > >  		wIndex--;
> > > > -		temp =3D reg_read32(hcd->regs, HC_PORTSC1);
> > > > =20
> > > >  		/*
> > > >  		 * Even if OWNER is set, so the port is owned by the
> > > > @@ -1848,22 +1886,22 @@ static int isp1760_hub_control(struct usb_h=
cd *hcd, u16 typeReq,
> > > > =20
> > > >  		switch (wValue) {
> > > >  		case USB_PORT_FEAT_ENABLE:
> > > > -			reg_write32(hcd->regs, HC_PORTSC1, temp & ~PORT_PE);
> > > > +			isp1760_hcd_clear(hcd, PORT_PE);
> > > >  			break;
> > > >  		case USB_PORT_FEAT_C_ENABLE:
> > > >  			/* XXX error? */
> > > >  			break;
> > > >  		case USB_PORT_FEAT_SUSPEND:
> > > > -			if (temp & PORT_RESET)
> > > > +			if (isp1760_hcd_is_set(hcd, PORT_RESET))
> > > >  				goto error;
> > > > =20
> > > > -			if (temp & PORT_SUSPEND) {
> > > > -				if ((temp & PORT_PE) =3D=3D 0)
> > > > +			if (isp1760_hcd_is_set(hcd, PORT_SUSPEND)) {
> > > > +				if (!isp1760_hcd_is_set(hcd, PORT_PE))
> > > >  					goto error;
> > > >  				/* resume signaling for 20 msec */
> > > > -				temp &=3D ~(PORT_RWC_BITS);
> > > > -				reg_write32(hcd->regs, HC_PORTSC1,
> > > > -							temp | PORT_RESUME);
> > > > +				isp1760_hcd_clear(hcd, PORT_CSC);
> > > > +				isp1760_hcd_set(hcd, PORT_RESUME);
> > > > +
> > > >  				priv->reset_done =3D jiffies +
> > > >  					msecs_to_jiffies(USB_RESUME_TIMEOUT);
> > > >  			}
> > > > @@ -1872,12 +1910,11 @@ static int isp1760_hub_control(struct usb_h=
cd *hcd, u16 typeReq,
> > > >  			/* we auto-clear this feature */
> > > >  			break;
> > > >  		case USB_PORT_FEAT_POWER:
> > > > -			if (HCS_PPC(priv->hcs_params))
> > > > -				reg_write32(hcd->regs, HC_PORTSC1,
> > > > -							temp & ~PORT_POWER);
> > > > +			if (isp1760_hcd_is_set(hcd, HCS_PPC))
> > > > +				isp1760_hcd_clear(hcd, PORT_POWER);
> > > >  			break;
> > > >  		case USB_PORT_FEAT_C_CONNECTION:
> > > > -			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_CSC);
> > > > +			isp1760_hcd_set(hcd, PORT_CSC);
> > > >  			break;
> > > >  		case USB_PORT_FEAT_C_OVER_CURRENT:
> > > >  			/* XXX error ?*/
> > > > @@ -1888,7 +1925,7 @@ static int isp1760_hub_control(struct usb_hcd=
 *hcd, u16 typeReq,
> > > >  		default:
> > > >  			goto error;
> > > >  		}
> > > > -		reg_read32(hcd->regs, HC_USBCMD);
> > > > +		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
> > > >  		break;
> > > >  	case GetHubDescriptor:
> > > >  		isp1760_hub_descriptor(priv, (struct usb_hub_descriptor *)
> > > > @@ -1903,15 +1940,14 @@ static int isp1760_hub_control(struct usb_h=
cd *hcd, u16 typeReq,
> > > >  			goto error;
> > > >  		wIndex--;
> > > >  		status =3D 0;
> > > > -		temp =3D reg_read32(hcd->regs, HC_PORTSC1);
> > > > =20
> > > >  		/* wPortChange bits */
> > > > -		if (temp & PORT_CSC)
> > > > +		if (isp1760_hcd_is_set(hcd, PORT_CSC))
> > > >  			status |=3D USB_PORT_STAT_C_CONNECTION << 16;
> > > > =20
> > > > =20
> > > >  		/* whoever resumes must GetPortStatus to complete it!! */
> > > > -		if (temp & PORT_RESUME) {
> > > > +		if (isp1760_hcd_is_set(hcd, PORT_RESUME)) {
> > > >  			dev_err(hcd->self.controller, "Port resume should be skipped.\n=
");
> > > > =20
> > > >  			/* Remote Wakeup received? */
> > > > @@ -1930,35 +1966,31 @@ static int isp1760_hub_control(struct usb_h=
cd *hcd, u16 typeReq,
> > > >  				priv->reset_done =3D 0;
> > > > =20
> > > >  				/* stop resume signaling */
> > > > -				temp =3D reg_read32(hcd->regs, HC_PORTSC1);
> > > > -				reg_write32(hcd->regs, HC_PORTSC1,
> > > > -					temp & ~(PORT_RWC_BITS | PORT_RESUME));
> > > > -				retval =3D handshake(hcd, HC_PORTSC1,
> > > > -					   PORT_RESUME, 0, 2000 /* 2msec */);
> > > > +				isp1760_hcd_clear(hcd, PORT_CSC);
> > > > +
> > > > +				retval =3D isp1760_hcd_clear_poll_timeout(hcd,
> > > > +							  PORT_RESUME, 2000);
> > > >  				if (retval !=3D 0) {
> > > >  					dev_err(hcd->self.controller,
> > > >  						"port %d resume error %d\n",
> > > >  						wIndex + 1, retval);
> > > >  					goto error;
> > > >  				}
> > > > -				temp &=3D ~(PORT_SUSPEND|PORT_RESUME|(3<<10));
> > > >  			}
> > > >  		}
> > > > =20
> > > >  		/* whoever resets must GetPortStatus to complete it!! */
> > > > -		if ((temp & PORT_RESET)
> > > > -				&& time_after_eq(jiffies,
> > > > -					priv->reset_done)) {
> > > > +		if (isp1760_hcd_is_set(hcd, PORT_RESET) &&
> > > > +		    time_after_eq(jiffies, priv->reset_done)) {
> > > >  			status |=3D USB_PORT_STAT_C_RESET << 16;
> > > >  			priv->reset_done =3D 0;
> > > > =20
> > > >  			/* force reset to complete */
> > > > -			reg_write32(hcd->regs, HC_PORTSC1, temp & ~PORT_RESET);
> > > >  			/* REVISIT:  some hardware needs 550+ usec to clear
> > > >  			 * this bit; seems too long to spin routinely...
> > > >  			 */
> > > > -			retval =3D handshake(hcd, HC_PORTSC1,
> > > > -					PORT_RESET, 0, 750);
> > > > +			retval =3D isp1760_hcd_clear_poll_timeout(hcd, PORT_RESET,
> > > > +								750);
> > > >  			if (retval !=3D 0) {
> > > >  				dev_err(hcd->self.controller, "port %d reset error %d\n",
> > > >  						wIndex + 1, retval);
> > > > @@ -1966,8 +1998,7 @@ static int isp1760_hub_control(struct usb_hcd=
 *hcd, u16 typeReq,
> > > >  			}
> > > > =20
> > > >  			/* see what we found out */
> > > > -			temp =3D check_reset_complete(hcd, wIndex,
> > > > -					reg_read32(hcd->regs, HC_PORTSC1));
> > > > +			check_reset_complete(hcd, wIndex);
> > > >  		}
> > > >  		/*
> > > >  		 * Even if OWNER is set, there's no harm letting hub_wq
> > > > @@ -1975,21 +2006,22 @@ static int isp1760_hub_control(struct usb_h=
cd *hcd, u16 typeReq,
> > > >  		 * for PORT_POWER anyway).
> > > >  		 */
> > > > =20
> > > > -		if (temp & PORT_OWNER)
> > > > +		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
> > > >  			dev_err(hcd->self.controller, "PORT_OWNER is set\n");
> > > > =20
> > > > -		if (temp & PORT_CONNECT) {
> > > > +		if (isp1760_hcd_is_set(hcd, PORT_CONNECT)) {
> > > >  			status |=3D USB_PORT_STAT_CONNECTION;
> > > >  			/* status may be from integrated TT */
> > > >  			status |=3D USB_PORT_STAT_HIGH_SPEED;
> > > >  		}
> > > > -		if (temp & PORT_PE)
> > > > +		if (isp1760_hcd_is_set(hcd, PORT_PE))
> > > >  			status |=3D USB_PORT_STAT_ENABLE;
> > > > -		if (temp & (PORT_SUSPEND|PORT_RESUME))
> > > > +		if (isp1760_hcd_is_set(hcd, PORT_SUSPEND) &&
> > > > +		    isp1760_hcd_is_set(hcd, PORT_RESUME))
> > > >  			status |=3D USB_PORT_STAT_SUSPEND;
> > > > -		if (temp & PORT_RESET)
> > > > +		if (isp1760_hcd_is_set(hcd, PORT_RESET))
> > > >  			status |=3D USB_PORT_STAT_RESET;
> > > > -		if (temp & PORT_POWER)
> > > > +		if (isp1760_hcd_is_set(hcd, PORT_POWER))
> > > >  			status |=3D USB_PORT_STAT_POWER;
> > > > =20
> > > >  		put_unaligned(cpu_to_le32(status), (__le32 *) buf);
> > > > @@ -2009,41 +2041,39 @@ static int isp1760_hub_control(struct usb_h=
cd *hcd, u16 typeReq,
> > > >  		if (!wIndex || wIndex > ports)
> > > >  			goto error;
> > > >  		wIndex--;
> > > > -		temp =3D reg_read32(hcd->regs, HC_PORTSC1);
> > > > -		if (temp & PORT_OWNER)
> > > > +		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
> > > >  			break;
> > > > =20
> > > > -/*		temp &=3D ~PORT_RWC_BITS; */
> > > >  		switch (wValue) {
> > > >  		case USB_PORT_FEAT_ENABLE:
> > > > -			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_PE);
> > > > +			isp1760_hcd_set(hcd, PORT_PE);
> > > >  			break;
> > > > =20
> > > >  		case USB_PORT_FEAT_SUSPEND:
> > > > -			if ((temp & PORT_PE) =3D=3D 0
> > > > -					|| (temp & PORT_RESET) !=3D 0)
> > > > +			if (!isp1760_hcd_is_set(hcd, PORT_PE) ||
> > > > +			    isp1760_hcd_is_set(hcd, PORT_RESET))
> > > >  				goto error;
> > > > =20
> > > > -			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_SUSPEND);
> > > > +			isp1760_hcd_set(hcd, PORT_SUSPEND);
> > > >  			break;
> > > >  		case USB_PORT_FEAT_POWER:
> > > > -			if (HCS_PPC(priv->hcs_params))
> > > > -				reg_write32(hcd->regs, HC_PORTSC1,
> > > > -							temp | PORT_POWER);
> > > > +			if (isp1760_hcd_is_set(hcd, HCS_PPC))
> > > > +				isp1760_hcd_set(hcd, PORT_POWER);
> > > >  			break;
> > > >  		case USB_PORT_FEAT_RESET:
> > > > -			if (temp & PORT_RESUME)
> > > > +			if (isp1760_hcd_is_set(hcd, PORT_RESUME))
> > > >  				goto error;
> > > >  			/* line status bits may report this as low speed,
> > > >  			 * which can be fine if this root hub has a
> > > >  			 * transaction translator built in.
> > > >  			 */
> > > > -			if ((temp & (PORT_PE|PORT_CONNECT)) =3D=3D PORT_CONNECT
> > > > -					&& PORT_USB11(temp)) {
> > > > -				temp |=3D PORT_OWNER;
> > > > +			if ((isp1760_hcd_is_set(hcd, PORT_CONNECT) &&
> > > > +			     !isp1760_hcd_is_set(hcd, PORT_PE)) &&
> > > > +			    (isp1760_hcd_read(hcd, PORT_LSTATUS) =3D=3D 1)) {
> > > > +				isp1760_hcd_set(hcd, PORT_OWNER);
> > > >  			} else {
> > > > -				temp |=3D PORT_RESET;
> > > > -				temp &=3D ~PORT_PE;
> > > > +				isp1760_hcd_set(hcd, PORT_RESET);
> > > > +				isp1760_hcd_clear(hcd, PORT_PE);
> > > > =20
> > > >  				/*
> > > >  				 * caller must wait, then call GetPortStatus
> > > > @@ -2052,12 +2082,11 @@ static int isp1760_hub_control(struct usb_h=
cd *hcd, u16 typeReq,
> > > >  				priv->reset_done =3D jiffies +
> > > >  					msecs_to_jiffies(50);
> > > >  			}
> > > > -			reg_write32(hcd->regs, HC_PORTSC1, temp);
> > > >  			break;
> > > >  		default:
> > > >  			goto error;
> > > >  		}
> > > > -		reg_read32(hcd->regs, HC_USBCMD);
> > > > +		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
> > > >  		break;
> > > > =20
> > > >  	default:
> > > > @@ -2074,14 +2103,13 @@ static int isp1760_get_frame(struct usb_hcd=
 *hcd)
> > > >  	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > >  	u32 fr;
> > > > =20
> > > > -	fr =3D reg_read32(hcd->regs, HC_FRINDEX);
> > > > +	fr =3D isp1760_hcd_read(hcd, HC_FRINDEX);
> > > >  	return (fr >> 3) % priv->periodic_size;
> > > >  }
> > > > =20
> > > >  static void isp1760_stop(struct usb_hcd *hcd)
> > > >  {
> > > >  	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
> > > > -	u32 temp;
> > > > =20
> > > >  	del_timer(&errata2_timer);
> > > > =20
> > > > @@ -2092,24 +2120,19 @@ static void isp1760_stop(struct usb_hcd *hc=
d)
> > > >  	spin_lock_irq(&priv->lock);
> > > >  	ehci_reset(hcd);
> > > >  	/* Disable IRQ */
> > > > -	temp =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL);
> > > > -	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INTR=
_EN);
> > > > +	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
> > > >  	spin_unlock_irq(&priv->lock);
> > > > =20
> > > > -	reg_write32(hcd->regs, HC_CONFIGFLAG, 0);
> > > > +	isp1760_hcd_clear(hcd, FLAG_CF);
> > > >  }
> > > > =20
> > > >  static void isp1760_shutdown(struct usb_hcd *hcd)
> > > >  {
> > > > -	u32 command, temp;
> > > > -
> > > >  	isp1760_stop(hcd);
> > > > -	temp =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL);
> > > > -	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INTR=
_EN);
> > > > =20
> > > > -	command =3D reg_read32(hcd->regs, HC_USBCMD);
> > > > -	command &=3D ~CMD_RUN;
> > > > -	reg_write32(hcd->regs, HC_USBCMD, command);
> > > > +	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
> > > > +
> > > > +	isp1760_hcd_clear(hcd, CMD_RUN);
> > > >  }
> > > > =20
> > > >  static void isp1760_clear_tt_buffer_complete(struct usb_hcd *hcd,
> > > > @@ -2182,8 +2205,8 @@ void isp1760_deinit_kmem_cache(void)
> > > >  	kmem_cache_destroy(urb_listitem_cachep);
> > > >  }
> > > > =20
> > > > -int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *r=
egs,
> > > > -			 struct resource *mem, int irq, unsigned long irqflags,
> > > > +int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource=
 *mem,
> > > > +			 int irq, unsigned long irqflags,
> > > >  			 struct device *dev)
> > > >  {
> > > >  	struct usb_hcd *hcd;
> > > > @@ -2200,7 +2223,6 @@ int isp1760_hcd_register(struct isp1760_hcd *=
priv, void __iomem *regs,
> > > >  	init_memory(priv);
> > > > =20
> > > >  	hcd->irq =3D irq;
> > > > -	hcd->regs =3D regs;
> > > >  	hcd->rsrc_start =3D mem->start;
> > > >  	hcd->rsrc_len =3D resource_size(mem);
> > > > =20
> > > > diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp176=
0/isp1760-hcd.h
> > > > index f1bb2deb1ccf..34e1899e52c4 100644
> > > > --- a/drivers/usb/isp1760/isp1760-hcd.h
> > > > +++ b/drivers/usb/isp1760/isp1760-hcd.h
> > > > @@ -3,6 +3,9 @@
> > > >  #define _ISP1760_HCD_H_
> > > > =20
> > > >  #include <linux/spinlock.h>
> > > > +#include <linux/regmap.h>
> > > > +
> > > > +#include "isp1760-regs.h"
> > > > =20
> > > >  struct isp1760_qh;
> > > >  struct isp1760_qtd;
> > > > @@ -48,10 +51,13 @@ enum isp1760_queue_head_types {
> > > >  };
> > > > =20
> > > >  struct isp1760_hcd {
> > > > -#ifdef CONFIG_USB_ISP1760_HCD
> > > >  	struct usb_hcd		*hcd;
> > > > =20
> > > > -	u32 hcs_params;
> > > > +	void __iomem		*base;
> > > > +
> > > > +	struct regmap		*regs;
> > > > +	struct regmap_field	*fields[HC_FIELD_MAX];
> > > > +
> > > >  	spinlock_t		lock;
> > > >  	struct isp1760_slotinfo	atl_slots[32];
> > > >  	int			atl_done_map;
> > > > @@ -66,20 +72,18 @@ struct isp1760_hcd {
> > > >  	unsigned		i_thresh;
> > > >  	unsigned long		reset_done;
> > > >  	unsigned long		next_statechange;
> > > > -#endif
> > > >  };
> > > > =20
> > > >  #ifdef CONFIG_USB_ISP1760_HCD
> > > > -int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *r=
egs,
> > > > -			 struct resource *mem, int irq, unsigned long irqflags,
> > > > -			 struct device *dev);
> > > > +int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource=
 *mem,
> > > > +			 int irq, unsigned long irqflags, struct device *dev);
> > > >  void isp1760_hcd_unregister(struct isp1760_hcd *priv);
> > > > =20
> > > >  int isp1760_init_kmem_once(void);
> > > >  void isp1760_deinit_kmem_cache(void);
> > > >  #else
> > > >  static inline int isp1760_hcd_register(struct isp1760_hcd *priv,
> > > > -				       void __iomem *regs, struct resource *mem,
> > > > +				       struct resource *mem,
> > > >  				       int irq, unsigned long irqflags,
> > > >  				       struct device *dev)
> > > >  {
> > > > diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760=
/isp1760-if.c
> > > > index ccd30f835888..abfba9f5ec23 100644
> > > > --- a/drivers/usb/isp1760/isp1760-if.c
> > > > +++ b/drivers/usb/isp1760/isp1760-if.c
> > > > @@ -75,9 +75,9 @@ static int isp1761_pci_init(struct pci_dev *dev)
> > > >  		/*by default host is in 16bit mode, so
> > > >  		 * io operations at this stage must be 16 bit
> > > >  		 * */
> > > > -		writel(0xface, iobase + HC_SCRATCH_REG);
> > > > +		writel(0xface, iobase + ISP176x_HC_SCRATCH);
> > > >  		udelay(100);
> > > > -		reg_data =3D readl(iobase + HC_SCRATCH_REG) & 0x0000ffff;
> > > > +		reg_data =3D readl(iobase + ISP176x_HC_SCRATCH) & 0x0000ffff;
> > > >  		retry_count--;
> > > >  	}
> > > > =20
> > > > diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp17=
60/isp1760-regs.h
> > > > index fedc4f5cded0..42ee4404c90b 100644
> > > > --- a/drivers/usb/isp1760/isp1760-regs.h
> > > > +++ b/drivers/usb/isp1760/isp1760-regs.h
> > > > @@ -10,218 +10,286 @@
> > > >   *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >   */
> > > > =20
> > > > -#ifndef _ISP1760_REGS_H_
> > > > -#define _ISP1760_REGS_H_
> > > > +#ifndef _ISP176x_REGS_H_
> > > > +#define _ISP176x_REGS_H_
> > > > +
> > > > +#include <linux/regmap.h>
> > > > =20
> > > >  /* ---------------------------------------------------------------=
--------------
> > > >   * Host Controller
> > > >   */
> > > > =20
> > > >  /* EHCI capability registers */
> > > > -#define HC_CAPLENGTH		0x000
> > > > -#define HC_LENGTH(p)		(((p) >> 00) & 0x00ff)	/* bits 7:0 */
> > > > -#define HC_VERSION(p)		(((p) >> 16) & 0xffff)	/* bits 31:16 */
> > > > -
> > > > -#define HC_HCSPARAMS		0x004
> > > > -#define HCS_INDICATOR(p)	((p) & (1 << 16))	/* true: has port indic=
ators */
> > > > -#define HCS_PPC(p)		((p) & (1 << 4))	/* true: port power control *=
/
> > > > -#define HCS_N_PORTS(p)		(((p) >> 0) & 0xf)	/* bits 3:0, ports on H=
C */
> > > > -
> > > > -#define HC_HCCPARAMS		0x008
> > > > -#define HCC_ISOC_CACHE(p)       ((p) & (1 << 7))	/* true: can cach=
e isoc frame */
> > > > -#define HCC_ISOC_THRES(p)       (((p) >> 4) & 0x7)	/* bits 6:4, uf=
rames cached */
> > > > +#define ISP176x_HC_CAPLENGTH		0x000
> > > > +#define ISP176x_HC_VERSION		0x002
> > > > +#define ISP176x_HC_HCSPARAMS		0x004
> > > > +#define ISP176x_HC_HCCPARAMS		0x008
> > > > =20
> > > >  /* EHCI operational registers */
> > > > -#define HC_USBCMD		0x020
> > > > -#define CMD_LRESET		(1 << 7)		/* partial reset (no ports, etc) */
> > > > -#define CMD_RESET		(1 << 1)		/* reset HC not bus */
> > > > -#define CMD_RUN			(1 << 0)		/* start/stop HC */
> > > > -
> > > > -#define HC_USBSTS		0x024
> > > > -#define STS_PCD			(1 << 2)		/* port change detect */
> > > > -
> > > > -#define HC_FRINDEX		0x02c
> > > > -
> > > > -#define HC_CONFIGFLAG		0x060
> > > > -#define FLAG_CF			(1 << 0)		/* true: we'll support "high speed" */
> > > > -
> > > > -#define HC_PORTSC1		0x064
> > > > -#define PORT_OWNER		(1 << 13)		/* true: companion hc owns this por=
t */
> > > > -#define PORT_POWER		(1 << 12)		/* true: has power (see PPC) */
> > > > -#define PORT_USB11(x)		(((x) & (3 << 10)) =3D=3D (1 << 10))	/* USB=
 1.1 device */
> > > > -#define PORT_RESET		(1 << 8)		/* reset port */
> > > > -#define PORT_SUSPEND		(1 << 7)		/* suspend port */
> > > > -#define PORT_RESUME		(1 << 6)		/* resume it */
> > > > -#define PORT_PE			(1 << 2)		/* port enable */
> > > > -#define PORT_CSC		(1 << 1)		/* connect status change */
> > > > -#define PORT_CONNECT		(1 << 0)		/* device connected */
> > > > -#define PORT_RWC_BITS		(PORT_CSC)
> > > > -
> > > > -#define HC_ISO_PTD_DONEMAP_REG	0x130
> > > > -#define HC_ISO_PTD_SKIPMAP_REG	0x134
> > > > -#define HC_ISO_PTD_LASTPTD_REG	0x138
> > > > -#define HC_INT_PTD_DONEMAP_REG	0x140
> > > > -#define HC_INT_PTD_SKIPMAP_REG	0x144
> > > > -#define HC_INT_PTD_LASTPTD_REG	0x148
> > > > -#define HC_ATL_PTD_DONEMAP_REG	0x150
> > > > -#define HC_ATL_PTD_SKIPMAP_REG	0x154
> > > > -#define HC_ATL_PTD_LASTPTD_REG	0x158
> > > > +#define ISP176x_HC_USBCMD		0x020
> > > > +#define ISP176x_HC_USBSTS		0x024
> > > > +#define ISP176x_HC_FRINDEX		0x02c
> > > > +
> > > > +#define ISP176x_HC_CONFIGFLAG		0x060
> > > > +#define ISP176x_HC_PORTSC1		0x064
> > > > +
> > > > +#define ISP176x_HC_ISO_PTD_DONEMAP	0x130
> > > > +#define ISP176x_HC_ISO_PTD_SKIPMAP	0x134
> > > > +#define ISP176x_HC_ISO_PTD_LASTPTD	0x138
> > > > +#define ISP176x_HC_INT_PTD_DONEMAP	0x140
> > > > +#define ISP176x_HC_INT_PTD_SKIPMAP	0x144
> > > > +#define ISP176x_HC_INT_PTD_LASTPTD	0x148
> > > > +#define ISP176x_HC_ATL_PTD_DONEMAP	0x150
> > > > +#define ISP176x_HC_ATL_PTD_SKIPMAP	0x154
> > > > +#define ISP176x_HC_ATL_PTD_LASTPTD	0x158
> > > > =20
> > > >  /* Configuration Register */
> > > > -#define HC_HW_MODE_CTRL		0x300
> > > > -#define ALL_ATX_RESET		(1 << 31)
> > > > -#define HW_ANA_DIGI_OC		(1 << 15)
> > > > -#define HW_DEV_DMA		(1 << 11)
> > > > -#define HW_COMN_IRQ		(1 << 10)
> > > > -#define HW_COMN_DMA		(1 << 9)
> > > > -#define HW_DATA_BUS_32BIT	(1 << 8)
> > > > -#define HW_DACK_POL_HIGH	(1 << 6)
> > > > -#define HW_DREQ_POL_HIGH	(1 << 5)
> > > > -#define HW_INTR_HIGH_ACT	(1 << 2)
> > > > -#define HW_INTR_EDGE_TRIG	(1 << 1)
> > > > -#define HW_GLOBAL_INTR_EN	(1 << 0)
> > > > -
> > > > -#define HC_CHIP_ID_REG		0x304
> > > > -#define HC_SCRATCH_REG		0x308
> > > > -
> > > > -#define HC_RESET_REG		0x30c
> > > > -#define SW_RESET_RESET_HC	(1 << 1)
> > > > -#define SW_RESET_RESET_ALL	(1 << 0)
> > > > -
> > > > -#define HC_BUFFER_STATUS_REG	0x334
> > > > -#define ISO_BUF_FILL		(1 << 2)
> > > > -#define INT_BUF_FILL		(1 << 1)
> > > > -#define ATL_BUF_FILL		(1 << 0)
> > > > -
> > > > -#define HC_MEMORY_REG		0x33c
> > > > -#define ISP_BANK(x)		((x) << 16)
> > > > -
> > > > -#define HC_PORT1_CTRL		0x374
> > > > -#define PORT1_POWER		(3 << 3)
> > > > -#define PORT1_INIT1		(1 << 7)
> > > > -#define PORT1_INIT2		(1 << 23)
> > > > -#define HW_OTG_CTRL_SET		0x374
> > > > -#define HW_OTG_CTRL_CLR		0x376
> > > > -#define HW_OTG_DISABLE		(1 << 10)
> > > > -#define HW_OTG_SE0_EN		(1 << 9)
> > > > -#define HW_BDIS_ACON_EN		(1 << 8)
> > > > -#define HW_SW_SEL_HC_DC		(1 << 7)
> > > > -#define HW_VBUS_CHRG		(1 << 6)
> > > > -#define HW_VBUS_DISCHRG		(1 << 5)
> > > > -#define HW_VBUS_DRV		(1 << 4)
> > > > -#define HW_SEL_CP_EXT		(1 << 3)
> > > > -#define HW_DM_PULLDOWN		(1 << 2)
> > > > -#define HW_DP_PULLDOWN		(1 << 1)
> > > > -#define HW_DP_PULLUP		(1 << 0)
> > > > +#define ISP176x_HC_HW_MODE_CTRL		0x300
> > > > +#define ISP176x_HC_CHIP_ID		0x304
> > > > +#define ISP176x_HC_SCRATCH		0x308
> > > > +#define ISP176x_HC_RESET		0x30c
> > > > +#define ISP176x_HC_BUFFER_STATUS	0x334
> > > > +#define ISP176x_HC_MEMORY		0x33c
> > > > =20
> > > >  /* Interrupt Register */
> > > > -#define HC_INTERRUPT_REG	0x310
> > > > -
> > > > -#define HC_INTERRUPT_ENABLE	0x314
> > > > -#define HC_ISO_INT		(1 << 9)
> > > > -#define HC_ATL_INT		(1 << 8)
> > > > -#define HC_INTL_INT		(1 << 7)
> > > > -#define HC_EOT_INT		(1 << 3)
> > > > -#define HC_SOT_INT		(1 << 1)
> > > > -#define INTERRUPT_ENABLE_MASK	(HC_INTL_INT | HC_ATL_INT)
> > > > -
> > > > -#define HC_ISO_IRQ_MASK_OR_REG	0x318
> > > > -#define HC_INT_IRQ_MASK_OR_REG	0x31c
> > > > -#define HC_ATL_IRQ_MASK_OR_REG	0x320
> > > > -#define HC_ISO_IRQ_MASK_AND_REG	0x324
> > > > -#define HC_INT_IRQ_MASK_AND_REG	0x328
> > > > -#define HC_ATL_IRQ_MASK_AND_REG	0x32c
> > > > +#define ISP176x_HC_INTERRUPT		0x310
> > > > +#define ISP176x_HC_INTERRUPT_ENABLE	0x314
> > > > +#define ISP176x_HC_ISO_IRQ_MASK_OR	0x318
> > > > +#define ISP176x_HC_INT_IRQ_MASK_OR	0x31c
> > > > +#define ISP176x_HC_ATL_IRQ_MASK_OR	0x320
> > > > +#define ISP176x_HC_ISO_IRQ_MASK_AND	0x324
> > > > +#define ISP176x_HC_INT_IRQ_MASK_AND	0x328
> > > > +#define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
> > > > +
> > > > +static const struct regmap_range isp176x_hc_volatile_ranges[] =3D =
{
> > > > +	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
> > > > +	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
> > > > +	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_ATL_IRQ_MASK_AN=
D),
> > > > +};
> > > > +
> > > > +static const struct regmap_access_table isp176x_hc_volatile_table =
=3D {
> > > > +	.yes_ranges	=3D isp176x_hc_volatile_ranges,
> > > > +	.n_yes_ranges	=3D ARRAY_SIZE(isp176x_hc_volatile_ranges),
> > > > +};
> > >
> > > These belong to a .c file.
> >=20
> > yup, can move them and all below.
> >=20
> > >
> > > > +
> > > > +enum isp176x_host_controller_fields {
> > > > +	/* HC_HCSPARAMS */
> > > > +	HCS_PPC, HCS_N_PORTS,
> > > > +	/* HC_HCCPARAMS */
> > > > +	HCC_ISOC_CACHE, HCC_ISOC_THRES,
> > > > +	/* HC_USBCMD */
> > > > +	CMD_LRESET, CMD_RESET, CMD_RUN,
> > > > +	/* HC_USBSTS */
> > > > +	STS_PCD,
> > > > +	/* HC_FRINDEX */
> > > > +	HC_FRINDEX,
> > > > +	/* HC_CONFIGFLAG */
> > > > +	FLAG_CF,
> > > > +	/* HC_PORTSC1 */
> > > > +	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
> > > > +	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
> > > > +	/* HC_HW_MODE_CTRL */
> > > > +	ALL_ATX_RESET, HW_ANA_DIGI_OC, HW_DEV_DMA, HW_COMN_IRQ, HW_COMN_D=
MA,
> > > > +	HW_DATA_BUS_WIDTH, HW_DACK_POL_HIGH, HW_DREQ_POL_HIGH, HW_INTR_HI=
GH_ACT,
> > > > +	HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
> > > > +	/* HC_RESET */
> > > > +	SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
> > > > +	/* HC_BUFFER_STATUS */
> > > > +	INT_BUF_FILL, ATL_BUF_FILL,
> > > > +	/* HC_MEMORY */
> > > > +	MEM_BANK_SEL, MEM_START_ADDR,
> > > > +	/* HC_INTERRUPT_ENABLE */
> > > > +	HC_INT_ENABLE,
> > > > +	/* Last element */
> > > > +	HC_FIELD_MAX,
> > > > +};
> > > > +
> > > > +static const struct reg_field isp1760_hc_reg_fields[] =3D {
> > > > +	[HCS_PPC]		=3D REG_FIELD(ISP176x_HC_HCSPARAMS, 4, 4),
> > > > +	[HCS_N_PORTS]		=3D REG_FIELD(ISP176x_HC_HCSPARAMS, 0, 3),
> > > > +	[HCC_ISOC_CACHE]	=3D REG_FIELD(ISP176x_HC_HCCPARAMS, 7, 7),
> > > > +	[HCC_ISOC_THRES]	=3D REG_FIELD(ISP176x_HC_HCCPARAMS, 4, 6),
> > > > +	[CMD_LRESET]		=3D REG_FIELD(ISP176x_HC_USBCMD, 7, 7),
> > > > +	[CMD_RESET]		=3D REG_FIELD(ISP176x_HC_USBCMD, 1, 1),
> > > > +	[CMD_RUN]		=3D REG_FIELD(ISP176x_HC_USBCMD, 0, 0),
> > > > +	[STS_PCD]		=3D REG_FIELD(ISP176x_HC_USBSTS, 2, 2),
> > > > +	[HC_FRINDEX]		=3D REG_FIELD(ISP176x_HC_FRINDEX, 0, 13),
> > > > +	[FLAG_CF]		=3D REG_FIELD(ISP176x_HC_CONFIGFLAG, 0, 0),
> > > > +	[PORT_OWNER]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 13, 13),
> > > > +	[PORT_POWER]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 12, 12),
> > > > +	[PORT_LSTATUS]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 10, 11),
> > > > +	[PORT_RESET]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 8, 8),
> > > > +	[PORT_SUSPEND]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 7, 7),
> > > > +	[PORT_RESUME]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 6, 6),
> > > > +	[PORT_PE]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 2, 2),
> > > > +	[PORT_CSC]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 1, 1),
> > > > +	[PORT_CONNECT]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 0, 0),
> > > > +	[ALL_ATX_RESET]		=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 31, 31),
> > > > +	[HW_ANA_DIGI_OC]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 15, 15),
> > > > +	[HW_COMN_IRQ]		=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 10, 10),
> > > > +	[HW_DATA_BUS_WIDTH]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 8, 8),
> > > > +	[HW_DACK_POL_HIGH]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 6, 6),
> > > > +	[HW_DREQ_POL_HIGH]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 5, 5),
> > > > +	[HW_INTR_HIGH_ACT]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 2, 2),
> > > > +	[HW_INTR_EDGE_TRIG]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 1, 1),
> > > > +	[HW_GLOBAL_INTR_EN]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 0, 0),
> > > > +	[SW_RESET_RESET_ALL]	=3D REG_FIELD(ISP176x_HC_RESET, 0, 0),
> > > > +	[INT_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 1, 1),
> > > > +	[ATL_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 0, 0),
> > > > +	[MEM_BANK_SEL]		=3D REG_FIELD(ISP176x_HC_MEMORY, 16, 17),
> > > > +	[MEM_START_ADDR]	=3D REG_FIELD(ISP176x_HC_MEMORY, 0, 15),
> > > > +	[HC_INT_ENABLE]		=3D REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 8)=
,
> > > > +};
> > >
> > > This too.
> > >
> > > > =20
> > > >  /* ---------------------------------------------------------------=
--------------
> > > >   * Peripheral Controller
> > > >   */
> > > > =20
> > > > -/* Initialization Registers */
> > > > -#define DC_ADDRESS			0x0200
> > > > -#define DC_DEVEN			(1 << 7)
> > > > -
> > > > -#define DC_MODE				0x020c
> > > > -#define DC_DMACLKON			(1 << 9)
> > > > -#define DC_VBUSSTAT			(1 << 8)
> > > > -#define DC_CLKAON			(1 << 7)
> > > > -#define DC_SNDRSU			(1 << 6)
> > > > -#define DC_GOSUSP			(1 << 5)
> > > > -#define DC_SFRESET			(1 << 4)
> > > > -#define DC_GLINTENA			(1 << 3)
> > > > -#define DC_WKUPCS			(1 << 2)
> > > > -
> > > > -#define DC_INTCONF			0x0210
> > > > -#define DC_CDBGMOD_ACK_NAK		(0 << 6)
> > > > -#define DC_CDBGMOD_ACK			(1 << 6)
> > > > -#define DC_CDBGMOD_ACK_1NAK		(2 << 6)
> > > > -#define DC_DDBGMODIN_ACK_NAK		(0 << 4)
> > > > -#define DC_DDBGMODIN_ACK		(1 << 4)
> > > > -#define DC_DDBGMODIN_ACK_1NAK		(2 << 4)
> > > > -#define DC_DDBGMODOUT_ACK_NYET_NAK	(0 << 2)
> > > > -#define DC_DDBGMODOUT_ACK_NYET		(1 << 2)
> > > > -#define DC_DDBGMODOUT_ACK_NYET_1NAK	(2 << 2)
> > > > -#define DC_INTLVL			(1 << 1)
> > > > -#define DC_INTPOL			(1 << 0)
> > > > -
> > > > -#define DC_DEBUG			0x0212
> > > > -#define DC_INTENABLE			0x0214
> > > >  #define DC_IEPTX(n)			(1 << (11 + 2 * (n)))
> > > >  #define DC_IEPRX(n)			(1 << (10 + 2 * (n)))
> > > >  #define DC_IEPRXTX(n)			(3 << (10 + 2 * (n)))
> > > > -#define DC_IEP0SETUP			(1 << 8)
> > > > -#define DC_IEVBUS			(1 << 7)
> > > > -#define DC_IEDMA			(1 << 6)
> > > > -#define DC_IEHS_STA			(1 << 5)
> > > > -#define DC_IERESM			(1 << 4)
> > > > -#define DC_IESUSP			(1 << 3)
> > > > -#define DC_IEPSOF			(1 << 2)
> > > > -#define DC_IESOF			(1 << 1)
> > > > -#define DC_IEBRST			(1 << 0)
> > > > +
> > > > +#define ISP176x_DC_ENDPTYP_ISOC		0x01
> > > > +#define ISP176x_DC_ENDPTYP_BULK		0x02
> > > > +#define ISP176x_DC_ENDPTYP_INTERRUPT	0x03
> > > > +
> > > > +/* Initialization Registers */
> > > > +#define ISP176x_DC_ADDRESS		0x0200
> > > > +#define ISP176x_DC_MODE			0x020c
> > > > +#define ISP176x_DC_INTCONF		0x0210
> > > > +#define ISP176x_DC_DEBUG		0x0212
> > > > +#define ISP176x_DC_INTENABLE		0x0214
> > > > =20
> > > >  /* Data Flow Registers */
> > > > -#define DC_EPINDEX			0x022c
> > > > -#define DC_EP0SETUP			(1 << 5)
> > > > -#define DC_ENDPIDX(n)			((n) << 1)
> > > > -#define DC_EPDIR			(1 << 0)
> > > > -
> > > > -#define DC_CTRLFUNC			0x0228
> > > > -#define DC_CLBUF			(1 << 4)
> > > > -#define DC_VENDP			(1 << 3)
> > > > -#define DC_DSEN				(1 << 2)
> > > > -#define DC_STATUS			(1 << 1)
> > > > -#define DC_STALL			(1 << 0)
> > > > -
> > > > -#define DC_DATAPORT			0x0220
> > > > -#define DC_BUFLEN			0x021c
> > > > -#define DC_DATACOUNT_MASK		0xffff
> > > > -#define DC_BUFSTAT			0x021e
> > > > -#define DC_EPMAXPKTSZ			0x0204
> > > > -
> > > > -#define DC_EPTYPE			0x0208
> > > > -#define DC_NOEMPKT			(1 << 4)
> > > > -#define DC_EPENABLE			(1 << 3)
> > > > -#define DC_DBLBUF			(1 << 2)
> > > > -#define DC_ENDPTYP_ISOC			(1 << 0)
> > > > -#define DC_ENDPTYP_BULK			(2 << 0)
> > > > -#define DC_ENDPTYP_INTERRUPT		(3 << 0)
> > > > +#define ISP176x_DC_EPMAXPKTSZ		0x0204
> > > > +#define ISP176x_DC_EPTYPE		0x0208
> > > > +
> > > > +#define ISP176x_DC_BUFLEN		0x021c
> > > > +#define ISP176x_DC_BUFSTAT		0x021e
> > > > +#define ISP176x_DC_DATAPORT		0x0220
> > > > +
> > > > +#define ISP176x_DC_CTRLFUNC		0x0228
> > > > +#define ISP176x_DC_EPINDEX		0x022c
> > > > +
> > > > +#define ISP1761_DC_OTG_CTRL_SET			0x374
> > > > +#define ISP1761_DC_OTG_CTRL_CLEAR		0x376
> > > > =20
> > > >  /* DMA Registers */
> > > > -#define DC_DMACMD			0x0230
> > > > -#define DC_DMATXCOUNT			0x0234
> > > > -#define DC_DMACONF			0x0238
> > > > -#define DC_DMAHW			0x023c
> > > > -#define DC_DMAINTREASON			0x0250
> > > > -#define DC_DMAINTEN			0x0254
> > > > -#define DC_DMAEP			0x0258
> > > > -#define DC_DMABURSTCOUNT		0x0264
> > > > +#define ISP176x_DC_DMACMD		0x0230
> > > > +#define ISP176x_DC_DMATXCOUNT		0x0234
> > > > +#define ISP176x_DC_DMACONF		0x0238
> > > > +#define ISP176x_DC_DMAHW		0x023c
> > > > +#define ISP176x_DC_DMAINTREASON		0x0250
> > > > +#define ISP176x_DC_DMAINTEN		0x0254
> > > > +#define ISP176x_DC_DMAEP		0x0258
> > > > +#define ISP176x_DC_DMABURSTCOUNT	0x0264
> > > > =20
> > > >  /* General Registers */
> > > > -#define DC_INTERRUPT			0x0218
> > > > -#define DC_CHIPID			0x0270
> > > > -#define DC_FRAMENUM			0x0274
> > > > -#define DC_SCRATCH			0x0278
> > > > -#define DC_UNLOCKDEV			0x027c
> > > > -#define DC_INTPULSEWIDTH		0x0280
> > > > -#define DC_TESTMODE			0x0284
> > > > +#define ISP176x_DC_INTERRUPT		0x0218
> > > > +#define ISP176x_DC_CHIPID		0x0270
> > > > +#define ISP176x_DC_FRAMENUM		0x0274
> > > > +#define ISP176x_DC_SCRATCH		0x0278
> > > > +#define ISP176x_DC_UNLOCKDEV		0x027c
> > > > +#define ISP176x_DC_INTPULSEWIDTH	0x0280
> > > > +#define ISP176x_DC_TESTMODE		0x0284
> > > > +
> > > > +static const struct regmap_range isp176x_dc_volatile_ranges[] =3D =
{
> > > > +	regmap_reg_range(ISP176x_DC_EPMAXPKTSZ, ISP176x_DC_EPTYPE),
> > > > +	regmap_reg_range(ISP176x_DC_BUFLEN, ISP176x_DC_EPINDEX),
> > > > +	regmap_reg_range(ISP1761_DC_OTG_CTRL_SET, ISP1761_DC_OTG_CTRL_CLE=
AR),
> > > > +};
> > > > +
> > > > +static const struct regmap_access_table isp176x_dc_volatile_table =
=3D {
> > > > +	.yes_ranges	=3D isp176x_dc_volatile_ranges,
> > > > +	.n_yes_ranges	=3D ARRAY_SIZE(isp176x_dc_volatile_ranges),
> > > > +};
> > > > +
> > > > +enum isp176x_device_controller_fields {
> > > > +	/* DC_ADDRESS */
> > > > +	DC_DEVEN, DC_DEVADDR,
> > > > +	/* DC_MODE */
> > > > +	DC_VBUSSTAT, DC_SFRESET, DC_GLINTENA,
> > > > +	/* DC_INTCONF */
> > > > +	DC_CDBGMOD_ACK, DC_DDBGMODIN_ACK, DC_DDBGMODOUT_ACK, DC_INTPOL,
> > > > +	/* DC_INTENABLE */
> > > > +	DC_IEPRXTX_7, DC_IEPRXTX_6, DC_IEPRXTX_5, DC_IEPRXTX_4, DC_IEPRXT=
X_3,
> > > > +	DC_IEPRXTX_2, DC_IEPRXTX_1, DC_IEPRXTX_0,
> > > > +	DC_IEP0SETUP, DC_IEVBUS, DC_IEHS_STA, DC_IERESM, DC_IESUSP, DC_IE=
BRST,
> > > > +	/* DC_EPINDEX */
> > > > +	DC_EP0SETUP, DC_ENDPIDX, DC_EPDIR,
> > > > +	/* DC_CTRLFUNC */
> > > > +	DC_CLBUF, DC_VENDP, DC_DSEN, DC_STATUS, DC_STALL,
> > > > +	/* DC_BUFLEN */
> > > > +	DC_BUFLEN,
> > > > +	/* DC_EPMAXPKTSZ */
> > > > +	DC_FFOSZ,
> > > > +	/* DC_EPTYPE */
> > > > +	DC_EPENABLE, DC_ENDPTYP,
> > > > +	/* DC_FRAMENUM */
> > > > +	DC_FRAMENUM, DC_UFRAMENUM,
> > > > +	/* HW_OTG_CTRL_SET */
> > > > +	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
> > > > +	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP,
> > > > +	/* HW_OTG_CTRL_CLR */
> > > > +	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
> > > > +	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
> > > > +	HW_DP_PULLUP_CLEAR,
> > > > +	/* Last element */
> > > > +	DC_FIELD_MAX,
> > > > +};
> > > > +
> > > > +static const struct reg_field isp1761_dc_reg_fields[] =3D {
> > > > +	[DC_DEVEN]		=3D REG_FIELD(ISP176x_DC_ADDRESS, 7, 7),
> > > > +	[DC_DEVADDR]		=3D REG_FIELD(ISP176x_DC_ADDRESS, 0, 6),
> > > > +	[DC_VBUSSTAT]		=3D REG_FIELD(ISP176x_DC_MODE, 8, 8),
> > > > +	[DC_SFRESET]		=3D REG_FIELD(ISP176x_DC_MODE, 4, 4),
> > > > +	[DC_GLINTENA]		=3D REG_FIELD(ISP176x_DC_MODE, 3, 3),
> > > > +	[DC_CDBGMOD_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 6, 6),
> > > > +	[DC_DDBGMODIN_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 4, 4),
> > > > +	[DC_DDBGMODOUT_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 2, 2),
> > > > +	[DC_INTPOL]		=3D REG_FIELD(ISP176x_DC_INTCONF, 0, 0),
> > > > +	[DC_IEPRXTX_7]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 25, 25),
> > > > +	[DC_IEPRXTX_6]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 23, 23),
> > > > +	[DC_IEPRXTX_5]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 21, 21),
> > > > +	[DC_IEPRXTX_4]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 19, 19),
> > > > +	[DC_IEPRXTX_3]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 17, 17),
> > > > +	[DC_IEPRXTX_2]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 15, 15),
> > > > +	[DC_IEPRXTX_1]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 13, 13),
> > > > +	[DC_IEPRXTX_0]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 11, 11),
> > > > +	[DC_IEP0SETUP]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 8, 8),
> > > > +	[DC_IEVBUS]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 7, 7),
> > > > +	[DC_IEHS_STA]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 5, 5),
> > > > +	[DC_IERESM]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 4, 4),
> > > > +	[DC_IESUSP]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 3, 3),
> > > > +	[DC_IEBRST]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 0, 0),
> > > > +	[DC_EP0SETUP]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 5, 5),
> > > > +	[DC_ENDPIDX]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 1, 4),
> > > > +	[DC_EPDIR]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 0, 0),
> > > > +	[DC_CLBUF]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 4, 4),
> > > > +	[DC_VENDP]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 3, 3),
> > > > +	[DC_DSEN]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 2, 2),
> > > > +	[DC_STATUS]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 1, 1),
> > > > +	[DC_STALL]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 0, 0),
> > > > +	[DC_BUFLEN]		=3D REG_FIELD(ISP176x_DC_BUFLEN, 0, 15),
> > > > +	[DC_FFOSZ]		=3D REG_FIELD(ISP176x_DC_EPMAXPKTSZ, 0, 10),
> > > > +	[DC_EPENABLE]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 3, 3),
> > > > +	[DC_ENDPTYP]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 0, 1),
> > > > +	[DC_UFRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 11, 13),
> > > > +	[DC_FRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
> > > > +	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 10, 10),
> > > > +	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7, 7),
> > > > +	[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4, 4),
> > > > +	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3, 3),
> > > > +	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2, 2),
> > > > +	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1, 1),
> > > > +	[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0, 0),
> > > > +	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10)=
,
> > > > +	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
> > > > +	[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
> > > > +	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
> > > > +	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
> > > > +	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
> > > > +	[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
> > > > +};
> > > > =20
> > > >  #endif
> > > > diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp176=
0/isp1760-udc.c
> > > > index 1714b2258b54..1ce21ef291b6 100644
> > > > --- a/drivers/usb/isp1760/isp1760-udc.c
> > > > +++ b/drivers/usb/isp1760/isp1760-udc.c
> > > > @@ -45,16 +45,62 @@ static inline struct isp1760_request *req_to_ud=
c_req(struct usb_request *req)
> > > >  	return container_of(req, struct isp1760_request, req);
> > > >  }
> > > > =20
> > > > -static inline u32 isp1760_udc_read(struct isp1760_udc *udc, u16 re=
g)
> > > > +static u32 isp1760_udc_read(struct isp1760_udc *udc, u16 field)
> > > >  {
> > > > -	return isp1760_read32(udc->regs, reg);
> > > > +	return isp1760_field_read(udc->fields, field);
> > > >  }
> > > > =20
> > > > -static inline void isp1760_udc_write(struct isp1760_udc *udc, u16 =
reg, u32 val)
> > > > +static void isp1760_udc_write(struct isp1760_udc *udc, u16 field, =
u32 val)
> > > >  {
> > > > -	isp1760_write32(udc->regs, reg, val);
> > > > +	isp1760_field_write(udc->fields, field, val);
> > > >  }
> > > > =20
> > > > +static u32 isp1760_udc_read_raw(struct isp1760_udc *udc, u16 reg)
> > > > +{
> > > > +	u32 val;
> > > > +
> > > > +	regmap_raw_read(udc->regs, reg, &val, 4);
> > > > +
> > > > +	return le32_to_cpu(val);
> > > > +}
> > > > +
> > > > +static u16 isp1760_udc_read_raw16(struct isp1760_udc *udc, u16 reg=
)
> > > > +{
> > > > +	u16 val;
> > > > +
> > > > +	regmap_raw_read(udc->regs, reg, &val, 2);
> > > > +
> > > > +	return le16_to_cpu(val);
> > > > +}
> > > > +
> > > > +static void isp1760_udc_write_raw(struct isp1760_udc *udc, u16 reg=
, u32 val)
> > > > +{
> > > > +	val =3D cpu_to_le32(val);
> > > > +
> > > > +	regmap_raw_write(udc->regs, reg, &val, 4);
> > > > +}
> > > > +
> > > > +static void isp1760_udc_write_raw16(struct isp1760_udc *udc, u16 r=
eg, u16 val)
> > > > +{
> > > > +	val =3D cpu_to_le16(val);
> > > > +
> > > > +	regmap_raw_write(udc->regs, reg, &val, 2);
> > > > +}
> > > > +
> > > > +static void isp1760_udc_set(struct isp1760_udc *udc, u32 field)
> > > > +{
> > > > +	isp1760_udc_write(udc, field, 0xFFFFFFFF);
> > > > +}
> > > > +
> > > > +static void isp1760_udc_clear(struct isp1760_udc *udc, u32 field)
> > > > +{
> > > > +	isp1760_udc_write(udc, field, 0);
> > > > +}
> > > > +
> > > > +static bool isp1760_udc_is_set(struct isp1760_udc *udc, u32 field)
> > > > +{
> > > > +	return !!isp1760_udc_read(udc, field);
> > > > +}
> > > >  /* ---------------------------------------------------------------=
--------------
> > > >   * Endpoint Management
> > > >   */
> > > > @@ -75,11 +121,15 @@ static struct isp1760_ep *isp1760_udc_find_ep(=
struct isp1760_udc *udc,
> > > >  	return NULL;
> > > >  }
> > > > =20
> > > > -static void __isp1760_udc_select_ep(struct isp1760_ep *ep, int dir=
)
> > > > +static void __isp1760_udc_select_ep(struct isp1760_udc *udc,
> > > > +				    struct isp1760_ep *ep, int dir)
> > > >  {
> > > > -	isp1760_udc_write(ep->udc, DC_EPINDEX,
> > > > -			  DC_ENDPIDX(ep->addr & USB_ENDPOINT_NUMBER_MASK) |
> > > > -			  (dir =3D=3D USB_DIR_IN ? DC_EPDIR : 0));
> > > > +	isp1760_udc_write(udc, DC_ENDPIDX, ep->addr & USB_ENDPOINT_NUMBER=
_MASK);
> > > > +
> > > > +	if (dir =3D=3D USB_DIR_IN)
> > > > +		isp1760_udc_set(udc, DC_EPDIR);
> > > > +	else
> > > > +		isp1760_udc_clear(udc, DC_EPDIR);
> > > >  }
> > > > =20
> > > >  /**
> > > > @@ -93,9 +143,10 @@ static void __isp1760_udc_select_ep(struct isp1=
760_ep *ep, int dir)
> > > >   *
> > > >   * Called with the UDC spinlock held.
> > > >   */
> > > > -static void isp1760_udc_select_ep(struct isp1760_ep *ep)
> > > > +static void isp1760_udc_select_ep(struct isp1760_udc *udc,
> > > > +				  struct isp1760_ep *ep)
> > > >  {
> > > > -	__isp1760_udc_select_ep(ep, ep->addr & USB_ENDPOINT_DIR_MASK);
> > > > +	__isp1760_udc_select_ep(udc, ep, ep->addr & USB_ENDPOINT_DIR_MASK=
);
> > > >  }
> > > > =20
> > > >  /* Called with the UDC spinlock held. */
> > > > @@ -108,9 +159,13 @@ static void isp1760_udc_ctrl_send_status(struc=
t isp1760_ep *ep, int dir)
> > > >  	 * the direction opposite to the data stage data packets, we thus=
 need
> > > >  	 * to select the OUT/IN endpoint for IN/OUT transfers.
> > > >  	 */
> > > > -	isp1760_udc_write(udc, DC_EPINDEX, DC_ENDPIDX(0) |
> > > > -			  (dir =3D=3D USB_DIR_IN ? 0 : DC_EPDIR));
> > > > -	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STATUS);
> > > > +	if (dir =3D=3D USB_DIR_IN)
> > > > +		isp1760_udc_clear(udc, DC_EPDIR);
> > > > +	else
> > > > +		isp1760_udc_set(udc, DC_EPDIR);
> > > > +
> > > > +	isp1760_udc_write(udc, DC_ENDPIDX, 1);
> > > > +	isp1760_udc_set(udc, DC_STATUS);
> > > > =20
> > > >  	/*
> > > >  	 * The hardware will terminate the request automatically and go b=
ack to
> > > > @@ -157,10 +212,10 @@ static void isp1760_udc_ctrl_send_stall(struc=
t isp1760_ep *ep)
> > > >  	spin_lock_irqsave(&udc->lock, flags);
> > > > =20
> > > >  	/* Stall both the IN and OUT endpoints. */
> > > > -	__isp1760_udc_select_ep(ep, USB_DIR_OUT);
> > > > -	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STALL);
> > > > -	__isp1760_udc_select_ep(ep, USB_DIR_IN);
> > > > -	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STALL);
> > > > +	__isp1760_udc_select_ep(udc, ep, USB_DIR_OUT);
> > > > +	isp1760_udc_set(udc, DC_STALL);
> > > > +	__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
> > > > +	isp1760_udc_set(udc, DC_STALL);
> > > > =20
> > > >  	/* A protocol stall completes the control transaction. */
> > > >  	udc->ep0_state =3D ISP1760_CTRL_SETUP;
> > > > @@ -181,8 +236,8 @@ static bool isp1760_udc_receive(struct isp1760_=
ep *ep,
> > > >  	u32 *buf;
> > > >  	int i;
> > > > =20
> > > > -	isp1760_udc_select_ep(ep);
> > > > -	len =3D isp1760_udc_read(udc, DC_BUFLEN) & DC_DATACOUNT_MASK;
> > > > +	isp1760_udc_select_ep(udc, ep);
> > > > +	len =3D isp1760_udc_read(udc, DC_BUFLEN);
> > > > =20
> > > >  	dev_dbg(udc->isp->dev, "%s: received %u bytes (%u/%u done)\n",
> > > >  		__func__, len, req->req.actual, req->req.length);
> > > > @@ -198,7 +253,7 @@ static bool isp1760_udc_receive(struct isp1760_=
ep *ep,
> > > >  		 * datasheet doesn't clearly document how this should be
> > > >  		 * handled.
> > > >  		 */
> > > > -		isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
> > > > +		isp1760_udc_set(udc, DC_CLBUF);
> > > >  		return false;
> > > >  	}
> > > > =20
> > > > @@ -209,9 +264,9 @@ static bool isp1760_udc_receive(struct isp1760_=
ep *ep,
> > > >  	 * the next packet might be removed from the FIFO.
> > > >  	 */
> > > >  	for (i =3D len; i > 2; i -=3D 4, ++buf)
> > > > -		*buf =3D le32_to_cpu(isp1760_udc_read(udc, DC_DATAPORT));
> > > > +		*buf =3D isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
> > > >  	if (i > 0)
> > > > -		*(u16 *)buf =3D le16_to_cpu(readw(udc->regs + DC_DATAPORT));
> > > > +		*(u16 *)buf =3D isp1760_udc_read_raw16(udc, ISP176x_DC_DATAPORT)=
;
> > > > =20
> > > >  	req->req.actual +=3D len;
> > > > =20
> > > > @@ -253,7 +308,7 @@ static void isp1760_udc_transmit(struct isp1760=
_ep *ep,
> > > >  		__func__, req->packet_size, req->req.actual,
> > > >  		req->req.length);
> > > > =20
> > > > -	__isp1760_udc_select_ep(ep, USB_DIR_IN);
> > > > +	__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
> > > > =20
> > > >  	if (req->packet_size)
> > > >  		isp1760_udc_write(udc, DC_BUFLEN, req->packet_size);
> > > > @@ -265,14 +320,14 @@ static void isp1760_udc_transmit(struct isp17=
60_ep *ep,
> > > >  	 * the FIFO for this kind of conditions, but doesn't seem to work=
.
> > > >  	 */
> > > >  	for (i =3D req->packet_size; i > 2; i -=3D 4, ++buf)
> > > > -		isp1760_udc_write(udc, DC_DATAPORT, cpu_to_le32(*buf));
> > > > +		isp1760_udc_write_raw(udc, ISP176x_DC_DATAPORT, *buf);
> > > >  	if (i > 0)
> > > > -		writew(cpu_to_le16(*(u16 *)buf), udc->regs + DC_DATAPORT);
> > > > +		isp1760_udc_write_raw16(udc, ISP176x_DC_DATAPORT, *(u16 *)buf);
> > > > =20
> > > >  	if (ep->addr =3D=3D 0)
> > > > -		isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
> > > > +		isp1760_udc_set(udc, DC_DSEN);
> > > >  	if (!req->packet_size)
> > > > -		isp1760_udc_write(udc, DC_CTRLFUNC, DC_VENDP);
> > > > +		isp1760_udc_set(udc, DC_VENDP);
> > > >  }
> > > > =20
> > > >  static void isp1760_ep_rx_ready(struct isp1760_ep *ep)
> > > > @@ -408,19 +463,24 @@ static int __isp1760_udc_set_halt(struct isp1=
760_ep *ep, bool halt)
> > > >  		return -EINVAL;
> > > >  	}
> > > > =20
> > > > -	isp1760_udc_select_ep(ep);
> > > > -	isp1760_udc_write(udc, DC_CTRLFUNC, halt ? DC_STALL : 0);
> > > > +	isp1760_udc_select_ep(udc, ep);
> > > > +
> > > > +	if (halt)
> > > > +		isp1760_udc_set(udc, DC_STALL);
> > > > +	else
> > > > +		isp1760_udc_clear(udc, DC_STALL);
> > > > =20
> > > >  	if (ep->addr =3D=3D 0) {
> > > >  		/* When halting the control endpoint, stall both IN and OUT. */
> > > > -		__isp1760_udc_select_ep(ep, USB_DIR_IN);
> > > > -		isp1760_udc_write(udc, DC_CTRLFUNC, halt ? DC_STALL : 0);
> > > > +		__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
> > > > +		if (halt)
> > > > +			isp1760_udc_set(udc, DC_STALL);
> > > > +		else
> > > > +			isp1760_udc_clear(udc, DC_STALL);
> > > >  	} else if (!halt) {
> > > >  		/* Reset the data PID by cycling the endpoint enable bit. */
> > > > -		u16 eptype =3D isp1760_udc_read(udc, DC_EPTYPE);
> > > > -
> > > > -		isp1760_udc_write(udc, DC_EPTYPE, eptype & ~DC_EPENABLE);
> > > > -		isp1760_udc_write(udc, DC_EPTYPE, eptype);
> > > > +		isp1760_udc_clear(udc, DC_EPENABLE);
> > > > +		isp1760_udc_set(udc, DC_EPENABLE);
> > > > =20
> > > >  		/*
> > > >  		 * Disabling the endpoint emptied the transmit FIFO, fill it
> > > > @@ -479,12 +539,14 @@ static int isp1760_udc_get_status(struct isp1=
760_udc *udc,
> > > >  		return -EINVAL;
> > > >  	}
> > > > =20
> > > > -	isp1760_udc_write(udc, DC_EPINDEX, DC_ENDPIDX(0) | DC_EPDIR);
> > > > +	isp1760_udc_set(udc, DC_EPDIR);
> > > > +	isp1760_udc_write(udc, DC_ENDPIDX, 1);
> > > > +
> > > >  	isp1760_udc_write(udc, DC_BUFLEN, 2);
> > > > =20
> > > > -	writew(cpu_to_le16(status), udc->regs + DC_DATAPORT);
> > > > +	isp1760_udc_write_raw16(udc, ISP176x_DC_DATAPORT, status);
> > > > =20
> > > > -	isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
> > > > +	isp1760_udc_set(udc, DC_DSEN);
> > > > =20
> > > >  	dev_dbg(udc->isp->dev, "%s: status 0x%04x\n", __func__, status);
> > > > =20
> > > > @@ -508,7 +570,8 @@ static int isp1760_udc_set_address(struct isp17=
60_udc *udc, u16 addr)
> > > >  	usb_gadget_set_state(&udc->gadget, addr ? USB_STATE_ADDRESS :
> > > >  			     USB_STATE_DEFAULT);
> > > > =20
> > > > -	isp1760_udc_write(udc, DC_ADDRESS, DC_DEVEN | addr);
> > > > +	isp1760_udc_write(udc, DC_DEVADDR, addr);
> > > > +	isp1760_udc_set(udc, DC_DEVEN);
> > > > =20
> > > >  	spin_lock(&udc->lock);
> > > >  	isp1760_udc_ctrl_send_status(&udc->ep[0], USB_DIR_OUT);
> > > > @@ -650,9 +713,9 @@ static void isp1760_ep0_setup(struct isp1760_ud=
c *udc)
> > > > =20
> > > >  	spin_lock(&udc->lock);
> > > > =20
> > > > -	isp1760_udc_write(udc, DC_EPINDEX, DC_EP0SETUP);
> > > > +	isp1760_udc_set(udc, DC_EP0SETUP);
> > > > =20
> > > > -	count =3D isp1760_udc_read(udc, DC_BUFLEN) & DC_DATACOUNT_MASK;
> > > > +	count =3D isp1760_udc_read(udc, DC_BUFLEN);
> > > >  	if (count !=3D sizeof(req)) {
> > > >  		spin_unlock(&udc->lock);
> > > > =20
> > > > @@ -663,8 +726,8 @@ static void isp1760_ep0_setup(struct isp1760_ud=
c *udc)
> > > >  		return;
> > > >  	}
> > > > =20
> > > > -	req.data[0] =3D isp1760_udc_read(udc, DC_DATAPORT);
> > > > -	req.data[1] =3D isp1760_udc_read(udc, DC_DATAPORT);
> > > > +	req.data[0] =3D isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
> > > > +	req.data[1] =3D isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
> > > > =20
> > > >  	if (udc->ep0_state !=3D ISP1760_CTRL_SETUP) {
> > > >  		spin_unlock(&udc->lock);
> > > > @@ -732,13 +795,13 @@ static int isp1760_ep_enable(struct usb_ep *e=
p,
> > > > =20
> > > >  	switch (usb_endpoint_type(desc)) {
> > > >  	case USB_ENDPOINT_XFER_ISOC:
> > > > -		type =3D DC_ENDPTYP_ISOC;
> > > > +		type =3D ISP176x_DC_ENDPTYP_ISOC;
> > > >  		break;
> > > >  	case USB_ENDPOINT_XFER_BULK:
> > > > -		type =3D DC_ENDPTYP_BULK;
> > > > +		type =3D ISP176x_DC_ENDPTYP_BULK;
> > > >  		break;
> > > >  	case USB_ENDPOINT_XFER_INT:
> > > > -		type =3D DC_ENDPTYP_INTERRUPT;
> > > > +		type =3D ISP176x_DC_ENDPTYP_INTERRUPT;
> > > >  		break;
> > > >  	case USB_ENDPOINT_XFER_CONTROL:
> > > >  	default:
> > > > @@ -755,10 +818,13 @@ static int isp1760_ep_enable(struct usb_ep *e=
p,
> > > >  	uep->halted =3D false;
> > > >  	uep->wedged =3D false;
> > > > =20
> > > > -	isp1760_udc_select_ep(uep);
> > > > -	isp1760_udc_write(udc, DC_EPMAXPKTSZ, uep->maxpacket);
> > > > +	isp1760_udc_select_ep(udc, uep);
> > > > +
> > > > +	isp1760_udc_write(udc, DC_FFOSZ, uep->maxpacket);
> > > >  	isp1760_udc_write(udc, DC_BUFLEN, uep->maxpacket);
> > > > -	isp1760_udc_write(udc, DC_EPTYPE, DC_EPENABLE | type);
> > > > +
> > > > +	isp1760_udc_write(udc, DC_ENDPTYP, type);
> > > > +	isp1760_udc_set(udc, DC_EPENABLE);
> > > > =20
> > > >  	spin_unlock_irqrestore(&udc->lock, flags);
> > > > =20
> > > > @@ -786,8 +852,9 @@ static int isp1760_ep_disable(struct usb_ep *ep=
)
> > > >  	uep->desc =3D NULL;
> > > >  	uep->maxpacket =3D 0;
> > > > =20
> > > > -	isp1760_udc_select_ep(uep);
> > > > -	isp1760_udc_write(udc, DC_EPTYPE, 0);
> > > > +	isp1760_udc_select_ep(udc, uep);
> > > > +	isp1760_udc_clear(udc, DC_EPENABLE);
> > > > +	isp1760_udc_clear(udc, DC_ENDPTYP);
> > > > =20
> > > >  	/* TODO Synchronize with the IRQ handler */
> > > > =20
> > > > @@ -864,8 +931,8 @@ static int isp1760_ep_queue(struct usb_ep *ep, =
struct usb_request *_req,
> > > > =20
> > > >  		case ISP1760_CTRL_DATA_OUT:
> > > >  			list_add_tail(&req->queue, &uep->queue);
> > > > -			__isp1760_udc_select_ep(uep, USB_DIR_OUT);
> > > > -			isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
> > > > +			__isp1760_udc_select_ep(udc, uep, USB_DIR_OUT);
> > > > +			isp1760_udc_set(udc, DC_DSEN);
> > > >  			break;
> > > > =20
> > > >  		case ISP1760_CTRL_STATUS:
> > > > @@ -1025,14 +1092,14 @@ static void isp1760_ep_fifo_flush(struct us=
b_ep *ep)
> > > > =20
> > > >  	spin_lock_irqsave(&udc->lock, flags);
> > > > =20
> > > > -	isp1760_udc_select_ep(uep);
> > > > +	isp1760_udc_select_ep(udc, uep);
> > > > =20
> > > >  	/*
> > > >  	 * Set the CLBUF bit twice to flush both buffers in case double
> > > >  	 * buffering is enabled.
> > > >  	 */
> > > > -	isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
> > > > -	isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
> > > > +	isp1760_udc_set(udc, DC_CLBUF);
> > > > +	isp1760_udc_set(udc, DC_CLBUF);
> > > > =20
> > > >  	spin_unlock_irqrestore(&udc->lock, flags);
> > > >  }
> > > > @@ -1091,19 +1158,30 @@ static void isp1760_udc_init_hw(struct isp1=
760_udc *udc)
> > > >  	 * ACK tokens only (and NYET for the out pipe). The default
> > > >  	 * configuration also generates an interrupt on the first NACK to=
ken.
> > > >  	 */
> > > > -	isp1760_udc_write(udc, DC_INTCONF, DC_CDBGMOD_ACK | DC_DDBGMODIN_=
ACK |
> > > > -			  DC_DDBGMODOUT_ACK_NYET);
> > > > -
> > > > -	isp1760_udc_write(udc, DC_INTENABLE, DC_IEPRXTX(7) | DC_IEPRXTX(6=
) |
> > > > -			  DC_IEPRXTX(5) | DC_IEPRXTX(4) | DC_IEPRXTX(3) |
> > > > -			  DC_IEPRXTX(2) | DC_IEPRXTX(1) | DC_IEPRXTX(0) |
> > > > -			  DC_IEP0SETUP | DC_IEVBUS | DC_IERESM | DC_IESUSP |
> > > > -			  DC_IEHS_STA | DC_IEBRST);
> > > > +	isp1760_udc_set(udc, DC_CDBGMOD_ACK);
> > > > +	isp1760_udc_set(udc, DC_DDBGMODIN_ACK);
> > > > +	isp1760_udc_set(udc, DC_DDBGMODOUT_ACK);
> > > > +
> > > > +	isp1760_udc_set(udc, DC_IEPRXTX_7);
> > > > +	isp1760_udc_set(udc, DC_IEPRXTX_6);
> > > > +	isp1760_udc_set(udc, DC_IEPRXTX_5);
> > > > +	isp1760_udc_set(udc, DC_IEPRXTX_4);
> > > > +	isp1760_udc_set(udc, DC_IEPRXTX_3);
> > > > +	isp1760_udc_set(udc, DC_IEPRXTX_2);
> > > > +	isp1760_udc_set(udc, DC_IEPRXTX_1);
> > > > +	isp1760_udc_set(udc, DC_IEPRXTX_0);
> > > > +
> > > > +	isp1760_udc_set(udc, DC_IEP0SETUP);
> > > > +	isp1760_udc_set(udc, DC_IEVBUS);
> > > > +	isp1760_udc_set(udc, DC_IERESM);
> > > > +	isp1760_udc_set(udc, DC_IESUSP);
> > > > +	isp1760_udc_set(udc, DC_IEHS_STA);
> > > > +	isp1760_udc_set(udc, DC_IEBRST);
> > > > =20
> > > >  	if (udc->connected)
> > > >  		isp1760_set_pullup(udc->isp, true);
> > > > =20
> > > > -	isp1760_udc_write(udc, DC_ADDRESS, DC_DEVEN);
> > > > +	isp1760_udc_set(udc, DC_DEVEN);
> > > >  }
> > > > =20
> > > >  static void isp1760_udc_reset(struct isp1760_udc *udc)
> > > > @@ -1152,7 +1230,7 @@ static int isp1760_udc_get_frame(struct usb_g=
adget *gadget)
> > > >  {
> > > >  	struct isp1760_udc *udc =3D gadget_to_udc(gadget);
> > > > =20
> > > > -	return isp1760_udc_read(udc, DC_FRAMENUM) & ((1 << 11) - 1);
> > > > +	return isp1760_udc_read(udc, DC_FRAMENUM);
> > > >  }
> > > > =20
> > > >  static int isp1760_udc_wakeup(struct usb_gadget *gadget)
> > > > @@ -1219,7 +1297,7 @@ static int isp1760_udc_start(struct usb_gadge=
t *gadget,
> > > >  	usb_gadget_set_state(&udc->gadget, USB_STATE_ATTACHED);
> > > > =20
> > > >  	/* DMA isn't supported yet, don't enable the DMA clock. */
> > > > -	isp1760_udc_write(udc, DC_MODE, DC_GLINTENA);
> > > > +	isp1760_udc_set(udc, DC_GLINTENA);
> > > > =20
> > > >  	isp1760_udc_init_hw(udc);
> > > > =20
> > > > @@ -1238,7 +1316,7 @@ static int isp1760_udc_stop(struct usb_gadget=
 *gadget)
> > > > =20
> > > >  	del_timer_sync(&udc->vbus_timer);
> > > > =20
> > > > -	isp1760_udc_write(udc, DC_MODE, 0);
> > > > +	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
> > > > =20
> > > >  	spin_lock_irqsave(&udc->lock, flags);
> > > >  	udc->driver =3D NULL;
> > > > @@ -1266,9 +1344,9 @@ static irqreturn_t isp1760_udc_irq(int irq, v=
oid *dev)
> > > >  	unsigned int i;
> > > >  	u32 status;
> > > > =20
> > > > -	status =3D isp1760_udc_read(udc, DC_INTERRUPT)
> > > > -	       & isp1760_udc_read(udc, DC_INTENABLE);
> > > > -	isp1760_udc_write(udc, DC_INTERRUPT, status);
> > > > +	status =3D isp1760_reg_read(udc->regs, ISP176x_DC_INTERRUPT)
> > > > +	       & isp1760_reg_read(udc->regs, ISP176x_DC_INTENABLE);
> > > > +	isp1760_reg_write(udc->regs, ISP176x_DC_INTERRUPT, status);
> > > > =20
> > > >  	if (status & DC_IEVBUS) {
> > > >  		dev_dbg(udc->isp->dev, "%s(VBUS)\n", __func__);
> > > > @@ -1313,7 +1391,7 @@ static irqreturn_t isp1760_udc_irq(int irq, v=
oid *dev)
> > > >  		dev_dbg(udc->isp->dev, "%s(SUSP)\n", __func__);
> > > > =20
> > > >  		spin_lock(&udc->lock);
> > > > -		if (!(isp1760_udc_read(udc, DC_MODE) & DC_VBUSSTAT))
> > > > +		if (!isp1760_udc_is_set(udc, DC_VBUSSTAT))
> > > >  			isp1760_udc_disconnect(udc);
> > > >  		else
> > > >  			isp1760_udc_suspend(udc);
> > > > @@ -1335,7 +1413,7 @@ static void isp1760_udc_vbus_poll(struct time=
r_list *t)
> > > > =20
> > > >  	spin_lock_irqsave(&udc->lock, flags);
> > > > =20
> > > > -	if (!(isp1760_udc_read(udc, DC_MODE) & DC_VBUSSTAT))
> > > > +	if (!(isp1760_udc_is_set(udc, DC_VBUSSTAT)))
> > > >  		isp1760_udc_disconnect(udc);
> > > >  	else if (udc->gadget.state >=3D USB_STATE_POWERED)
> > > >  		mod_timer(&udc->vbus_timer,
> > > > @@ -1412,9 +1490,9 @@ static int isp1760_udc_init(struct isp1760_ud=
c *udc)
> > > >  	 * register, and reading the scratch register value back. The chi=
p ID
> > > >  	 * and scratch register contents must match the expected values.
> > > >  	 */
> > > > -	isp1760_udc_write(udc, DC_SCRATCH, 0xbabe);
> > > > -	chipid =3D isp1760_udc_read(udc, DC_CHIPID);
> > > > -	scratch =3D isp1760_udc_read(udc, DC_SCRATCH);
> > > > +	isp1760_reg_write(udc->regs, ISP176x_DC_SCRATCH, 0xbabe);
> > > > +	chipid =3D isp1760_reg_read(udc->regs, ISP176x_DC_CHIPID);
> > > > +	scratch =3D isp1760_reg_read(udc->regs, ISP176x_DC_SCRATCH);
> > > > =20
> > > >  	if (scratch !=3D 0xbabe) {
> > > >  		dev_err(udc->isp->dev,
> > > > @@ -1429,9 +1507,9 @@ static int isp1760_udc_init(struct isp1760_ud=
c *udc)
> > > >  	}
> > > > =20
> > > >  	/* Reset the device controller. */
> > > > -	isp1760_udc_write(udc, DC_MODE, DC_SFRESET);
> > > > +	isp1760_udc_set(udc, DC_SFRESET);
> > > >  	usleep_range(10000, 11000);
> > > > -	isp1760_udc_write(udc, DC_MODE, 0);
> > > > +	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
> > > >  	usleep_range(10000, 11000);
> > > > =20
> > > >  	return 0;
> > > > @@ -1445,7 +1523,6 @@ int isp1760_udc_register(struct isp1760_devic=
e *isp, int irq,
> > > > =20
> > > >  	udc->irq =3D -1;
> > > >  	udc->isp =3D isp;
> > > > -	udc->regs =3D isp->regs;
> > > > =20
> > > >  	spin_lock_init(&udc->lock);
> > > >  	timer_setup(&udc->vbus_timer, isp1760_udc_vbus_poll, 0);
> > > > diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp176=
0/isp1760-udc.h
> > > > index d2df650d54e9..a49096c0ac8e 100644
> > > > --- a/drivers/usb/isp1760/isp1760-udc.h
> > > > +++ b/drivers/usb/isp1760/isp1760-udc.h
> > > > @@ -17,6 +17,8 @@
> > > >  #include <linux/timer.h>
> > > >  #include <linux/usb/gadget.h>
> > > > =20
> > > > +#include "isp1760-regs.h"
> > >
> > > Is this needed ?
> >=20
> > for DC_FIELD_MAX below, right?
> >=20
> > Cheers,
> >      Rui
> > >
> > > > +
> > > >  struct isp1760_device;
> > > >  struct isp1760_udc;
> > > > =20
> > > > @@ -48,7 +50,7 @@ struct isp1760_ep {
> > > >   * struct isp1760_udc - UDC state information
> > > >   * irq: IRQ number
> > > >   * irqname: IRQ name (as passed to request_irq)
> > > > - * regs: Base address of the UDC registers
> > > > + * regs: regmap for UDC registers
> > > >   * driver: Gadget driver
> > > >   * gadget: Gadget device
> > > >   * lock: Protects driver, vbus_timer, ep, ep0_*, DC_EPINDEX regist=
er
> > > > @@ -59,12 +61,13 @@ struct isp1760_ep {
> > > >   * connected: Tracks gadget driver bus connection state
> > > >   */
> > > >  struct isp1760_udc {
> > > > -#ifdef CONFIG_USB_ISP1761_UDC
> > > >  	struct isp1760_device *isp;
> > > > =20
> > > >  	int irq;
> > > >  	char *irqname;
> > > > -	void __iomem *regs;
> > > > +
> > > > +	struct regmap *regs;
> > > > +	struct regmap_field *fields[DC_FIELD_MAX];
> > > > =20
> > > >  	struct usb_gadget_driver *driver;
> > > >  	struct usb_gadget gadget;
> > > > @@ -81,7 +84,6 @@ struct isp1760_udc {
> > > >  	bool connected;
> > > > =20
> > > >  	unsigned int devstatus;
> > > > -#endif
> > > >  };
> > > > =20
> > > >  #ifdef CONFIG_USB_ISP1761_UDC
>
> --=20
> Regards,
>
> Laurent Pinchart



