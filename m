Return-Path: <linux-usb+bounces-19425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A924A141B3
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 19:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 617E5188A813
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 18:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2605B190685;
	Thu, 16 Jan 2025 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gR0NpGMQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A21DA100;
	Thu, 16 Jan 2025 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737052067; cv=none; b=pFkFkZlsq8bRB0mYDRWXqqaBnrEi4vaEAYg7Pqkp/UFrSJcr5qyM1tQcxGBr38sU6y+UwxdQenxpWz2iGyQSHfPC6AYcTJzD+nLq+NwgeAP4YCgL2GowjslUD4niP2G+6hoAPVagjIK+drfKxXnj9OnZ/ZiOhMCvNekztteK4r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737052067; c=relaxed/simple;
	bh=YnFpC9haf++5ZEni1pTaYmQ9wIz9WaWZZEH2pEjY9OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HdWnw7tpk+C2b3nxIDD+PXiM4RwMkBsU5yiebD5enp97pi2wgE5bJKnIHv31c8EmK9AJeLc2C6QgK005M7JLZUGGGS+wLMcEjfXYNPjuAKSofk4aHzm1vK1HEYjrLxHssGo60D2RedpmC5bNACaA1M2dueIrb0DEs30xiJHB9tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gR0NpGMQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216401de828so22385925ad.3;
        Thu, 16 Jan 2025 10:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737052065; x=1737656865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpTbTrPrk6nX5X/JsoQpfoGMGqSFNwHxH1VDPi2VmGg=;
        b=gR0NpGMQ0PMaWi5uiHR+3+k9SEB7+hXKK+3gjHt1jtOWjEkyWJ/J2InTdyaaxoDFId
         gK6sY8ow+HK1H4wwfOhJMYDN9CYcFVAoQzzbQr5Om4G/Gn4l/b0WnMbv3EJxGggx5/zV
         c1hXpajOvLbcKs/MMnUCNOlQjRzKnQQTEj2nsHzxzMjdL1UIFzVtT5fhqV49XMUu3KXI
         g5+FndyJjfdI0u0g6h0iyHLtdKwS46h7mo/USUDTW1P0Iz7KcRF5C3e1azo8BUtOf+KV
         mmKd7O7o+OVPkroOab0HT3JWCVAgEj+Yix9AC+m/yvP0Q1mJm1lpQDEj3sgt/z81nScx
         LeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737052065; x=1737656865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpTbTrPrk6nX5X/JsoQpfoGMGqSFNwHxH1VDPi2VmGg=;
        b=c8jXgMwxR5u0XSorPAl08CbtDQVJme1MHPOrt6pn9scHG1+kgXBg5DW5UB1DVnF30F
         isFvxx/WL5NKrUdkR7I/0TNumCEuFKtyUfdMGkARq5YrXFSXGC/ISQSJ8ZfLjFM2JiBY
         IMp/nIF0lUd32sxhWTt/sTpW3roHyxLUVWVOBYKCJe7N9S82Hpl5m15t76K5q5ZvvT9X
         bLJLmolFETLxCFkDevRJGirlpXPQ6zaQVK9w/gqV/O6ACAg5hLYBnZAHryXezRu6Tpkj
         G9u1lQUKOCEWpHyvwhF7g9eXpV9f6TxTmw3K+ySwWSog92I6ekt8N+k2ttsa2FmIUrRu
         8Zsw==
X-Forwarded-Encrypted: i=1; AJvYcCUtaBhM4M6w/Ckdy5wu/zmmXOIjrP5Ki6OizJ6Xy2P370TjDSLV6TZmQFpoHeAQ9DjIZrJ2pTjsf596@vger.kernel.org, AJvYcCW3E8wcC91JYD8m/H7+bZhx6sUExJf0SgUEeR9kmqSAWEu7Cx1BdsGSuLl2CKS7b2krDFY1kg/zYYHoga4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+9xfQgPaXGbheRTinYAzr3DpP519RR6tB3Aibs7yTKxvwhbB1
	G/Lra5UT1DrlGHGjiqRt8oPrHmRtSSDFPqDZzHj7fnzSRWdEF2GW
X-Gm-Gg: ASbGncts0bC9iTILJwExVeeNB4L06zqbJkvt6JtJuXrm6Jyv3yPJaJERbJmUcHVfHc3
	GgEzVpWpQKlufm5ejCRtBKA8Z3oZjvQmpn5tnjaC+6PNv0YeYfPScT+xJz1+OeZJITh2bXJxeek
	9ghH+pY+555wp2EOpa55WBMUNY3VHYtk4xwd5bcIMi3gGj8RSZiuLCw0Bv2mFI2Jq0bfy0ADsAJ
	/ceTWbB83vyhGYr4Fe7ALfrajEHuAdIHV5P0TAaZ1nRgNClgdnm85+eG+A5j5hJqErVkRI+mNx1
	59/tFE7lDkmmaW7vGHeeGr7AGzJikSlrCZI=
X-Google-Smtp-Source: AGHT+IFEfYSOZzmcx1KmTRs8aXr26fl9AQlso49YzeJoAhIdRBJCcncrWYKLVidx0CVrEeTDXUJWqg==
X-Received: by 2002:a05:6a00:35c6:b0:725:4109:5b5f with SMTP id d2e1a72fcca58-72d21f3233cmr58342240b3a.8.1737052065153;
        Thu, 16 Jan 2025 10:27:45 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f2271sm327859b3a.25.2025.01.16.10.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 10:27:44 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mitltlatltl@gmail.com
Subject: Re: [PATCH v3 4/6] usb: typec: ucsi: add Huawei Matebook E Go ucsi driver
Date: Fri, 17 Jan 2025 02:26:10 +0800
Message-ID: <20250116182618.135903-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <Z4jzr1PUPhwpQLTY@kuha.fi.intel.com>
References: <Z4jzr1PUPhwpQLTY@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Jan 16, 2025 at 7:55 PM Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> Hi,
>
> On Tue, Jan 14, 2025 at 01:51:26AM +0800, Pengyu Luo wrote:
> > The Huawei Matebook E Go tablet implements the UCSI interface in the
> > onboard EC. Add the glue driver to interface with the platform's UCSI
> > implementation.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  drivers/usb/typec/ucsi/Kconfig              |  11 +
> >  drivers/usb/typec/ucsi/Makefile             |   1 +
> >  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 526 ++++++++++++++++++++
> >  3 files changed, 538 insertions(+)
> >  create mode 100644 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> >
> > diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> > index 75559601f..e94956d27 100644
> > --- a/drivers/usb/typec/ucsi/Kconfig
> > +++ b/drivers/usb/typec/ucsi/Kconfig
> > @@ -91,4 +91,15 @@ config UCSI_LENOVO_YOGA_C630
> >         To compile the driver as a module, choose M here: the module will be
> >         called ucsi_yoga_c630.
> >
> > +config UCSI_HUAWEI_GAOKUN
> > +     tristate "UCSI Interface Driver for Huawei Matebook E Go"
> > +     depends on EC_HUAWEI_GAOKUN
> > +     select DRM_AUX_HPD_BRIDGE
> > +     help
> > +       This driver enables UCSI support on the Huawei Matebook E Go tablet,
> > +       which is a sc8280xp-based 2-in-1 tablet.
> > +
> > +       To compile the driver as a module, choose M here: the module will be
> > +       called ucsi_huawei_gaokun.
> > +
> >  endif
> > diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> > index be98a8791..dbc571763 100644
> > --- a/drivers/usb/typec/ucsi/Makefile
> > +++ b/drivers/usb/typec/ucsi/Makefile
> > @@ -23,3 +23,4 @@ obj-$(CONFIG_UCSI_STM32G0)          += ucsi_stm32g0.o
> >  obj-$(CONFIG_UCSI_PMIC_GLINK)                += ucsi_glink.o
> >  obj-$(CONFIG_CROS_EC_UCSI)           += cros_ec_ucsi.o
> >  obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)  += ucsi_yoga_c630.o
> > +obj-$(CONFIG_UCSI_HUAWEI_GAOKUN)     += ucsi_huawei_gaokun.o
> > diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> > new file mode 100644
> > index 000000000..da1993805
> > --- /dev/null
> > +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> > @@ -0,0 +1,527 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * ucsi-huawei-gaokun - A UCSI driver for HUAWEI Matebook E Go
> > + *
> > + * reference: drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> > + *            drivers/usb/typec/ucsi/ucsi_glink.c
> > + *            drivers/soc/qcom/pmic_glink_altmode.c
> > + *
> > + * Copyright (C) 2024 Pengyu Luo <mitltlatltl@gmail.com>
> > + */
> > +
> > +#include <drm/bridge/aux-bridge.h>
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/bitops.h>
> > +#include <linux/completion.h>
> > +#include <linux/container_of.h>
> > +#include <linux/module.h>
> > +#include <linux/notifier.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_data/huawei-gaokun-ec.h>
> > +#include <linux/string.h>
> > +#include <linux/usb/pd_vdo.h>
> > +#include <linux/usb/typec_altmode.h>
> > +#include <linux/usb/typec_dp.h>
> > +#include <linux/workqueue_types.h>
> > +
> > +#include "ucsi.h"
> > +
> > +#define EC_EVENT_UCSI        0x21
> > +#define EC_EVENT_USB 0x22
> > +
> > +#define GAOKUN_CCX_MASK              GENMASK(1, 0)
> > +#define GAOKUN_MUX_MASK              GENMASK(3, 2)
> > +
> > +#define GAOKUN_DPAM_MASK     GENMASK(3, 0)
> > +#define GAOKUN_HPD_STATE_MASK        BIT(4)
> > +#define GAOKUN_HPD_IRQ_MASK  BIT(5)
> > +
> > +#define GET_IDX(updt) (ffs(updt) - 1)
> > +
> > +#define CCX_TO_ORI(ccx) (++ccx % 3) /* convert ccx to enum typec_orientation */
> > +
> > +/* Configuration Channel Extension */
> > +enum gaokun_ucsi_ccx {
> > +     USBC_CCX_NORMAL,
> > +     USBC_CCX_REVERSE,
> > +     USBC_CCX_NONE,
> > +};
> > +
> > +enum gaokun_ucsi_mux {
> > +     USBC_MUX_NONE,
> > +     USBC_MUX_USB_2L,
> > +     USBC_MUX_DP_4L,
> > +     USBC_MUX_USB_DP,
> > +};
>
> Missing newline.
>
> > +/* based on pmic_glink_altmode_pin_assignment */
> > +enum gaokun_ucsi_dpam_pan {  /* DP Alt Mode Pin Assignments */
> > +     USBC_DPAM_PAN_NONE,
> > +     USBC_DPAM_PAN_A,        /* Not supported after USB Type-C Standard v1.0b */
> > +     USBC_DPAM_PAN_B,        /* Not supported after USB Type-C Standard v1.0b */
> > +     USBC_DPAM_PAN_C,        /* USBC_DPAM_PAN_C_REVERSE - 6 */
> > +     USBC_DPAM_PAN_D,
> > +     USBC_DPAM_PAN_E,
> > +     USBC_DPAM_PAN_F,        /* Not supported after USB Type-C Standard v1.0b */
> > +     USBC_DPAM_PAN_A_REVERSE,/* Not supported after USB Type-C Standard v1.0b */
> > +     USBC_DPAM_PAN_B_REVERSE,/* Not supported after USB Type-C Standard v1.0b */
> > +     USBC_DPAM_PAN_C_REVERSE,
> > +     USBC_DPAM_PAN_D_REVERSE,
> > +     USBC_DPAM_PAN_E_REVERSE,
> > +     USBC_DPAM_PAN_F_REVERSE,/* Not supported after USB Type-C Standard v1.0b */
> > +};
> > +
> > +struct gaokun_ucsi_reg {
> > +     u8 num_ports;
> > +     u8 port_updt;
> > +     u8 port_data[4];
> > +     u8 checksum;
> > +     u8 reserved;
> > +} __packed;
> > +
> > +struct gaokun_ucsi_port {
> > +     struct completion usb_ack;
> > +     spinlock_t lock;
>
> Locks need to be commented. Did you run checkpatch.pl on this?
>

I ran, without `--strict` though. I got it, I will do it.

> > +     struct gaokun_ucsi *ucsi;
> > +     struct auxiliary_device *bridge;
> > +
> > +     int idx;
> > +     enum gaokun_ucsi_ccx ccx;
> > +     enum gaokun_ucsi_mux mux;
> > +     u8 mode;
> > +     u16 svid;
> > +     u8 hpd_state;
> > +     u8 hpd_irq;
> > +};
> > +
> > +struct gaokun_ucsi {
> > +     struct gaokun_ec *ec;
> > +     struct ucsi *ucsi;
> > +     struct gaokun_ucsi_port *ports;
> > +     struct device *dev;
> > +     struct delayed_work work;
> > +     struct notifier_block nb;
> > +     u16 version;
> > +     u8 num_ports;
> > +};
>
> thanks,
>
> --
> heikki

Best wishes,
Pengyu

