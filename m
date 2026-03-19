Return-Path: <linux-usb+bounces-35121-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIdJAebGu2n1oAIAu9opvQ
	(envelope-from <linux-usb+bounces-35121-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 10:50:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F262C908C
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 10:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2135307E977
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3593B5307;
	Thu, 19 Mar 2026 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQ1xrd8d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUeiJU88"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C7937E2E6
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912236; cv=none; b=In88nYZLsMrxQuuDUS0lsAb95KsjPzclrAMet8KWruj68OnSnSPuZbC24n5VdWPw4gVzDWJRKuULXyFRBWpxFmGau1Iy56GxQXpZQmtePkfbA8qZmgrHT70uPQGf0IxS23TirpK0hVX6KX1ky+CsU9rn5mOqRfaVOa2xj7/3HwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912236; c=relaxed/simple;
	bh=J2U48Qz0EdjobPQXNWWjAmcCWfCQTGM0xRFisL//p30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jseyn9dbjWWtGeSK5zsG5MqGSfaOsSSTxZqhsWiY/5FDeHnQYWobzeOgNrPJqpH4aBadpBjLylQxbjuJXqJf0pceq6ImALrP4pAS69DVmYYHWOq39Qwx70f5k7q+KNBfLM49ThPvdWXm5fcXgDCRubOvMqfVaIpVtfxa5oufpC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQ1xrd8d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUeiJU88; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J7483E2667016
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 09:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LgOOeXv0VRoDq7AVXq3+On8joibWPy8NRTz
	PbB+Kr7U=; b=dQ1xrd8dwUkD0jDrJ51zoFlCmOXKxapFzNrSdrsvgA8d0uKsXsP
	cxgWzrq84oE44I7h0tWxQn+s6VqQQ63oGhLN0pOENusKE9wP1snRqeyo9TQFyIVd
	ihO84tcgv64+oFA3ZgHXOyEIEQfaWJ66A7Oo3I/s5+lDNFf00a9aKVTY129SYoCJ
	2Ak5pSxRQer4hv798mZjdwVC6MtnXkx4xqB1k77tQUAiIG5dlMZF0Aw85UDh+XVR
	+ipWuA2+Tui9FuKJZZZRal670sPBZj+pkQq7LBUaQhj0QZyeXy1yqxV0fTjhtKcJ
	CDMO0EQYsnvvxqzOcc7Ba72b9slmD3bkyAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj544qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 09:23:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090bc4823cso50309441cf.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 02:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773912233; x=1774517033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LgOOeXv0VRoDq7AVXq3+On8joibWPy8NRTzPbB+Kr7U=;
        b=DUeiJU88vrjJF9rMoD/G5+CtR+DSH9br7ekEu8nX0qrg3tRJK//5afm86cq5j2djnT
         /gNtALzACeJTfeG1l6HrBmAWSD9mCsRS3I/g2c+MhWn8kv3UqYKPQb++5h3NJTydOX9N
         AMRotBhrKqrwgrcE4aFwTVEG4yONMrF+Z+ZrhIWR2Zmf+7g5PjUx1qib4uXwC0M1grYa
         kTVUAT3SfgFL7wG3JcmjHNoWuF/Q/ur9Wtldavtl+nCKcXa0d2Djimg90CJ+ilyaCE8J
         ddQ7eEpaU6N17gGJDspWw0JCi3s9j2V4E1Ipe7pVwxj5PSoNI4NHm6HTLpccUgCjHGKI
         x1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912233; x=1774517033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgOOeXv0VRoDq7AVXq3+On8joibWPy8NRTzPbB+Kr7U=;
        b=lQz7vuUBw/VBSX546+qD4Kk3Zouo8ci33lRgeQUjfAwUqxqWLaB+jiRM9+rJKr+RlH
         kpCsXpGoEsp6OzSh5TakjCi+EW8rDeXu9i/Gf/hCrA+41aKgVFxlet3aQFQp4lmtR8vn
         AAm4fXJnMEXft2OgTgxjNn+70sbcc7Gr8yq2BMwmTI8GCkAAseXWk4bl1nSE0+bDOOZC
         klvXdbbPQYKDw1dbWITc6UVqzF6nZ2WzEdpK4Cn1VxI0E1fGE3DJP9I40or+ohsx28LY
         JU/K838C5hLEnawoCwWcKRDn2/WnCymDatzcZBHAH1MaE//rgQGR6TporOTqvDHLnmT0
         deHg==
X-Forwarded-Encrypted: i=1; AJvYcCVtnB3CE+YZS90mzSnqhFYweqQp8r3FhCpVKSvzoUPfuyiz1+b182fbV8Hj/E5O+X/zRZAWN326drE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZVK/xAlMRcyt/wesh+2Yfmvad10D+MgoP5A7U/QqewHGih680
	G+TRnsahoBwxyDkQyWZkQtllOqX2wxYNsVQo2QstNYlb1Rxqp0cOy8XHIpBcAuc7atnbUww9/9y
	f7gfAjCwDq1qyYCCVl5k7wJSzu96/ucwfAlvHkHeEYZOBNv5KyKuMJvEoFMfk0hA=
X-Gm-Gg: ATEYQzzg7UruO22w0bvCrFNlvC8MtFbmmWouPQqEqA6vYzDkBUaw4dTp0ehFZRGkNj1
	jQSYckAiwNHgpoCJTBU4sd8t5OhiCci4xDGOfhTeVpbi7dZyiV8uZcHRGRcaApWL/bDqTjK2pR+
	iSQNzMB/WqL73vRpPulSAeJB+Z3CRWOVUx2Wt2UdlDAdtLbSxx/O+w0++NPHHTkNelDxPnXz2/9
	T/2+cUQYUFJAjTngCNazoOX8X2Hb/Cvoie7LEjI61tANDQM8ilBzcA0rhX6pzcApwy6PX5w7wBT
	GptXq+qmqR5VkiGTzfABwKq7NKR78F6kKHCb9apV4V+Og4zHicha9ArcGnvWGse+faSkMf4zLCr
	o30tiVhtwQ2BurK5I3I1/WV34wNqTvD/AnoxA
X-Received: by 2002:a05:622a:203:b0:509:1d55:635c with SMTP id d75a77b69052e-50b1485f324mr83804731cf.43.1773912232807;
        Thu, 19 Mar 2026 02:23:52 -0700 (PDT)
X-Received: by 2002:a05:622a:203:b0:509:1d55:635c with SMTP id d75a77b69052e-50b1485f324mr83804491cf.43.1773912232374;
        Thu, 19 Mar 2026 02:23:52 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184957bsm16035462f8f.5.2026.03.19.02.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:23:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Add missing clock constraints
Date: Thu, 19 Mar 2026 10:23:49 +0100
Message-ID: <20260319092348.35237-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2361; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=J2U48Qz0EdjobPQXNWWjAmcCWfCQTGM0xRFisL//p30=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpu8Ckuvx6Bdy8WDPpdQU+csJ6ihyxDO/3+BzBO
 S27/rWHzI2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabvApAAKCRDBN2bmhouD
 181aEACSnDj5bbd9nZB7yxUC+xgAlKoaKWIqioVoAsDE7gvkNy8nGl9FmlEqPEXylxt8ALYGKGE
 Tdk/A8qlIN/r9q9X0dBUJ6AudEcrKD+0FPGQv44Z39wEdGIP/EHIGioUrExKs+0EQSiPBhzY8nA
 GKnmcCRRjpkT2MhvikgXECoGhJRS8lJLaPA76F4ioRJO9lY8IqRf/I0ujRFvEkpgfBjuo9lHsUP
 qL/Qh1Va8LfwpZQfAvY/Pql82hOB+3Nv6U5i/o2GCuPryz8Sr7MSslPzL9nGRJchLMD7i458/Bd
 LAPV6iHvo8A+XvD0SJOiYxd4J6ND5iM2FEjY6yeY+P8UVRGUwGncJ6f1Ok6r3YWtyXFExHXJH39
 nhFgVuNAKeRtES5n/Q4I9nWdLYFRpnbWKZFkOV2Gwbyli+FWOsin1CBDTgPd9K/PemlAFJd2IZf
 pe+bgufFu/Mz2juhSJsr5RorWVD9NsYD/zxbniJXOTGT8HL0Foh6waXJU5lSnfseDgumV2Axk11
 6diiaSWSPp3hmtWhjnN6njmQ0cp8GruMwImXB3D61Imb51QjHkGNuWoRHGv9f+A8p7D8HxeZpy2
 eJz5oMbrEkxJH6hDysEUXWUZETmeQmvBoGdJkJtauAYRcgOlgPA12sDF75jcr+IUet/R15Ck2Ml 3XlIPg01UXotr+w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NCBTYWx0ZWRfXxHwW4ikTi6PK
 GHX87i/v7Q0iaBYk1y8NGU3SNDSE4tT3bpZiJ/8+RZO5+YveTdPMF82zLJKyJPjnCmOUvOv2RNj
 6ryWpvMzY71OqDXRa/yYZHhBdD92EVOxi82+EF63qkPSyCE77l2d7OLl/rvwQQStWxcSNk9C1IN
 r65H1+UFmE/2uZXh0t/hL0/QxF4CsmHW0GpdaMndetz1b56x7SmM/0TGEkYm1j6qgNfo16RbO/f
 8DHNkUtoaZHd/0Vcv2IHY4TZ61oa2M9AeCRN8yK3UulTgi5qbj2qLvKpAFqX9UkNefQnBOYhKnG
 BquHNwiysDVKoAO9ehKIV7Wfi3o+4YqyrCK6nxEJVhhHzieNoVg78ocjM9qSVPFMAelS2BhLAuB
 EhKM/BiFnX/z4kU2dSuPf9HVmpG4KR4UOC3mRfkDWUqMUuVd95XEIXei+XnOVxcGVTKyJ3xhGDf
 j3XxxsM1JUmbodqII3Q==
X-Proofpoint-ORIG-GUID: 6rdoQTev5CIIZ44qaQr4ZzBLq-Lve4rn
X-Proofpoint-GUID: 6rdoQTev5CIIZ44qaQr4ZzBLq-Lve4rn
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bbc0a9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nKn_0JQ5aXeIdToyfSQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190074
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35121-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.982];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05F262C908C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The top-level part defines variable number of clocks and each "if:then:"
block narrows them.  It however narrows only the maxItems leaving
minItems undefined, which then takes different values depending on
dtschema being used.

Recommended style is to avoid ambiguity in such case, thus if top-level
part has broad constraints, then each "if:then:" must specify both upper
and lower limits.

Add missing constraints, mostly minItems but also maxItems for one
variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Apologies for sending two patches for the same file one after another as
independent work. I do drive-by fixes when doing reviews and usually
post such fix immediately.
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 2b6a0939d98d..cddc88e2bad2 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -173,6 +173,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 3
           maxItems: 3
         clock-names:
           items:
@@ -220,6 +221,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -262,6 +264,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 4
           maxItems: 4
         clock-names:
           items:
@@ -281,6 +284,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 4
           maxItems: 4
         clock-names:
           items:
@@ -301,6 +305,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 9
           maxItems: 9
         clock-names:
           items:
@@ -361,6 +366,7 @@ allOf:
       properties:
         clocks:
           minItems: 6
+          maxItems: 6
         clock-names:
           items:
             - const: cfg_noc
@@ -402,6 +408,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
-- 
2.51.0


