Return-Path: <linux-usb+bounces-29477-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7744DBF49F2
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 07:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24A7A18C420C
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 05:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FC6230BF8;
	Tue, 21 Oct 2025 05:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkHpgUzp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB6821255A
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 05:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761023404; cv=none; b=XF4c/NOVHWZ3LScDm+PqZpOXc3AsG69NMT4vwmMZaSGI84dDMLeX/XMw9xfnvL8SroBCvorWttfadVBj2x9nGD8aFqhr56S7tzKcbiNhgTYpeoCSBRrPWQOAmQBn/1Smw6wtbwUk6u/W0GJU/zS4ew9eXQt1WEPRKRSHmRovCyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761023404; c=relaxed/simple;
	bh=A7QpE6xP5yHDlIHikgtSjNHApEj+WDTeaVVSj39KUdc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IvBXcHz6kXrtTohanXUMKT0x0qgjI6ctkhe9F+XTc0arMj0agXj0ii+B7W4u9gQABRgANP60ThzM4HMB2D1z83ff529VU+fB7T4xF95wBan6bcP8iKf7kNqfSjVV0xzhBl/qLI66FHA3OaFAT5Vqljuv2ihEwdR/hRjwbZLTEiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkHpgUzp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL1Ad5030515
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 05:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=b/L/VzuulQNRZ8WRFUv8t0gHqQIOYCjkqlW
	LRFniZJ0=; b=RkHpgUzpWt3xagzTEgUgCtM8ecro2w2HGTBhzQTu3mrnIcBduVZ
	9wg/jBsjjf9Kj+1/kIcmUlzKpUVomgKxoDV0sJ/pT4FtcUXrmKv+zfjJl/1BULSj
	1/gYRZTijQ0D2gB/hnANOEn5nJzlqXmQaR/DZ6NtOFetQFMxJ5DhDiEP4Vv95yVr
	ZReUBtcNV6wRK9i3P/VjTw2H/j00QVmsTVWXtY0b25VRBkMxK4taob6vFY6uHzl0
	pUO7/bxquAoFyKPB6ybUFGFmKCyIJb2GrP84nUz78tjvD0MMaTdcmu/6cXMpMMHY
	e/0RtVL98TTiK2X05zjRCOBoNNOMNj0qw1g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wswnsj3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 05:10:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6a33319cb6so3817335a12.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 22:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761023402; x=1761628202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/L/VzuulQNRZ8WRFUv8t0gHqQIOYCjkqlWLRFniZJ0=;
        b=CjYKWILVYeKqSKlMiZzIg7xdg4yVm/zmBw4GKi8nWP8lV3RQnHsIOCqBQBkaxBkn6a
         8/PKO1/B/ydw76CwRHk3aFSmbUryJRERHFPNjf2HLO4J20n8FO01cvDJXaXC/w9v4x23
         PsN0LmpYQRxG5VF0fSmENA2HUKEnrVhlcE9Zn0iq5Tq7hnCxTFJKQyy+xspFUb+HRpHM
         OzMTE2dlOvDAJvW3AOrznyrKMFa74P49aBizxhFXz+TjPHe+YvTZHZsHVJZBQUP+tGTx
         lzochOazUIZg3zKrL6qQVEsrbQmViw6cQyt5KMjfoHMJfs/yIL1CmfzyrFGE3cvqw77j
         kFkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHQrelEH7UDFZsSX85+kinIQA8jhaFAm/X4ePQywNkWEwTm+Rqtsdxu7rBmjqhNTKD33SRhMFFXQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdOgu3RriGZJQyeNQvIgeDkE/3yGgqATNQvfaRyQtW+OCafGFU
	MUwvNLaeoUSVfO9OxQVhPqt2FisW1Z3XLtSQ0DKlep0wngstXvRwV2jDbH/8hVp3uslOb7Ghg3N
	pdeK/5xKfIeRxD7fqOKj82qt277utwNktYH12VUOKd8L2NA8aes/uDhQqUcPAs1E=
X-Gm-Gg: ASbGncuLQuTcXKGKBhW208eei6wCbnbeI5JBdvzI0rngeHJ4NTGb9GvjyiMD56lfKis
	QUo1NYjRoEyfkGA2SVv2vlTAI0L1NuksPmSyO35IdLKK74t2tY+Ut65e9HNMBAGnoxXp0jO0EsO
	p4HXICJzsdUzICBkIHFYxW56tX+x/IKRSn9FP9FDBdQZXrAA7FuJz3xqwvgEuCuEe79t9p+KAyE
	uTcdt+5x812trHno+e2Q3tvPaJ1HW07iqsamOXFXpEfsAMH0V9h4S7Pl+jKTwhTPulO4bOUWkLE
	0hUlIi6dv70K5JansBknRlFvVYKzcb1RnCxoxrcU2fVTRD4uI+yuGel2nBQQsDuVmP0Ikqos0hH
	XxcBCadY/ktZYS7z8bU766ODhHhYisQGlDnEm
X-Received: by 2002:a05:6a20:6a1e:b0:306:51fd:553e with SMTP id adf61e73a8af0-334a8539817mr20650391637.18.1761023401777;
        Mon, 20 Oct 2025 22:10:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRCOJtiQq21NoWumJOlPtutB2y4nxCBZ+svbSXhOYleR86k4V0TgjtU0aoFbwS7vwbpkMgqg==
X-Received: by 2002:a05:6a20:6a1e:b0:306:51fd:553e with SMTP id adf61e73a8af0-334a8539817mr20650359637.18.1761023401288;
        Mon, 20 Oct 2025 22:10:01 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f159csm10081629b3a.46.2025.10.20.22.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 22:10:00 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v8] dt-bindings: usb: qcom,snps-dwc3: Add the SM8750 compatible
Date: Tue, 21 Oct 2025 10:39:54 +0530
Message-Id: <20251021050954.3462613-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HxV7DK1eAp26EFnQELDKQKdJdpx3q4nJ
X-Authority-Analysis: v=2.4 cv=Maxhep/f c=1 sm=1 tr=0 ts=68f715aa cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=F9r5tr8hi6wSvKSliRAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: HxV7DK1eAp26EFnQELDKQKdJdpx3q4nJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfXzsnGH6WkC2EE
 tSXxCP7brGmpSPOHJZU7HCcFjAQTC3jubzsAL2VuTq8mqVmn2EPFngP7Ujo8Y7WVfb8SbxbFp+v
 f5fgdxV8XbtZ8sNwAzhJMmI+uXofHTTrrckyEhj6RFQ+gqTnBy4eRWmSzbXAiDuSfqEwHlXgLGG
 lUiz+Tx8Rn38bxLtdarUBjLWaSW+AQgrLIgE8KD7jP9GKzt0HODfs6/q9y+/wM1lxO2UFxAZVyg
 r3LDC2tU9N9Sa2/teVuIS0AsUy0DGSJnaqCRBYfGu2Q0tSKg7YidrmurAY0t+s9Oh3JKXgnqESI
 qsT9UFzBWAze5IIT2JFQ1+/3TReQXRV3pfg6WAqhbuGqk4yGH90N+FScVhngVs2+FfJOCv9MFEM
 YTYdbrZtMHtFeSVBr+ibfoSBMJc06g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add qcom,sm8750-dwc3 compatible to flattened implementation binding.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v8:
-> Shifted to using flattened implementation.
-> Since the flattened implementation code was provided by Konrad on the
v7 dt patches [1], moved authorship to him.
-> Separating out usb binding patch from DT/Defconfig patches.
-> v7 was actually correcting XO clock. But this patch is adding the
target compatible to new bindings. Although v8 is strictly not a follow
up of v7 and has different content, marking this patch as v8 to retain
context.

[1]: https://lore.kernel.org/all/5a0a0255-3c29-4e31-ab15-d286dea1ccb4@oss.qualcomm.com/

Link to v7:
https://lore.kernel.org/all/20251015105207.2819689-1-krishna.kurapati@oss.qualcomm.com/

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index d49a58d5478f..301e873684ae 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -67,6 +67,7 @@ properties:
           - qcom,sm8450-dwc3
           - qcom,sm8550-dwc3
           - qcom,sm8650-dwc3
+          - qcom,sm8750-dwc3
           - qcom,x1e80100-dwc3
           - qcom,x1e80100-dwc3-mp
       - const: qcom,snps-dwc3
@@ -213,6 +214,7 @@ allOf:
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
               - qcom,sm6350-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -501,6 +503,7 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         interrupts:
-- 
2.34.1


