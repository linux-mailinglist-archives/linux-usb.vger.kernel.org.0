Return-Path: <linux-usb+bounces-25606-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E080DAFE09D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 08:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3A051BC748E
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 06:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB7026C3A6;
	Wed,  9 Jul 2025 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OppS0zo2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E8726B741
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752044142; cv=none; b=kmNflGdCUjS3pz0orKnrqKnLkIhAsFpj7rYx+WtRYEvzz7qfSQfxtgr+74pzpY9vTQrKULFjcbdH7+i/CSNdBxhL/BVXTlM8N1qlvuGHKV/8mswxnQ25VLP7n8huQsF46mMhsd9snHTDT9FW5hbcJbfBfwLJTKHh9R8H5yqY9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752044142; c=relaxed/simple;
	bh=aStpdlLyG/6MtjjNhbFEJ4UHFKsyDfXe+V08u1Vqp4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FWbDUw1+wQr8mX5/fP/dJ3yhAkMywhbYuYAZFk+M/b+B04k9lVm4OS3JH8kXq8ggRAc7Eh2PQKuAOU2QgJcCZAyKxtxYE48ctQDkwDNBSvP4PZy1H999RdTUu+jZz9Hbv0VF5rrh5GSjWfkEEiBzkwpBjbifNTO5Rh1VYO/3B8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OppS0zo2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568JbcN6017169
	for <linux-usb@vger.kernel.org>; Wed, 9 Jul 2025 06:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+GJzZgUqMI2hbbRTEmaNiN
	bgqXt+YXuLS9oqBkPXt7A=; b=OppS0zo20JIOP80NQBVebFOdvtxWBw4BWRLgEA
	Otp3qLURRChF0OWQ6WYABHHdoLafukmveeit0Ben/UnOd/pFV6gIsobb2mbWjBfT
	UnpS7HSSsz0l6sOZu49jG8PzpN0jTWZiMHMp28jVp7K5xHMWcVXTkL9FP+VzXYZE
	6f3YgASBLcZx1zdrezS0mAe++LxGdesokUAeGO/ZAGxQxmP2pgcm/5LlEeociraO
	dPmH+a4PDS7vEsFXRMtbWh4d4oFB6QY3Zn0flqlMPS76XiikP3TyUaYkP/euY+Gy
	YwFJcXK0zHbf50RE9Aqxld5acGR3DCQcwzpzvB7peXfO8ILA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkttpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 06:55:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3122368d82bso8044077a91.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 23:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752044138; x=1752648938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GJzZgUqMI2hbbRTEmaNiNbgqXt+YXuLS9oqBkPXt7A=;
        b=qYkMjLALfD+uO7SrxlhZUF2yUyuqA86S5GwoV3JQm6mUsJGfii8cDaked46+ktXWOR
         oDdVE3aS3Lzzvq9193i+5gQHFNDttpWx4YFj0nqnr53oqSEdDWAksK5cIrfmxgFkYDim
         w8QqjOh/pbu5zxKF8eWMbiTPGzqciZAFNy3MYx1/JmmFbH4MhKrbcJ3uDL48rtOOA9Nc
         LJF49wqhBBsI1UIqPy9dsP4TixkBT6G5WOO7EgOf1anhDzJaVZzQPcrzDCLo9gUdauN1
         k9gwBruadCdUh6LnGqWC0542gy8x0Ed7GI7erGtGSZ6q/ap7XkF2FJ7/IFgjinoDmK2/
         xbcg==
X-Forwarded-Encrypted: i=1; AJvYcCWxjKRbaucbdJM3FivbloZGy1+j6jBFFFW4RxoWew7VQ84IlmM9RFbDW1PLQdju86UejxfTsET6I00=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw72mD6PRwTZ4cf+uZluHYAK6mej+kQgPho02zbQkUwAcsItPkb
	L1Y7rBvaoo5gPZI5ZXPOXmoouOx/YLXlldOVgEQgLyixrAnkwEjHv/H4liYXWyeIJ8/PksDC9pY
	NjAkJN46D0+ZHKqZCcuDrE/oZotBZ7uvclDo5VdFBaSJqmaxhiMUTrqgKTzBbZis=
X-Gm-Gg: ASbGncusqdUC21fGLXiGAHL5NJPOEoWINJgsYG9P14tTrZO1rzNCyxplzofxjrkOqkW
	5Utx6wB4xHFd+9JxiVVG6VgfK8TWvqDnrYqNa3CNWOhb46fc9QzphBhlF4mvdwY+jo0i2gtV4q1
	pXZ9X/ZL4KTpVWQzIljVjP25zsTfUxb5624/dBq9+5/47MSHOJ/ekTVfhmCDLGylwTltTVCLA8f
	/yjOTi4WSN6kqvUtLTFFIT1CND20f1oxJm4de7MgjBYpjUK98w+aOHH++at91xS88hFBJGV7gXI
	d3yUoX+XmjWlc/zktQ03RcMO1PlcOgCJMO18gDmtlI0Q/hoxxmU=
X-Received: by 2002:a17:90a:da83:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-31c2fcf3c51mr2422590a91.13.1752044137809;
        Tue, 08 Jul 2025 23:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5yfc8Y2jDpZ/E660q3B9XX34ak9hBxhvIIKY9LijykXgX0MytbGPEN8DCwPrxFMRyaT5q+Q==
X-Received: by 2002:a17:90a:da83:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-31c2fcf3c51mr2422559a91.13.1752044137334;
        Tue, 08 Jul 2025 23:55:37 -0700 (PDT)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3017cc3bsm1191192a91.24.2025.07.08.23.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:55:36 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
Date: Wed,  9 Jul 2025 12:25:14 +0530
Message-ID: <20250709065533.25724-1-komal.bajaj@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA2MSBTYWx0ZWRfX5nwvCM7MgJaT
 7CzDLR/v4ECfPlwdULtnG/poeIhUaAtD6hJRPMs4NWteBqTgf4a7B1mQG7rUcm4aaUdWfwTn6wA
 wMNGg3wAcQjkwKMl+tEQiS417vA1ce2ouxKBbhCsgA9j90BhJxVHsfeV64ud06DwyTCopT66dBU
 CwHo095gXXBA/Xi3Atql2QhMMujeSHV4cm88E3P7oadVpfT/fMFP6ixVrDjMgCbb2TDcwugjh3D
 L+ijAQ1qcQGLQjoXFSTbWyTd0xZTDV9EymKa51z7XFVBJ4+KY0Wn4Wc7E8PXd9mh2xkkX8NpCNM
 8sKpbYCz0DkHLBN1uZD3qebfG3Kt42eVlYa4s1h5d1cNFQwOZLSuTMgehOBIm2YiVvSkYkdIgk2
 g5I5OzxRGs5IUJwHRxW+OBt9anFFQRRo8tEHkcw76yLsEqkDDn+N38N2pz4EoZQSKhtZguR2
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686e126a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=eSh0DRBKNElbVECXfMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IMygR-pnFmjTTGPYFxK-bMpp5D8Lk2CC
X-Proofpoint-GUID: IMygR-pnFmjTTGPYFxK-bMpp5D8Lk2CC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090061

EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
as read-only for HLOS, enforcing access restrictions that prohibit
direct memory-mapped writes via writel().

Attempts to write to this region from HLOS can result in silent failures
or memory access violations, particularly when toggling EUD (Embedded
USB Debugger) state. To ensure secure register access, modify the driver
to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
Secure Channel Monitor (SCM). SCM has the necessary permissions to access
protected memory regions, enabling reliable control over EUD state.

SC7280, the only user of EUD is also affected, indicating that this could
never have worked on a properly fused device.

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v4:
* Added error logging in disable_eud() for SCM write failures, per Konrad’s suggestion
* Link to v3: https://lore.kernel.org/all/20250708085208.19089-1-komal.bajaj@oss.qualcomm.com/

Changes in v3:
* Moved secure write before normal writes
* Added error checking in disable_eud()
* Use ENOMEM error code if platform_get_resource() fails
* Select QCOM_SCM driver if USB_QCOM_EUD is enabled
* Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.bajaj@oss.qualcomm.com/

Changes in v2:
* Drop separate compatible to be added for secure eud
* Use secure call to access EUD mode manager register
* Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/

 drivers/usb/misc/Kconfig    |  1 +
 drivers/usb/misc/qcom_eud.c | 27 +++++++++++++++++++++------
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 6497c4e81e95..f49d5ac0e957 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -148,6 +148,7 @@ config USB_QCOM_EUD
 	tristate "QCOM Embedded USB Debugger(EUD) Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	select USB_ROLE_SWITCH
+	select QCOM_SCM
 	help
 	  This module enables support for Qualcomm Technologies, Inc.
 	  Embedded USB Debugger (EUD). The EUD is a control peripheral
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 83079c414b4f..a58081f53db3 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/usb/role.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 
 #define EUD_REG_INT1_EN_MASK	0x0024
 #define EUD_REG_INT_STATUS_1	0x0044
@@ -34,7 +35,7 @@ struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
-	void __iomem			*mode_mgr;
+	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
@@ -43,18 +44,30 @@ struct eud_chip {
 
 static int enable_eud(struct eud_chip *priv)
 {
+	int ret;
+
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret)
+		return ret;
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
-	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
 
 	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
 }
 
 static void disable_eud(struct eud_chip *priv)
 {
+	int ret;
+
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
+	if (ret) {
+		dev_err(priv->dev, "failed to disable eud\n");
+		return;
+	}
+
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -178,6 +191,7 @@ static void eud_role_switch_release(void *data)
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
+	struct resource *res;
 	int ret;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
@@ -200,9 +214,10 @@ static int eud_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(chip->mode_mgr))
-		return PTR_ERR(chip->mode_mgr);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res)
+		return -ENODEV;
+	chip->mode_mgr = res->start;
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
-- 
2.48.1


