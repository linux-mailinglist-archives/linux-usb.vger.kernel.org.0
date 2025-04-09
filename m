Return-Path: <linux-usb+bounces-22822-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FBCA82DFB
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 19:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC7661B65A9F
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 17:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D5427C16B;
	Wed,  9 Apr 2025 17:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDk4/zt0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9B5276057
	for <linux-usb@vger.kernel.org>; Wed,  9 Apr 2025 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220922; cv=none; b=pstejccNhvFSHJJJVP/+ODYsrovgSIO5BlQez7gYF7eE79Z5DdZMF/pzg+84nBhDMUcne+HdF41f178hLgA/GtSHebOMO/+4jBPJ7stvXn0+B8+U8R+V1uQLPiy/n4oZ66psWvpVEIHc2YSwq1YPZYEOeVNUWWjCOzwH+ZJuEv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220922; c=relaxed/simple;
	bh=IhZEWpBckOVuMJ3qp0wzpKZwFIzDj00va2gSj1MZdLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T8gEtHA8L6DWqv5L2dKFirKuOI4AJVUjiVE4PNmOHOlvVpN8K+T+QbtA/+NFNqFJAObFFkyxgXh08EkU1SO5Mcj6rg2cmH1FHP0CH1QTmQpjmLXo3Tkbg+ayctRU4lq8ZvqnEnGEV6LK4CSHBuQpHBxqTab6cI4k3dUjee6KkYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDk4/zt0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HIqcw032322
	for <linux-usb@vger.kernel.org>; Wed, 9 Apr 2025 17:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bVAy88wlNJC3OilztIMhCSi3ZV6REtKHr5V49PSIZ/k=; b=CDk4/zt0yWHhO3BQ
	V1tnGO+3+z5o1vwcVbuTynHRWk2Z77a5n0XPZLe79BIvF67EVJoC1RxQGEOGtgwz
	tj4iTeIh8QjK04hwpF3PqF6GT5/anOpVnDLRdUHDBV2UwpjwQDhbvZ0RqjdaIJ2x
	f5G/BDtYnoxpCRW7zSZasSwxuoNA6jnXNn9VviDFty/N3459G5dtiNfPB2TvfE0k
	odz9aASXF8BBkbXJ9xA6AGndSyvH5sVls+2AOmpOlZwkgCHZa6NVWuw3ntRO9omO
	//dVZ+UAYFoyo+F+c3OwIy/dHn8MAPdO7XRfH1Hln/jXOR92twE8d14NcYbA97Kx
	9rEYIw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbecbq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 17:48:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af8e645a1d1so4167062a12.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 10:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220919; x=1744825719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVAy88wlNJC3OilztIMhCSi3ZV6REtKHr5V49PSIZ/k=;
        b=IOSJcCNVP9N6eDea4nkr/jiWRqe5lCyVoFWRqSaPxgokyi4Ni3MrA1nxaYeV88wRGm
         ixKMLiiziL/ott+N5tQAZBDZCYTarxrZcWB05dACydO/1UtaDIuZ0uwz9jHgVvD5bndh
         LWvguei7dsa+yttWbA8+VvUR5TMuLBJVUNN5SGru0mX3QrHNa97iuPhVJO0LR63hVCO7
         M4mZDipCDwp8bMyX0R6Ars3qAQ42+UGUaFCAHXg2ncBRLNkQ+Wz97z5uWmu1+pOfatmB
         k6ZwwG9zVi5V0W85aCG3ckWUwNSmL7NoH7fF8/dFCFoyj++0VxCG3zjgdtmNBYG7ErW1
         /apw==
X-Forwarded-Encrypted: i=1; AJvYcCW58a6HrprbdzfDrqwcOvu4K2JvkGdMuCK1srnDP6psdR7M74RxAo7+YZEh0iFAI919zuPNwX8aY1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOuWgYU/pkAlwjVluoN+FVgPCvRBFWbiRHp6gZm9MrFjIMVpdF
	iBgNRyz7h8CIPwa6+wOTkQK4A9ugv8UlzqbbvTtvtR7yLfmJTE+2/vMVkEGvp366BPSV4WMtwVl
	Hpv9CjF3DCc6nMfY/eIFOd+pLNQ/qXCdSl1hsfuRmOGBZczQQG4vTCuBsOT0=
X-Gm-Gg: ASbGnctBHLboNnZZm1mPGMCD4+JoyT+Ya4SDzs8ztdHBv1qIZ2/j7VBETfboBt9JsZ6
	phBomloXDrkMQuuxcvkXDJBRGqM/HMMNSNf5kiCdcmEmpt1lQ2HUyzjyqt1rCpRykfJV3DmJ42T
	UTTXJ4WA0B5Zo/ouDh6gYPh07aTEtW5YnJpoB2Qe6X4zBIA/4rpJqQfo2r9jSe9XLrYBrj3+LcS
	5ec3vw5fVpMr6EcIcPL/nGiuF7u+Pzu3ntewHovG9QbFSn7g5HgK1gklGnkoEwLMc+oy5UwPm3k
	kHjYW4loYnx/eQ8kH2qy6nuORR6tRuJYeTGW8t2sK7I62lP0r1xe1UVQfe7TEwLFcWo=
X-Received: by 2002:a17:903:948:b0:215:b1a3:4701 with SMTP id d9443c01a7336-22ac3f6e816mr47119645ad.13.1744220919432;
        Wed, 09 Apr 2025 10:48:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5Ri6zYviU1Hzn8RpAKAATT1858Rt9K99dceK0g45RXnTwZC5N1EqWIevyJSP7eG8TgRQTKA==
X-Received: by 2002:a17:903:948:b0:215:b1a3:4701 with SMTP id d9443c01a7336-22ac3f6e816mr47119345ad.13.1744220919029;
        Wed, 09 Apr 2025 10:48:39 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:38 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:20 -0700
Subject: [PATCH v4 09/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 QRD platform
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-9-6ec621c98be6@oss.qualcomm.com>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=1346;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=hZUg/+RZ20nfOCiPzQxS53fZanuVA7aPrSUO9e2eLoE=;
 b=8Rdo1xbQczhNUjlciv4mj5V4rITvKPAlcB0V7w3tsHGIg0R7aBPsW5osc3ahw126II0Pa6Plq
 acxVFib4NJUAdOyD714DQk7cvk6tIqD+1GKPX1QC4sEUtM4IzI/gc3N
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: b4zuy2gJECQgMX9mUneTVSJMoJ-rZ822
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f6b2f8 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EoOMd-xwxZjzz6zYUw0A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: b4zuy2gJECQgMX9mUneTVSJMoJ-rZ822
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=660 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 QRD variant.  The current definition
will start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 7f1d5d4e5b2813c59ea9dba2c57bee824f967481..77735ddcc7ab954ac25aad20369fdc8898283d40 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -804,3 +804,27 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};

-- 
2.48.1


