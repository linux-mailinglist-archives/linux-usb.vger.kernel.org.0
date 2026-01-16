Return-Path: <linux-usb+bounces-32434-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AC5D389B4
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 00:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A1D430196A6
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 23:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5680831812E;
	Fri, 16 Jan 2026 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRmPPhWU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OAU7XOvd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2B62FDC22
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605671; cv=none; b=FhTnZJD1aRmuHnPlAjgDlw+rdgtWqZ92WOzyEQSSkJp14cGWnTsCkZh2YIii3MNNnH9/Yc6rKxWPnsHZ66H4Z8LgghU+oCC05D+F+22tUVEIjCYe7CNbSSFgt8QORVJ1SO4YzAermexj7cRSgOlzSGaY7/lApSoSRuoFtbHqNGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605671; c=relaxed/simple;
	bh=Myb5/SidE30NTPohSE6poB77sjMp34zHy+G6Ervv8b0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OYQcz5b03o6cYsghTMNox0N7ielgwO5rSXGfxFXHELo3F6CmCRBL4277ooqZEWG9GOyKC5TvnLbAGvr8FugFDMgIoLA6oXsY43jzwscu/l2T/PptY+zTGgNFieK4O0vbQmusyIW2EN5Dt9X0OgRf+ml+3DqmXDkJAy5OqfzDOsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRmPPhWU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAU7XOvd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNDawq2134164
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kwfFFi6O6CY
	E9sERUzKNtpAa9yEpQVqdx39AZPQqd2g=; b=XRmPPhWU/RdCtRohGnQpYjwyCoq
	wqD6a/AWRR5cnlCOYMF9s/6jQSRWxfXRi4iWjZyVjsoLSyqaKbce3/VUPCNyEgBN
	TQ68EqvDGfqPN9OS2y8U9axBbhW/e7jIER2uyJ6EPQpLVO90IUo+7LD0wnmYsL+K
	nn8yaEYhR9NtTVjRh2QTKo/5KpHeusBiWi3/8griHpLMx3T1Dfl9nPXXqA+Nahn3
	eqy/w9EjnaL4ttRYPi4ntrpO7GCKvdICZeG9dX3sCBsPg3lXyVLLRFJ8d1C7sRkK
	+HnHDkosHwCmP8q1F6kBsCr9/NxiPByEB4XetxJAosjxfuO+WSTk3T2OFbA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqveh8bkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:09 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11b9786fb51so15703958c88.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 15:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605669; x=1769210469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwfFFi6O6CYE9sERUzKNtpAa9yEpQVqdx39AZPQqd2g=;
        b=OAU7XOvdqSLuB3D/DbSZR1UWQGqrIXEhpLAhpiP4hFLnNYrZ7KwMVq/q+dM7AbULW5
         8fsVY8PNNyfsaM3KyuQu+4Rnq5CHppwx3aetw+wpSIsFpt8BO/5V3LmkCYU9XwTyDO+N
         ZNjIZE8PetS0uYi9UX4xx+0nQRjRraFtgfgAX1TcgzlHsuO+KfzjIrCo51J4HBywqm3m
         pchX17M+qzdFRzIXdKrWY9AvZbDaG59VOYOYCnQe0kbIH0eP5Oye45rRcArPKEItnkhf
         h5Xl1tVesWxzeAyFHUHxsWtGWQuWDq4mbA3lVLvnyKuxGi9VmEB+SsiC15tinBvs0bTB
         U+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605669; x=1769210469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kwfFFi6O6CYE9sERUzKNtpAa9yEpQVqdx39AZPQqd2g=;
        b=GG5WAyreyXS3ICFHhGsDK04ynixP4/+wAXCKN9axJjDymPkCZxq1/Wd+Kiz6Pf46Cl
         RAC4G+5Wfv7cj+dmOIMDaMw7ZS1fMLOgfLQ8P0USPSem2xXCWoBL0X+RuS7uW+agKYJV
         iPBihMnlZiIbXVtrLLDVhaS8l9z+tYZFDcOga16eGosIKqOezUAxdTtWNHLqDXtQUizg
         P5pWqvtGnGAZcVtYJXKDZUpzunPEE7mLBrzk3ldSsjdIpJSQY6TsmPHuUnPsdHYQ2fXp
         j10hFYzlWIqYvF3SbR49CEuiwESHflXrveoL8ngWyaNODNfUQDE6FE9roDY3r8tborbO
         8ppg==
X-Forwarded-Encrypted: i=1; AJvYcCWjVvzJEf7+GqEKVTq4iUhv7Mh29cGDq3DIRzq2x/m1JAjJCJcLf0+DFV0K/rCm5n985F3462OeucU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvcom2khSOAhAO8lKC3RwhQWQRxTrTg16zautSz0ixg+MdzeCV
	ovnchhkXOE1oekTrBJUkYqwanPUUwPnjNZgUA7zmN/K2aX7TVP2w2fesI++qvLPuFROPFYXOdOT
	UMlExYlrzL5mKdIWKL+eWgMVY1zJc4Ha2jWsobr6w0cAqVEXrOk7PxJHiEHBfIaA=
X-Gm-Gg: AY/fxX4e5thyjOcc+PidwJykUsV0T39Ct+nVgH+QbdVXRF5R7ml6t6vj9IrsnlQtWHZ
	GL343km0q2PAze9c5vaKP6vlZizWPQu1eSYn0BoOBOhEEk/PoNbXBF5hZkDd3Z40zKu1kHjF1ee
	coAe1R+a/LS7IPEVTKO1EfWjmGlTOvOqX5pmzT1xlwbd6ko3/SaNjjx/boaJXpgitmu4rCoMgj+
	kxDo0Y3z0GV5enXU9RlAB+Pm8T4v0atfynPF8PQuHBuf5C1z4HntREJwveG595+gI7wSYxLmy3v
	aLYDzS97fu5FC6MNH1J346fRY4BjF2MFNP2RfxicbfzPO4+3T00fDEHRchtHc5+kL+HwJE789Qd
	MRA8spnZ3/QTUwAMM/X3ABXIz9RTu23MnxGmvXBsG47kyYAznuW6hWExgPUrdzUk=
X-Received: by 2002:a05:7022:4584:b0:119:e56b:958c with SMTP id a92af1059eb24-1244a72d3b7mr4127553c88.17.1768605668843;
        Fri, 16 Jan 2026 15:21:08 -0800 (PST)
X-Received: by 2002:a05:7022:4584:b0:119:e56b:958c with SMTP id a92af1059eb24-1244a72d3b7mr4127526c88.17.1768605668213;
        Fri, 16 Jan 2026 15:21:08 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:07 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] dt-bindings: soc: qcom: eud: Restructure to model multi-path hardware
Date: Fri, 16 Jan 2026 15:20:58 -0800
Message-Id: <20260116232106.2234978-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX/XVJl06SKhzU
 ZsP8aLCYGdFdViNaD083okZTfpH1DqtQ4pPMYPas2xdkNXaeNKH4xNxOX1i14o3DJr3fr4O7cHu
 A/0AXjo3YF2OVRrjyC7lpnImb551N/yfcNc7zgsQq/H6SIk8Je6kh02eXYj83dW0aXz22owwh8K
 ues3FcC5p+IwCXfiprkPv5OsU9EC9m7g71fkIrX3RpWG1B3dpcLp3aNsFgHgfR+vZJ1IoaEyGo5
 FZHlD0SMU+gbfVSUJMNF12GNRZptWVKj0yzniXNXUlMHoTYnkV2xgIsN+e2VMYjJ5CAqovBGQgb
 Cz4IrG0aGukv/zNxQldt3M2WHmE2RGmD38lSG1cXXK7e4XvlSd9+zojX923Y15nyvbCTP7TswMV
 FRBW1nDvfUqn0eaUpL3319uUQuSI6cK3zEXbxCKijQew4kUNYQKdUC9XMFiRYOgM/f+dv4hMDYN
 xgcRMVOOwFudcNMNlXQ==
X-Proofpoint-ORIG-GUID: 9-Pls6nTyiH9N99MXrSulTOxO7pUiMTx
X-Proofpoint-GUID: 9-Pls6nTyiH9N99MXrSulTOxO7pUiMTx
X-Authority-Analysis: v=2.4 cv=ePgeTXp1 c=1 sm=1 tr=0 ts=696ac7e5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=BjueR4FZ-pLKYUec0x4A:9
 a=T0KM2sWh4d-P_2Ru:21 a=vBUdepa8ALXHeOFLBtFW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

The Qualcomm Embedded USB Debugger (EUD) hardware can intercept up to
two independent High-Speed UTMI data paths, depending on the SoC
configuration. Each path operates independently with:

- Dedicated PHY interface
- Distinct USB connector and controller associations
- Role dependent routing

Model these hardware paths as separate eud-path nodes to accurately
represent the physical topology and add below per-path properties:

phys: EUD exposes a High-Speed debug hub that relies on HS-PHY for its
operation. This property references the HS-PHY associated with the UTMI
path.

usb-role-switch: Indicates that the USB port on this UTMI path supports
role switching. In device role, debug mode inserts the EUD hub into the
UTMI path. In host role, the EUD hub is bypassed and UTMI traffic flows
directly between the PHY and the USB controller.

This change breaks backwards compatibility, but the previous binding
omitted critical resources like PHY and did not describe per-path
topology. Without these modifications EUD cannot be guaranteed to
function.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 97 ++++++++++++++-----
 1 file changed, 71 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..a7162560c323 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -10,8 +10,11 @@ maintainers:
   - Souradeep Chowdhury <quic_schowdhu@quicinc.com>
 
 description:
-  This binding is used to describe the Qualcomm Embedded USB Debugger, which is
-  mini USB-hub implemented on chip to support USB-based debug capabilities.
+  This binding describes the Qualcomm Embedded USB Debugger (EUD), an on-chip
+  mini USB hub that enables USB-based debug capabilities. The EUD block is
+  positioned between the High-Speed USB PHY and the USB controller, where it
+  intercepts the UTMI interface to support debug and bypass modes. EUD can be
+  supported on up to two High-Speed USB ports.
 
 properties:
   compatible:
@@ -29,26 +32,59 @@ properties:
     description: EUD interrupt
     maxItems: 1
 
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^eud-path@[0-1]$":
+    type: object
     description:
-      These ports is to be attached to the endpoint of the DWC3 controller node
-      and type C connector node. The controller has the "usb-role-switch"
-      property.
+      Represents one High-Speed UTMI path that EUD intercepts. This node models
+      the physical data path intercepted by EUD and provides graph endpoints to
+      link the USB controller and the external connector associated with this path.
 
     properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: This port is to be attached to the DWC3 controller.
+      reg:
+        maxItems: 1
+        description: Path number
+
+      phys:
+        maxItems: 1
+        description: High-Speed USB PHY associated with this data path.
+
+      usb-role-switch:
+        type: boolean
+        description:
+          Set this property if the USB port on this path is role switch capable.
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description:
+          These ports are to be attached to the endpoint of the USB controller node
+          and USB connector node.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB controller.
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: This port is to be attached to the type C connector.
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB connector.
+
+    required:
+      - reg
+      - phys
+      - ports
+
+    additionalProperties: false
 
 required:
   - compatible
   - reg
-  - ports
 
 additionalProperties: false
 
@@ -58,21 +94,30 @@ examples:
         compatible = "qcom,sc7280-eud", "qcom,eud";
         reg = <0x88e0000 0x2000>,
               <0x88e2000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eud-path@0 {
+            reg = <0>;
+            phys = <&usb_1_hsphy>;
+            usb-role-switch;
 
-        ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            port@0 {
-                reg = <0>;
-                eud_ep: endpoint {
-                    remote-endpoint = <&usb2_role_switch>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    eud_ep: endpoint {
+                        remote-endpoint = <&usb2_role_switch>;
+                    };
                 };
-            };
 
-            port@1 {
-                reg = <1>;
-                eud_con: endpoint {
-                    remote-endpoint = <&con_eud>;
+                port@1 {
+                    reg = <1>;
+                    eud_con: endpoint {
+                        remote-endpoint = <&con_eud>;
+                    };
                 };
             };
         };
-- 
2.34.1


