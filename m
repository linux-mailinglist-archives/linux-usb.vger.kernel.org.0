Return-Path: <linux-usb+bounces-18771-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E11D9FBAAA
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 09:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A79A166DED
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 08:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71E61AE003;
	Tue, 24 Dec 2024 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFdm0hFM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA25B1AB52F
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735030008; cv=none; b=GhWEzfY4HVTR4egl1pjp2I2xp7RME+DxaNl7UE2qK91BUhBsh9qnc19uZPvo1cLIcgJ2TWxlNrRcqoI3VZwAeqrXP81gu2UNiot6BH4S038EfGuk4ZP6YSzuqUyMD5vf3u2KPCHNkxFWpFTbBnrXrLjVQSxr0H4ghwKJnyG4Qjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735030008; c=relaxed/simple;
	bh=otQKmF+8Q58viIrpGdwJ2kvOK0eX8EohEDU86jA83Ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XbVSB62EW9ES4JaIrAu3mgXWPrr5/ydRQqgZ5EYlso6UxhkczIh5Q95qkDCy8gknJtEvZP9eT0AXWgNE+x2nxydtvkPSPGUS/y+Mc36+Waxh1OArpYbO1+Ui+1zsG+QJJRV0EZbO2enPAmBbqUDsJBt36E3hPiE2z59Wk3EIuWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFdm0hFM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO6vUQO025265
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 08:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KZEGDZug6jf
	1eDfhN0Tvq0lUjRMXfDeRIcHZgSVoNCo=; b=CFdm0hFMZ2600WB/nV+91jkONKi
	SitUYe6jFPzy+KtxXytSNXY+OjKJOeAOZXByrfFz3WdzKPqYBSzSg6faFQ/+mcsV
	gfnPgAgChKtJTZ7xKwWTLUUEBjG+snhlgcLv8bwgloQc9xFDiIjpsbjp06TqjFrB
	400amycEshHr2uw05cmOpaTBAU9alhDkML8FKJ6hrwgxLSwk92JMTZU7dvD4d6WY
	YDK8wldxGfdIqiASRADAmzxjp5ii5pkicvVTt/4pwDMidTHACAi8s04yUqED7HBp
	Wc1fblxWd5qT2SGFcIO3nEo3F9g97m0oUw8/NdeL4Ino3JNiLrqj+SQbGvw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qr55rhhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 08:46:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f2a9743093so5060333a91.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 00:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735030005; x=1735634805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZEGDZug6jf1eDfhN0Tvq0lUjRMXfDeRIcHZgSVoNCo=;
        b=NelwKSQ2sOvHRvIdLW0/y+Wke2wGGBvF7s/gXTDgOKA1YtMLUaKKiyyMi0fohqMkIy
         rPmmtDlpnscumipk5EjKoeUHs06GIKwO2dLcjEDyykWc93mjQ63OAhdYgxgrkwqWpYGi
         PJb6MuKZ1npu+mM92i/I4x5NaqPf7RChnzkfHM1NI/cbD6O+dJBNFY9ZFDf8CoZiUwPp
         gI2V43YtawJZz1InjApgXsLkmF22+jh+Sg/YokEsygZkA9SF/ikLkJGciP19kWzBrZfm
         YQuKp/AhJvCMUutZC79phiCyos2qFmwXJgisM3v7vVW96X1Txzhu6tGnOo1frLy82eBJ
         YWdg==
X-Forwarded-Encrypted: i=1; AJvYcCWZdticIG0FTjR0GhnoMvTh6oy19bnBIsnpOJkTgLpjzm7In6/Lw96n7Sn9Hwu4LvBGhvstDU7hyec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1uX9nd5uw0/zS9oA90kdsb8KfUZHZmppdH6x/Xql/P8st+UDf
	Gc4n2oVYZ+MjxmucABS/MR0nYisQgUkCzhZXqY2ZJVO4T8l2/ihJK0uEtMwHhcDpoAk1vpctP/D
	1KODyxzwb7X6aqZYvkGRuOMh2boQSgM64YRmgZUN3bS9uZ/gZdFRJ1EChSLI=
X-Gm-Gg: ASbGncujO/NVTXnmGjJe1TvvZHsO+yd53KEGhhbQtqse6ZZIYNT2+NOJbxhRrlfrZtu
	neB8wTKH3WzwIQNicN5ccANzNLwfGh3Gc6eya5GTOL+lSTXN5JtRLQgdRywabPRKdwu+/24soC4
	gHhdZhYvdXQG0OHiTmJFGxj/yMoj5GNgRKTCUE5y86npVfSsNVaX3qJC4/WMXq+SW/WzaNpaWwF
	gdiDJERLgsJFtMtHxzm86L64CUHS/5M1IW2oc1k76pXYENjYl+/EQlhYPJxsBOyLz1doEFeV9Cs
	Y5SaoYbK9iBdwAEHGcM=
X-Received: by 2002:a17:90a:c2ce:b0:2ee:4513:f1d1 with SMTP id 98e67ed59e1d1-2f452eb24b8mr22112274a91.23.1735030005068;
        Tue, 24 Dec 2024 00:46:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVdm+o53eYW6sEmFq74ezYq9cdDs/4u6m2VQuxuyCpibgYj3geJP+IE0VFuZZP1NkinRtL6A==
X-Received: by 2002:a17:90a:c2ce:b0:2ee:4513:f1d1 with SMTP id 98e67ed59e1d1-2f452eb24b8mr22112240a91.23.1735030004717;
        Tue, 24 Dec 2024 00:46:44 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f692fsm85471195ad.216.2024.12.24.00.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 00:46:44 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 2/3] phy: qcom-qusb2: Add support for QCS615
Date: Tue, 24 Dec 2024 14:16:20 +0530
Message-Id: <20241224084621.4139021-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XdY3T3bDES4hTx5_IwvqrYkCyNhCzYrr
X-Proofpoint-GUID: XdY3T3bDES4hTx5_IwvqrYkCyNhCzYrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412240073

Add init sequence and phy configuration for QCS615.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 2d8fe9bc40f9..1f5f7df14d5a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -166,6 +166,19 @@ static const struct qusb2_phy_init_tbl ipq5424_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
 };
 
+static const struct qusb2_phy_init_tbl qcs615_init_tbl[] = {
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xc8),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xb3),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0x83),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xc0),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
+};
+
 static const unsigned int ipq6018_regs_layout[] = {
 	[QUSB2PHY_PLL_STATUS]              = 0x38,
 	[QUSB2PHY_PORT_TUNE1]              = 0x80,
@@ -356,6 +369,17 @@ static const struct qusb2_phy_cfg ipq5424_phy_cfg = {
 	.autoresume_en   = BIT(0),
 };
 
+static const struct qusb2_phy_cfg qcs615_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = ipq6018_regs_layout,
+
+	.disable_ctrl   = (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
+	.mask_core_ready = PLL_LOCKED,
+	/* autoresume not used */
+	.autoresume_en   = BIT(0),
+};
+
 static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {
 	.tbl		= qusb2_v2_init_tbl,
 	.tbl_num	= ARRAY_SIZE(qusb2_v2_init_tbl),
@@ -950,6 +974,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,msm8998-qusb2-phy",
 		.data		= &msm8998_phy_cfg,
+	}, {
+		.compatible	= "qcom,qcs615-qusb2-phy",
+		.data		= &qcs615_phy_cfg,
 	}, {
 		.compatible	= "qcom,qcm2290-qusb2-phy",
 		.data		= &sm6115_phy_cfg,
-- 
2.34.1


