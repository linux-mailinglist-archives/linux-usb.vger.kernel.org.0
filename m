Return-Path: <linux-usb+bounces-25605-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCAAAFE093
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 08:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F86E1C416D9
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 06:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B3B26F449;
	Wed,  9 Jul 2025 06:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ee68gTan"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5836526B747
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043935; cv=none; b=CEebncnyqbG2sxuspOfX+nltKKy2L0vlfw5JP0QqfgAq9t8C758HZH8plor+iw5/z2tn50sh7pW8FwyLM78P8IpGhDK9eFxH4kH+8UIuU/Rtn6P8AHzm+xX3Ca3WYTnw5B7mfWiwvkLlFpqIS11CiWLCXLUmoTYRcIyzRdN5mjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043935; c=relaxed/simple;
	bh=rGOMCabko7Vc8v31AK3+fltTCCxGP7vOGR/wv9M1Fio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QeBIWzShieKOaJpj0mIzr64qOQRs3sQomv9GahpXeubw1GRaOttTZgcX1Ht5HQhWgUQjPHfx5GNUYrGO6wUPO7vfv1ZPQxBijdHJW6HDNDQd0IJxvW5NE2n10HPT5RR3RL1G/YIWggICx0ynMnLwUrOD7TFTHkMQoajQU6x/uaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ee68gTan; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568Jh8wA012091
	for <linux-usb@vger.kernel.org>; Wed, 9 Jul 2025 06:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LYFV+qfiOjpQ2WB3oecbyErwUPp11c4DuSZ
	3nYHUO1k=; b=Ee68gTan1r3tQRlp0wdWAOJL0uISGyv8cjXIvH1JVmuA7I7AyIH
	swqSYkl4NXFUbC/c817I9cjJg06bzqSdOpZ9c+/3OL5pPoDIy/MQlKYsLx1/H/qD
	KTm6M4d0FZh3oO9xsmMJnHX6U2F/zp3w+w4L72aojXA6R48GxAK1VA9deXyrNJVL
	0ldFyCeTBIGaOj6RrqvBM1M8A4Gqe3V9sjKX78Z5uo+t3Jq6rUtWuqZo9N6WM54+
	Ky0b6OlSZW7GkWgA0jqkaU+9vjxCj7LQhSsc/iKVNdnoEUIdQvt1xehCj/gfCkkO
	Pp1y75JB5/dkZPMJV+Cu17BXuD3mhC5wMiQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97tv7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 06:52:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748efefedb5so3714898b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 23:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043932; x=1752648732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYFV+qfiOjpQ2WB3oecbyErwUPp11c4DuSZ3nYHUO1k=;
        b=Y5Fx8QYdDete0j0i9n16SySOBvOGcu5zV3DeBvK0hAYLUT+YaySyketMU3wmqlrxCG
         kc6RTFM8GHNPthmPPOM9cKUfDOgY2jUVtLodKOUKmvgkHSNl1/AGoci5aQwTb/rg1/e3
         QMFdQgNh+zu033YWo2DMdW8rHFpDU5FuE9it/pX9aM/q6L5u1Qqezqf42Xcg58B9WIas
         FbkeLGpaOSAywjMkpxCnVVXMjUenxK5lMCikQyqVnUO9xUTeNCUd6einuY+LNvylx7e2
         6hodml5A+w2/EeCV8pQ1Q4ICWFAgU0rqeCC3nHwprK8xWAvf/xfRq09d+zPfmqL18vwg
         tP3g==
X-Forwarded-Encrypted: i=1; AJvYcCW5zpo+pd9z5ptMiEMf2S8f3Bi1kAQ4hx0ON9UTdUdQuimbutmLMZzTqCim63otTAaG65KRh8sB2Ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRnVy6RUrCF0P2Dgh384VXNGvefTJ9r3/JkzCAb6GRZjnldxxf
	sWqJmd2r+KcNmvWlEJIDGSYN/8s/3XxAjE7xmIV0vTlfNDeYbpQjH9uoB4Wio/dNXyZyqEEj7gr
	6NmT2MDyT1zCdK0CvMR4NC+Fq96UEYtiAonc8MgF1JWBpoFpnOhthTbqlgy+StPo=
X-Gm-Gg: ASbGncvJ4LcujBU/WQ/nlDNcO+R8h13kWGsVzZE3t5A9h5ke91x/V/Rh73sTIr/c0at
	PBPtpbviDNzWCVgyGb5bKQtD3lNOkXq6UDeIgCTOXbIH8hKqeUqiZEKvYoN2arx/m6t7ndeDC2f
	Mww5tY7euMnfJJJV1tOuiPQrpqtt8VC5mXFrrfgmnDiVzdJGnILGOSrYmrPgeNshLLTTiH81y4U
	41XxLvnLMyzFasn1goH66RtNl6lq/ZVEZUmmns+cP52BTMTOTLTkXFTirtJJMh+Wsk4kiKk/5BI
	YCg1ED00VVu9uRm+y7cTqVDDBEExw+RiXejN51Mz+KCo4cvvkuI=
X-Received: by 2002:a05:6a00:4fcb:b0:748:31ed:ba8a with SMTP id d2e1a72fcca58-74ea6643e1amr1890441b3a.15.1752043932265;
        Tue, 08 Jul 2025 23:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAD9UdgTCiHjCpK2047MD6y9rFF7TCHzyxX3XcavW1hPdqvpCm6YUUzivM2ZdGT4W8UeAOyg==
X-Received: by 2002:a05:6a00:4fcb:b0:748:31ed:ba8a with SMTP id d2e1a72fcca58-74ea6643e1amr1890422b3a.15.1752043931846;
        Tue, 08 Jul 2025 23:52:11 -0700 (PDT)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a2638sm13766285b3a.137.2025.07.08.23.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:52:11 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
Date: Wed,  9 Jul 2025 12:22:08 +0530
Message-ID: <20250709065208.25472-1-komal.bajaj@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686e119d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CoRrhzqLTzFM5RYyXc0A:9 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA1OSBTYWx0ZWRfX+ixtjCtbuMsm
 Zb1F80oNji0mkF4UZY08CVCmmPN+uIhuwP/ZAp+Zu4xKl4iUA+JQ7Oss333gU9Kz3ENWQKOkhsT
 9IcimT2uHcLxn1cj9BYo+ZXmvR77Jfbcu/m8tzue/5fvPvQ/Knf4DWnG/K9kkf+IJEZJckrALgk
 lth2wS7E+ICYU4yHuaW4aepWkJ47LHACTCLLRdrzTAMkidnbpyoCDoLXuz7pfdcwvNr0pYiFrqP
 Iwe5A4q5g8dQIGNtCRxKdNLzXULIbYhB4fd7nLn0Q99rt4AVboEaBWYkUhkMVUShIhgbY+SpDgv
 LpRW4+ObNvBbTUJQk0nEPgwNe5LOihnUC8BfvUOlebrbrdmTlXAD7Hh1b5pxxRUZMbynxctcTWw
 q8CjbgKy3J590hk+YTQM7OPWLxzT8KBGx2G5uj76V5cJoSgtYAFKYwepLsZQtOMPS1OuBmBQ
X-Proofpoint-GUID: AAlnvq3kYqSvdTLt22brctR-QPER4dhc
X-Proofpoint-ORIG-GUID: AAlnvq3kYqSvdTLt22brctR-QPER4dhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090059

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
Changes in v3:
* Moved secure write before normal writes
* Added error checking in disable_eud function call
* Use ENOMEM error code if platform_get_resource() fails
* Select QCOM_SCM driver if USB_QCOM_EUD is enabled
* Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.bajaj@oss.qualcomm.com/

Changes in v2:
* Drop separate compatible to be added for secure eud
* Use secure call to access EUD mode manager register
* Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_molvera@quicinc.com/

 drivers/usb/misc/Kconfig    |  1 +
 drivers/usb/misc/qcom_eud.c | 24 ++++++++++++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

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
index 83079c414b4f..156c4f75c3c9 100644
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
@@ -43,18 +44,27 @@ struct eud_chip {
 
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
+	if (ret)
+		return;
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -178,6 +188,7 @@ static void eud_role_switch_release(void *data)
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
+	struct resource *res;
 	int ret;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
@@ -200,9 +211,10 @@ static int eud_probe(struct platform_device *pdev)
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


