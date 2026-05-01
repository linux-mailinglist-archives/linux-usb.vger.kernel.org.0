Return-Path: <linux-usb+bounces-36821-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKjNL9ff9GkoFgIAu9opvQ
	(envelope-from <linux-usb+bounces-36821-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:16:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 953D44AE771
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBFB43007BB1
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 17:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F61A401A2D;
	Fri,  1 May 2026 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/2Waab9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOBNlF+P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C963D16F2
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655201; cv=none; b=hN8o9RurU04dT4WRAj35hSa4e3ufhlXHAcZ0FncNz0SzCjNqbrGwA9E641iydKvNLBSsclmuLzLxvAThMyruGdMUv+QyiS/DwvPxLxuPygJttP/41GczdqnEsZw09JSAt0Ohf8JAOLHk6urM9yhlCE5YzovtmqpIxscOPI49c10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655201; c=relaxed/simple;
	bh=KvqAs5R+iIDwc5i3JUTq2hNLbPWJGmhxQ+Wfjhe5QAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SBwlDwD913Matz2D8j5liYMZaHvnfQI/ryaup6RU2Ad/IvPlaTJAFfopCpFmCxAvzfKXTigUuut0BKIOwe8X9Hs356FGR+gANTd1Ea+NRjN0HEnEhIW1A93bZFGGlPjt7vgUdBXXv44kymhw2JGGJ6/DXWcGHSUuygb/IAOFv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/2Waab9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOBNlF+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLTcA3938652
	for <linux-usb@vger.kernel.org>; Fri, 1 May 2026 17:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l02V6N4JgrN
	OPuusUfSdP43C6TvNDkrqHvXRRW/M3Cg=; b=W/2Waab9WSzoVY2eDwwqwhFcGXc
	YeIT9D4M8HxpFrMU3OAR8jD//ajACCC3l0AxeIEFYaHY+lL+Sgq4lYyFJvGTVisy
	bOiPsex4upb8koTSLW54K3NRP4IWpW6Dlg9qk0YFDxGxxjY8s5P1tYtCDsxvnddU
	JNr8BT4gMnGxTd/SsjGKNa4R5mlM/T920EAQDPjsVeRy1Pgl3KzlX58AeVHgExvH
	U/asnMKTiXZh94Av0p4Ha7+Xhv1mrO+pOw1uZhciL0wZCLyOcP9wDZzlL1n/Gzgn
	99LNQtxlFUYBTAdHPb2rFUFB+00JWBH7byyLqeoGB9jzbi40nPZgdN1njhw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvtrn12mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 17:06:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so3236596eec.1
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655198; x=1778259998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l02V6N4JgrNOPuusUfSdP43C6TvNDkrqHvXRRW/M3Cg=;
        b=KOBNlF+PocSEEkRuuzkhNRETuYwWKxLZC86KhsqdvdAd5EyqOYDrSoBz25+ua6lDHh
         MDQxCYjpHHWIxeR+umc03tR3ZMJ15R9E60lJjTzPSMC8rXzo/26F3R33XkVWo+4XPvow
         qNYy9yWXiWreNPh5klTNDcjALdPOU/F3RxpVq2ncu9kRy4gjfhOMK5I8ehOmlHbtySzA
         TUqp/Hg849FJJqzpSNJqGkSSFpdEEB5jbDBxtXqAVDXJlIsZKGM5vjT8MleVRaaIooH8
         EI6ph/c65h/eG/y73Yk4RbmVTooLDzshD3qJJRoy7ofWM/tAQxI7jE8ERwp6RGi44/iL
         2JXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655198; x=1778259998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l02V6N4JgrNOPuusUfSdP43C6TvNDkrqHvXRRW/M3Cg=;
        b=OnzxyeJSJaBpUrWFBxXnql2f3iK40U2t0tVD4ZaHDe40agQJBWqVha7yaidlRihdiJ
         FolsAQO7Slrey2SaoPIgQgv96gqWmhrvqRWo4n3ePbPZfmLXka7PNDirt05BujYdnNLj
         HXrDSYlLpa/jqPW4BuQAZsqsMBCZJTo1Q+QRa6N0oMa0AlsXw5eOXmblG0L/BtlmKB1j
         ShEL2gGPwS8v5f1jBYNE0WjtJgkK/cxvV1NU7sTDcnwGD3rv203qpoWxMoEOjsGGd4mB
         m7/hZVwprjoqHanhWhkDS6Z7TXi+U0N+zTjhdapEbNVRZ+8FpcaM5I300o4txQ5XF0aC
         XADQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vTQFbkIr5E+fWYMPvv5AEnf7PaZ6rJLpfflIIyaRjs1Rjpm5qmlBDUyrM7wNbrZ0fpg2AywSZUhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR6Io6n+64KirUmmzXd/UDwaRHnH+6lk8SNf4phkJeO67dEWLg
	8ZSQcGpthcs1MDbEM6apjXD+bHLn1ZJo474LMvLACQJJnPh2ztkuCP9nLSAefnnkyAenWFLHXI2
	0n574xhfxSslx6JA34x9gBtgWsLmTNCgYXA8LTFFf/N1ZSaWrUvUfZwavZNxY640=
X-Gm-Gg: AeBDievhRJWov4mRjQXb2+TSzYV4HZD7nLmq8cwpr000uHUx76fVNeEskH/UlSbt0w0
	JL4dfY8PgmSnQDtbfhpZl7xQM55stFb5RHZpxHduK/GJKJ6lK3VaMT5FpHtiojIXK1T80ynRxQ8
	xHgiqSbl6qPqKulYCI2bxjNY2NqMopnd8Pw7qIa0ByGP0wQfQZtw98AlVAO1s1T2B9BIY2oaE7k
	DCFEUrrtJ82JvQ00MJc/xGLoJxn2CvBfOqr0DZy77zMfxGiFRFTT78FAhd1GvS9PYUBqwSCC3vH
	tQe6jOGgWw9J0NcGSw4ypi4c5cIAOKfMD1aCjcVTPa6jO322PLaFRdCNtKFI1/K0WTMpkfJW3Xe
	PmIJkP1hVUo01pFXjYG4yjLS2nFJgQV+DG9ty1MDnVan8ZO1Oanr9tK+sP3QsI6n5ch6dvKFnmI
	CpcUbvIgsNEw==
X-Received: by 2002:a05:7300:2322:b0:2c0:bfe3:b95c with SMTP id 5a478bee46e88-2efb8aa1f8bmr96524eec.4.1777655198106;
        Fri, 01 May 2026 10:06:38 -0700 (PDT)
X-Received: by 2002:a05:7300:2322:b0:2c0:bfe3:b95c with SMTP id 5a478bee46e88-2efb8aa1f8bmr96494eec.4.1777655197477;
        Fri, 01 May 2026 10:06:37 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:37 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Fri,  1 May 2026 10:06:27 -0700
Message-Id: <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KG8VXzLc2Avu-G7fHeBUxwPwCoZr2DV5
X-Proofpoint-GUID: KG8VXzLc2Avu-G7fHeBUxwPwCoZr2DV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX1MY9ULEMVgZ/
 KqF0vGFN7HnKCd/DIJYQ9wbMaJQIA0eYsYmhsCbR3hWYAzlj+KWSSB05jt/sCW7PancJvVwz/Z6
 OcY4Sqnc3Ed7E1iyurIwdwAVTV3XnMywnAPClKkNVcW6FMpqqljlvyvjsOdclfIlRTkauXx51N7
 gKEKnf74GCtoe/wOOlxOimXvrGJgDvgPnwO0c7lVLKKsoA/fMZHKGWxd+fMZzwsHBNiQlVyFH3y
 cw4vo0AyRJNBKiumUC6sBZ37Vhw1XM/L9meSJ7Y0/AuO/RPlYN6ZFJXXzSrtWQS1NTmNN/MHqtm
 GjLDyMM5Qa92DFaGFYP3IiJV15xPqw9On8f7AVbaClhqcdf/N0SUdBtgdjv59xOzmo9391K2rZm
 VfQ2iIve/EiUb5NO2FoiU8QU5WGws2iP2JAb9FcVYSYzGnHqrspfCEK8GASYQp/PuQCkLc2ZjXU
 VnsbDQaLUX3Dlqk9glg==
X-Authority-Analysis: v=2.4 cv=KrZ9H2WN c=1 sm=1 tr=0 ts=69f4dd9f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=S5Gqkj48huS8qG7z_KgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: 953D44AE771
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36821-lists,linux-usb=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.822];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.1:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Spam: Yes

The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
independent High-Speed UTMI paths, depending on the SoC configuration.
Each path is distinct, with its own connector/controller connection
and role-dependent UTMI routing.

Because the EUD sits between the USB connector and the USB controller,
it must relay role changes across the UTMI path. In device role, the
EUD inserts its internal hub into the path to enable debug
functionality. In host role, the path remains directly connected
between the PHY and the USB controller, bypassing the EUD hub. These
hardware constraints require per-path role awareness, as UTMI path
roles may differ.

The existing binding models only a single UTMI path and assumes a
uniform routing model. While sufficient for simple device-role-only
configurations, this representation does not accurately describe EUD
hardware when role switching and/or multiple UTMI paths are involved.

To address this limitation, per-path child nodes are introduced to
describe individual UTMI paths through the EUD. Each path includes its
own ports description, allowing controller and connector associations,
as well as role-aware routing.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 55 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..21f75038a81c 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -45,10 +45,63 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: This port is to be attached to the type C connector.
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^eud-path@[0-1]$":
+    type: object
+    description:
+      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
+      to associate role-switching behavior with specific port connections, allowing
+      EUD to manage role transitions independently for each UTMI path.
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Path number
+
+      usb-role-switch:
+        type: boolean
+        description:
+          Indicates that EUD should act as a role switch for this path.
+          In device role, debug mode inserts the EUD hub into the UTMI path. In
+          host role, the EUD hub is bypassed and UTMI traffic flows directly
+          between the PHY and the USB controller.
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
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB connector.
+
+    required:
+      - reg
+      - ports
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-  - ports
+
+oneOf:
+  - required:
+      - ports
+  - required:
+      - eud-path@0
 
 additionalProperties: false
 
-- 
2.34.1


