Return-Path: <linux-usb+bounces-25577-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B709AFC62C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 10:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8456A1AA1A25
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 08:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331D4221F26;
	Tue,  8 Jul 2025 08:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlTSZTai"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB142BE7C0
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751964738; cv=none; b=lCIVSCxvmVp29ZTSsIHlD8dRqG4TD2lMMoABjckXHnJQdeePcDI5mNHAA3EDvfnZiRAbWAgpieJtjHY4R/eElMaqlaemMI0H4RRPPM8PCIk/VHWTigeCECGUkT1301S+Hrp3STX3flGcz8zpFfr8h0kHJzdFdGqdwNAO5MdNrtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751964738; c=relaxed/simple;
	bh=PL16pCZH8Tue1eweBeZjIlwhLZ2/ZfDBGRWDMwlxAd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fVZmzDmT7jHrhgMba2G4PVShxXjtbEb2z7QTGubToqqq4Ws8JwT/c/jFunzI48LB+OZ2bm6CHUvykqoNxHURcHKG0PC+Y1pRvs++Yrzh4WNcwv1o7cyEfWfVTnAeERZqwKBWOlI2/LwcKrzggWM49ugSe0N35QPg0BE7gVTcBjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlTSZTai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5687pb09030729
	for <linux-usb@vger.kernel.org>; Tue, 8 Jul 2025 08:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=APQGRMVDujo6RxeasGIZN/CuhwkxdALKQJF
	FEyjCmww=; b=KlTSZTaiiOwRMJ6q6QXyFlA13NApMCwx5/w0KGjAL0jM6oOf5MX
	z/kkHTXQPZzeoJ8t1uWAr0qU9WaWkPMhZ6IK6l1pEfHDeonMQyULoq0+yELEgPsY
	8izKUaKaW+kluq0feyfc9TP9zAz8Bxn2poY61JKZdY0KsgclVjoEStRgFcfxLVnB
	S+CSRNEG4XUTB7RQx9+Adfvi6nCRDYKUAOxR2b+dFIt30WhXFuuWpL90rlpDdgSv
	xmqZ0Us1OY82gVZX9VCV2UK+NIYicddz6tMgfJO9szh+Jf6Kf/NRpHK3/d9RC64m
	6YJhVf4KTWCbPcoD9fgUgZADjy55BdjH0kQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xvfcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 08:52:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso3917433a91.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 01:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751964734; x=1752569534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APQGRMVDujo6RxeasGIZN/CuhwkxdALKQJFFEyjCmww=;
        b=okXig20AXRzspV5h2ZYMRPCH6mH/McADZErhFp+51g59r/i+dbLI27IKAWJ2h7AcMC
         t/SR152Wj/c2Vmie+CH4zvAOtB5lIBHCvrunO45lcONZ9amuFCu5+jSVM/Xn2BXEGlzr
         TZU9iHR/+B4rU1sGbYr+6vXl5coaL9I5kmoMf9/ICKAFRe4GTsyZMcYREJRdaV3xBlSE
         kIBQQNwuxRkCuh99EhSo0vUri7+BxZhJUhbhwVA9AWYOmuSEwL+7+crGm06ngs8iQsIv
         AmBXr3O3qdSg2p5W6BgGKyJNa787E29x6OLwJVbbYDgpgodND/vIWws5OfJG97tvtj4k
         TClw==
X-Forwarded-Encrypted: i=1; AJvYcCUgTZuk/XjIV6IHIu+TCSFuNyI7FsmI51mq64SY3l0NYvcROJ0KMrx3i+A83OinuWBRwvmis7ixk/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyadW7N3O/DRq8I4rMlwqeURT3jV0mHIWtHn1AGjfiWPsQV1fVg
	g1B440ljOuAPtUYAtMtsro5W8D8SKodYfR7nwaG7UHdAd+6IAsSb0hr3XXoKWB4gpiIGSTgynOX
	upNb6RQqpkuWuxQqxIP3F4WRkSBU41N+75zUM/97rWAeuOh73yUxnWToeAu/7hoc=
X-Gm-Gg: ASbGncuKxyczaYr3gGpU3pBGkucWpvJS8AczUDCO4mXB3AhZYqIoXV8ye64bVeLrZCs
	jl3dOInd3J4YCjVQ2n9nybvIDSwlcwihj2o6vUa7nTKzHAQNmDI1uWA4F2UkKpsZ8Ckq624wF0/
	O0vuOUnh4wv8NAKWqYpmzpAH4S1JdSDhS5sJYQOb/z16YhqxmcnI9zRpFbdeHNRFinfEt7zrNRR
	7sgA1ralOwt/nDwj0FCUZQDFfLJKSuynE+HXLfn4UM6kskW/7u5DZSzJe/mhxty7U5qE1+6hIdV
	mkh2RkWW5y4enRk60yvpIjgYGEdB5x4nhbMoA5+8FSkxebW7x7A=
X-Received: by 2002:a17:90a:d40b:b0:311:9c9a:58ca with SMTP id 98e67ed59e1d1-31aadcf4c5dmr23323002a91.8.1751964734290;
        Tue, 08 Jul 2025 01:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXferhNfvnm07pRcDTE8Vpv7ZMilO6rDTjEyyKv7tW3s6EaSYnRMUH7pLC5nXqxn1cz61aAw==
X-Received: by 2002:a17:90a:d40b:b0:311:9c9a:58ca with SMTP id 98e67ed59e1d1-31aadcf4c5dmr23322974a91.8.1751964733853;
        Tue, 08 Jul 2025 01:52:13 -0700 (PDT)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c21e7115bsm1522316a91.27.2025.07.08.01.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:52:13 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through secure calls
Date: Tue,  8 Jul 2025 14:22:08 +0530
Message-ID: <20250708085208.19089-1-komal.bajaj@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA3MiBTYWx0ZWRfXyGvbjQ8jsfrG
 OZZPxa0nhDi3Y6Oeg+1UJKbGWXXXgmcmUsX1uuIBT8SaIcP/69IZwjNwB27s9FFWJXIfdUBawd3
 eET4lgKwZPXKYFz+4c+v8oil80NSgRkT0yHxQ/imbj8AX9sUHqshaelamMBObVlPXoXNpwnX769
 LtFSxsEXLjbdwPoacnuxHUH/DJ/mj1jvjKbaah15owPlC4JOM2Sdl7rfdbv7ZiPBqki9VGBQgU2
 HQ9c9SEBz9LYZ6HWPR6rK3XirCC56kGyQOOTwHMECvk+yRQf4bQ9MVTsYQOcm5MWsUJQOXbrfSd
 l/e/BxajO3h86UXqqKrBbb4ZZuVzRKvka1YsEvHJMLV8ei1KR+STyuu51NqMEFF/1x6qt/OEjeo
 jcHDsNr/dYHrIx4l2m1pHpRosT67W9BgZrFGMBZkzc2XU2xqkDbiVnGQcHpb9AeRAtSSCmwr
X-Proofpoint-ORIG-GUID: n998J8vcbujjSLfsioTwdwtBPat7kV-C
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686cdc3f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=nP5vHkG3G_wrkassXHYA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: n998J8vcbujjSLfsioTwdwtBPat7kV-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080072

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


