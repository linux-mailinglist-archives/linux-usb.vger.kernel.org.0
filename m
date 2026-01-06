Return-Path: <linux-usb+bounces-31964-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2720CFA4D7
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 19:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EB5C304D4A1
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 18:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537D32DBF76;
	Tue,  6 Jan 2026 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phxp7HYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOI/IUHL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3266728D8E8
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 18:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725425; cv=none; b=HEEwWvf0pCqUHZxI3igOHCNQ8t9qi4puBre0odQlPaFYpJmbMzTkIs/NIH4YBLcRFxxe3aZvty0bj43I3P//oNscjAJjnp4p4ksVPFXGxVpQF08qlrOBhy3iTB04nDMZP/M5pij0DccHSXJmq8l9XNwj7tftMwErWufdKm+fFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725425; c=relaxed/simple;
	bh=lyDLvNF18lEiSSeSlvoSMCzQtT5OvpV21/43W8uDkJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nA1kAf22qBacs1Zlb51dgVliB+By/5j67dGl8ac1KvMLcpfxYEKmwgQi77MDJqqmUvAUCInlfgBAxdC6/p2F1vtWZsCbdWlqqjIuKtYmHYRJVpQA59kAUA75f9XBIHyBBDDD8FxSG9Ro4yl7XiUN3PROjaY/IYA4OOYvFDfHMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phxp7HYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOI/IUHL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606H1Nbo822621
	for <linux-usb@vger.kernel.org>; Tue, 6 Jan 2026 18:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vr4LRkDX0duY5LLos4+PWvLC+7jFX2bckr8
	xKAUGqQw=; b=phxp7HYrJx2xkX+XZgW2GA3IVbyyl+PWSC/BoMDAC6qhYUDvhIp
	/WYJtp/KUr8c/h0XnX+Er2tmIzeDd70rulyJRmtd/XQ7NAx4lS1DRX7VttEehwGK
	ONvBuOWptB5HRwDIhq72KJDYyHivc2ZQDzaEsIAqV3q2hPf6GOLUg0w2IzTRgdl/
	x9P6IK2B/2/MEY6+8Jv5lAJd+8eY3K1zyxTMSJGoTTgmDKWKnfGdLYao+JCh68yp
	EQLlRnivROeRYVuxiZOrLxX0Eus878MmZpxkyPe0WqBePhTae+Nvs9Dm9Y7lM206
	JeK7OKRjH6aPP40uAGWBndNgzp2HFvsxwOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6e80bkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 18:50:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edad69b4e8so2625961cf.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 10:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767725421; x=1768330221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vr4LRkDX0duY5LLos4+PWvLC+7jFX2bckr8xKAUGqQw=;
        b=NOI/IUHLqPBS0c2z4YGn+Icl4fvYa1oI5DH2PGw89hi0k7U36JFf7xXVleL766KkCQ
         CAixjvFe/XZcL9oKZPLXNMPgZj3GJ9B4INNLYV1OzKM7xRvO8RS1hycUmGincsZIu8hT
         WIXaVlkcvYT+6sZfBf8C8mdm7/qNK1U0k60KQz8Rbdl8GuAIA6rnhCnhckBV7si79QMf
         amHPfyl2KZUVuiRj8hNWZWhH4Ms+QZjk/FwG5M0d9MGNDq9Dqe6dw7hB3qwRP22TWNku
         vkvRpiclKUIVfYLyceKea3s1OvQB20dgPjRkWtQE4m5pHj94mLtDjXydMX6+QIKZ/uVn
         IwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767725421; x=1768330221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr4LRkDX0duY5LLos4+PWvLC+7jFX2bckr8xKAUGqQw=;
        b=u3Di4zqki4EZnRtZEQScOvhFqF8fIRez+B83iqLhCkFAdUN0nwWVQkt6EATe1Gm0GM
         NghY4AdpcrB2x8smN9nCJPxLXYDWllOKiy62GcbbxQealmQZZNPZDIF3UCjEh6iEVwtx
         sE7txy8DsxjgrK/LothsvYbQ+s9m3u9o46BkZosaPWxSLRit0eJhv3gFNakkFh3QCpkA
         jgo16FUSZIZv/vpv1ErwXW4KiT0AmQmX4I+HztFk1ZJn2dXROSxL1OmsKsBYstNpWYKM
         ruD/GfcB1tPCT3EcxJU6dCXRGgPgtebTHzf45vwXUziIGnv5esfjVLq/toTjYYllp/+f
         wOEg==
X-Forwarded-Encrypted: i=1; AJvYcCX3LNtNvGpg6JrcKHB612gxlCjrzc3TX+KAmX3d0p25hiUTAEXiDc7iTcnQOamfZvdo1gg0DoreAhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ZaCUPUj7aIlYY76iDxMzuqACtQ2TkiZj/D3DelZ+Huc712fE
	Ipg8GaFKzHT1K41IbdfaCgm5Adnz4NuN+lOeFckG/kJeAP6Dl61yyQsJ9XdOItGFGW573VTfCOV
	R6xAqsr4gEhX1J7yItBr6nGAmGer6auKFOBGGHQpYYqRO/qEacEKdmpWxoQNhGWg=
X-Gm-Gg: AY/fxX4Ad+QSxmbN1aUrktjJ3vi703l3mDVUijmK+asFVWZSi9QMlNslcjs00fioZ7j
	I0SLNfDBG9lsLQkiVlTMehbSv4XkKsRea4A94zpH/raWba1RcFAvdC1HmRysY85Jd+pS97nrb1R
	LAcQNsthUrPv8RE062mjNmUATWq9inJpdDPUvBJxkPG7A9RF7/wYidHbDY2Nzo73tRmdhhpKi7/
	SDTGdzlkh/wtqh8W4vh6MjCw4FXfZIOvHhv2kdWH0KKPPcCjitYFbFfUbopcTCXVDT5CkBJm7I4
	0Vgn4Kuk5WzaPNkk24dKtTko/25bMucs16P9iOnY9YhQ9y1tGwb0PdnuV9b5MwseahSP+MiI/8X
	zgDQSAV7G4Zf9WeWSv62xsyAaKQ==
X-Received: by 2002:ac8:7f4e:0:b0:4f1:c5f6:22ad with SMTP id d75a77b69052e-4ffa841e189mr47262041cf.16.1767725421384;
        Tue, 06 Jan 2026 10:50:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQgB2TN/00DhQOfJABgdxPQwGMc4U9fgRcOA48gTkN1w5GF+TGGCNF7R+5tvaDFNLC51EjPQ==
X-Received: by 2002:ac8:7f4e:0:b0:4f1:c5f6:22ad with SMTP id d75a77b69052e-4ffa841e189mr47261831cf.16.1767725420994;
        Tue, 06 Jan 2026 10:50:20 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be65197sm2885576a12.19.2026.01.06.10.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:50:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: usb: qcom,dwc3: Correct IPQ5018 interrupts
Date: Tue,  6 Jan 2026 19:50:13 +0100
Message-ID: <20260106185012.19551-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=lyDLvNF18lEiSSeSlvoSMCzQtT5OvpV21/43W8uDkJw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXVlkC4vzdoAM3Y320DPOO/LMxSS5amsSfF3Al
 /Q+VsUFGuuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaV1ZZAAKCRDBN2bmhouD
 18sfD/0blvlRnsJ+7xvBCbES/Wk2SrlYt5oY/hMRunDpewuW8t8e93SU6P/JrM0uUY/02Xl9bz8
 k82obMOu2uNB2h4iV5VoI7VTt9o004fv60GV/7qMLo3ntZTLFGppUTm2POhG4uK0sQR3OMvxLZ0
 vDeKOdN+UuVUaSeicVyNYgVjoCIhaxbabgEJqceeLinxvizOrCxCfOW5NavivebAYrUsvmmWDsP
 zYjsUaTbMy2bO1IEDY+KyaywJ7Vl41pPj5xjHLjeI5rRlReFZfbfnR/Cn2CALCpANw9uvm7muYL
 x65C7SjO2SSxAkdIAqTv+P373PHVUxU1DLLzEQweYLxtCMBKgrMgahSEI37HhqeFuCR04Qd0xe/
 tMaVEOpgc1AHgYbclxbkp0rjIsJquKjX0htxR0Hx57DRYxBxbIzvLKtKh3rVkW4zyffFapALnEq
 TweU9X6OtmlPUieUk3AA2xkSKhcMKZs65nmJE1N8liiSRW5gMaX5SD+RaPcU3QF7bV4xP+HeDJu
 Udy68d/aA8ryxd22oY1VQvJ8jz7p6yTH0HX62RMJojqCOr/itTyTYhuYdRek8DUDpTM3S27e+yS
 dYs1+/paummyL7aI7a2sFjuQiG5jSh/JCQ9rLr7AJtVFwM3YpuWgxiqOi+HoSO0b8DeMljwfM2C ijhaNnrgtaxKJTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MyBTYWx0ZWRfXw6r7nsUVSMhW
 x55qO1hCIBWdqIv7eYm1w3CKbowytg71Uhyp1IjXCXGoCD2Lv1qmjP+8Cdd1FrpLSWT4+QH4NRH
 i3iNP8gnXPOPX81szHwLZFqJNCFiGhTuiz0VnNydLanKHtPI50fnnPXlRl2hToL65eNvsFtSFOy
 mj5C8Pdd7wlqGBKdUDZdBIn8IZlrtw4yoXgfS1E5obpYUnLKJxnEhAcr7IF4uaRNXNPcaPO4+fs
 zUjJMbuHXv2tety1hMP/YccB0FoLT5f2QFOdrDfWtUVkcBgACIrx2ApK/4T81+1BOFSrzPtjcPD
 cRuqsjQ3KifI5Tj2fAXRXe88ELRziINKLteynokQHNZ0DkKM81TV1IdpQxJSuwBD1Z+WggY/uyN
 jO6lHcGQxWaNMsjARhS9VKfd/zKiBlgzVUM4wEHWB5/agWzmnBc7WRWWaJeHrsFGOHR6cEu0xgq
 CKku5hqViXpvotqf8Ew==
X-Authority-Analysis: v=2.4 cv=F45at6hN c=1 sm=1 tr=0 ts=695d596e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3SqsvWQJRDs5ZQVTcbUA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: qpTtzpAPEPjWa1ahFAW-ZowOWH2cVOSx
X-Proofpoint-GUID: qpTtzpAPEPjWa1ahFAW-ZowOWH2cVOSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060163

According to reference manual, IPQ5018 does not have QUSB2 PHY and its
interrupts should rather match ones used in IPQ5332 (so power_event,
eud_dmse_int_mx, eud_dpse_int_mx).

Fixes: 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
Fixes: 6e762f7b8edc ("dt-bindings: usb: Introduce qcom,snps-dwc3")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml      | 2 +-
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 4d1a039013fe..7d94b5f7d8d7 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -408,7 +408,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,ipq5018-dwc3
               - qcom,ipq6018-dwc3
               - qcom,ipq8074-dwc3
               - qcom,msm8953-dwc3
@@ -453,6 +452,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5018-dwc3
               - qcom,ipq5332-dwc3
     then:
       properties:
diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8cee7c5582f2..3073943c5964 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -420,7 +420,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,ipq5018-dwc3
               - qcom,ipq6018-dwc3
               - qcom,ipq8074-dwc3
               - qcom,msm8953-dwc3
@@ -467,6 +466,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5018-dwc3
               - qcom,ipq5332-dwc3
     then:
       properties:
-- 
2.51.0


