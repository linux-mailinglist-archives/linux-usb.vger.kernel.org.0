Return-Path: <linux-usb+bounces-29510-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9465BFA545
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 08:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3FDF188DE59
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 06:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335AF2F39BF;
	Wed, 22 Oct 2025 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+QzKRGR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E092F39B7
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115840; cv=none; b=XwHqi5Hfb1XveoOYwd+itiMQ4nLbsgIpFjyiXsTQArskPPspsPLXWfpUmuFouyuEf5HZc+6mCBebEQn/2NrfZI5KHCvuPwYDEAZO2NnPwtURBWCZ+omVIo+C99Skk0GDxD3XrYQ7ry8+NDon0IEpBkECpRWgiDqffrS0dXoSxFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115840; c=relaxed/simple;
	bh=gHF+4pA6FtZnBUqOQl0MtcfoeZVl4BA/oIYisaYmmWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfN/9/928xRuqWwrKGbGbjsAfnwHSaCsOTm7g40evK9XQD92irSJ6Vd6VmG3elWd/169YidTFLfpMT6TfTY/kGmKwz/bAp67GICd4CNA/lvhJKDQIoeC9qBbMl9PeIThYbTcJ8OGd+/3ZHwtgQG9jFBlOV2WkrXmy5zCNnjHjVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+QzKRGR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2qFQb029835
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZEDudDcCpTGZPPYZsISbbU3+prU+iJo6gJxhAsFFbA=; b=R+QzKRGR1NgelHIg
	OeYeqbbcd4hjwxWGhLyUMDHKfzdYksC6GvigQGUVH9RVPVGKhH5iPbpl35pXxWn8
	i+dTKgNzu7aEek3VvYOm1paZpey4yFiQINnNF9VsRPxCb4FvPjBn1el2nzQvetYS
	NpqTPfCnXjGU2grMwsWo2kYghVhPH4ZwEFav+fxBh68vRLBVK0lbg5UVC3b+rOyC
	Le8n5MBU1pm9qyKQRAJ7q9o0z1A2Gz58eNVbX8Pc4jFiPnSGJ5Gwde0u32TNkbW4
	p+tE6NzOq8/muskCumGJG2YUV5BOP5p7ZEGaL82Ud94behDDmBQbkMu4MoWRxxqX
	yLxvqQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge3j5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-272b7bdf41fso78868725ad.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 23:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115836; x=1761720636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZEDudDcCpTGZPPYZsISbbU3+prU+iJo6gJxhAsFFbA=;
        b=DF4sov6ZXbl39a5Hv1YRXvGg0prekUge5wKIGykzA2f5x/2GYKasy4r6j3qvbQYIMo
         0thUKkHO91h1ezhvLPpZM4Vbkd0NOSCIKApA9oU76oQblxkuGYKOzgAR7HI6UVHYZGhk
         cLko3KqZbqypglw2agnFUVtoPrFDYekXxgF1yfKi2CkKCmBiffrRq8Cdko1GHJ+ZzO5M
         C9O746FuEIi5l8hO+uEPFoBJQP6DYkVzzY32MGoJWMqWrWwHkbG06oqJQpsdfkHYz2Lo
         PoQAP+okAFubtPJJZ1T0VG2YLMg/bzHsjgqedL8SJn4P4HL/fe2LvDL+OcTLIPnY/62L
         nzfA==
X-Forwarded-Encrypted: i=1; AJvYcCVTb8lpfghmTjFiKkQJnTgiPbpoU/6Dr8o2JsmZmyZKuaOybAbaoKrmquh+ZuzQMlVsM+E9hW5Lxv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh54IVjY/y1mrc702PGglzryak+jeCkothOpAvC51cAx8ZRHD1
	bX3zYSH+fKQmP3fK1gJbGR2rSkxUALxfiwrD9FKRAFdHL+fPdgLCG6Pxsvr9tp+IrFB+CW9dWnd
	LIkYSpMQh1Q9GdA8+1GARZY8ZWbStpHlD3uTmbXi43WCJHe+YRzshzutVLjK60H4=
X-Gm-Gg: ASbGncuVUX4Bf3Jdn3TwLs51+sctVNcYAH4SimH40Ms1HtneFDNoujxqX4WDlIsaLWG
	DYfloJ5eic0SK+d0qMAvRrqA+dzt0+nsPqvPtjTxVAGvmD1jagpGpPzToTaVifk8NvL9adEwkvo
	n8sdmzLMTGuNmiz6N3qe7R/ZK+xY2D8jlYcEQrtwcHeAFf9pUKqTiL5gpbKd+muR2dL0aZ0vP93
	W8CElVvlNVn20y/W6FD5sYSxOwqP2lT5vnMNetZQDiq7gO16ZkBZtC9xrT0Q00xly8kqFXJMwJH
	6USCOzYzTZiRp3KSUvG0WW7hIwLHX/XHTi8WrbWlqar5VkeBkwHgjzmS34QJpd09+cUmYhuQy1N
	78lsMGrXEx9BL/Z8qEai+b7RqOWJHCZJyOilcSVZbH/LlalgdKw==
X-Received: by 2002:a17:903:298b:b0:282:ee0e:5991 with SMTP id d9443c01a7336-290caf831f8mr255694425ad.30.1761115836284;
        Tue, 21 Oct 2025 23:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCpodpjCxx4fmCbEkBSzBkPT2S5EgIPUUrmaWcMLrK/fxVAvVzC8itWrjTf66DpjqIW4r/8w==
X-Received: by 2002:a17:903:298b:b0:282:ee0e:5991 with SMTP id d9443c01a7336-290caf831f8mr255694115ad.30.1761115835763;
        Tue, 21 Oct 2025 23:50:35 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223e334fsm1560285a91.8.2025.10.21.23.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:50:35 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 23:50:30 -0700
Subject: [PATCH v2 4/4] arm64: defconfig: Add M31 eUSB2 PHY config
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-knp-usb-v2-4-a2809fffcfab@oss.qualcomm.com>
References: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
In-Reply-To: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761115829; l=989;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=N04B8FuADvzjDPvyuTKyodc40jM2jOda/r7xCjpf/i4=;
 b=lyc1bzXd8D3qrqhkPjdIO4ToLd856fsMOQjTqs+gbO9UGKnkm09XbzvKE5ab1HNflxNdwWWYS
 aCllmsoNgwDCGZ+KAUg1vYrJBono8GVFYpjDq1xuqz8mek8HQWTqdZw
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX5fY9hEkly0mD
 j8ZjYMwgOaED2qSi57H3Xy2YFtslcj4+PGTSSWY1r0quKRg7fp4muPSLNONQE5PzIfTWhXUCYxQ
 u6zQ5fnj9oQz8A8k6/Yl1s/v4k+Ak6YJw+hLYETQ5Hin3mQzk7JNG94xV8aOpc6G2kXWkHPX86g
 KMHv6GwLko0o126uSo/XO5QqMrTtoKM2ZRlridqRm1RFZ3f4a2G9xGAqfyodZsrGNV7HyhnO/gX
 MaerrkTyTahTPVEv/F3+Pewn3Uck5VVu5LcRE9DIGuZyGwmFuLIEe1Nt6C7il9ZOeLK9KGaQxuk
 F7FdIHHl3ngLYo3z7Or/KrThAfHmLI7xRbtTNPbw6kMqYTuUQTHMCXtCEniNhls1RqptP3NJMNu
 Lqhl+Qaf+vXNsCYxqE9VnCDkvzcQ9w==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f87ebd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4ROhr7NTa0bsJorruOEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: UYnwBzgJNAGAu-cDprIMsrn_7jkAm6Fi
X-Proofpoint-ORIG-GUID: UYnwBzgJNAGAu-cDprIMsrn_7jkAm6Fi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

From: Melody Olvera <melody.olvera@oss.qualcomm.com>

The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
the Qualcomm SM8750 SoCs, enable the additional driver.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 630fc798570f..a600d9b86a7b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1680,6 +1680,7 @@ CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.25.1


