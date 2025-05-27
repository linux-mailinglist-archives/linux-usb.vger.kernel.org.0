Return-Path: <linux-usb+bounces-24345-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C256CAC5BFD
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 23:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A57E1884ECB
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 21:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C4121B9E4;
	Tue, 27 May 2025 21:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFOUBIeA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3942421A44C
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379913; cv=none; b=b+JoomSj7dy1TtnNRvryocAdzNeDbZzkGPKaxLHtp3q/w0iRSJ+OZS1S/y+2fpYDJJuX529SsZN+uFjfgEkXHLRBHOats6arWu2a9i8D3QJSUvCFORdpGcn4YXQ5L4rUHAbnspIRFzlknZvaSv4LpbWMR2olLyA7AU4F7yrONEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379913; c=relaxed/simple;
	bh=wCdzpXsKw8zqQyaRyA8EfWIj8Ra4i9wLlBGWl4/WARQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIzXboFIZXvU0qqrT0Gd6zyrCMpXfSQ0ge4pXbpPfOGdW0YN6FHDp8QLpbw2DsjPyNT2uRtKtg1h5Kv2QHwX47Y5kLkNISCkDiOYoFq59TC0xfWjAFon9v7zgDDdb0uSPoaxKxnNsq7wY0rRu0cGROu4zVbEhgP5dkEVHtY0HVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFOUBIeA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RHmFU0028517
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LPkqIIVJzTbHReDF6liD2MG4ODSDIeHW603+18LbzM4=; b=eFOUBIeAvN/dWFCq
	xOi2G013rlZ7UNJ9SVpmPsTDwPGAB0oEuAjvAfGdvYksbrdY0symWV4SsdCUOsvr
	H5m77PaAXjMPVVVdCT9P3/+YHl8oK9cv1yc7qN690fZPZXzsLObszn5SD3YFxVpb
	nsJ6boRRZavZhS8IKbberwTGTRdwJqN0P9P2MJiWDKgdSIlh4kro4o67+Cydu+Cl
	YA4eIzQHP/iwFdzCEDtfnZHghqC0g1ri76po2htmvubU5wzX8UV4jdokohDGlsNs
	M4HGeox6sJpySVWdUqXm3ocOEI96B+VrtD5xDV0fycJ/NciETksjai7aCIAzwQIq
	v0TNbw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wgf61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-740adfc7babso2885538b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 14:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379910; x=1748984710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPkqIIVJzTbHReDF6liD2MG4ODSDIeHW603+18LbzM4=;
        b=ToKzT0GL/wNcFpde3JgJyyqwEq4DK7BHbNA4y2O3Q7nWZs/jpJ2B4R3K1DuiN0cogJ
         SvupxnyOn1OJ0aWYmayG/DE4ImaTOfdWNG4sEMQu4g1M5K5pMvZJJi5gh0aYITcJILpW
         CQUzc+knNCqsYJIcBKD0L7vqOKP7JM0abKyw4SFhVxH+rI1BGRfQvTK667tg6HG1DmMq
         DGZf0nAIv/GfdEizx2ANmFfbYD/nnxT1uShE6XNn0dGAuveoSeEmUGHmmjp0NFqRMRfB
         mFfBS0D7BaRV97fxMu4B6Kf5g2yPpTyHC4xZHfgBGonQE+0o+B2rvkrM6akEK16wyw45
         bkag==
X-Forwarded-Encrypted: i=1; AJvYcCUmkxc9RUpD+V4YtJ9WQ2O64wcjA7XRAxp9UlYULBoy+2KMV9bMK9I5Inv2Mjf3FTWiJD9nTId58HI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVQtJKQbFhCDNHTUsxynY8WBROGKHWtFtBrSye34Vl81G4p/e6
	1UVxI4ILZR7QK/aP0Osdmd3obLjwiWT0XHzPy/3kcV17CfvghdNv2FLM5a+CuYlTAG8HTUIzp/3
	Wv2CA191Yhk02ZcmGPzh9aIuoFvlVyKvGuU2Yp/+Myo18kiMGQMvqKEzwIx8Ktl8=
X-Gm-Gg: ASbGncs+M/YLL+QCbP1vgz6fY+kVCxGn0IPpqP9PCqdTn2u/0LU1juDcpxfYooy2jY/
	Iyk5eFNiOFp2Atprg4bJ3l9IPJIPSgyaNWMydlRh85mUrNaZYzP2zgARbhxP6IBANONfUkBre0K
	j9Ak28lVdxoznRncxPl/9uS5hshnCmaQNic9Ek/GvB/vwkEAne9POOzEjpU0vke2xZfmie3o5z2
	D2g9qi34Wey5u2Xbd4bDRM9WKMBp9+kBukK9l8nA+Csek+sR0TLukynHRyqhjyW5Kk5fPSnW6Sg
	u0ZdtCjQYuQaW/gk4e2xDNd2aS1Uus4UwAXjwrucRkH3dZpJD5S+a551cEUSrfUgwrw=
X-Received: by 2002:a05:6a00:a96:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-745fdac80demr20724851b3a.0.1748379909717;
        Tue, 27 May 2025 14:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE89XO/JDVl6rd3hud7F4tMJEpNAb1237KFGDPWMLXu7CEJYly3v5ShxkxUVfmWpgn+xSWY/Q==
X-Received: by 2002:a05:6a00:a96:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-745fdac80demr20724807b3a.0.1748379909299;
        Tue, 27 May 2025 14:05:09 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:08 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:46 -0700
Subject: [PATCH v6 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=926;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=wCdzpXsKw8zqQyaRyA8EfWIj8Ra4i9wLlBGWl4/WARQ=;
 b=JUlbr6mF6I6cr5T9ZHdAGEijiVb5Mu+5V1BZNQUxXDHvq3yjKg+SamgDa52qed7t8bmWdrkdW
 42TjvtABTDkAncpbXnX/wXXb06bSMRhHbxRyyU16AIFkDNCwCzClSUq
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=68362907 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yCBuECYR7Rf6QDnvud8A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: RK06tdErZCjMncHHO6Btz3lzxrP4e-cV
X-Proofpoint-GUID: RK06tdErZCjMncHHO6Btz3lzxrP4e-cV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX5g9CW3dVSjOp
 AolT1xE0IP+HeUc4OFz0viP/sJE3TAzQeB5SCXrDxsStjQ9MKgQHHytDEzJDnqooumG9MCFA1JJ
 3p/QLfkBLBH5q140fIWowxRhA+BjXHWWfVq0qeHH45shWPPawahlElTzm36C+RKC3XhYn5pxw3H
 LHpvLVbU86i8ALCZIkP0Rsqx9Jk4epcl9YKWkgSjoIIKkkRFzB6D9tevkOEilG+XLM0ijA1uo7O
 4pwJgozRZ00cZuo6/Tv1X+kbqtcIhQT40Td+kb79YwYYEKFWjxf5zF7sgFkisyTZ0OKAPh9hbm2
 OLlCybCCHsLfO4LRmrIrcjlaTTwi9dhPei5BaeiI5iR/g95M+Hfk5aRiUNZaPoaM2+9ur8PLGLZ
 4/8e6o1OP2VSOeEuS/J95GvmGlkIyQuuUpMFjbPm3YBxKTVbtkIotwRM3R1q1lvOYghaBrXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=474 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270178

The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
the Qualcomm SM8750 SoCs, enable the additional driver.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..f4de2473b3078543b68b01387ac7e3ab6951e4a4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1600,6 +1600,7 @@ CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.48.1


