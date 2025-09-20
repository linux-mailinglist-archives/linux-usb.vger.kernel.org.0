Return-Path: <linux-usb+bounces-28353-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE9B8BE13
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 05:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F33BA061C6
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 03:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD3A2367AE;
	Sat, 20 Sep 2025 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JppcwkTG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D16F22B584
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758338482; cv=none; b=rOJINewl447XNdPeP+pKG7bn7k/W1/jRR9Hh0zLaU4Wh5cUdQXhy3FwTAhYtuFhA2GcZDndA6DOYj9CqJeAMbg7+1DkHBexjjLuXIwJCew4ZPrPB8yBJW0ldO+RCCpznBVASj4z8sxzQBdZ7srlUnkuotB/Nch1XiGz1JIDo6BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758338482; c=relaxed/simple;
	bh=dJA73O3dMi/pqX8EKZQSD9wv7GpWdJetJbicq4mFIDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=efXBX17lfCN7jln/UaXXE3hS9WIfgwfoRgsw27Hsdm8vZgX/OTPRzHn1kvKpRMgWEpcI9l0P64TjpF9GNo8JL3GKUGT9KwwgGORopXm01sDz1EqsK7Ax1OJdyxuMkJHKqjuHK5zOB2uQucn4yougAtOIuarlY4CJuE31EF3ab18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JppcwkTG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FOLa032247
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GML8ureMAch
	wx8vpYthv/JvdPI2pl69vuBTqtCyVutE=; b=JppcwkTGoOok13dBZ2ghU/+mHIo
	XOxwUeiHHUSOJf2DQrdj9ftC1MzZzQ6pI9PiasPTlS9psFn9GZbmfKxYfbFp4Bi0
	ZABnsGHn6IGYtEQoImjBW2dpSAWNRO07nyYJPwUy26znHVunu2pWYb/4euPQHVmx
	dip5WkJ4gIwVzDpYYtITei76v+3nvZhC7TUAM1Y5WfXgOFT6ygjCAKyuUeALP1OO
	cjpPVl9FozRpSqNKujWlTSX/WprxkdcvsTwJoa6W9exQg9zQjNoLsNq9nd9aEbIt
	D+83Jgbp4d7A2Z5eZ9oYU5NxDeYXSoO1ZchIq6SxJKVeZJ7w8CjEf22xCPw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982deh3qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 03:21:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77615793f06so2711523b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 20:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758338478; x=1758943278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GML8ureMAchwx8vpYthv/JvdPI2pl69vuBTqtCyVutE=;
        b=WAcVbb/aN3OqZ5DZct05BXfr8sEU2XIvxSnj73OJ5HHS7cr3QyKRuchr6oscra/6My
         XhjwwKZ5C+cist5UBeUk4D40vr5BIyXvIXiF9ZQ8sbIOB6ca3EUFqEz7k8Spuq1i4X10
         9ZvycBqmd0CEN+5fvTxD+VKq0R04pn+mpCZrxS/ob53aLNf6FfTuOnvVOAR1C7srznhi
         OZZFzrSoE4G9oFajI9SG/C8X7yLNbU1YCpxcApyTGjbPshSweuzKv/TxUs9ZbQCYlDL/
         9+82+7gUFbQ7FtT5jOUId7mNTckXMQJ7mgzg90mTy//tjQbCZo30LqHjs7g3IqUmeAi9
         Kdpg==
X-Forwarded-Encrypted: i=1; AJvYcCUWKdjXdCwD2p+kKsT09fuaKuEg3dZzlxYzAt0v/jC6jPwi3qzre2sdFTbyU5MrmhzgVnMSkm0JsTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxbKvCBcIAJkEUmStXTTiHmqhfvnTep88mlapVZQs837N4+lDI
	Y0TdVRIT4T40U71h0KRqWOggn9xeBGGAbqYVHPdtsvU3BLn2XMPwfswnFGMGj72yc7Z2dD0Nz8D
	h0gZl6VEf2LF9RuRtfYB0Fzf61Y+ccCA+lveBwSJCe5IWzCg5zpWKKnrLqXgRnjo=
X-Gm-Gg: ASbGnctHB8mwm01JhYKz4/vHipsMCt4DZrEmQG1rq+9TtQLKM8ZRt5/3yULhDzn8gH/
	6iXEp8FdrUK+fybWtjT+3525mw13K9T0p8WxG8r0wErq5v729ewIgbLoGCVDpgmeiBYvBJe1ymT
	lVrVY5VPIZXpmXQiv6HlY0Mo0SLIWO2zTAiv7rXxEuStvhccakEgoulrLDNLjkKmLNAruNYEE2o
	K4sQjhEpGn8wQ+5ZpObVsNqXGgA6F1YSmaJ0BblgVL76JNFnj3kU9jhYU4fc+zRrT5ossLG3vc5
	VKXtDgqc3aYwiDBzSPKGfHWiMtOnOOw9mKudMnYn03k6DJjwXMR+Oj0eWOQhv+M9ISPd18I3cIN
	CWs8+ixojtU+gbrar
X-Received: by 2002:a05:6a20:5491:b0:243:78a:828c with SMTP id adf61e73a8af0-2927723466fmr8460153637.51.1758338478090;
        Fri, 19 Sep 2025 20:21:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo3UQ3Zyf00PaJ6fvkX8fIq4kwna0eBd+Z2NMvErSf3djLCGdVAB0D7+Mb7C6OXe9h8e7FoA==
X-Received: by 2002:a05:6a20:5491:b0:243:78a:828c with SMTP id adf61e73a8af0-2927723466fmr8460121637.51.1758338477668;
        Fri, 19 Sep 2025 20:21:17 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6178807a12.54.2025.09.19.20.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 20:21:16 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH 3/9] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
Date: Fri, 19 Sep 2025 20:21:02 -0700
Message-Id: <20250920032108.242643-4-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68ce1daf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4j6cOweM1wKm_1e2C94A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: K3YPQtPxxw2u5SE20h0DsfkR5A1t-bWe
X-Proofpoint-ORIG-GUID: K3YPQtPxxw2u5SE20h0DsfkR5A1t-bWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX/Gc/Z0CCiqWe
 7pWfnaHQRZL+1y4ZVyI9MOU0YeGIQyZbh0KutYUKMkUugHo9AWZyMp5vdwRo+iw3Izaa1AdbzwR
 o2TLCbX06wHFfh0WjycrDEjzDAcu659U1iN538+yN+B2XylWAEbCEPYw5ASW0rQVPLqmkMpHEcB
 7aO21/R6tZYbKP2IJUbv+zZCe8TJk+8vRkrjTgpuf1gG+5BTq7mpFKbbwl8q9Mclt81LRh6hcxp
 Hurck/E7z68BWUn9r0Mz9bFnSLKv2Q2jnmi1G1Y0aTvIosYzeWfOXg5yyLAqhPs5vE93fbU7GRb
 3/jLidgSWbqln9aOyrCmpADvSMo0dK4jgKOOLOJglj3b6TsenNDFPQUpdRxckUgqBPTcTzYK3g2
 SQiBbnAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182

Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
the fallback.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml   | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c84c62d0e8cb..b96b1ee80257 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,sm8750-m31-eusb2-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-m31-eusb2-phy
+          - const: qcom,sm8750-m31-eusb2-phy
+      - const: qcom,sm8750-m31-eusb2-phy
 
   reg:
     maxItems: 1
@@ -53,8 +56,6 @@ required:
   - compatible
   - reg
   - "#phy-cells"
-  - clocks
-  - clock-names
   - resets
   - vdd-supply
   - vdda12-supply

