Return-Path: <linux-usb+bounces-24344-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85610AC5BF7
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 23:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6A3F4A8253
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 21:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1E921ABB1;
	Tue, 27 May 2025 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hn+Q1/js"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3BD2192FB
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379912; cv=none; b=M049ej6b2QpmLjclzUyOPyOrHGESNaLTMwT+Kboo7RzrzxLvNYtmV7WlqDzE+Gw/amT8t+LTeM2kHJjy8LNNNKIUdNgEORh+K8X1OuP+aExoKTrVVsbJNQ+0EqTAwHYIkXgTbhNabWc4ooz31TXesZnQNAwwTGnHD9uJolvXXTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379912; c=relaxed/simple;
	bh=kcDd7XnM4Qs5GMBjJTFaJT0hgtOfG1Vu/9PUtKeuisU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TaISiVwvESpTpeoUmZnW6W/dEU24S4szrirGTfPpbhuesW6bx8HS41fzN5tTBJedCSuT3qEX/FNnWFV5miu4N4AO4Clr3A1xj8zmgb/qZd6ynkhTtCtK61o5yUMKvS2Ih+xKA5zAsv4/rIkRLg/R2mcNnfZXF+b/Q9lnvfKoGwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hn+Q1/js; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJoVvE004977
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ma8TsHB+F3p3QSMnqT7X+sjQQo7g7lCsD9xj8Lp3FGk=; b=Hn+Q1/js7qPqCwal
	QR0R6xiRErIo4DEK+STvZLfnrw+Qgh/ktGhQCxhH4XVsGkqdlpIEyZjdsB2XZTwr
	RAEvBd9mQ6/EyLGYMig0WJy4a9t5mHar9SKs6i97Maj6yZvtRFeesGOYF5gJ/OiK
	z0bzGKl9pXTURbmw5WV+xAj8bFE6stwakJ1Y/wHGKFDa36jtEV7LI0evjZ2hVTgO
	lNd7wjXcBmVYW8/cSgmFC7onsGW/LMVQ7Os/B6ccZlX7w1Rra7zu1RPs1G7VUY68
	/MgQX1kUNqniV5Yffbua7o6dsLvxkwRTp3XwGYpYgAnhDeS4bD7w5QUZj8nAYO9n
	qNnYAA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g907p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 21:05:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742b01ad1a5so5331167b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 14:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379908; x=1748984708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma8TsHB+F3p3QSMnqT7X+sjQQo7g7lCsD9xj8Lp3FGk=;
        b=I76SvUza6U3tVrs3Xmb7CBIe9y3W2NrqrhrLSmyRbCPaNvfWvD4mACsSA/bLCWO0FA
         I9OEluta7/Hao6TvAtOzbuKBZY/ksGWD7+o03rzWnexwEg9AEmZiifdO9ypQEGCUTv6b
         yEyH9q+OWoLDNyCbDmcNNeKCJThgWumPR+mmAWHYWBrRQ5Vcdv/yv2DcqH3VI0ThYcxV
         +O0mlWqXvLFma97o5tl+XxzqKkbmYh3XcKasoGWsOy8d/n26faXQe/h/DVjLtHQUkUi4
         ZX/+LhRBFOZNqPKVXErjq98k6PI1SvMXqkPzD8Bwlb65CAyZE6YjT4cMIU4GVu3OmhjG
         /wfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYu7NdbLtfGGN2nj1EPqhP5lw1I0O2c2q1ZVUkNDqP901sgngvNThEatBzZoT2IufA6o0ARMgOHgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9iO6KtSCS4I/MdGS5O2ltkhrJyWJuPoyZ3z1c1c9DQtjg4ey2
	LYgRtswFd2m8Q1MojqaTvGEU7FHlYEw24Od9CS2JOa9Nhug44hKdTZwjxCx2LN3c0qEhtF2eQn5
	R2/lc3zToW1Od1FSSnsOYWL0MzplYheDFx3qjjl2d5vGXGQEywa8s+JxOjjztkso=
X-Gm-Gg: ASbGnctgI3qtPckqPZ6WqxYu2p3hn7Fvj0KoiJyeeGtY6FXz5pnRJBJvBn6JNluwQIP
	n+Gbb87b7XaAsSyXF5bVTlDQz84C9ALOgrRA6MrZkptSEgOBT5tKCsG+lj5T6OFkRfpfdHOfpOm
	xUY8T7fAnjYC8j5HTgB4Sa791lxlkH1zrP1i4neOHru0mL7t935er+cggvK5hhMH+t5mAW8boWZ
	2ZbmMQSEgYn87Mwj5RVUWVTH37xBhE9qUFQT80mwFrBgZjtT5QdO+jx3yE7kiat9YAnjUNsuXIN
	ODLyxia94bHqaBW8LblLNzNdWdpLCneCwGToxkPmPiH+xPhzAe+yChSQ4cbom2V0PTA=
X-Received: by 2002:a05:6a00:2388:b0:740:91eb:c66 with SMTP id d2e1a72fcca58-745fde95d69mr22807117b3a.3.1748379908175;
        Tue, 27 May 2025 14:05:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2Bz45OE2w5HFnK31wbhlsPZnbFbrdn+wcobk3wqYztQHQDfpbs/apLivFlaZLBGsaPBctAg==
X-Received: by 2002:a05:6a00:2388:b0:740:91eb:c66 with SMTP id d2e1a72fcca58-745fde95d69mr22807051b3a.3.1748379907716;
        Tue, 27 May 2025 14:05:07 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:07 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:45 -0700
Subject: [PATCH v6 09/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 QRD platform
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-9-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1413;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=gc+u2Wnbmer5INhP/AFAJkM8vbhhdjKxQE+MTNg1FPA=;
 b=4AgkM8l55iNY4RBu1/FwiBbrVzA4iniGJCA7yl35iytkMEU8TFElS/1xm1j9EFI9+yj5eR9fo
 gy0q4gu7itdDy4GfnuSGHdb+p/19GMumODCz/v+vYfN4+QHWeaYoKun
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68362905 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=EoOMd-xwxZjzz6zYUw0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: et6VGjVYoouq6ak5atuovsuzffP-FowY
X-Proofpoint-GUID: et6VGjVYoouq6ak5atuovsuzffP-FowY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX0Pqzd3Zdstjf
 /VGHtQyh/VvmGIRUzWp1A5V3bdgAdh6Zxt6eQIVy06v4Koeo4vDFpi7LTCIrIaw8zCdXev3uWy7
 nG3+9hsUwZl0BDNURR8M0sarjZzcCNaY15rHb+SAy+g5yOtWqdBbyuQScnaKl3nE8cn9zfECShS
 +dUwjfKbfhQaGT3EiMIPa8S7/2d7hohKJ247FZthbiVFBv3da00IC77+4PGMoUxD82QGekQRtRh
 LsJLPGkG8SRdcBHLNLkbXWe3V4D4LzwYHiQLZqUfXAlgf7DdP4DL/IhfHUdpccnOMTIC9jRo4/r
 gtutyc/uVL+LM27ol5VluCSaQgO3/Y7oxj78mQOqAeWuA1uyPwRLUcbkYllBZq2+gJzoTfTyNGe
 8VwTI1hk12gkVNxz+E0tNvNypHDYdZUPssyak4QpmD5D8gh8o3D/l4aU/4vTo8I+5hd7E5Ej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=724
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 QRD variant.  The current definition
will start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 840a6d8f8a24670a01376f8fce511da222159016..5cb18ef1bdbece09a7626b57a852379a62985995 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -811,3 +811,27 @@ &tlmm {
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


