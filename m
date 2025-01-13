Return-Path: <linux-usb+bounces-19267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEF5A0BF48
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 18:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A3363A83C0
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 17:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4683B1C1F27;
	Mon, 13 Jan 2025 17:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVz0obvX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B6A1BD9DE;
	Mon, 13 Jan 2025 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736790791; cv=none; b=pthPGqfU+YeabaKpJnxsONZYW9ZbfEDpJJInlp5h6/3hIQlzxSBKo7U2dwrarwdtyOfDPKfq4/xnMm3dvlzuOBFDcto1ILqkF0gY4pEgJNV6AnSl95UKv7r9J6MkdmZkuGGaYt/Cw9FvEj2RDj0vC8HGvZQJLi+23K4TI0cyNGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736790791; c=relaxed/simple;
	bh=stoETWSuuKd8yGMa+Oz06ke5DkTEN2Qp3anAcJVoLf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LYETTEqko6Hyz4AkgxSr//vFt0HB/ZgFbwrjGUyQXIv61LTM67gjJNW4VaLs+MtI6D0zCrm5mlIkWGssgQcbO5DraA0mu2qOGu28upz1DAxPXBwzerI4ej0yA/XE9hniBgse49AXL2QK5N4PkYgT6JG3VE8p6ieuRTIJBxAPc90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVz0obvX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2165448243fso96714385ad.1;
        Mon, 13 Jan 2025 09:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736790789; x=1737395589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ2wQDFgOB2rHz2yZe88WA1LR28iHgqRQU+ybcJDGfI=;
        b=dVz0obvXHqBIpe4Jt1QU632q6lVTsC787CgZMnB+tpgqObZnHxkvdWrcGvYsucnfAI
         O299KOlQJSarPa6cOvaKFQG33XTjPrkDPON0QQP7rRPCv8D+8Y8H+5jI554VFOMYenFU
         h+bP9fzZvN9RDCvXJORz49vXwvBf6DGegHyqNtFd9FgBVMeEwP5GqqeiDNitwSRKY8uz
         oSFqUbvF4FpE79OvXf73bwQ8O+i/j+5vJcj8jsDoRFQat7uJh/J6pASAUJQl+/KfMqtV
         LlEiNYo2HYcRdCdlv4jqTs0BsPnAMw5tHYEG4vSkkUhkdS2+pxK7RQzkaB6hl7vKPyOC
         mwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790789; x=1737395589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ2wQDFgOB2rHz2yZe88WA1LR28iHgqRQU+ybcJDGfI=;
        b=UTW6UDC8Kd9hKRfTWp57FCbCmRfKzBWAawejgcvAb6Te1/WAofE6wM+6/60PYgaW1w
         DnkYPPfrnVEji8HAmpDHplmpac+3QxEqt1yYt9RMuoEs3iIuKTi4UbNOLmU377mUlbpz
         n9xkH8weZp0bmdj4de7DBgul9A5jJ51U2xdRezZqsNta8jSYRg0bHaxiGAiQokiWIJIb
         9BWEv2dRAcF6hcDJADbTTG6/AAdDpWoaYI2DgWnUxKBGmELfqwJCTP7idwLZ1t6Zqe+N
         txvME/WbFkZu4850ZCr7WfQcYmgDYs4LFm5pkKYcwZbWuvUXTQMrj/vsy2hT2KuHwv9c
         6+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6YQYBC5/GIWduU2nzJcjCBfUrFIjYYpwQt0DYoxGqnT0181lXKdzNMpluuVniquKRW7YjyEx5Ekc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMuIlESNigchFPp74P8rtFbl2U2phDxLVQeldPtvQSYUw55NRc
	GbCrJ+HR+Uv18cSyUi9wLo+6CnP8DlSPe0NMKfp1RUbWGfvhEzN1
X-Gm-Gg: ASbGncuVNf/DzJZYPuXcrd4DGMcGPF2R7feBxnnyF1bWgYxQsxJii92UxDNsCIZBEyo
	ndiRdD8TAzLG9bBpCOmj8iD/mtcEqwutW10PkZLWRrVz7htriOAkgnW+kHJKDl7NwrJF9p0L2pm
	vnhaEisk1Z9Q4vM6PpcAZEvqm5ZKEZRltQllkbNxlP0l3s/+HDiIaDRqsn4eY/Dd/LUZy5kSXTs
	MEC+oyTuCgF7D/y/ITSZKPfIMdHVbG3EMvqFscIeI+x8GCA3DMoid8=
X-Google-Smtp-Source: AGHT+IEQjB+Gtkl/fD8nnEYuLb3pv2Z0GOPfreRSb4KCCqCb8lbLxwMsdScyXfAhaQlRDsExbCax4w==
X-Received: by 2002:a17:903:185:b0:216:4676:dfaf with SMTP id d9443c01a7336-21a83f96abamr330284875ad.34.1736790789135;
        Mon, 13 Jan 2025 09:53:09 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10e0c4sm55724905ad.24.2025.01.13.09.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 09:53:08 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 4/6] usb: typec: ucsi: add Huawei Matebook E Go ucsi driver
Date: Tue, 14 Jan 2025 01:51:26 +0800
Message-ID: <20250113175131.590683-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113175131.590683-1-mitltlatltl@gmail.com>
References: <20250113175131.590683-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Huawei Matebook E Go tablet implements the UCSI interface in the
onboard EC. Add the glue driver to interface with the platform's UCSI
implementation.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/usb/typec/ucsi/Kconfig              |  11 +
 drivers/usb/typec/ucsi/Makefile             |   1 +
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 526 ++++++++++++++++++++
 3 files changed, 538 insertions(+)
 create mode 100644 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 75559601f..e94956d27 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -91,4 +91,15 @@ config UCSI_LENOVO_YOGA_C630
 	  To compile the driver as a module, choose M here: the module will be
 	  called ucsi_yoga_c630.
 
+config UCSI_HUAWEI_GAOKUN
+	tristate "UCSI Interface Driver for Huawei Matebook E Go"
+	depends on EC_HUAWEI_GAOKUN
+	select DRM_AUX_HPD_BRIDGE
+	help
+	  This driver enables UCSI support on the Huawei Matebook E Go tablet,
+	  which is a sc8280xp-based 2-in-1 tablet.
+
+	  To compile the driver as a module, choose M here: the module will be
+	  called ucsi_huawei_gaokun.
+
 endif
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index be98a8791..dbc571763 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -23,3 +23,4 @@ obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
 obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
 obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
 obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
+obj-$(CONFIG_UCSI_HUAWEI_GAOKUN)	+= ucsi_huawei_gaokun.o
diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
new file mode 100644
index 000000000..da1993805
--- /dev/null
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -0,0 +1,527 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ucsi-huawei-gaokun - A UCSI driver for HUAWEI Matebook E Go
+ *
+ * reference: drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+ *            drivers/usb/typec/ucsi/ucsi_glink.c
+ *            drivers/soc/qcom/pmic_glink_altmode.c
+ *
+ * Copyright (C) 2024 Pengyu Luo <mitltlatltl@gmail.com>
+ */
+
+#include <drm/bridge/aux-bridge.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/platform_data/huawei-gaokun-ec.h>
+#include <linux/string.h>
+#include <linux/usb/pd_vdo.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/workqueue_types.h>
+
+#include "ucsi.h"
+
+#define EC_EVENT_UCSI	0x21
+#define EC_EVENT_USB	0x22
+
+#define GAOKUN_CCX_MASK		GENMASK(1, 0)
+#define GAOKUN_MUX_MASK		GENMASK(3, 2)
+
+#define GAOKUN_DPAM_MASK	GENMASK(3, 0)
+#define GAOKUN_HPD_STATE_MASK	BIT(4)
+#define GAOKUN_HPD_IRQ_MASK	BIT(5)
+
+#define GET_IDX(updt) (ffs(updt) - 1)
+
+#define CCX_TO_ORI(ccx) (++ccx % 3) /* convert ccx to enum typec_orientation */
+
+/* Configuration Channel Extension */
+enum gaokun_ucsi_ccx {
+	USBC_CCX_NORMAL,
+	USBC_CCX_REVERSE,
+	USBC_CCX_NONE,
+};
+
+enum gaokun_ucsi_mux {
+	USBC_MUX_NONE,
+	USBC_MUX_USB_2L,
+	USBC_MUX_DP_4L,
+	USBC_MUX_USB_DP,
+};
+/* based on pmic_glink_altmode_pin_assignment */
+enum gaokun_ucsi_dpam_pan {	/* DP Alt Mode Pin Assignments */
+	USBC_DPAM_PAN_NONE,
+	USBC_DPAM_PAN_A,	/* Not supported after USB Type-C Standard v1.0b */
+	USBC_DPAM_PAN_B,	/* Not supported after USB Type-C Standard v1.0b */
+	USBC_DPAM_PAN_C,	/* USBC_DPAM_PAN_C_REVERSE - 6 */
+	USBC_DPAM_PAN_D,
+	USBC_DPAM_PAN_E,
+	USBC_DPAM_PAN_F,	/* Not supported after USB Type-C Standard v1.0b */
+	USBC_DPAM_PAN_A_REVERSE,/* Not supported after USB Type-C Standard v1.0b */
+	USBC_DPAM_PAN_B_REVERSE,/* Not supported after USB Type-C Standard v1.0b */
+	USBC_DPAM_PAN_C_REVERSE,
+	USBC_DPAM_PAN_D_REVERSE,
+	USBC_DPAM_PAN_E_REVERSE,
+	USBC_DPAM_PAN_F_REVERSE,/* Not supported after USB Type-C Standard v1.0b */
+};
+
+struct gaokun_ucsi_reg {
+	u8 num_ports;
+	u8 port_updt;
+	u8 port_data[4];
+	u8 checksum;
+	u8 reserved;
+} __packed;
+
+struct gaokun_ucsi_port {
+	struct completion usb_ack;
+	spinlock_t lock;
+
+	struct gaokun_ucsi *ucsi;
+	struct auxiliary_device *bridge;
+
+	int idx;
+	enum gaokun_ucsi_ccx ccx;
+	enum gaokun_ucsi_mux mux;
+	u8 mode;
+	u16 svid;
+	u8 hpd_state;
+	u8 hpd_irq;
+};
+
+struct gaokun_ucsi {
+	struct gaokun_ec *ec;
+	struct ucsi *ucsi;
+	struct gaokun_ucsi_port *ports;
+	struct device *dev;
+	struct delayed_work work;
+	struct notifier_block nb;
+	u16 version;
+	u8 num_ports;
+};
+
+/* -------------------------------------------------------------------------- */
+/* For UCSI */
+
+static int gaokun_ucsi_read_version(struct ucsi *ucsi, u16 *version)
+{
+	struct gaokun_ucsi *uec = ucsi_get_drvdata(ucsi);
+
+	*version = uec->version;
+
+	return 0;
+}
+
+static int gaokun_ucsi_read_cci(struct ucsi *ucsi, u32 *cci)
+{
+	struct gaokun_ucsi *uec = ucsi_get_drvdata(ucsi);
+	u8 buf[GAOKUN_UCSI_READ_SIZE];
+	int ret;
+
+	ret = gaokun_ec_ucsi_read(uec->ec, buf);
+	if (ret)
+		return ret;
+
+	memcpy(cci, buf, sizeof(*cci));
+
+	return 0;
+}
+
+static int gaokun_ucsi_read_message_in(struct ucsi *ucsi,
+				       void *val, size_t val_len)
+{
+	struct gaokun_ucsi *uec = ucsi_get_drvdata(ucsi);
+	u8 buf[GAOKUN_UCSI_READ_SIZE];
+	int ret;
+
+	ret = gaokun_ec_ucsi_read(uec->ec, buf);
+	if (ret)
+		return ret;
+
+	memcpy(val, buf + GAOKUN_UCSI_CCI_SIZE,
+	       min(val_len, GAOKUN_UCSI_DATA_SIZE));
+
+	return 0;
+}
+
+static int gaokun_ucsi_async_control(struct ucsi *ucsi, u64 command)
+{
+	struct gaokun_ucsi *uec = ucsi_get_drvdata(ucsi);
+	u8 buf[GAOKUN_UCSI_WRITE_SIZE] = {};
+
+	memcpy(buf, &command, sizeof(command));
+
+	return gaokun_ec_ucsi_write(uec->ec, buf);
+}
+
+static void gaokun_ucsi_update_connector(struct ucsi_connector *con)
+{
+	struct gaokun_ucsi *uec = ucsi_get_drvdata(con->ucsi);
+
+	if (con->num > uec->num_ports)
+		return;
+
+	con->typec_cap.orientation_aware = true;
+}
+
+static void gaokun_set_orientation(struct ucsi_connector *con,
+				   struct gaokun_ucsi_port *port)
+{
+	enum gaokun_ucsi_ccx ccx;
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+	ccx = port->ccx;
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	typec_set_orientation(con->port, CCX_TO_ORI(ccx));
+}
+
+static void gaokun_ucsi_connector_status(struct ucsi_connector *con)
+{
+	struct gaokun_ucsi *uec = ucsi_get_drvdata(con->ucsi);
+	int idx;
+
+	idx = con->num - 1;
+	if (con->num > uec->num_ports) {
+		dev_warn(uec->dev, "set orientation out of range: con%d\n", idx);
+		return;
+	}
+
+	gaokun_set_orientation(con, &uec->ports[idx]);
+}
+
+const struct ucsi_operations gaokun_ucsi_ops = {
+	.read_version = gaokun_ucsi_read_version,
+	.read_cci = gaokun_ucsi_read_cci,
+	.read_message_in = gaokun_ucsi_read_message_in,
+	.sync_control = ucsi_sync_control_common,
+	.async_control = gaokun_ucsi_async_control,
+	.update_connector = gaokun_ucsi_update_connector,
+	.connector_status = gaokun_ucsi_connector_status,
+};
+
+/* -------------------------------------------------------------------------- */
+/* For Altmode */
+
+static void gaokun_ucsi_port_update(struct gaokun_ucsi_port *port,
+				    const u8 *port_data)
+{
+	struct gaokun_ucsi *uec = port->ucsi;
+	int offset = port->idx * 2; /* every port has 2 Bytes data */
+	unsigned long flags;
+	u8 dcc, ddi;
+
+	dcc = port_data[offset];
+	ddi = port_data[offset + 1];
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	port->ccx = FIELD_GET(GAOKUN_CCX_MASK, dcc);
+	port->mux = FIELD_GET(GAOKUN_MUX_MASK, dcc);
+	port->mode = FIELD_GET(GAOKUN_DPAM_MASK, ddi);
+	port->hpd_state = FIELD_GET(GAOKUN_HPD_STATE_MASK, ddi);
+	port->hpd_irq = FIELD_GET(GAOKUN_HPD_IRQ_MASK, ddi);
+
+	/* Mode and SVID are unused; keeping them to make things clearer */
+	switch (port->mode) {
+	case USBC_DPAM_PAN_C:
+	case USBC_DPAM_PAN_C_REVERSE:
+		port->mode = DP_PIN_ASSIGN_C; /* correct it for usb later */
+		break;
+	case USBC_DPAM_PAN_D:
+	case USBC_DPAM_PAN_D_REVERSE:
+		port->mode = DP_PIN_ASSIGN_D;
+		break;
+	case USBC_DPAM_PAN_E:
+	case USBC_DPAM_PAN_E_REVERSE:
+		port->mode = DP_PIN_ASSIGN_E;
+		break;
+	case USBC_DPAM_PAN_NONE:
+		port->mode = TYPEC_STATE_SAFE;
+		break;
+	default:
+		dev_warn(uec->dev, "unknown mode %d\n", port->mode);
+		break;
+	}
+
+	switch (port->mux) {
+	case USBC_MUX_NONE:
+		port->svid = 0;
+		break;
+	case USBC_MUX_USB_2L:
+		port->svid = USB_SID_PD;
+		port->mode = TYPEC_STATE_USB; /* same as PAN_C, correct it */
+		break;
+	case USBC_MUX_DP_4L:
+	case USBC_MUX_USB_DP:
+		port->svid = USB_SID_DISPLAYPORT;
+		break;
+	default:
+		dev_warn(uec->dev, "unknown mux state %d\n", port->mux);
+		break;
+	}
+
+	spin_unlock_irqrestore(&port->lock, flags);
+}
+
+static int gaokun_ucsi_refresh(struct gaokun_ucsi *uec)
+{
+	struct gaokun_ucsi_reg ureg;
+	int ret, idx;
+
+	ret = gaokun_ec_ucsi_get_reg(uec->ec, &ureg);
+	if (ret)
+		return GAOKUN_UCSI_NO_PORT_UPDATE;
+
+	uec->num_ports = ureg.num_ports;
+	idx = GET_IDX(ureg.port_updt);
+
+	if (idx < 0 || idx >= ureg.num_ports)
+		return GAOKUN_UCSI_NO_PORT_UPDATE;
+
+	gaokun_ucsi_port_update(&uec->ports[idx], ureg.port_data);
+	return idx;
+}
+
+static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
+{
+	struct gaokun_ucsi *uec = port->ucsi;
+	int idx = port->idx;
+
+	if (idx >= uec->ucsi->cap.num_connectors) {
+		dev_warn(uec->dev, "altmode port out of range: %d\n", idx);
+		return;
+	}
+
+	/* UCSI callback .connector_status() have set orientation */
+	if (port->bridge)
+		drm_aux_hpd_bridge_notify(&port->bridge->dev,
+					  port->hpd_state ?
+					  connector_status_connected :
+					  connector_status_disconnected);
+
+	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
+}
+
+static void gaokun_ucsi_altmode_notify_ind(struct gaokun_ucsi *uec)
+{
+	int idx;
+
+	if (!uec->ucsi->connector) { /* slow to register */
+		dev_err(uec->dev, "ucsi connector is not initialized yet\n");
+		return;
+	}
+
+	idx = gaokun_ucsi_refresh(uec);
+	if (idx == GAOKUN_UCSI_NO_PORT_UPDATE)
+		gaokun_ec_ucsi_pan_ack(uec->ec, idx); /* ack directly if no update */
+	else
+		gaokun_ucsi_handle_altmode(&uec->ports[idx]);
+}
+
+/*
+ * When inserting, 2 UCSI events(connector change) are followed by USB events.
+ * If we received one USB event, that means USB events are not blocked, so we
+ * can complelte for all ports, and we should signal all events.
+ */
+static void gaokun_ucsi_complete_usb_ack(struct gaokun_ucsi *uec)
+{
+	struct gaokun_ucsi_port *port;
+	int idx = 0;
+
+	while (idx < uec->num_ports) {
+		port = &uec->ports[idx++];
+		if (!completion_done(&port->usb_ack))
+			complete_all(&port->usb_ack);
+	}
+}
+
+/*
+ * USB event is necessary for enabling altmode, the event should follow
+ * UCSI event, if not after timeout(this notify may be disabled somehow),
+ * then force to enable altmode.
+ */
+static void gaokun_ucsi_handle_no_usb_event(struct gaokun_ucsi *uec, int idx)
+{
+	struct gaokun_ucsi_port *port;
+
+	port = &uec->ports[idx];
+	if (!wait_for_completion_timeout(&port->usb_ack, 2 * HZ)) {
+		dev_warn(uec->dev, "No USB EVENT, triggered by UCSI EVENT");
+		gaokun_ucsi_altmode_notify_ind(uec);
+	}
+}
+
+static int gaokun_ucsi_notify(struct notifier_block *nb,
+			      unsigned long action, void *data)
+{
+	u32 cci;
+	struct gaokun_ucsi *uec = container_of(nb, struct gaokun_ucsi, nb);
+
+	switch (action) {
+	case EC_EVENT_USB:
+		gaokun_ucsi_complete_usb_ack(uec);
+		gaokun_ucsi_altmode_notify_ind(uec);
+		return NOTIFY_OK;
+
+	case EC_EVENT_UCSI:
+		gaokun_ucsi_read_cci(uec->ucsi, &cci);
+		ucsi_notify_common(uec->ucsi, cci);
+		if (UCSI_CCI_CONNECTOR(cci))
+			gaokun_ucsi_handle_no_usb_event(uec, UCSI_CCI_CONNECTOR(cci) - 1);
+
+		return NOTIFY_OK;
+
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
+{
+	struct gaokun_ucsi_port *ucsi_port;
+	struct gaokun_ucsi_reg ureg = {};
+	struct device *dev = uec->dev;
+	struct fwnode_handle *fwnode;
+	int i, ret, num_ports;
+	u32 port;
+
+	gaokun_ec_ucsi_get_reg(uec->ec, &ureg);
+	num_ports = ureg.num_ports;
+	uec->num_ports = num_ports;
+
+	uec->ports = devm_kcalloc(dev, num_ports, sizeof(*(uec->ports)),
+				  GFP_KERNEL);
+	if (!uec->ports)
+		return -ENOMEM;
+
+	for (i = 0; i < num_ports; ++i) {
+		ucsi_port = &uec->ports[i];
+		ucsi_port->ccx = USBC_CCX_NONE;
+		ucsi_port->idx = i;
+		ucsi_port->ucsi = uec;
+		init_completion(&ucsi_port->usb_ack);
+		spin_lock_init(&ucsi_port->lock);
+	}
+
+	device_for_each_child_node(dev, fwnode) {
+		ret = fwnode_property_read_u32(fwnode, "reg", &port);
+		if (ret < 0) {
+			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			fwnode_handle_put(fwnode);
+			return ret;
+		}
+
+		if (port >= num_ports) {
+			dev_warn(dev, "invalid connector number %d, ignoring\n", port);
+			continue;
+		}
+
+		ucsi_port = &uec->ports[port];
+		ucsi_port->bridge = devm_drm_dp_hpd_bridge_alloc(dev, to_of_node(fwnode));
+		if (IS_ERR(ucsi_port->bridge)) {
+			fwnode_handle_put(fwnode);
+			return PTR_ERR(ucsi_port->bridge);
+		}
+	}
+
+	for (i = 0; i < num_ports; i++) {
+		if (!uec->ports[i].bridge)
+			continue;
+
+		ret = devm_drm_dp_hpd_bridge_add(dev, uec->ports[i].bridge);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void gaokun_ucsi_register_worker(struct work_struct *work)
+{
+	struct gaokun_ucsi *uec;
+	struct ucsi *ucsi;
+	int ret;
+
+	uec = container_of(work, struct gaokun_ucsi, work.work);
+	ucsi = uec->ucsi;
+
+	ret = gaokun_ec_register_notify(uec->ec, &uec->nb);
+	if (ret) {
+		dev_err_probe(ucsi->dev, ret, "notifier register failed\n");
+		return;
+	}
+
+	ret = ucsi_register(ucsi);
+	if (ret)
+		dev_err_probe(ucsi->dev, ret, "ucsi register failed\n");
+}
+
+static int gaokun_ucsi_probe(struct auxiliary_device *adev,
+			     const struct auxiliary_device_id *id)
+{
+	struct gaokun_ec *ec = adev->dev.platform_data;
+	struct device *dev = &adev->dev;
+	struct gaokun_ucsi *uec;
+	int ret;
+
+	uec = devm_kzalloc(dev, sizeof(*uec), GFP_KERNEL);
+	if (!uec)
+		return -ENOMEM;
+
+	uec->ec = ec;
+	uec->dev = dev;
+	uec->version = UCSI_VERSION_1_0;
+	uec->nb.notifier_call = gaokun_ucsi_notify;
+
+	INIT_DELAYED_WORK(&uec->work, gaokun_ucsi_register_worker);
+
+	ret = gaokun_ucsi_ports_init(uec);
+	if (ret)
+		return ret;
+
+	uec->ucsi = ucsi_create(dev, &gaokun_ucsi_ops);
+	if (IS_ERR(uec->ucsi))
+		return PTR_ERR(uec->ucsi);
+
+	ucsi_set_drvdata(uec->ucsi, uec);
+	auxiliary_set_drvdata(adev, uec);
+
+	/* EC can't handle UCSI properly in the early stage */
+	schedule_delayed_work(&uec->work, 3 * HZ);
+
+	return 0;
+}
+
+static void gaokun_ucsi_remove(struct auxiliary_device *adev)
+{
+	struct gaokun_ucsi *uec = auxiliary_get_drvdata(adev);
+
+	gaokun_ec_unregister_notify(uec->ec, &uec->nb);
+	ucsi_unregister(uec->ucsi);
+	ucsi_destroy(uec->ucsi);
+}
+
+static const struct auxiliary_device_id gaokun_ucsi_id_table[] = {
+	{ .name = GAOKUN_MOD_NAME "." GAOKUN_DEV_UCSI, },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, gaokun_ucsi_id_table);
+
+static struct auxiliary_driver gaokun_ucsi_driver = {
+	.name = GAOKUN_DEV_UCSI,
+	.id_table = gaokun_ucsi_id_table,
+	.probe = gaokun_ucsi_probe,
+	.remove = gaokun_ucsi_remove,
+};
+
+module_auxiliary_driver(gaokun_ucsi_driver);
+
+MODULE_DESCRIPTION("HUAWEI Matebook E Go UCSI driver");
+MODULE_LICENSE("GPL");
-- 
2.47.1


