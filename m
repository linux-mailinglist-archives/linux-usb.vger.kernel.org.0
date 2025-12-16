Return-Path: <linux-usb+bounces-31476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F3FCC2DEB
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 13:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EACC730E09D1
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 12:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D1A347BC9;
	Tue, 16 Dec 2025 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYfT5lBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCevg7bv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD275347FD0
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765886908; cv=none; b=T5uv+0y0BNEhndlocQ0QgFJJFJUgx75y76hxkz5EcmL7GpU7LVOm4FxVLBliD2QIhUYx2Z1xn/xuAMqY5pafS4aJxXoo7ipVYuheDX55jmHSf0937QcHoNsoVQcSELlfPUrXX0uKx0NTylLbWCqAMK+yEWfLr+E7nT69Y6Qexs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765886908; c=relaxed/simple;
	bh=G1gWv8618a7rqJzvKhye4h/vsqybaxCNL//qIdBIfmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mfH7iSV6ejG3W8oWCw6VZENF0rDfvmddGlN/fmBDilbOp/p4HhN4IsFxwK1uc8HO5LP+uivpXnu+2Uvz0b3h100cBtGmPYETwVOvzlpyi59+3raJyG4XtY86NH55aRjOL4RXVMwTVG/SWjTfCw4wDxoiRvpW7gybWjDDm7iAeOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYfT5lBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCevg7bv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG9bnb52516455
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dzx7C+q//Ee
	3OcHfJVXO31JMgk+3QiczRw+McarTXGM=; b=BYfT5lBawHDyscdO1ONZpSxuqtc
	Npl1qFD0+kBL/DxsQYmaTPxDaGpkilxdNqCIE2G0pDSGRJjD3Nx5eUWzW+ZZZcBe
	QvtILbky2wQiZPOsvdzDoMnSA3JG1x+MhS2rywk4fIYU+M9GFLpeY9HqF4Go/Z67
	fsU/p/QNtns4S0Bc9ZG54DFuKyxrvV1l3k6Yqd7HTxgOeQijAstjufu1Y1t6whD7
	YNfsCaG2W0H2o4P2bPGEc4vy9PRS2QYGb//gHG4X/GIHh+fjKZMvHUpr/usA2Flx
	G+hRrfe6x6rzrb6RwziduGWLJCk/aYwQHWiOtN9t9iFbK2MpEdeLdJXTvoQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b34y80hxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a4b748a0so69136305ad.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 04:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765886905; x=1766491705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzx7C+q//Ee3OcHfJVXO31JMgk+3QiczRw+McarTXGM=;
        b=aCevg7bvxpGQbprxTK85bM/cT0MCw8iucxinWTgCXSTpo4lN3rE0i5GKgWY11tM9gB
         VbSKfRMGtZgvdXrPvj1qWKDubjAgx7rdxZtJ+EZC4K8Wh/EK+7BcA7UeFhH22DiNet30
         rj0iARAe061huxmRFnLcxWoehofylprtG70kDLma5M2iXipJN8FRrv6uGtIo7PC2OMls
         P46CFMqidFDMhrmCkrvWJStSHG4KPBgy0XSy4KKnGNWiFk2mAqUHZJBzNvw4tlurnEmv
         pdWfSLcEsdR4+ZND8zGcS+COWj+3vx6nVPVai3T4GfrdUp1M2KzoOy4Lg67fvhCFYLMB
         tZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765886905; x=1766491705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dzx7C+q//Ee3OcHfJVXO31JMgk+3QiczRw+McarTXGM=;
        b=WNsfrU8O6ibDnDm7ig0ynjtI4RHmwnXu4kFb1iU4AVYDXesdUlSw1QGWPM+S4kXyG0
         w6spX4BPI6qwkwsSzYHSNBJ/yIAAiv5KKPEdziLpVRXXj7Xck0gkyQ1fw91TvPpums9Z
         clOjaaA3T7QqxVQLJgDOK8s7ccCofobhYFnYtP4hZuUHtfGwbaMiYoG0oUQG41/bOtV5
         ITVv1GCxOlKKmqLBJUMkGyZ5JVz/TXzDTtndY9/p3hSsPS8b9DXVrZ11uvoBL14O+plU
         9+WbwxWEOU9pblwoJiCAd3KUVgBQ7W4U0SMkgqCZsAOryhDJkhm39YgyLN0XzamjKxrD
         d0vA==
X-Gm-Message-State: AOJu0YzH7wTlctZ3hgm1zDtPfJNQCMhQpngqkyc82jwFYNOg/aXrRI+x
	hgcBWA4BxVlXp+8YPMSzkLRHSYkZ3aPX+SY9K8uMzW9SL1X+ViFeNqfLksc4vSq4FfSrn1N2eqY
	kAwq8pvcVA3Z66I8dh0mKoeqD4IG78E+iF6toegODVGBiZBSeJ/eORJuecg7+iE4=
X-Gm-Gg: AY/fxX6TElNV6HSov9Fz3TH/RcSIRMyXa+yb5YhhwxfwUL+D43cvo5NzPturIT72X2N
	zI9FKn9SA8f1mmMaMMqtHCmjm/gFkwbJb/Ph6evG8v13SbdUzgWk+JN4pLvaquKQeh3+lgvCn7n
	7HrdYXEHu4WXlPOJNuPrLc5uXS5BXKIzlSmTFdmPP8WFw/Hxv8rL+KyR1ykG6Z342ipbhsaQ0zv
	oKuhKBUgrqaQdw6dn1MCAkELVm9DBh1+A6pS5ji6rJetNYhGlOOE8gQ45QCz43xkEk0r643n2gE
	C3+GbJC9CWy/Qj4Zz3BwJGHHAU7ZBo3cUZZu+PYkJNBUqOlg3XclsedAfkN+OGzH4gxYVDtExlO
	FtjvDd7kmc8d0ttuBn+zGD7pqzdmU8Nlo0oZRbXyNrd4=
X-Received: by 2002:a17:902:d510:b0:2a1:388c:ca63 with SMTP id d9443c01a7336-2a1388ccef1mr26573255ad.31.1765886905326;
        Tue, 16 Dec 2025 04:08:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuPHIDntGjUvMdy4jJIYEkJg9o95Lv0EUmUCHsfRKmkm+rNfF0ywWWdcAuxlb5uOs+1Xyr2A==
X-Received: by 2002:a17:902:d510:b0:2a1:388c:ca63 with SMTP id d9443c01a7336-2a1388ccef1mr26572885ad.31.1765886904738;
        Tue, 16 Dec 2025 04:08:24 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a110f6374asm48568695ad.63.2025.12.16.04.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:08:24 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 2/4] usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
Date: Tue, 16 Dec 2025 17:37:47 +0530
Message-Id: <20251216120749.94007-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216120749.94007-1-swati.agarwal@oss.qualcomm.com>
References: <20251216120749.94007-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LrCfC3dc c=1 sm=1 tr=0 ts=69414bb9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dwk_HVr8QTvVkdqdSRoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: aisGuokkB2wBOPqBK8910jCFuHCPWXDo
X-Proofpoint-GUID: aisGuokkB2wBOPqBK8910jCFuHCPWXDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfX7XbdNsYIslox
 gWOIgV5nmghBvGbI3uBhjIwMsg/OHnUIZfLbjiel4t8OuB+m+xwQmrlIgKpIm73n/fFrzQtK8rY
 fbJE+j+CRokfEBsr9T1YFSud5bHwoCCv3U/Dt9D/IsYpXDNT4EUbcfmyGAsHewQgqO/xDfYA/jb
 TLfzaipWc49Ujg636I/Z9cw5Wt0hDOiIl0FGsZrgqfwbapXZCPszdt1WOmRDrislfCXNeag1VX5
 MY7pQaqUi0SN8rfehw4Qc6jZvWu5oivZbw4VDewL4dMMWoS0YZYxZ1NRuwfasrYKLRVIAoZ7m19
 f8kDsZupvTo2PO2zRZsp+cm0kYFh0fJ8TjjORPrUnoj+1HqsW/mrFzKh+eB8vZmweE9qDcHF6GA
 fn8PgBm78k6z/VHEsgKVA4Oc0/8trg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160103

Add support for the GL3590 4 ports USB3.2 hub. This allows to control its
reset pins with a gpio.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 1 +
 drivers/usb/misc/onboard_usb_dev.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 41360a7591e5..bde303b820d7 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -661,6 +661,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0625) }, /* Genesys Logic GL3590 USB 3.2 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index c1462be5526d..7706a04f2630 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -140,6 +140,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,625", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
 	{ .compatible = "usbbda,179", .data = &realtek_rtl8188etv_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
-- 
2.34.1


