Return-Path: <linux-usb+bounces-21860-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B49C5A67C9F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 20:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03AE2420EEF
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 19:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33AB213E79;
	Tue, 18 Mar 2025 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQIlCHak"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5856620E018
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742324720; cv=none; b=Ht3KdUmWdsTdigxhBh17nS3m3LeAd2areNCTu/qQTsAAUxlFjvKvEyqO4CActFWR2/3II95t4yv/5Nvvxgh9UvNJ2pwVOQuahOdeAkOahSzPJ1szYB+Ht14SIspM4ICakBb3yH/0FTY3ndGxjPKve6r/69lSf5MGL1LeqY01rAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742324720; c=relaxed/simple;
	bh=KPD4M9YXpngjzjMAYvFWkA7PLf28hk9SzfHE9xlYjwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BiVWPFPA6mDyWTCte6Kkp5Rl9UFaV1RMNJziUhrHOQw70fO+ftX+FlGQC/2DLMFjof5TFTbahMkrieVUP2QG4DJjn8Ow8ls5fOB4PuzQbXis+iL5vhmTHPlFZ0kIDgYjv5oZY3UvXJmBlp0XuqvGOaIBxpvRFGNxnrVCD2ju6s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQIlCHak; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IIBJKh003993
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yo9mRoBLLytFuPM2Nsx3XSj9af46eIcXosR/HAQyAYs=; b=NQIlCHakOeKzoGI1
	V24hW0Y9YqYZA4nWDO+OUot8SfAuLaxjPQqlFyyXBYAQuNPDGY6RQ9x0abfxqKdl
	VSV3KLBXmwDqarHBEYHu7ClJXKLHHmpystmRu8UIf+WgfZdbXhQit8LMUg6CaX+6
	tnGqMFd96pcBUh21zJzCd8u2EH25hNJERcKYUuq5l0HJMhfynnHBx9HN6TEyCI01
	+IXGM10itg5QHIrIROo7s9R2Z94Hci1aMl6JxQs1gk9/jWlf+sPuP6tfRQ23PblF
	sSd4pbMyp/8Tg9g7rkwEMzALDkLmRCwZZMfRXFA9+pfo+FMNNjV3DemypWufr4pc
	X2EHkA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdvxg453-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 19:05:12 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3f6954eed77so1847194b6e.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 12:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742324712; x=1742929512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yo9mRoBLLytFuPM2Nsx3XSj9af46eIcXosR/HAQyAYs=;
        b=dD0o1X8564267gB3A63O6SMEdloOwJzCpdQYNWR+LjIrq7hnO3Tq3TSEiFUJHmQgfv
         AzSbJ8zM5KYLu74WSzGOCjBpdoqzP++PoL7fKf8JsrLdx9s7d4qfqeE8eyZb90/VgqYg
         rb5ct9XqXTjvwo7oXsCjGPC/GF5teM+v+UQ/Y2E6y0DOD4SipKAeKCCUYsmDnx+5oHNd
         k4V1rL6XEa0UzQ+5NK1E9tMhVcFydXGYHIlp5nLe0qDyKpLcDvb0JERNdppnp1sAT8F/
         uO5jW3rMLKie+MSwNMX5QJ5HjUjPmv3MydONacmSVxNU/ZRirt3TqC+uE0sHF3SsuYfc
         LiAw==
X-Forwarded-Encrypted: i=1; AJvYcCVpOrBpD/6xm50Mb5gCk4txc20fa2432Z2tzDzdOlUw48EwciKyV1c8VIdu7G2xW/ICSgzNzztombs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUAmYIcIxh69sqGiThhh8tRxBrhKIElenx1b4TvHTK78OTCAjg
	Sc2Mi6t+/FabvotMnbEdjKGvR2QvI6HG4cAhUxrgaVSkuZxc9pnR5ebqEj8TI/HbTBO1IT8UYNm
	Al7YmHw6DOT108YzDAVQPOeAK3RXo1oG7PdlyFcaDh8aGq9HdNrkzfbVKDsU=
X-Gm-Gg: ASbGncu9qAgSAak6pmwo4QbWVRFLBDqfa6qsJyzkBPIbUdxZAqDd9RJEBotpIio1rfQ
	3vFjYewBuE+AW7trlUOpakB5KUuRsPc+yOg9Zn6JTuRepG1IcOmCQvvYNYuxV/P5f0XONDe2emt
	d6q/4YGcZtu0ofokahE3jZ2sPsmPTHIpLRZX2kJQK6EN7k5W9+bz3PxhOfx7o+hP0m0l82P0K9M
	3GAjIT46sgprHya5lzQPe9tJsDsdxI2OquMNrSYp8K0VZMx5byTpukmrCT3V71UMHlBcW+5Dqmo
	WCzWmSPJ8tyZ+liMx/1xgRYrbDsxnSu3u4HWnS4ElBIXVzcrTR9ePVPV8/Wxvw5fPtKXuUC1UNB
	2Rt7X9lcTfQO1lKc=
X-Received: by 2002:a05:6808:2d5:b0:3f9:2fdc:ee93 with SMTP id 5614622812f47-3fea18ab8e2mr2492558b6e.30.1742324711516;
        Tue, 18 Mar 2025 12:05:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7BonB7TGTdqgyZJakhWOnNbZirZhIDQ5bV4pkhkKuJ9HjAgv7ZdgnfaJYwHXRHcXxe4Oc/g==
X-Received: by 2002:a05:6808:2d5:b0:3f9:2fdc:ee93 with SMTP id 5614622812f47-3fea18ab8e2mr2492526b6e.30.1742324711034;
        Tue, 18 Mar 2025 12:05:11 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b065sm2264273b6e.4.2025.03.18.12.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 12:05:10 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 14:05:01 -0500
Subject: [PATCH v5 1/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-dwc3-refactor-v5-1-90ea6e5b3ba4@oss.qualcomm.com>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
In-Reply-To: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=27744;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=KPD4M9YXpngjzjMAYvFWkA7PLf28hk9SzfHE9xlYjwc=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn2cPjQ/egA2s7ikIroSiYcNkawcopAd2Vr1iaB
 S/xKXEN4S+JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ9nD4xUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWxtA/+J3y07mC2+kyupBl5uDz3K7W1MPt4mP9Ssggvrm1
 I+qsOhy5/5w9hP3c/EB8u/jzF/qCCrmsdKHrFmORgXdiGP/C5bqMGcCi4RCqDnO8sKME5ydnchM
 YrQbVwlHiTzPtBU8QaA50dzPBxLzUxxL/uRsU9imEJYZS6OocqQYqQbOqnBygLIdFAxQ/F/A4jR
 /Qhr7qHzWSgM2jbD93UtIzGWveWwrngEOk6fvaQmqQzGNNzdZSV/cEsFCt7Y4vycqWwJinbX75U
 Rq+5t/20Ohiu8wOHiHagetAg332LM03qgs9OMd/V178gIClVR94MiXQAnKLZ5/52wbYwrXdb+Ls
 m5A4puHsm3yo2lW4lUiHOuWlwsRvOv5VtIWJ25SncoOMw9Rv3NvPlxlWZKBW3woMiv319681Hk8
 TLRJWkKj6oQNXUrRAscskyu+jc69lshn1wtlMI7ylKQhSL/6djvWCeW5Q5uFkqKsfrNjVCtUZta
 ZB4o9ryocYGz3v3D8MuSEmpZ3sfKxjaHlP7+mJczXjie7iyl7cnb1yEM1XcuGAZBPUmPXB91ZBt
 WDHvancuEb3mSL27gpSsgwsI7s/FlAkNH1djxRFhfpLgl23miyiPWrOTPNqoMpo11SS3TXNT1ag
 O5P3gGaTRBooBL9QBz69cWTATXfSUANxCKZVx5CviM/E=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=67d9c3e8 cx=c_pps a=WJcna6AvsNCxL/DJwPP1KA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=5k_pm2BD3DQxMjm8UnsA:9 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: Dr6D0gE4UDsjKlP1uZGd2aDZ0zAzABIR
X-Proofpoint-GUID: Dr6D0gE4UDsjKlP1uZGd2aDZ0zAzABIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180137

In order to more tightly integrate the Qualcomm glue driver with the
dwc3 core the driver is redesigned to avoid splitting the implementation
using the driver model. But due to the strong coupling to the Devicetree
binding needs to be updated as well.

Various ways to provide backwards compatibility with existing Devicetree
blobs has been explored, but migrating the Devicetree information
between the old and the new binding is non-trivial.

For the vast majority of boards out there, the kernel and Devicetree are
generated and handled together, which in practice means that backwards
compatibility needs to be managed across about 1 kernel release.

For some though, such as the various Snapdragon laptops, the Devicetree
blobs live a life separate of the kernel. In each one of these, with the
continued extension of new features, it's recommended that users would
upgrade their Devicetree somewhat frequently.

With this in mind, simply carrying a snapshot/copy of the current driver
is simpler than creating and maintaining the migration code.

The driver is kept under the same Kconfig option, to ensure that Linux
distributions doesn't drop USB support on these platforms.

The driver, which is going to be refactored to handle the newly
introduced qcom,snps-dwc3 compatible, is updated to temporarily not
match against any compatible.

This driver should be removed after the next LTS release.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/Makefile           |   1 +
 drivers/usb/dwc3/dwc3-qcom-legacy.c | 935 ++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/dwc3-qcom.c        |   1 -
 3 files changed, 936 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 124eda2522d9c1f4caab222ec9770d0deaf655fc..830e6c9e5fe073c1f662ce34b6a4a2da34c407a2 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_USB_DWC3_MESON_G12A)	+= dwc3-meson-g12a.o
 obj-$(CONFIG_USB_DWC3_OF_SIMPLE)	+= dwc3-of-simple.o
 obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
+obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom-legacy.o
 obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
diff --git a/drivers/usb/dwc3/dwc3-qcom-legacy.c b/drivers/usb/dwc3/dwc3-qcom-legacy.c
new file mode 100644
index 0000000000000000000000000000000000000000..38b9b0bc8b88d5e82f1021a41c7858e303048803
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-qcom-legacy.c
@@ -0,0 +1,935 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ *
+ * Inspired by dwc3-of-simple.c
+ */
+
+#include <linux/cleanup.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/clk.h>
+#include <linux/irq.h>
+#include <linux/of_clk.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/extcon.h>
+#include <linux/interconnect.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+#include <linux/usb/of.h>
+#include <linux/reset.h>
+#include <linux/iopoll.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb.h>
+#include "core.h"
+
+/* USB QSCRATCH Hardware registers */
+#define QSCRATCH_HS_PHY_CTRL			0x10
+#define UTMI_OTG_VBUS_VALID			BIT(20)
+#define SW_SESSVLD_SEL				BIT(28)
+
+#define QSCRATCH_SS_PHY_CTRL			0x30
+#define LANE0_PWR_PRESENT			BIT(24)
+
+#define QSCRATCH_GENERAL_CFG			0x08
+#define PIPE_UTMI_CLK_SEL			BIT(0)
+#define PIPE3_PHYSTATUS_SW			BIT(3)
+#define PIPE_UTMI_CLK_DIS			BIT(8)
+
+#define PWR_EVNT_LPM_IN_L2_MASK			BIT(4)
+#define PWR_EVNT_LPM_OUT_L2_MASK		BIT(5)
+
+#define SDM845_QSCRATCH_BASE_OFFSET		0xf8800
+#define SDM845_QSCRATCH_SIZE			0x400
+#define SDM845_DWC3_CORE_SIZE			0xcd00
+
+/* Interconnect path bandwidths in MBps */
+#define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
+#define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
+#define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
+#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
+#define APPS_USB_AVG_BW 0
+#define APPS_USB_PEAK_BW MBps_to_icc(40)
+
+/* Qualcomm SoCs with multiport support has up to 4 ports */
+#define DWC3_QCOM_MAX_PORTS	4
+
+static const u32 pwr_evnt_irq_stat_reg[DWC3_QCOM_MAX_PORTS] = {
+	0x58,
+	0x1dc,
+	0x228,
+	0x238,
+};
+
+struct dwc3_qcom_port {
+	int			qusb2_phy_irq;
+	int			dp_hs_phy_irq;
+	int			dm_hs_phy_irq;
+	int			ss_phy_irq;
+	enum usb_device_speed	usb2_speed;
+};
+
+struct dwc3_qcom {
+	struct device		*dev;
+	void __iomem		*qscratch_base;
+	struct platform_device	*dwc3;
+	struct clk		**clks;
+	int			num_clocks;
+	struct reset_control	*resets;
+	struct dwc3_qcom_port	ports[DWC3_QCOM_MAX_PORTS];
+	u8			num_ports;
+
+	struct extcon_dev	*edev;
+	struct extcon_dev	*host_edev;
+	struct notifier_block	vbus_nb;
+	struct notifier_block	host_nb;
+
+	enum usb_dr_mode	mode;
+	bool			is_suspended;
+	bool			pm_suspended;
+	struct icc_path		*icc_path_ddr;
+	struct icc_path		*icc_path_apps;
+};
+
+static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	reg |= val;
+	writel(reg, base + offset);
+
+	/* ensure that above write is through */
+	readl(base + offset);
+}
+
+static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	reg &= ~val;
+	writel(reg, base + offset);
+
+	/* ensure that above write is through */
+	readl(base + offset);
+}
+
+static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
+{
+	if (enable) {
+		dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_SS_PHY_CTRL,
+				  LANE0_PWR_PRESENT);
+		dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_HS_PHY_CTRL,
+				  UTMI_OTG_VBUS_VALID | SW_SESSVLD_SEL);
+	} else {
+		dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_SS_PHY_CTRL,
+				  LANE0_PWR_PRESENT);
+		dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_HS_PHY_CTRL,
+				  UTMI_OTG_VBUS_VALID | SW_SESSVLD_SEL);
+	}
+}
+
+static int dwc3_qcom_vbus_notifier(struct notifier_block *nb,
+				   unsigned long event, void *ptr)
+{
+	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, vbus_nb);
+
+	/* enable vbus override for device mode */
+	dwc3_qcom_vbus_override_enable(qcom, event);
+	qcom->mode = event ? USB_DR_MODE_PERIPHERAL : USB_DR_MODE_HOST;
+
+	return NOTIFY_DONE;
+}
+
+static int dwc3_qcom_host_notifier(struct notifier_block *nb,
+				   unsigned long event, void *ptr)
+{
+	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, host_nb);
+
+	/* disable vbus override in host mode */
+	dwc3_qcom_vbus_override_enable(qcom, !event);
+	qcom->mode = event ? USB_DR_MODE_HOST : USB_DR_MODE_PERIPHERAL;
+
+	return NOTIFY_DONE;
+}
+
+static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
+{
+	struct device		*dev = qcom->dev;
+	struct extcon_dev	*host_edev;
+	int			ret;
+
+	if (!of_property_present(dev->of_node, "extcon"))
+		return 0;
+
+	qcom->edev = extcon_get_edev_by_phandle(dev, 0);
+	if (IS_ERR(qcom->edev))
+		return dev_err_probe(dev, PTR_ERR(qcom->edev),
+				     "Failed to get extcon\n");
+
+	qcom->vbus_nb.notifier_call = dwc3_qcom_vbus_notifier;
+
+	qcom->host_edev = extcon_get_edev_by_phandle(dev, 1);
+	if (IS_ERR(qcom->host_edev))
+		qcom->host_edev = NULL;
+
+	ret = devm_extcon_register_notifier(dev, qcom->edev, EXTCON_USB,
+					    &qcom->vbus_nb);
+	if (ret < 0) {
+		dev_err(dev, "VBUS notifier register failed\n");
+		return ret;
+	}
+
+	if (qcom->host_edev)
+		host_edev = qcom->host_edev;
+	else
+		host_edev = qcom->edev;
+
+	qcom->host_nb.notifier_call = dwc3_qcom_host_notifier;
+	ret = devm_extcon_register_notifier(dev, host_edev, EXTCON_USB_HOST,
+					    &qcom->host_nb);
+	if (ret < 0) {
+		dev_err(dev, "Host notifier register failed\n");
+		return ret;
+	}
+
+	/* Update initial VBUS override based on extcon state */
+	if (extcon_get_state(qcom->edev, EXTCON_USB) ||
+	    !extcon_get_state(host_edev, EXTCON_USB_HOST))
+		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, true, qcom->edev);
+	else
+		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, false, qcom->edev);
+
+	return 0;
+}
+
+static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
+{
+	int ret;
+
+	ret = icc_enable(qcom->icc_path_ddr);
+	if (ret)
+		return ret;
+
+	ret = icc_enable(qcom->icc_path_apps);
+	if (ret)
+		icc_disable(qcom->icc_path_ddr);
+
+	return ret;
+}
+
+static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
+{
+	int ret;
+
+	ret = icc_disable(qcom->icc_path_ddr);
+	if (ret)
+		return ret;
+
+	ret = icc_disable(qcom->icc_path_apps);
+	if (ret)
+		icc_enable(qcom->icc_path_ddr);
+
+	return ret;
+}
+
+/**
+ * dwc3_qcom_interconnect_init() - Get interconnect path handles
+ * and set bandwidth.
+ * @qcom:			Pointer to the concerned usb core.
+ *
+ */
+static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
+{
+	enum usb_device_speed max_speed;
+	struct device *dev = qcom->dev;
+	int ret;
+
+	qcom->icc_path_ddr = of_icc_get(dev, "usb-ddr");
+	if (IS_ERR(qcom->icc_path_ddr)) {
+		return dev_err_probe(dev, PTR_ERR(qcom->icc_path_ddr),
+				     "failed to get usb-ddr path\n");
+	}
+
+	qcom->icc_path_apps = of_icc_get(dev, "apps-usb");
+	if (IS_ERR(qcom->icc_path_apps)) {
+		ret = dev_err_probe(dev, PTR_ERR(qcom->icc_path_apps),
+				    "failed to get apps-usb path\n");
+		goto put_path_ddr;
+	}
+
+	max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);
+	if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN) {
+		ret = icc_set_bw(qcom->icc_path_ddr,
+				USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
+	} else {
+		ret = icc_set_bw(qcom->icc_path_ddr,
+				USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
+	}
+	if (ret) {
+		dev_err(dev, "failed to set bandwidth for usb-ddr path: %d\n", ret);
+		goto put_path_apps;
+	}
+
+	ret = icc_set_bw(qcom->icc_path_apps, APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
+	if (ret) {
+		dev_err(dev, "failed to set bandwidth for apps-usb path: %d\n", ret);
+		goto put_path_apps;
+	}
+
+	return 0;
+
+put_path_apps:
+	icc_put(qcom->icc_path_apps);
+put_path_ddr:
+	icc_put(qcom->icc_path_ddr);
+	return ret;
+}
+
+/**
+ * dwc3_qcom_interconnect_exit() - Release interconnect path handles
+ * @qcom:			Pointer to the concerned usb core.
+ *
+ * This function is used to release interconnect path handle.
+ */
+static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
+{
+	icc_put(qcom->icc_path_ddr);
+	icc_put(qcom->icc_path_apps);
+}
+
+/* Only usable in contexts where the role can not change. */
+static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
+{
+	struct dwc3 *dwc;
+
+	/*
+	 * FIXME: Fix this layering violation.
+	 */
+	dwc = platform_get_drvdata(qcom->dwc3);
+
+	/* Core driver may not have probed yet. */
+	if (!dwc)
+		return false;
+
+	return dwc->xhci;
+}
+
+static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
+{
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
+	struct usb_device *udev;
+	struct usb_hcd __maybe_unused *hcd;
+
+	/*
+	 * FIXME: Fix this layering violation.
+	 */
+	hcd = platform_get_drvdata(dwc->xhci);
+
+#ifdef CONFIG_USB
+	udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
+#else
+	udev = NULL;
+#endif
+	if (!udev)
+		return USB_SPEED_UNKNOWN;
+
+	return udev->speed;
+}
+
+static void dwc3_qcom_enable_wakeup_irq(int irq, unsigned int polarity)
+{
+	if (!irq)
+		return;
+
+	if (polarity)
+		irq_set_irq_type(irq, polarity);
+
+	enable_irq(irq);
+	enable_irq_wake(irq);
+}
+
+static void dwc3_qcom_disable_wakeup_irq(int irq)
+{
+	if (!irq)
+		return;
+
+	disable_irq_wake(irq);
+	disable_irq_nosync(irq);
+}
+
+static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
+{
+	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
+
+	if (port->usb2_speed == USB_SPEED_LOW) {
+		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
+			(port->usb2_speed == USB_SPEED_FULL)) {
+		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+	} else {
+		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+	}
+
+	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
+}
+
+static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
+{
+	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
+
+	/*
+	 * Configure DP/DM line interrupts based on the USB2 device attached to
+	 * the root hub port. When HS/FS device is connected, configure the DP line
+	 * as falling edge to detect both disconnect and remote wakeup scenarios. When
+	 * LS device is connected, configure DM line as falling edge to detect both
+	 * disconnect and remote wakeup. When no device is connected, configure both
+	 * DP and DM lines as rising edge to detect HS/HS/LS device connect scenario.
+	 */
+
+	if (port->usb2_speed == USB_SPEED_LOW) {
+		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+					    IRQ_TYPE_EDGE_FALLING);
+	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
+			(port->usb2_speed == USB_SPEED_FULL)) {
+		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+					    IRQ_TYPE_EDGE_FALLING);
+	} else {
+		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+					    IRQ_TYPE_EDGE_RISING);
+		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+					    IRQ_TYPE_EDGE_RISING);
+	}
+
+	dwc3_qcom_enable_wakeup_irq(port->ss_phy_irq, 0);
+}
+
+static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
+{
+	int i;
+
+	for (i = 0; i < qcom->num_ports; i++)
+		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+}
+
+static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
+{
+	int i;
+
+	for (i = 0; i < qcom->num_ports; i++)
+		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+}
+
+static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
+{
+	u32 val;
+	int i, ret;
+
+	if (qcom->is_suspended)
+		return 0;
+
+	for (i = 0; i < qcom->num_ports; i++) {
+		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
+		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
+			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
+	}
+
+	for (i = qcom->num_clocks - 1; i >= 0; i--)
+		clk_disable_unprepare(qcom->clks[i]);
+
+	ret = dwc3_qcom_interconnect_disable(qcom);
+	if (ret)
+		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
+
+	/*
+	 * The role is stable during suspend as role switching is done from a
+	 * freezable workqueue.
+	 */
+	if (dwc3_qcom_is_host(qcom) && wakeup) {
+		for (i = 0; i < qcom->num_ports; i++)
+			qcom->ports[i].usb2_speed = dwc3_qcom_read_usb2_speed(qcom, i);
+		dwc3_qcom_enable_interrupts(qcom);
+	}
+
+	qcom->is_suspended = true;
+
+	return 0;
+}
+
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+{
+	int ret;
+	int i;
+
+	if (!qcom->is_suspended)
+		return 0;
+
+	if (dwc3_qcom_is_host(qcom) && wakeup)
+		dwc3_qcom_disable_interrupts(qcom);
+
+	for (i = 0; i < qcom->num_clocks; i++) {
+		ret = clk_prepare_enable(qcom->clks[i]);
+		if (ret < 0) {
+			while (--i >= 0)
+				clk_disable_unprepare(qcom->clks[i]);
+			return ret;
+		}
+	}
+
+	ret = dwc3_qcom_interconnect_enable(qcom);
+	if (ret)
+		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
+
+	/* Clear existing events from PHY related to L2 in/out */
+	for (i = 0; i < qcom->num_ports; i++) {
+		dwc3_qcom_setbits(qcom->qscratch_base,
+				  pwr_evnt_irq_stat_reg[i],
+				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
+	}
+
+	qcom->is_suspended = false;
+
+	return 0;
+}
+
+static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
+{
+	struct dwc3_qcom *qcom = data;
+	struct dwc3	*dwc = platform_get_drvdata(qcom->dwc3);
+
+	/* If pm_suspended then let pm_resume take care of resuming h/w */
+	if (qcom->pm_suspended)
+		return IRQ_HANDLED;
+
+	/*
+	 * This is safe as role switching is done from a freezable workqueue
+	 * and the wakeup interrupts are disabled as part of resume.
+	 */
+	if (dwc3_qcom_is_host(qcom))
+		pm_runtime_resume(&dwc->xhci->dev);
+
+	return IRQ_HANDLED;
+}
+
+static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
+{
+	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+}
+
+static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
+				 const char *name)
+{
+	int ret;
+
+	/* Keep wakeup interrupts disabled until suspend */
+	ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
+					qcom_dwc3_resume_irq,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					name, qcom);
+	if (ret)
+		dev_err(qcom->dev, "failed to request irq %s: %d\n", name, ret);
+
+	return ret;
+}
+
+static int dwc3_qcom_setup_port_irq(struct platform_device *pdev, int port_index, bool is_multiport)
+{
+	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+	const char *irq_name;
+	int irq;
+	int ret;
+
+	if (is_multiport)
+		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "dp_hs_phy_%d", port_index + 1);
+	else
+		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "dp_hs_phy_irq");
+	if (!irq_name)
+		return -ENOMEM;
+
+	irq = platform_get_irq_byname_optional(pdev, irq_name);
+	if (irq > 0) {
+		ret = dwc3_qcom_request_irq(qcom, irq, irq_name);
+		if (ret)
+			return ret;
+		qcom->ports[port_index].dp_hs_phy_irq = irq;
+	}
+
+	if (is_multiport)
+		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "dm_hs_phy_%d", port_index + 1);
+	else
+		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "dm_hs_phy_irq");
+	if (!irq_name)
+		return -ENOMEM;
+
+	irq = platform_get_irq_byname_optional(pdev, irq_name);
+	if (irq > 0) {
+		ret = dwc3_qcom_request_irq(qcom, irq, irq_name);
+		if (ret)
+			return ret;
+		qcom->ports[port_index].dm_hs_phy_irq = irq;
+	}
+
+	if (is_multiport)
+		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "ss_phy_%d", port_index + 1);
+	else
+		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "ss_phy_irq");
+	if (!irq_name)
+		return -ENOMEM;
+
+	irq = platform_get_irq_byname_optional(pdev, irq_name);
+	if (irq > 0) {
+		ret = dwc3_qcom_request_irq(qcom, irq, irq_name);
+		if (ret)
+			return ret;
+		qcom->ports[port_index].ss_phy_irq = irq;
+	}
+
+	if (is_multiport)
+		return 0;
+
+	irq = platform_get_irq_byname_optional(pdev, "qusb2_phy");
+	if (irq > 0) {
+		ret = dwc3_qcom_request_irq(qcom, irq, "qusb2_phy");
+		if (ret)
+			return ret;
+		qcom->ports[port_index].qusb2_phy_irq = irq;
+	}
+
+	return 0;
+}
+
+static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
+{
+	char irq_name[14];
+	int port_num;
+	int irq;
+
+	irq = platform_get_irq_byname_optional(pdev, "dp_hs_phy_1");
+	if (irq <= 0)
+		return 1;
+
+	for (port_num = 2; port_num <= DWC3_QCOM_MAX_PORTS; port_num++) {
+		sprintf(irq_name, "dp_hs_phy_%d", port_num);
+
+		irq = platform_get_irq_byname_optional(pdev, irq_name);
+		if (irq <= 0)
+			return port_num - 1;
+	}
+
+	return DWC3_QCOM_MAX_PORTS;
+}
+
+static int dwc3_qcom_setup_irq(struct platform_device *pdev)
+{
+	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+	bool is_multiport;
+	int ret;
+	int i;
+
+	qcom->num_ports = dwc3_qcom_find_num_ports(pdev);
+	is_multiport = (qcom->num_ports > 1);
+
+	for (i = 0; i < qcom->num_ports; i++) {
+		ret = dwc3_qcom_setup_port_irq(pdev, i, is_multiport);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
+{
+	struct device		*dev = qcom->dev;
+	struct device_node	*np = dev->of_node;
+	int			i;
+
+	if (!np || !count)
+		return 0;
+
+	if (count < 0)
+		return count;
+
+	qcom->num_clocks = count;
+
+	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
+				  sizeof(struct clk *), GFP_KERNEL);
+	if (!qcom->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < qcom->num_clocks; i++) {
+		struct clk	*clk;
+		int		ret;
+
+		clk = of_clk_get(np, i);
+		if (IS_ERR(clk)) {
+			while (--i >= 0)
+				clk_put(qcom->clks[i]);
+			return PTR_ERR(clk);
+		}
+
+		ret = clk_prepare_enable(clk);
+		if (ret < 0) {
+			while (--i >= 0) {
+				clk_disable_unprepare(qcom->clks[i]);
+				clk_put(qcom->clks[i]);
+			}
+			clk_put(clk);
+
+			return ret;
+		}
+
+		qcom->clks[i] = clk;
+	}
+
+	return 0;
+}
+
+static int dwc3_qcom_of_register_core(struct platform_device *pdev)
+{
+	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
+	struct device_node	*np = pdev->dev.of_node;
+	struct device		*dev = &pdev->dev;
+	int			ret;
+
+	struct device_node *dwc3_np __free(device_node) = of_get_compatible_child(np,
+										  "snps,dwc3");
+	if (!dwc3_np) {
+		dev_err(dev, "failed to find dwc3 core child\n");
+		return -ENODEV;
+	}
+
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret) {
+		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
+		return ret;
+	}
+
+	qcom->dwc3 = of_find_device_by_node(dwc3_np);
+	if (!qcom->dwc3) {
+		ret = -ENODEV;
+		dev_err(dev, "failed to get dwc3 platform device\n");
+		of_platform_depopulate(dev);
+	}
+
+	return ret;
+}
+
+static int dwc3_qcom_probe(struct platform_device *pdev)
+{
+	struct device_node	*np = pdev->dev.of_node;
+	struct device		*dev = &pdev->dev;
+	struct dwc3_qcom	*qcom;
+	int			ret, i;
+	bool			ignore_pipe_clk;
+	bool			wakeup_source;
+
+	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
+	if (!qcom)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, qcom);
+	qcom->dev = &pdev->dev;
+
+	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
+	if (IS_ERR(qcom->resets)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
+				     "failed to get resets\n");
+	}
+
+	ret = reset_control_assert(qcom->resets);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to assert resets, err=%d\n", ret);
+		return ret;
+	}
+
+	usleep_range(10, 1000);
+
+	ret = reset_control_deassert(qcom->resets);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
+		goto reset_assert;
+	}
+
+	ret = dwc3_qcom_clk_init(qcom, of_clk_get_parent_count(np));
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to get clocks\n");
+		goto reset_assert;
+	}
+
+	qcom->qscratch_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(qcom->qscratch_base)) {
+		ret = PTR_ERR(qcom->qscratch_base);
+		goto clk_disable;
+	}
+
+	ret = dwc3_qcom_setup_irq(pdev);
+	if (ret) {
+		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
+		goto clk_disable;
+	}
+
+	/*
+	 * Disable pipe_clk requirement if specified. Used when dwc3
+	 * operates without SSPHY and only HS/FS/LS modes are supported.
+	 */
+	ignore_pipe_clk = device_property_read_bool(dev,
+				"qcom,select-utmi-as-pipe-clk");
+	if (ignore_pipe_clk)
+		dwc3_qcom_select_utmi_clk(qcom);
+
+	ret = dwc3_qcom_of_register_core(pdev);
+	if (ret) {
+		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
+		goto clk_disable;
+	}
+
+	ret = dwc3_qcom_interconnect_init(qcom);
+	if (ret)
+		goto depopulate;
+
+	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
+
+	/* enable vbus override for device mode */
+	if (qcom->mode != USB_DR_MODE_HOST)
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
+	/* register extcon to override sw_vbus on Vbus change later */
+	ret = dwc3_qcom_register_extcon(qcom);
+	if (ret)
+		goto interconnect_exit;
+
+	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
+	device_init_wakeup(&pdev->dev, wakeup_source);
+	device_init_wakeup(&qcom->dwc3->dev, wakeup_source);
+
+	qcom->is_suspended = false;
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_forbid(dev);
+
+	return 0;
+
+interconnect_exit:
+	dwc3_qcom_interconnect_exit(qcom);
+depopulate:
+	of_platform_depopulate(&pdev->dev);
+	platform_device_put(qcom->dwc3);
+clk_disable:
+	for (i = qcom->num_clocks - 1; i >= 0; i--) {
+		clk_disable_unprepare(qcom->clks[i]);
+		clk_put(qcom->clks[i]);
+	}
+reset_assert:
+	reset_control_assert(qcom->resets);
+
+	return ret;
+}
+
+static void dwc3_qcom_remove(struct platform_device *pdev)
+{
+	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	int i;
+
+	of_platform_depopulate(&pdev->dev);
+	platform_device_put(qcom->dwc3);
+
+	for (i = qcom->num_clocks - 1; i >= 0; i--) {
+		clk_disable_unprepare(qcom->clks[i]);
+		clk_put(qcom->clks[i]);
+	}
+	qcom->num_clocks = 0;
+
+	dwc3_qcom_interconnect_exit(qcom);
+	reset_control_assert(qcom->resets);
+
+	pm_runtime_allow(dev);
+	pm_runtime_disable(dev);
+}
+
+static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
+{
+	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	bool wakeup = device_may_wakeup(dev);
+	int ret;
+
+	ret = dwc3_qcom_suspend(qcom, wakeup);
+	if (ret)
+		return ret;
+
+	qcom->pm_suspended = true;
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
+{
+	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	bool wakeup = device_may_wakeup(dev);
+	int ret;
+
+	ret = dwc3_qcom_resume(qcom, wakeup);
+	if (ret)
+		return ret;
+
+	qcom->pm_suspended = false;
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_qcom_runtime_suspend(struct device *dev)
+{
+	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+
+	return dwc3_qcom_suspend(qcom, true);
+}
+
+static int __maybe_unused dwc3_qcom_runtime_resume(struct device *dev)
+{
+	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+
+	return dwc3_qcom_resume(qcom, true);
+}
+
+static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_qcom_pm_suspend, dwc3_qcom_pm_resume)
+	SET_RUNTIME_PM_OPS(dwc3_qcom_runtime_suspend, dwc3_qcom_runtime_resume,
+			   NULL)
+};
+
+static const struct of_device_id dwc3_qcom_of_match[] = {
+	{ .compatible = "qcom,dwc3" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
+
+static struct platform_driver dwc3_qcom_driver = {
+	.probe		= dwc3_qcom_probe,
+	.remove		= dwc3_qcom_remove,
+	.driver		= {
+		.name	= "dwc3-qcom",
+		.pm	= &dwc3_qcom_dev_pm_ops,
+		.of_match_table	= dwc3_qcom_of_match,
+	},
+};
+
+module_platform_driver(dwc3_qcom_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("DesignWare DWC3 QCOM legacy glue Driver");
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 58683bb672e9522deb321c38daffd856c0d9029c..79f3600f25c41a5ed770f164a03c7dc424b01440 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -914,7 +914,6 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
-	{ .compatible = "qcom,dwc3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);

-- 
2.48.1


