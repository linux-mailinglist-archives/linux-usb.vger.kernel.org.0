Return-Path: <linux-usb+bounces-32616-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLSJMMjvcWlKZwAAu9opvQ
	(envelope-from <linux-usb+bounces-32616-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 10:37:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE38649F1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 10:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8634D60AFAD
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 09:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12CF3396E0;
	Thu, 22 Jan 2026 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kte+yHGa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaS/q97+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A592AD03
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074154; cv=none; b=GEODUBeuxRc9wADs1MChW5uGaYjNWnIbaLoUgnJlK2CwzhfKmjrI25JTVZR5FTVz+SKbiQrN3h541j4xKOm9J91cHWQLW8E5STfc0+YHCtN3sPpXrV4K4e/JQ7fyaoIjVJi/m+HiYbwByTN/0H1xQcUGGtF4Ex9Wz96sxUvg1yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074154; c=relaxed/simple;
	bh=pKJ4S9Yb5F8U/tAd8XG56d8jkvFTawkzeviPDJYVaI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WM5uTyjnH+OIGL69DMQcKR5dd/T0ySQRhCbvX1liouovs615klCxvuQ+SPy0zEtij0CK8DVoMsLK9RWjQbVWu/23tW+kO6+Usr8sQW+RTytmSo8a775KfAup/uUrhr4CR1dlVHrui+YfDSelG8LoQ/emVTjJ0ODIzOrJaQdMU1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kte+yHGa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaS/q97+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7G8Cp484215
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 09:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LZubwcTjSmV
	mCnfQ0ThfmfdbWaI2XjiaGGGtgqlveZQ=; b=Kte+yHGaaB+CJe3yRFQvO64BKD6
	Sdijt051Ut5eoHimNoH4PzjfiHWEihjrKokFk5/h0kcpWfml3FmttTcdKQMHv4Zh
	yjrUoU0TplkZMStlt2VRp4TtShQQjYUOfAz5gEwzpJrxI3zhSp/jxqSBWBYBOg+J
	b98sEWRVVumNJXI15V2qhtMWycd4EOy+8KZIBqQjAO8joQiTpa2jyo4QFbBvVnQH
	YxXk2PzwWzmGD9D6TlsahCVd5+99+RiWJUPBwHQAZr40Y9h1k+uHK0wezn9wb/GP
	Sa10+GGUds49BcY5sKz6VUe7atTKqgLgEUXP5x/9nNuBUeeOnxEYzfqZYcA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj1w0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 09:29:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c3dfa080662so481392a12.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 01:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769074150; x=1769678950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZubwcTjSmVmCnfQ0ThfmfdbWaI2XjiaGGGtgqlveZQ=;
        b=AaS/q97+nHJoY2ua98q6AT7NNYxiyhaMY8PUNSHsOKNcxghw38ShOfnsH9qhbBN4Z3
         5qRCP/sXye+lr2z44Jx+B5Ac2sgNEV+ya9cp0yjpZBJymZR577Ar1Z1wJk3rCS1geogC
         jXPZ9HGdy31pQgx8LaivgudfAadFbaUXUAdJE5QL845cIbfJt0pac3pa5DU9oLMYAAdV
         m8SAYItDWs/QvbIqa0soW83lWJEJjrYuSsiPywmkfCUDkI0VUrw6F8DpeZA7slzREkdT
         LCuocnlcNhLnnnOi5D7veRT4TuGf+InkOD1fuCUms419x6xjK3mwPkRAl5c2XRBn6H+A
         dZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074150; x=1769678950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZubwcTjSmVmCnfQ0ThfmfdbWaI2XjiaGGGtgqlveZQ=;
        b=XreLQdSrh40S/F/UJlGdLCwpikfrDuS4fejQR/yjx+cIZS9GI25tIfpz5qnLezHzY+
         u2sQGMRx2vP4NjRuMrzrbAbFSE3zXz8cZ/YrHi6OJGFy8iwmgteaxzvS6hSPVDPyk875
         4BUqgwkipw25ysz5q9FMUTF3lUCOviwwJ1xO+2brwxKmBCEppbxEv4tSYFmdBSIa6YAk
         SzP12O5xmwn+zoY44DnDONQJIRZ/+4bpgdAmrE/UI9M02Dun2Sw+Bo70v1HVmkDcQbfa
         XCkgpi7qYFOYHlpbRvoKzklYmHywkcvRncj6vc5xiIfqAwNaWV0zW+y+vwOgAD4J1mwd
         8EhA==
X-Gm-Message-State: AOJu0Yx26fM0cXOqWNNyv8gV3eO01Z644oATrbtBzWWQOcRhjUi0BWH7
	DOdQe6OPy74TdUaQzIchLRqnFqbqDoOnN58SQaDR/5J6Mgk9daMy6eNav8dptlhNYQzAVcxejN1
	YtGLOoR82lSFf8jbDj3Q8IIS/ajtKhh7WZPfC/F3jxihi6oRotOd811sr+6PdynY=
X-Gm-Gg: AZuq6aI3WIMg5bAaF8XHa6tFkBux6gsoPX0Zvvo4s60RU4KAsly7Vh8kHZlhESvJkdn
	t3j51ltOiz2shd6Uq06yZSRX2KwxbZKGqPbJ71PqwmGvnm536JvP+aF4t6Qa5zhjlg7/U4mp9ze
	GUouDXBjzLqa0fUUV3Q22AZl1PyfVzqn3Gk9OlTjqrvJyFUzED+47ZXSAXSRySq3UoVpRSRcdli
	J5kGHAZ6rOa8/O3N1L1AU3IlxyGghAzKhvQ+ug17xI01s1GPTeZFC6WuHjFDDuULNAkVbb8ujtz
	Oj5g/QmfWMyC2NUwpWI5xlH/YjN4V78V81P0HUrJTykY1OcWwv9GgAcmssd5IKl4JlKxS6vzSF0
	QOMcR/wbDxYUELWqdPbQ6q69l9ZeF/nT7l1mpFL6pwmk=
X-Received: by 2002:a05:6a21:6089:b0:35e:835:7ec9 with SMTP id adf61e73a8af0-38e626a462dmr2196906637.17.1769074150096;
        Thu, 22 Jan 2026 01:29:10 -0800 (PST)
X-Received: by 2002:a05:6a21:6089:b0:35e:835:7ec9 with SMTP id adf61e73a8af0-38e626a462dmr2196885637.17.1769074149619;
        Thu, 22 Jan 2026 01:29:09 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf355ca7sm17395247a12.27.2026.01.22.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 01:29:09 -0800 (PST)
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
Subject: [PATCH v5 1/4] dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
Date: Thu, 22 Jan 2026 14:58:49 +0530
Message-Id: <20260122092852.887624-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=6971ede6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1mrrX1IwxDsCUTwcy_oA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2NCBTYWx0ZWRfXwg45NZX2Q2BB
 qtJ0EczTqkxIbLl0zFigjV2OwDcbGgeool9Z6Pk/xdKYt4T/Mw3dq7Kyz0Un7JAeHclyaIIjYOu
 NpHn3cTheUbpu0LzK6VjjES7/QqsPXTjKeOAj8SB9rpr4GWYoWppAa8E1TPyEGDeykAzElJb/tW
 C/iZ9kSP4+sCaQjBWonDmXFs111XMuskp12qaD3cg80vpkyCoO884QdoN49yzqROVRVzReIUhsw
 6Qg07Fde/Ma9JmqmhEciu4m5mQzOL2I0a2e1cT7him7cbJdq6jjHJTelu4PSCYavKVqdiwiNwQj
 GDgKVhZguNju4N8e+ubJ8ziyXHobiXwNslUjk9Lkph+e4O8OBaxJbLu/oqow7LBA6r2TjX9SRQQ
 CBKyoS9i58idFKw+kOEgRzQ3qcimgBnKPBW7tPoof6xMr64edttcMXUMz9fkLj9sC0vVxiMXdYv
 7nNOKLFSfLRvvwX4gsg==
X-Proofpoint-ORIG-GUID: KNzI8pSEuisWI3YocQtveKPsauUHUass
X-Proofpoint-GUID: KNzI8pSEuisWI3YocQtveKPsauUHUass
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220064
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32616-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FE38649F1
X-Rspamd-Action: no action

Add the binding for the USB3.2 Genesys Logic GL3590 hub.
GL3590 hub requires 1.2V and 3.3V supplies for operation.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../bindings/usb/genesys,gl850g.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 9a94b2a74a1e..6ab13785e832 100644
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
@@ -56,6 +61,7 @@ allOf:
       properties:
         peer-hub: false
         vdd-supply: false
+        vdd12-supply: false
 
   - if:
       properties:
@@ -68,6 +74,19 @@ allOf:
       properties:
         peer-hub: true
         vdd-supply: true
+        vdd12-supply: false
+
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
 
 unevaluatedProperties: false
 
-- 
2.34.1


