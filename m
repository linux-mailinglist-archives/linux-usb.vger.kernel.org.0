Return-Path: <linux-usb+bounces-28626-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4BEB9C9D8
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7FB64E33DC
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 23:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F1D296BB3;
	Wed, 24 Sep 2025 23:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZF5Jd/xX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBC4298CDE
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756915; cv=none; b=IQbeVPUJsGBy4SYoBrjlLmAcWANsHtVYgop8GndS+oLjrQqo0+5RcqRI3Kjc3jtFI9+3vGr7GmvTUg7WHjzJ9nkTSXqpMKfrep/nJm/StTeiOxTdvNxbgjC+CzyHIg491RUcNviKBF4eI0ffve0geAW2eNRof2n7MVdQZ6ojGk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756915; c=relaxed/simple;
	bh=1bXx4X8K3luI0CC7vMBOPOroIotF0KmdCwUlUnOIjlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ue6j7No38GmZ5Iw+Bp/PQfAyxpBWv2WR2/OFwLpp2XtVSEmfhIXFf8zMaRrq2QqqnTvtOQwfSZH71pwe2RHMWr38EWtBY6ddBH3hFLjTGd5VpV0qaRfYZPlEPC1M2pdZ4x/NEEzwTijzP0bywSkiWBzyzP89fyFQH0xYP7g9Oac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZF5Jd/xX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODb2Ba019952
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsRs8ls5zJtoYnaDklfCGZl0u7nCPvApwl5lvQLG0Yw=; b=ZF5Jd/xX/VX0t8CS
	2PWhZuR/oVUw3EI2nBhXUvDrxzJaDI61R6w5++96N0pk8hpuy/lT+HHB2WAa1cKx
	ScXsbitD5SsGqcHNfKnd7/Hpr/ydo3GUcOLWoZQTHhQTefJcjxzxffDs0fEgHxBO
	4rmDbOJd6jEnsLRf3r9ZXn674S2sUQqeNYB2efXT818iEj29/sFG+fil20dD7skL
	8C9HTnFsoLWhybuM3PVSlIdkTvqdgYKyyoY5PEmySTS37oyBL8O7Gp74MVHqVnMc
	V9WlBQ+QRfro1du33zmH0yi4dDfUuwu5DjNNYOEAqEXB1DfqZ4vyAs8lDuW/H0Sd
	n68w7w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy91e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55443b4114so221157a12.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 16:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756912; x=1759361712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsRs8ls5zJtoYnaDklfCGZl0u7nCPvApwl5lvQLG0Yw=;
        b=j1gAQm8GbkKvV3xJqXfV3xlYAbLyCFItZarFOPJjHUOsteIuyWWPy++U9JKCG2MJuW
         5g8OY8uuZ8vlplMNv9seYo2Clyvq/KN3v81+/TFG7RDODx2b7rHGbISz1YY8wBB/8YqG
         HSf4xhA1++/NiLCpp5KRF0QZTnCzwndSqxW/kpo0qjMGqjIF3plzdCv/j0kXfVo4z4Nx
         Vm+vDZOiWUYfnXCo/6DOsl9oOawi6RqDk0kz7riHrvfqiOuWlCFnPqIXT5z/JfVmIsb9
         0NMKfGeeriv3FYefWRGxC6gg+RNRNcET8AaeMVqMsmybpZuJiCm8HNHYjIfIwukiyveO
         pN0w==
X-Forwarded-Encrypted: i=1; AJvYcCUiny4aWEHBo6F6VNTlWu5tjHtJ1pxTr2SkBycM79E1QzNryqAgem2zjT6WLxw+4aVxMVOMYuLIGHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMkjY2LXPewnXyCqPGU159o2j9wFh7g5qkX/4wUqGCWNBdssy0
	wx2uFUO780ec9l02tuJAJNsgOCrK9ae0AvxHV4cus9j2jDQPsPv1XhOWHLSVzuIlEPTE9+2XRLe
	JUSOPZ5/rGDcFZjjx8/tg/1rtMpzsj/RxLmbsEsKZ1Tc6ndpjEiqokaRNpsDz1SM=
X-Gm-Gg: ASbGncvpBdPhxivVoND1dpJy23lAjeucB86UisUeLxv989bJnlIT8/K79mtkVjQzPOH
	XiaM59T4GD8FLgAGAiymnS8UOtQWb+ylrws8zyyL62bNn0cO+zdQkyj5d1+VSGiIOSpXrUoOaz/
	LaCcZgohn1M8CQ/jp/xExelKxA2DgddoHPm80Een1i5HTblFiPVch8ndYTAh08cf0FdDdlyy3zu
	7rOgr8/U9+zr8PbFKX6swd5EH8ehxIgYNkkGoRyDExQJTTa7tbjz8NwpvVBiy//LI/1evZuG8+5
	cTN+ZwTIqMLkGlAQ8/Ft4Ac0slFVVs/FzHCLoN+axIgSSoKtVLK32vvO+5IkMyXz1er5jkAeJHo
	x1Tj/5iWln3l/VT4=
X-Received: by 2002:a05:6a20:549d:b0:2df:37cb:6b6e with SMTP id adf61e73a8af0-2e7c131dc55mr1576810637.21.1758756912070;
        Wed, 24 Sep 2025 16:35:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGpAEuz61cvT2XhW4ukIQOiLZa0lY4y1zPa4PxH5HTxcEkQBKtmoEjAu6kkyiQl93f/pSVRg==
X-Received: by 2002:a05:6a20:549d:b0:2df:37cb:6b6e with SMTP id adf61e73a8af0-2e7c131dc55mr1576776637.21.1758756911641;
        Wed, 24 Sep 2025 16:35:11 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm212379b3a.15.2025.09.24.16.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:35:11 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:34:56 -0700
Subject: [PATCH 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-usb-v1-3-48bf9fbcc546@oss.qualcomm.com>
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
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756905; l=1499;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=dp2q1UnWq2Lp4eoHzNa7ZpgQgVJ3NSAs/37jv9/dDmU=;
 b=ZSbenoW+opMmdOZe+iejbQ9oTpdwsntbX+yvALQI42r6ic0SoOqHbqvzWDNjnLh57Jf+Ltcp0
 S9QFXqsfwFzDnFaokXqdCkDODuQH0rbhL0P7RXaNQxN/BdSnF4F9IlA
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: AboqClOZrNpWcOLtmF5ZxdCcXJYl5ic_
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d48031 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=c8SvkZ6Bq0hLoSk93noA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: AboqClOZrNpWcOLtmF5ZxdCcXJYl5ic_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX1OPD0uOQ5K8C
 oBp/W1aMThTWk5/zqQAVi4SDY+lzj73TRPxdAP6b/4cV90zgFSX5XpeN5PzWYwj+t0ITMIk6cjt
 7k+gecA+hd6XlkgyQwiucxbO/U6RsSyV5coPlniYSVYijdfuID7Dag5vNseWaS1AAfitApjuzYW
 3ul72J0DF1E47fkoRCBjcnqaaO+pzETpi38hcfmHpkRf+V9OQENsypMGP9eSxq4/8rX1lKK85Uz
 iEg9DzYMoNHDqU2FgfhK2PUHvIoIyfSmBcfv9euGWpZzxAsnUxLPzk00pu0hbzQMHRvLMHa+2kb
 ToGZ27dxgd8Ni7p1FlvyECXXHAMKol1laFOJcetBnge+leFC+DZoVK0HlbzFJrEmWEE8mv2mmeJ
 FVpV9x2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Kaanapali uses a single-node USB controller architecture with the Synopsys
DWC3 controller. Add this to the compatibles list to utilize the DWC3 QCOM
and DWC3 core framework.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index dfd084ed9024..88124149142d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,kaanapali-dwc3
           - qcom,milos-dwc3
           - qcom,msm8953-dwc3
           - qcom,msm8994-dwc3
@@ -199,6 +200,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq9574-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
@@ -476,6 +478,7 @@ allOf:
             enum:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8994-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3

-- 
2.25.1


