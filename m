Return-Path: <linux-usb+bounces-32581-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFheMyCscGkgZAAAu9opvQ
	(envelope-from <linux-usb+bounces-32581-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 11:36:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F1554F0
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 11:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE45A60A7A8
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 10:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAAB48B365;
	Wed, 21 Jan 2026 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axcVtbyH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjwVR26X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7D748032D
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990554; cv=none; b=bTyO0IuWUBTVChW1rQrGzgAEUjO4suVIJf44hXj6L0Rts9VRBVIMsHsgZXQghQgILaCAZWWgGY+diQAz6kti5lDwLS5rKTL85wEgcDriuyH89vDv1cnOfsrm/wlAZxKISaxwEogtd2XnyxFe+dz3aJcvhWwtJdEvIguTNvTWdzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990554; c=relaxed/simple;
	bh=E9AitB4B6NLtjLJCY9zdPbtLBa3uHKEsQ+4XyMEuYiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LcogE0s3qi7n8G9g6uaGQSXiq4av8gnDR+w1YEoBPO7hRQQbaXsE+eyeA2DbeTMYgYeCVOBzsmk7bBj1H9vo9Pl6hlKzqtMDHRSgDdb51/8GdIVvzpmfZoY/83P6uvLUtA0w0pOijw9mvb6pdMeqeblWIRsN9GTON4x5svdZjro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axcVtbyH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjwVR26X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9kPZL824834
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 10:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5E7FyFLcQYsfiEjFOC7/l23jwbbj7QRHouN7DDrmcBE=; b=axcVtbyHHVD+Dxs7
	tjslYkNyKv5bwpBIOzS+mPWtB13WRf5eog3e7x3i4QlEQ6UhG8H1qfyWaxm+pdQL
	o3LQXQzj0l3VAQoyknFqSDf15MWVuRgfJd7L0PytVWCTEkeGRdK8Zzq5DITZCKyY
	gaxiHlJydHQnKuQ57cJ72WjsWc53Gi3+6s9g2VwvpiW3FhW3I4BRa/DzJ6HSfCV/
	YDi1WnzWpqGAIdpkV5c5bhSYs++PA2Pge2BIfWNK6iNoM4Jqu3eIY7GmVNU7efdP
	kaI/IbEvGS7/P1+R9ptO/zbX3tRm55bd7RO2bBcMnv1/zkgHUKoVxuj28Gk25vPl
	IOVwZw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e3fq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 10:15:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5311864d9so340742285a.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 02:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768990549; x=1769595349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5E7FyFLcQYsfiEjFOC7/l23jwbbj7QRHouN7DDrmcBE=;
        b=FjwVR26X4JqOQrch/gkLt0BS877SHuEZbaJpe3U/wSjqVcBtZgjm8auGCNhTIrqRNV
         M2G0FLDI9MeCil8FhjjuOJffQX7NWu2aqMoU+oyF2KySOFJ60DkDTYTLsnJ/tIGgEWE8
         kFX2OEhJu6qFXt44j5HYvxQJd08vzJ+9sKPSi7ST20iTKxurrWTybGfZ5uF47fomp2gJ
         c/OW+PJYlg4pqTrS5z73pYav/w6w2W4MmVp9ILNF0dIBkNao9rL1prLJvoc8Ycbd0WMv
         2jcwwrRxUhIgQGJ1gUacpoY9y4E+506nq5pAZO4g8w7SdszoB6ALl7pNxW8pMl2/YZzN
         G5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990549; x=1769595349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5E7FyFLcQYsfiEjFOC7/l23jwbbj7QRHouN7DDrmcBE=;
        b=Lbt0mxcGFU18iaYj/Qd2RVFvR28EzvUNTgp1VQkg72kgsmErjNSDVVdXxL8fWv+5M/
         3fIIz5WnDDCksq+kw46z6UgA+eZVBb2WJETCerNjj97QGe5BrVPpdNcVHVXNGxklTZK9
         ghVB/Dv2hFH4uhn0ky+OfifSIgnzp96Uy3SSV3D9Lb285vZWU+HNjfYkbTEfseKwXDpH
         SXKpH4DTETg1r2Z69KDh9r7RrRtd+bmYEQW1ObCO4Wut/nGpdroysnLy1puigIMBi/P3
         Aw5nPvyKW8AXNvW/7ihp2bXZ9YkIzO8TqOFnMKZgTs5SAdUsjIoYqzjrfzEuOVyw3nP7
         WrZg==
X-Forwarded-Encrypted: i=1; AJvYcCU6UPcBPQ+J13odt9eeNz4TTj76F0d53rqMrmLF6vTGBIey2KBLjDRw0X96aMmITzCMGYiO9M04tyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL2hnXCwBE5aAk3TLodGStQga/QVE4TutO90Bequ8cuKzqkhiY
	CnsHjpVur/eIUnJxelv0KKY0mo3xZjNomkXCEqDEP1jPDNgDNtPGoTkqUVfeKGVg1IAZ7egBh2C
	4M49/BjznDx69tQBiYHkOcfHiZhGYAOeuypzYDzwcV1JnhSZ3gGFHZ2p1ZI09rdI=
X-Gm-Gg: AZuq6aLw+SNzIcYoz4VaF6O5PCMFA93RkTYLtCorQKS7xq3Sqhpge7idVtLLiND14Bz
	6T4+BTX/ETQN4w2yjoKTobCtlFI0WLtvUrLXYCp6ybZYZ5RfJww6rtQLNYVTRP+XoXBURSAlJKL
	m9URJ4w468R8xvi2OAUk8wCsjuzAvuosdFxpxt0VdPiQV4kXlO3bxAn0Ft68pHlmrAPCH1GBnUl
	o3vBVOapMvO27UyUgCx02jLbE15pM23PMWPFysdbycIWf8esy80xzi4FjJ5qRJbN75ZnGBppFL7
	TXTGl41O2KNBXRqWjyK7t2bMUysk5NXQEbGzL/UQf/+8GZlElSVVXu3EJ4dl4PjXeuE/1BFV3/W
	e7XzZAzpP+RT9F+fQh8iopZIjlfPtncLu1/Fc00cc5edyG67JjgmyoQD20LB+3HWVnzLKQZMjQx
	QWREiUvYUBlpKtknqwgQkVJvI=
X-Received: by 2002:a05:620a:4096:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c6ccdb0f00mr580150285a.21.1768990548719;
        Wed, 21 Jan 2026 02:15:48 -0800 (PST)
X-Received: by 2002:a05:620a:4096:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c6ccdb0f00mr580146685a.21.1768990548263;
        Wed, 21 Jan 2026 02:15:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397785sm4720733e87.51.2026.01.21.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:15:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:15:45 +0200
Subject: [PATCH v2 1/3] dt-bindings: drm/bridge: anx7625: describe Type-C
 connector
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-anx7625-typec-v2-1-d14f31256a17@oss.qualcomm.com>
References: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
In-Reply-To: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3884;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E9AitB4B6NLtjLJCY9zdPbtLBa3uHKEsQ+4XyMEuYiI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpcKdR/ejMpTmJ1Ii9B7nFb+DoUyVnNhJtvIBxy
 e+anW50k9aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXCnUQAKCRCLPIo+Aiko
 1Sx+CACIfmjAyrt203QSMmiD8hfIkTu95GnmjD5nbF6QyuUVCgwl9fSLoJbbc3/+FdXqIDQVldO
 FaW9eZ2VYep17mC4c4sERdeIlo9G9rwCkL65IzOyag5u6s1OsTjUeO9cl4clbu5gtKqzGT8QKF1
 JH3SS6UW9TTeuBqFs2m+EdzkiMc/z5nedCQGxbQs3P8vZAV7Tze6K7i6g0xu3LQYN4+vE01n2fE
 bEHgl5j+srtrlLTP70MLajLFmcKUlk6SD1zigfexjghwIh+i9BSOlo06d5yLMKGTqCK8t6SbNT9
 Paxv6s3VUbpsLnZ4h4NcEuxzvqXJSB9NULnhregFYUhDwwI1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=6970a755 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eOiPeOEgsxahVY17qz8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 717sTEhsFmvtP5uMbLxo_qi-bww0pDpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NiBTYWx0ZWRfX7zahNyaNUHKg
 02Rjdyvhyo3bMrZWU/1U0FaJ0DAs2r8/zEFbXb727wPDGhkemD9iGGZFnVJw8oOxmIZs71Asz5A
 OyHsyb2fRUBIN2F7lMZIzlNb3Us2u8yeEe5h62O6TPlC07YBBo1eGdQw3J5MAaq4sSNRnGz+YoV
 why4sVkCkdQLoO8SRz4Eid6+39cL5e8Re6hNUKPq9AiL3Qtp50/D7wQiC2Gu+DAvPcRJCVzHI4E
 xRkPQhPLZ5Nl4M1HpHvzySjZqIxeNTudThOHUvfoR5mwrI6NjhOLmuhkuzCxmY93MHgfOtReTCw
 48Wg8LEyXMn1Crd8i2B0oTjlPAC89bvGgLGMeB0vhCDztu1ADmsq8p9peXS8w7AUE3ESNUgkGJZ
 SjYWOpyThpvWMDM2z4QIusbu8TUNcnbNtRVK8CTr5XGE3Bu72FbX/XgL9kGwdlhmh8K3+L1Zm5Z
 B2h+cn86V0iuJTqwwVw==
X-Proofpoint-GUID: 717sTEhsFmvtP5uMbLxo_qi-bww0pDpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210086
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-32581-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,analogixsemi.com,linuxfoundation.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.2:email,0.0.0.0:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.58:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E1F1554F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ANX7625 can be used to mux converted video stream with the USB signals
on a Type-C connector. Describe the optional connector subnode, make it
exclusive with the AUX bus and port@1 as it is impossible to have both
eDP panel and USB-C connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 98 +++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index a1ed1004651b..6ad466952c02 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -85,6 +85,11 @@ properties:
   aux-bus:
     $ref: /schemas/display/dp-aux-bus.yaml#
 
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -117,7 +122,6 @@ properties:
 
     required:
       - port@0
-      - port@1
 
 required:
   - compatible
@@ -127,6 +131,28 @@ required:
   - vdd33-supply
   - ports
 
+allOf:
+  - if:
+      required:
+        - aux-bus
+        - connector
+    then:
+      false
+
+  - if:
+      required:
+        - connector
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
+    else:
+      properties:
+        ports:
+          required:
+            - port@1
+
 additionalProperties: false
 
 examples:
@@ -185,3 +211,73 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1000_mipibrdg>;
+            vdd18-supply = <&pp1800_mipibrdg>;
+            vdd33-supply = <&pp3300_mipibrdg>;
+            analogix,audio-enable;
+            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+
+            connector {
+                compatible = "usb-c-connector";
+                power-role = "dual";
+                data-role = "dual";
+                vbus-supply = <&vbus_reg>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_ss>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_sbu>;
+                        };
+                    };
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&mipi_dsi>;
+                        bus-type = <7>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.47.3


