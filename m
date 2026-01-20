Return-Path: <linux-usb+bounces-32525-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOIvJF8YcGkEVwAAu9opvQ
	(envelope-from <linux-usb+bounces-32525-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 01:05:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3841F4E466
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 01:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EA3F458AECA
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 10:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB6A3F23DF;
	Tue, 20 Jan 2026 10:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjmoqfOh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aOll+NQA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75443B8D60
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905216; cv=none; b=Rnimm++pMhrcauRcK6pAuvjB0VRm7Ya5vqOnRcA2HKA2KWeFB4D4jTta/jhOP0D+TNa4p221BbpkgiC8nCjTzkW77MNI9SHgXuoHvR6+up9xUtm/MZ/eKikYzQpOzILBo86CG/N9PRAPhlvOrYlEMvQN+YFEg1EIHDZakcYyW0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905216; c=relaxed/simple;
	bh=//Q1FM6ceE8AkEPRh5q8yEDL5X4YynRf9RxCBcRMY+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qLdnN2PqdkADEY7aMJoKupiWrFAd8RdnEQzu6THIx5zZshFX9E6F2csQJcB+7hCzTaH3SvPG7NEiVuH0dvmO5jX1e3fzEGpfkipKhZDKV2ILiB6UskFg3/2Q6tQ61b0juP8HsP179AYr6CL/FH98EUNQ4wRWF7qnxo5p9sTd7yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjmoqfOh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOll+NQA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K3sLcj3252372
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 10:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OljtFy1/E76
	aRPmWidaZ430+oTzv1USq1vUpaqauZD4=; b=UjmoqfOhEmql5MiAfZKjbRvgoJE
	X6QxwGHGdArAiDTyscasi/ArUmHtUqAjGYuyGD3Z13ldDj5t7TdaYj3mKthP2egw
	f5n3VZsRZeWDaw0bNPrg6v4cYNsuVQmIv0A7BLUjxzrM/Bnpkha2cYMnjJ9gEF+L
	76ngeSB1YWTu+j62W1Q0zvyn6bFfuMjjzxsp5sImJjChsRjrf5l4k4bQcRmbEEec
	erthqT5+lBTh2P1RtDJFgVhd4ueaBtsdCBCUrJ0/yXWYXTvyXOQzKZf9G7Ysgipy
	7MMorP2ZAD+9pun96SyrXBnT1tZeLuvCh3TcyygElJbX8wOX+Mfk4phfQZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt27ah53x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 10:33:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c21341f56so9752953a91.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 02:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768905213; x=1769510013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OljtFy1/E76aRPmWidaZ430+oTzv1USq1vUpaqauZD4=;
        b=aOll+NQA4BQDuFsOs1rfoqxizhju7ZWbGNBnaaBw6TZeAyhqWbnTG5lnW9Omp6j62x
         8kYfJxx6lNF53j/pCQpOLqI/4n37ZuMUmAJ1FfCeY/coqdRLtGQcw8fAOUNiQj0qlC2C
         3gZL0Eao+Q3mWKPkMUSMGBqzUiLoq/e5oyEig+2KDTD8a2GWuoot52tkEXVYjwxK32nX
         FujYpLRAQ+pJ2myJ5uS6MwHkF+oBnvC9ecupd3HDZdvsK2iiciMKsIES/udWTBLewwY5
         Wr8mvUM0nDPs1EaHbvCYmDmOE1SHgEvDS5O59XSFpy3rFdzWMsokDeOv5D3xiYI6oNNN
         eIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905213; x=1769510013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OljtFy1/E76aRPmWidaZ430+oTzv1USq1vUpaqauZD4=;
        b=vc8ROWD6fMbn12Jlgph6CHTSVComaeirGxIzeYfPe8WwLw9oDaT89RjVeB+B9dAiCq
         8lKbB9UqhTmaoLjqW59RGJj7idFwVIc8lyPOunzIAX9CYJCUsIGPu3GyEFP+IwKMRjdR
         /0RRpMQVAerhkUlPEVav9+NuI72GRHFgucux5DA2XDuK7BVJnfUB2KGMwR/FVINBbUmO
         pGQ4L9k/xeUsPTK1lPETB8KVo0Az6CoXCCyvL+LY8xRrm6O24r+GUcro2SgpKrORIRwG
         dX/Dj+hXtBYipOykbulnsNFE6FimgiN/oFE7uRyq7EnJp5QWqfnSfDdPWqj9eC75hfYa
         PIpQ==
X-Gm-Message-State: AOJu0Yzkd8dRi0S8iAkWFtlJgH0JX7yWfIZyHWFAfx97kcnJlg2+a4qF
	Ck5TK16TCceIewmcg0W1o+PtaZmaLHa64mgFFmQ3hzMrkcyf0hznV/xqSYy9A5e2HhBfzKeN5q0
	8prDn1x5wQlsgxD204FGeXdq6c4UiRzQ2aOEnvyuKzYfJNRoszE1bICUSXvDJha0=
X-Gm-Gg: AY/fxX7o5Uf/RxRt3nYBEraDqZ8A0vijXZDMCrdUeGDyB5W+OjmV4QD7nL44hM9SARm
	b26YQSXW09OaB7a7O/ceWLzLE6IQiMlikYdikSs3OVBCXj0NSumQG2nJoPSrGnGAaeYqBeSD3WV
	xBfK1yOQuM4UtKUJYhtz2Cv7Fnw/9z0vetCsciLT69itGTWGk4ogi42dO9CMeCekZdX81Sc4vJ9
	I4pH2ozSQ4Cadm+inhPP6UjuHwOJwI2GSuNLg0rwbHRl0HDm9FoNxMs6Qzv9INU4FnqqQQVOI57
	YGQVNyhUrU9/PXUB6kqMw4CmTPi66OoJRcAro+S6OTswgICplBihDEeCGk8H2DPimpJXH56fWLf
	j+Xl9R+1NnPQR6ocPRtZZk34aNgOvi95ZTKBITmca+4Q=
X-Received: by 2002:a05:6a20:a106:b0:35f:549a:b0b3 with SMTP id adf61e73a8af0-38e45d2eea3mr1295930637.23.1768905212529;
        Tue, 20 Jan 2026 02:33:32 -0800 (PST)
X-Received: by 2002:a05:6a20:a106:b0:35f:549a:b0b3 with SMTP id adf61e73a8af0-38e45d2eea3mr1295913637.23.1768905212032;
        Tue, 20 Jan 2026 02:33:32 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf3791e5sm10050709a12.31.2026.01.20.02.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:33:31 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
Date: Tue, 20 Jan 2026 16:03:09 +0530
Message-Id: <20260120103312.2174727-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
References: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jGqjNTJBGRW-w7KwRkCCgc_9LsCxSmLl
X-Proofpoint-GUID: jGqjNTJBGRW-w7KwRkCCgc_9LsCxSmLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NiBTYWx0ZWRfXyNOXkh/KBetg
 AOJ3oDX0udOzDx3MSf1s8O3RVW6wbJMui10OiPlkXFc2FyFZcKnzrVDohusKU7GH9e/NCk0ZkXg
 xwuiDbekrlj6dZtA27S724ylyQli0Ij8a0gk8DT0phmRpJ+26eAk0r6XfDXUUbQ5JgEbHWTlL7B
 +3OlhisOm8QYO9RZWVxfyMcAsw74J1pK6xWUwM5g6BVY6CKAUkone3N2rp3GqA7y0pBlfCCtfRu
 hF3oaE8InMGIEZCaKpDOQHQOLFGm7Q/vSliicwDF8TH5dhIvbCI6bMZns7den6yW/REIg1ToA3w
 5hVP2tcj9MkK6b0og20IEafEWnk5twcf852m92Jb5HxiBM6UAjnO8qJZn5VSa/jx1G4CJVNEKLE
 RWugPwrjhjBkfX/noqAalGtQDqMxe0TBeMCQhav0FwlrnS2daB+eN/CS6LwbgXF9eJVojruocmR
 Zv31oOCfK0mpyrJgtdw==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=696f59fd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1mrrX1IwxDsCUTwcy_oA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200086
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32525-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3841F4E466
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the binding for the USB3.2 Genesys Logic GL3590 hub.
GL3590 hub requires 1.2V and 3.3V supplies for operation.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/genesys,gl850g.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 9a94b2a74a1e..a4a359000ca1 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -15,6 +15,7 @@ properties:
       - usb5e3,608
       - usb5e3,610
       - usb5e3,620
+      - usb5e3,625
       - usb5e3,626
 
   reg: true
@@ -26,6 +27,10 @@ properties:
     description:
       The regulator that provides 3.3V or 5.0V core power to the hub.
 
+  vdd12-supply:
+    description:
+      The regulator that provides 1.2V power to the hub.
+
   peer-hub: true
 
   ports:
@@ -69,6 +74,18 @@ allOf:
         peer-hub: true
         vdd-supply: true
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,625
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: true
+        vdd12-supply: true
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


