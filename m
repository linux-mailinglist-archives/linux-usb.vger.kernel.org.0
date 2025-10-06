Return-Path: <linux-usb+bounces-28921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3E6BBFA8F
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 00:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CCC9189DCD0
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 22:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B63212B0A;
	Mon,  6 Oct 2025 22:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOZwfOCB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86101F416A
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 22:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789215; cv=none; b=FWtvn9Ec9V04P9vKEeSRJ4DlLe+q6NbZ+5BrzDFgAb1A+FBPFyh0+pczbu7ejIpKVQEO4b8E7RdCkpxmEgukEu/sqZyesVMZsAaWUu8xamgC5E3JD50qL+mKLCh1ZFXaft6vdKk77mKnRgp7kxYR5pkDFx4Bw2Vz0UGWJ/Bh5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789215; c=relaxed/simple;
	bh=cfM3s21T8CQ3sOfi9Dc1sx2mJ27UuKxMJmEc0kjDpws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TEiW509kotBeTehAowZOGK7Dz4w2MAaKwCwTGSaSMsu4XrLp3tpacCuR86/VwvI6ptIyN+Ewmpq80Yglp91zS5KJ5ELzAdNg6jpjsTDPUPjuiajjlfHKr6+/zRLoCMduSc3lpN3wb0UAydM57toaKyV4vokqHEP1+tifTeyVImQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOZwfOCB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596EqPWh013320
	for <linux-usb@vger.kernel.org>; Mon, 6 Oct 2025 22:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaQd3cF9DM3
	ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=; b=oOZwfOCBwgDoryc4mTe3JY8fHqi
	y5LqzEC/ozhIgi3WVGovhl/N8dTil69mpmCsP8FhRydMymbvvth1/C2JAuIr5cnh
	iQle4YBINg08PIQSkjyC5XJ+9EUUrNi6jJkw47wYmQrEcbdj/ymDIwxUj9tEiZFC
	Ry4jNI4Pkc2USTQkQEOThPEKiCkUJpbu8LJHZNMGsr6pQhU7wIfpbRqvkKrRc6PP
	DztODVrdpzUeWPx8IMdIBFDRTH+o4upmZNqRc1nJUghL//exiRcpZJTYsJ/Ay4xI
	9UwNem4aN59CH/hXCTFMCsCm3QANu+/kHtc5c1QO3/FgQGSxteu0QKPMQlQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgnd27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 22:20:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso4523032b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 15:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789211; x=1760394011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaQd3cF9DM3ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=;
        b=Y9di4DMhDQIWRggQVXp8ys7ozu9tBrF88dcTRQ2GF02aIPrl/9nEbA8x00lVNQJXz6
         5QHpi3cp/Q1DN5DDnjkJ+AiHhE45DbgEQ4c61TNB/IVg9lY49/U1buUqp84D+STACHqm
         3pKyeP5DueO+CzFNayA69cyy39uxcBYB3/Vz/CCUmh0cnZ59ZvrG+FgIbfR/O7KXjlnW
         FsjITM489PrfHHxAYlKgI1Il/WcXAxHAwUT+3VuVkHP+qDLibKtWz8ClDv8UyI2kd+bp
         BBLLTv1WrceKHSOnSobGxN2HP1hsBCvblGc6//2E2hENWK9FEvaZurqUQA6mC0MDVwAP
         FLTA==
X-Forwarded-Encrypted: i=1; AJvYcCUi6nmEniQI+ZiPLFXUQfb9+SJMzu26Qr+gFZL7cLUoVi807DQQjlTCS7QIrEb0tWckQ5N2ftGlGNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb2D8s51Y8WtSzXLNip5Gva8vjAw7mLLIUsbhwsKZCzBwG9bwF
	gREa8Qj/5o/MmC4XV9Tp6F5c2AZR6Uxbv2mPC326vva7xBOPJHzdLdXKuY3hl+DuCqOLzmn+2ug
	NeM0WA3428cI5WXzm4f7j9gaG2FrBRZZ5+Pphnyd/mgaHLCeNkAAknTc0BBqoJ7U=
X-Gm-Gg: ASbGncumnOJ2mQqTV1c8NiKAXe/a9hMDFEpqkAy87G6QltwujUXIvc/bYMLCsgFP09e
	uTAx6ovE7klFAUJaJhdYFzaZoVdgPpxiDIuH9yc8WJyFShuyEJp7Ldx7z6OmE/4xRIHNuO8R7bm
	svigeaLiB+LZBdZi/0B9hovrGWDZGlq8/sa4vjXkr2VBJMxyf3rSifqgrZmVZ9FaIgd1wvHKCZA
	pQMz90A24l8OM+dfMHWxxDlFzQWYRtE3lqiLyG9LFQ0Ft+vMrTujSkRtDZTHtGKcRNgC/zivPl6
	9TLlHOG93VggtkYn9VIXLiFreUdfaRZVg2HPBuUN4EWyByNtwAw/Bs+p3DLZXxpozV0d07sSGRI
	V+InlONZ3YwkE9bpeZelZ0Q==
X-Received: by 2002:a05:6a00:2304:b0:781:1e91:fd8c with SMTP id d2e1a72fcca58-78c98d5d579mr15544432b3a.11.1759789211239;
        Mon, 06 Oct 2025 15:20:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIm8mI+7X+Hd2BCDb5Dl4LJU7yRAMUsvYgqVVINq5kq0s+hlHcmFW7vgYhMca0ppEpo7MuMA==
X-Received: by 2002:a05:6a00:2304:b0:781:1e91:fd8c with SMTP id d2e1a72fcca58-78c98d5d579mr15544404b3a.11.1759789210762;
        Mon, 06 Oct 2025 15:20:10 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:10 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 03/10] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
Date: Mon,  6 Oct 2025 15:19:55 -0700
Message-Id: <20251006222002.2182777-4-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX7Qr078XuO/AI
 tYe/rDYndESxf8dbQGLxzBbLnQ+an6I7S24hV94Y4Q/vF8W4wY26UfZuji3XNVcIc012Vv8A7qR
 uc5kW1+dRNjpiyISbkAeEdgoE2j1w1au0JLLJqsmUUkrsamaNuNalLDbc4Ltu7MkCpK42DhB6NK
 ciboAMULwKEOxFnJCq+cPrl+N2i8beZT8OdcwjoB13hYK/TTEAvlXUAG7ZiW8Tc5VwLQBoLo+XU
 FmioyU/hkLTKxBlhwEJtz23pTcZuzKcs/rMGN9Cn8f/L847j2MF+ffH8h8QouFX7pO3cN1/jJQP
 joaZI03l28PF6wkvbHYaySu7XGd4slXT+UWXEZFOorgn+d/cxxthCesCZgQq38coumqNGxGtiCe
 IdavJaqFg8MEq3z/l/2EAEx8Ha08lw==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e4409c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=dJG6SERxbJy7wEyxA2sA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: -FEjE8AC2kpDDyu0ZG0EqN07DUmacAq3
X-Proofpoint-ORIG-GUID: -FEjE8AC2kpDDyu0ZG0EqN07DUmacAq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
the fallback.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml      | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c84c62d0e8cb..0d5db71e0ad8 100644
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
@@ -53,12 +56,20 @@ required:
   - compatible
   - reg
   - "#phy-cells"
-  - clocks
-  - clock-names
   - resets
   - vdd-supply
   - vdda12-supply
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm8750-m31-eusb2-phy
+    then:
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:

