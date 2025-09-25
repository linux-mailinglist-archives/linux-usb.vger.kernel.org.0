Return-Path: <linux-usb+bounces-28654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B80B9D2A9
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7F47188AFCD
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9792E8884;
	Thu, 25 Sep 2025 02:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GLEuSDg2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76712E7F22
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767342; cv=none; b=iPBS8JUX/ZfIZ1Cd+m8gBAIJjGgkDKQLpbPG93T2qnZyC7nehCo0XMw+SqTQlfir8gw/iXEoKEi2RIVO4nmhxcoU2F74XrCmC+twUF6mMZcKrX0rAQF154qWwDReU0PPVKDhTcZzms7KsLZ0nZZ50RCSkhRoU70sF0atK7u94aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767342; c=relaxed/simple;
	bh=cfM3s21T8CQ3sOfi9Dc1sx2mJ27UuKxMJmEc0kjDpws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JSPJ+/gz2uoB0NZLuJ4wcnV1kpjRwxrICA4TxUuBc+QrIrvdEG4sANRMPECHhqMVltlJVKIyIq1VzkKZeuFQzX0s6v3Dmm3GXXtXI1WO6J6oWCbrozg8xQhXvByjo4BWMG0Pcao06Xs5W3Wl9Da08TtO6I5MYzFwQL1y0lC4kIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GLEuSDg2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1EbVh021502
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaQd3cF9DM3
	ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=; b=GLEuSDg2D2l2imPwwOKxcHG5RCf
	3pvFxukmFNL9hd7KvDTHqNF5rvMqKSneewhFuCGoEvdofpScpn0xgwi1HPt35xdM
	/Lvro7fTaE1qGDcUn7Yd95xSjuUIbr2k5ZLLEKm7RPgW7+eQPPqN/dr2AHQ8Bcet
	C8FuvmI8Q55mqm5WH5BPflPw4y7YBjcPLpN8R3cY2bh7XfcSm9Jy7QnKvIJb5NJ0
	hB9S357t1Etab66DQWHl50BrYvfyTZ5iVRuCDdT9trV2psxZldWnGmAXctWe7nQn
	WLXNDeto6/SFWUsFm6x1wHIuJx5wns5z5bAfNgtokAtu5ceFQzF5ExeDyFA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budae0ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:28:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b55283ff3fcso340797a12.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 19:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767339; x=1759372139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaQd3cF9DM3ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=;
        b=MiA/+uofCStDZ5HSVCt+rJXFyVXhV82SpXjdMbB1FalNTmMZLfelpg9nXU5y1zjEjL
         +4ILrRniVDgWYhkz88wjnsm4idP7RT5nJ9GBN1/NAFA62uaPInjpV9VZi+3cnvuHXPG1
         jrm6cxHx8pRdBsze67Ezpk7LThV3a1fkXZeXKbQhZZHZQBVy0ovTt0wSteI+nMc3SiZp
         TJKBrrWPqYYpQcmQJftkXgy0RuoU80vCGTgYjAV6hfxpHkqxGOZXP3oHIdVGQ1Of6t5u
         wip8uToX95ZXgXJG9zkrH4DAp0lL6TcCfjkC0LvOfRNZZhCxkoFWHmLjYYQdLOgprTqe
         zo4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3yi0zKL6kBJTtCbd+kb/Bdu8+CQyWG6x8ErUO0FnGupcCrIMrbJjsCQZrV4sAvhAZzEPytcV1mew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx06KGp9+8VIU+nfqsXlL29Ej9+fbsPe4hG02Yif5LYC8+QeP5Q
	5XjiaYvTmvsgg/b+RaHyFwcF+Ih/bClvlMqOySKIkLN0MTh5E4Q0lE1/Lup7wepCpFpOU1TtvF0
	PywaOcx5dlzBaMCTY6cOTqpUaFbMvBtGdjYJXe/1ejTEnNMleGN6WRf6cJ+oMR5E=
X-Gm-Gg: ASbGncun99xFAFrYpo7BZ2356tmJ3YIB8X7JCMgaNwsv34PQo8+mP2mJJzzLBLHzQzr
	/I9UpY9dUvkXxoyQC1CHt0RKNpnNow+ApPQQA/teZln9pmvPfkXsDvm7KsE+oYIOtyqkuxq3UW3
	q5or+1fK9/lq5Qhy0UBoeZepEXF1pbLHRGoGx6rndzKd3RloMc/gBluRZCsoWpzDYKKOCIAquza
	i3/YJSigT0mbeDMyARUP3TSFw0jtrR7kmkiPGN1iyvAqQAe7H5Nftl+uR7o9KxeLpbKGoM2JHz9
	H0XtFUjpbdG/j/pC0ISvm+vmPStBapT5LGais3DI9gn5aRZiePamz8oAbJfhITPlwib/Xd96CuQ
	mMiP5uMas1UeKXLxq
X-Received: by 2002:a17:903:4b27:b0:269:603f:420a with SMTP id d9443c01a7336-27ed49b3138mr20415715ad.5.1758767338551;
        Wed, 24 Sep 2025 19:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbOCf6eNz+virCFfRlfopKZjO6IPzC0hVd3s5Sj34qU3xiaSgJy3D0qcDZ+fhYb/Vg25O31Q==
X-Received: by 2002:a17:903:4b27:b0:269:603f:420a with SMTP id d9443c01a7336-27ed49b3138mr20415285ad.5.1758767338063;
        Wed, 24 Sep 2025 19:28:58 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:28:57 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 03/10] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
Date: Wed, 24 Sep 2025 19:28:43 -0700
Message-Id: <20250925022850.4133013-4-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _GkqT7xYC3gNnZl9GCVAXpzcNwF_I3Qb
X-Proofpoint-ORIG-GUID: _GkqT7xYC3gNnZl9GCVAXpzcNwF_I3Qb
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4a8eb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dJG6SERxbJy7wEyxA2sA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXz+fn3ZVOPTpx
 +h8hBhZ7clkEaKJ6YmEhCC3lrDx4sQF/GoVrfLuCyhxcZuKvqaPiCGMqCA+nHv3DQBNTDngWhtO
 EGhzQlBdtWANaE0vLMgAZ1poAbgnWR4PEDDdYu8xA8Cb3U+JSWeMZSLX4iyukFBd8f4JL+jjC+h
 XlCVuwiS0TRtT36eEQyt9MU2tQxq0Nw+S6a3ITkYnsPZH9WUPCbpjh6CrmHOvgPkNywHXmqaIRz
 P84IWN9QycdE/19iIulcMiQQIahBDFUMdsV33tPyME+Bqom2iu9RphXgLgMp0OfzeCyfr8mfWAR
 4WBXa5jP2FVL/qgPtfF0GraN8XFTBxThB5pRnhRPMVC83pbp9JzU5OlM4rx5ewYl7So3pLy7oXx
 fmDdgY4p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

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

