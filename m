Return-Path: <linux-usb+bounces-31477-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A746FCC2B68
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 13:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4480331976CF
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 12:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C57361DBA;
	Tue, 16 Dec 2025 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS8YYneZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBSjRY/H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFD3355806
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765886922; cv=none; b=CuaQZBGYg+aCNWjeePvXDlPDspphV1MPbn+Q/LFJGYSrhfBJo14TOMASFm8LXUT58iPL6yw7hIcnnZtHWIWoUqKQ9KGePFgOgB6WXsplaxInztT20TQF4/F15f0/oob1tOD46iMcZcEBXL2wVyC3DAIWY/nRnSD1+Z0f8f8dPXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765886922; c=relaxed/simple;
	bh=2b1Alj3wBZKsar6ol3N/z7tGI3xylLbJNIQYpSw6+AU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aQvAp2pUkyrTFZ1MqbilkyngNbL8xrBsF8NQSwnoC5yCrceEVA+f6kL3vULTweqm4hyDWjYRb+GIoDQVuIF5tzrCqOC8b342vJ6ebWvkGkZ+5CqODmn5woanTS616Y4wA2XLAnU975dYVFhw68FgFb/ukQsm/+oKHckxQS0UGus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS8YYneZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBSjRY/H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGBO8jR3390866
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tqcwn+P25d0
	0PMlHe5d9yaW8K4sqII6hMYNjnSzNAbE=; b=TS8YYneZRRWGhwZNfTDlHZRS2Mx
	xmiqRBzt7TB3EJLD8FzQMd7paehPEoBwiBFBB5zosCEtxh+MQcA3zcPlRidiXhBU
	NdT1zDPBmwpwwBXGuhz+FMjcnAqPoPjVnnd1dD4wEa1c8yy+KhLpDFx1EPSyG1dn
	KT59RsNYTWKDYnlUrcRzIDTT1qi90hzPPpuipR679hXPfnFQ5VLnJyXG/pxNdjpI
	0euuue/8BG6R69RUgZCPhBlLfiOMY8se+E+/lckdlN/t0vLrY0WjizXl/elMRzEK
	6vO+q+7S++zWHLVN6yyv5wvKWi+bUgVWFbtyLWq4+YNwjsaNZFjjcAVIvxA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b36h384t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:08:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2381ea85so67482315ad.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 04:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765886920; x=1766491720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tqcwn+P25d00PMlHe5d9yaW8K4sqII6hMYNjnSzNAbE=;
        b=HBSjRY/HnkZPRZg67xLdP2GRK0PiL7Shb8hipve1M8nrdkJSdpOhoaoi5n0Uc5JOc2
         VoqYGVLyL04V2jAn6j6Vu+ntrqlwYw/BXW+89QIwE8GF0nfjerAZdYSroIq8kMwPyIrw
         MqBYSfUgeVMygIXI9gtnWS3iVSUE8G+lug25LKOJ3pSyjU4O3UEB7yo3ZNPLKCLJxCBp
         QU5JcKhFyZZqtIkHZSKjQmisWW783LmbqKH5a87MsUMiINw94rMoKRBAoQ8SW6CaG1lc
         0E8QDB5R6JJyRjmFKyvgYZVqLcv6kxXPRtJRwbEGVuTePS7fKw5XHjepVAQ8zVjtfee3
         I81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765886920; x=1766491720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tqcwn+P25d00PMlHe5d9yaW8K4sqII6hMYNjnSzNAbE=;
        b=L2eGIPNngUEKVWcNICawwtVgALTrem77kB1gHyxRa9C9jwcShydKSBFxtxPPjURj1o
         AiRlGDuTD/yZCqflT9Mf2XEszOspBeIa7esOqCcP/7FbDBxQ0hi8ZmxYKeT9Bn7aSbvR
         H4B8PJVqagw3cV+Prko9+vPQZeJAjFbVDB5kLd6hvo2QfYzl920MQ/kAos4cXj8bAyRK
         qho412ITbxUfUVc1+VKQzKpgEbPXg7gw10l7ZXBY8lP8SyH9MXAHZiHDGXZ2zuJEj+ME
         zZW1idfzqz+oGZzMnjZAjn0wUjGe8Bml2/7mk+omuj1xtuDdUFc0HXWYG9VuFse/j0qf
         XPmg==
X-Gm-Message-State: AOJu0Yyc6EM/drY2i59iflKLq+OfXS7d2RrOP2VvhruBEsFYDQoWOR13
	YxvqT6v6Fa56Bp9tTlmssbxHxx3z/YUC8nIAzauF1F579j1l/i9OhaZa3lS8v+TO/AsPq1BdAqw
	y61D/B3Bb62+DyfjxVvBvUzltkdr5kVqa/IDJRyOhsj7ha5sLEyEUPUpxOLQlw84=
X-Gm-Gg: AY/fxX77oi4kYxWuYb4bh9V0Xzu9GmZyiyoTzGhTbcTneMTxgO9yzTbKCva12f+y1RH
	q2pTv5YkAT2qACYklxfkvJ4zS80dtdiXzca7OWMhpz/8iPfviwFA/v6b+lRk5ZnLwQmN3+scwil
	MX52EmMmLZxZu9QmZCssRcfsHQO75ykf7zOIRYvDKaDoeRgociCO+r7TW1RpAN0A/wZdEXUoDrV
	vSeJpQyZzpqFTMhhnazaWpu61G6szL0Y11i20pYqJsPoLFrD5ey1lLQPiKkB0I34pILJR0ydKAj
	DRhls5rN18g0tQk12elsS//oo+ZZ6brAIbenYa81wE46iZsNAscA5Hqfgdwf9L6QJyyan1u/4V5
	AQbUq1495F9Amss/YYrbA3l9AOEAyBiNQmIpcekkbGzU=
X-Received: by 2002:a17:903:40c5:b0:295:543a:f7e3 with SMTP id d9443c01a7336-29f23e55ccemr126913825ad.27.1765886919690;
        Tue, 16 Dec 2025 04:08:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1ZncudyMaD+WtlZSwHsMeY1HVl6gGe4UsDzx9nAXmNaDnHbPF+ZYcS9Fcal82pvdLUkYzHw==
X-Received: by 2002:a17:903:40c5:b0:295:543a:f7e3 with SMTP id d9443c01a7336-29f23e55ccemr126913405ad.27.1765886919150;
        Tue, 16 Dec 2025 04:08:39 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a110f6374asm48568695ad.63.2025.12.16.04.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:08:38 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
Date: Tue, 16 Dec 2025 17:37:48 +0530
Message-Id: <20251216120749.94007-4-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216120749.94007-1-swati.agarwal@oss.qualcomm.com>
References: <20251216120749.94007-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfX0uBUmOhvs6+x
 nsOOqgb3ZRraStiECVCB1bNt1eB6Aj96gtwIwWiMI0sbQOLhmN4OaMkGwCfGdUz2e187aX16MD+
 exRI//hPeHFAEJ/EZ0J2y+5XRiqSrthdA19x/XtXMXN64N50hpM/p0xyay33Cm2rq7OXPATBqFh
 bHRbiYnS5hvVRaErQKHS7XmcMNauFAdj55dXruppKGHdNqgjP1kBJ7adsAIsVssZ2at0JSyLlsH
 XdqinIMf3wpRSzZeGYoOW4f+UAQ3k3buV+AH/hX960B896cCW1MEhDN7GJi64jGnwmB1abkn7gC
 +2nrefm4AULs+HX8B4axjqlSVIDHUBrlyCiqWoCEKimV0bSglT3qUuXQxjYEYLnI4UCqepHjG2V
 Zpnox3GyYcPLAdDBjXXbxMFDVKMgeg==
X-Proofpoint-GUID: 1eoySxoPR07RK-SJfLG5mzOi3A9IM_W8
X-Authority-Analysis: v=2.4 cv=QeRrf8bv c=1 sm=1 tr=0 ts=69414bc8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NdE2umm2-Z7CMbYs9IQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 1eoySxoPR07RK-SJfLG5mzOi3A9IM_W8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160103

Rename the hd3ss3220_ instance to improve clarity and simplify usage when
adding a secondary port controller.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 2536ebe36edb..70d85b6ba772 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -61,7 +61,7 @@ port@1 {
 				reg = <1>;
 
 				usb0_con_ss_ep: endpoint {
-					remote-endpoint = <&hd3ss3220_in_ep>;
+					remote-endpoint = <&hd3ss3220_0_in_ep>;
 				};
 			};
 		};
@@ -513,7 +513,7 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				hd3ss3220_in_ep: endpoint {
+				hd3ss3220_0_in_ep: endpoint {
 					remote-endpoint = <&usb0_con_ss_ep>;
 				};
 			};
@@ -521,7 +521,7 @@ hd3ss3220_in_ep: endpoint {
 			port@1 {
 				reg = <1>;
 
-				hd3ss3220_out_ep: endpoint {
+				hd3ss3220_0_out_ep: endpoint {
 					remote-endpoint = <&usb_0_dwc3_ss>;
 				};
 			};
@@ -885,7 +885,7 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_dwc3_ss {
-	remote-endpoint = <&hd3ss3220_out_ep>;
+	remote-endpoint = <&hd3ss3220_0_out_ep>;
 };
 
 &usb_0_hsphy {
-- 
2.34.1


