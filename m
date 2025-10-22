Return-Path: <linux-usb+bounces-29509-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E3FBFA55F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 08:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 03F7950500A
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 06:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AD62F28F2;
	Wed, 22 Oct 2025 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="acozxuFW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA1C2F3624
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115839; cv=none; b=evpGo3ubt0DWNVsEUtnZrn7nCn1hdmZiT/lzm2iK1Syf+2UqQwZ1EKuerxqwHM5oRRpEn32ICeEFudEx08sI19UtWa6CV/kXWJEIIoeuLoQt7LFdwng749F6N4WTgmz3o86bCxQgSVfS0f6qEJcImy+9QC+4fmIefm6HVN6FYWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115839; c=relaxed/simple;
	bh=R2uTwpKHPZ20EpsMj68tM8tKyulxK82YeGkwd7bj4Bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqI9L89oHZTYvozg4452sY6B6B+4dJjF+osGjEksFh8EerFHZU+lOw5tRyQAhCqUL2ck34sqjjtGEKRMMkdfH4B+09qxp15QdJICaRj77Sfih/1Dk/3II8+13PLcDMhWJL15djqb3y2s+m0+VecPEwJ8WLxA9hoWjE6ygJ8yyeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=acozxuFW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LKgBTg013592
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aqqkie38Io4hu0mb64dIZJD1IDcsSkJekF9bBtAk5ic=; b=acozxuFWNNyrZicH
	stc8JyLtyz6HSKaKUMQ0+36x/4J6OrwZlVc63q5PS7sCATZgF8jc3N5F8qjl6yk1
	SiPNiuWCcSbCNrmyvxaAU8SJb0znn6R5KPX5WgxNAOrY8Jslxhw5V9zF9c4/64L7
	28Ea8XnPbY8najId7WF1G9ZgzmsLdbC5NHLh3qoGgjvWxEHtbh2WeVXmBQ3cVp2R
	v+vjTjV5c+5L81VS2L9p1EYgLBIgBEONtKGeRFnroMu1UH7oO/mGqxjJ4WQeLbyZ
	Pf2lwwLeqHfgnmn9AV9T8Cn6gEAZvW62YZtk75069AjGsTTEf6bCYhDQP4/NxNDT
	SjnStw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0hdg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:50:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so5357002a91.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 23:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115835; x=1761720635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aqqkie38Io4hu0mb64dIZJD1IDcsSkJekF9bBtAk5ic=;
        b=OX0TvAiI2lvKGDNeDN4unqN48NMgIaVgcQpGhvu5AMDUX0L0j4kZY9q3tLN/kPbQuW
         N1awBzI1axAz3NppYx2JY590rSOXPEGNwma4CnCZ8/rBwSkRlCBAyiGoe/3n1WP209UJ
         BHPO29/FTyTR17AUKSPnMkqD8PICVK49XBRmUjfk03yXJTmB/PvXGWHFDnbKBSlKdDF6
         JPYl1yb5M6D2P4gq21/dq5kw6ct5FVyOpY0kYt/jmgACWehCzyDzABCroqHJGIIs3J10
         LjVBSbaCw1yot1Crxte7A0gVEN0cNeq3E063q7p2CLyA6GTf3PIBSpI7GmHgJ7o5SWMR
         rEpw==
X-Forwarded-Encrypted: i=1; AJvYcCW80EoTXOes7/eoc+0UIAl3wHN68L5SHW6tBU3DV4PLSslYVGJzZ9mOt3Wp+xb2ndhOGSgZkJ2vNqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoY71Vo588CIJSXMSU0AQ5EmDJMGEyRn1evut4lKcPOI0oq/92
	jtnXnHPJbn4V18HGeNqMB0eThK8nKG3QTwXMVN4gjQLWUKzMjwuHeB++uUAnSylflZj4r+IWZCi
	288scR7CnvSisvSGfotkycnGi5xGckucYuXswDGF5sIejyQLdxgj5P8KSB3sFk7vg2SY37FHT+w
	==
X-Gm-Gg: ASbGncviI+ejfPqUczLBXJmE8920Xfs1F5WsAVIVosG/oA+DiAoavlUDDgG6oRy4bOC
	JBFEK4Iy3kjBckHOd2A74qb18eBzZNuLaQ8sOvQxYvRy7H4h99Vrkp5BNWlvKKh8wwLJDdIklsg
	RMONXOEjk5+bA82KbqdfzbO4v/qzgzhUJ0vLE7EwX3MBZ/eu2vX7XlP03U6i202TX4unPqz/5k2
	pioFM7B9993R4fy6wAZfpJT83YDoaelZjNmuQKy0Z7sgrArRHb+oYvHT+RL2kQUTqan6GsSTM6r
	xeHOBc4rIWRYDTt+ocJf4irjxkz+jZHuw5xxgfZ68FrrT2olV5xvSKdptIQO8jCjsAK597Nk/pe
	0lkVxo2EQBGC2ge507nzAp0pXg6Ry+Obd+zCXXJnKzjyIBYfOWQ==
X-Received: by 2002:a17:90b:28c5:b0:32b:6cf2:a2cf with SMTP id 98e67ed59e1d1-33bcf8934ffmr22879435a91.14.1761115834826;
        Tue, 21 Oct 2025 23:50:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1MCPo5x+mW04/fDDzB+zbN3zM7FjsI1S5Bd83h/Ux6zbFYXkZe+R+NWCCsh/3pGGknR+VEA==
X-Received: by 2002:a17:90b:28c5:b0:32b:6cf2:a2cf with SMTP id 98e67ed59e1d1-33bcf8934ffmr22879401a91.14.1761115834395;
        Tue, 21 Oct 2025 23:50:34 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223e334fsm1560285a91.8.2025.10.21.23.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:50:34 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 23:50:29 -0700
Subject: [PATCH v2 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-knp-usb-v2-3-a2809fffcfab@oss.qualcomm.com>
References: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
In-Reply-To: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761115829; l=1499;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=UA20oYIe2aKRt+hHDRY08ujyC1lJkXJo8K94H9otar0=;
 b=3AVv0Hfux1vndXJGtkEvrd/sB7HaosEIWlJIlOD3TbcH42qfehFrdp6qrGC0K1hG9Ctaz8zaO
 Q70neP76ZRYCGuBw0YFNtxN4BJd4ySveUfc6Iiw+esY64N3KZlI9G6N
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXy0RMhAXHqJiM
 soWZ/gaffTjf+C8irff6XgWT86bAcEIH/n1gOUFUv4pOcYKLQXkcvbYET+jH8osdDRMbi6AM36E
 r1LxthuJ8OicOEu0wjTixa78/5GeKKTtUAvCWhwMwWuiPGPZNgBh99AGUaESaDulzBvJ4NToGa9
 WfeOcFPsv1eaAiGxqGhsS3VaeBFpoX6i3BEfzMugi0ymj/4VvQqcGk/2JUn5SLhbTqrrCJmvB8w
 voXZZsBg1jtDEx9VxiYbjc57iW1eFNB1kmkLSCTJ/uTVgKs0if0LBt9fPmNHtvqWj/bYPljIgRF
 36p3++Jv3KlyEaLYOnhAEAiZJqktDgNmJ2XE3hwaXVobGKhGLVNQNH63g8KwxFq/g+q6Vtqpocz
 s4a5VRvvSJsBbOvsjpVxOXTXf3j3pA==
X-Proofpoint-ORIG-GUID: W8NWdHXRmYFBjSBlxRLWMyduE-rfrBsk
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f87ebc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=cFzXH3D4Jfz4SSrHOhAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: W8NWdHXRmYFBjSBlxRLWMyduE-rfrBsk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

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
index d49a58d5478f..8d1ef81b3962 100644
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
@@ -200,6 +201,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq9574-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
@@ -479,6 +481,7 @@ allOf:
             enum:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8994-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3

-- 
2.25.1


