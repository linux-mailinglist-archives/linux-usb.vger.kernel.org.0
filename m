Return-Path: <linux-usb+bounces-30999-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E876FC8DC6E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 11:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 646583AD864
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 10:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A8132B9B8;
	Thu, 27 Nov 2025 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3iUj+LX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDG7Icg+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D154E32ABC5
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 10:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764239557; cv=none; b=DJxgdsd2MGpv0kncHKJNPhzYbN1mjaFY9lBn20EVmDJ+m2GSHiXrVpz9/46Y+EWIoirpCO8ntQtyv5F7kMUSs3FDQdUysoUQWTaUNmzQxt6qJbKbxXR1FcYZSpRAz7lmCnHMIDNXNrVaVOiaBZGw+orGI8JC+31TnbIQHTFVFfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764239557; c=relaxed/simple;
	bh=/DOTDoZ0H9Rdr3BBRYStnORKLObpfXOFVbzwEfrV0f8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=smQmHVaz9qKm8ZP+Ze2EbgmL0xINZ+xPmGs9cUMKlB0TsjN9/RKO8OTCo54x9MgUP/JovZm6Radj7Mx0ni+we1WreKfCVT7huQqHPKzQ3dHo4JXO65RphBtOkiaBXAJUNI/n6t66EpSyPPW2VO3woazius6azsdDsp0K8mOtbqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3iUj+LX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDG7Icg+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9UHUV685323
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 10:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpYzt4PU0LPIdbJf+XZdJ8ExSip1bg8gPLoUwUltQCk=; b=F3iUj+LXpnTAQnDC
	fOX3Vn3mb83P4tqU/W1fHQfCHSL4kDIt0nsTx5/kXQ4UOTRnex/8mVamRGzakrAn
	SWKUMH1hUTGeMIbYdWzJ4/8rVr2vgMBpo7jY1D3IPHpAiBjtQyZZ5RVHLvYX4/cI
	QvZDazxoiuaBkbkNIQ+Rh7/oSnlKps2NgnvUJEgkFjE1indy5waVhbDJK5mV9sNg
	WU2CKQuiNFAkwu8a2sKCY/YBvIBJgWfnj5jm19VjAvWGrQhbkKWvjH/wLChcW+8P
	4yMaOtBUkxYkuWhqUdZs1+/D+1mOusfyPwHAoZFuPSKB4nyVeIwMHqn5QQJVh6i9
	CE4sAA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2rr65w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 10:32:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bf15b82042so921680b3a.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 02:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764239554; x=1764844354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpYzt4PU0LPIdbJf+XZdJ8ExSip1bg8gPLoUwUltQCk=;
        b=QDG7Icg+vzVR6tl2HhjZZWOT7KCaRAWWexA2evA+HztExzi+k7yeC1TdpHqGX+reME
         5McTu3Qg6NKEcfjlbTDmCg4cnRBV04VIX6AIkFcZJzf+a9GvHU9ROR5PMOUgx1lmjpT/
         rweCgY+E0OR0VRidEOQsypEEhR74EcgEWC5eidmyHn4fGRf00j8XULlvjaL3YNGywZ6c
         jYiN6rQ9SKdRnMEHk6dQwPLGZI5mVKBOirAoXt7+uPm2sMpT2bgTxw/z3Z3W+p165dET
         NSkIi9IAJ5CZNIUoO6W8frLJEMMSfJmPhdB6Sj1/GkZn5hVS147PlChixX2T0GrArvVA
         0WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764239554; x=1764844354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tpYzt4PU0LPIdbJf+XZdJ8ExSip1bg8gPLoUwUltQCk=;
        b=dy/tZOB2F4k12rqUL41z6rMB4L6xLos8v+0EvN6HmF9rOh5L/42HPGRnNExclfJ8VD
         0UwFHiugW0IFc7StT3DrdRhLe+v5XCaXr3vtdwxYnr6PTWSRqcAA3XVYMV6KIiPM1nfn
         6bRyLl4gnj9IU8U33AZIXfPythzJ8EXsf3u18cBxYBJOkHMD/R3geR6t3Vz31rGHoYqE
         S6/q5OaVS+a6SHXfaiDOFPm8O9ZyohYbJBVWVB7X5RikIJOkIEY+PygDE0P01pGZXxVk
         iUpdOSeiHmUfahwG1dYUo6vKMdVzJocVflxoyyIXxcHj6avyOILDBrYTdByo0TdQ6X6j
         g+7w==
X-Forwarded-Encrypted: i=1; AJvYcCWkA122moQ82QcMka+px1DFuSPDatRjRcgD3JJZfIhKv1ivpfvQTBvqb73xeyaXJAlUZiZsRu6aT3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YySqrsHnpwORe3I9AIks7Oavlykk1gkLlcL+t4MH3yLSYmREe3E
	ztoBqm2TamBWyOQ255R1WcQ4vZdM+Mb4W8JqZvO7O1xOPRxlwWcPo4NKpBRy0Xt9n8KiAXsp6iN
	8oMrMJZxGWj3XCbbJQ8ykHmXLYKZQ1XPeOB0jHVRVQDiMYGJixJ2tlF7W4w/Zcn4JRZJ/VNY=
X-Gm-Gg: ASbGnctCDFiWTXNwRfozL/jwWQuV7oogEh36wnWXznY2OsT7C3MZsQTW1p80m6MPQ/5
	bGbcnHRkTIr4R3sCmHvCOCgUpQCv+eK5zc0Tdqjk8EFtLyLUp9O/zXc1u9NrgEY8oH64uhk9iU2
	KylDOhd3EJjI1qftNeavCpfVF1BR0dzNAwNW9E8g1BSj2Ub9BRdVSA0J2LXIXG9TLFTsD9GsOfi
	jpo1eMP3dOcLZyA448fWdbdfPg3+SZH0b7YUt+rhyzqtHqVIWpMuzYQxQ4YOPDGdKj7mPHYUjQR
	poH/UtS/qNzUxpDa8hpqxgZ7h+59y2sM92g0KzktHFGJN+QHLz6dIOCuG20dxb+ZtLrrcCEk9Br
	2gqWFrhzIBuECiymmIAlJsBUbaM/M1uLSLLSMfqw=
X-Received: by 2002:a05:6a00:22d1:b0:776:1c49:82f8 with SMTP id d2e1a72fcca58-7c58c6af789mr26246239b3a.8.1764239553892;
        Thu, 27 Nov 2025 02:32:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7kJjReR2XrEct8UxObPiKeSbmLTG4KJlgckTkwNw68HMQBAKK+DlLZbFHWlcr2ssHWulP0Q==
X-Received: by 2002:a05:6a00:22d1:b0:776:1c49:82f8 with SMTP id d2e1a72fcca58-7c58c6af789mr26246185b3a.8.1764239553385;
        Thu, 27 Nov 2025 02:32:33 -0800 (PST)
Received: from hu-sriramd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f457c38sm1479819b3a.54.2025.11.27.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 02:32:33 -0800 (PST)
From: Sriram Dash <sriram.dash@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 16:01:44 +0530
Subject: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: Add support for
 firmware-managed resources
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-controller_scmi_upstream-v1-1-38bcca513c28@oss.qualcomm.com>
References: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
In-Reply-To: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: jack.pham@oss.qualcomm.com, faisal.hassan@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764239543; l=7415;
 i=sriram.dash@oss.qualcomm.com; s=20251022; h=from:subject:message-id;
 bh=/DOTDoZ0H9Rdr3BBRYStnORKLObpfXOFVbzwEfrV0f8=;
 b=0iM3i4FAQPbb8dW2gExl2yKg7bH2MhOsbqs1sFf1uA30adOQPKcNBpDvZsEEvBxv1X/JTz3ys
 ZBGf93Ya0BqCVHpYqm2l3l9u4f4hb99h4qbsjUpo3VHim7bRWpx+AUM
X-Developer-Key: i=sriram.dash@oss.qualcomm.com; a=ed25519;
 pk=balisq+aEVXEJ6Gnze3kqbYZiFlsdHUjTSdCvupAeP4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3NyBTYWx0ZWRfXylqsLRWP4VQr
 t9jiPNSj8LgqN593wljL0cMMtiBvrSPFrvRVgDGTIKaGghdI4ECZf2MV/yaf8zHwXslTcGk+9BD
 CH+Tf6cpTE/DETEsVFsWfhPNOhWCA9q45d0LGuOrJV5KmKkNGQOb1cE0ucCu/6geu61Poyi1eFW
 pk1jli/N5v3KnS+NrceXUmSpinqD0PpqeGnPipW31cluu4W6/ocaB34D41l/4DhyZ2KW5HKWLEL
 dvLxXBfwUgtyjodUcBAfb8WWZTVXKpXstf9gMtN6JXjSsgCCHQWDOw30lW/2rMrJ34QQ3oa7i+K
 ROdLRT8OOkahsP2IhEbNHJp7P+sdZYUjfY2WFuUHyYG7nQh8IK5QaB2XCQ8Bj4aQl4UF1M9YzZe
 RbE7pvDmar+9ZpEoI6pIqMC5H0lR4Q==
X-Proofpoint-ORIG-GUID: dCl_I5G0S3B-AHzKrauQBwWgw_XdQIkO
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=692828c2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-jDCNdFNlL6vUUFU2n8A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: dCl_I5G0S3B-AHzKrauQBwWgw_XdQIkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270077

On Qualcomm automotive SoC sa8255p, platform resources like clocks,
interconnect, resets, regulators and GDSC are configured remotely by
firmware.

PM OPP is used to abstract these resources in firmware and SCMI perf
protocol is used to request resource operations by using runtime PM
framework APIs such as pm_runtime_get/put_sync to signal firmware
for managing resources accordingly for respective perf levels.

"qcom,snps-dwc3-fw-managed" compatible helps determine if
the device's resources are managed by firmware.
Additionally, it makes the power-domains property mandatory
and excludes the clocks property for the controller.

Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 173 +++++++++++++--------
 1 file changed, 111 insertions(+), 62 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8cee7c5582f2..d2d1b42fbb07 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -12,68 +12,65 @@ maintainers:
 description:
   Describes the Qualcomm USB block, based on Synopsys DWC3.
 
-select:
-  properties:
-    compatible:
-      contains:
-        const: qcom,snps-dwc3
-  required:
-    - compatible
-
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,glymur-dwc3
-          - qcom,glymur-dwc3-mp
-          - qcom,ipq4019-dwc3
-          - qcom,ipq5018-dwc3
-          - qcom,ipq5332-dwc3
-          - qcom,ipq5424-dwc3
-          - qcom,ipq6018-dwc3
-          - qcom,ipq8064-dwc3
-          - qcom,ipq8074-dwc3
-          - qcom,ipq9574-dwc3
-          - qcom,kaanapali-dwc3
-          - qcom,milos-dwc3
-          - qcom,msm8953-dwc3
-          - qcom,msm8994-dwc3
-          - qcom,msm8996-dwc3
-          - qcom,msm8998-dwc3
-          - qcom,qcm2290-dwc3
-          - qcom,qcs404-dwc3
-          - qcom,qcs615-dwc3
-          - qcom,qcs8300-dwc3
-          - qcom,qdu1000-dwc3
-          - qcom,sa8775p-dwc3
-          - qcom,sar2130p-dwc3
-          - qcom,sc7180-dwc3
-          - qcom,sc7280-dwc3
-          - qcom,sc8180x-dwc3
-          - qcom,sc8180x-dwc3-mp
-          - qcom,sc8280xp-dwc3
-          - qcom,sc8280xp-dwc3-mp
-          - qcom,sdm660-dwc3
-          - qcom,sdm670-dwc3
-          - qcom,sdm845-dwc3
-          - qcom,sdx55-dwc3
-          - qcom,sdx65-dwc3
-          - qcom,sdx75-dwc3
-          - qcom,sm4250-dwc3
-          - qcom,sm6115-dwc3
-          - qcom,sm6125-dwc3
-          - qcom,sm6350-dwc3
-          - qcom,sm6375-dwc3
-          - qcom,sm8150-dwc3
-          - qcom,sm8250-dwc3
-          - qcom,sm8350-dwc3
-          - qcom,sm8450-dwc3
-          - qcom,sm8550-dwc3
-          - qcom,sm8650-dwc3
-          - qcom,sm8750-dwc3
-          - qcom,x1e80100-dwc3
-          - qcom,x1e80100-dwc3-mp
-      - const: qcom,snps-dwc3
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-dwc3
+              - qcom,glymur-dwc3-mp
+              - qcom,ipq4019-dwc3
+              - qcom,ipq5018-dwc3
+              - qcom,ipq5332-dwc3
+              - qcom,ipq5424-dwc3
+              - qcom,ipq6018-dwc3
+              - qcom,ipq8064-dwc3
+              - qcom,ipq8074-dwc3
+              - qcom,ipq9574-dwc3
+              - qcom,kaanapali-dwc3
+              - qcom,milos-dwc3
+              - qcom,msm8953-dwc3
+              - qcom,msm8994-dwc3
+              - qcom,msm8996-dwc3
+              - qcom,msm8998-dwc3
+              - qcom,qcm2290-dwc3
+              - qcom,qcs404-dwc3
+              - qcom,qcs615-dwc3
+              - qcom,qcs8300-dwc3
+              - qcom,qdu1000-dwc3
+              - qcom,sa8775p-dwc3
+              - qcom,sar2130p-dwc3
+              - qcom,sc7180-dwc3
+              - qcom,sc7280-dwc3
+              - qcom,sc8180x-dwc3
+              - qcom,sc8180x-dwc3-mp
+              - qcom,sc8280xp-dwc3
+              - qcom,sc8280xp-dwc3-mp
+              - qcom,sdm660-dwc3
+              - qcom,sdm670-dwc3
+              - qcom,sdm845-dwc3
+              - qcom,sdx55-dwc3
+              - qcom,sdx65-dwc3
+              - qcom,sdx75-dwc3
+              - qcom,sm4250-dwc3
+              - qcom,sm6115-dwc3
+              - qcom,sm6125-dwc3
+              - qcom,sm6350-dwc3
+              - qcom,sm6375-dwc3
+              - qcom,sm8150-dwc3
+              - qcom,sm8250-dwc3
+              - qcom,sm8350-dwc3
+              - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
+              - qcom,x1e80100-dwc3
+              - qcom,x1e80100-dwc3-mp
+          - const: qcom,snps-dwc3
+      - items:
+          - enum:
+              - qcom,sa8255p-dwc3
+          - const: qcom,snps-dwc3-fw-managed
 
   reg:
     maxItems: 1
@@ -158,13 +155,31 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
   - interrupts
   - interrupt-names
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,snps-dwc3
+    then:
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,snps-dwc3-fw-managed
+    then:
+      required:
+        - power-domains
+
   - if:
       properties:
         compatible:
@@ -513,6 +528,7 @@ allOf:
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3
+              - qcom,sa8255p-dwc3
               - qcom,sa8775p-dwc3
               - qcom,sc7180-dwc3
               - qcom,sc7280-dwc3
@@ -657,4 +673,37 @@ examples:
             phy-names = "usb2-phy", "usb3-phy";
         };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@a600000 {
+            compatible = "qcom,sa8255p-dwc3", "qcom,snps-dwc3-fw-managed";
+            reg = <0x0 0x0a800000 0x0 0x10000>;
+
+            interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+                                  <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                                  <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                                  <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+                                  <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
+                                  <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "dwc_usb3",
+                              "pwr_event",
+                              "hs_phy_irq",
+                              "dp_hs_phy_irq",
+                              "dm_hs_phy_irq",
+                              "ss_phy_irq";
+
+            power-domains = <&scmi1_dvfs 0>;
+
+            iommus = <&apps_smmu 0x0a0 0x0>;
+            snps,dis_u2_susphy_quirk;
+            snps,dis_enblslpm_quirk;
+            phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+            phy-names = "usb2-phy", "usb3-phy";
+        };
+    };
 ...

-- 
2.34.1


