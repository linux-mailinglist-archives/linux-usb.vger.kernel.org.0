Return-Path: <linux-usb+bounces-31649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5BCD28CC
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 07:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B2A6302218B
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 06:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57022BEFFF;
	Sat, 20 Dec 2025 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dzw3o7f+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmdkSzIg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8229B78D
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766212585; cv=none; b=JNoURmVWpXlZYrc8Ax9Eo9XaM026CL3xDuFoGX4IYe7kVx/M4jbzL2NTDJgCpKZ18+/pT+M3VYvNX5111cz4hbQMuhlQ1DCVoB2MrlS89/hQiL5ihvQeoD5JlvN0jExh5NSwmgPDmwaYJTA1zwEyW9aOgCgS7J/NXPpJsdhASYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766212585; c=relaxed/simple;
	bh=2b1Alj3wBZKsar6ol3N/z7tGI3xylLbJNIQYpSw6+AU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hDgvr2xfB4Pde0/8ha7BG6x4+abcRaY7mv4zFnnU8SIbQ600Cvmr6GRqhSIXtSjyYcaZtorKH0xZ8HILCXm1nHlhmRFEwc5hhBAx81cYzMPM6MWnPrfV8cZuIDx62CwjAFfN9jPdAL+5vqKxCRoEQc/73qLLe9J9up1BLCW8CrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dzw3o7f+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmdkSzIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BK4fA8m609644
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tqcwn+P25d0
	0PMlHe5d9yaW8K4sqII6hMYNjnSzNAbE=; b=Dzw3o7f+co5MqDItXyCd1pwrIYh
	Ph46Pn0aNS9D+3cYwKDIX+l3bMly2x1abzN79K7rInLIV0iLOPNc0CDK8wgfyYvz
	Nl5G7RtW9Uj+zZvVIZ06KBEsEPVWAq3QLYipaZuMeC418D+bTdJ/I7EAzgWZ1K5n
	uw0/5kIhV34jeHT4VH90RPb75othP/YGi4KF6rkIOcX5xehyG1wu5+U/n1ruPWSb
	Q3RqlmkG6GH5tTiDyqFHZbyu3kBi7OF0H0j5RpH0NyYEHi2UIm8fYT/zWw8xY8XE
	eqaiHFG+ghCrVmFNar1hUq7EZBoEOZ8xppNwLxT/8DntwI/oSS/1l3RNcOg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mydr55d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 06:36:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c5d7865e4so3567983a91.2
        for <linux-usb@vger.kernel.org>; Fri, 19 Dec 2025 22:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766212581; x=1766817381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tqcwn+P25d00PMlHe5d9yaW8K4sqII6hMYNjnSzNAbE=;
        b=QmdkSzIgxR9TE8gE2LH0SBxRDTvMlsWwjGSGJU8y0VHFomy8U3kTqhdZ0k8RGJF8nN
         7J+67NSNvy97Md2pZbSaWgoSCoVzKiEcMN6nHay6U77kp5rr9mKtUIEMotnIWBLsq+YN
         2sl8MG7/4CEgazyUHU5cYnhDuUJpxbxIFtLrJPr0RH5b0tqZbG2YjzQQ/APf4J6XUoxL
         T6zLCUvcvTvqFoKJc310MkAGybSMN09LndI2RfJFypRspWlRGTjyub8HOOzjpNm4fRPq
         mKt9ZZh7d0IDIYQLagK6Mz5D2FOdOHsGamJMX1469mpU0YCQLvZbEr+v9QuWMHsfPwZa
         DbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766212581; x=1766817381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tqcwn+P25d00PMlHe5d9yaW8K4sqII6hMYNjnSzNAbE=;
        b=wntlTm/KFhoMgzwLuQ7HMZK8pmhbjxu08O9+X1PXz0DJ37s96blVNjExgQJZ/QBnOi
         3GmXn4ekiE+H9WhFcv+/y30BILL3i1Ft3uugejZRrQapfUJLNTTYQWyuH9PqQddXqows
         cs2zXTzPWS1nIrg1UqloSvNlFyC4B5vZ9naOf2hWm5SdUTtC5cy6fuRPAyS2nGWKcn0b
         VMGKyAB19HnrCShGW8wbK536Vy0VCimegRkNYZ8Kht4UUiN7FYH4Ce7+UqHhEVRhJE7H
         AlWeZxyC/85v0XeHma/6eeTXe1FZJ6Nbz7YpK9l1UXVu8n+eUn8o0y9WtjR5bZxYxuwM
         zUsw==
X-Gm-Message-State: AOJu0Yw2GfnH7SBi+s6Elo8pbi66CAtprwc7ZnKd6c0ZjE1AInTC3igY
	KijPJeBnJag+4SDMoMjEtl+QVMWDXK49gTtzCoCDo3AD5JS+16s0mqg3LpTcld1UKzlXYteB/sV
	hDRArshfBBtMBA4imstDMJzSNrvNP2R11ff84HfyYFr6MuiGRtsRWeF2lGCJY2vk=
X-Gm-Gg: AY/fxX5tdvRReMEJq0D3xBnL+mmy8k82vnvJhqgbtfLiiyMkTRovD9U7v6goKGs+cEh
	6NVzTdcJHnZ+UI0BxT/Jj51Yt+tZ0Wm80w6VEX+iUEyOnUyUi362kA8HX2e+4Y++TLgx7oFOUKR
	oM6LEQLzrspaafBd/5U2WoI3L/FcgsUHNrgyrQx/EckjTS6c7IxiD230myVs3dniitd0A6aSl0A
	dhoL5I6H+drO1t3T4j9iyurj3ybAZmPaKZIWGLN/T0TFEr7HON3FfqiDw1PY8WJD2K8TuvJwTvU
	ndwAIaRQ5S5F831N1SMy8Mr7NtP6myDdkYKhRk2tj7/YX2RgNUO035E/4Vkdy3M0WyHzBItps1+
	4+HoImZj9BAkuPRdIo08kn/OmleckjoG6FppIbquXLK4=
X-Received: by 2002:a17:90b:2585:b0:34c:4c6e:beb3 with SMTP id 98e67ed59e1d1-34e921c437fmr4111341a91.18.1766212581134;
        Fri, 19 Dec 2025 22:36:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/pqVcjMbcOPTwNyRgh8QRFYAt9uPJ5HibRbQ9FqVfFUnWM7gy+jTM2KIOqS3SrWlIBGtbRA==
X-Received: by 2002:a17:90b:2585:b0:34c:4c6e:beb3 with SMTP id 98e67ed59e1d1-34e921c437fmr4111334a91.18.1766212580655;
        Fri, 19 Dec 2025 22:36:20 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7723b3a8sm2847143a91.3.2025.12.19.22.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 22:36:19 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
Date: Sat, 20 Dec 2025 12:05:36 +0530
Message-Id: <20251220063537.3639535-4-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iglUqUJi97Q15oA2U6SKyX0hE9m9TLoo
X-Proofpoint-ORIG-GUID: iglUqUJi97Q15oA2U6SKyX0hE9m9TLoo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDA1MCBTYWx0ZWRfXwbMqnR3cafCH
 BuggeeAZFUd3SqZJp7eUI89DOm8DCuEiQ3or9mS7j+1zjhYbyQRtZ6eHzWUzZYGxPb/kzQFYz3S
 Qz/+yNL0ny3XwJo2BkgKkgcdKgO+MRkAP1Vsweuph4Afq6IWXIN09nSe1CEK1LlCshbhAOcdbA6
 bB/1lW3nk/387MLYDNKpYFvCi6twJxtpjw8xRz/IsnoGLNxcfgSQc4yH6NV9SewXaL5TgYn0biz
 GYbFCkoTgJgGlzNlUGWtpJu88K6Oo34SVivr1l7EBKOy2JynCJf6EVnk1xJb6uPoA+kv0lzgI/E
 L6myhOqIb6kepZNhbSVrHha7ZiXg2m3GczMcupWHP1RhG8tbwNS7ku7ExZn7w7x6tJM3woSV2r/
 jxJbNVqkdZusoQFYvTK7m7PwzZ81IULtxnzSj4seknLSbF4xk5OLgGQaKmXNMPeRBTwrX3W9Qc2
 1OC5zwk3emUykRWf0gg==
X-Authority-Analysis: v=2.4 cv=N6wk1m9B c=1 sm=1 tr=0 ts=694643e6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NdE2umm2-Z7CMbYs9IQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_01,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200050

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


