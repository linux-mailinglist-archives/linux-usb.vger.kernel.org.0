Return-Path: <linux-usb+bounces-28628-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B46B9C9E7
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9D14382D57
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 23:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E762C032C;
	Wed, 24 Sep 2025 23:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lP2TRpjt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D662C028B
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756920; cv=none; b=oBzAWUbj1/ubznJm3sY52VobnADmsb6qON5P8xOGrjwXlgjI6mkoliUEl88koxbzuHRYyXjDl9Ir4SdkLSNtwdhFsTmR/hNQ9rVYzXtlVycaFvgGRfbFlJTnuPNB+AjLG1vlus+VxSwn0DKxMiQcpCWbMFJ2gMyYJ6Wy5Ahbi7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756920; c=relaxed/simple;
	bh=YFE6gRJwBJey7qoAfsJWRiZl1FI7ewVERjhZ54aTXY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UlKgZb2bnpUbOolhw+Y6r2JLYp+u/Be+UY0Xdw4tdJJym5+EvU4cqOvMiN+yxbrVd4aSoFf6UVlkBkVaQb0tn8/jpp58iujMe/FFWVFKgrWuGr5DRQS4AVRMHco8UH2IxAr9La/qpLab1nDpM06lXQUqh7MWYi6P0tKpKo8bhrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lP2TRpjt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCcBGF016453
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZvnJ81KxkQIo11RALQNJeyWDefLx9wBbmisYnHSbMk=; b=lP2TRpjtxNLaRnYi
	1GHoBPrTehPeQclbB+aDJ0g9+Jea9memCE3JqEJdRji1Zdo3AmGJaRjBRnmGUuP5
	OpC9usv71XmRZpM8WpklVR0hPLMKYDxgEV0xOCr/Z1F96Hflcpo/FO8yLM+wglCN
	E9bjv/HatppoPWw3RlmFrIRIvhbwOxInYzJSfJP07YyVHt7CHAJY6ZaAxxYM5hGe
	x7Ht8HWY8NByPIQzmbUpZvFIyt3YCCDOpOqTp8NNQJOPtF6BhFIBBZjLznUaIHhQ
	A0b48nbOFkNlZU0s8puDPPMBvbEKADZgqIOHeXus654oys+MhdsMWIJ4R98qR6OU
	bXGB6w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhv5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4f8e079bc1so205067a12.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 16:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756911; x=1759361711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZvnJ81KxkQIo11RALQNJeyWDefLx9wBbmisYnHSbMk=;
        b=DW5zf4WvJSVmkHDOblwYHPRl6G42wPN3YS6qotOhqRORZD8ARkrGRtlOipm9HvoytW
         iDRs2/eMQMxIiuFqgHPNEaJmrdFWxe9Ev84O9sSqqhnKzmSSCbOKKVCzeQxikRtXm2p4
         3lkaHQvms3hIGKesW8i7TcFKeeckjd3qTDwnAQ7qCDiQ39y7PTh87pCD1LRWwd0V5W9u
         hsg6OsSs3Ms0UGq+bMEntGLRs6MY2W81S8VE2rqniQVscX2gUWjBxrDmvIa+MbXNzPYZ
         ywpIwighzSKGyyNnqbQICB8AWS2PSEfBygzXlXevTJQcFd5fSwy1W0nsot9CmSvHVppK
         t4+A==
X-Forwarded-Encrypted: i=1; AJvYcCXTzRtWaHvg91Yw5pFg2zU5BjA+EjC0nWtpN16RrgWBwSKZEAVwhBdB5QpwIQA5cR0qiKy7Ua8q5ZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh9aGpemMJCUWhrr1W/raRhR8coljNG1bLZ7zR+bM2h0dYMAkB
	qBscwOwlTFleG9icyPjyO4KlgG9K5ssAkfY/dMP+thPBLE48m4ZcWYS/jaFlWW62WArZgi9h612
	nzhMMGkXPWyZk9DP24RjO2rEFZ2jjHRENctCJbnlN8bBefwcrdFgogeXGquCHj/U=
X-Gm-Gg: ASbGncs7PJZU5l2hKbI6pHaBoFse/zQfDv2DtznJfOedzXZnSNXGtZ7YoPh279Ryigs
	LgFRpchDYHM7jQZ4STL3L+gOHhyXL8N/go2y3DAAUDhPfD1MtHbdH8De7RZ5v93WFB94pDhN345
	Ee8zpXmm89+bGASNUkB8ejq1DIOlyvEVrC+fjOyGx1G23sx3fyadn2kMZpmP5Jte/qWqdX41krA
	63ylk6FJTL0zfHS4TWn50bDY/3TTl1ZqDkUoWXqd016BATmvR09PsUK4TpJTV7ACbdl1Y/8I5up
	uz87ZwJronlMc06/dMfchnV842x7vt/ICu6jB+SPLtd0EFbfFeYAFh9/6EuZBs7Cj5I6+yX6KJJ
	MCNK/J+5jn+ccFhA=
X-Received: by 2002:a05:6a21:329a:b0:2ae:fefc:feaf with SMTP id adf61e73a8af0-2e7c4ea142emr1577354637.12.1758756910787;
        Wed, 24 Sep 2025 16:35:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZshf7magBR8c6L1yQi+3Wkf6pFAYDU/U6kxJathQw18FK67RwzHeL0RkuK2ImFKF5YafX3Q==
X-Received: by 2002:a05:6a21:329a:b0:2ae:fefc:feaf with SMTP id adf61e73a8af0-2e7c4ea142emr1577326637.12.1758756910358;
        Wed, 24 Sep 2025 16:35:10 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm212379b3a.15.2025.09.24.16.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:35:09 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:34:55 -0700
Subject: [PATCH 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Kaanapali
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-usb-v1-2-48bf9fbcc546@oss.qualcomm.com>
References: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
In-Reply-To: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756905; l=1111;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=g9oeeGr6I8KdbWoQAM9xUpSM8MuOeurLB0TLJr9UVOc=;
 b=85EyRAKxKUztOphPzLmjV/sEJUN9oi+oN9pXyNnRzVKuupm4S6iFFK+XVfMTvbawTRA4GtMZe
 iKaSU/Ob6tgDp/lR1g811dG0qbmiFrzcpd6WVdHA53Y8w3/EQfJSe6c
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d48035 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JlprKJ-Wy1uuo2cOBb8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 3ycHuHNIe7VcZ3na6bgoeyejeTPbXQMu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX1znZ7a/kV03I
 xp3qtRpIvqvgZNga3xt4sj7YmpAel6E6xcKEO0d3RpDIOo5OAOdOHUtYvOHiszTQzN5PpjnS58g
 qrhsd4AO7mgqkcWh/1i1gGxgP1ehSGBVcdbxMOcGSkWe/1xm/s2urCdta5ON8jZVMqkCEWiDZQk
 QemHuP/wIMPtw6a52Rnuc3mwbNlyAHaE2VmxcSVFjE0FRL6XsFoyuIH4Nh+wQnaMsC/P1IQSG8D
 WhxSIiTkVz5dES3PT01iz8SQMy4EzefaRd21TDlXeDDxO+g7lzqeCOfhFIrUHpgaFmF0mWAjebK
 I2fJT+lsH9Wp2Z9YFLpTbYfKR1kdNwrFKl8ZAxYGpYAxEaXAIQghUAkx1JbrjF/sfu+oEDeTZ6Y
 qDQfo4Z0
X-Proofpoint-ORIG-GUID: 3ycHuHNIe7VcZ3na6bgoeyejeTPbXQMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

From: Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>

Document M31 eUSB2 PHY for Kaanapali which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on the
Kaanapali with that on the SM8750.

Signed-off-by: Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c84c62d0e8cb..ab1cdedac05c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -15,7 +15,11 @@ description:
 
 properties:
   compatible:
-    items:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,kaanapali-m31-eusb2-phy
+          - const: qcom,sm8750-m31-eusb2-phy
       - enum:
           - qcom,sm8750-m31-eusb2-phy
 

-- 
2.25.1


