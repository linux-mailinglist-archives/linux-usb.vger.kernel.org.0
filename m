Return-Path: <linux-usb+bounces-32351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC1D214D2
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 22:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D47D5305D99B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 21:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08952361DB8;
	Wed, 14 Jan 2026 21:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPfO69Dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nqa+QD3K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4459830ACFF
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425486; cv=none; b=ci8sGF6sCp9GimpQHh2i9CfVhJ+qbC+eUtOS8NJ+az+1xRnxjUq3vmr3NAtacjkBVbHUWBYJIxTfSOV9yTtslj6xKS2BkBxeap86WU+D3QRQD+S7gUCgORztTKwrwczEpPJPdTPCo/ekdPhavJnSizHIkcu86CvfWjF5774UZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425486; c=relaxed/simple;
	bh=mfWDFTtI7sOSzZDA/cYKPw2CbD6I6AAINmqyN12imAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iYVy11WFEusM1RDjOxbgo/pLoGzbuqgk6VyhcSVRiUX6JFAgjS6BOSFXwffrKNRxUZw1Qw0C+xdc56+dL+C3g/yRjd6rsIrv5d1VRU+7Dx0fU+JzCpLxy4i/gGd5J/HccDIhdhQWfG1Q1SOl944MTCMqC6Gfa34YXshooVVxUxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPfO69Dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nqa+QD3K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EKpr0G494844
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DI6DC3zMUoG
	5LSvyEo1omeMMHH9suCgrXGLM485X7gU=; b=TPfO69DqhWTcqTOK1KxBJD+egA+
	35/rOpjLdhNu4WQGzdGmxdzam8n0qElOzv3rO7b2+HeaviGT+h8xVK0jjwsumBp1
	FDkTIeiO+t+D75JOZyvIih8wtNqT6/wcmCf1pabLFsv62aNZ3Rq9elwI3WE7OeWx
	dksGvRsKnNaElCbDumPwCsDPUiR+gclbLQFgV1uEpDCBZt6sLjuqmBfHSUs17+/W
	CQeKXFslrhSqXUf8pNwecwIlWB55mEbRx9BReWyKTjACe8oc+9q3/1W8kmtIZ4Oc
	RbTt35W9RDPL+ohwEXj019ga+m+PVRFN0nQqO/KM3TBf/4900OYkF9sIJpQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9g2bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:18:04 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-123308e5e6aso308951c88.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 13:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768425484; x=1769030284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI6DC3zMUoG5LSvyEo1omeMMHH9suCgrXGLM485X7gU=;
        b=Nqa+QD3KOziy3fs+zWq8W7308+xBjmZehgQKxTeFDZscvkkdhYt5Q4WQ6JKVHeHmhI
         TqGwAVSCGZENsTFhDwY8YQU+epoUHOpJSQrqDW2jRjIqltjRc8xx+OCHo1aIGb4LSrmH
         p4Lg0EvV+uD/DeXS2gDMYnAa2IXrjlmMoMCwZ4qqpBk4QKv/KvfC+mrdQaoA8s3WrDWT
         XMUBZkpS2m0EgGt8dx7Utm5ExaqH71806PS1ggzizo4/5x/mlzuBrQDR0QhfbQ4pdhf7
         rMDh/iHB8JvepvbsMz6ecmeYXsQT7tDlCWCXznhl6n1kFDAvPxUPFKXSpbnjEwy7q/4z
         jjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768425484; x=1769030284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DI6DC3zMUoG5LSvyEo1omeMMHH9suCgrXGLM485X7gU=;
        b=uzrWu1c6mNKReibQDSlxWTwO+3m1sa9uuyq8rJ+eAJuuCPJIBXw60WNq977b4P+RM3
         buTfrvatyjnVxtUK6cyIuus6VekwEsxEeyRE3PAXSWXcH5DWj71Vbmi5Tk6EPhrKtVva
         MzBGz/azECWDg8WWK/z7Lzy6+L1dS1Xd4948jpVYo41yIkp8MLj/tFTch4hNLQoCBFBt
         l5LtVhTEGrGyP8gjqHOb95qRamAtD9f/foeokL8KkPjX0QLAlruGxdJkyNDGPV4G/ca1
         r8NGda7MHCvTUx+Od0Dln9PtA+1gOIWqNIAH7hphFqsB8AeAbV1O8I8mRlJA50AgTPY3
         Gcog==
X-Forwarded-Encrypted: i=1; AJvYcCWygyVI1TS/jGdU4wJkP7tYZ9Jpr0vJnx8EBN+UUucdnWa+Uhg24ROH7PNr6gwA/Ln9hU2f6vdehZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRhvxHleVkVLXmyhG60m1yzyoH8LaqM1LKWnwWqQLYyuVeNrhM
	Kd7xOqBiLMG1BGL3Yp0anpdp8JgwoktaOl55qim1g3Wit3SfSHeU6seiUOHCWudy8BuPoy3JhU1
	Y3S42kGB8hPneURzUUvUmM5oGneYuy++JcTY42l/1M8HovGPIX7DiGMEOdxgs4i8=
X-Gm-Gg: AY/fxX7Fs8ud+37nCJfGxyVt+ztAUfQQHhfS3C1bhB+xyl4w2i5fe6WddjBgJ28dMAx
	s89P2bQS2zzAuWzFebzaa6XChNI3ggoBO1Q4ETXsnFiJUAuEusj/LmAwUAC/t1V3GWhLzGl05/B
	Y8R6kchlBn2MtzX8ndVqNv1HICk5LeOHJXeYtoxVVAGjwfu0mIaL6VJT1zooCkWc59xKpyAOkx9
	Rl8Q51HiPpzy5fI6cHlxmqfgU1Ia/enVajzAfcFKRtaSS3rP7waM9KZdMJmR91Wxwuz+k5VHBym
	BCm4aMpLHA/ohrXfbsL/pL/0z+3Vh+urFRR+PR686KJbZ1PM7vytWwXOysKViO+wHnp8FiE4wkV
	cPdAXNK9Eun3LCZMHoYd9YUhwLzG8vAOOHYRLlzDU/+/yNzbCpMSacwo8L5IGx2ehj5rmiHkl
X-Received: by 2002:a05:7022:3b0d:b0:123:2d38:928d with SMTP id a92af1059eb24-12336a7c179mr4753104c88.36.1768425483787;
        Wed, 14 Jan 2026 13:18:03 -0800 (PST)
X-Received: by 2002:a05:7022:3b0d:b0:123:2d38:928d with SMTP id a92af1059eb24-12336a7c179mr4753079c88.36.1768425483104;
        Wed, 14 Jan 2026 13:18:03 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm32167118c88.2.2026.01.14.13.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:18:02 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 2/4] dt-bindings: soc: qcom: qcom,pmic-glink: Add Kaanapali and Glymur compatibles
Date: Wed, 14 Jan 2026 13:17:57 -0800
Message-Id: <20260114211759.2740309-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wlBmB329nNkE7lZy4wI0syuD6n2F0Dlm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3NCBTYWx0ZWRfXz3qjbDTr8gqS
 Z8GsF+9oNhIuCXnviBKUwJY33o8M1O/1EtvQXv6ybx3xODdBnNxdMy2rPw7cI0jY0xk37+Wut4x
 DGnTzviP6LF/d98hdBImh1Pf7SowW8+f3Bdd7ZQkycWoBRqOGG5Tl41CkehEl8MLchx6qjxNMWX
 gq9ADs2MUNAiwHGrAj1ZpukpHebCZf3G2uALtpOyiVqkT70sAl1amzYAWAEFh81GSxgszQOG2yB
 ARczF9F0pA9NYd+hTPSeQ9VhkY16MlkRuqAU7qHPMBDDTjJ/Hiy0JmEf88co7iZMbGGOBBiP8/7
 wow9DYnGS+M0B2X4+2ZyBtf1Vq9U5zULUF7lHyM0zjE6SgzOG96VGbv7J1fNKdI87r9TVNVQpIO
 vK4DeMe+I9s+EPSBeeEJLiV9L6SkCo0DgVcrKWHFWhzXmNp//idy0aWmGcXY7nHePNRJCLnancr
 5GN3PB5SKm/5Tj6cY6w==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=6968080c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3V0dzxXrMXP2z2Vy7boA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: wlBmB329nNkE7lZy4wI0syuD6n2F0Dlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1011 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140174

Document the Kaanpali compatible string to have fallback on SM8550.
Document the Glymur compatible string to have fallback on X1E80100.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 012c5661115d..13503ae79a8d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -38,12 +38,18 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,kaanapali-pmic-glink
               - qcom,milos-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink
               - qcom,x1e80100-pmic-glink
           - const: qcom,sm8550-pmic-glink
           - const: qcom,pmic-glink
+      - items:
+          - enum:
+              - qcom,glymur-pmic-glink
+          - const: qcom,x1e80100-pmic-glink
+          - const: qcom,pmic-glink
 
   '#address-cells':
     const: 1
-- 
2.34.1


