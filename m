Return-Path: <linux-usb+bounces-35937-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPfvDEuRz2lqxQYAu9opvQ
	(envelope-from <linux-usb+bounces-35937-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 12:07:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EEC39324B
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 12:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA19A3048EFA
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 10:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9136B364035;
	Fri,  3 Apr 2026 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAQunOtI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQOHqqoB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F00384239
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210702; cv=none; b=XdZGxw8z5gYMrY9SRCruyp345EQysLEk2PouS7H2MYC0GZEMW7Heat6A8womQIaSa4yIiTIrZMn/d2SypWagKPMGM8IfoSNc2l3KssJ+WjeQXio94MGpFf2ErfIYAcGC+Prjubj2nRvZWj1sIQRRq2lpi4CMkzVG3gU8cbD/+7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210702; c=relaxed/simple;
	bh=efXyJFthK1RwO1gkoi5S7ZO/n2WE7wmVX+aDcmjL8sM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YuKrWHXd7LBqZmsbq6KaZCGv9iUIiykob/+jpWOIC1fISz6C3iq2z+JCcI3/IZ37pk868UQwy5Pd86DBrLqclzX8EC92bn03sREvxIGJiQ85qNtIkboBplRpJ2dgy+kRES1JWZ7yb5JKpNsQDIER2R6wzeOLP1UfAxB2cxmF1yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAQunOtI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQOHqqoB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63331A771562147
	for <linux-usb@vger.kernel.org>; Fri, 3 Apr 2026 10:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1REY2wsCGV3
	HSNoEULDW4QCYFPv7fEIyOOLtPEnxuVA=; b=nAQunOtIERw+X43DYujHFX+kqFn
	VPiVDa3LL9DF889C7g6mghcbtnzgosIG0tKzvJ04Zcq0USi1AOD2XcVXHBPrQdfm
	bGRp7HTPp2yS1atkmyNO8LU8EIpwRMfq4MmrUnWq8GiKTxXxfJU7N2dMLaj+Qq+S
	iqKwUUqX3q1Qr0DPwepPP1gKgnz7+Ht4aiWGUlF1LKGpciOzi66AVRECxnIEncCx
	P/lID1PXEL3yzBf+/1HUBivFYuGlwCc9gl9n7Yx/k1PpNpdfKRzO2mi2GhBzhExf
	l5CskmzW9WkNdpbNr5D6BFbOkviJLLfleBlwZV8qVfhq/h29uG8dPEozJXg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um731dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 10:04:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so1948989b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775210694; x=1775815494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1REY2wsCGV3HSNoEULDW4QCYFPv7fEIyOOLtPEnxuVA=;
        b=IQOHqqoBTmCiLvEellFBSGMlKV+gETbBkZ4xVkvKofPC1AuFXCavgWdSLSmB84a5C2
         owGTw3w+SIPaDl6rzm6SjlS4LsKGix/P4NC5UfyCH+VyNIr7MkFcyReT4XJV9fD9soFu
         LH07oX9mp28TA4nqPvGb1TjZtx+nY3HglWY7IZlK1g71M3pn/O5uKs9s75fydcRaW3EU
         sEoP3yE+XLoTfEyS0M6E2OnPzIyEK/JHSwxljUy88CyWbwq4DTmQH1+tLfh1fpi16H3i
         4fON32JRJoIu+nn8SChaUfkXz/AvYsuNSE2PKirotkOQTZbqT6zqaR7cPsDtkz+H/zC7
         c34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210694; x=1775815494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1REY2wsCGV3HSNoEULDW4QCYFPv7fEIyOOLtPEnxuVA=;
        b=fUSaLR4jNNRCkZKuL42ALlHOFTn7raf+Elj6OfMtEcpR3QNgeEbOxOV/DrTiqwySpS
         2aiK22fNkACJV+pqI/pKs3Ndp2yKbrAe4EV6hvuPRCu4yghbGcKSLktQ3V6Yg035VyMJ
         Zn1T9hZ3yzIJNMnCDnl8h9QLaQFyWWCHKLO++gADSWYnLGdAi8UumO6TDg603oB77H1p
         qHt5ofuY8kRJeu+5qkyw2+C63fOV8TtrOEXHq36BvKTeL5RGif8nlQNfNHqRI+1sR44D
         Z62vn113ujnQMHi1SvkeBkGzJMziwW508/KyF4iCs+YV9KOpa2L0j9KDk+Xfu7isSfYZ
         O+/Q==
X-Gm-Message-State: AOJu0Yx0qEyo2u+Qych1FYSm/q4PQKa6nPjuocQK/0YGmG6ZUQ1Fj8ix
	VMta0tDYuCeygf+v+m8y9O/OWzGKxDl2FVg4kuhAnniF647JPKerJ0W9JErM/OzEnnaqA2bmcvP
	0+R3AyuxA8+I36GDCkW+Dp0v12gAE3Ak98QOPiFuTQC5l9qyzARy19US1zbKFQBo=
X-Gm-Gg: AeBDieuEHb/+lVDLmwJgcUX0G/j2dq9QbeTf0xkihe0BN56Z+g+pxelXfuBaawDsL2R
	xayk9gRkkNW1Ai13KxJWx3NUYeg/OWb9ON3Y96pOa5Q2A9iTgPiB1gwUiGrHuD2MZrI7ci5nMoq
	OMmZpWQiyiCkcAjrSCMopMO4Bbks7Pi4XAEh6KBwMhNiVrrZXc6ThKNK3G+LUTTskUO0yA58LXY
	/4h7kJHaoRwZiCL38jA5ZbTheou44er7fvMHdrPIzsuDfDIejzdtk60JeSD3gVZAvY52oARbRrJ
	OU3MvXbkwet5fLF+J3/4ZUqEdCYFyt3HMS4ojL61R6D7GwG9MDFluObxrkP1mxr6Tg1Qme11bke
	Z2n6GDKbOEPKLWqrd0m/v5zcCaqLUZUB3GzYLfeOYQ2nB1O9qQd9IeLA=
X-Received: by 2002:a05:6a00:1d8c:b0:82a:649d:95e7 with SMTP id d2e1a72fcca58-82d0dbe24a2mr1787190b3a.18.1775210693925;
        Fri, 03 Apr 2026 03:04:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8c:b0:82a:649d:95e7 with SMTP id d2e1a72fcca58-82d0dbe24a2mr1787167b3a.18.1775210693441;
        Fri, 03 Apr 2026 03:04:53 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5012644b3a.23.2026.04.03.03.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:04:52 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexey Charkov <alchark@flipper.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: usb: Add Genesys Logic GL3590 hub
Date: Fri,  3 Apr 2026 15:34:34 +0530
Message-Id: <20260403100435.3477729-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403100435.3477729-1-swati.agarwal@oss.qualcomm.com>
References: <20260403100435.3477729-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cf90c6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1mrrX1IwxDsCUTwcy_oA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: -N6egflpRBjSWNBKTXlghHpRqSjxHWgA
X-Proofpoint-ORIG-GUID: -N6egflpRBjSWNBKTXlghHpRqSjxHWgA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4OCBTYWx0ZWRfXyVHqX7YWDXFF
 J/tCZKknWNra87+18OXgSZBCqgoAkWFNQr6YCvbCqAPgroWBEdcUYJI1/ZGcBneHpWU27Cqb9lK
 cX6OscF1xprL8e4uLlwLfgUtqEu/NFI1pvSF8zn/RV0gCuMduKmTBxSttTWugPLdTduTeipuRJa
 Dil+tgD3D6Yptr4KY7s5I1dGr9FPFAfj3IovYnrijVsUglB/Q9DDqjybdrIhV2p+Ol+DHg0yAnN
 TMBc4epCwzHBPFkQAIo9tR9TMcFBVEhxYN4fLcAMV0pE5Da+bnk8dqiTdYl80qRQ+MgJ9ZSTI6p
 9f4FppeBzeEwPPaDZoV5lGmUqwqrsLsnA+jFU6k816hVigizGF1EFLozumNDt+h1uppfA1Pn4Sm
 CDNOSwXgaT4OLGBdCfcEiHnZ7V0LuCUyXguWVxi+/pF9smVuODRLFQE4A2QeFQUwk3dOWuuVcbZ
 kH9v6sSrKRNaxxHT9UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030088
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35937-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7EEC39324B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the binding for the USB3.2 Genesys Logic GL3590 hub.
GL3590 hub requires 1.2V and 3.3V supplies for operation.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../bindings/usb/genesys,gl850g.yaml           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 9a94b2a74a1e..e8b8c03f87a0 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -15,6 +15,7 @@ properties:
       - usb5e3,608
       - usb5e3,610
       - usb5e3,620
+      - usb5e3,625
       - usb5e3,626
 
   reg: true
@@ -26,6 +27,10 @@ properties:
     description:
       The regulator that provides 3.3V or 5.0V core power to the hub.
 
+  vdd12-supply:
+    description:
+      The regulator that provides 1.2V power to the hub.
+
   peer-hub: true
 
   ports:
@@ -56,6 +61,7 @@ allOf:
       properties:
         peer-hub: false
         vdd-supply: false
+        vdd12-supply: false
 
   - if:
       properties:
@@ -68,6 +74,18 @@ allOf:
       properties:
         peer-hub: true
         vdd-supply: true
+        vdd12-supply: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,625
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: true
 
 unevaluatedProperties: false
 
-- 
2.34.1


