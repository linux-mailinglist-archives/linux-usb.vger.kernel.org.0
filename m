Return-Path: <linux-usb+bounces-22935-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E1AA8522F
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 05:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13D984A6BD4
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 03:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE4D27CCF6;
	Fri, 11 Apr 2025 03:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAkrBQLR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2527CB28
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744343430; cv=none; b=GJxenYJJFSJGEvTUxF+1yffkFhKx8jksi9vA4N0A6eIXWa+/6POe5iNxa/3LQ5ZO2HhrTKr2m66Q8QZKNxtwGWTfF3C2IZzOBRR/GDeReKFDKlL+cY4sXJ3QCo3uvIfKEaWT1HhzZ3xBd5Zy7QHF+NYAm+FD07zWnuumn2OGxyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744343430; c=relaxed/simple;
	bh=5aUIi72laSNrHqd1zHvVj7+Gq/d3mQuTesLOpmQ/75o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kO9i1WN5rxHxPC7e/dZrT4UUvgjqQmSOyCq81qNvj2JiXnrUgaO3mDh12VLEug0TzBJHart/K6kzVm6Gwhp5561ul16UHxjvApdck/jtU8EnFHIJVA6fGH6VycTV+ZLemZ/YgYMUuwjQjKhrN+eUMihCLf5ig5GsCPkEWMChs1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAkrBQLR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGEj8l028834
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQhWDLBEGafl/kI2fVjOlnFD1Xx3UwyMctOyRWQBGbI=; b=TAkrBQLRwhJ14Gyq
	U9BT/mFpCivsqx5u7eMtj31iuD3HvFEnDXiGYAfdmYwWYYfnjHiXaaU753gJEwpW
	hK1YNHBmj9H4f/xKkJW+62Ck0wHI90ReCdr+R57bxJfAwnjMBgJV1Nl8bpsvBUMO
	oo249nqBk4sqgUyVlLScdgQx6g2zk0BulEAIF0akHle8Wp5q5xvESfapsPqkW1Ye
	Hs2Oo+hjJVDKBaBK7Gs2f1G31fn8k6SFuX7wYnlGP27x4i0aZqY6mYB3yV1YgeDU
	rmN734raGjA6HgX+W6QuJLP6+toyFQl3Ks1uy8n+jLXbS0NFd7jRprG9RWMUuch2
	qFchSA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbus3h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 03:50:26 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2d031b18c44so1359859fac.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 20:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744343425; x=1744948225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQhWDLBEGafl/kI2fVjOlnFD1Xx3UwyMctOyRWQBGbI=;
        b=LfUN2dh9KBOTQAzSsPxs73aakSpMZvInOpU6GyNaB+2gaI3EWtDXxIIyJDn7vbtwRR
         Gx193J+yVPZGMAY5UX8MoLmKp/qqfKTOSYg4ZlJ5FcwN6C6BwRup14qmuU5aI3amfUk8
         cf/7h//5hik60z7w6SHGLWkG29WWtKsVDrOuXVliDAvVi/6NjJPotV9FRCFCM9rb5QAa
         MBKG6znPQYSoJ4dqYVUnojP1JqSMt9/WdyHv8kQ/Vkt3CiBZIf9kWHUTrMD+I8UNkc/m
         p3xzETHEft4YZG/2rvvZZQraJdn+aerj8BgK/IlJ92PhgyMEioPoVJPtEeA713/aCo3B
         98JA==
X-Forwarded-Encrypted: i=1; AJvYcCVKdPnAFD/z4b+elxZ/JNlMB+77CRI5/0I0V/ekVLjI0AbBpxbXwyCoSAIAG3yOhEoDHOHRAdiorFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8x8Ri9uNYljoYgDSf/6HM/LYYqEDcjPXzuc1lpIG8h7697QMe
	gRkbyymB28xbapI9lBRkMCyfsMpZKj5i/L7JW//aHTiAsiRKXs1o6enhykqhqg58beX+txfsHcs
	we21bAFdXwGXIZI1kh2MgkhRvUW1TEZHPwdTjEYQeC5MWTjpxCqq7QA/2u3Y=
X-Gm-Gg: ASbGncvHj+rd54rn6j/20h8IlOidpWKw6CPCOmHFSNCnS2XOPrnaBpCtIzW+Qw7UmM9
	gJ1teVM4frV5TvCFtfRi2LL/ZgM5m8CCqwWFe2WU0svXw9tQ8g958BWKxxFzPZpL3Eoxq63iJUT
	mK1wBlzFE3yLVPsIlTq9JrCpOoEdccRXfmAVPYNXaEH9Sg0418Dy9wiH6w8UEi9eSH/DeHRe85C
	HFeo9I6GvVkbUiHR9AKzcsHuKVfmMCn5lLyrq4Q/5rS18EgjP7mSfAWW2u8bTEu/9o2q61AVCT0
	pUlKRjbMl9rSh2NX3QXDye6yNgWe+zY/qlTgpvGQULxj0jFYmV7PA83xsBX3ZUilvHpMUQ6YZWI
	DWesAcNRi+Hc=
X-Received: by 2002:a05:6870:7196:b0:29e:3de0:d400 with SMTP id 586e51a60fabf-2d0d57c421cmr663462fac.0.1744343425305;
        Thu, 10 Apr 2025 20:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/i8bedNB4IIRnCm/sB9aLCPU/spwG0J4QUV261AcqrnuF3W7a4EJM+oUm1ykkvlTJdZPnew==
X-Received: by 2002:a05:6870:7196:b0:29e:3de0:d400 with SMTP id 586e51a60fabf-2d0d57c421cmr663442fac.0.1744343424832;
        Thu, 10 Apr 2025 20:50:24 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0969589basm958677fac.19.2025.04.10.20.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:50:24 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 22:50:13 -0500
Subject: [PATCH v6 2/6] dt-bindings: usb: Introduce qcom,snps-dwc3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dwc3-refactor-v6-2-dc0d1b336135@oss.qualcomm.com>
References: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
In-Reply-To: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19926;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=5aUIi72laSNrHqd1zHvVj7+Gq/d3mQuTesLOpmQ/75o=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn+JF9SaTPj+murRo/NjRYwPaAS4c9PO6LaP0oG
 B47hKS0YkOJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ/iRfRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWKtQ/9E0l1BNvv7XzzDGhzyxCd4xGO7+4GKDBfb5QOo6h
 Kee+2kqxJPMw0qOxAdQhikPBo6dpxN/EFU2Nl21zselYuJTIC6NCstxStgoPn1Z2ezMVS3n9Jpw
 kJICzas9jfFh0eg/3qekZZ7bUisUyO+qlrZ6IOupF8CKKWeFBeUbZRx9/ukJMUbUtSPh1TZHIGt
 FPacKPc66J4Ay+uDf2+007RBEZJ6sVwg6uuwl9dYqPWgJ+usPbiW/te56K92IIMhXz9nJmGEoFm
 h4RkM2fY9WVeR9cdziI9uiHn8/OpxPWkKiMHPhSEIQ1mjxeH2JKsyZgqm46ByeUHRR2jsVhM7T5
 0Y/89odfaBpMQ5Isls0792t5tDzkafaFTZoDaWcXavt3FyLVfQL2RtS8rdEiXTBbcpJ9p9S7pgh
 K7ch827IywD0GcVvnxPabTgShsExVsHlWJSLU9YOKoDCxjY3MucVwRrwnglYE7TnN1Mpq9d/hBF
 DwT+s4gRK9ri98n1RqodRIfbiG8n/k8gkQHylPsjDLpFT6cQAuaIrh46/Ae+9VZvXP+Gj1FF6vK
 rZZ3coK4Vb00VFpmGhqH1cFLswg79Lrui7I4hSYdRvVZhE+Vwv1oW3IIVCJ2eXEMtQvPIs+Qh00
 qnlFdYMzIOMvU6OGNgQsg7uR0pQbMT/4fMXOWWjLNk6Y=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: pjbLvVKtIsTvt1KuL5iGA6qMrJRYvLkj
X-Proofpoint-ORIG-GUID: pjbLvVKtIsTvt1KuL5iGA6qMrJRYvLkj
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f89182 cx=c_pps a=Z3eh007fzM5o9awBa1HkYQ==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=sxEQ-6IQeHkip0RCg1sA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110026

The Qualcomm USB glue is not separate of the Synopsys DWC3 core and
several of the snps,dwc3 properties (such as clocks and reset) conflicts
in expectation with the Qualcomm integration.

Using the newly split out Synopsys DWC3 core properties, describe the
Qualcomm USB block in a single block. The new binding is a copy of
qcom,dwc3 with the needed modifications.

It would have been convenient to retain the two structures with the same
compatibles, but as there exist no way to select a binding based on the
absence of a subnode/patternProperty, a new generic compatible is
introduced to describe this binding.

To avoid redefining all the platform-specific compatibles, "select" is
used to tell the DeviceTree validator which binding to use solely on the
generic compatible. (Otherwise if the specific compatible matches during
validation, the generic one must match as well)

Mark qcom,dwc3 deprecated, to favor expressing future platforms using
the new combined binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 622 +++++++++++++++++++++
 2 files changed, 634 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 64137c1619a635a5a4f96fc49bd75c5fb757febb..ffb8f9c654b7ae6c3ff29ead24bfe1e721d25afc 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -4,11 +4,22 @@
 $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm SuperSpeed DWC3 USB SoC controller
+title: Legacy Qualcomm SuperSpeed DWC3 USB SoC controller
 
 maintainers:
   - Wesley Cheng <quic_wcheng@quicinc.com>
 
+# Use the combined qcom,snps-dwc3 instead
+deprecated: true
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,dwc3
+  required:
+    - compatible
+
 properties:
   compatible:
     items:
diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8dac5eba61b45bc2ea78b23ff38678f909e21317
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -0,0 +1,622 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Wesley Cheng <quic_wcheng@quicinc.com>
+
+description:
+  Describes the Qualcomm USB block, based on Synopsys DWC3.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,snps-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,ipq4019-dwc3
+          - qcom,ipq5018-dwc3
+          - qcom,ipq5332-dwc3
+          - qcom,ipq5424-dwc3
+          - qcom,ipq6018-dwc3
+          - qcom,ipq8064-dwc3
+          - qcom,ipq8074-dwc3
+          - qcom,ipq9574-dwc3
+          - qcom,msm8953-dwc3
+          - qcom,msm8994-dwc3
+          - qcom,msm8996-dwc3
+          - qcom,msm8998-dwc3
+          - qcom,qcm2290-dwc3
+          - qcom,qcs404-dwc3
+          - qcom,qcs615-dwc3
+          - qcom,qcs8300-dwc3
+          - qcom,qdu1000-dwc3
+          - qcom,sa8775p-dwc3
+          - qcom,sar2130p-dwc3
+          - qcom,sc7180-dwc3
+          - qcom,sc7280-dwc3
+          - qcom,sc8180x-dwc3
+          - qcom,sc8180x-dwc3-mp
+          - qcom,sc8280xp-dwc3
+          - qcom,sc8280xp-dwc3-mp
+          - qcom,sdm660-dwc3
+          - qcom,sdm670-dwc3
+          - qcom,sdm845-dwc3
+          - qcom,sdx55-dwc3
+          - qcom,sdx65-dwc3
+          - qcom,sdx75-dwc3
+          - qcom,sm4250-dwc3
+          - qcom,sm6115-dwc3
+          - qcom,sm6125-dwc3
+          - qcom,sm6350-dwc3
+          - qcom,sm6375-dwc3
+          - qcom,sm8150-dwc3
+          - qcom,sm8250-dwc3
+          - qcom,sm8350-dwc3
+          - qcom,sm8450-dwc3
+          - qcom,sm8550-dwc3
+          - qcom,sm8650-dwc3
+          - qcom,x1e80100-dwc3
+      - const: qcom,snps-dwc3
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Several clocks are used, depending on the variant. Typical ones are::
+       - cfg_noc:: System Config NOC clock.
+       - core:: Master/Core clock, has to be >= 125 MHz for SS operation and >=
+                60MHz for HS operation.
+       - iface:: System bus AXI clock.
+       - sleep:: Sleep clock, used for wakeup when USB3 core goes into low
+                 power mode (U3).
+       - mock_utmi:: Mock utmi clock needed for ITP/SOF generation in host
+                     mode. Its frequency should be 19.2MHz.
+    minItems: 1
+    maxItems: 9
+
+  clock-names:
+    minItems: 1
+    maxItems: 9
+
+  dma-coherent: true
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: usb-ddr
+      - const: apps-usb
+
+  interrupts:
+    description: |
+      Different types of interrupts are used based on HS PHY used on target:
+        - dwc_usb3: Core DWC3 interrupt
+        - pwr_event: Used for wakeup based on other power events.
+        - hs_phy_irq: Apart from DP/DM/QUSB2 PHY interrupts, there is
+                       hs_phy_irq which is not triggered by default and its
+                       functionality is mutually exclusive to that of
+                       {dp/dm}_hs_phy_irq and qusb2_phy_irq.
+        - qusb2_phy: SoCs with QUSB2 PHY do not have separate DP/DM IRQs and
+                      expose only a single IRQ whose behavior can be modified
+                      by the QUSB2PHY_INTR_CTRL register. The required DPSE/
+                      DMSE configuration is done in QUSB2PHY_INTR_CTRL register
+                      of PHY address space.
+        - {dp/dm}_hs_phy_irq: These IRQ's directly reflect changes on the DP/
+                               DM pads of the SoC. These are used for wakeup
+                               only on SoCs with non-QUSB2 targets with
+                               exception of SDM670/SDM845/SM6350.
+        - ss_phy_irq: Used for remote wakeup in Super Speed mode of operation.
+    minItems: 3
+    maxItems: 19
+
+  interrupt-names:
+    minItems: 3
+    maxItems: 19
+
+  qcom,select-utmi-as-pipe-clk:
+    description:
+      If present, disable USB3 pipe_clk requirement.
+      Used when dwc3 operates without SSPHY and only
+      HS/FS/LS modes are supported.
+    type: boolean
+
+  wakeup-source: true
+
+# Required child node:
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq4019-dwc3
+              - qcom,ipq5332-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: core
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8064-dwc3
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Master/Core clock, has to be >= 125 MHz
+                for SS operation and >= 60MHz for HS operation.
+        clock-names:
+          items:
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-dwc3
+              - qcom,msm8953-dwc3
+              - qcom,msm8996-dwc3
+              - qcom,msm8998-dwc3
+              - qcom,qcs8300-dwc3
+              - qcom,sa8775p-dwc3
+              - qcom,sc7180-dwc3
+              - qcom,sc7280-dwc3
+              - qcom,sdm670-dwc3
+              - qcom,sdm845-dwc3
+              - qcom,sdx55-dwc3
+              - qcom,sdx65-dwc3
+              - qcom,sdx75-dwc3
+              - qcom,sm6350-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq6018-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 4
+        clock-names:
+          oneOf:
+            - items:
+                - const: core
+                - const: sleep
+                - const: mock_utmi
+            - items:
+                - const: cfg_noc
+                - const: core
+                - const: sleep
+                - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8074-dwc3
+              - qcom,qdu1000-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5018-dwc3
+              - qcom,msm8994-dwc3
+              - qcom,qcs404-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-dwc3
+              - qcom,sc8280xp-dwc3-mp
+              - qcom,x1e80100-dwc3
+              - qcom,x1e80100-dwc3-mp
+    then:
+      properties:
+        clocks:
+          maxItems: 9
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: noc_aggr
+            - const: noc_aggr_north
+            - const: noc_aggr_south
+            - const: noc_sys
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm660-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 5
+        clock-names:
+          oneOf:
+            - items:
+                - const: cfg_noc
+                - const: core
+                - const: iface
+                - const: sleep
+                - const: mock_utmi
+            - items:
+                - const: cfg_noc
+                - const: core
+                - const: sleep
+                - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-dwc3
+              - qcom,qcs615-dwc3
+              - qcom,sar2130p-dwc3
+              - qcom,sc8180x-dwc3
+              - qcom,sc8180x-dwc3-mp
+              - qcom,sm6115-dwc3
+              - qcom,sm6125-dwc3
+              - qcom,sm8150-dwc3
+              - qcom,sm8250-dwc3
+              - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: xo
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8350-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 6
+        clock-names:
+          minItems: 5
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: xo
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5018-dwc3
+              - qcom,ipq6018-dwc3
+              - qcom,ipq8074-dwc3
+              - qcom,msm8953-dwc3
+              - qcom,msm8998-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 4
+        interrupt-names:
+          minItems: 3
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: qusb2_phy
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-dwc3
+              - qcom,qcs404-dwc3
+              - qcom,sdm660-dwc3
+              - qcom,sm6115-dwc3
+              - qcom,sm6125-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+          maxItems: 5
+        interrupt-names:
+          minItems: 4
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: qusb2_phy
+            - const: hs_phy_irq
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5332-dwc3
+    then:
+      properties:
+        interrupts:
+          maxItems: 4
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-dwc3
+    then:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq4019-dwc3
+              - qcom,ipq8064-dwc3
+              - qcom,msm8994-dwc3
+              - qcom,qcs615-dwc3
+              - qcom,qcs8300-dwc3
+              - qcom,qdu1000-dwc3
+              - qcom,sa8775p-dwc3
+              - qcom,sc7180-dwc3
+              - qcom,sc7280-dwc3
+              - qcom,sc8180x-dwc3
+              - qcom,sc8280xp-dwc3
+              - qcom,sdm670-dwc3
+              - qcom,sdm845-dwc3
+              - qcom,sdx55-dwc3
+              - qcom,sdx65-dwc3
+              - qcom,sdx75-dwc3
+              - qcom,sm4250-dwc3
+              - qcom,sm6350-dwc3
+              - qcom,sm8150-dwc3
+              - qcom,sm8250-dwc3
+              - qcom,sm8350-dwc3
+              - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+          maxItems: 6
+        interrupt-names:
+          minItems: 5
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: hs_phy_irq
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8180x-dwc3-mp
+              - qcom,x1e80100-dwc3-mp
+    then:
+      properties:
+        interrupts:
+          minItems: 11
+          maxItems: 11
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event_1
+            - const: pwr_event_2
+            - const: hs_phy_1
+            - const: hs_phy_2
+            - const: dp_hs_phy_1
+            - const: dm_hs_phy_1
+            - const: dp_hs_phy_2
+            - const: dm_hs_phy_2
+            - const: ss_phy_1
+            - const: ss_phy_2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-dwc3-mp
+    then:
+      properties:
+        interrupts:
+          minItems: 19
+          maxItems: 19
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event_1
+            - const: pwr_event_2
+            - const: pwr_event_3
+            - const: pwr_event_4
+            - const: hs_phy_1
+            - const: hs_phy_2
+            - const: hs_phy_3
+            - const: hs_phy_4
+            - const: dp_hs_phy_1
+            - const: dm_hs_phy_1
+            - const: dp_hs_phy_2
+            - const: dm_hs_phy_2
+            - const: dp_hs_phy_3
+            - const: dm_hs_phy_3
+            - const: dp_hs_phy_4
+            - const: dm_hs_phy_4
+            - const: ss_phy_1
+            - const: ss_phy_2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@a600000 {
+            compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+            reg = <0 0x0a600000 0 0x100000>;
+
+            clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+                     <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+                     <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+                     <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+                     <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+            clock-names = "cfg_noc",
+                          "core",
+                          "iface",
+                          "sleep",
+                          "mock_utmi";
+
+            assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+                          <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+            assigned-clock-rates = <19200000>, <150000000>;
+
+            interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>,
+                         <GIC_SPI 488 IRQ_TYPE_EDGE_BOTH>,
+                         <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "dwc_usb3", "pwr_event", "hs_phy_irq",
+                          "dp_hs_phy_irq", "dm_hs_phy_irq", "ss_phy_irq";
+
+            power-domains = <&gcc USB30_PRIM_GDSC>;
+
+            resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+            iommus = <&apps_smmu 0x740 0>;
+            snps,dis_u2_susphy_quirk;
+            snps,dis_enblslpm_quirk;
+            phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+            phy-names = "usb2-phy", "usb3-phy";
+        };
+    };
+...

-- 
2.49.0


